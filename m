Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08424CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJNx6OZ4qZBVWaiEmcIuYAI1+8fMOknxmxIfY6fAGFg=; b=Ki4oTVrfyMXSzyDU+tetJ4bp2+
	BsBnzti73blb5JZkEFjppEG8GgNCAQFvEJBVF4OaiPemx0/4242tJWL1crwhpmU2JS37+GYNaajJZ
	sGGSUrz5REYdQ6G0hpdNJo1OXBweE9v4BT/dq+C+jmkKTe8T9vJU75BzZWViGI2O7FW72yhjqS+hZ
	sKyX2IXj+Y3gcqFo9U6ivy4JKj5K8H49ptpwVbI7MouSp1Ws9zsn6M4D5KXNZP1JXmp6cxhXlpL1J
	QoZ9CaoaXjgZwXWRi28eC5CR94rN46jtYQP/ZzNX+OZiZBQ5fZYFbJzzXQwYV0/BHbHPkBSexfDG6
	SDZsZQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvkb-00000007JvA-3rhH;
	Fri, 29 May 2026 11:51:41 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvkY-00000007Jud-35TE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:51:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7D53A7A0028;
	Fri, 29 May 2026 07:51:37 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 29 May 2026 07:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780055497;
	 x=1780141897; bh=VJNx6OZ4qZBVWaiEmcIuYAI1+8fMOknxmxIfY6fAGFg=; b=
	JzK94IfB/Wj10ilbbVhYyhyh9svTwvL/VPr3axqhWsorZkpSNRM2+QRX/L4RHXnY
	WX4A7v74zlzegKv6QOTtrfG9VI7wVPe45ga33NZT3YLkSwtC303gvPEcFAlu1AOH
	dA0omNNhAu0Bg0mdG2/X5RuVEPcsOMXvZ3Ujm0sS/HuqE07h+I16hBDy3QD2KRT+
	Cpe7aSk9JriUzRppyDjy+AZJMGy5weXplGNN3KFGGrS50JFvGB61hnFPoSN6ijUi
	QNpbD9UXz6cCXpUAqvnoO3TDvcGIbCDzj3xWCI7mzoP54Tl7iL6kHfTD3f/D8Omr
	88w6QNFzfZuiUpTFJb0xcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780055497; x=
	1780141897; bh=VJNx6OZ4qZBVWaiEmcIuYAI1+8fMOknxmxIfY6fAGFg=; b=A
	AgeHqn/mT2xRwfZvf2CvM0agLuin4YDkYfsrm8uVAP7ZURkUawQ9kvW77bnK+M2U
	kL0S9/2aNyI6iz+Dfl/oS7OVW36f2FppG8153X8tmjd1z5GDEIS5zdpfa5iuYVsy
	O3O7O1mLn68xX0LkWM2zHgF5jlLKOa40pZCQCQHxgMjWENOhO2MiLKaAmKcupIqc
	SWnwUM6gZ4oL6G2JkZxtC5HQNanPLcUe+mTrWhp5OIeb0uwxnHSz9ZUCvG9qGPwm
	BWcB4FB/pzRXp1tRpMlxwSQQUrgUaIUW0vg2SEDP2ECKABceE/qUthlHvCj7gEev
	cGhvTV8phi4gHij9NmJPQ==
X-ME-Sender: <xms:yH0Zaj8uzgIzXsHnbL_ATZ5ydyrMo5b5lh3Z9NY0dN-6V0rerAoplw>
    <xme:yH0Zaqge-Y4QFanlxyEuqkgMsXcTY1q59SrWXcDZnZnZEae4_RfPidGw1-xkaqHYS
    ZBgE1p6977fZ6NCM2kE0mYejl0-x07L8U4sGL4TTxTnrw73b783efW8>
