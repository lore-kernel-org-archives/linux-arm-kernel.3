Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC2FEE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FSZm6MhpkLM0mSUX0eMusNlykEAcKztTN5uBVLJdy0w=; b=M1P9L02SQJomZRZe+gGzesB/Ns
	QqDA3RFGa/hbK9S7grnfS6UODEREMVJAJBg/TqEW7PVmufYRftzDTY/J2Bq4TLb6RxrYYTtTTpk/F
	4KmdXtBVU11BrT0zmMzsagDHjgP3ZBQ8OtuU5Vdy4S5WChA+vic93bkym0k0r9jcyMWRjMB8fkZs7
	vRt/jFMe7JaI5Yi8VObr3Slj0zxxM2At28HaCQ5V2WmT+guxOcmZ7eIAWJtIMsi0pJZ6RYGcSdsPE
	58GLmRgdufJ4g9rCjXfsOYjdfthoD3LQYhUuuxJyYfsApI/ibEERhpylx0Jyt+neAsOD8WvEamezz
	nHEwdyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavQi-00000005z2r-2gBW;
	Wed, 31 Dec 2025 12:35:56 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavQg-00000005z2M-1eYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:35:55 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 06E581D0013D;
	Wed, 31 Dec 2025 07:35:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 31 Dec 2025 07:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767184503; x=1767270903; bh=FS
	Zm6MhpkLM0mSUX0eMusNlykEAcKztTN5uBVLJdy0w=; b=Qa5CwtZmTOLCOEEEND
	5AimAkWhR7zNEJlJ/TmYOWgUULRue7+LBBKiQpDGAnILYopjlE81ueBS6ceI+Gra
	y/KofGMd3vE7WACpej+3mtFl+u2N9bSW4Cr2biS6UnA8uJRNhZzNpg6fXba54Quv
	F8f+7iXf/f7xgWPW1eG9mtzLEDeAR9Asm9QKsYI4GemxONuxVvm/GEZjjDhl9dCs
	MU+qi5XjOw3qCj4+uqcqZU8Oprz1e/TIl9VRP9KV7ZaOJ8m+4hFC5uPEE0P/Jv9B
	ZQJoSC5n4QTmEkvxHF74ihsqkPqxP1XIvdaD3ecV1oljkfEk7nt9eGB2/OU1f8Hs
	I2MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767184503; x=1767270903; bh=FSZm6MhpkLM0mSUX0eMusNlykEAc
	KztTN5uBVLJdy0w=; b=mc5MjgTH7fyRbu2MzuEFBaKCdw2dPPO2a/q7bjzB4+R+
	apCJrna+X7q1lr/ZC9voTFOwKS4hh43Vwq35OkKqwwrKOQ0jhgeQkfOETMuGKkWH
	i1QsAmoESMiQ5fVOEJ/cOt4ob01vA4W4SEGMHblH4lMhpogOKIPU43/wvpiNG57e
	HAFR/9aBJeuoSwm3E0rUClYPXrf7AhhaeIrDVsBT3s03XWMTE/KBnH4Qy4A8aHS8
	KwTRUk8BqJV9/pArh5R6mZQY/N0zWHQk2GDdNqLYiiLK+M5/OQVpYVzI8KL2MP8V
	si0CNa3IRpONcZ3+VRO5XPDkuvbMxXBLW2Bp4JKvqg==
X-ME-Sender: <xms:dxhVaVp7x6XXhphhhli_Dnc-I4PoBhTLu7Cb_4x_5zIaWAuOJy8ayQ>
    <xme:dxhVaVA52O0DHjuipYRgb7mkTc4VmZC3EeB3f9ilT8WZBzK2UqrDjwBwx3-hHh0Xo
    uNWoFYxq8j7lxbA8GV_1Ixl5WiUXdKxE74WCLBXH_uOWN_wF5tjzA>
X-ME-Received: <xmr:dxhVaZi-UJdlH8vK76SFt6794v1ZjwdRYHDJ82sQWxC0RYG62KA-vo6iCd3HuXtdaggOVItobXLqCjcGPb2AavMsNY0HbwjtfDZ9Xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeelpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprh
    gtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhn
    rghurdhnvghtpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepughmrggvnhhgihhnvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:dxhVabYffhCS2EglTd1aG-fHV1C7Lrvfy5zZu0041sgxrCTPV8KsxA>
    <xmx:dxhVaSkVayhi55PKeyHKdk5qpy-1tvKg56TnSEdgsJYvUIvHw9xGAQ>
    <xmx:dxhVaZia4QMpfw8OtW4URSMEhpevcNtF03Kh0mrM15TG2nAV3tj51g>
    <xmx:dxhVacToiw7nyZa8PtrlHQSqS3l-h6RRdinJINLgSmqvsC5aDGAjwg>
    <xmx:dxhVaVkQZgPtTqHCBGSIui1Q417Mj0Ga695xxElXjXXKZxdSL9mgFGEA>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 07:35:03 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:34:59 +0100
Subject: [PATCH] dmaengine: apple-admac: Add "apple,t8103-admac" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-apple-admac-t8103-base-compat-v1-1-ec24a3708f76@jannau.net>
X-B4-Tracking: v=1; b=H4sIAHIYVWkC/x3MwQqDMAwA0F+RnBcwKW5lvzJ2iG2mgamlFRHEf
 7d4fJd3QNFsWuDdHJB1s2LLXEGPBsIo86BosRq45Y7YEUpKf0WJkwRcPbUOeymKYZmSrEievdd
 XfHLvoB4p68/2+/98z/MCEVjLTm8AAAA=
X-Change-ID: 20251231-apple-admac-t8103-base-compat-18288e7d62b3
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=n6uWqlCqUnkkGqFubnmiCEnAuMileRggtN1Kaz1Lm/k=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQidKEl1IfGm5416vGrniUeNk08M3qXaHKz9/WdDvKL
 b+s1N3VUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCKdwowMb2sX/9uz1Syi7f+m
 1etuxRg9dzgaYDlJl29Ra15bf8NlV4Z/2tPivLxku2fGeb6+zLWqcc71fG2hpEwto5X84bUzTsg
 xAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_043554_476986_91CD89EA 
X-CRM114-Status: GOOD (  10.23  )
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
lists with the generic compatible "apple,admac" anymore [1]. Use
"apple,t8103-admac" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Cc: stable@vger.kernel.org
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
device trees in
https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net

Changes compared to the patch in that series:
- rebased onto v6.19-rc1
- added "Fixes:" and "Cc: stable" tags for handling this as fix adding a
  device id
- added Neal's Reviewed-by:
---
 drivers/dma/apple-admac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index bd49f03742912198804a02a22e38da2c21093761..04bbd774b3b444f928986c266c53becf286daeea 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -936,6 +936,7 @@ static void admac_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id admac_of_match[] = {
+	{ .compatible = "apple,t8103-admac", },
 	{ .compatible = "apple,admac", },
 	{ }
 };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-apple-admac-t8103-base-compat-18288e7d62b3

Best regards,
-- 
Janne Grunau <j@jannau.net>


