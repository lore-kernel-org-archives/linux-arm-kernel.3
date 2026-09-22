Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B94C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=; b=h4yuoNtvn8KKAmQ2GPi05WEhMf
	S+dHx2/tmZCsOoWHXOD7k5BqgjxVkujfxAO+zydwfeqpoI4Ns3RugpHU68ZKgoiJ1DZIYWwcLiLac
	SnbFEqq5AZH3kdrciK773HGT8K1NpKrbEYu0n1MFtabBxH8k3OUNYgfgDui6vCHlDK+c5TUrZ/PLE
	n5DjX84KDCxlorrwJHFL2pEjIEBYJdhB/BkKXW8Ea+OLlq5R7Oiqy6HlMzI3gWs7zlMpKeOPgOgoU
	X5oBEFKlnZnACeNCTLjsznzFHt0NweYy8+BiOAJVxdSI6PeICPGIIBRlAdynU/QS6qDzvAeCRQyH9
	VQZrbh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x998F-00000006gtl-04So;
	Tue, 22 Sep 2026 22:38:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x998C-00000006gtM-2Agb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:38:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI77DY1873652
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=; b=l2rd/8n+B47hSsLp
	dm9rKeJBloJJpWBYD9tTfVg5N4yZY3zxA2FdiNYnkn2Pdi87lB1r2vkiI6CIntcY
	biQPC3m8sZaHuOy7q40XCHL9Eu3dJhllRZVG1gkzMxduv4bmkRXqNqxjwd7NKhys
	3Rpp23gtahCeBn43yLdo/u9zoSqDZqDiOS5Ik187wrsvc9W47NQCEh0qUiMsp55k
	3Yx+arcyLIFHBbKIOoTtiZNno87NlNTaIbJU/9rLur+mUeXT+yxNW+sZA2VdfgCH
	aXxsrFn+XMTr0DD5H6dnQsmljDDhoIQnpYM1cJfupuhReouDDrKxqnQc7Xcl3ppU
	nmvQog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4uen8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:38:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso676249eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116711; x=1790721511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=AIlmEFHq5MwkuwVlTjI6ToWdY8NfKBqZMqPXgRBgX5dDlLCKsJw96/tKhrJ36Rx0Cr
         zXXfPv4tPDYjg9XDZ5SPCI7KwIdotvNAEzAd0fYLoIsqmB0KtwQG6Kwh+ovOzXW/gHUG
         Kq0aaej/RF/qpA8+jwly6Ll6l0cKVTcAjElksUpB6HdWji2YtPqZnDDBJruDHidCJEBg
         p55HOdm5nryrMN7LyySmYcHxBzomqIMZBw3QWtpE/XHVKK09vSCt4weEcydBbP3rbUyL
         ycaHgtEt2FcE8tR4y6GvEXU1s1bHH0jCnrDXAbvMZHdAYeXA2GYs2k44VkbTAJZUrK7M
         9H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116711; x=1790721511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJNsu2FLCP1qcNEgoJs+KWNxYkGyFkvDNQdnRnSNx7A=;
        b=SdCS+kG0TEUBWHxbIFRpg2pNYAhTyuyABrzgNtrOR2wQ71js0mGmo1bNoT1KpNg3Vd
         Jl5UuKoZiZuVjOIqNt5E36WzOwEeAQUXLBqSAS5pxfIjazzCtYb1t2iQ6O6bi3BwswcI
         7+T7cIand3CsZ4Mf20FTgarn1bGBcCDCtHCX5/XmYbjvaazznomswBAMQk+NmW+hZtsY
         ZOT4XikZnk6B8W5DRhC24jdR6PGHyng+Ue1T/gVpJHgkoHWUWeTfw0GwhgsPFr7dtaxv
         3DCHBTwwGhbwFKBjl8tj6ijy7rBDhud90MVTcVg/ddkYEppnWIqzRgDmDCgrTd0aflYA
         Oypg==
X-Forwarded-Encrypted: i=1; AKwUvByyOwUG6BZj/ZqkhyuCGvGb/uo9nroXQ8cAeZq3rROpssxOkyzq4VZZhDsdzXPV7cwX/E30ZNzMKa/TPNcc+BDp@lists.infradead.org
X-Gm-Message-State: AFuF++mW3g5KjzlHBzKLdiaDd0ow20CMygj5weVlu2qwjSQuQhnPu/xV
	OoQ27ziRA9afBK6jE8GcO4rjucOCNgqExdlnB3lCOZRuErJUlIaDwPHfFsHVLHriaz+E7BqjLG3
	n+W6GjpRA6UAx9PcPGtWf5V7y+xJAntSNoW0gBqx21kl79gxuciBx65qXkodIxTe14pIwNmZfE4
	+flKXtkO1zEQ==
