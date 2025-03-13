Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70OnB5e4mvF6fbnwOU3lmV2IwMYHBaMK5fXsxJVPaUU=; b=AQbLXASBw3Qu7wtaSu32TgwnlR
	irYcbhDL0RiS096KDNEI3ztA+V6TwU2uGrZATLkXMtZNwRyfeNZ/BP74nwobno0TJqRLLN+6zZT67
	jFKIR0aWk3BwceCBw2Rf9RK4jOekhmrQFT3wY499CSUcjso9UKjoQVjAnWwIKmprOpT5sB4UTYf+Y
	WynFbUnqmtPj/AAkSmWgNRVZVqxUFsBU2+ZB8EG18H/NLB721SgkJJJ2hQXfaQD3eHTRPorTOq+X3
	FM6AhoEETlAdS3FarSoCzs+n8WnM+JVvLyifO+fXOF0PMZZHQFhAETqMrhb3sHtp3PzAs1iVD12SS
	GwKIbuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshUA-0000000BD55-3aac;
	Thu, 13 Mar 2025 12:16:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh1b-0000000B68d-0aY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3DE01C00;
	Thu, 13 Mar 2025 04:47:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041C33F673;
	Thu, 13 Mar 2025 04:46:53 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:46:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/7] coresight: Only check bottom two claim bits
Message-ID: <20250313114649.GP9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-4-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-4-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044655_219886_2AD462D4 
X-CRM114-Status: GOOD (  21.17  )
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

On Tue, Feb 11, 2025 at 10:39:39AM +0000, James Clark wrote:
> 
> The use of the whole register and == could break the claim mechanism if
> any of the other bits are used in the future. The referenced doc "PSCI -
> ARM DEN 0022D" also says to only read and clear the bottom two bits.
> 
> Use FIELD_GET() to extract only the relevant part.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

I checked the latest PSCI spec DEN0022F.b, which has no change for
for only using lowest two bits in claim register.

Reviewed-by: Leo Yan <leo.yan@arm.com>


> ---
>  drivers/hwtracing/coresight/coresight-core.c | 3 ++-
>  drivers/hwtracing/coresight/coresight-priv.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index a669872b4118..7b53165c93af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -129,7 +129,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
> 
>  static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
>  {
> -       return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
> +       return FIELD_GET(CORESIGHT_CLAIM_MASK,
> +                        csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
>  }
> 
>  static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 05f891ca6b5c..cc7ff1e36ef4 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
>   * Coresight device CLAIM protocol.
>   * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>   */
> +#define CORESIGHT_CLAIM_MASK           GENMASK(1, 0)
>  #define CORESIGHT_CLAIM_SELF_HOSTED    BIT(1)
> 
>  #define TIMEOUT_US             100
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

