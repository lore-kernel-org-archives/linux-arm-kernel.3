Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A301D41D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=; b=NnwOchPwLN3QzPfLldXjVJNyUW
	AzU8xyjnCAu7A+Uj4R/xF1adFT5ZrmDRwCVkb6B1fIz3fEsCZtaH2SxBcvKbVXY5VUXFfQ3BWMDzC
	2MHLOwxfH9pT6GFP9Td7/uUU0fFY3Rctih5XADbpnShWBFFjowRwI3VvGgzdCOGeYZLusx/xKPL/b
	Bnruyks71LPEYjyJ+O+pBtbQlV6Xowa3DdmEmjIw3/fv5N/WlbhmJSFTTQp3Gkw2WJ7FogF/hSo2m
	9NTSburydqw0rA7xRhGH4jnoZh0C77cSV6uHNclgutDFNLIpSDp1kAXQLlntEehRxM4zxZRUqe2e/
	lBUMEF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmbe-00000002hlJ-2g5A;
	Tue, 12 Nov 2024 08:50:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmSk-00000002fkc-1HIU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:41:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso3104804f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400884; x=1732005684; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=ZBWJzbdGDF/gHGRf/fMNZqc8sG+FzkNGZxmc09kMuCCR67EAt1MZ+Mucxt8oAvoAT8
         FoUXcyzhP2NUH+ORIgCbx5p9SKZwUn4cCmnABjrszBrChZFo/J6OsMN6QWgy2N9kJEMR
         nmo9zMRIFbf/qkWLSh014qA54rr+Se44kgvkJOEwhTbXsXJnGL/3QcEgZUQNYEXJYUua
         xNsHZ2dSmY5GfMJ5XnTt4PBW2mMBlGeH9du9Dw4IJHtrp6AaMNCTSWNvnmxewtEoIBTz
         jebrgrl/dFEnNVBu/Is4dN2G7fnCNuvGCqsXxzHayGkn+RkV0FkKdTVStvtxlkWBFCbT
         +LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400884; x=1732005684;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG2XhW9x/O5qAHARRVzbECFvOW6UZdHty+Mkfwr+2ps=;
        b=w2UD6WbJZM4m8uKfUyT5c/8sWSgmxuwOY31wziVc8ZMENAssyZAhTzI6Mee9uZ4E8N
         yuqi005bucwwQyba23gOpHcmSHd/wPWnRg9XXusf8MdSkyvGR3nnT6ALYzySAUPBFN++
         vXlaM0oIaromVm5YN5HvjL3hEmBaoays6OJJYdkXlnMHrfyVLs45efwplO2LaYLlbEW+
         MRhiZyEtPxlki69jGrqh7qz9bxNh+C4M66xpG/NWfXoKyRpAgjT2srOoqO0WqXzw6sgR
         CHbgSdWtSpSwnejAaIEu9yfCi21imr5X+FhcAgdHWJvYmw/GxU3KJC6kY1bdw1xvcknN
         mAUg==
X-Forwarded-Encrypted: i=1; AJvYcCXU4gsuY+lC67jUYHYMdPjCJeuqoaIbCeMLv06szc+s/Ju4cT3iHjN1JNDuPQopSeAz3hGnMadPOvfSaMfqX9vd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0No2qGJzrR7OzbJ0wu37+/2cAjBU3o4NA2me4RCjAyVFr4MG4
	1xmkUmtA4tQNCBTrr9p6YlGoEPrno5fmsKRHzrfTfLhyKRco4dKre4IF1MM0fXU=
