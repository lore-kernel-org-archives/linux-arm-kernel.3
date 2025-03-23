Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9350BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=; b=0VVcm15gH6lWU52WC9fAkh73hD
	BNZenE7NUqVYdp28QvGJacChUm1Dp3tYJ9YMO5msvSuEd7qG22oHfTxA0hxXALLlQ2coomIvOagkm
	JkbCHny4my5N/dfk8Jsen7Q8Y8+9O2C2jT7RlPmjVOjzxr/ygi07RtJEEVD+0ziO8HBRxgU+jGzmy
	GnBn4pXoTINoe38bMPLMMWX9mYa3Uyq8NOAyfLSBdFuXl6m1Kurhjj5pzPIFZOu1++gvYGeVwDS3T
	DQhcG/V19c8l4t43Sf3nrE82DufdYabuRAqO0yVJKDy2zbG+IzXHE4pzKvNDOL/DG18aTt3tOx+cF
	uKiTkX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU5E-00000001qWt-2AXE;
	Sun, 23 Mar 2025 22:46:20 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyZ-00000001p3u-0kf4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac25313ea37so454783666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=VirCo140wjUsAqQmjecOePVd6HF8lU2pIn2yCNmFT2E2UaN1SaoAJIuCNaV/cpZOEx
         DeyBsKWU/yKLnDlP6aysnGuKsTPehs8/mspb/aD/qtFt3RyaJosaYVFMfkReKcrE+Lh2
         +7rDR5T8RWDhHUNqWzfq+vGQAyJOO0bhL/J/+kslqrh5h7uMFMlNym00Mc8ShyOKnagR
         i3OHHwUcK6QTlbvMJdm3RtuWLdctf/uLZ5VdajkXdTyfBltZhDUQDtEjbLByzQGVEofI
         FR2u8ML+8aD8wPD6E1oZHZskiFohQLz/UNtAX4sGPPLrBeTL1TmxY7sjNacPjR77mrew
         RiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=Pn7pubYLFUoSNX3T/K4HKgRGzB76K+UYIc3Ezkbcc7qrKf/TjCw1CQEoRDEmBBbjQb
         c0u6CDLE1T3CKFhkeMmXHXhFeJVhT6ZGAI5s3YB8R+2VyiNEIHmwnRGl4zsbp/Wyi8y3
         Ox23YbJGobuZzwYbVa6Xi4TjasYqE+oNV25VHDEWurFSTGH0taZW9yKA0DkXuG80+iO+
         RSFo5QADIk/4Ljx5UuwGIkluMYiaAxouR52pCcW6o4FV9G9v2z7/Yn2S9pbR8z0jhNcf
         HoR25niLyZLy75GhQvVpgqVQra6KexrwNKP7hFSNB3QbUakPw7px0K9Xbo9+A2PbbRgO
         wyfg==
X-Forwarded-Encrypted: i=1; AJvYcCVrEvzzZGCuAnaDlPLskiP/allAtxyq3YaQSPaNDuB6dPX8Fu3pL3rAZiIsBzLtIZP0qlRf/GzNWmS5/Syi1ldv@lists.infradead.org
X-Gm-Message-State: AOJu0YxB7jyOfw2fzoDWG+hCc+v8BeWRTLeD4mw2fOEl4VJzIn08tao7
	QK+hSZPgWVNA+gtt6XGH6mKYBhgIenApDtXjaYNpAmZNwSxaN+IABPapMJOd0/8=
X-Gm-Gg: ASbGncuuYF9TDBO5KjCLQuITQyN+DYN/JMq7kk2FNIrmQxSCHEy0XSoWyvwv8hMSb4W
	rUYCurDpLkeFEBRtRwOm8maSbT55pQ8BhdhNJwTcWSx2OBBjoeSrDhrO+4z1Ibr5EWC0u7nnrsS
	dDelT18k3UeXp7qnSK9ioTINYTL6TKiG6WDQYcZ6d0v/xw+snXwoxGuqf40OuXXoMYFivDIG2zJ
	Px9HnlA4iz3HCmBTPNNU9yB23JZ6gJ5MWNOF4MkC7zDX2FYJZZpA2KNtN5bPoXxTnhYXJeaJQlx
	SstxwNme3enLSszfDMQbTFJNT/HQCqDL8v7YEVJrXxDHtjtE+OdZorajHOhIVFc7itO9iEFxcRH
	LajS9J9dghJF8lazV+oCmucbIHO4b
X-Google-Smtp-Source: AGHT+IGsAC+lKGhqNteT46jfSAPWq5SZvMmaurRX3KpVQHgnAMqrYltc7UBx62PPecd7JPcN0qJQgA==
X-Received: by 2002:a17:907:9805:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac3f2297ac8mr1130529166b.32.1742769565476;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:19 +0000
Subject: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153927_213139_E1A9F973 
X-CRM114-Status: UNSURE (   9.87  )
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

The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
communicate with the IC.

Export it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc770ac9d8b3dd2be2172 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,

-- 
2.49.0.395.g12beb8f557-goog


