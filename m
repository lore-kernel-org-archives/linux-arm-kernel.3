Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F10EE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FbO7EqdF+KVmZQo9uR+0FgHo+CoXl6nilB68rvFnOsI=; b=BgcUR+OLLBOflDmovCFvyirptx
	c2yVlvfSJiA6oYsNDaA5ipa5Fu1vEoVX8kAKzU0vcLBl3XTuq5MIdew3OchX/hBnXk7zz2w5B4Tl6
	WWeEGb+hUf4F2ty3itanvv0Z5nCyqy/TIgDzuxwhFv06aWT3QqhD25kZKu67yjCkc2WwGXiKgM2J2
	nTQ9Kf4DvF+rp44ravfvc77jVPAp+NELg5lkiBvschAnz1I7aMRyxy0KsGYB2HnDo4aVLygc7OdCX
	helQIZi1ENKCVmlNufCYrBUAdHXhxerOz+5qRMVA4EUWRvyE9HIv/kxBEEXvIY5PNBJnhMjSVejNB
	haOB5vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauzD-00000005wS6-2QhF;
	Wed, 31 Dec 2025 12:07:31 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauz9-00000005wRn-3jyH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:07:29 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D98931D000C0;
	Wed, 31 Dec 2025 07:07:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 31 Dec 2025 07:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767182845; x=1767269245; bh=Fb
	O7EqdF+KVmZQo9uR+0FgHo+CoXl6nilB68rvFnOsI=; b=mD/YrANfYLsIAQqnQl
	rhCEnVLiXv9wKHIZlkYTOTqbFzwBNcyio+aurNwg/XTVqD32ncrVzvAf9R93IG9V
	pdWQzu/aIaA8Wg7vsW2v+ztsc3g7ByJyo4jBxRe/r8UOleewDk45HXF/tQTNWXy4
	jb00tFpn4KGr9N6qDdT3+5cGUdlks70lyN1jMtkYRSULVuT4Vk3XGca9qAzTzXMT
	sTpbEYpa0A5UdSMrRmNeufcxBKM2L8tMd9X6S0XOGOoTsxkLYv4tiwu+JYSzRb6N
	loiVc749eq1pXDRegfovwmu6ghtJ/ww4Ng0lt1BByRPu26VgQlIAZX8rpeDRygn3
	/5ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767182845; x=1767269245; bh=FbO7EqdF+KVmZQo9uR+0FgHo+CoX
	l6nilB68rvFnOsI=; b=HGmxJZSLdw/MQI5YPN/Vrxb7Yoiwed9Ekpvxi6tgSE3b
	EPcylqhimUNshocMxw4AP+58qrxAJeZ1vwz6OhGuciQtBphTtRymf5hen7E5fIHw
	x8MmSzcnvnE3YcqnjhT3GMj5XVdPQDWMI91o3afbwiS/SilDXPTQIYYn4GdwN8z+
	NgBE8e9Gh/L5ta3ULs+1b2ZRjNNik2bAd9xMgX7xUNdQG+3dy2sX2OuFK4tzPQ1l
	gGPDRVeYd5oBXg7c50yhWpmhIVDXTwcgeAVSUMs2ryoxiLbzJ005aBZehWpS4An8
	wAzX+sz15K3uefRB0ncKHGwmr4hBhb7TzqNSTYr8+g==
X-ME-Sender: <xms:_BFVaTtmxPPOGQNyCcksu1fYnBg8Kq9mLJl58goTtGnnj4Dh1b2PbQ>
    <xme:_BFVaSsPVQkrZmM3_FBsmCRUR-dTKpmSYJTvY5GYyNzla41qLlLwjmL2k_KYQJOJ1
    Vfen8BrtwgvSobkUdk5JjETmhozSf67FbyJWVouzhr5QK2oTtOOkE8>
X-ME-Received: <xmr:_BFVaQFbyqEtG_GqWjak7TqhUoE42N-kLQJcAyr0a0JqBwu1Vqc5X_q5oDbE5lAyojpgGQ9_6xeCjRNA0_rOQXPkEwJ7cwao76Deeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedutddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdgu
    vghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehsvhgvnheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:_BFVaVN4vGpo9hJisRHtaVo7IgHFf2QtqlV9MnHDIbOXKH0fPBp31A>
    <xmx:_BFVaXLoqHwAMnyWik9jY9smiK1DQXQOJ6iCBv7PJoUQA7d4PuxNYg>
    <xmx:_BFVaW_PCreJWFbWEBARUnEUYNNxsCwlqY9GchEIgbak-gRDu6ILvw>
    <xmx:_BFVabFFneqBzUcuP4F5JiaVX-g9K4eWQrvksTSvKDCCukHgh8q2Pw>
    <xmx:_RFVaXg0bTOtf_NW1Hksq7VIbvnRGPeqGj4AxPCd8YlCswgRlDU7dHuf>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 07:07:24 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:07:21 +0100
Subject: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
X-B4-Tracking: v=1; b=H4sIAPgRVWkC/x3NQQqDMBBA0avIrB1wEpTUq4iLMU51oDUhCW1Bv
 HuDy7f5/4QsSSXD2JyQ5KNZw1FBbQN+52MT1LUaTGd6Mpbwy8Xva9iQY3wJFkedxYWzoA/vyAU
 dD8bKw1laBqiZmOSpv3sxzdf1B4pYdBtyAAAA
X-Change-ID: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=vjl+69Y7fxj8I0QaXAqrOw68C+ZGqOU22KG/HJFgJ/w=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQwd/F71fsMdP4t1plzf2X8jnZZyvyqySz9kg+tvCP2
 v7AIu9hRwkLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkUqjP8M3oUoFi+0W3thrmn
 cvR81VUUPgn+yGTzP3arY9n1B0VMZgzfk75vzxL+IXk5JLJxAmt5xH15rqJLe5+rztq4ZHW60G9
 OAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_040728_298192_C18DCA4A 
X-CRM114-Status: UNSURE (   9.07  )
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

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,wdt" anymore [1]. Use
"apple,t8103-wdt" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
Cc: stable@vger.kernel.org
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
device trees in [2].

2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
---
 drivers/watchdog/apple_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
 
 static const struct of_device_id apple_wdt_of_match[] = {
+	{ .compatible = "apple,t8103-wdt" },
 	{ .compatible = "apple,wdt" },
 	{},
 };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6

Best regards,
-- 
Janne Grunau <j@jannau.net>


