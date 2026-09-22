Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A0EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=; b=PtyGPVAnCSwGBPqx0sc12MH9MS
	s6xhd+4n7DGeT+d3jsvZzByz0vSKEvwaFd6hLRjjxU+4/ySKETwRVcM/FXhpVPdVdTD0QhbPC/fsZ
	7Xc1sFtKpM4QKntHJ6Oa4/E75bKLcY6r4npPhxwberfn6oW/oBfqdl7RGPhCD1Zm4ryrvjAj/gud6
	C/AZIKNrK3FT26owGvzVMOhU3vjJ1pOQFSxyLY4SC6WjW1LouYwxeXc2TMDh1s8ZiuOotlH4wTcy1
	lIROxneq7Tc/gX+0tL6+Zi1+MpTyuybV80TF7Q/jtkHgxuVoK0deoFm7kuW+x3o0MeMKALWT2mdd/
	PoyFRS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x967l-00000006PKb-2YRP;
	Tue, 22 Sep 2026 19:25:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x967h-00000006PIM-34b2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:25:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73um1348892
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=; b=CbrcBypnVrO/fN+p
	CnXEsVZ6d9JTGpgRxJYCZkWWs7XrdTX3I3rFbDICopGo27Y9blozFkSFlYMAI3Rm
	pt+pa5m8ThJ0Dhp6hqxEJTUfTBbxHyHA/VDlbGsskz9u83yI4UMBBANB4DfZGDwf
	9CstNdBXE161t5jy06BnGL5uerZpZIHylqNk6EmwftpvsnkT6KIZwZlAgpXPCZ6N
	t9Tg9HmwaPw5q36tD5dkFbNWFOsOOUClaKAqc6n/DNVgWDpvxiuQSnvJ67n7Xsnf
	NWlCqM0E+561Lathorab64INAqC3bhnfN19mZq/P2as00f1nTWIYGXOYIEwLFI5T
	wdz0tw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux860gbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:25:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so171341eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790105147; x=1790709947; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=;
        b=LPariqX4b1TdW+ofhJ+8kVUfe3/i2ZkKZ26rKlYpGMsA6es+n9vUvROT6yjG8ubLJp
         obKQC+kxqqt1fG+WbgVOlIRmjouiLYakvUufhtVxtLPjL+mzD5uksAiRo70d+wdCFBri
         +h49uCIIAnh03Si0Po+tnnMm7d010NS3SrDsciCsb4J0l3gHz7wX+42hDLZppzuP8Ee6
         SJJ01eNT/odneloNeYrJdZWAoTX2KWWnDkSOhsH4eGy/snDB+EjeMS7vl7xQ1t7kn9rW
         nLzzLAN5Tylr9TBR6gDOqNvfXEwG0hvqF9ry4UWotnq8ErLZ+kGjckTz6LlNN2dj8psX
         FNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105147; x=1790709947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=;
        b=BEJZpZIIGa0ist1CEtg3Y4870TUxgsP9Gj7fBDOv+NAQ233arzRDSP5pgzSJTDX1Lf
         TBm/Z278VGrG0zaNFpE/i8HdIAHVIxT9ajDLbkKTJY5Rt5JOfWuMH/ykXWYB945HWeDH
         rSn4/DYyVWxC3NkPBUNH2JPWUt8TMOzeKC2lTJCZo6Qnhn/4JQ+JlHfJ+PSqEzNWwUKA
         r11kLh9tRxpwbY4zGZuHz9kLFZuBnCOJvJkADOtr8bjKWTGD/GJ/IG+stYx6aGMiFsVw
         buhRHj1Sh5wHU7kURLkGJMIohl3IsUFLqP+dEtfh379p67dw/wFfWqo4ubsMI62ntedT
         3I9g==
X-Forwarded-Encrypted: i=1; AKwUvBwDVvqY3+C19hsM8L+UFT/khAaHnFOPrJc6KSWJlIADtNiMD7LgrmRFCHBkP4Kdyt37RNZ3WtX4jMl3mnXZexWe@lists.infradead.org
X-Gm-Message-State: AFuF++mQGguNBFLuIrLy6t+gBzJVylimdFCEvGHIT4bFJR0vbZIj4d8v
	JgHyRFB1MnpuqbE1nf69yEeskVegWe2yqj2X/BX57xMQEmGOu7sIxaOwj2XVxi/gUed+7HDSANz
	OSY5ETTr5M+wgqt9bULpzLW0ZabJKTUe99nL5HS5zYtD8fGy6tpGUIFTBl1VpbZxcTElV4R/t8g
	GCFA==
