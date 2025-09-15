Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE643CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=; b=E9B2syljLbXZZg
	jh7N7dM2Dj+BvV8ed+mIgebe2SkrCYTL8dz7EKlMAGX0nsCrNt+hk+3UWpVuTnbkqr0RN6tVDo58U
	TGEGkeRcQ7UyqqN2lnWf9h5EWiX9araJyjoNVl3TnKNcVbNwYmfKEEj/enwXlHaCW6154BDiQHAD5
	6NzYgcXhI7ru6dtLKTdl6KRBZJxTL/SByAAveUupz+KDhI7Ly3y0CYkc11tTIUzq+xJq9dqZhXHpZ
	myW7kvSxTlROe8BGCmAxDBBoeknDJsI44WZBrMzsJFjVz1VWUB2vnlpIi7NkUL0xiRJy0pFCwUaXy
	NmtvMH7dZd1T9dCOJP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyO4-00000002VNO-2zQV;
	Mon, 15 Sep 2025 01:52:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyO1-00000002VN1-3Yq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:52:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32e372c413aso460833a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901129; x=1758505929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=UN8IrHYoxR0cYSt/jIFA7Qc+zTXhygaDHJSz5hUCsxxm4lAet5XPDPy2a0my00cUEI
         JGrJtGT4AotHO1Mr66x4uYwyQuRqtihj8N7AdsWon1RfptOFGdbqYP98/UmuYUlp/Yjk
         coCAU0cgedk5Dn4EfK8Y9w4dUJR7j+Sh63e+vk3AVrIzJCL6Rz83gQ0LbfF6DMECdigh
         iRm/JotSa9LSXrWWSaen9TlA6/gZoCrerh+YVNNveMyLj4KK34X7rQ2Ydch6nz2UFA3B
         /KFAVsofYgbCl6HGypwALT5SVFf4D2jvE2cjAxorLqMKLldGLBx9iVlNWNAwg9bAqLve
         72tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901129; x=1758505929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=YhdBgWaLN0QiqcVj/EcYVtJwHPGRsVRhiXvE+Hn/9VkaFuuS07tdj/fRQzWcNUiDte
         /rWJBlS4m5YpgQJI5tj+eo5oHTd2qoFt0rZ1/pfzUG/y0IzYQtcdowz/JbXcdNeX49gp
         5SxcmIZwhRU+fM3aQBMMQMiOHeFEORUvB2IwTUS9tXprXx9HBEo7OzKCgseUdriNl7Xh
         FLi61mhDfMHDKV75ytgSVqnDVLNk/d6xjppT3fNPCxK7HGWfFi0uW5mJYVB/bkNuPqHg
         O2s0KBxLiZaDPjePBRckEZxl8stRtPUTV5IWlm5libYMaVMMAz6J/0mJfHtAMm4fg7ei
         di9g==
X-Forwarded-Encrypted: i=1; AJvYcCXMXr3mPHL5BomYS0vOhwi6sNmb0OOvpaWXj/TeFsgCLCTYz06jIKMFuk0QxgHiUiYyUsVgXZXbuz4kgvgjkPHJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzxbNlctpXlBw97PVY4FWTXGXmVuiufzX6gqiuE/YT0byaC7GtA
	WYxBzTmtUSrmgR411WEzYw+c3e5cmXzT+KPZVgcQPTzxmxGmAnm11z7Z
X-Gm-Gg: ASbGncv8qyCLECCEKiJj4UIAdLfdOo/cu8o1oLHObW6XDJ3wpCreyg11zDD7fglpCrE
	fPL4PCC9wHjs94Rxcic0MUTq6cu9sjWARwi06VHzpex75zNAk1enXKatGfpqGGkAae4M4rrxRoP
	wCnRBbbSxgthN7qI3m4XTx6bWaNLYjfLcHJJk7bRgonD4MouKDUSIXJ+l605NW3P5WLiQO2y10D
	9kVpOKNmyEFycNqEjM9e/CgzIOOYF0K9vhIbPHYScZ1kY702xMLfLfTDfbKwfXC6zeYMJadrpyQ
	NfrUIgaKs7nV6UlEdAAiDdIH4aHBQlCqr6ZPXUc6+dcH81OrUdY9zck9+o5EvTgLuQmZwqSxRw7
	MoMCb1beFiAd9fBhVzqoalTs3
X-Google-Smtp-Source: AGHT+IHWF+AzJX+M1VdVgQWjvhWFRrfFx2K9ZCZ7H1PPT0SBPU/undvXo0rlDVawqZIzAu9ueFerMQ==
X-Received: by 2002:a17:90b:3b92:b0:32e:ae:8748 with SMTP id 98e67ed59e1d1-32e00ae8779mr8787581a91.5.1757901128968;
        Sun, 14 Sep 2025 18:52:08 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b54a387d0aesm10354491a12.31.2025.09.14.18.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:08 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v3 0/5] SPMI dt-bindings and nodes for Apple A11 and
 T2 SoCs
Date: Mon, 15 Sep 2025 09:51:56 +0800
Message-Id: <20250915-t8015-spmi-v3-0-f1d51031a708@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FFf0q6xEhYxdTKU4qhOvp7PkOYLr0XN5DMF
 VdVILtp4++JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxRQAKCRABygi3psUI
 JPHUD/9UxVZqOz2cw72C5eSRIZTzEUA0p0te6QP9znCqu82I2RjHH+BwYf23Eko69k79/DGuSbs
 FGUBwP32VuCgenwa7IWruwwLWB8pm66q7jR01mXpnr9lwhUDo70LWRoEVnDYLNmp6n6MZu4knDZ
 WxYX+iZmOVrmeKQjB61WMdhrd9iDFLooUSmnZID6v6on9rJjUFNy56qnzjOyy6LaDK4R7G0dCPr
 l0VCegDEartwKOdK4VComtg62wUPBI38/T0yUysheJECDXvR8UROAHn/nLnhiz6PdexdahzsjGC
 fB8/eTuhdRp1nMoxIffl1Y9k8w/FOFS2CcF/8VsWIK9rpSvcLfbDZBPD1llb43BA5Ik7LkGsw85
 E0LJYrSaxdLrEhITZi4Ujqm206j9C7B1tc9YU9mBoeYaH2ulcmYcONcOz2bhK0ulLoGLvhjobBI
 oQDdnASJPWbPnVkCnIVWnaJV95iit9pqXzQ3dej5cSnmx28rYtch22kRUR57ThpquBY8j60AW+m
 PK4lV1doEGExtWpocejgmPM+wariey7WeA9CY+pmaGQM7naIKdkfE0ckvj8MflOFYud2QUrggCX
 Uit4pCRosgsiymjHL3S4aeaORsMMyRlfpSibdJSOVGAsRRnEqAx6u3yHQ+1P/XptGoz68zZ+r12
 aiptbgtn0ThVX+w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185209_898451_A9441430 
X-CRM114-Status: GOOD (  12.00  )
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

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250527-t8015-spmi-838bb49d34ae
prerequisite-patch-id: 801a5b0bb76e74553fd30469734e9589acc09b7f
prerequisite-patch-id: 371cd14886cc2c5d6f6e8f8eac41f710b26c403a

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


