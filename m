Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E66C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=; b=O0wAVIHrI9xZ99
	FqIl5iljZNArDPXEuq41UO9knAyk4nWyS1HibBYu7SkHw54fOlclpbsj7XF3k5coWE6XRpFQCVyZK
	7cGaXcNv+7t0BsDr/RQgAEtUW5lB7wLRlANujsTUNaRjHfWPwG82OVBTxRVcysggHmgpDxQVYy2Jb
	GCLZ114eM8R3cd8EmVMpauZ5hoOS8UC5Hrc5Zv2umqLfYhWQqWdSg7/QsxA3mGue1gpIrne6PQMGY
	TZPSeHyP2lnYWxdh33j7Nw/TfpTcf+gTJvI6Y/C4n2PNTdA7twIEWdznaCMDg+46OmeNxpDo8eJW8
	bQbV0lUEEMaIbhZFo6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdzR-00000004RcU-2zWM;
	Mon, 09 Jun 2025 15:00:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdxC-00000004R8e-34Bo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:58:27 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-879d2e419b9so3703419a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481105; x=1750085905; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=mndPCMFN1iihGgPV85/QcWu+nQWxTmymS239yZ60MPSOAgA7p4rF6dnmQJ9CFe8GTD
         zFI8OQ+YOy4pKlAbZSZkoBVDQd17FE6YhOjXOK5PIX8NZC7TS8mZ+P/COA9uTnNTtMGe
         NpR9toCcCZpcVNy5Xnsxu9k9Yx9scWu1sz3dYlE8eq/OUHOmyipMnHyuV99WX7/VnqDB
         0VmPJ+Gh1OtVnwbuuAUUY2UDql5GAzx8lOwkWYEpEl6uIRKkV/n/dA1ujZkaduoFDgok
         FzNclBR8SlpnIvOHGVy93wdSPBdKz1Fbz4B8bN2Kjhu/vvKHy6ITcoSYJ5MsG2s293j8
         o6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481105; x=1750085905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byEYBlmbmeRBtFl6//UsijpT9TN9tT48aruahvOT2Vw=;
        b=TCI3LXqrbr6ZeGlMz9hS22WtNzUtKy68FMphlZkQu6kROTmLcfaWKplnfqSO1vGVwt
         KOpU94qo6j+z6vQ3qWRkbybF4IRd+ixGmtZZZu9aCw+VtaCeNgCL19dDIrRtuJVLg0h0
         /RCuvW/3CExnn2vTGdFHc2TlNBHlGAwet5Fo+hNGhPvtdftJRMF7DQyK7mgGa21eFC56
         rNt/3I+BUG3ZXCdSUFbOwJpLJ7Cd6goHIk43RznDp3I32NxbUs6baNQLfSWMHKjguuq9
         sQK5lcPSRibr1rRgIIUO0Y4hbyhtfHRQbDGV1ae2tc9dClGb03nxFUyhbTV+aCQgreeH
         7CkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvPns1apHMenAHwgkcHAPmXNylpvQ2kFJydqFplmmTZdzxOevFEa2DnsM0/spzbYjRK2afN6Gb08coVH9i6Gjf@lists.infradead.org
X-Gm-Message-State: AOJu0YwoZNMXtq7O4HmvF0caLy/qJRVQ3Fn1oRSj8kWKJr3fpTxFDwp2
	ETU4Y27MzMECeAR9O2KNbjMdQ5TPQ+X0Z7ZhbOsoLh6Ev/h9jgM9D4b3