X-ME-Proxy-Cause: dmFkZTEOqfAht6jnJ7IgGiG0XvEGJZLrz8NegVe6R6sYgAFlTHHQVyPuWoyw17obntFV/+
    JmXJgEYHjgkibZCJ3+Lxg/l7rjD8gUZpJosfJIv2nMg/x0ge5U097tsebjyuIJe3bGxiPt
    ob1c8Tc0E0aIaXn1TH4lpk3//a0mUJ+z0lwRi6lNpFNk1JURc1+o91yU92cMKqagvpKJq1
    RlO1gTD7nZ/gTae1UAMc+mGNZ6dWY6tkzi2hIgcl1fAn6qJ7ffNfaqGRONEtfKrtV7eUy7
    VPw7PmE7O55ed1lxy/8OtG2qGdbfhGQycj5WR/YxPPYDQ4JFQbIqGpYmJ9jJyTguvR/gdu
    mIE/Uch51YcAo1S5P4axzLZRCcjPgXR92Gr1fil61GXfMu/fXufYxYn+pGJFZj6MB90uKJ
    xGfug2+8VuuV7xOsTqg/+58nRcvzWX0Zl4nS2XHksErSIiWj7eGmE4NbeHP1gaolwfDDO+
    bmHuJZIyhbeXCPvk4rBk48v5mZYyml7Y16Uqlrg3rZCzxG+gGqtOQbm8/X1d5tDvGJTnEW
    kUtLXJYyGErkcG5ZJi80Rjsn2ZjPjv/4RUSnh3CuOP70vs6Fju7IB7TfXp6+gYfomFtk3B
    S+3kn46kdRUSDQWZTfNaKryDwEhgoZx2u+Q2vwoheIEguHS2TpknAZqNeFlg
X-ME-Proxy: <xmx:yH0ZahgeYq8R-edrkhDq75gq7jWpnYFls4am1DCKfraYjD9OGctSgg>
    <xmx:yH0ZanmdnpRwmATw7IAFYwYHkravIieLfbDHU1eLT9vfb0PgKl3eoQ>
    <xmx:yH0ZagVZGimS9jIenqF9JaS_UQDt16a9zE2VWBFC8e1FC_LqJNJZnQ>
    <xmx:yH0Zass2zb3P8Sm1Y7I4U6iINRCSKiEYJDWufocHPZoFkKku8LT1hQ>
    <xmx:yX0ZaqgNVdvIz2tJ-dWpbNBH2490ByKefS_2Nf_7mTDo_hZljemtSjpq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B37D5182007E; Fri, 29 May 2026 07:51:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIgwaTVwlN8Z
Date: Fri, 29 May 2026 13:51:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Peter Griffin" <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
Message-Id: <03dc9ccc-d819-413e-b8fd-23ccd85675ba@app.fastmail.com>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-3-43b5ee7f1674@linaro.org>
Subject: Re: [PATCH v5 3/7] firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_045138_820469_BB4A6EA5 
X-CRM114-Status: GOOD (  15.12  )
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

On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
> Sashiko identified a potential NULL pointer dereference [1].
>
> The dummy stub implementation for devm_acpm_get_by_node() returns NULL
> when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

I meant to comment on this yesterday as well.

Having stub functions like this return NULL is a common way to
define optional interfaces, where callers still work when the
feature is disabled, though this clearly does not work for
acpm because some callers have a NULL pointer dereference
when compile testing.

My preferred solution to this type of problem would be to
just remove the stub helpers and drop the ||COMPILE_TEST
from the one user that calls them, see below.

The point here is that CONFIG_EXYNOS_ACPM_PROTOCOL already
supports compile-testing itself, and all (both) drivers using
it clearly require the support, so this just simplifies
the option space without losing any build coverage.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 70a8b82a0136..198d8b621289 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -97,7 +97,7 @@ config EXYNOS_CLKOUT
 
 config EXYNOS_ACPM_CLK
 	tristate "Clock driver controlled via ACPM interface"
-	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
+	depends on EXYNOS_ACPM_PROTOCOL
 	help
 	  This driver provides support for clocks that are controlled by
 	  firmware that implements the ACPM interface.
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 83cbd425b652..c73aea30d960 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -68,22 +68,8 @@ struct acpm_handle {
 
 struct device;
 
-#if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
 struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
-#else
-
-static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
-							struct device_node *np)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

