Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08C2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=; b=gR7DFVk9xCOPjcAEMrymAT5kJY
	d/RI8gKGC9do7ozB7H/1ZwmWYqMItiYV/JJF0mv2djD7fMFH8kgCkgg+OwR1kMm0DIUq1T19sP2zS
	Ul1fQ53S9wg6yY9AebjEXnfVboLwJ84gr1mn/dF1E+/+THqDGt1JN1cHbiO8/6X4335gpn5MqSMsc
	/CaAO1NaIa+swLCu9Q29yPll7Dj4x/e0UIuph7wSLhFc1oCi0bocQoCrl7ezazzdjb+S4Vb3qWiDe
	yDbUobpCd/FI8Z6gtHw2tgVmMUHUz0+Ja+cC8GB9SOydfR2WpPVW0O7cedolxFKo3cFF69+hYONJo
	AsTu9TLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96cM-00000006TB9-3vtx;
	Tue, 22 Sep 2026 19:57:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96cL-00000006TAk-0jhq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:57:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJCwM71166709
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=; b=d0uPXZoHzbyscvk9
	Fui+SId+pi+/38DYBmJ4SUmJj3TBIOl02UaIYHzThs7bokVlSzJZkfGbSRFsL68/
	cZ/uP/7WOGeXAlcTU4vmV+HflDvNyN5Z0fnAcM7nU/XcvaTETkXOUSJ2f1ZojAc4
	0zLDZ8ltivPnVLqpPWKKeqfPg3JacgZQKAOB6RcwGV524NRBSIUWLShhBgtt/L5r
	7FvnTgzpCnyqgX+bp9PyoWBEh/mB7BrjGXjBo4j1BWeuUZUdClE0HfyiaD9y3FRZ
	4UMgUMuzREVwjn8607kyf0+UyBgezQRsBNMpLq9Jd/sUhd3kjkArdqLJu7ivd9Kp
	BNfMeA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw07d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:57:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so245536c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790107047; x=1790711847; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=Xc5KTx5IhfxkqqumP9VuRN2WnYfL2a7z6HIej5lFpJc0dF4d9RFgeFkisD/rNgXUaQ
         RYyXoLh9jq+0xXinwK99zqxGfVbYPsSLWL/ylzYa1pnKZGk5jAjKaYioM0UipOe7wMRG
         Tk00gJdcZgMzwS0FiLxM5Ftgy6wAcmgcexJ3ZaxNb/X5+RMQzFEJj5mt140zVHMyfo0S
         z19aYEMI0LizYAB06WqsRcWiIiIus/cS2/SmFLZeyRka9Jh4A2Ax+exz49p2hmjydWxz
         ZVsNk82b3vSAvmO0RTtwFg2/WMY8JneGYpDXssOJfkj/wNF76K0stRthAJAuCmuiyeHN
         hpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107047; x=1790711847;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kCerQCZAd/icfcStrsOSRarPahcPdmJx1Sv0aBlf8A=;
        b=uiXjnxkAdGemkCJ2cOcdqfYNzOq61zRVj1zaYyhji51WBrbYu5XgI58Can4ys/3Cd2
         26M3/5p4kY3JkU8fcOweb+lyv0tFUJFlmGID+/8xeyc2yapk/L6CfWEv8wUDedDyJ/I/
         deTunkmXC/74istgCaAjHg3sDVcKg+XhGE9CrSL+Xf/Iv8Js0CmZPBRclxcKYllZum/k
         Dxm/ID5oVYiocMoKy/ndHcHcipl0dAgX76yTXnZmnQbQmCHSuJdcz+3tEV6BzBaWrCd3
         NvYbEk4RjsRg7MjLloJD3a4CHgkRRyYbCOezWnqjy+bN16Wz3IDNZ1wyMX6NQtN8veqK
         lDrQ==
X-Forwarded-Encrypted: i=1; AKwUvBylt1shDnCdHgsNGD5icwTIYz/tgf8BzE6LeX8/r/VO6lu6CTyJsgGqAq2RrF2I5StRDb80lRKeri9Y2LXRkV1j@lists.infradead.org
X-Gm-Message-State: AFuF++nvZj/DPn//Di36FVZLCso9aLNbxyzZIzq3THoxaBD8Q0Nkr2P1
	QeLbIMkh4asW4uKQBkOtldhntGB9RTjDCR5pcRnnjXvEqs9dovdmA4WpyxJ24oOGwkQf9eeUXHn
	4pXzcCp7pCfNK/Ptn/oNnIvmqdO4bkK8lVwUoBzZxbyVg0edlS+C6PFfKx+3gXmyy+fFmAL4AQ7
	Pb9w==
