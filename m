Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC919C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBQUzucMPHhE43vcKCEgSbYL6NQCAu/bzyKeHz+O5EA=; b=XRiqaUKeZE/IA+cfntM0yeVgWK
	oWwgmuAglpR7E/obs61NyBqqOWGzM1SvJ7wBv8NNXNuAe6DVBPvp2pjW9/NXZkyfkNX4xZpzddtCu
	6In1CAleYo1/1rsZbvJ/jmq4sjr19Aq88Xb23ZfOJfZ5kAX5owJgHAjQ0C3uUgBXIwKhZQIcwXQr1
	SyqaKMOXAQAqQVjLCDiS/10Z9rZWD5xsNvlTnwDtnTcUfYGPz3C3SANsMk3/O4a2sx0zIzuFOOWG4
	zgozm6o/X1AqyQ8RGJQn7/fZf3lZJPHwICUWBX8sjggphySWRi8Vwk4ego6O3jCZoAvoAutB9DtjT
	UCwIHY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QC6-00000008vkl-2iJg;
	Wed, 23 Sep 2026 16:51:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QBy-00000008vjg-18J4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:51:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTft63081857
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBQUzucMPHhE43vcKCEgSbYL6NQCAu/bzyKeHz+O5EA=; b=i9oRYKy3vL47wL3Z
	TQiRtvSmmPuInfzryvrI89KQN+dcSf+ocCQvznV+sZqK2iSvtcq7BXyS401jaGhT
	zcGov9ln9gi/I7/ZYoQ/0o8keNSHp6Urwj3f6RXjyJYxmyCUBVijSDP0+K5VDMNq
	rzDkITKd+6gVSxn5bpeWejr6OUPWFfTzlpnq9t4fxXp6UZuty8fwK9UrEXehmIZb
	XUbz5eza6OybsyPp9UvlDbrkxWrQ194e83mOMXXPU0lmFAgm0qGatu1o/9U3yyLm
	U++9FQu8kXv4higPKiI06eI6bFqf5wPHXQab6mqq91q/D4mDzOCDArwOW5GhxxVV
	4IfuUw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hxff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:51:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a74698972so963708b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790182293; x=1790787093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PBQUzucMPHhE43vcKCEgSbYL6NQCAu/bzyKeHz+O5EA=;
        b=YAewrIaRRepge/UexmSi+GuUIrCE8iSh1nj0MfbACwi87cR01CZllH9+qtew2NyU/F
         CbVonGJ02X+7FwFAvrUGa8x+cx79u25HojSVKWncgd3MWuGJ53lF/ZDzQCnnnPQJM2Dc
         65Iecx+2AnHsaIOTeDCABjC7AA+atgyXzyuMuD1yy5Bt4WW5/tHM78wwOegXF4gFpQgv
         qjGs3p2Ili1foVgG6hKzw7eJp46km09/ccknlC70XFYciEKDs1vCZsJhqKnzVztEzjgx
         l9j5/4qG7iLFp7SJttjJ9KTQlUx9YiJInTTBeyG2SJqGXXVY2km9UGER+/jv16IDT9pS
         j12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182293; x=1790787093;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBQUzucMPHhE43vcKCEgSbYL6NQCAu/bzyKeHz+O5EA=;
        b=Nh6rcN4R+AaNSUoMs7hWXevipNnaga/0K3xaqBNPHIrLHrFxl9DYrsise5iLCVb9nh
         NxiKfvkItH7+VobFOuckO6TS6zkcdXZTKonR8vJ52tabKYF6pOln4DLtYlrXm7LrZTs0
         4Wo9QunGDfjhGPBKSrGwtnHVF5E0BJU6ymkURGt9yCPDI6Q5s40idwOKS872f1Bf8f7Y
         +U42Hd/aIxF36kdXVCmOCKY8211PylKh+BgmF0TJX/0hToqAV/uFClqMKE4b4j8W1BQn
         GkpHO6yRw2kONzAe86fyCEc5bYC6wQdsLWKZNtq/HJNVOi+QzoyK8LTDukDKa9wY2BOa
         fosg==
