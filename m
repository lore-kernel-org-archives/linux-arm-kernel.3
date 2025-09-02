Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1434CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=; b=l7aZfnNW8MqcF36h+GwxGpqLxg
	R4mjtTuKZ+nsiCzkEUyRGL2XlhGgQCY3hj0L+U111JbX83tkDD4CGXbXwTIRwM7DzMN8ibzOngcau
	U8cTtWYvPNZ7ZrpapS8LMr/zrSa47tWwk6Ta+hcG3nJk+YNZQUvHLXfwrJC6ZebMFdkq+JT3NSQSW
	oMdzbu+G/tuQd93XGE4vpg6Tow53CK5Stq5SpesTRrspmV7orF1p//m1IC/QOSKwK8cFmFJiANfCL
	nNLinwDJsqx1Qi4TX0Icm8OZ0OEbWXcnsz0vJDTKHJr8XvaovzNaYBDrzVUljhyFyjiHKenbUvgdi
	d17pIdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcj3-000000038rM-0s7t;
	Wed, 03 Sep 2025 01:55:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utarF-00000002gkx-3Kpg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 23:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756857372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
	b=G/388lof8fZLNVbXRDZbgd5wCnXJVEwFl6QbHUnWykNYnFbQea0l1KDf2vDuyPzDRKGn38
	7ghgpFs1Zd2yhTWMltM9fzF8WdIaa4cIN6RnNqvoiFoJdIr74ZueZzBUPBErp2A47+vx+H
	viL24FWuXtfTxr8QWduiUO6LUXxg4Ec=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-renFY7ljO3CODO0d7vQiyA-1; Tue, 02 Sep 2025 19:56:11 -0400
X-MC-Unique: renFY7ljO3CODO0d7vQiyA-1
X-Mimecast-MFC-AGG-ID: renFY7ljO3CODO0d7vQiyA_1756857371
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ddadde46bso104197546d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 16:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756857371; x=1757462171;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1ZYHDqv025lJgwhhRN8DEjjxbXljdscTG4+1iteT+E=;
        b=JdUB32F4GczcsDFWU0bus6KnTr9nobeHjm1S2GXVPCozhpcz1Pd8VYaICxk7jtU2cr
         S6dFPaoviTckOY1P/TRdfbDJICMkzUiJqbcVSM6fNLxrJvH6/EPfVs8tQjP4lMniLTad
         CYye6AoNlC1htonAPwE0w3MxgWqX+8M03KH9u+2L12xWgT+ERrQW5N+o9wbFdguOaFqf
         KtQpjzsEANaiKCcu+agXBMH68byTJbli76kyH8lxy5NOVdCPGsRe95SvHDo4vhvQBvdT
         jw+6211vA4ELeZoZlRn//d/Ze/FS2KwgGKxZNpu4jT4owhyJe5OQdFXYIBgDT3BtS9nC
         GqYw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWaiYsiTlP3nKu87qPdszWmfR61s03K9xGmKA6ucRCxIKKpSVKodyMuD7ezOZMmJmmIWCSikFq3tFnRC3aNa0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj6q+t6oNDZ7PZkxbySBeNIRuJ6ma3JU7W9Lf+6WuS8n0T1cNp
	xFXcGrEA1YXm03mlEPxMItCY8SUOR++5DKHZUTuXzKHWy7Ns5v8D4nyfKa0D6qrx9Z4UZbNQ+Wu
	bCFwbmVNuOMMMlG72jdXEDZVnPxM7CvG/MIu8l88S92OnxVPBaEr3oRjBWD1lH1OhcWFZC4I43X
	eD
X-Gm-Gg: ASbGncuhg3+vtrS/Nnxm9igJ6bJrN8xnZ/ZiPoK2Caj+sFdv+udxycWGFc7Z3+zV2hY
	s12rfZyM7PAs5V9VC0JpC47ME6zgVIxWio0RIibLWRCpvC4NiSt6YBjtz7Nq5gbQtQUwzieRLY9
	y3t+gMMYDyKRqcGdfF15Zioy2s9nx1Vmr+yrctb5Jjl7Ka1CD+UUBf1u7di/lGYKhdHj44aZmCr
	cAhOEGTWeUQVTrz9ywx8PV/TDepaQ6af736neZPG1RLRQcWNI7Z9nLgcSLxX1sBLK20IPXE6pvS
	02whzr/+3fSjWv7KYiFNyuqcEvrcZEt0WmxNdpbNB0J78p7j2ZmMmlLs
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518596d6.44.1756857371117;
        Tue, 02 Sep 2025 16:56:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB9u8oxnT7u5IixuDLd0JsqQC/w6ZeQd7EFEgifkIuiCwykZelS8Lp+UAMgPRJm62ZRJZeJA==
X-Received: by 2002:a05:6214:403:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-70fac89e1acmr152518396d6.44.1756857370724;
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Received: from x1 ([2600:382:8106:c00:522a:3619:4560:3aa])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4666156sm19976446d6.39.2025.09.02.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:56:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 19:56:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aLeEFzXkPog_dt2B@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MF_fJ-Dpeu1xhGvVEL9e4QTSjaK9vM8vHNqKLw_DiUY_1756857371
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_165613_907297_F71BE33E 
X-CRM114-Status: GOOD (  21.46  )
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

Hi Peng,

On Mon, Sep 01, 2025 at 11:51:46AM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Stephen has also been asking for kunit tests to be added for new
functionality in the clk core. There's already one kunit test that
calls of_clk_set_defaults(). I attached a very rough draft of a patch
showing that it'd be possible to mock this up in a test with what's
already there. I set a log statement with the configuration from
device tree:

test_assigned_rate0: Spread Sprectrum Configuration: modfreq_hz=10000 spread_bp=3 method=1

You can run the kunit tests with:

./tools/testing/kunit/kunit.py run \
	--kunitconfig drivers/clk/.kunitconfig \
	--raw_output=all

Additionally, what do you think about making a dt-bindings include file
for CLK_SSC_CENTER_SPREAD + friends? Right now, the test illustrates
that we need to hardcode the number from the clk-provider.h file inside
the DTS.

Here's the patch and feel free to make it your own as you see fit.

Brian



diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..6cc3ad883b35 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -28,6 +28,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	struct clk_spread_spectrum sscs;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -83,6 +84,17 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
+					 struct clk_spread_spectrum *conf)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->sscs = *conf;
+
+	return 0;
+}
+
 static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
 {
 	if (index >= clk_hw_get_num_parents(hw))
@@ -100,18 +112,21 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_maximize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_minimize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
@@ -3192,7 +3207,13 @@ static int clk_assigned_rates_test_init(struct kunit *test)
 			consumer = of_find_compatible_node(NULL, NULL, "test,clk-consumer"));
 		of_node_put_kunit(test, consumer);
 
+		// Here's an example of a test that shows where
+		// of_clk_set_defaults() is called for the consumer.
 		KUNIT_ASSERT_EQ(test, 0, of_clk_set_defaults(consumer, false));
+		pr_crit("%s: Spread Sprectrum Configuration: modfreq_hz=%u spread_bp=%u method=%u\n",
+			clk_hw_get_name(&ctx->clk0.hw), ctx->clk0.sscs.modfreq_hz,
+			ctx->clk0.sscs.spread_bp, ctx->clk0.sscs.method);
+
 	}
 
 	return 0;
diff --git a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
index a41dca806318..a157a316a10d 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
@@ -14,5 +14,6 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <10000 3 1>;
 	};
 };


