Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF3FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 18:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=; b=BPJdvvogswzzyt66ewpp4yzz1N
	NIPh5nFh5XnqR9CbtJU3q3g9jDp3gRDLVFsTVuyIOb83v1PBIHj/+7YUQ5liPFGvyzyi5DgNuluDF
	IIoz28SfJ/a03dgBteLo4dZnGJXapiGzlDxdzVlFWN1skzZ76cGrOzNZi5dh9TGpM9ltGB9ooxhu/
	dWAmp+nm/6wnvjrrnN/8l8bTjchUfdI+NertK4r0wmyoOns6HzK1D7R/Oh3hirXoLXSSLuu4yytfM
	7sOvRXGZDQZMZwkwL7Zj6IQ2cGNeYJYxfzSTZonpUYbtWgJ0Ue6vmKJTgBI5mL0hdZY8X/VS8f8EL
	FBnh1awQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16TZ-0000000AFu3-0Q8J;
	Mon, 31 Aug 2026 18:11:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x16TX-0000000AFtW-0Z6x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 18:11:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398e9698a70so80718a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199878; x=1788804678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=U+i0LdSUPwa/XQ6xiCbjoaUeaR7wPcSP7nTBRn7eaqE1mE75nIUyPGUj19PUxUW3gM
         wUuIbmq1IF1nBY0IyOKiG0b+VFzOEkvpyuu3P9N1fZPJ5cTOEMk49hWAJJ7yr9ZkKV34
         zkuJVTYy5+0ke1rbouWN57x78+8o27FkvOMbmtxRE7h22jFXS34TGr6SCxGdNrRt6lMz
         cxnHELLIm7P8Yl1NgaqBazWFfF6Syv4qoUhFHoOW9trrtPRpJNMpw1kZwzA0KTGISCjs
         UdoDu/qpbizBUGj2UhnBx7s/ADlZgr2E/ThykK062Rb/DqOi6ewGHgbF9txzmn7dWtt0
         Cheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199878; x=1788804678;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=buUNJTqGKdVHQKwNCjAT/OFYj+bDbzj3iofIZrSoqSJpXKLJYHDcupXASeCzTnhubi
         dm5ms8QFSOImfUvQA4/9dq6OZutgt8AtQdLMaXOLoOf4fik18cbyxfb0WfnDDPVWqjHj
         2t4Z1kySXK8zyUkkeom8OsQ/KrO+w0nUizRcVWn0pP1h1O0pnog6HlIvXxhB6rFdiPjB
         aIg+lqAS0WOQpvInyTDL9llzHXRpwlAhcCNMkmUZIwhTgPZQdUaPEXQqobT2HwfrbIOm
         jaDPg+bk6vYKFhj74P2exXGSyqfnSJzz4QTdksoGnnrxUekYTpaVx7AB5uezjJrktUwR
         fIwg==
X-Gm-Message-State: AFuF++m5YRJg+mda0bauQGZ11YzaUJ4+mtnYyICPVDCzuJF20ouhbX3I
	TwYfkZhD747RCBdJme6sfoiMT9EjYoTswe6IZuessCPQWtBbgNxXCCD4qba9CWa0uHc=
X-Gm-Gg: AYBFou1++2d9IbdpufP3NQughmDits4Q1lzuiupob7rwQxlpIY6KXmRadUZ5MSVxVQO
	KZaSdNZcijfVK9gRlTYBYuApd2XrO4ZJMTqG5RsIsMWu/Nw3LygNz0Q6bF4VzqnUHWw8cOWGaL0
	lwLJHs9HfTIBaIg3RqKApD8hJaYmqzFwFKqhd0TqNUUE+MZW8TBSr7E9z1lOPPodDKfv0VuGs1T
	YMMg4UIca1kmpisZWgQPp/VLYs2G+2pdbGGBYR9N17nMozZPhaKclhFaXFU9T1+FBgz0W4ju8in
	QqzooKHofGxfc5O9crL4pEmq3Kq/o/yGTn5uJrPf+H+opUGEaKiCjnr6raCvUTAguf7qJb+85Ea
	vmIo+sVJw4HYX94yvtxZAwzw18Mfca8ANJxLHlka2C8ar3F/TCouF8qWDL118WlwqxEsuDuq3gt
	6uw4Bnel8QNwMQajUp57iZggUerh73V/8+0tAY7v9hAhmrqimL83ul6ShBKg==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-396d0f69d10mr34762737a91.13.1788199877917;
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990baaeec3sm863336a91.0.2026.08.31.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, Roger Quadros <rogerq@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in
 camera sensor nodes
Message-Id: <178819987707.2869653.6455595386601883422.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_111119_184676_95FACA8F 
X-CRM114-Status: GOOD (  13.84  )
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


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
> 
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
> 
> [...]

Applied, thanks!

[3/7] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      commit: e74a8fe7c2d85e314ead77064ea671b71de44b14
[4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      commit: 3da3c1f84d4f1d14d321ffbec742d4027b503827
[5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
      commit: e59ab4d7eaed22ba714c57801262a09ac1c32100

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