X-Forwarded-Encrypted: i=1; AKwUvBzCvyfWtZxqW7MVpzNdvCem9WSp4V8/Zt9VxMUtzdqlR1IcV1uf/vUcNLYzSjS18sLtrDaoKV9sl3V6zBK4iU2C@lists.infradead.org
X-Gm-Message-State: AFuF++kfS2WMuvl92cfOtyGf2tfUfHZ1slBQ2V/8juN7BSyWZMmmvcXW
	7hGoUq+iWH1BYrqCNLnqUT01YeApWVDczLVfLnjCCpoB+RH75yXUxE69emSXVEhjJKj0noOY3cZ
	kirbtklYlOCNkHxVTizlIidE7qJeuoiQ8xLIwsCq2nUMca/Ejv1sHhRk+uV07l4hutawjr2vQ71
	2IMw==
X-Gm-Gg: AYBFou0NMTO7oL3D+RNqg0liqsIhdVECBmysPtXMfVz9s90RoBPHtS3hPZpIFyK+wOv
	MteBJUf8xofEj1TIiFxvr78+2mOZIfSxgVZ7YijxNyUEUawwAz/Aa4357dlFD8xiD+STV6vmr6H
	STjTMUrgU4JEB0Zjts2qRbLvhziI6QdgRqPlQYQ2aplso4kSoAufSW0HA+hZ5HLr2vVn5Wy7dOI
	mG6Og3I4neciquNrm5qXRsP/kdbxtvJC+FoAP422qIiD8QJ7ebHsjCyCs3dzsMjO9gI6enaE5/a
	Re0GExl6OYuNaniCLx7NUPILTxowZFC+coMkIXSlNaH8N6FdWWcte3OsUo9r3C1Rb5FajAj9+jr
	eQjBAPtQRgjYKK7cydBfQcMvVsn31TdV4HkYvI96YLLSbdeCK/EqRzg==
X-Received: by 2002:a05:6a00:3316:b0:874:705d:f648 with SMTP id d2e1a72fcca58-87d1c9ba6femr2832654b3a.42.1790182293098;
        Wed, 23 Sep 2026 09:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3316:b0:874:705d:f648 with SMTP id d2e1a72fcca58-87d1c9ba6femr2832601b3a.42.1790182292399;
        Wed, 23 Sep 2026 09:51:32 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbbfb5sm1725238b3a.18.2026.09.23.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:51:31 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:51:26 -0700
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
Message-ID: <20260923095126.0000241d@oss.qualcomm.com>
In-Reply-To: <fa2f4766-0795-464a-80ca-2f3fd1c5140b@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-2-suzuki.poulose@arm.com>
	<20260922122542.00006868@oss.qualcomm.com>
	<fa2f4766-0795-464a-80ca-2f3fd1c5140b@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i_R4Bk2i_P3YxoKbiS4bWujOnYP25-vF
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab40395 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=7RKtW5IRJYTtfXkaynwA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfX/JgAAvP1P2Xj
 NIrCgGohabjOqIy6RzsnFLmld8jfkcV6IMX5ft+sLoUhCQ4Owvq1NEJMzrh42gOF56kLsp+m4qG
 +KSINyV46lra8Oqa0e7YOkqEXCYRe+P3bwH6q32t0+eFpbG2bfHMGBeHw6S/EcXN5ld3Jqg6Sp6
 q83fNGGgnY8dWaquNUub/O2wgkvNvrwmccliRy4ecPeeY4SLRm4wasLbpj4gK0iQbS4WBe0k4vg
 LjzBkA21eVFp+Rn5UjEX9A3DlC14J7/Sz+LXvbhfyx6EYiTkE1BAQRi0+lZad9B/aq0qs4UlOLZ
 kTX1w7VBIto2pcE884nJTT3YSP0JINxawbQWQWiU+fvN7FIoG9Z6aEllgf4Rjjn50dqqEW/037j
 RZXHGduDct+8bhbvMIS+vc4amj5d2Ulj3lHOj8OL4wLw6T+24UB12VMVAzdMjtH2E9ttAzgV+UM
 DZeAzfpRAiO167L2R1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfXx8ltBiVpmpl2
 bzf7Q/LNhQ/h2QTGYsg9tPKUr4GsZDRE362dcu8yQwOroGgFYyxDkaJrRS+QWfZ/0tx11btl2Lt
 SgWAd+ExjGNoc05Ry5gj48CUgqqXQqM=
