Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=; b=Ad13wcSBILUuxw5JL5i+5FbvLI
	X+0gLjp8h9sv/B41S2Zy4L8Kaf8q39bTEk5cyCN8b7wNPopeCKdcT2FGiFH8FzfGvVTlyfSQPK75J
	fbZOg2lrdzwfPCxed5u4iakbf9ghPWqGjuTAqlsJIiq66/zvimqLwYfyunYkKj3/uP9x5gTZKYKm2
	JNP3Dx4EVeimP1RNCAnDLSVT7Igi/pzvO8keevI3NGDzprCVxsE+nWXpEwpFGZgK9OkLzxCbtNS/w
	3bGL8sesGe7cqVvIzIH/PZxzPjU9QdYwyrVz0khHCFuRrvkyQocmT+3cowsZr76cKlGJ8EpTuci3o
	6o3J9Xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QFA-00000008wBj-3Z5O;
	Wed, 23 Sep 2026 16:54:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QF8-00000008wAo-2sbl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:54:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTa5s740285
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=; b=Seum9zPqFF1bAFs9
	2SAgWuOtEzV4WMAmZskMjMP9xFgcocCq5t/P4Btc3uXm/yPP+5dFmh5MvrsC6Woe
	cL0t9T8Uk0hJD7dxIFSFHKlwoz8kF0IlCF4G+vCAYHnQ5iI/2KTdeJcGSx2awi+g
	zRh0sCoZKCovDiw8hhNMIlveeyEBS1Vj1OLdNgsBWkZcIG4Bx1Im5Y0tYnE2BZgY
	80heXHTTt8VxnPYBz3mzkSgrfEctt7TgufuAh5IddJeFRDHIZOHddDlWhucY9Wj/
	WeQF9cQwlA6a6DWFbbrnt6l8QhQDXPVALVsLhoBblQDFI7hp0SxbGW7fL6jVBLnP
	KHIFfw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsh08v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:54:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so685429a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790182489; x=1790787289; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=;
        b=TgfH5TBmqglc/PJMzUmy8/mtddSt5AtIYk3wHRdjP1KIl8vvAzijFYTGPAnnaNbaJo
         6ID5nAkeJS93DIUqLTxZdxRZEQrhNARP+dcvWGb/oa5vq3eYAREc9TZQPCuDQIknPOUt
         sZeo/Dg1+e7Y/Zk7GzFS4JI0XN+giDWVlfTV0nO3VE1Zjnm2rj9b2pBvwIb4HTUBNbou
         UN3VDIAg3oIID11u2rAHDXAdAOInQZDRDuAJuJAwqQscgY4og+PR0Q0jAdVD7IcVLILI
         VbtxE2FLOqQ4AAJmQ68qY1Ws6i6L5Ps4Or96kyiggqiIb7ypFBXZWTOkBbmxDiAHgXa6
         5ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182489; x=1790787289;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=;
        b=Nodq6DR3rMJzzj1usiig1P6zY8Jdy7Zx3T9smO2fQiO5YE8MTsUZChhbxoc4Prmcze
         nt07c4HuTgWhfcl19RBhNXQM3lzwciy9MBN+K1Q8cN/ESQNECLzvFZqoVhwV7vNJk3m7
         YAbUw6MmswbgA5rj+xWGU/Tuy1rdVswosdgPqm8Kezc6wv4STDZxjsLoJ9EK9vAtkfvk
         0mER5128xaY82FuQEyJqCKpgfGiATxtNXenSJZhUHvjr5O0h+EoDO1db3OB2vJQTX4c/
         3zVkJm3eKypx9v1peZYeho5HnyzKalyKPJ5JxyGpXuICcncHhiAMfqWDl8FXBc/qa3Jz
         JQwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2vNwh2HQ8k5lfdgH9vLCxO68EGnL+Lv0UIuSR/JlGaBgS3jvZRXTlF27YbEhM3NZ6GW+DcnE2zDu0O0L3t2Y2@lists.infradead.org
X-Gm-Message-State: AFuF++ml8bnFPKvkMET9yCIKBfvQFlVShp084eImkk0zEzROQ/TPw+FV
	cz3/+u+ud08d7LIIx2A0hogZUGnCV8H9QW1RQRjsUx7v1N/ZyvDIQOE9DcJ9PJMMf9BJdzXEPA+
	A3NCT19tVOhKaP3zbh4wiMC9hLJuPtfFgerGjN2WW9Q9MZ26NVEFJDuNOLPWKmW5T/HnfU2MzUN
	cvlQ==
X-Gm-Gg: AYBFou2l1LtYhR9PSV1/udxCTqGuyzVLlbicO/WvBlFbGxEsrQhxF0Tbh7M1QLAXKie
	zYD0bpTxUmiY6+LFW+s6oW2mEE7bW7bRZFkGCc4BSk9N77yKHcSLmWMq7tFY6D0GoswRh23GAOK
	e/EiiUwyMKYPzMfTBG1kfuWnVW5Hv6X9GcXjQQ8uzXSIBu7Ni9y/82EwTmmI8qPY8IW3r8cDFz4
	kRzpiW+vkgORbAABaEUdMcuc4N9qQcdvfEMrWLRwfC6MDKvkbLziaBb0RCCNi9RxgqaYTwbgzB4
	6BvkM03qqEN9D28Jbt8Jf1BlkrmnE4obGA/q/2D8Iv7x6M61U1YOjLy+aBULm49gzaL9QVQasK4
	Um+BNt03NJvpR4VxBQRl5wgYgpp++hR1osyrMK+DSyC0+5B8UOlnEQWNgbqE3pOR+2g==