X-Google-Smtp-Source: AGHT+IGUE8SBMbLKPxMonN/2CkAeXqXMHELhWYBo6IiWeJEKGp9mNtG5Y4mRS+LvxuwyDgdxXSaWxQ==
X-Received: by 2002:a05:6000:2aa:b0:381:eba9:fa75 with SMTP id ffacd0b85a97d-381f1866fc7mr12542783f8f.20.1731400884519;
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:50f9:1df6:c2b9:a468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8827sm15169457f8f.72.2024.11.12.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:41:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: Fix the CLK_IGNORE_UNUSED failure issue
In-Reply-To: <20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com> (Chuan
	Liu via's message of "Mon, 11 Nov 2024 11:37:01 +0800")
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
	<20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com>
Date: Tue, 12 Nov 2024 09:41:23 +0100
Message-ID: <1jv7ws26a4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_004126_466532_325CE0F0 
X-CRM114-Status: GOOD (  27.79  )
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

On Mon 11 Nov 2024 at 11:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> When the clk_disable_unused_subtree() function disables an unused clock,
> if CLK_OPS_PARENT_ENABLE is configured on the clock,
> clk_core_prepare_enable() and clk_core_disable_unprepare() are called
> directly, and these two functions do not determine CLK_IGNORE_UNUSED,
> This causes the clock to be disabled even if CLK_IGNORE_UNUSED is
> configured when clk_core_disable_unprepare() is called.
>
> Two new functions clk_disable_unprepare_unused() and
> clk_prepare_enable_unused() are added to resolve the preceding
> situation. The CLK_IGNORE_UNUSED judgment logic is added to these two
> functions. To prevent clock configuration CLK_IGNORE_UNUSED from
> possible failure.
>
> Fixes: a4b3518d146f ("clk: core: support clocks which requires parents
> enable (part 1)")

Still don't think a storing the ignored state is necessary, same as v1.

> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d02451f951cf..6def76c30ce6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -94,6 +94,7 @@ struct clk_core {
>  	struct hlist_node	debug_node;
>  #endif
>  	struct kref		ref;
> +	bool			ignore_enabled;
>  };
>  
>  #define CREATE_TRACE_POINTS
> @@ -1479,6 +1480,68 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>  	}
>  }
>  
> +static void __init clk_disable_unprepare_unused(struct clk_core *core)
> +{
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return;
> +
> +	if ((core->enable_count == 0) && core->ops->disable &&
> +	    !core->ignore_enabled) {
> +		flags = clk_enable_lock();
> +		core->ops->disable(core->hw);
> +		clk_enable_unlock(flags);
> +	}
> +
> +	if ((core->prepare_count == 0) && core->ops->unprepare &&
> +	    !core->ignore_enabled)
> +		core->ops->unprepare(core->hw);
> +
> +	core->ignore_enabled = false;
> +
> +	clk_disable_unprepare_unused(core->parent);
> +}
> +
> +static int __init clk_prepare_enable_unused(struct clk_core *core)
> +{
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	if (!core)
> +		return 0;
> +
> +	ret = clk_prepare_enable_unused(core->parent);
> +	if (ret)
> +		return ret;
> +
> +	if ((core->flags & CLK_IGNORE_UNUSED) && clk_core_is_enabled(core))
> +		core->ignore_enabled = true;
> +
> +	if ((core->prepare_count == 0) && core->ops->prepare) {
> +		ret = core->ops->prepare(core->hw);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	if ((core->enable_count == 0) && core->ops->enable) {
> +		flags = clk_enable_lock();
> +		ret = core->ops->enable(core->hw);
> +		clk_enable_unlock(flags);
> +		if (ret)
> +			goto disable_unprepare;
> +	}
> +
> +	return 0;
> +disable_unprepare:
> +	clk_disable_unprepare_unused(core->parent);
> +	return ret;
> +}
> +
>  static void __init clk_disable_unused_subtree(struct clk_core *core)
>  {
>  	struct clk_core *child;
> @@ -1490,7 +1553,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  		clk_disable_unused_subtree(child);
>  
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_prepare_enable(core->parent);
> +		clk_prepare_enable_unused(core->parent);
>  
>  	flags = clk_enable_lock();
>  
> @@ -1517,7 +1580,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>  unlock_out:
>  	clk_enable_unlock(flags);
>  	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_disable_unprepare(core->parent);
> +		clk_disable_unprepare_unused(core->parent);
>  }
>  
>  static bool clk_ignore_unused __initdata;

-- 
Jerome

