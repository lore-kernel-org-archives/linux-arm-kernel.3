Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62EECD6E69
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=; b=V7FQZpFjo2daLsZrx0buAsyGUR
	8WgLs9DLOCM1U9kk/wXw4OQfUa7NLv8aZ5/sLquuD+NQGH5nIGlOOqQj2iWjDmXpijN6TLU7wp4wI
	0KjN5fMG+IIKWqlEodoQ5+OQb4rOsD48H67XVnsR++Hhp9YILMY/J61DeIiuPBKIqJ0sjzKkaquOE
	l+xBj95kOARySKIYwmuqnpct8TdEBNGSNerYtfRob8pfkEE0QuVGS5Zzv6kzEx8+Q6G43WKLbskh/
	Dmd4HrGZVhF9ycKsAyG7+LoO9RDZ1KEtHz12EEQZvBLGVaMt1Kw4NdfzAbssDJ9Eqe59NJA4LVdO2
	e+REWY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU6-0000000DW8c-22Nz;
	Tue, 02 Jun 2026 17:00:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSU3-0000000DW5n-1XwE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:00:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3001202f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419653; x=1781024453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=N7tmTYeIiqAMR9oi6s7VkP2R9OdKnI80DXU8Fycc8+lN8qABsR2NuPBJ+sr0uXpxC/
         l1WNDvWRU5fzY/CkGeiwh0F8uZEjsc/7Ly83n3uQXQXVpovPa6pi+ZmmGiKqYtndX5c6
         aLUvi9E7nA0RwD8OxQA6wHbyrWRV6jYSKIMz3ajysD7mMuY/trHboz4jyAImKhbNyT2j
         d5FgfX7lQirsPt24I4xlKfQn//71/fT7P/KQgkOokv7BmtKvYCCUJ2THDUTBg1LZSTCm
         5jv/3K+8fASnIb0LwAm1hn5WKKOsdyZ92orNUmifEt4glSDeNgXGjn9/qUivtUTxkITi
         crJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419653; x=1781024453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sk5k1GMtYr/HULN9/BDkc9qWrRFDftSIlp3dBX3ccaI=;
        b=VjMWZFSGZefEPzXKe9iFnA+Co7SXZ0DdbBrBUqAWhw4Piq1nDTOVIUxPJtyI3P9A8s
         UnasnuNRhjNV4FpkNGGSVlx4bjU+btPhPsyMelJfjws5ryCpY/M74aNMKwGOw7pjRBLu
         tfDlLd6LVAEHT/lIgjuVLmaa1b2p9QFehcdiq//5cBZYqcAE3HokOWojuWFuDSY7vzku
         R4RsDVBxK2q+2pWekC06ZkpHAWrGUK5aXRU/VyHMhayVc54eL7HdmLmarRtmF6z0Atb9
         rhmwZvXhQHj1P/Wa/FjMBq+/Gx2+xHEpGdgob6iax09/2Lx9ew+uM1Q3u9t9IhUX1udF
         GYnw==
X-Forwarded-Encrypted: i=1; AFNElJ+qrvPlhL1JRmrWNPNbpA1BWvZRVLJjK8xfw9XtzOpZryrZ7g02DtSZPt/aV2DNZXVhbZznX3ZRpZe5EiUCcK0M@lists.infradead.org
X-Gm-Message-State: AOJu0Yya8TSE/TpFVTheTTuIz81ZLfTFbyCphOLnTIumYaoEx/oMrOv/
	2tkbS2NREHPM/Ls9yho3No3vW3QSONFNcLHVE4TZVxa2s9lpvxREHnxOrHdCg+8I60k=
X-Gm-Gg: Acq92OEHiKfbMqYvVzPk0hTBLW0BGT4vC0B3QnCJaJGhQG62nN8+LoteFxo+KzXpuLV
	piEvkTl8jHryijb7F1SN00NH3BACoeRVcPOO8ycea2icNn8jvJdXIjDJAHnaISQF31czMdPAhNR
	1kHFSclP7a9wDff8Qwazo8G3w+qdgByRQcYKt3t0xBP2au4P1FP4WN2r7ImXnDdCttRrVAHerTi
	kNVceJCoHZYuC3WaZ5h7h7E+oPHxwn/NhqrS7lorOF2qJtEolhgdRFMF042nWg+jA1iFjR1KIKO
	8MIRlj/iAMsjA74Kp1JXUX1zvBHEo2rgmdh95Nxqmn+lrP/gpHw4kredeXsF854hLS4otUU6tDd
	Wdb+qxBPZMtvYdzXvhp4D7mtji+QS35tZ9SFDKCXp6TXdMqqlqo0pZywpv7+YxUfj1rLoeWC3r0
	SqN/W4mHQSSwK9ll4VjniamyT3a3Js8/Nu1LxSlNrcAvTmVfufWxwuSNmffi1jxxFV3Z6dUZIBD
	VjjOxFX4F9VCmZHIDICadEV+w==
X-Received: by 2002:a05:600c:458f:b0:490:b27d:e852 with SMTP id 5b1f17b1804b1-490b50b9320mr9331175e9.30.1780419653563;
        Tue, 02 Jun 2026 10:00:53 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm541156f8f.36.2026.06.02.10.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:00:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 02 Jun 2026 17:00:49 +0000
Subject: [PATCH v7 3/5] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-acpm-tmu-v7-3-8047dd54b0e9@linaro.org>
References: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
In-Reply-To: <20260602-acpm-tmu-v7-0-8047dd54b0e9@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419650; l=989;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=BuCPimd0wnIGZnAHNo8kq3fbLznVxR/5ajKR3GVVTto=;
 b=2qpm+leQ5BiHyed1UhFlsXEUso4OD56cdRmtkZsjvj2beUooulxoeIa2paOJsetkWrE2vyngA
 ih+5udRiTgIAl6fxu10x6wGK2hbVqp8S5IXkteJxVbMjMf147Zw4/l5
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100055_449712_D122F78D 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8218c2749b7..6a8521270daf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23661,6 +23661,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.1013.g208068f2d8-goog


