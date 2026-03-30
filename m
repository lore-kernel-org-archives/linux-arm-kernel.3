Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3D61061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frztTOmTf3SkuLYaPWUosPvcRTJGFbSFXLD1W9fYAwY=; b=Rce5hIPI/1MjzhAK0o5Xxh6ywK
	Wd2Ph28B3F1LR+WuQJHT3l+mZpuSt1igLVo2AauW2a2i3jvU0jtmnX3NqyQdXfnYFoT//W/wXfRTw
	jTNjy4yFyOASh4GhgehYlP6srNNEpMVi5TvUq7FET8t8xNAY8y/xEkTkKELKpFtcqVo6qLA9wXwxi
	QZsTIZk1u+5fJAPYjUoD00rx/wIr1SriPZh+8syBEdTopVIKmNAsIIdDbDQ4y7Y7ELr4sEhIrv0VR
	0LdzfRGKddNhytK5kTUXcH4Hbtrmxe4O67gv8X7Jd/xnCBBPtagS0lSVIPdtkKj2vKCX2IkpHB5iw
	ar9ETsZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jh3-0000000BsZK-1ATm;
	Mon, 30 Mar 2026 20:58:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Jh0-0000000BsYz-09yQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:58:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82a893d289bso2150158b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774904317; x=1775509117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frztTOmTf3SkuLYaPWUosPvcRTJGFbSFXLD1W9fYAwY=;
        b=qKSMbbofTO2lApd+ijOJu/gRZQeWvHTnz8Vkac0DL6XNxurEaIuS5av87DoqWG2jxn
         NqCxCbh3HQCST22jce0zNkD+4wC5ehcR/bVY2BcsKi8ujzy3xzFxhVAAtnp7hacitMqt
         FRL7Vw+GjhML/wF4OLGHEHu+8xcG07ZhGuth2I5vbGPRJDhOQq7HzFy8mli8ovlLPjYK
         nwTG3Yp7VQZTPV+0/7t3yyfKJBZ2bY8PW9r+kyMxotkcuibSBjismlWNP1yj/azQ5kHC
         m4Lrhrt60sW8t6H/db6myD6pboBowBjhwonCsY5PavHtfop7imILUtpHgQ3j5ZTAPOpN
         NEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904317; x=1775509117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frztTOmTf3SkuLYaPWUosPvcRTJGFbSFXLD1W9fYAwY=;
        b=YYML/jSS1coHtQYtvRFpOxZphwPeUWT8p4UcrVyHZ3ULu1za1XVz4exBwmRzCsTIGA
         X65AYqeKoZa9NrL1v5Jv/Ap87gU+eNqLVfhphwFNm9V0srq47RUDZdHvXsXC2o4hM95k
         IZVjRkKwHNXQOt/ed5G37KnMvPXpf7mRJPC6Kkj/Z60PrTFEb7ZeA5brcXOuqFtM5Pws
         TXsVRrfoyBuofmlcT6Z1dW6zA9ZIITJQFisQAvqE0eziMGHeupCesK8ceijlY75X7oOd
         DHjyIWDNSL6o+svaLuoZbJBcVWpm4uQxXQBEBVAU8oA1PNO8YMDJ0LR5FDBX7zeJ3gfj
         2NRA==
X-Forwarded-Encrypted: i=1; AJvYcCVbbrGtK8PxXPuwUAEWbL+VPvkIZtIPYjdNNVdTtaucDl2gRdbmmPzMcxqteuhW58LX2cBSzuWbhjMwlxTL0IZL@lists.infradead.org
X-Gm-Message-State: AOJu0YzbLk93EqTwi0ek9LJRs8TY257vYY7Y1buNPZsNb3wN4sb6etPQ
	fw2kY/oOeWccZ84vHWbmJ4eLY60qIRItAgCrSNwNdtWA1kR6zHwSIurxOy68jIK6YtU=
X-Gm-Gg: ATEYQzzBEkjBUONQOig88XjT7/sjei47NHkeWMBvxTO5DfZT72WfxR2NZ8VvVE8w3i1
	zce+kM8q2kbscdywV5ibi1xCHWhRh6ERXkavhm9ox/gZvw2DKxCQ8U0zQFAOSv/U9qkudE6o0PN
	nY/Jvf4dsSz7pU89AaHLFj8cGtfcb0vO25xvVfXW2P/Tr7mYISvbp21KbFMe1ZY2YeEQ1V906Dd
	TpG0xsNo/1SjU6hOzoBJyt7AguHTGnhdjcvE3Z2VhzoeK1A9oXYJmCD9xvY9cYC2gNCok/0eGFu
	k9kpByIWYrbVnajqokSIs3zF0iFyiXM22s8A9ZCF30NwqRj26TlpEjMbsBnO/bN/CZOdEY8ay0A
	nRE6TP0DpI6hTMbnX+3S0N2JR1vilpTrQubA+tkUm6T/Yc/3eg18jHBVQJ/y5mxMjr0zbxU3r8h
	HuWfN61jkYOQnstDyVXTae2lCCiOw=
X-Received: by 2002:a05:6a00:ad88:b0:82a:6d9d:3f84 with SMTP id d2e1a72fcca58-82c96002905mr13353400b3a.33.1774904316640;
        Mon, 30 Mar 2026 13:58:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e8c9:5e1e:f42a:2b73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc6c8sm7426575b3a.45.2026.03.30.13.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:58:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:58:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v13 10/48] arm64: RMI: Ensure that the RMM has GPT
 entries for memory
Message-ID: <acrj-cKphy4hJsEG@p14s>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-11-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318155413.793430-11-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_135838_127280_18D971E9 
X-CRM114-Status: GOOD (  35.21  )
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

