Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633EFCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXqXRy64lVkrU01s43hs91VfZV7gllC24lvxhG5vy9k=; b=tGc07jFA2TlX/n
	tFXNncPYFMbsxpuaNffm3xQ0NueLqOcpmZ9ZkWw5mt1SbPr4pLaz5rM/Q7cbttIl2BWjSZtNpL/LA
	r9+R6cdyy4c21Jx9nGyllYCWNN4FiVarE6JNxNO4J5SteD5zpAgbbxcQdk1oDiWcnoz5qB/MbxHsl
	lkMVNpU6VZcROi1tso7MYDJDTTG+rUVws+MrSb80sGv/5PFVYZ6yJ8D5Tl2gWxLlZD+/Csk7Fp4fS
	Q6OdcZCAQ+pG+lQGRQsDSidS8OoQaEgTRe5iuJ762/ujnMjFu7o0veSV4Ab0X3A129Fv9MS5S7SB6
	lokUYmtONIZu9qkn18dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHP-000000008GN-0CdD;
	Thu, 14 Aug 2025 16:58:19 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umazm-000000005aY-1IVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 16:40:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f8d3e67dso8886501fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755189604; x=1755794404; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CXqXRy64lVkrU01s43hs91VfZV7gllC24lvxhG5vy9k=;
        b=DtLJuJDFD6SpbyMVnYMs4+ipgzQYoUvecNR768G023xozMTOi8qWhgsAJYRMQl32kI
         Aks6Kf21xu1mWU/DQ6T9praN+Im+Gw9vUcWmNLPgXdGYHOzm5NwXaDhpMM5CZI5X9SCM
         zVlSwwEtnv11o2UZn68r1gsh78038/aqYnsbngFRk6sL9VAP9AFJJKXnWbbKNHIxVq8a
         YYLSCuNZpEkFv7JHShNl0JgpHttqPxFCGJ5DlgvXh6p+9l9u5JPynaItCP+gaqFixgBY
         dcAY9QR17MZDrFiDNtoV4+MhZfN+IRuncUmwTGKGw0dii5syv3YslxdvGoQHUgT0MOzw
         eW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189604; x=1755794404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXqXRy64lVkrU01s43hs91VfZV7gllC24lvxhG5vy9k=;
        b=WbXLYYvcE0To8YOmCEKYsrYSDX1ERtM1lPHh0slaxHNtCZQjvUcgc/IIy8ArsNd9PA
         lO+Y12qO3RRZ10nQpZWYHMKu7W6Q93HxawLv7EYt6JmBMtKxrS7PAFepglWXQvy7CaYi
         /u5HxI0IGt1gnjjNbYr3CKVFy5kY7c1wNE7BUipGVQZYkShu8PQq6CD09QxFmx3+SK4S
         6sPPotA7A4SL6iqkf2Zfu6xdYsJ1ydaVH7SODa8G96KhuaqrX2ZesPRu3DUp2onxfMmL
         cyotcUOfPgvggG9SWhUOuymumuPYlDDmNO15PryPM0nqVmPRF0ZhAAJNckdj4v9qGKmO
         w0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS5AUq1tUAeRC0Yb0fu/FjTTiQ/VYbf6WXrm6UcMTd9irM0TeW9TcCgRsx0UHMId+dbl5QZHrtPPCPM6OyGWDT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4XX6E+KBoYAqRZcFETGsMDad7Y5QhE+9Vbrby2DvY1pWQdw5U
	zLjgsXx0MmkXXLOd7uXwbl2PcEIXE66UfXV13BlUr5eO2+ljQOAOKv+7QqXMOQLk+Xp7pXaf2hb
	NPupmXaE=
X-Gm-Gg: ASbGncvpOPk8J0Hb+dxPWiWK/Va9Sq51lSG8tR3HZZOejeO+gTMXjFZElMWLDtSNCYC
	M5d8peDBQzrTrIChEO/EX6Fnx7OIZ7WIDjWnhopyjIJpJBD7KNMpfwbu2f99qurMEYH8/cKE/3d
	Bc+7f+w+51UVAAGbNi7ipneENUeyCe7vLQVwunla3Gr6EgQ0LPwQ7JM4Cs+QwWTtwanpFE7I3WK
	/uKvTuGaFIEdxuCLKdPApZ+rIDoJISuPxUUYLGgSBaKqdNYb3HMf33EiCZI+DeUTN57MYVHCk2T
	MdrrcCuUKGcwV/4PEKU39OWML623+WIQbd0Ir3jp0Zhd9QbSks1kJ4BjnV/qFUPmS3d2boy/vfB
	blnh84/UN0wGhwb5Y4ktbeQWlQ61DS62Exq7SFA==
X-Google-Smtp-Source: AGHT+IHxhrU+W50kg1h1oEpYS6nfIoOslP5saeGlz78QeOuf0ByQmiZtTzh2afxN/6vUajzqnVqAdA==
X-Received: by 2002:a2e:9901:0:b0:32a:6e77:3e57 with SMTP id 38308e7fff4ca-333fa845485mr8951411fa.21.1755189604293;
        Thu, 14 Aug 2025 09:40:04 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8e1c71fsm3296301fa.48.2025.08.14.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:40:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] ARM: dts: ixp4xx: Add device trees for MI424WR
Date: Thu, 14 Aug 2025 18:40:02 +0200
Message-Id: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIRnmgC/x3MQQqAIBBA0avIrBswsZCuEi1Ex5pFFholhHdPW
 r7F/y9kSkwZJvFCopszH7Gh7wS4zcaVkH0zKKkGaXqNXE5dCu6slX4S+iujDRQGJ6UfjYcWnok
 Cl386L7V+FmZjAmQAAAA=
X-Change-ID: 20250814-ixp4xx-mi424wr-dts-afef5c00d68d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094006_363892_BB2FEE87 
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

This patch series adds device trees for Actiontec MI424WR
versions A, C and D.

These routers are quite common in the Americas and uses
the IXP4xx SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      dt-bindings: Add Actiontec vendor prefix
      dt-bindings: arm: List actiontec devices
      ARM: dts: Add ixp4xx Actiontec MI424WR device trees

 .../devicetree/bindings/arm/intel-ixp4xx.yaml      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/intel/ixp/Makefile               |   2 +
 .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      |  37 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts |  38 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 273 +++++++++++++++++++++
 6 files changed, 354 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-ixp4xx-mi424wr-dts-afef5c00d68d

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