X-Gm-Gg: AYBFou0SZA34pB1veaijSegTNerA2dUPymg2VB1t4Ep9Ef/6OjZPHbRLeHLgJWKCZXG
	w6YWASHRF0UTZbVdKkWRlD1Sxp/LHXbjk0LhyLg2NFTisPgZD9qcZT/mCmtkF/XeXWjt6l5FYYd
	+t1k5oaAeAKTyufkbScKXxsnhFKeB1Uywow4ta3BRjDuMbnwo8ZQmH5bYHl3flqyHeU+52eqmWZ
	FA+OyisUzL8KgNi39rpvGhKDZZBnox6qXscGfbhiHUVx8LAAyfxxq/JMPv5tu9tT1KPGMDXABfs
	54E+RxntmkYmuawEU/FLlxAfsM3SdV24+zRxDeg8mQ5/dJYF1P0o7m8atAE6TUAsg7QOcfkmYA0
	+riOtWjoilsslrRfst+h6kcM6ORkvJ3mpZOuAjA4Q29Bpaf+zwBVTIQ==
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551666c88.10.1790107046948;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
X-Received: by 2002:a05:7022:1582:b0:144:dfc1:9aa with SMTP id a92af1059eb24-144f91372a3mr551637c88.10.1790107046436;
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm448771eec.11.2026.09.22.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:57:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:57:22 -0700
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
Subject: Re: [PATCH v19 06/20] KVM: arm64: Refactor the vcpu_load to allow
 for VM specific callbacks
Message-ID: <20260922125722.00006b2e@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-7-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-7-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5MSBTYWx0ZWRfXxpfNBth3T970
 BMyEVq/PjXXQyPEbkuvRDVN8gBqlq950gu4pL+OEEJCKgdBuPQfC+JKoez2inBaPVx3Bw1zD7eQ
 Ils+FjRZBT03/Y5wuuuAW/YqE65iCZwIEToL9BElD6exnCGpE5R3RuY/1xkj0bLztlvfcxxWyOF
 NFv4q8F17rEVm0iZbD27yOROyKLoLPydWd6xS35TSf5SFPyu10HEZmaZoY40+LfUHGgY+s5qx5E
 CpsK0NX4b6TF/4GzhdX23ETjKkzuUEnfpdfGS4TD13qInaOEC+4RLFqfEm0Kbe5vilJaHnl0hUU
 I2qdKwTdBBEGq5RVMY50VaOF/n9Uwo6hoifYvP6wBdDTC57W6IXcabZzBKMHcXOcdhudcYR/fda
 oRIeHPyeSCWodKjaoV7o5f4x+iaZJ1yqTQQ/Yq/TKcbNsKnfHCmM0QqmtoRtiJPcgFqVjlMHhu/
 h1BNNdJUbsz7/OYcqbg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2dda7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=X9DOVUd_aP98ggfEJksA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: PH1UxtkDEkMnXOSeG1XpNwWy249k1-aW
X-Proofpoint-ORIG-GUID: PH1UxtkDEkMnXOSeG1XpNwWy249k1-aW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5MSBTYWx0ZWRfX9a+Hku9F2ifn
 C4ZiOOIEpdPoTfyikwyG5vJhoTyUJjmcFBsyyZd3MKl8sTy2M94NDkVp7wEMT0eJrAxrvuoTxjJ
 7sXirQF1lWzmwrYwPOJnfkhtSoDC7CA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_125729_261309_DFF93F8C 
X-CRM114-Status: GOOD (  23.05  )
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

On Sun, 20 Sep 2026 22:28:31 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> To keep the VCPU load/put handling cleaner with the different kinds of VM
> types, we are about to introduce VM specific callbacks to do just the right
> thing. In preparation for that, make some refactoring to add the change
> easier.
> 
> No functional changes intended. Based on a work by Marc Zyngier.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial stuff inline + maybe one blob that should be in previous patch?


> ---
>  arch/arm64/kvm/arm.c | 48 ++++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8c784b266a8e8..c74706ed9a531 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +
> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_should_clear_twe(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWE;
> +
> +	if (kvm_vcpu_should_clear_twi(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWI;

You could use FIELD_MODIFY() for these but maybe not worth it.

> +}
> +
> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +}
> 
> @@ -772,7 +782,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>  
>  		/* __pkvm_vcpu_put implies a sync of the state */
> -		if (!kvm_vm_is_protected(vcpu->kvm))
> +		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
>  			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);

Why in this patch?

>  	}
>  


