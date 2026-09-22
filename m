Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51061C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=; b=VyYg0MHTb4RXMN5M+ge/hW7/gT
	peez/TU6Rmf1eIpAyANaMMkMnTXfUTuSkt/Sd7hMTq852v5WaKdwDvk+hLZbr9DiL/V0pEPoL8EVv
	p3MsjRCzaosA9DUd0byOVg7WmxDrSDovyYeDl2vPQyLgNlAZropJ4a/ulQJXaWP20wXfPZ6RDg+Mo
	6iBXZCi7iRvK8JELDGxoHFRU/PWo3eEuwJ0v+8+Uz/yBWTwvIK51zHYnnaumuEmokQt+Fe9wJ7iQ+
	EFLN1vIbNZktkIxBpeFfECFUN5aABzQ6/uwnvkYj+e2SIuY/+/eJ3cZ55UQYjHl5GXIls707NfRm4
	o4PQNIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98zQ-00000006g39-2CAT;
	Tue, 22 Sep 2026 22:29:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98zO-00000006g2b-1M55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:29:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDU0m1167811
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=; b=c6FIxJDzSdijI5PS
	sUyB8CJsU1gphs2rxSzit1qmionaLaYBBY1nMGxjoHQcTlAhStLkZQUwtO020Ybq
	krf3S02fGvuP56aEH8e2XoMnvafNwqF6Dq9Gd00NmkqJcTjYqTE6eh4qF1FrUj/3
	/u9IGtBP+VWMu5TyYAVp29uPG6suUK6CagJxGf/B0Xys4MowqJH7RVOL+BB7KvS+
	kVGpTxswAY5KUnV/vzi0hasGUtWm7cJipO4L75Ri1/wGSiuzMu8oCfWOXhqcX0xp
	f5rLquRaImhc3JAXWWxi1i9cFiX1IgSX0SIDOiJP+hN4GL2uT+kfU/tr6diVMFVp
	GZ2Zkg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0w42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:29:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32ab0911226so297629eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790116165; x=1790720965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=QXfBpwAabeTG7OViD2FbI80CJkyCxh8KS4FwG5dwngXKI2w4dvGeSHAAxoluXKzg2B
         +jaSxBc4VicKdCarnORoe4mMTuC5/qPBHt1becWiQLlY+HNSwjDQG6lfS9mkyfVwQUxJ
         tnh58KArpnqbUKuFWsahP1omse7YAiHw+duaCz+oDnG0YyGEM+okxQliWmBPl3sOtMvu
         PpcM1QdKuo8gribrGZMxYJ0yxTQVRzNXfhgYwGFqgkOfJOto+EnhN0oQU9WqAk3M97rA
         uUWqMgYANbRJhe681S/da4r3WCIElv8dTxbTwxASX/aC2bPeXGY7asnFhigRhsoVkU+x
         p+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116165; x=1790720965;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+w2R4Sw24z92+mWmBOXbaEBwTszL/ulokoyz0K44OU=;
        b=JY04bOo4c27WYpirYFO/6bQjFRNB05unzAuKf1gSyB9qMZdkeGcjIdkp4/Pv7QqkTj
         OVBG6hYUj7zzmI9puCsbnX+3y5huOXn/rUdKnsoekaX9HcbN5jhXZ0fYmEbTnRB/whWW
         vJzDyS+Tvt/2H1ITP9S1H9Nc1oHiOCqHA2AXrkxh5noXrL7VGtS875OwbkqUx+gWd9q0
         ckLJTReCV6VrlAcZt4OsTNIv6hf0G/NngzzF0Ka6IMpMBDa9XTVaMLCsixEpSl3MpmWw
         SYw0UIzgXZNlrYl0YX9XCRtg1c5VctUUXNV2WrHmgpGl/0RIxm31XIhziTOpCc8w2K/i
         iDEw==
X-Forwarded-Encrypted: i=1; AKwUvBw6IJXI+dy/HdsfzUKSgd2qPzv+SDLmrodUF7K+Yof4h1rgoOMgN9wJ1da2R2vi6/tePPz1I7BZBTQzYyPrMwYm@lists.infradead.org
X-Gm-Message-State: AFuF++mHe4nH9zzmPo17XrtfOwJDwXTtyz1OQfj0p0txqEJHG0aGeuBS
	AgkjcqRwn820mQzCEKT6uXRvXny4htpfm3zkCKB5pwFFbedHWRFxj3Umgistw9uuSqYWuZa2iDF
	G6aN87/w7Skd/rJnZ+lxaA/dzw6/2u9tYQgRqTk64qcjxr6ZIeB/23Kqq79tE/Sf9KST8N5ku/4
	Bxhg==
