Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvFghhNu+y2kHYgbITMEYchLalWOuthlO7SM2EKd8oo=; b=j/ZY2TkSCW29B8IPHuDaRAEoU6
	Tg6KiDGXUklQTeeTddOWcLJfy1X9jWPgHD3NDfhnnCc/xWTbsBqN7uBraH1ADv9bRhZ08Az8rixgR
	666V/HdC8XseU6AJXyNh+fIgzZF64gSNKehOTxaFfSqc+urCZnAXI5Fy2vmuWxH1Nsb+i5QeQc1hF
	1wFiyg9UXz1YLgvPvGY/jBPd1u01mJjJfHDLy0yU3eUrZxy4+1RUeTWW+JYa1ySrxWlIRPb1QVqOY
	AXYShxPiCUZgiminLOQtucvVFeJqh2h3WRLDiJtiG+0gqM/Se6gxk7Fd32MO84KxnfE2PM7F9U23c
	jdDhZP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQBA-0000000Gq15-2SvU;
	Mon, 10 Feb 2025 09:34:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ8Q-0000000GpJP-337d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:31:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-307d9a13782so36116981fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 01:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179881; x=1739784681; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvFghhNu+y2kHYgbITMEYchLalWOuthlO7SM2EKd8oo=;
        b=i36ysPvdh+sBADC+Gw0OpfnMdja/qEdVJ6PmfSo9OuSvf0nFUcVXpPKAsTFCOKi+zj
         GVvOiQyNXNeh0p8YDw1nOY8jfE/9f3OAFJP46k88I4dr1QcmyMWbTbBPCGFft/8D1lma
         l9QdbwGvZHFviJ66lwL+9ZEYmMv6Io+AvcIfEufYheDpZTaNX69ZRUvc1pLTw6eI/977
         DyFqYCk40lS8eK47DzGtIhwGDJCQKKi+X+5+QTbAiRzTw0BFRvPWT56TVmWaOKq5xBjp
         FnomqdHos/mxX0rK+aQHMKH7m4G2IUjr3ShzIHq9GjCMme1cEJyI96/G3aNloBLRr+AB
         sqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179881; x=1739784681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvFghhNu+y2kHYgbITMEYchLalWOuthlO7SM2EKd8oo=;
        b=k09VYVjElh1pbaPXoP8dc5pI3CbECjxSVNozapeX7zqEEbPPf7c+3i1w7ywPeSqkxu
         y7xpfMIcmSBg/LySg7xQaRn626qeiQeoZKdXxuF5hqdH0RuB0AI5X+ryS1zk9JG6/pZI
         1NdOnz1JonPlLjJQjUrlU2Ej27CC8j18kJZyueFBDqisP624PwuXdXyr4Mze8Tw8Jm0O
         atisnyOsi3Y4pT6dhRsgcsfcFmqEkWAqCVpKNjbnjAy/TuMnLTa26M9F1ATNUrbQPP+1
         YhIa3l1ABpJ1aZJ6pRe4q7OoHaw2jQcXdN6LvraqkLJ6h36wLQE26IjQyis9tykLakHa
         sEmg==
X-Gm-Message-State: AOJu0YyLFUA3nnwvoDElTjAXZwktkSAAeUGTEThDYY6cgtkmxFu22mr8
	Yzgtnh3C0gv6Cj8GuCqr91+/CFLF8EAkP7DlPg02+z+gxL4pXbAVsyjY5PuHNIU=
X-Gm-Gg: ASbGncsr/flJ+xFJnpN1h/3DJ+4GClrIJSPDQDtNmg/P7BXQUQbEBbAtgE81g07Fr3z
	4M499+iwfCkBrKWhG4hLOB/Ik9AwkyoRqpq//s/4hHFWWBa7WwwMKku0D5Hacr2th8O1yPFIBAu
	KwtWKN5qCy2W19KGofCiCC1vKSqMmQKyLr+7tikD5zVoRjVQd9WmLsu+CwgBTlFBKzrlP5NzdAJ
	kkWzvfwhIgbgN9lxsToeKi9uitaoD3yc+Tp4EnWTANqiKnoWMpSnh8VTeDgTGuCiLTLJLx6DRJb
	LqxmCUk6yp7Rh37TyZwY6GnZJA==
X-Google-Smtp-Source: AGHT+IHA9jdEDExFsB1ckj5rrWeE1JQdfDm1JsFfGf+Q5WqA/JMVcTakPGWn5k/lCtIb64eRQae82g==
X-Received: by 2002:a2e:a98e:0:b0:2ff:a7c1:8c2e with SMTP id 38308e7fff4ca-307e5a6697cmr36096631fa.28.1739179880794;
        Mon, 10 Feb 2025 01:31:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:15 +0100
Subject: [PATCH 1/3] ARM: dts: Properly assign NPE to ethA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-1-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_013122_767299_6D41AF7C 
X-CRM114-Status: GOOD (  13.31  )
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

The way to assign NPE (network processing engines) shifted
during device tree design and an erroneous entry was left
behind in a disabled node. Fix it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 51a716c5966986bffb23f640af0736862a3f63a7..0adeccabd4fef902dcf7203cbd0454968a2b8294 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -193,10 +193,10 @@ ethernet@c800c000 {
 			compatible = "intel,ixp4xx-ethernet";
 			reg = <0xc800c000 0x1000>;
 			status = "disabled";
-			intel,npe = <0>;
 			/* Dummy values that depend on firmware */
 			queue-rx = <&qmgr 0>;
 			queue-txready = <&qmgr 0>;
+			intel,npe-handle = <&npe 0>;
 		};
 	};
 };

-- 
2.48.1


