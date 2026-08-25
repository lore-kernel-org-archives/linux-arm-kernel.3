Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373D5C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrSQugjWwNbSyFKJC0aQ+HhLTDBrn6ENKLGPbrFSXE0=; b=Y4gczk9Dep3T3VXFIVPKVaRdIp
	vwRiDffv6xy965bo/T8zZzXVA55JPtFuOXbCnR2PsdF5mrQOJ/72IWeqcns6LyGTjfs3VqsD6qaCx
	nTLUugLOoA9i27gFOJNujcBKQcdbybv20gdS2W7rJ655lMvve/T9xRK9qPpD8aNYmphg0g/S+FphN
	FNmuWe0EfczPYM8kQy9eOx8Ei7J5MPsuXrgr3YMweeBi1BBSyDeY4zq74XXuwletGHNrZ5BS8+Yda
	/zdg+Nnl2Cqd/OcSCmq6jcecMM0Mack4DWCua+tFOf97G1d2jmHHRQZ3sgW3+0me+WfNO32csunXE
	YiW8P8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvp2-00000001Ixe-0paT;
	Tue, 25 Aug 2026 18:24:32 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvp0-00000001Iwj-3Fpn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:24:31 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f3ece23165so119805a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787682268; x=1788287068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrSQugjWwNbSyFKJC0aQ+HhLTDBrn6ENKLGPbrFSXE0=;
        b=nct/w5c4X6qa8Wi7v4HaYjaI6Vp0QfstUgIYq0D9Qb2LShUMD6qkF9+t+bdKfDa3bJ
         PE1u5jLXkbymFcHhi5NbC0eebxilklOOQwupiFTeisvcOokiotl/dV5l7P0S89t4EqWM
         nAxnBjZVrHsLKNQHJTZ6MIm/XtJgrvWZwklTF3pbURbuZPpBixw4NDSE+nypJNawkujQ
         LXTR55NcMNOCjqWtA62ZHAv7QHXMgNHptDK3JnQJT68khT4gShUOhfZmI7ORbXeoe6kW
         LrbNWDfbair/dttuUtN4L62dQp/MynaiAAY7nfElpQeFQKOH4qgEFzfBsbtU/yN9tbiY
         Kj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682268; x=1788287068;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrSQugjWwNbSyFKJC0aQ+HhLTDBrn6ENKLGPbrFSXE0=;
        b=nDfMc6pZp7SWtnjF3bVJBuTPiSdNJySR4FOfDeQQWb4BzUaQxSZLOzQINMCX4gtFxW
         ryid4HmKm2wQQKsrT/khe27uhkpog0aKJfhbf94P3E8wI6nHkgUYNH9cZMzjcXlMaK4D
         FcNqx+OiCkiD1S24iRmQVI8gXEw83EfK2Z5U3lsc8w3zW1LnfAaC0T0hGdwDKcPdSUjc
         4U5SBjwKfQnAa40xiVBAuGMIh+RKznUcpVM7p9JujmUvigALjhrbbmNg87GkBcFDA8/u
         Nhly83h8UGJpm5edyA2lJEJ0q4uixjsqdpVlU59oWT1bjCCYg7AQ0Z5jCIAYx3Ttmg8o
         wPQA==
X-Forwarded-Encrypted: i=1; AHgh+RrPWb7CVdFw4B6MFEpErtT1bwcalnFqL8lMGNl1dNsWvr+b518awv1qd13g6eMQuY41pcX6ZVYjHGQTd8ciUXS4@lists.infradead.org
X-Gm-Message-State: AFuF++lZJSDFDpHiL1IudIKITybkai0p7/lOG1o2yP0IyV0SBNKqqWMG
	bNZibz8fMr8JS2bQCB7PSHZUPhudmbqcGVeIFf05XDvrPGG4+RxE812TVAykPtMKRw==