Hi,

On Wed, Mar 18, 2026 at 03:53:34PM +0000, Steven Price wrote:
> The RMM may not be tracking all the memory of the system at boot. Create
> the necessary tracking state and GPTs within the RMM so that all boot
> memory can be delegated to the RMM as needed during runtime.
> 
> Note: support is currently missing for SROs which means that if the RMM
> needs memory donating this will fail (and render CCA unusable in Linux).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v13
> ---
>  arch/arm64/kvm/rmi.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 9590dff9a2c1..80aedc85e94a 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/memblock.h>
>  
>  #include <asm/kvm_pgtable.h>
>  #include <asm/rmi_cmds.h>
> @@ -56,6 +57,18 @@ static int rmi_check_version(void)
>  	return 0;
>  }
>  
> +/*
> + * These are the 'default' sizes when passing 0 as the tracking_region_size.
> + * TODO: Support other granule sizes
> + */
> +#ifdef CONFIG_PAGE_SIZE_4KB
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_1G
> +#elif defined(CONFIG_PAGE_SIZE_16KB)
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_32M
> +#elif defined(CONFIG_PAGE_SIZE_64KB)
> +#define RMM_GRANULE_TRACKING_SIZE	SZ_512M
> +#endif
> +
>  static int rmi_configure(void)
>  {
>  	struct rmm_config *config __free(free_page) = NULL;
> @@ -95,6 +108,80 @@ static int rmi_configure(void)
>  	return 0;
>  }
>  
> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> +{
> +	start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);

This will produce an error on systems where the start of system memory is not
aligned to RMM_GRANULE_TRACKING_SIZE.  For instance, on QEMU-SBSA the system
memory starts at 0x100_4300_0000.  With the above and RMM_GRANULE_TRACKING_SIZE
set to SZ_1G, @start becomes 0x100_4000_0000, which falls outside the memory map
known to the TF-A.  I fixed it with these modifications:

LINUX:

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 10ff1c3bddaf..21bfbbe2f047 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -424,7 +424,9 @@ static int rmi_configure(void)
 
 static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
 {
-       start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
+       phys_addr_t offset;
+
+       offset = start - ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
        end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
 
        while (start < end) {
@@ -439,7 +441,13 @@ static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
                                start);
                        return -ENODEV;
                }
-               start += RMM_GRANULE_TRACKING_SIZE;
+
+               if (offset) {
+                       start += (RMM_GRANULE_TRACKING_SIZE - offset);
+                       offset = 0;
+               } else {
+                       start += RMM_GRANULE_TRACKING_SIZE;
+               }
        }
 
        return 0;

RMM:

diff --git a/runtime/rmi/granule.c b/runtime/rmi/granule.c
index cef521fc0869..60358d9ee81e 100644
--- a/runtime/rmi/granule.c
+++ b/runtime/rmi/granule.c
@@ -209,9 +209,11 @@ void smc_granule_tracking_get(unsigned long addr,
                return;
        }
 
+#if 0
        if (!ALIGNED(addr, RMM_INTERNAL_TRACKING_REGION_SIZE)) {
                return;
        }
+#endif
 
        g = find_granule(addr);
        if (g != NULL) {

This is likely not the right fix but hopefully provides some guidance.  Send me
your patches when you have an idea and I'll test them.

Thanks,
Mathieu


> +	end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
> +
> +	while (start < end) {
> +		unsigned long ret, category, state;
> +
> +		ret = rmi_granule_tracking_get(start, &category, &state);
> +		if (ret != RMI_SUCCESS ||
> +		    state != RMI_TRACKING_FINE ||
> +		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
> +			/* TODO: Set granule tracking in this case */
> +			kvm_err("Granule tracking for region isn't fine/conventional: %llx",
> +				start);
> +			return -ENODEV;
> +		}
> +		start += RMM_GRANULE_TRACKING_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long rmi_l0gpt_size(void)
> +{
> +	return 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> +				      rmm_feat_reg1));
> +}
> +
> +static int rmi_create_gpts(phys_addr_t start, phys_addr_t end)
> +{
> +	unsigned long l0gpt_sz = rmi_l0gpt_size();
> +
> +	start = ALIGN_DOWN(start, l0gpt_sz);
> +	end = ALIGN(end, l0gpt_sz);
> +
> +	while (start < end) {
> +		int ret = rmi_gpt_l1_create(start);
> +
> +		if (ret && ret != RMI_ERROR_GPT) {
> +			/*
> +			 * FIXME: Handle SRO so that memory can be donated for
> +			 * the tables.
> +			 */
> +			kvm_err("GPT Level1 table missing for %llx\n", start);
> +			return -ENOMEM;
> +		}
> +		start += l0gpt_sz;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rmi_init_metadata(void)
> +{
> +	phys_addr_t start, end;
> +	const struct memblock_region *r;
> +
> +	for_each_mem_region(r) {
> +		int ret;
> +
> +		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
> +		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +		ret = rmi_verify_memory_tracking(start, end);
> +		if (ret)
> +			return ret;
> +		ret = rmi_create_gpts(start, end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rmm_check_features(void)
>  {
>  	if (kvm_lpa2_is_enabled() && !rmi_has_feature(RMI_FEATURE_REGISTER_0_LPA2)) {
> @@ -120,6 +207,8 @@ void kvm_init_rmi(void)
>  		return;
>  	if (rmi_configure())
>  		return;
> +	if (rmi_init_metadata())
> +		return;
>  
>  	/* Future patch will enable static branch kvm_rmi_is_available */
>  }
> -- 
> 2.43.0
> 
> 