X-Gm-Gg: ASbGncsm+p41oFzuMEAlfNtJd2hj60xxTU/ApevIsRgoVoIogo2xZu4RKtRPGRRY0eg
	WATJqhhP9AOU1gVWvVU5aH54gcEf3RQh4VB8Es5Hrl3QXSxeVNf4QWP351Q6OtPA17/KKFJCoeR
	R+Cq00hveI3lu0y781CU69OIAakjIekfdchMABLYaRfDCgsq5j4tcChuqTgsozcJMETx2tRlEf9
	36msJrGsl7MHTWf0jRuIP2z7IKqcVDVrpSVS1GQbfpVsa/6C5ksAs44SC5ye5XF3mHMwFXkjHLz
	I8Sf7c6F7M855nNzv4nGRxb05hPtAPKAtCNtE/1qnL2o3wclOXdvRQ==
X-Google-Smtp-Source: AGHT+IEIc+6G22pK0B+QVv6+YOjfM/2P7KrtVtBBawyZzoXj9zYv4yrhluVgdzNvUn9UVRzwAwkRCA==
X-Received: by 2002:a05:6300:408:b0:21f:5361:d7eb with SMTP id adf61e73a8af0-21f5361d91dmr5880509637.31.1749481105313;
        Mon, 09 Jun 2025 07:58:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
Date: Mon, 09 Jun 2025 22:56:17 +0800
Message-Id: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABH2RmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN28fN0SI12jNGNTC0tLS7MUQxMloPqCotS0zAqwWdGxtbU
 AUY5o51sAAAA=
X-Change-ID: 20250527-i2c-no-t2-2f3589996d14
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=sFe+H8XLKeS7WiN2PZpSJvmWH6Jxo9uZaJQTws9Dm70=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaIHk8b5nDOOtFNIDshX9oPFaOksqYznLjpr
 tKrwt2Q7Y6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2iAAKCRABygi3psUI
 JP+FD/9Gdgqt/lY4KDwLwOG9y0ChTcW1JV08hZC+822o6XWkd8eFThBxeujQFbiV6SqIjAzl/em
 ln75ssqyvArWQhqvpM12mKCs0hJstSCNgF75soIntCoKpg/fQiYIbDQa3pfjMO8Zf+0/dfIANHz
 p+sSJMDpF4B+6JdEtvqCsY/joLI3h/HQjPv2hTSTIPFP2uAazYGSlJR6oDejMBEUDurAq2pNNQ7
 jOF/c1JuBx1iLiCCn5ySXlVdTYtQwsmX7VEvQaiLU2fww6WVF+AzRThuz+1VAnViJynYQuKfyu8
 Ril/4WzJqQ4gZ1gCt5urjBtdyNNBphHfStaaNueW1gRTga/KZWPvvz4c1ndR/QdvHZrG02M/h6s
 9hD5oTuC3G3Ez9BzG+2AlUNdYiVViptnEyTMePGa+3qLeIbGd5i6BavX9Yvk2H8SBKggt5rbbSF
 Rr32hu21LUh/Oiwa9Y7JIT+nwzvlGI5ihTiA4FbsQtgnZgCZi65I9mnDBj8hdxxhK4IQjkagrrL
 8urBEmoWOKMB5/UvPNq2PWM1hSlflFoDAWs7EzSF50Kc9RuFWmzuWkI8sqUT8Kz56LADLuCgR4X
 i6KAIjGa5ROV6YIW8FCQSz4kNBLoP/ZVI5RwH7NnFtYgMJR5yq+HFrnLvAFNXKHqsexxgY6Q74g
 XTR6YB6U1Xieqgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075826_778486_07876C59 
X-CRM114-Status: UNSURE (   8.09  )
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
Nick Chan (8):
      arm64: dts: apple: s5l8960x: Add I2C nodes
      arm64: dts: apple: t7000: Add I2C nodes
      arm64: dts: apple: t7001: Add I2C nodes
      arm64: dts: apple: s800-0-3: Add I2C nodes
      arm64: dts: apple: s8001: Add I2C nodes
      arm64: dts: apple: t8010: Add I2C nodes
      arm64: dts: apple: t8011: Add I2C nodes
      arm64: dts: apple: t8015: Add I2C nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
 8 files changed, 589 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-i2c-no-t2-2f3589996d14

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


