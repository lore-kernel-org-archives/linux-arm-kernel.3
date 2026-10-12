Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B0CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VogQbUFurz7GXGcstM5xSZa/4W+tRC0ptaL75OewR0=; b=k8ii9kWJSQAsde7+7WZYmztdxF
	c6XcrK+DaEYwbdPT5zgUGm4jQaweKUZksl+JmU+mq/3N4WdEEHpTSkH/vHm7taRjWEydRIG1GyRZF
	eUSh4STb1UKMJ+yOmCVh1V1pw7q+eNvIyt6CkcuRGkKhrvkPxDvBk5H4TH+IKEGKgfxkQ2ZfZduII
	EYdbv8vGnEv+5nRMSZ6sHTbR55Y/AUPocHXz/pNrJw4WN2d/jC/14rSqal6cTssEWyc43/xRuqg57
	TKqSyjTTrClMsJt6sLQBZrXQ6fi0FaaQSOXjd+OBbaEnnsYiKmn01N6Nd/NkbWy8Vv7pEnnvLY3o/
	yDPHOnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyc-0000000AAdq-20Ho;
	Mon, 12 Oct 2026 10:09:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyS-0000000AAWN-49vY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so17666375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799779; x=1792404579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VogQbUFurz7GXGcstM5xSZa/4W+tRC0ptaL75OewR0=;
        b=gCSojh5jfqwL2IJOAXcvK1NGa+3pM77VDergIYc3H+5NTrW6Cmk/AtvK6w1crAXTB0
         9GZ9EYQvmhNAj2RVPz6l3QOWclWgc0Dn1V9Oe5MBSuNB62I1o0c+nXFbP4Gi9I0lVFvM
         bymklipdbevBKaCROp7ftmkuRglebvE7zw2sugMsWA24DT+taKKUG2Gjrn/azWumak7k
         TKj8W1O/ldoA2GpZjrQnIqM+WuFy/GgILAM6KaZ6Jt2OVK19RECA+rxz5WNO8fAjOvcN
         w60I+4MRACBP7xSgf9qZyV4nl2V8d+zDJIvwUaduKjExdC6wZbJXnfz834b1kh4MkOud
         aVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799779; x=1792404579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VogQbUFurz7GXGcstM5xSZa/4W+tRC0ptaL75OewR0=;
        b=KvcDogWI5iHBXwZ8svPxy9tBz0LGsb51bSPRRJA2A6GKnLbTVfz/5YTTQa3vrYxhBG
         7OLeMqhcNwxiig+Gxd8Dgx6FgtQgwqrTsOTL+ag/rP9WJHIqXAaCoVmMFh+AsjAe3Vcc
         Gas9MskSVvwdJxWikTzw3yZz1dMEptBDK9pVqEt+NXgUXcsD9bkC4rdvWUq4sT6IxvyJ
         +Zs2rWxudmtDYlq9JRsep1AUTMJKct+FJ3lNVT881H/67SjjdvX6635Wi1qFX+NTmgX1
         S+/cEhNOVAMWbY1ta24CTE0lFw9p393mli1SgVW1jBFQIDIcLCYWmdRTnAIzQ02oVhMp
         P7PA==
X-Forwarded-Encrypted: i=1; AKwUvBzGCR/+YQUX2eVaqD9FptZS4MRQaRT/FWzZqZ76s3+7EvD9Pkj54EXx+Y7sYulKzGzibGCLQmmQ6HuClqdAWvrt@lists.infradead.org
X-Gm-Message-State: AFq9FYITz26R4KXqrL74jFotHwhanIMtZEi1IudUze6uBAlD7uwP0MkK
	a2eZXXWp3u+K9DNuuGPv3t2YFB9O+zPSgbYFZ9u/Mqo52J4Gk37jN5MV
X-Gm-Gg: AYBFou1QJIv+KfdujWuATdjzyMhUfyv9Ahh94pzG7sxN7VDQf6VibL+OmGWlb5bJ40S
	NzsTADDuObLRauNmULil9Qx6U0jfUx9b+38Qd5EiZKmIilhwsIllhffr5CTxSx7MfVaUMdsdRtu
	ssTiVPWji4zZgVbROsWK+VZJvrApy3nlDzv+5qxkPOWCn54/J7CfFAOTsIoJuGQV7S7foIxQidI
	Xd0+F5DKDeqySgWkKnjBlG8dzXdJPpAZ0NpMuCd0HmZ6fPyc6/yYWZxVBorWo1F6C8OR0u8Pvga
	F2G9COrYPAUscGiIKY3ej3F7rdejlCTFTDAD963Lc3ud/lLJSDgxMPBRAfFnb4inQewtmGWPmHF
	a8GKIRdw99BekoPxgAa9cvfVeedxsFE2bilIdzslZY5YDVAbugLlFDnVOXfsPSMOs31vUKmEeyj
	Ril6vOQM4vqVlwKrAy1A5x0iqg5rhgagqzjIzmiDyC6+el/gQ16ihBLYLXmJvEQHA3PQ+bW5n01
	lTnyK/Zx9ggA8mM4bQ8kuwJhrqHHqc5
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr161917225e9.4.1791799778944;
        Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:38 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Mon, 12 Oct 2026 11:08:11 +0100
Message-ID: <20261012100816.331033-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030941_046589_E27756DF 
X-CRM114-Status: GOOD (  13.26  )
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

The 32 kHz clocks are the same as the A23's. Only one alarm interrupt
is wired, which is all the driver uses.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..05004e80ac08 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -350,6 +350,10 @@ static void __init sun8i_a23_rtc_clk_init(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(sun8i_a23_rtc_clk, "allwinner,sun8i-a23-rtc",
 		      sun8i_a23_rtc_clk_init);
 
+/* The B288 RTC clocks are the same as the A23's */
+CLK_OF_DECLARE_DRIVER(sun8i_b288_rtc_clk, "allwinner,sun8i-b288-rtc",
+		      sun8i_a23_rtc_clk_init);
+
 static const struct sun6i_rtc_clk_data sun8i_h3_rtc_data = {
 	.rc_osc_rate = 16000000,
 	.fixed_prescaler = 32,
@@ -859,6 +863,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.52.0


