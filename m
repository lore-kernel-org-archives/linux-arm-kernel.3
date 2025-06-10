Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C84CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=; b=eFIsLfR8b9Zs9s
	Vd4ux7ixKEqqz4j/KL/BTRhSjZBvm9HlfAdnqzZOrPjxHXbK9OFoEuHfB9+d0WHiKF/XNfsqPKpIg
	8/brWDLt3giLutXVVDmfOOSPwgwYxBF+LXDpYtrFSeceepoZT5ydJjvlZTJBpUP21IA5jV5LwI8AL
	YizHqqR6gVHkDqpO4mUs/VrdblAnpOiFydjgfLTB0YmBDafuizesG2HmZuCFKIYUpC6KyIR6KnCLc
	2wy8Dy3kCdYA9JwEsXOs4HKpu5Hxk7BfTQlJK1e/cg7UpE2EudDjfXqBhmZ7o1xb5XHR/fIaiRLl1
	5iC+mddXQdaBkY/jhopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1rc-00000007Tb7-2JD3;
	Tue, 10 Jun 2025 16:30:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIW-000000071bY-42td
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:45:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23636167b30so9419695ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563152; x=1750167952; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=aaD+CGeQLXrgY9OxGj0aURvytJchmg+Pgiy4PJjTSyWETXlwd1qb/q7n9Rlyitd2/l
         UnRD9pSfS0uKzN+/tHJV0nErXSK7Xw2kI8xISF+tQUfoEhuW0EPdJ0EHgQuGdcMewu78
         Hbb8/UxpxZMSVdnGMNi1ICwq7KK9spQKncUf7c3XfmvF2xnkKGg/MJsoZ9H8xtqnUiTg
         JS500NzUyWesvn6G516LsXi2VYCjgd8jjDtB/owTTif9svkTow91ZkIPYIIpDg+kRQ7H
         Q5HIGOpH2BWIgv7rLWzQrMEAV1ImSg/Rc1+CGWPRPrlQH3wQBqVdSDVxselhLNh60855
         nTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563152; x=1750167952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnfF8+Gzh65nxJvwI9tp8yZPPMTOkFO4Yf4rye8gFyM=;
        b=Ch2LTZtre+K0lwgqjEoq+G2/ZupT8K32cPdEN3C4SlS8AMMmqeSZVAF6NrNjD1YEr/
         RwM/48mtDQvvomG9DRSqfteAu/lXBwRpsUif0OhJ3S8MPrlHCoqOCx2pqLIYFQROU3uc
         aDXPq7tEMmIbOn4BSen3hn4NWDJmbBow6Vv5Uuk/NWqX6710SZ4CkX3pEQVMFyr1Mugj
         DaxPr846S1v6uG7ci4VDxGRa0fvl1/SoST8z12iqtql93VrNhtdAQx2ZdSlBhqaOSkLn
         +3fD2WEg6YII9SeymR1Pp0Meg11VjPFcF6vyBqXaAz+WmdWDdZSqc53NCwV86dz/gdRz
         vNkA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhGyyMviHf8K+PqYx71RwC1/fJwv3v5JZMRPrl/iEiV4DPfRwIvNmGnexx870GoubfAwmGiyK6ye0ycWUH2YD@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBgIrMsdwiQAGL6leY52pQs0qcA+xSAm868T8idbzxFEvwj5E
	13rrGxVEuVkyIvrqj3TWhVqHHszJM8B3VKGSCRG1yiw02MxPCvxjAccr
X-Gm-Gg: ASbGncu+ac20cbpTulIHGuxe5MyoI2phSqfVnezPWMLnY3OOHSEuhfJ4iAGW1f3s1el
	cNJ4QUdi3T6ANuk7+vxUAbbR8jqrZaN6ankc/t/wToahKlhdG/9zj5ukgjkOiP6UwAkcpmccsI7
	XDcUeE/M2HlfypOvGlsbQBZ4ZvTE7PsPuaq0nYpf0kT8vLAaqzeHfPxV2o1wqnpOXfTHdEYL/3t
	6ibEA0aytD6X/IvLN8quCWm4AWhAGNJ12p/Vu+IRG/nMPm/GAHpGpF7CdrCLtkM/eX9r+afHjOO
	QT0aT+aAbeNfX1SQAT5TrVfTfm3P/zmkkCgnK2OZI3ObKPN5ow3D7J7tmONbnVJT
