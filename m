Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F568606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tKKsrPR7;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VzHG9OPV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YJMeRkCmn9gDBAVzQVXW/T4MGrrHZj9tyHFg1Pygn9A=; b=tKKsrPR7Dm/VDJ
	bM71FN5vDk1vM2vtALjxD3tXTySNzrDyMymVdzOHrFFAMFYz+/+UMrTQYctNYeJyL5mEUGs4yv0N+
	zKQ+APqcQwdZyb4xs7anjiK0N2kD3L7fpEEgaAzY9NDk2tBKbNcM4f6OFotvj/e0TMuIhR5bLR/kR
	5G8pOuKIwrUo5tlaQ3ItAUaYB9bFtb4Qb/c9j/u0xj5TKBviOFOftXvsyZ9ZWjGSXveT6zY1/mh/7
	nkg4ORSHa/5bX1gOTvt2nHZoK/fu3fG3A4x3JOB1Fn2Ygj+KnH7uk5mLnDe/wjqLAKkHFkxLeUstg
	9qBNyiTqDxc+AqFIZ5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCzR-00000002GPc-3zQi;
	Tue, 03 Nov 2026 11:47:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCzP-00000002GP0-1psk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:47:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12C581576;
	Tue,  3 Nov 2026 03:47:39 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2825D3F632;
	Tue,  3 Nov 2026 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793706462; bh=zSgYiWzcO24ysSZVXSXH948NdVzqg3BzhoQrCEIVTso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VzHG9OPVGljGbtk8/efCtKN+jXXjyAuI9shD1Hi8lG9XoKy/j+wZrORgQYX3SWvdH
	 TbbrdwV0WQUSkvcAtUMG6jZasRllCf8il54W8y5TJkprOXoSJzMc9YGDLV6rX2V7Dt
	 djZpfn3ciOcg5sMuhjPPTBIf3cbJgogUR7N4zkIU=
Message-ID: <f2cb2959-f56d-414c-b4a5-c0656a44f57d@arm.com>
Date: Tue, 3 Nov 2026 11:47:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] KVM: arm64: CCA: Check for LPA2 support and SHA-256
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-5-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261102141304.126883-5-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034743_575848_17431ABB 
X-CRM114-Status: GOOD (  21.37  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Steven

On 02/11/2026 14:12, Steven Price wrote:
> If KVM has enabled LPA2 support then check that the RMM also supports
> it. If there is a mismatch then disable support for realm guests as the
> VMM may attempt to create a guest which is incompatible with the RMM.
> 
> Also check for SHA-256 support in the RMM as to begin with we only
> support SHA-256 based measurements. This can be relaxed in the future.


This could be merged with the patch 3.


> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>


> ---
>   arch/arm64/kvm/rmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 9d118768550d..5b07beff8bc9 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -6,8 +6,30 @@
>   #include <linux/arm-rmi-cmds.h>
>   #include <linux/kvm_host.h>
>   
> +#include <asm/kvm_pgtable.h>
>   #include <asm/virt.h>
>   
> +static bool rmi_has_feature(int reg, unsigned long feature)
> +{
> +	return !!u64_get_bits(rmi_feat_reg(reg), feature);
> +}
> +

minor nit: Do we see this useful for others (e.g., DA) ? May be we could
move this to the include/linux/arm-rmi-cmds.h ?

May be we could even make the above a macro, something like


#define rmi_has_feature(reg, feat)
	u64_get_bits(rmi_feat_reg(reg), RMI_FEATURE_REGISTER_#reg _#feat)



Cheers
Suzuki

> +static int rmm_check_features(void)
> +{
> +	if (kvm_lpa2_is_enabled() &&
> +	    !rmi_has_feature(0, RMI_FEATURE_REGISTER_0_LPA2)) {
> +		kvm_err("RMM doesn't support LPA2\n");
> +		return -ENXIO;
> +	}
> +
> +	if (!rmi_has_feature(1, RMI_FEATURE_REGISTER_1_HASH_SHA_256)) {
> +		kvm_err("RMM doesn't support SHA-256 measurements\n");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
>   void kvm_init_rmi(void)
>   {
>   	if (kvm_get_mode() != KVM_MODE_RMM)
> @@ -16,5 +38,8 @@ void kvm_init_rmi(void)
>   	if (!is_rmi_available())
>   		return;
>   
> +	if (rmm_check_features())
> +		return;
> +
>   	/* Future patch will enable static branch kvm_rmi_is_available */
>   }


