Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D45BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isSEF0IU9c1OXuHxBNGq9pSATtA3AQIYhgVBzOHtvqs=; b=zvuXsxhfSXzGZBtBLincX96NPs
	3QQC1ciVFBXulcTB+x2mTLFeAvVEXRl3BhN+IAuyr5cQVsmlvzUmfev6SKqAo9PoM8Tkpgjbt0qXx
	w3396/XwYcbDNKvTrGHVfkk41ehHFQOh59bASHhwph9cZEErFs2pY5i5noL5tyfT5eenk24HrC1J7
	5pS7kIIwD/pADXGBL5AIQjilaORO1Z5DGcJB3PprSznpjKagbH4K+MkZI2MSMmewVrgttBG7SKInM
	HuFDestm8jnCfFshC5MD+g1OpsUSmYlPAKOJQvOx/kxc20fUqOkH1jMxgec7aW7d1eppsq/rQeyj3
	6PE2af9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96M8-00000006Qyi-2gn0;
	Tue, 22 Sep 2026 19:40:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96M5-00000006Qxr-3hFc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:40:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74he1348898
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isSEF0IU9c1OXuHxBNGq9pSATtA3AQIYhgVBzOHtvqs=; b=MCpZrl2XliLUV5m+
	AwX/zkHOD/sII1crCEGtG2U/jgpLCl9R5xl7SrsC9BMPS8yupRZaRWKjoSPcfPr1
	G+zk8nVeK5HU3gGbbimKtGhjfcB7JoInF0tNJb+6FNetlQpNQBt5qKW7rHavrjBQ
	kng7Ib17Sxzb4DCO4X0lKQv7HIR0DRlKG41W9jQGC1kpLBZfLxU36+a0/t6N+XvA
	kx3fALA9mTbiRnv0fp89c0relqYJ1KxDBP1EpWE4H4FCFMukDUHfMMSyo/UcI5jZ
	ylDWRa5BwwCWg2GQvwmoLWMtT+zUqPbUTBsfFLPwAt3NMJG1jsSw6iLmigngpwMP
	wU2fSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux860mt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:40:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33310847fcaso232660eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790106040; x=1790710840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isSEF0IU9c1OXuHxBNGq9pSATtA3AQIYhgVBzOHtvqs=;
        b=P8DCYJTRU/eGPU6q1Xg4DYI71k8rvrvQyZFGnjcEQNN0Zqjgt5/jdDvj2otMJlJKZd
         TnBquJlAo0GAsmK6fWp5cOIpNtmlkiQUCgY+pFx1IRpIpb+Ch09rL094OnpBiFQjYbjL
         dHob/8J1D9rpnN9jwS+XQtacmvdSh1grOTU3gZUa+VJnYWCkbEsp/dp8wKWdtCa95vVQ
         BvvIw3lL35/cihq9MCvJtgGUPNzLYbz9/vH7R4RqYbPvCGJT9LxBYf53/h0GLs/+bqLq
         xLIR6dzQzVSrDpD3qOdxzQ/CknLBFu2CjDkOUSzTaivVUmiShj34xhid/a/FpUqPV7i+
         s13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106040; x=1790710840;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isSEF0IU9c1OXuHxBNGq9pSATtA3AQIYhgVBzOHtvqs=;
        b=DEBXMuyWSlORV3kzegOQz/Q3uo72w5Jh470B7msRmURhSvl1xxxeoN63HGDKdI6372
         VKBHuWJBGH0Ob4wY6+eyuGnbT3CwoznWzf+MLmucnisoGtRHY+R2IX/4adLU+YjSu62t
         1r2uQPRo4+muygE2M8lCgWZXS8huwP4i1HIkQk4t9ksHH89INOjbZYsH/Stmfyl5ynhA
         Z8WSrUTtcj7xrqldIBm+5fhiR0xcsyKeXff/RErrlD/mQlJbCg/G57+gdBIudGiNjSnJ
         cZKweqEDu3yZZd5vulurIjVin4xmJprLPzRMCdZJm1BMIvRyCWt0pAFX5h4C2BwDag2C
         Rd8w==
X-Forwarded-Encrypted: i=1; AKwUvBzJVd8Ow4MjZRfhawp5XfeR0yaAwclQjKtDvw/9lz/mgPfxMH2y/ixsLroKxlCyeXwX/JvjSE/E39lZAX8P/Eo/@lists.infradead.org
X-Gm-Message-State: AFuF++l08OGteJTEZsf/y9ui5PDaJewWZlyTVD/Ok2u3cNSAYavij6iN
	HF183qg7Yge5ZJ2S/r3R5EYOAtFYpc9B/Zj9RCt15aucJRnMAZVj1MvUblu/EpbYG9EdpmAFF0N
	LGEyr+YaPfDTnvaEG9/SchGV/DS0kGy2VcT4+JAiVRmYVLpsYOq71MXbvUlMCusAREcPEj3tsxY
	lgFw==
