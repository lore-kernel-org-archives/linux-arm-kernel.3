Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F98C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9N3WXOrDiviSnI8bK4t5/jqvcALBxLowiZHdUyJBT4=; b=Ws6Z8tDZsIJKlPBg7HcSu6NHPK
	Q7arKetKjD/q/YLrgvGalb7KMuzdgRBIh58/z6RdJJ6dCM08yTb88bI3B4RI9c6RUesJS/WrPU1ao
	kH5F+16aIx+ke5eDk4V5NnwOqIHcUWxQYmtMZepPtM7SIea/vC2V7GoEi0EPnURZG9wD6yV4ke0or
	dFBV7nTJOI9q/VRbdmHXPPfGaux5Rhtas/vFPwo/UDFqYihnfG4qnca1ogK/obMCOOYTvzuPDFZtP
	ipCy0z0koDVHHI6DvEZMV3HNM05mjXz6zp/Krf3OqtbZXm3NRaW+gXk3yUKrkcE7TCOVAkQgU8x2r
	Ru0pp8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgiG-0000000B2Kd-2bDG;
	Thu, 13 Mar 2025 11:26:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsggR-0000000B21q-3Q5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:25:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1664A1F02;
	Thu, 13 Mar 2025 04:25:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B0E3F673;
	Thu, 13 Mar 2025 04:25:01 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:24:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/7] coresight: Rename coresight_{set,clear}_claim_tags()
Message-ID: <20250313112457.GO9682@e132581.arm.com>
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-2-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211103945.967495-2-james.clark@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_042503_948581_4D9E2A34 
X-CRM114-Status: GOOD (  20.19  )
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

On Tue, Feb 11, 2025 at 10:39:37AM +0000, James Clark wrote:
> 
> These look like they set the whole tags register as one value, but they
> only set and clear the self hosted bit using a SET/CLR bits mechanism.
> Rename the functions to reflect this better.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0a9380350fb5..523dbb381f90 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -142,14 +142,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>         return coresight_read_claim_tags(csdev) != 0;
>  }
> 
> -static inline void coresight_set_claim_tags(struct coresight_device *csdev)
> +static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>  {
>         csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
>                                      CORESIGHT_CLAIMSET);
>         isb();
>  }
> 
> -static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
> +static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
>  {
>         csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
>                                      CORESIGHT_CLAIMCLR);
> @@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
>         if (coresight_is_claimed_any(csdev))
>                 return -EBUSY;
> 
> -       coresight_set_claim_tags(csdev);
> +       coresight_set_self_claim_tag(csdev);
>         if (coresight_is_claimed_self_hosted(csdev))
>                 return 0;
> -       /* There was a race setting the tags, clean up and fail */
> -       coresight_clear_claim_tags(csdev);
> +       /* There was a race setting the tag, clean up and fail */
> +       coresight_clear_self_claim_tag(csdev);
>         return -EBUSY;
>  }
>  EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
> @@ -199,7 +199,7 @@ int coresight_claim_device(struct coresight_device *csdev)
>  EXPORT_SYMBOL_GPL(coresight_claim_device);
> 
>  /*
> - * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
> + * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
>   * Called with CS_UNLOCKed for the component.
>   */
>  void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
> @@ -209,7 +209,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>                 return;
> 
>         if (coresight_is_claimed_self_hosted(csdev))
> -               coresight_clear_claim_tags(csdev);
> +               coresight_clear_self_claim_tag(csdev);
>         else
>                 /*
>                  * The external agent may have not honoured our claim
> --
> 2.34.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

