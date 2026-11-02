Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3F606D821
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RCovYiWb;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=knWLvtf5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=; b=RCovYiWbtIv4rA
	Utgjw1kO6pPzH1IxG0D1IYPLsVwUN7TeG4K259qDm6net5LxwpXBSF+2uPT7QgbL0Jp1o/Jn/JMk4
	hRz4+u/BzpEfANV8cnnfKxMcSM7crRkg25AqzEg5xts3tRShWAAC8FK0YWV1k4iaFX88cLkN3dOc9
	tZIkt/8cwlP7VuLwsuF0hbyTIV65FayLgs95G4sD5JvNKnvAj7XhK+WG0f1J4gZOD0R3Bj0TUPyZ6
	WIOgs6SfKdU36fRu3bHbX9pzXLsbXgq26AeIbJ+31hkSlMwxLH/ZMswEWNmUqWZ+OcLByvSzIL1sK
	L8iLxa6mqEMVJqGMnaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy6D-00000000DOU-2rIy;
	Mon, 02 Nov 2026 19:53:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy68-00000000DIQ-3BaI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:53:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1772800f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649219; x=1794254019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=knWLvtf5tXWdy+Bc1PR3T3M9TvycnQi7QMiuo40GyegCHQGKBP0IbtbrHuS9WFF8/6
         aJE4b5iz2kHeyWpFFYxohUOu5u5NNLOYo2gUXJlGNdca3P8AXcecUFgQgvh26DNn1iqJ
         5wt2dNwo3PKihg/NoP+ypKD+aTFWrnNPsxc+ooW/OWY74SKwI58sWo57fuC/Ehivpxqf
         7/2dCcIuup7ejnemWDP1VX4QBqVVOc79mHq+UEqz2HyW1kK7P2WSRAgByxoh1ef/xn+P
         jdnxFSBVApSu02AqX42ssWyNrcj6XVHfg4ODjLUQcgu4iEVUN0zIBQYH77m2rh0B6p1e
         3rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649219; x=1794254019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xc/z4mGViwNXCDInd4Dq6eMgtyQh/VWtUKTEtky+Fs=;
        b=LHPUxFMs0puilhNbXGP7wXLl7JjHtp65c5WwdpDG2wcSK58v/g9lW4wsSU0wjMEWWj
         uKfLhUdggV+b3KQDokqRKHDk9EAJ0Fmhl4QbSBxlGdxCeM5iYnBjr2hTP9Evu/J247Km
         AFS4mBcJ2upQoYhHQSMZGu6EBlQ/SbeYY+tIX6nO2yxCtUGD+7V+SnbU6hbLDbKHkzNs
         dl93LRIE95r2yGzhnLN7rwAGpRrWHv4rSWLiai6Mp5n1vDEttTU1B57UZ3d6VOJXo4Tn
         4RwfYzAGvYc8tXQ8YObBUquS+ZxbYbfG61zE3lvRIy+mRqJkmeimIi8mtKjqo6/SGoCh
         6vIA==
X-Forwarded-Encrypted: i=1; AKwUvByfSNcrWH0Jd/s94iw05ZxvLMJPCShjuNx8ivXCzjIx2j5YrR1Um0ZqJaykDu+ERz/mXl8tVsYpdnQ3Ri5mPams@lists.infradead.org
X-Gm-Message-State: APuU4Z8G6/kBzdq28pWGlzqhhad/4L9U1GB+4VvB52rguDqgkeaNVPGG
	NlO0N994lmOy8N4OmATIO1zeO8PrBVVjqobQPsTYkWWkI8DVKGNnQZ1N7PlENHzUJQE=