X-Gm-Gg: AYBFou0MiIgh/P3g05NxhWSb6Pg+qdE3ibn2yO85p9KhyNYidDZgkV37fNNEHiftxl7
	d11/+vmFVas3K3lDzV/szp9m51Bb6t3j6bCFedKapABYZGY304FhxF94/3bRt0xJAu5ZPvnBogw
	w81oeik+O61oAye/A+KuReNmWlFzav4AyvpSzKlKOznfcJ8OvJC10QDihr0z2hC0ytvitlAoG5/
	ouviqtfW731rDLPs+Q+QFDKLNV0zPMNQRvPaiTq6r4WyLGeVQJlC8+ifdjxGbHFJwmDc0L5TKLj
	TVgQB4426TjFlenrv8jaNqdK3E6qVSYVYxYd9GdVvW9cH4OcUC2kRgXucqS4a8g7f2TVcS8OJ5X
	be85Cgopjibp7mKOycYEAbiwRjpt5JaKHUHUpq6Xg8SwbUrRee4GyyA==
X-Received: by 2002:a05:693c:83c3:10b0:33b:e842:c0ff with SMTP id 5a478bee46e88-33e88b2f9cemr356558eec.0.1790106039634;
        Tue, 22 Sep 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a05:693c:83c3:10b0:33b:e842:c0ff with SMTP id 5a478bee46e88-33e88b2f9cemr356508eec.0.1790106038976;
        Tue, 22 Sep 2026 12:40:38 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c63bsm412187eec.10.2026.09.22.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:40:38 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:40:33 -0700
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
Subject: Re: [PATCH v19 05/20] KVM: arm64: Track the type of VM in kvm_arch
Message-ID: <20260922123928.0000443e@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-6-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-6-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q8d7jNeIesDom7yntHcD6iitnD-MUKCu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4OCBTYWx0ZWRfX/RcWPXoKszWs
 LoW52OHtcR6BlvuyXxCu2QQMIVuvwdvHJCFBiSQ7RIDOp5ScoVSJpXpBobTw1vCtgXmA1J80rRS
 skOSTo8lVPmyP+9anQnmPZxBwH0ufN0=
X-Proofpoint-ORIG-GUID: Q8d7jNeIesDom7yntHcD6iitnD-MUKCu
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2d9b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rj_uqbnfv5dchc8eNrcA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4OCBTYWx0ZWRfX7vbOWUAZo5oP
 Adsxr4M9NI9v7rEmCk+hn7eHZyiW7rhyiUA6ww0rcSfR7ptik5/jn5wqZg/JbLAtJEPp3VofqpA
 5FUfwLiYi9pPRvciDXfvTByo3lzGF5Sy39PamVhd0iSQaYj7kBCpNv2/omW4YlV4gXPhfz+s7HB
 JJrLQrFtEZ3TC3LU+R8394MTJq6gCbU49D8hG/RdQHq8RrtIYg+EdhVf2M8ylh209GtKiOLuo3X
 v6eLv0uWlW2H/o5XgtgkexOuGjcdTUQDe5Its5xynUhyBguXV2wF51A9suO7KwFDkOgexqS82h/
 1Q6pCKxG8rWnuBFjgFT5FgaJAZKKcCtkg0JO2jLKB3k1hBY8v7gvZm5SJT62oS3lTGIhjL39Jyd
 yub2OjDPEDuG3aeeyKSsU+e7RTQfqIdjZYgx/8tKjY64Ny55Q/ESDcvdbGYI3OiRXQIznp22atL
 ZNZB33fqJXCsut0qLdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124042_039261_9329D6A5 
X-CRM114-Status: GOOD (  22.51  )
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

On Sun, 20 Sep 2026 22:28:30 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> KVM arm64 has different types of VMs with all the different modes in which
> the hypervisor code can be run. e.g., VHE, nVHE, pKVM etc. Then there is
> protected VM and normal VMs with pKVM. We might soon add other types,
> e.g., Arm CCA Realm.

Let's have some optimism!  


> 
> Realms support is restricted to VHE host and thus "kvm_vm_is_protected()"
> checks in the pkvm hyp specific code doesn't need to change, as the only
> protected guests it deals with is "protected pKVM" guests. To tighten this
> init_pkvm_hyp_vm() restricts the hyp copy of the vm_flavor to the ones it
> supports.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Seems sensible to me.  One trivial thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  arch/arm64/include/asm/kvm_host.h | 22 +++++++++++++++++++---
>  arch/arm64/include/asm/kvm_pkvm.h |  4 ++--
>  arch/arm64/kvm/arm.c              | 31 ++++++++++++++++++++++++++-----
>  arch/arm64/kvm/handle_exit.c      |  2 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c    |  6 +++++-
>  arch/arm64/kvm/mmu.c              |  2 +-
>  arch/arm64/kvm/pkvm.c             |  6 ++----
>  7 files changed, 56 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 286489a69dff5..9b1cf9c59e81f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -257,7 +257,6 @@ struct kvm_protected_vm {
>  	pkvm_handle_t handle;
>  	struct kvm_hyp_memcache teardown_mc;
>  	struct kvm_hyp_memcache stage2_teardown_mc;
> -	bool is_protected;
>  	bool is_created;
>  
>  	/*
> @@ -306,9 +305,19 @@ enum fgt_group_id {
>  	__NR_FGT_GROUP_IDS__
>  };
>  
> +enum kvm_arm_vm_flavor {
> +	VM_NVHE,
> +	VM_VHE,
> +	VM_PKVM,		/* Normal guests on pKVM */
> +	MARKER(__VM_PROTECTED),
> +	VM_PROTECTED_PKVM,	/* Protected VM */
> +	VM_FLAVOR_MAX,
Trivial but given whole point is this is an end marker, drop the
trailing ,  No point in making it easy to break the ordering!

> +};
> +