X-Received: by 2002:a17:902:f549:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2df69d261dfmr29630385ad.7.1790182489375;
        Wed, 23 Sep 2026 09:54:49 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2df69d261dfmr29630075ad.7.1790182488834;
        Wed, 23 Sep 2026 09:54:48 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f4219sm14535985ad.68.2026.09.23.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:54:48 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:54:43 -0700
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
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2
 MMU operations
Message-ID: <20260923095443.0000378c@oss.qualcomm.com>
In-Reply-To: <0d5201f0-359e-4748-92da-946dedf51bcf@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-10-suzuki.poulose@arm.com>
	<20260922152914.00001221@oss.qualcomm.com>
	<0d5201f0-359e-4748-92da-946dedf51bcf@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfX2XJ18e1RCfA5
 bhek4Ninw87oESBfayZ9sIRII6iPGEWrWuD6XXR6VSxueh0i7uaeXg3R2faINwOwacOmw6KJ7gC
 UdHz8+SEqNlVs70qBFtbaEq9kn+wS3S2vRu3gAHX4RDktE6DC1dCw+R+LOluCh5HP82n+S3Tw62
 EPMrcOPX5Rw8AkYUl1tiikJNZ0RFkPdS5fvK5I8DsoqRSG8B2zfl6xQZDCdwdK/E01mpaRC+0x8
 KFXnobBN1Q90PRBReBbiVfRy2I563wpwWw2Kx2dflbUH8kyTNpDGw1SgUc/bn6nwWD7KonoQI6I
 hAqJIu4MScHw9tukUw/qX6CpqVUV/C/r+9iDVdk7VWFcd9KORblCGL78aM9ewxPFraomXnWH4bJ
 y5NHW9hoUnlsuigupj+8RwR/sUJamCzR3nKqk/FTOhm9i82v7AfjU5YVDAk4ARgb56r+8LsFYyQ
 NRdgziP2Utbph1d1mug==
X-Proofpoint-GUID: FK2j_rw7BGpOhfonsCVLA12yeT2qBewi
X-Proofpoint-ORIG-GUID: FK2j_rw7BGpOhfonsCVLA12yeT2qBewi
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab4045a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=OqzaOk1-375Rtnrp2FUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfX8CnF72FqqD3O
 /7F6HdCck3RBcyYm8MyWDoSYnufxBoNoZSvYtwUp2aqZK4L5IFa2HNpp5Q5rftw8dzI9KdBrWP0
 6FHPEZnfaDuR+zs99YMWK5BKrP3oEDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095450_754766_23FB95AC 
X-CRM114-Status: GOOD (  28.75  )
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

On Wed, 23 Sep 2026 00:21:58 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 22/09/2026 23:29, Jonathan Cameron wrote:
> > On Sun, 20 Sep 2026 22:28:34 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >   
> >> Add VM type specific S2 MMU operation backends which can be initialized per
> >> VM flavor, to keep the handling cleaner.
> >>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>  
> > 
> > A small suggestion inline that makes it explicit when there isn't
> > range operation and a full flush of tlb is needed.
> > 
> > I don't mind either way, but thought I'd mention it anyway in case
> > you hadn't already dismissed it.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > 
> >   
> >> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> >> index 03f2017a7404a..d97a4a1bca23f 100644
> >> --- a/arch/arm64/kvm/mmu.c
> >> +++ b/arch/arm64/kvm/mmu.c
> >> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
> >>   
> >>   #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
> >>     
> >   
> >>   /**
> >>    * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> >>    * @kvm:	pointer to kvm structure.
> >> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
> >>    */
> >>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> >>   {
> >> -	if (is_protected_kvm_enabled())
> >> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> >> -	else
> >> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> >> -	return 0;
> >> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> >> +		return 1;  
> > 
> > For consistency with other cases and because it looks nicer
> > blank line here.  
> 
> Ack
> 
> >   
> >> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
> >>   }
> >>   
> >> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> >> -				      gfn_t gfn, u64 nr_pages)
> >> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> >> +					gfn_t gfn, u64 nr_pages)
> >> +{
> >> +	return pkvm_flush_remote_tlbs(kvm);  
> > 
> > For the cases where there isn't a range call, perhaps you should just
> > not provide the op and have the wrapper fall back to
> > calling the 'flush all' variant if there is no range one available?  
> 
> The core KVM falls back to flushing all TLBs if the range one
> returns true anyways. So, I would leave it as it is.

That sounds like a reason to stub them to return true always rather
than call the flush all so we don't have fallbacks added at two
layers of the stack?

> 
> Cheers
> Suzuki
> 
> 
> >   
> >> +}  
> > 
> >   
> 