X-Gm-Gg: AYBFou36bNZc9OlCNvZZzMHfytUdZzzYFEhHgNyY052b0JxGrw3k/4AD9AJPlyEoo8O
	N/0xcYZWtQ92dXJzi1k2UfUQB+tcHeA9qF2kklZU7YzjbGNP8YN66jOJ41lKFKGNDOwUszm6H1w
	2cmDEpVSmszy8tg4MkY1H2Ipr7RIlAfWHpS/X2nZCetaYPmQFb3SOr8sH+vF4wti711XK/rXl3C
	iIdLriHZOrUUDqPRgf9h8RLuJcXotMXdDf3jgJS7cVILYle2EXEGpGZW7pTZi/9o81qDBTawuYs
	1cacPjR0D9dof28Ao/gvpFcYPxNhjMKLgOafH8o1j1B/7nPyOvSW5HKVUfM/NXIVjQhXaSUQs6C
	U51GiFEVV9P4nkOM84OAr1LaYVuE6PPwAoYRkL8lCb4y8rEgtPjeBMw==
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949962c88.13.1790116165051;
        Tue, 22 Sep 2026 15:29:25 -0700 (PDT)
X-Received: by 2002:a05:701b:4248:20b0:144:e259:b1f with SMTP id a92af1059eb24-144f8de7fafmr949922c88.13.1790116164404;
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98542c8sm1351499c88.8.2026.09.22.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:29:24 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:29:14 -0700
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
Message-ID: <20260922152914.00001221@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-10-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-10-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX6f6OATQj+EQC
 Zr2UpVpWaRxKNkLcGxiMj8BIi64vFabKIRKLxMumgQxoy48NjLZYK+180UqdPUdEH6HFn2QYYPO
 aQS9P2YMaKVhNJc2cF89MSdUFQeDnsG2cYrWDVl6plzapyslFB1pD+X4EYV2GUpXBZ+1shPqaZh
 Uamae6FNrLMkpE+4hEZ9Mfa2Kgu2nhCip/iJkzaQAGhnaRHutKP/87LKdMF2f7Uv4T5sYoHcgl5
 U9NL5WzspftuphpNfGoXAVRdUoaWOmEJe/QRG0usKLFP/gxa7yZbml3styySNq3QW9kG/Zg/hzq
 3hg50aUH56xGaylup7Ej0jNynxBOYqvZ+M2CuTxzfZ50Qi1bi7PmUlfQ9lfDHPninGKrfcfXkpt
 aMzCy9R2qvDl4gbBfHnRyv6H1D/p9eyGuhfvRuD4Dp8Yz+a0qYYcNUof1yfPTST1faxB3nF1zdZ
 cyTZGolRka9Z5zVGUUA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab30145 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-iJiB5zC6xgh5EJSZLsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: jcHltuVl8-c_wBa0rXcbJ5l69ox9fytv
X-Proofpoint-ORIG-GUID: jcHltuVl8-c_wBa0rXcbJ5l69ox9fytv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMiBTYWx0ZWRfX8OUYpcU0w5Gu
 /cypbXD0Lj/wpxFXvjvovpRu2TtTXH1SN6uckOBah5z7vexgw82kH3WEftFSODqYiu2Ituztdy2
 k9HIXOHEoi4SONJMM/e9ywj9MWKc8BU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_152926_390990_385DD4F7 
X-CRM114-Status: GOOD (  20.50  )
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

On Sun, 20 Sep 2026 22:28:34 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

A small suggestion inline that makes it explicit when there isn't
range operation and a full flush of tlb is needed.

I don't mind either way, but thought I'd mention it anyway in case
you hadn't already dismissed it.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 03f2017a7404a..d97a4a1bca23f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
>  
>  #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
>  

>  /**
>   * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>   * @kvm:	pointer to kvm structure.
> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   */
>  int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>  {
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> -	return 0;
> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +		return 1;

For consistency with other cases and because it looks nicer
blank line here.

> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>  }
>  
> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> -				      gfn_t gfn, u64 nr_pages)
> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> +					gfn_t gfn, u64 nr_pages)
> +{
> +	return pkvm_flush_remote_tlbs(kvm);

For the cases where there isn't a range call, perhaps you should just
not provide the op and have the wrapper fall back to
calling the 'flush all' variant if there is no range one available?

> +}