X-Google-Smtp-Source: AGHT+IFDGAVSPMuId25EXsH25RtuQw5OgumKF7/tJggZDL74R1fo/0EawYSTueGBI8URC4EWYzprHA==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id 98e67ed59e1d1-31346c50561mr22059153a91.21.1749563152000;
        Tue, 10 Jun 2025 06:45:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/9] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Tue, 10 Jun 2025 21:45:19 +0800
Message-Id: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO82SGgC/03MQQqDMBCF4avIrDslGTWarnqP4kJiogPVSCLSI
 rl7U7vp8n88vgOiDWwj3IoDgt05sl9y0KUAM/XLaJGH3ECCalFTg0wGF48bIbmybrXWapAV5P8
 arOPXaT263BPHzYf3Se/yu/4UJfSfsksU2LTaVEqXUih3H+een1fjZ+hSSh90HYQhogAAAA==
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LgWOfIRrAa1vCwGdhDD6foU+2vSIX2068gA8U5LxxFM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcCJMvk3SHQXuEkKlxUtcTqx6wQiJlRzbvCb
 1k/L3QeOySJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3AgAKCRABygi3psUI
 JF9wD/4oTGhOFVoVqvvq1j/1gXrVnR4n6AQIPsTOultTcfH0UuLokbafdBvmOuh+LHbyNrIloOW
 EsbwTfoCxbRwHfwNK4hX6gV6s5xOzmIo9uIGDodKxvUY9CFjOhXjQoV+f6wYyvKzC2VwB3xIqtS
 vAqy9rI6eVqXnvZt+nerWtkyw2daE0YB9JdIEq8Fc7kxBeqEEdyOVC8QLfJXisZ7iQ0WV27Vkfv
 ha0QiRqiuskTve1RBkiVZycdE13EnvyExH56Eos+IOen8jEKxb/rmXg83iO01swEPK/tUvBk2IT
 lJnJNqLHYyEuy+mHZif6bOBrlABZtNFbu0NBNuvnqGmEc4DObkG/Rs0Ml/shZNEujN6h5ITJ3Vr
 sfFro7crRWPPpT/XVOa/ObeD8j6pO7KO0PGc5dNEJ6Et7FuOV0qKCo/970Wny2lfWapKRrbXE3C
 pRFcXdZPjyC2U7q52UWNSot/wZwpFMjg1ePXP1ap07t1XWLvDj8gpVhWU1MV7hmUB+ybEk/vK0r
 rMeA47cCEn+r2P7lx2ZYJgci9AWgsucMybxMGfPaeqDCRy+poAD51BVeo1z6LyLaIwyGqvrJqw/
 bzcfAHuksnzjC3HpJaXaoScK+8eb4hXsGKImzllXPpkmPHI459D9/Hrs88xdquOkrWbo6Gi8AD3
 CROwdhHgypgnsqQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064553_008528_B1F2F09C 
X-CRM114-Status: UNSURE (   9.49  )
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

Hi,

This series adds the device tree nodes and bindings for I2C on Apple A7-A11
SoCs, since the existing driver appears to be compatible. The drivers for the
attached Dialog DA2xxx PMIC will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Actually include the bindings...
- Link to v1: https://lore.kernel.org/r/20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com

---
Nick Chan (9):
      dt-bindings: i2c: apple,i2c: Document Apple A7-A11, T2 compatibles
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 .../devicetree/bindings/i2c/apple,i2c.yaml         |  5 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi            | 57 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi               | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi               | 76 ++++++++++++++++++++++
 9 files changed, 594 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


