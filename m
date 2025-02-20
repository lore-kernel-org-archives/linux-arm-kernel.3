Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE77C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxoHLUi1TIyVjtHTj1O4KVcJUPyjk0t7xM63xGaqPFA=; b=eG5ZyffV/snKJ/
	W2Okd7O9ZQru9FXWcnaLNqZHtihSZwksjHsye7T3hjDopKk7elSNLn5ZcXv/xir+dG9faVahM2aBT
	e2kYkZvDtdCrU9YKnQrj4PT5ny4eQ584ulS05hcw20KVpU8ebBGq9TP5ndgMcyaIIkcpcw+ZIPfyQ
	6viMHgu0MFfvQPK+pOEpMTbCWQLE/tZafwU6PmfHnFjCJKKme1jKQsA5pr+Wfx6VtCNF4sEyefJcu
	V92Vi8Cwtsq+YDlHUs660OT3bfGt1nitUF6h39nFn3sHBzJk/LnD1NaNRGnwv1UH/vGQT2YKau8BT
	cOg6qdLAIPrn3wsgfpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5qb-00000000qlK-1ffJ;
	Thu, 20 Feb 2025 12:40:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5ZU-00000000lYW-0Eo2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220c4159f87so10938285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054147; x=1740658947; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxoHLUi1TIyVjtHTj1O4KVcJUPyjk0t7xM63xGaqPFA=;
        b=BAiSs4M2yeq6XjbdG+ByitlMuBcuFtdqmYQ5lor5NeiQFWVzxCxcniqB1YKPCAWZMY
         uEG+iClQruNtpFy1nzrRLwR8sWlsaOCZYGx1kCrlGosR7140lFYP1tM5o6GX+aDLy9ad
         4Ja5R9h0SBMhezJNj0EUqcdEpwzkt7yclQC5mTY0KmZnwnpKpYgX1HkODXh4OmKD/Bd9
         zz4hAZ2MvNKReF5R71aXOpl+uxrmOl5wlPSKJbnewqKyYyen0lPpwv96FZ1QEDuho9X4
         80Of3TC9pvRva1JYyueFdru9VOcx7uZRuLN/IEIalNFTi1g/Tnzf3SYmF3Rc29eO5bBk
         gN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054147; x=1740658947;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxoHLUi1TIyVjtHTj1O4KVcJUPyjk0t7xM63xGaqPFA=;
        b=q6l2dMj04LqRjZ3BmKKGoU+IGnxMOWdVPyg54CoH61WQd0VpRuMA2G3ohs8gsAjmtu
         ndsRpnl+MXWPwJIiXeMEAT20qqiPcsTLvsmQKmDCQlsdUXRHhBa4aNopGIHoCnp+Ekw4
         hW/pB39hs8Ux7O1NzDYjfMgkn3Z5j9ilpmwRPqn7uH2JOI/BneMlZ4BsXPicdnZajxW5
         IS0qSOfag6lwHbQtXRdwWEet1adzf/4vuaYwUTg7YNM8fClF+MfgK+BIf7X8SwykJi6g
         5bfnYHGgbR8SX+tNlbD/KZRO7KW+ua4npdSpd2hO1Ov5ZWjv91VYqXTjliOWUlpBA/HE
         Vw0g==
X-Forwarded-Encrypted: i=1; AJvYcCVq6fY6PWagkIUF1ttrNtkvdj6SxvDaSXwP1QrXsmmq7f542rPFisrhILtKNx5rCKtYv3iAP2QKrbbrsgH7tGzK@lists.infradead.org
X-Gm-Message-State: AOJu0YxB9f92WyjZY2w0pL/JFkYkRInTrLc6x2vnOR+hS5ikmS1nzByF
	XK9CLorynK6ufFkftKgX7FwDhi4lLZTM4xAUFgw7Cla4q0T0NPo2VH89lA==
X-Gm-Gg: ASbGncvtWXy26ucA40NCXb5Fsctkp0DxLgZcP6uKcKvQ233baifbmK49omprkkJf+sJ
	g0ofSx9ITXyoOcLGX6xzcJ8wbdag4TNJx8rb4c0kBedxW6Rx+7BCZXGKa3wwsze1LC6TOTyNaDg
	4jBcVqehDCgDyrYMeZjzsWDEMjRLAuaYFq0fOXim215MaaiGEgswMWBGbR4Otskw02bXU/ATn/6
	JCL/t/PA+MtK7zRP6DKtnjZfPQjWftAOmtq/VdxwwqsAcHkDKFS1uLfTfvhDctiZNbaxwLfVR0M
	t/6ZR7BRrUpTd4GNww==
