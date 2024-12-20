Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYqkobOK+CGs+TgrhYtB4J6Yl7NbzklVF+5ziOlA9ss=; b=Nct/0jRcTzUyXLKZERq3uHPV2D
	RvNdQwmreItuGKwIa+A+ygEYIfRalvHNrTrLN3L3Q+EnsXVtKIg7/3mGfNpGWVkvXGzXFp1yLV86E
	B1oznqZpXPtbKxXOviym3GQQrSuvdXytK25apAVhUHpqyA8JRo/XJZl7crqlb4dNoPKPqX0gUn+iA
	moZQ0ceMkGwei90R6MeuEs1CE/uyLKuAz4BEuXmqtkmOm0JVGaMlsJHLPTcrIo/9bupVQFLVryib9
	/Pe/reNRe1gUck9EzvyzH0UZ5RLxHSDME8/Qxz1v/tloW0AGj7TkbtFsI2t4EQQfZ5gDPvE8pYV0D
	D/3zky9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdZc-000000055Fq-3Ub1;
	Fri, 20 Dec 2024 14:01:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOE-0000000534z-3Uel
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1126791f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702600; x=1735307400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYqkobOK+CGs+TgrhYtB4J6Yl7NbzklVF+5ziOlA9ss=;
        b=gwD5dfMtaAaKrx+d9rTqMw6AZ45AbC5KhBrKpXVS/zZs5etZ1QTNhM/hTNdmjQtEt1
         ItlKmqy8VXaNv14poMRFF5GhiTNnD+4KuRqKsQiFwjXz6+68hdvRT5cmOgwQCiK6yNfz
         5YA+K/BZVQFUZgs7BRO/L5gMfh5vNTZASgyfe9kxokrfHEEba61IK8xgd/Qa4H9UgcDZ
         mE1DwgsV+Ljv92kYfkznFoK3qsG5spgT/BhpPFjH54zkH5Rx8QBKeeDb0W1RLuhksfNG
         0UrdlakL6cJW8rcjGLbWO03gscNWmNryJ00Q/pmD02tKMi2QFUoa7+tsRfeDjUUs/RVs
         o2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702600; x=1735307400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYqkobOK+CGs+TgrhYtB4J6Yl7NbzklVF+5ziOlA9ss=;
        b=N0kGqjQQavZBcb7VnDU4O4I/KflhJC4mZokHFzJFvWpGL6LQfR4RC1Mw00wvDNfq0L
         h6zi4RzqYrGXTIaoEK813+A0xCv8+mzn9FBaMZEXXPpoc/ZjRQNRATlt1E6p0NksBltz
         kt4hEMABXDs3/idHKS9+F6zta53oRePF8/I6niIt7QP9uuizFy4GGxznMtl+Ul+Xi8jz
         2Oewf4Y2f6ioJv4gz+u1//bOlEEQQqUonUxz2K76HUY7Efyx1oJqTgBq8vnyVpWfirjV
         zBRZnComOSOuT/grVrLz4Gt+jeSZIq87sJdj7Z7SidkyaTAmfXl0aWT6xWTIOMQGDOGK
         2SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfmVC35I46hppPSplj/MM/3gpG1oDuKP2WM8mNYiis1IocPfVTJovkwsiKSDpApR30N8xMD9TxSSWQfJPqN3aC@lists.infradead.org
X-Gm-Message-State: AOJu0YykX4gQAA2LP+RByPv9K+7144FN2OUJF2/ALA6SlWakv3QF/8WR
	aD8dCUrWQOAhYuepRi6mNJKwEtP37OF77U2/VHbVDD40/2rdKZZEWfpTywROajs=
X-Gm-Gg: ASbGncvIWbc5+/kMY7RcoHmghODqQo93vVOsoxU0VKkqPL/N8KiZYPleJClRFlCH/P/
	l8lo12DmNlKz3WsEcBW4tUfIcACMeQPVGDGEH7CAewt/toA1RWhQdJtJod0O476OHvmYk/jQqsr
	94dA7WGEMTaY33oFUQfbR7N+NO9gGk4cIrDNpaSjt85x6I3ZAodB9S9ItEo7Dz8xtEPTEGqpwAa
	7SQA7e6sjCIKoCFjrYHS3jYfSlDEFJ+7FT3wHLPQGDu2Kaa1RLsLNlXRG5rqxnIkxA/cDUVY2vl
	bVqgKVRJYbhBl0ALxMBFehDV4SO2bWGy+NM8
X-Google-Smtp-Source: AGHT+IHmrkvtNC0bpXN3WfagnYqTmX3f/cgHqADtcvMIQyUNWR5Q5Jsopz545p5OgeVnpUJdIYXklg==
X-Received: by 2002:a05:6000:178c:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-38a221ff705mr2979256f8f.27.1734702600234;
        Fri, 20 Dec 2024 05:50:00 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:56 +0000
Subject: [PATCH v6 1/5] dt-bindings: mailbox: allow #mbox-cells = <0>;
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=1213;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=98UdmgNXZR4Odm8WAK3DNauL946xSKIV8vPYFoFzXtc=;
 b=L27tekKbbbVcK6U5BoYlAcu5YGoP7VilFJa2kRv2a4piHaSjgl6c8pZq3lyr2xXRNPu1TQkQh
 AuzOHGFoQW1DsplvHHW5KhfrQXyL0uUAXa/BQ4Qcems105t6N1TPsWA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055002_892167_8B87CCCD 
X-CRM114-Status: GOOD (  10.45  )
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

There are mailbox clients that can discover the mailbox channel
identifiers at runtime. For such cases passing the channel
identifiers via DT is redundant.

The framework API will be supplied with mbox_request_channel_by_args().
It will allow clients to request a mailbox channel using the runtime
discovered channel identifiers.

Add support for referencing controllers solely by phandle.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/mailbox.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
index af8ecee2ac68..fc31a4a3b637 100644
--- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
@@ -6,8 +6,7 @@ assign appropriate mailbox channel to client drivers.
 * Mailbox Controller
 
 Required property:
-- #mbox-cells: Must be at least 1. Number of cells in a mailbox
-		specifier.
+- #mbox-cells: Must be at least 0. Number of cells in a mailbox specifier.
 
 Example:
 	mailbox: mailbox {

-- 
2.47.1.613.gc27f4b7a9f-goog


