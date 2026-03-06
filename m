Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6145F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tt65nlyH2+056MIjJR2mDSU6Xjc3S4OPgUVzwFjh2sg=; b=H7l91jnezSJ5BrlmzAVEG4spjB
	zSmL8g4T3/P12c9GC5mCJBh8VeED8EribBJVtYDYDt+pHao1hmHsglQlgIzffaET7cbF8i2RlY8d3
	zk5+8CXLRZ0IA0cPYSIUdqrA7QQBOn35gWRSz5LGdaH0fVd51Wdn+SVFNwkyxM+oiuOlkZewhBlkB
	AtzLS9nnIiaOS8wODn6/r3ebZ1+p8mZ1X6d8Ra0SgjEdHNrRy7FnWLNAqLr5df+OrHNZQZ/pKboJk
	9LjRbjvVfjavog/7zwm4OXs1bb4vRsYp97kyu/E4kqePA/u4Ipq5aC1yGJY4hsT6cdz+tFRhrs8NP
	7bk2hRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf9-00000002ocD-1klA;
	Fri, 06 Mar 2026 01:07:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf3-00000002oZu-2K0O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:07:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ab232cc803so40880555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 17:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772759245; x=1773364045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt65nlyH2+056MIjJR2mDSU6Xjc3S4OPgUVzwFjh2sg=;
        b=URvPaovy9vQSZzTdP3Sj9iFhZq2z/kzHEAuIRlUzzqMWR7gTXfTsgKVUwdPhb1HMcr
         sMjyZp5czaVWVR21NHwgj6RtEAzWvRpKa6WXbLjpbd6P0KumZ6W8NHMrBrEbw/9I/kvh
         87zML3m3944F9YljCXWbBilqHp4aQKa/p31pbw+P1SN/e6Dow7zFdbZixCHDHNpoVFt9
         MTLmi1oFslUr14qbwRdjyom9pgEGopo5JX6+Z0AGSrPl/JGA+XBn1P0xuRptCX8ClakQ
         p+xI5xjadGYpBgHrULA+LIldl8rg4YaFOYq2YjvK6VjuW0+55wLEPCJZx9dizLCRQFzT
         0mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759245; x=1773364045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tt65nlyH2+056MIjJR2mDSU6Xjc3S4OPgUVzwFjh2sg=;
        b=NLgVNjS5f37gxeGu1HIkg61FZA/7C9ADBumbBRHt6TSRI9DysN5Vvqmz0G6ybvmLyE
         HxwPC8Vp2kYdNTb3dDrk1pguo2G7aycwT661jfOo3wt5LIVjhlgQatS+FyUcxMTZFFC1
         vU1W89hcE3IClviprpUGAGE/hmYtiZqduFmJ8Z90zRAUeEjMWLUoUnwdEbfE+cwAdwfD
         GLYVqEaBLpL65mm7nW11OAWDKuWgdcSulKRKeMoZBDiFVrySZ3WEI3+2zK2ccTF5Uh4c
         cMWct1LJzI2h0xPoqwO9Z6TLm3HwEF3ZM/ll2twLspXOQtvkwV65thlLyHbERc7waqml
         xlGA==
X-Forwarded-Encrypted: i=1; AJvYcCVQcXFZcFnSvpDfnNR38ex13NzyPR0k6dFlB6oy/PoaGvWir7pmMcMPPcW2XW78lglgPJXSWMCnLWlNQ0NYPhzi@lists.infradead.org
X-Gm-Message-State: AOJu0YxggFEGMP8vdHmZhfVPzXsbO+jNtuzTEUvHjibmU7KMqKZo1Lvp
	oSHvMV16XA2cE9coBdGBxzcN4WV0Va3pq/avvRzB+54L9iOzNxRd1UV4MyAxyLTRPh0=
X-Gm-Gg: ATEYQzxECgDvlB+0HSdCF/6psXlbn9+48DfeAz2C9OBMjNv0gEaIbbDnptEqfkHTnGU
	7nZiKH07QY3xAbX5/TANNhArSqY6LxDhvkKlfetkgWzmX9wfktJHgEYS9g8q+wMf1YWn1pv6cWg
	YS1R1tqpqbKjXsRsr/CHsCXGeNc00uXy0cY+ewCWLXQbMQWrgWLPTnzasFWjmyiPYREGNivNLuL
	91uMDbbVZsxhRCps3CLpctLjqqxrcy8brF10OjidES28nH4pGEeLq/bQmLvKum6M6DzzWlNn58g
	5iilvUz5eiXM0L9eKU6S+zYHoAArYdP1kGAqNxdOSjhqVQsnRTSdfP9Wk5CbUOFnRSNFiKjbxKq
	fSK1+5bLYTW55gZRiLavlpXyg9jkrq3e6dh8XWQNeqC0ayhSFvlVzrtIHRDSD7ZfnC7PuoK0Nq0
	0Qqfvw7f95rXnnxRaFftHw
X-Received: by 2002:a17:902:e80b:b0:2ae:54b2:27d1 with SMTP id d9443c01a7336-2ae82467157mr4766475ad.44.1772759244771;
        Thu, 05 Mar 2026 17:07:24 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45e07626sm172535595ad.39.2026.03.05.17.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 17:07:24 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
Message-Id: <177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
Date: Thu, 05 Mar 2026 17:07:23 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_170725_848966_E50BCD50 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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


On Mon, 16 Feb 2026 17:55:52 +0100, Kory Maincent (TI) wrote:
> Allow overlays to be applied to am335x BeagleBoard boards. This adds
> around ~40% to the total size of the DTB files on average.
> 
> 

Applied, thanks!

[1/3] ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      commit: 18161bb01ede109fed41c66efa2624a4c27377f7

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