X-Google-Smtp-Source: AGHT+IFPQJbD8Y0DfSGbKnFh8OFeQduLpjR2nCX2HZ+uxq5kUCQXB763DW1dJpfmXDKj/IsrLgKhzA==
X-Received: by 2002:a05:6a00:1903:b0:730:888a:252a with SMTP id d2e1a72fcca58-732618c1eb9mr32642016b3a.15.1740054146231;
        Thu, 20 Feb 2025 04:22:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/9] arm64: dts: apple: Add CPU cache information for Apple
 A7-A11, T2 SoCs
Date: Thu, 20 Feb 2025 20:21:41 +0800
Message-Id: <20250220-caches-v1-0-2c7011097768@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUet2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3eTE5IzUYt2k1ETTFGOjNEvDtCQloOKCotS0zAqwQdGxtbUAg5z
 SUFgAAAA=
X-Change-ID: 20250220-caches-bea5d32f91fb
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=x8vUs23nLD376IRPtFWOy/bkius73HrUEIt6auOclws=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx568W0BJpT5y33IzqtpAl5xiNefECBeocdaA
 G3h6DdBr9iJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7ceegAKCRABygi3psUI
 JJ2mEACU7xnn3GkLol4g6uNkJmYfTXbvOFRtGSPksAHFzpaPYHeF6tCJ+QOL2JxMqXjJ2z58uM6
 eI97d1zgxWGEcPbGOh5jVJGjXzZxqJm8KPNtF3DMfRKMYUmjZ0Lmih1ghU7l+BAwKMcW37B3s0q
 0eKbwQVfrWHt7AGSumZXWnYZ/PeNLbvW1f+q5zk/EnVCRjEXp9hbYfLbvYk2Au+d1t0XD/79gp0
 teTwCARVArcj33NMB360pVAJW+NaiLBdJWRwJVqr0hEpeHSq7DSgaQQm7Jp4JbabpsaevpM/PnD
 lKjUJO5Gql8AQBeqt2CtoLJiereJ1RBpn8LW6c/jWoxh4+HqR69liJxkknq4jL/TmSKvOdNzG8q
 lNhxXt/Cmf8Gow5qtPdR2tLfaIHMgiwLupckugNj5cxisnrWMhyIqaNdbmq8XLGC9sxP2cUYvT1
 aFFry5dp3kAwof5raujuJSGOPvhyQiUOUWOoEUHaoAOmZSzh6Fe4N3iLQhLuYQc3sXWXHqFtlpx
 jBQCLj+IgeaMeGb5eqDr4jJsIcRA7+eAiBnBHyRsVMGeZbkNJL6kP8iDYy8RzCNF27FSHKtfFPL
 GfFLtCHP8kdqAW8ObzUIwJ7Vt+ZxZv8Rrigm4kQ2O0dcqx6o+p0Uc553mjCQQolg9Wt896+vm2z
 imvAjodSIWFfQxA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042228_099338_42ED4C62 
X-CRM114-Status: UNSURE (   8.71  )
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

Add CPU cache information for Apple A7-A11, T2 SoCs. On Apple
A10 (T8010), A10X (T8011), T2 (T8012), only the caches in one of the
CPU clusters can be used due to the "Apple Fusion Architecture"
big.LITTLE switcher. The values for the P-cluster is used in this
case.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (9):
      arm64: dts: apple: s5l8960x: Add CPU caches
      arm64: dts: apple: t7000: Add CPU caches
      arm64: dts: apple: t7001: Add CPU caches
      arm64: dts: apple: s800-0-3: Add CPU caches
      arm64: dts: apple: s8001: Add CPU caches
      arm64: dts: apple: t8010: Add CPU caches
      arm64: dts: apple: t8011: Add CPU caches
      arm64: dts: apple: t8012: Add CPU caches
      arm64: dts: apple: t8015: Add CPU caches

 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi    | 32 ++++++++++++++++++++++++++++++++
 9 files changed, 142 insertions(+)
---
base-commit: 3febe9de5ca5267618675650871a626d0901f8cb
change-id: 20250220-caches-bea5d32f91fb

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


