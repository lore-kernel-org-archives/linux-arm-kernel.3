Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8703BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdgRnYflnPlN6KlJOaYP1q0InGmD8pNNwfuxpkTXEio=; b=MT5cO2Laf8EX6sDYW4NmwW1DiL
	+SMvg0xeWZyQZ3dWCkIyoBixgE072q6Ww+8JwFVC+4zIsex7Gwo1GOwTPBSc2VmByVFnC6BiZb3nR
	P5Rnb+t4aYxP4HUYFn5Nb/Onnyc2Q0QlW6lrE9sKcOwBS4iOjfXTcJGpUxZHedLqv7FVVurfnEKn7
	uRltsaYSXTA0Ht8WzNquzSCvzdyGV+qYKeUxiDZTMK8QRNv0NQbKVbseyoHB3U6SKsoJ2SCvprw1A
	+3z19Z3LwwLxmf9wx/YengH7vqp3N8TYmaMPoA7U+7V8Kp+Tk86UvF/mQZyp/8tTg1MXoL0sa4g18
	/52w9IfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXM-0000000GJNA-0Eb4;
	Wed, 07 May 2025 17:26:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChYj-0000000G9B7-1F6g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:23:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso296845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746635027; x=1747239827; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdgRnYflnPlN6KlJOaYP1q0InGmD8pNNwfuxpkTXEio=;
        b=h/pjTz5+zb2y5ARp5JLxPydLn51Cpci7J2suDJKbRNC0yb3IpGaeUcPGg5KkF2D4ul
         cCJu4oirGFFoLfBfMnFLtRzn9ma+MAwpt7rupWdgvXkU51lI5oPnQRUE6X2OWNhAr7XL
         xR8UiED6uyySwkG2b/FA00tz7GjV+gS23lBSzh/joyvEHnDQ60cpqBvRNLJgPIOoe4wA
         ymCpFatNbU5QUK7iXMLIhQ1HbNwcCN+YD2aOPtOizSzctKtOyo+dQWt9GzTU2QcZ1MJ/
         7zOFCRdltB3/4+aGc3HoqRkgI3SyaSYU/I0StEGvZ5Us7rHmtxEZHPHXH69rHgKacrf/
         0WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635027; x=1747239827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdgRnYflnPlN6KlJOaYP1q0InGmD8pNNwfuxpkTXEio=;
        b=Pk7i2IBgWwBb76PjoA+FToF5kZQIeCSZkmQWEdUuVdNwh+48YTlZhGZk/YDXcNiVT1
         NieF6xfGFTww5MGyBvgMHLK5h9ZWsQpJK1/gu3ITEr0fRSASOPpfyKk7Ngx7zJ2ovzax
         PVege6q+8xxRmzOl+9MKs6iSqpXU3sKr1c9nNWCBR2CXoICYtRwDibjgVtqVxErxvM04
         0+My+jb8Ku33bhlO59UtKAUtV+WXbqhqhda76DrSlzFWi/ThlpCRu9y0uiCEfWbAIouo
         Y4RpTO8ui0Dsr/WXDVq5lNOeabXwE2SICaOoj9L7pKzQtluwLPrv/klP2WJvFDw0JRv+
         x6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdOHU1iMWMDg+Tve8gw063/XOqzzGcAAG/sIxLWxoJjQsgED+95aikV4aD9DK01TyLGEMhCSzlHUx6S4My3e9Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yxou30DxLfd9lXSBwV7tHj+DQoRvHiCXjUNpY9VeH1fw2furJgi
	mHlUS3UYF/QbDcI/DelqVK9A45sXKe5DZFLSAfG5IO8tGsZm6KGGuThUqgBA1Og=
X-Gm-Gg: ASbGnctguiorfxsakjYJeHsAy2cpbfP6HztcmJcfczija3cZViFXSR2Tz+j3gDuzMoJ
	sQcvFjaShh9oSufnxyxZ2dPRi93BrgRsczCvOQaCrr8P7YLFo2M8ElCCSHVuxUn40KqdQF2xnVE
	1WeAIvE/AOQNYKocbJ1f3sx6F5j9MPl5W9D9WpV+GkWvDpxsR18y6mPL8NeTZ/jHXfTbuhoiCZH
	XcWHbMizjvS7KIXGArs0ojlPW5Ruo/LMbu/qPspx8092MKiocE9xdRHQzNpEweGbUuiPqIaKcjZ
	ViZvhi5bglNceVIK1I3ypWwF/j+UupF4kJWfa98t1l2f+A==
X-Google-Smtp-Source: AGHT+IE6y0LlIV4IlIooPu6OJTNcYKnkqYqnx0WCylTRROLNd4cSZyHpQkJmtgiFMm+bT9j1cn2H6g==
X-Received: by 2002:a05:600c:4e47:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-442d02ed455mr1853855e9.13.1746635026951;
        Wed, 07 May 2025 09:23:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f0easm5943165e9.12.2025.05.07.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:23:46 -0700 (PDT)
Date: Wed, 7 May 2025 19:23:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
Message-ID: <aBuJD1izaMqKUJ_s@stanley.mountain>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-8-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_092349_335816_8F4A0854 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Apr 17, 2025 at 04:25:05PM +0200, Ulf Hansson wrote:
> +void of_genpd_sync_state(struct device *dev)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct generic_pm_domain *genpd;
> +
> +	if (!np)
> +		return;
> +
> +	mutex_lock(&gpd_list_lock);
> +	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> +		if (genpd->provider == &np->fwnode) {

Presumably this would be "== of_fwnode_handle(np)) {" as well...

regards,
dan carpenter

> +			genpd_lock(genpd);
> +			genpd_power_off(genpd, false, 0);
> +			genpd_unlock(genpd);
> +		}
> +	}
> +	mutex_unlock(&gpd_list_lock);
> +}


