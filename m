Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4A4C982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Za9naEHOWE90qDwxxDpS0xl91VPuA8VV517xO2LcsZI=; b=3lwF8M6rZ/dTAIy0D8G/CLDUw7
	RRaAZBC6V5oTb2+qL2NYcTsEAR5JCtZEGCum6GS77CEEUWAG2RDPFTLQ7DouWdPpL7lGSXov9V68/
	TUdDmtWSCaYADF4L/s1T1tICHxUQkobHvqkTGx5udd8v2DL2y/hvojELhT5f2qeslsJ3WnG99U3Ii
	drLXvQAhXGRYGR3JsRJ0c7k81Fyj++bHPQW/nUSoZ4DcnYbBKsdE2P0P2/JbcltL+g00wxQVtnU/I
	vleoYvlI0qA56B+2346SRnnlrqAwBuRZ2oi/8oZ9VxjtxJopItg19hTWkOnuAt+baBIn6cgeACkMZ
	VcwCVO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUa-0000000BRQM-1q1G;
	Thu, 17 Sep 2026 13:49:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CUP-0000000BRJ0-1twO;
	Thu, 17 Sep 2026 13:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789652962;
	bh=R+0ORjkMahdOCQPNUtjC94W9dr82Rbx5na9hVn3u/Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G/4NqSBOfGgULBF4gDeB4Y73jKgWBtHyCvlOVnyWEaPREAGjUYQ1UtWk8zCXpKMI9
	 roQ02NIDWO8cT5Q33R17Vvz1D1oBCMOif7o5pNJhimbeaY35xqYbPnk1Fh48zQzJ5s
	 R72eU0IclAgiSobRoQZ0lAoV9hyidMqzk3ICxDm0X2kjhASpbqSNGRrj7aTmCDXx0R
	 6cVRd3aaxPBVk6FepSjY8oBeJhHfUGyF9k3JxA51eJH/k47U2rYyLt0FoeIx8ZECDz
	 eYcdrAnfzNfUsa+FoN9Vs0SSnfPBQZtUyILlut9NycPVDFDjIpG4KHdz4d/XAlOpAX
	 4PQKJl6s3Wl6Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C898A17E0C7E;
	Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7F89E480031; Thu, 17 Sep 2026 15:49:21 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Sep 2026 15:49:16 +0200
Subject: [PATCH 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rockchip-dfi-cleanup-v1-4-4f00a97a69a6@collabora.com>
References: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
In-Reply-To: <20260917-rockchip-dfi-cleanup-v1-0-4f00a97a69a6@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tS8n9fy0LBJivuuQhw0+orcBEclVJquJmZ0El2PFwMU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqr7+FtYWVZhqL58bgqY/9AAoAVrODLk/2bk
 /G12vDhTY+kGIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqq+/hAAoJENju1/PI
 O/qaQvcP/2ts/3qzSSPMQStKfeSOQqsfgNzziQqNcGI0S5KntolvAXoYDfkvsfwy8Jy5ClGTjMA
 5SKjGmVdDk1mPtm+I+K1+VsmsQ6CzAyW9+HW24itXgkBcjkc2W+eM7MjXxz8fyQr2jhWaJTHZSq
 CT3EIyYisTO1wvrUCtzRokHvsUlehB23uDk4ireeq7XaI3Q1QVKdsWTWhiaGmfdGJXpHC7oZn6f
 ek4J8J+INfYt+icxfNDiPpUS+mPjTYwoGeSpZ46Rv/5mcySSZJh5lBcrmm/UjheYd5tYSqdVi7E
 k1GarZzQbsHrpPQ8Ekmt9Phlg2JmpJT7ju3bB5JQQktVta942gk59V1n0wdnWM16jXkjFrPDwrI
 mripyUDRu6nIVo/oM0RrsYp4nRp6uOFHIJGytaNh5J9aZeaUAFvf+Y8DYaRfQ3zy2ZQvJxk386k
 DEl+ID5BF8klKmWOseyWAePwokQ/RkXEw8SdKOtYx8KjbW6M8QMj0lcAEJYVygoBrbdEnLHXoPP
 h4Nio2FwwGvFP9slvuyVQtQdXifS/JjmYq4+I2y+tg+s23s6i52/aiAnh6OBqC/nhlTca+aSih2
 mch6cCkUhpaTs+7kIFMWl8AWgoXfBZRzPn1nAPKgUg4YxI+t6uzQI/MmtbRt3NGmewKj6FrktqA
 eMLBQk1MYrFh2g8LsPgI0Ug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_064925_649401_F687900D 
X-CRM114-Status: GOOD (  18.53  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
misnomer.[1] Instead of meaning that the PMU has no interrupt, it
actually means that the PMU does support sampling. On CPU PMUs, this is
equivalent to not having an interrupt, but for uncore PMUs like the
rockchip-dfi PMU is, no meaningful sample data could ever be generated
regardless of whether or not there is an interrupt, as it is not a CPU.

Since rockchip-dfi doesn't seem to make use of the interrupt the DT
provides it with anyway, this was probably never a confusion that
existed in this case; the capability flag was likely just forgotten.

Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
capabilities member, so that the perf core knows about this limitation.

Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 5339616f7ca6..dd9edfd6a674 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -646,7 +646,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
 	seqlock_init(&dfi->count_seqlock);
 
 	pmu->module = THIS_MODULE;
-	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
+	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
 	pmu->task_ctx_nr = perf_invalid_context;
 	pmu->attr_groups = attr_groups;
 	pmu->event_init  = rockchip_ddr_perf_event_init;

-- 
2.53.0