X-Proofpoint-GUID: i_R4Bk2i_P3YxoKbiS4bWujOnYP25-vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095134_379816_8531EAB2 
X-CRM114-Status: GOOD (  37.39  )
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

On Tue, 22 Sep 2026 23:04:42 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 22/09/2026 20:25, Jonathan Cameron wrote:
> > On Sun, 20 Sep 2026 22:28:26 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> > 
> > Hi Suzuki,
> >   
> >> Protected VMs doesn't allow setting offsets for virtual and phyiscal  
> > 
> > physical
> >   
> >> counters, as the offset is always fixed to 0. The VM ioclt is filtered  
> > 
> > ioctl
> >   
> >> out based on the cap. However we don't prevent the userspace from trying
> >> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> >> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> >>
> >> Fix this by always "fixing" the timer offsets to 0 and marking that the
> >> timer offset is set in the kvm->arch.flags at KVM init time for protected
> >> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
> >> any real effect. This was chosen over preventing the writes to these
> >> registers and returning -EPERM.  
> > 
> > Why?  I don't mind the decision but telling us what was chosen is something
> > we can see in the code - patch description should give us the stuff we
> > can't see.
> > 
> > One comment on the comment below.  
> >>
> >> Reported by Sashiko
> >>
> >> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> >> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> >> Suggested-by: Marc Zyngier <maz@kernel.org>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> >> ---
> >> Changes since v18:
> >>   - Retain NULL vm_offset for protected VMs to avoid host tampering with the
> >>     offset.
> >>   - Moved the flag setting into kvm_timer_init_vm(), where it should have been
> >>     in the first place
> >> ---
> >>   arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
> >>   1 file changed, 10 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> >> index 6ac3321f4c575..226cd5a495c8b 100644
> >> --- a/arch/arm64/kvm/arch_timer.c
> >> +++ b/arch/arm64/kvm/arch_timer.c
> >> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
> >>   		timer_context_init(vcpu, i);
> >>   
> >>   	/* Synchronize offsets across timers of a VM if not already provided */
> >> -	if (!vcpu_is_protected(vcpu) &&
> >> -	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> >> +	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> >>   		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
> >>   		timer_set_offset(vcpu_ptimer(vcpu), 0);
> >>   	}
> >> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
> >>   	 */
> >>   	for (int i = 0; i < NR_KVM_TIMERS; i++)
> >>   		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
> >> +
> >> +	/*
> >> +	 * Protected VMs don't allow any offset being set from userspace,
> >> +	 * either set via writes to the counters or using the dedicated  
> > This sentence confused me.  Second clause isn't obviously the ways that
> > are being blocked. Maybe shorten to:
> > 
> > 	Protected VMs don't allow the offset to be set from userspace,
> > 	whether via writes to the counters or the dedicated ioctl.  
> 
> LLM suggests:
> 
> 
>     * Protected VMs don't allow userspace to set counter offsets,
>     * either via counter register writes or the dedicated ioctl.

Hmm.  I'd not combine a negative with either.  Still good enough I think!
Our Booker prize may be a way off yet :)

> 
> Have updated the comment.
> 
> Cheers
> Suzuki
> 
> >   
> >> +	 * ioctl. Pretend the offset has already been set and rely on the
> >> +	 * default offset being 0.
> >> +	 */
> >> +	if (kvm_vm_is_protected(kvm))
> >> +		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
> >>   }
> >>   
> >>   void kvm_timer_cpu_up(void)  
> >   
> 


