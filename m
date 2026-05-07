Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7BFCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=uAYFIZxxqwLFK9KX9fePnVlakU
	bks+Pci6CgilgRm4ORh48b3GInYryZT/f3xbpcsvsbWfYicheFiA8+rM8WLqZG2cHpV3fE0Fh0MvZ
	MDSiFNzndCyzyV1NKGCQkpHpzO2BBWsq638p4e1GyWYVIpJuBxyklvUn04a5dF1u/sQQl/WhrJEUO
	lPvVmTYXAYMxqcIutPCtY7sCf5rehtws1NZ9fOch/JY9dUsPN2P8GcDHXEsu0xm7wfh2MimiUDe+m
	ai1qfQ+/8ojkfho8gq4EqDy4n4qUdkhwMcPLKsEW9t9QyTR17jTjynu7Qfzx4zos++f50wg50utDy
	P2ZW7c0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEe-000000032Bx-2e3p;
	Thu, 07 May 2026 07:33:28 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEc-000000032Aj-46xk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:33:27 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 435B9EC00CE;
	Thu,  7 May 2026 03:33:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 07 May 2026 03:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778139206;
	 x=1778225606; bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=
	mQYNSi8FbVElXwCtBag/AxoCT5bz9DO00U0OfJ5CZsvI64kYjDMs75DD5PsEb8zS
	7CKzwpvsFM3nWTHHVsh+QzcoVo9IVEw7O6osZJVpK5s3mp+edWa6Q9cbweylJGs/
	RFQ5VVf8fVDjtbWyN58vC4l880AZXyq/J7t4+ZyMq3ImaxH1gXGrKQLXA64rZLgo
	zOenhd8UqfTA553IDUqHmQLQCD3FtpcI5bd0ZGck60HIc7Gcw/pbfA3u8NFDGX9w
	GQOF483E2mJV0PhlZXdC1//G7YqMvsVxX1WfxAGaCM51RRbvGAqTbHFQOTtBc1vr
	/mC8XZEB1veV0wQF8pAvWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778139206; x=
	1778225606; bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=Y
	fjXnRhTXsWGJtFtou/Q7mIxrIzgjPu/MK6mZGX5gP5Uw8Y8Ln1F6y0f75q1YuMJ4
	clybjoG4lvvgTul/P28wxDfAoLmE07oO5CioFGL4Yatcy/tEIL3DrBb7Ii9vo34D
	OdgA9ggcLLGNzfTd+l6U2W6VjlCRQ7eEKy+Lqp5/c0dadAi0G9bx7n0o/hkZwJ2X
	0eIfpLLj7Hf48l/KX7zZsdq88tSLMFJf1mg9KsFTx/gHgBl+7rWGzhL+/5XnncFR
	X7oK/lQACXteKpUPvT5DzChfGEWjHoY1F3m5uQRDIOSN1wb1jAEBb8K1IQEOYcLG
	+fjnLYlmLn+OJYkPvT/Xw==
X-ME-Sender: <xms:RUD8aVN1hVM2vFgKP5I6-GNSokrmaZED2pTRNft8h_IFEoqD_FKJNA>
    <xme:RUD8ac1dkRZt9nTekcSyOgMhAdXuXFajFAvH_2cCuyaVUfLMwMipWebPZ88p45Ba7
    MDDaXRm9Xd0Zgtc5Pf6XIvTbCPlsbGqghQFWkrq5ZFgTno1J5D8ZORH>
X-ME-Received: <xmr:RUD8ac1mc6hUu88LsP3NnQVKnq9k2_8v1iz6QzMtuzz9KfqO6L7FO2CdzeFNAB1Dt8IQ4Xdjkxoa7eHltERGTGCtOQi-V0FpdrU0ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeikeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhv
    vghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepuhhklhgv
    ihhnvghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrd
    hlihhnuhigrdguvghv
X-ME-Proxy: <xmx:RUD8aS9Cfs6o150MLaPjLgtpgHJLpIKjdf8pQGMkShi0WMNLF4ahCg>
    <xmx:RUD8aQZPoCkzurQbeR5G2Mue2NfWFkKl_vc_2nqAA_DTqqJsXTNRyg>
    <xmx:RUD8aZzzOyFdMCPVKckx6rx3knJ8flClSoIm7b0po-Gkynl6QAmr2A>
    <xmx:RUD8aW-aoFokf9gloLNDr7BmKDwVf6fT0Lbo-pk94ZoIWSfat3hviA>
    <xmx:RkD8aZ9-qzFasEid6Fs2X3V87C1Z7Uaa04ZCSJ3wmMn0Nw_S5jqopvCm>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 03:33:25 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 07 May 2026 09:33:08 +0200
Subject: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=tqRDD38M1lfDTOrUhWfFbq/m1TiGBjjHF1HjCcLG/DA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw/DnZvPv7+uCZm4bUNF5PPFwstErzlxLaW9emmwD+XN
 wZ/0Am71lHKwiDGxSArpsiSpP2yg2F1jWJM7YMwmDmsTCBDGLg4BWAiG38xMlxkOl/Yw9zRWla6
 2apgWY/Vh9Nqx9ZK/vq7ytF7+87jQssYGXZu2OcZEz9B6NmCCT5vNtw5udjN9d/UxEOCRzXKmMK
 02HgA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_003327_312393_78D1BDD0 
X-CRM114-Status: UNSURE (   9.13  )
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

The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
"apple,t8103-wdt" used by the driver.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 05602678c070..845b5e8b5abc 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,7 +16,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-wdt
+          - enum:
+              - apple,t6020-wdt
+              - apple,t8122-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.54.0