X-Gm-Gg: AR+sD10yI5XlRRFYd1k+IC8//B32ohffpniYAUh3D2gboE5MZW0NYQxsDXEZY2Ps8xT
	GxkMuKmucX/dOWelSNpXxTNB0SVkKccrsVLxJpw/x8ibi+/m7hEDXm+E3yfEWVCCjskKBxXQbF1
	0q6H3OdJ2RVIzYq5ryKR0YN5LDZzzb8UgpUI/J3tSxBXdx0uAQPq34FIymiZaPtWByIe8YYwHc+
	k7BLq4uSHTjYHQHUzZrepi+plsgk0htI65OG75aFzeJ45+lhgfRuEnhbfNcuTi9WhtdTqDXuonA
	w+o5fwh2LLZV1VCXuSl/+u88RfT1K7CkGwIVHnaYawmn/XB09gNv73ldk0UzF/r2x+89RjzW5P6
	W9qOdwt7hw2lt45M9R6IWQAudf/XBT9WAs4dAsJIqzEANeBBsSoIbD9/LCIZ6cTM+47GqFislrL
	sb8KJJc0aVoLwdX5EjICzCduEz61vFIag6R4Dhz8pYlUhcYcpGo8Pwy8D4Jge00zEOR2gH6PZBw
	b/InWnzzK4qm5qjIiRmJGaO/lCN
X-Received: by 2002:a05:6820:55ca:10b0:6ac:a539:bc41 with SMTP id 006d021491bc7-6b1a03e5c38mr696085eaf.12.1787682267892;
        Tue, 25 Aug 2026 11:24:27 -0700 (PDT)
Received: from google.com (203.215.188.35.bc.googleusercontent.com. [35.188.215.203])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a02566desm215005eaf.11.2026.08.25.11.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:24:27 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:24:25 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <ao3d2TlIRqxbz4WP@google.com>
References: <20260710172946.15633-2-rdbabiera@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710172946.15633-2-rdbabiera@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_112430_814807_948D6341 
X-CRM114-Status: GOOD (  20.39  )
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

Hi RD, some minor comments below.

On Fri, Jul 10, 2026 at 05:29:47PM +0000, RD Babiera wrote:
> +#define GPHY_TCA_DELAY_US 10
> +#define GPHY_TCA_TIMEOUT_US 2500000

Do we really need a 2.5s timeout?

...
> +
> +static int wait_tca_xa_ack(struct google_usb_phy *gphy)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
> +				 reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
> +				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
> +	if (ret)
> +		dev_err(gphy->dev, "tca xa_ack timeout, ret=%d", ret);

The dev_* calls throughout this patch should have trailing newline
characters.

> +
> +	return ret;
> +}

...
>  static int google_usb_set_orientation(struct typec_switch_dev *sw,
>  				      enum typec_orientation orientation)
>  {
>  	struct google_usb_phy *gphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>  
>  	dev_dbg(gphy->dev, "set orientation %d\n", orientation);
>  
> -	gphy->orientation = orientation;
> +	guard(mutex)(&gphy->phy_mutex);
>  
> -	if (pm_runtime_suspended(gphy->dev))
> -		return 0;
> +	gphy->orientation = orientation;
>  
> -	guard(mutex)(&gphy->phy_mutex);
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		if (pm_runtime_get_if_active(gphy->dev) <= 0)
> +			return 0;
> +	}
>  
>  	set_vbus_valid(gphy);
>  
> -	return 0;
> +	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
> +		ret = program_tca_locked(gphy);
> +
> +	pm_runtime_put_autosuspend(gphy->dev);

Here you are using the _autosuspend variant, but autosuspend is never
configured in probe(). Should this be changed to the plain
pm_runtime_put(), or actually enable autosuspend in the probe function?

> +
> +	return ret;
>  }

...
> +
> +static int google_usb3_phy_power_on(struct phy *_phy)
> +{
> +	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
> +	struct google_usb_phy *gphy = inst->parent;
> +	int ret;
> +
> +	dev_dbg(gphy->dev, "power on usb3 phy\n");
> +
> +	guard(mutex)(&gphy->phy_mutex);
> +
> +	if (gphy->phy_state != COMBO_PHY_TCA_READY) {

I think prior to this we should add a check if phy_state is
COMBO_PHY_IDLE, return an error and change this check to phy_state ==
COMBO_PHY_INIT_DONE to make sure we are explicit in our state handling
to prevent issues with any potential refactoring.

> +		/* Wait for PoR -> NC transitions*/
> +		ret = wait_tca_xa_ack(gphy);
> +		if (ret) {
> +			dev_err(gphy->dev, "PoR->NC transition timeout");
> +			return ret;
> +		}
> +		gphy->phy_state = COMBO_PHY_TCA_READY;
> +	}
> +
> +	if (gphy->orientation != TYPEC_ORIENTATION_NONE)
> +		return program_tca_locked(gphy);
> +
> +	return 0;
> +}
...

Thanks,
Neill 