X-Gm-Gg: AYBFou1Z2PKFsqq6osc+9C0wsqXMBFKlAfTY+4HVnCSFF9INmyzTYEONVRG7k4197rc
	EYhEWmMhMYfNb5UszYpa/2tJOnFaTMrIGcA4KU1Cpl0mi9P3u2CQXMQPOzMTa8OhE6l1Uj6y6Zf
	MzhfZz1nQazg+wmYeWPft8HlqVciRJS5VR6iXTjIRmn9u06xsbZxlON5lZHnkx2m2cu6OrpZMEC
	78E7ZfSgh7NBfm0rVT1YURsgG33G7km7OHhQdwP7kW5s4916xS4IvSHYmSbC15MN/w+YL8kuklq
	/gbtWn6TKm8f6a9novzZDqZooKTlrVxrELhqyxes4XV8zbYenEwab/dnXbUReVBOKBvKju8wFzh
	1S0fb2WlsbPP+S2YQF8ZyOGNvT/yqgYa3S5JmcHVFc/H3uOwLDZoqgg==
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710468eec.28.1790116711124;
        Tue, 22 Sep 2026 15:38:31 -0700 (PDT)
X-Received: by 2002:a05:693c:4187:10b0:338:5bf5:d005 with SMTP id 5a478bee46e88-33e8ddc7604mr710439eec.28.1790116710604;
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm1162630eec.25.2026.09.22.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:38:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:38:26 -0700
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
Subject: Re: [PATCH v19 10/20] KVM: arm64: Abstract out memory abort
 handling
Message-ID: <20260922153826.000044fb@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-11-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-11-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX3XSRJ2pUG/fV
 tXLdzmTGoPImSpD2VHqiRS3dR12zCk7fg7R0IoIR/3jb+A/2ruTU8+Q8/+jE/PVLUGNt9GGvMAj
 QkmqDLgkYO4ookjLS6AbDSR/oyJ5VaINbsFYTnInTIq18INzSnaNytyjZ8QB1cPTgbxeZlc9AGQ
 vkU3YtM9Lizv1sr11Mbg+0lOXB8pccTiRGCYncj10vQkszMUMSqLocJM3LwN043oFzU9NJl72yU
 PvK0bwvexNcjjbP2eO8OPXFW8coaokoZLzwFdBM9MHxv8hNjzCbb/bgioFJQZ+Kxycd3bbX8CRH
 zpLwjKNKJLT3KEWEVzcRXzA7IJ++Y4fMzdcOyYpE1bQP6rQEibziW/FTW52bnLAdQTgLFrRpU20
 wL02rUQkQ4XDasXQAKxv50CDR+K0a5qa+P86Am+pNj5SqNb7e/To5N5ux0b1ib1rIOc4/Jk8Ara
 s/0u3rZPr9O/zxGW8VQ==
X-Proofpoint-GUID: 0od1tKSrCAmYEbmGURMCAJ6NOFt23rb_
X-Proofpoint-ORIG-GUID: 0od1tKSrCAmYEbmGURMCAJ6NOFt23rb_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX4zn3uDysiUCm
 F1dUA20OmmqcyUPmnjILxtc5ko5TELjmFvFl/9Tsc4PO70ZUGNT6alKKMXrpMiZObT5iQdNcRM8
 2rcq2KpV3UekcgKY4sq2O1ejMj1ckas=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab30367 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=rbqOqaJmvRITx-_xyQwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_153832_571325_B595B257 
X-CRM114-Status: GOOD (  26.25  )
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

On Sun, 20 Sep 2026 22:28:35 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Move the memory abort handling under VM specific s2 operation.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial comment + request to follow through on adding the local
variable for kvm. I think the other places that can be used
survive the other changes in this patch set.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d97a4a1bca23f..cf293d09e940a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c


> +static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +	int ret;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +
> +	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +			!kvm_is_write_fault(vcpu) &&
> +			!kvm_vcpu_trap_is_exec_fault(vcpu));
> +
> +	if (kvm_slot_has_gmem(s2fd->memslot))
> +		ret = gmem_abort(s2fd);
> +	else
> +		ret = user_mem_abort(s2fd);
> +	return ret;

Personal preference but I'd just do
		return gmem_abort(s2fd);
	else
		return user_mem_abort(s2fd);

and save a couple of lines. I'd keep the else to make it clear it is
an either / or choice rather than an if something true one.

> +}
> +
>  /* Resolve the access fault by making the page young again. */
>  static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
>  {
> @@ -2287,6 +2303,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm_s2_trans nested_trans, *nested = NULL;
> +	struct kvm *kvm = vcpu->kvm;

If introducing this, also use it for the other places vcpu->kvm is used
in this function.  Separate patch though to keep down noise.
Looks like that's mostly to shorten the chain of dereferences in the
locks.


>  	unsigned long esr;
>  	phys_addr_t fault_ipa; /* The address we faulted on */
>  	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
> @@ -2448,19 +2465,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		.hva		= hva,
>  	};
>  
> -	if (kvm_vm_is_protected(vcpu->kvm)) {
> -		ret = pkvm_mem_abort(&s2fd);
> -	} else {
> -		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -				!write_fault &&
> -				!kvm_vcpu_trap_is_exec_fault(vcpu));
> -
> -		if (kvm_slot_has_gmem(memslot))
> -			ret = gmem_abort(&s2fd);
> -		else
> -			ret = user_mem_abort(&s2fd);
> -	}
> -
> +	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
>  	if (ret == 0)
>  		ret = 1;
>  out:



