Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47793C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=; b=qrbdrfA7mhevKB2Gs86PPP6SMj
	+OW/k5S+AWv64uiPDuh1+ba9JwNvdQmXvtGl5VNn+Q3Ly1K7M7Lh1Hp6LfDIVwrhffscrEEYjku2+
	+0WfJ5DXd8hPauiqjAW73vm3dZQqQHyf9cSw/1M1a33DLFyYo/xy0Y5hfygL7EfW4npt/S9iifV08
	DI2IREhiL86wPEh+4x6ucKRpmypqZUKa7VFbYUOJnBI66gWXJO227NOHtWFWwGIoHAgaEyGoKpXIj
	PjSk3v1p7N0BCbSnVGjnS5WOOklFtt0nvuU7xfhKlOlZpiSAUTFUP5mLy/FCySgrNY8wBhxDyBxjq
	2UWM9+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKm5-0000000554e-2E0x;
	Thu, 02 Jul 2026 17:00:29 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKm2-0000000553s-470C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:00:28 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8f2509d6becso20341866d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783011625; x=1783616425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=dHURvGGs37cUzw8hk0TkF5bI0U2M0v2NlAZ0dcWvGqAaYMQwaWjvkjKYjjgdbGky+b
         php+wHJ8FF3LvwpifSQJ7t9BEzn6++TQiN/qySHiTbHz/E5tnP8ZcV8RrqqxkhNPBEgT
         FHPAcCI25nGz1K9NII9ljudDBAV7iylHNIS3DxQUTtWyGSpbTUSmfwX5/5tG8ym2Z/oN
         9p7ycx1FK+cope+LZZzh1jIc3ujnrGzxOXUYpmBOtpgyyYgiCQlNCqih/HyLWl+PuWij
         /PDjZE+fcSY9dr6n1zf1EQPHalJT3rzGp+lNsSkDuRfVXTF/aK+5I9ykUjZbKBQslUCi
         u0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011625; x=1783616425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=g0ciIH6y+9EhEyxWavxu/R6ID3+ZLcHgkDLwbp9hy9g7rnUwTyhXG9pXlJRS0Q79mR
         4JYqp7wXakn4lWjxqKogscfgEd0db+xNkANDPylDV4r6Imon+vE0doDv/IJF5mPuVqEg
         jIBDYJHL9eL7yjLdo/3co+ExqBB4xfg3wjGo8hoStOleF6LiKZpc/T5nZTPmtd4DWH2I
         KXXbWBuKElPKTXQIMw9WOSsz5GkQ3p9TYdBA6AM4S9/YPHaSHGHc+6oQDwh9u9AzYDg1
         N/+bUiOwHx4wsnKhYyX92mvPgdVWwc7scyIM7ciwmi93vxh8gGXys/8cE65/LCZB4bno
         7gXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7PTHRGhlmJnpFjaNvOORxx5MCM6R0apx+9XnNKfei/f09F2nb814NgBh8EmCnmFFyMUsO+18Rr7HLvpaNF3LJ@lists.infradead.org
X-Gm-Message-State: AOJu0YycqTVqUx0OwFi+Sv6fKdxCynClGwHd4hJAoMCDGo62Y5TJwx9y
	xfXO5SwHEMbA4Re5KbrGSyEO5jgt4Qx1U/Z+p6Mowus/yMDFyaHJ2c7/
X-Gm-Gg: AfdE7cm/NomGxjxAd5V1iTF67RfcLXGTcS+Yvmu0TaLeRCTR3UJQPWkDP2SDxVEqDtR
	4yh32LK67Ccmu0IpxTYceZ6aVouqhmAd4jFHeK3lixjEU4kAdGUFKVk9ILhQbJGAaeQ9fp79zUE
	qfVv88Ng8EG0CR7YhJjaio0FoCM7JbDfL1UfOieLHyrGvkyZ0bixSHdhEiIXYbfL3/F05L7TltL
	ExUB0jfETu5EDh3ODaK+Nli3hxoCpm9aAhj2hr5TD7Eq5KjC1mzY8WekJWMfE62uMq/YCbwuOY0
	nfC/QIcu/1/S3t+sH7Ug1S0L0q5He/XjPSCBHJBfSusnZBpaHKkeSFIAHb5sZS4kOwHA9Sb59BS
	xjdXVG5mU3nBxIm6Y0+m6DmP0knPa9SUOr4QOFEAUDbC0+CaYjou6ysDAVuSMIFWUd7aa/CLbTM
	rL75ra5H4xu71jdtCRww+3KJ1wSrSQPc2Kw8F+ZnkKk9S5FECqWsD/ReF8UomP
X-Received: by 2002:a05:6214:2d46:b0:8f2:8b5e:3b98 with SMTP id 6a1803df08f44-8f3c63d68e9mr104833466d6.9.1783011625104;
        Thu, 02 Jul 2026 10:00:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm30106746d6.21.2026.07.02.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:00:24 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Thu,  2 Jul 2026 12:59:44 -0400
Message-ID: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100027_044327_1A0136BA 
X-CRM114-Status: UNSURE (   8.58  )
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

Hi Junhui,

Register check for the PRCM driver against the public A733 User Manual
V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
offsets and bit positions. No discrepancies found in this patch.

For what it's worth, we have also exercised the R-domain at runtime on a
Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
misbehavior attributable to the PRCM model.

Thanks,
Enzo