X-Gm-Gg: AYBFou0eQoWc1exyhiDc14iIk4pJAz3hjMjufujEcVQTFtpP/rXhWABUZw8zOJ2Qksg
	EBygQJCng4chWiJo1Qc2RN0RTSMxSO2kvm4mF+q+M/bXmPDZYZD9aJdEUoP2fXph7miDjru6Vvb
	8wOLCIH7G26JmcMEH3FHXIe/hemZXbfU5WbPp2Do85HGBzLac9Sb/yO2jWQMMv5HtzHyc8KB9sz
	PY8gb1F3CxhHhyun7IiXolYMd4wiCqWPQuU4394fiJ7dMn+dgEBrEKsJCm4b0u9B2o5l0nGTIQM
	dQHOlTJslFJL6MHUXR9QDYkj2NBWXMgz9g67DUJ92hlSfT9JYHko5RYACs4z6J1DBCq5qyNet4X
	+C6B7fLbNjPG4VOGvwBTMC7woFpMFjDzsIWzC8DOVhdiuOMc71D27kg==
X-Received: by 2002:a05:7300:fb0a:b0:339:66ff:51b3 with SMTP id 5a478bee46e88-33e8e2b67b8mr229590eec.37.1790105147386;
        Tue, 22 Sep 2026 12:25:47 -0700 (PDT)
X-Received: by 2002:a05:7300:fb0a:b0:339:66ff:51b3 with SMTP id 5a478bee46e88-33e8e2b67b8mr229545eec.37.1790105146727;
        Tue, 22 Sep 2026 12:25:46 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm357539eec.26.2026.09.22.12.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:25:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:25:42 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes
 to CNTVCT_EL0/CNTPCT_EL0
Message-ID: <20260922122542.00006868@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-2-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-2-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _5wXfiPHhlOlan7CceO-I3WEv2MXafrA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4NSBTYWx0ZWRfX0iPdExNph95e
 hmyqOZKg79o5dAQur62xSVaj1OfkqMY43y9voCCfQSQWhiRE2Gdwaekh6o8vPppPWRK9NWnACiH
 PFUzt3aWjXsZ4K4LUriXQ8ZXsXOqyQ8=
X-Proofpoint-ORIG-GUID: _5wXfiPHhlOlan7CceO-I3WEv2MXafrA
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2d63c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=wrk9ooTvwJDonXvhXhMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4NSBTYWx0ZWRfXye4BrBWg81GI
 vhb/OY5v0qZVAw6Y7kFAqPyS+wSbJ4aQuYKaKT/sDyePV01hqxQM6LGuFnYudTxs+OLhUHMppeB
 RQUZRHJlYJc0MGhIwCaal/xkGo/w1O5GVYm8QN/MpZsiUR5MP9uQFqm3JJXB+6cSr1zWfvX0CiQ
 5PkDj6MZ1Yh0RFHqqjX3gLul5U83Xulqpl1u8olYsU0gS4cSXoDM2Vr+Z+TZuBaFyd2bGf9sBHk
 5ZiFKHlB4QpOD5HshgyTDCYZxFGSVPizq7LbgrLc9uVryaHs+9viw0lBhBUxuTnfrVmx+Uz9ql5
 bGuTntv+ji8Fc+SMxL8N0YNPtynxkpHEzg6DOjCuR8LZtOcF2wYZBSRg3rdm32t3HHxbc9un3n7
 pr61t+72Kg7xHVloJV1YyttabOZASCVI4Qzj3zkVjzb9lmg4UDVYp5TcvWVPnnJRSueIsuLE1i2
 JdFwYrv3Tl0AD1RuVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_122549_899965_FC01CFE0 
X-CRM114-Status: GOOD (  31.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, 20 Sep 2026 22:28:26 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

Hi Suzuki,

> Protected VMs doesn't allow setting offsets for virtual and phyiscal

physical

> counters, as the offset is always fixed to 0. The VM ioclt is filtered

ioctl

> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> 
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This was chosen over preventing the writes to these
> registers and returning -EPERM.

Why?  I don't mind the decision but telling us what was chosen is something
we can see in the code - patch description should give us the stuff we
can't see.

One comment on the comment below.  
> 
> Reported by Sashiko
> 
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>  - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>    offset.
>  - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>    in the first place
> ---
>  arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 6ac3321f4c575..226cd5a495c8b 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>  		timer_context_init(vcpu, i);
>  
>  	/* Synchronize offsets across timers of a VM if not already provided */
> -	if (!vcpu_is_protected(vcpu) &&
> -	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> +	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>  		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>  		timer_set_offset(vcpu_ptimer(vcpu), 0);
>  	}
> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
>  	 */
>  	for (int i = 0; i < NR_KVM_TIMERS; i++)
>  		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
> +
> +	/*
> +	 * Protected VMs don't allow any offset being set from userspace,
> +	 * either set via writes to the counters or using the dedicated
This sentence confused me.  Second clause isn't obviously the ways that
are being blocked. Maybe shorten to:

	Protected VMs don't allow the offset to be set from userspace,
	whether via writes to the counters or the dedicated ioctl.

> +	 * ioctl. Pretend the offset has already been set and rely on the
> +	 * default offset being 0.
> +	 */
> +	if (kvm_vm_is_protected(kvm))
> +		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
>  }
>  
>  void kvm_timer_cpu_up(void)


