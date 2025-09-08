Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5539CCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=; b=mzK1UWIOxfxjkOHJjaPY8z+4Mk
	BlX4THm/uJl8WMa3iGbvnK+zDEETzimygBJfrucAF+Uu00gRNjAm7FQBkPyzpa7AMNTbtMqzp2ycu
	3fKbGKVQ5m9dDKBY8L9hpMCjwKM5FGnvUbEjP8IXmjz3FnkERsroQmzUzKwN7pFLV7DfKmFkuiabe
	gv+4gW4aqGWQtG73jSEtAb69C8IL49mFgkP7O2e361Unp2I/6TSGBT34A8MTASk9U8Q6O71zS+cTS
	m2eKkCnwSpVA/G+JijB3/f9QrZOLQM3tsynLwwYM5BNRhhzTkK+fLo5aq9KCueZjCJ+gqc3iL/yNM
	vdswdlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacC-0000000Gr2q-0APc;
	Mon, 08 Sep 2025 12:04:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYhV-0000000GETf-00Yp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:02:18 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b522fbe3088so569807a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325736; x=1757930536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=eS9GVsoHKEv5aW/mYm0jn3WCgq8FcsuPbwg6F0o995/EXwCC/wkpXkC89kPGI/FCuL
         Zvj6XKp26BEcewoatK5emCz+Roh8dWfMDVK8CICx7rIxst+uQxtu2Qiqps/TPpx7yhc2
         pj6QX3L4RL2DlhzdPZ1euosMl7G9e0acP5KNgzMSOc58nlFG2mFt6XlKH2mXvmCPfiJI
         MK08ZS3gZF9endLBMH0TwET0qm24aqXIPj7GCUHHC5ltEaHZfGanFyUftaEhvSkMwT/a
         VNYpIgg56gH5v8OjenxlPuvBf8yBOorG54swCiwJaOWTPGSomOhQUNk8w21NvVbsl/4n
         CviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325736; x=1757930536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=QmFbPDvgHKH1kiHFWOcdU2y0IgGjPEofKIMaO/WjeJyCT2v43BCQ+4qth7RngHxUde
         di028iO6RjnlSayZ7l06GlOKLAwqQYmxptouRF1fWvcT78o6PEibceZE47T4+lXRHXqt
         X3HbZkAMDbvFZNxkwGIwGAE6MQVNwOxf1/PlxvDS7Nr5MTb8cJ65b9qBO1PXoZvF026n
         a6zPx3Q11VTMQZBxG2Qn7np9qDigW2U/jv9YHtSRRaNtaNEG0zIHIBy3RY9+VU9r1bCL
         6mPe97kpvflwQcVNmIyl3aegewNqsuhsQkkh1WIo8Nks5Hif0d3Al+/eBiSw4cvVz/4o
         roLw==
X-Forwarded-Encrypted: i=1; AJvYcCXNWLFd+SusHFwM3UIy7fw5eUOLBZmSZLOHts5s/PClDLQEcHBh9cdSBdeBB27TTsep2Dq9eTBVZPJOYDuOjM5r@lists.infradead.org
X-Gm-Message-State: AOJu0YyK/d3AE1eDzc+YEAoKN+Jco6GNcS4csZzrT10ThmZc2ltsdMdI
	UggtmweFQjxxvGVEnf0WQowPjAcJfcgZodbQF9zm74nB9x/IBkoCAsv5
X-Gm-Gg: ASbGncs9vCRKRLet3O/+l8umtR+afryBCIEWuf6K3pm0xu4g5URF3Hc6vFFna48lDix
	drRJ4HKn0nQaR/Fn+Z/0RxstT9/mqiY4qduuB8bcWkfKUSzXc/4WX7wqO2E737ZLDJemA16f45f
	AUZMX0S8Cg2H0LRMsRoZVelh018pjmNCgO6+sk57mqYHhrPpZqQIAja58bAeKKfJ3shL0sAr1w/
	+etMH8RxDz36UurjGhAPEQB5JUDaEbRzwf8/o/a05ZHJ/sJb8V/xR1fbq7+xxagEuqosvxT1TpA
	phsOwwR0gfjSNWok5hTh2Dzioe4AnyWJDpQLgQmbBqVtrjfr5TEnvZnvw5QGlecZlZzCiS3WnQ9
	7FkncwGHJq66MWqXbVpX5d+0k52U11PgF2Or4SA==
X-Google-Smtp-Source: AGHT+IEAIXwSOWBaq4aQTTAg+ktCQQ9sgDbFz59k1ZXwoZKqObK9N5fMVhMYXm01tFsE2HKdytctkw==
X-Received: by 2002:a17:902:fc4f:b0:248:aa0d:bb22 with SMTP id d9443c01a7336-2516e1be7a9mr93271285ad.0.1757325736198;
        Mon, 08 Sep 2025 03:02:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:44 +0800
Subject: [PATCH RESEND v8 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-20-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=aC00DD3jiZSVPA6I5+G806JpCyFv8tDWkvwqkbp+yEU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFBgLFwy76RbumxIV4c/4RoBztS1KNxMhXp
 g+h0sH8bYOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JPrBD/90RC79QUNeWxSVOP9mLx2PGE9DkCLNIvfuATE0hOmwCczenMR5rjgeBu3TcOy0TL5LiCm
 8BhYt4aqJvKUmWNN3PgEud4sP8LUCDqGarjqZz1v+cyHDkRe0JYy4F+PyOstw3hUr1JxQLSxkQP
 HnQjZJS4N7v1TcAI7fLUs2tRdzbayKHs8LwptI+0FaQW/lPboIjhpvtacsFdaL7XvcqpDmiDgJj
 09Z870pzP9lSW8QSO6XD6KDT42mGF0jk2EtrhOVGm8UnbQg6w/6L8KB226S8kJNo4kBAL9PriO7
 k81he20AOwARbqedkQ/Cc+KDJk4v2wp/1det7F2t5LBd2b4xvvJsVfH4HJ2/7lQVrXcOzZIi7PC
 gZWCeBTiejrJmOTg8fr1ctNBQXvTg3psIMvzneDBAX9Eo3Xg6ogoSRLljCOHprQ1pMLxIl5xbp2
 h5J5ai0+dBv+gtYuTyknryYVLJc8tizU1jqdpZFKaI8NbfzCBX6rEMQ54o+hs0m/1XkwnR0nV15
 zj/G1Hl0YagMVy73AlwTdEBo6pI3tVZiPT9O1m2YNbxtkosB7cGUPHXC0YNDhjqVws4ozr7JLG6
 mhg6FLxoU2del3YxiZxOojjgIxBxzlCHC+ujRgGfZe0BIfpfYtl//f4oYeRgYXBetbj6hQhn3WR
 5DN/DitjKgshA/Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030217_044977_D5C32406 
X-CRM114-Status: GOOD (  10.50  )
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..fc87ab818d975974dd811cedde27292ec79f2c8b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -289,6 +289,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.51.0


