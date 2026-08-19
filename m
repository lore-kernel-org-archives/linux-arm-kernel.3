Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF66C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpqeN5lIytC9amcBTT7riRYHzG5rbVz5f45Yb8g38Eo=; b=qMfTY9FKi3jdF0LCZ6ce62xV3v
	ENIo7gIaVzJNUZcmmFrXeGU5OuHv9mUPRpc653FnHhx6eMzcj9xGPjFPJkdV+acVF8lrA9sOkVNZE
	+CQ/+w5ylg4djxh5PUI4BLACo/fZoaPge3RQPgqHuzXO5d1p1bUvGebC3njZgk2C1RMxbclqWCzPU
	3kMW5oXuGkWQl552Lea5QWIDueOzP1nBHjfdBVs2XXrmjReK1g7MSXQ3h26X8Z2ThNTjhb0pR7ads
	+Qpw+rxHrChWtRUPmSCVfIPQhmPpwLJOIlsK3HIvnpWGdZ7489tYOL2b5uzRJiUs+w51lv72+JhhQ
	3SyAuLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaB2-000000098AL-33fl;
	Wed, 19 Aug 2026 06:53:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaAw-0000000988g-4Bjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:53:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495590dde14so7538525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787122404; x=1787727204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpqeN5lIytC9amcBTT7riRYHzG5rbVz5f45Yb8g38Eo=;
        b=g4ngspOQwN/Er5vDVxkd5piUwjYmfPHNM2SJxLA+GXqMTY/nfCHhTeURRxAdl0I1Vj
         N/7ERvzDRFCOIf1liYOpNGug4di0o+2T1I84BI2p1rCC0OgeUa9R8UPrPjlCraMtDOZp
         N1gGusgBjFsJnso1RC6bxY672sqJXoWYcI0zHmbyGDaem9dnD5c4Un0/v5dvoA2Skb1I
         cz4HHYsqEUgraBtuJ3H/zCms+q4TsZwBK8PavU1zthqV90xyVujCtOQ6i3282qsYitvu
         JKOItnQs7kivl6lVLHg3CgOw/xgmjtcmIETaWLUO51nUxkfoWG4JJC/706Ly+O+HuH0L
         JuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122404; x=1787727204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpqeN5lIytC9amcBTT7riRYHzG5rbVz5f45Yb8g38Eo=;
        b=Vvgc9glc/z73k0w8Y6JtVag6xjFjQQNKcChxPVZPuXCMALukaLSZEgCydPvKZC8aOm
         d6+/XNrD1LS+VX8lzdiSuHsAV/eAf03o034YAKs5dCbX6DiUPOnw9Q6poNEAklWvIELZ
         h88OEZLsoRtfT21BSvXuszi51rB+CRhqThrgXYZi809xB7tDE01/KRmUB3uvAHWK6CIE
         bQfOayQkEqmkItCSVU6tfAPuQKy2n8+DzD55VHL5RkTrds2lhOQUA8tRgc6a5bmY8U3q
         zfYZj5z2bOz5beCSHTG8clv5Z2Bp8J2eLJAQ3gjYUi8Uku3+jxIgj2sm34z7g77rdNlB
         mP2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrzzHA2IDwjWKlop/KOgScVI93AxF0aGCNGk//FCWpda8VVPXhlznQRBCb55T+qw4l/WvlUsn8cpxwusSQtbmtL@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZ+Wwe/gpAjSqOoOrHXVJBBXrb4J9B/0GmS9o6wzc8L3+myhu
	Uu/3WNWLOJo4XApEeNOmmlQxIjdegOpJ0BJ6MWHdYiEpPss0qNNT+wX5
X-Gm-Gg: AR+sD13FqZFLhbQpgnUj3LAscC9FlWaeU81CAl3O3pYPcGsSm+5SGJyfjt04Gi7OnEO
	4gtAfXzTXkq4MdDxlcTPrrCToSICHtfI4aRqYdWjV0KiV2w4PQOZpKTgSZS1J6mcCfE3xbbKQ0S
	XsloeUd04KKcyx5lkRNUnRv05yO/Vk3Ulejsqptvnu7mL4ISQXI6hoYG/jqmqXWgcyF/qYkBIxt
	PBuc9dB9RfveuE9rBTtZFsmqaHh8jHgfgx8uxkIEaIbnydzkQ1A3MShjqimjtkmXoEEeSEBGMHK
	lkumUYi47LZkqcz8OOq0rk7+0DEoqWYOhLTmAnXMLZsCCJZFiqC0XrYD5ah3p52tGUMNrYAM8yY
	Ya6g//zfWPRBELGjTsNKONcvDcRWCSDxK06voJLhFCnGTlpZawHWKmxNq/PgCdYEVhN/Ck9TfE9
	RgNdVrd+n6uG85FCLjY9T9mZG9gVWBtSwtl5Dc+KH9p58+jo4dzLm03lfm+2mGRJlC347ZNLMOC
	AewE9SIlFNfkSi1uzQr6DyLYYewZeXJ2yS8N6BhhMySSEWkE5CvAvOKkqgFmyq62+QoS4FXyYzR
	t52uz0LBdJlQKoUlZ+mi4Twkq2itbyBHywEtd4BSuiFWL5qxv99l0CP4Tm6yluC9PJNWfPBhkHK
	PJtT0L63fQyI9eYo6FTZKkCiKlCN95bEnh4XFuE2ijYG+EwFiaT+lVnr6MjAB4gLaYAbmLA==
X-Received: by 2002:a05:600c:4e55:b0:499:a07d:a482 with SMTP id 5b1f17b1804b1-499aa1a28efmr46091735e9.10.1787122404470;
        Tue, 18 Aug 2026 23:53:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6a84sm35256565e9.10.2026.08.18.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:53:24 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:52:55 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vladislav Leonov <vlad@zlab.su>
Cc: Jonathan Cameron <jic23@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Rob
 Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Simon Glass
 <sjg@chromium.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260819085255.00001e60@gmail.com>
In-Reply-To: <20260816113636.33635-1-vlad@zlab.su>
References: <20260816113636.33635-1-vlad@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235327_201515_F3ED358A 
X-CRM114-Status: GOOD (  14.63  )
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

On Sun, 16 Aug 2026 14:36:36 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> rockchip,rv1106-saradc was folded into the fallback enum together
> with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc.
> The two IP blocks are not equivalent, though: per the RV1106 TRM v0.3,
> chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resolution,
> versus 8 channels at 12-bit on RK3588. Documenting it as falling back
> to rk3588-saradc allows device trees that would bind against the wrong
> channel table and report an incorrect voltage scale.
> 
> Remove rockchip,rv1106-saradc from the RK3588 fallback enum and give
> it its own standalone compatible entry, matching the dedicated match
> table entry added by the driver patch.
> 
> Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible")
> Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---

Looking at the link provided, it seems that there should be a Suggested-by
tag for Jonathan?

Otherwise LGTM

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