X-Gm-Gg: AYBFou3PEpGU+JNp0fMJkkbzN4pbP4N4oOjNb92tuF+CcDbb+GZ5J5WQL/Zf2Hreo3h
	9rsrpR87u76CTLtKzSoLqvyL87mymV4wFfIodl1QJ2DI1Pk9o3DwzGIzWH0GdU5LmID9oGneSLn
	UQSjwA7xZkJi2qm62DIXC/7SlvxYXgZkcB7J+T1hz/eGWFMum1hMnyws5l4jQuKnw4IYTtj/oPG
	pTKzS5utNa+XfNIMpYGkf6nASQwKYox6deSQ5ioNYj4MaG8Wkd0mpxgDnY/qy98WBiyLUw9yqC6
	YiVBkwNbjzhaLg3+H9m0Su7wi1RBUPBYaqRI7TySkOctedzN0Ba/F3yRveb8DtO4Ar7TMUGbfOa
	mLwQsRwj7YY7PPXtuGGeLEuPnmQfAWPJvB22+DhcmE34UEy1JDP6tEG/P+W9NaejwI4P1PEoKnt
	GbbckWnAqSxcxUANNasEcGopu5fpP1Ih0DOc93ykH9JKmzhSv2BKygsaglFTkTsmBIBwIOsibxD
	i+tThkDgNAwybU7y2mY2ZkaoXOh4/vJ0jwC7cQSK3M/eztccxLEgGLjob2RDbqwZATaKGdBnoUD
	mQDrzsYiV2SVq2Hoij1a84A3jdih6rNz43gqH0ptN7NfPDEc2QzRto7BvDmtTwEy7RTphsMSo+7
	BDSqle8a1l7LpdOp5+G215KAEGhI=
X-Received: by 2002:a05:6000:260d:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e6e521406mr25540676f8f.57.1793649218827;
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:54 +0100
Subject: [PATCH v3 8/9] ARM: dts: omap: dm8168-evm: Correct SD card pinmux
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-8-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2155;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=83Hmt2YYwsYCIfUczSaxPVDOXa1KO6SZNJLSBdpkV5o=;
 b=TLBdM1+sU+wTuaQpo94tDJqhnYNjg8MUQxSIk4PZnYVzOAOkVVw7lGekklx4Cq3Ehj9UD9D0n
 dl2n0uUP2tLBPCNhdpI91bIrVmPTfvcydc/9Amkd5hC+OuD442bSYeU
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115341_304766_53947975 
X-CRM114-Status: GOOD (  11.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The SD card lines use external pullups and so the internal pullups need
to be disabled so that they do not cause contention on the lines.
This bug was revealed by correcting the effective bit mask of
the pinctrl device. Use the correct macro for DM8168.

Also fix typo in comment SD_DAT2->SD_DAT3.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
[ettore.chimenti@linaro.org: squashed after fixing DM816x macros ]
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm8168-evm.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
index 81450e15b889..a6d42766a496 100644
--- a/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8168-evm.dts
@@ -45,13 +45,13 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 
 	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
-			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
-			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
-			DM816X_IOPAD(0x0a78, MUX_MODE0)			/* SD_CMD */
-			DM816X_IOPAD(0x0a7C, MUX_MODE0)			/* SD_DAT0 */
-			DM816X_IOPAD(0x0a80, MUX_MODE0)			/* SD_DAT1 */
-			DM816X_IOPAD(0x0a84, MUX_MODE0)			/* SD_DAT2 */
-			DM816X_IOPAD(0x0a88, MUX_MODE0)			/* SD_DAT2 */
+			DM816X_IOPAD(0x0a70, PULL_DIS | MUX_MODE0)	/* SD_POW */
+			DM816X_IOPAD(0x0a74, PULL_DIS | MUX_MODE0)	/* SD_CLK */
+			DM816X_IOPAD(0x0a78, PULL_DIS | MUX_MODE0)	/* SD_CMD */
+			DM816X_IOPAD(0x0a7C, PULL_DIS | MUX_MODE0)	/* SD_DAT0 */
+			DM816X_IOPAD(0x0a80, PULL_DIS | MUX_MODE0)	/* SD_DAT1 */
+			DM816X_IOPAD(0x0a84, PULL_DIS | MUX_MODE0)	/* SD_DAT2 */
+			DM816X_IOPAD(0x0a88, PULL_DIS | MUX_MODE0)	/* SD_DAT3 */
 			DM816X_IOPAD(0x0a8c, MUX_MODE2)			/* GP1[7] */
 			DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;

-- 
2.56.0


