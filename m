Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975ACCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXR/Mce4wnzCN/euqWV2Ip2YQgL/Gld/DHXWnsUXf5U=; b=qlDm5JuGs841yp
	VM3uyh7EZwLyM7Hn2k+fQVOBsHt7GmnWqSBjxivxc/+1vuH+u7EvRysE3y3oJcb6h0r9UU3zYAGEQ
	RHMakcMmV/OW86vrGfQBYPuL9D7x/NSqFwyYJw7rdM46QVdb8xsFZzPW2dHCVeNBRndHmaSyxucAB
	OT0IbmAzVWB8e4EM8CaYL6Z1rLaolD4F0JEvDB1YXZ9WgQfdfzFmv28QO4S7Xb7j6GAPuMfULhF20
	Lbckj+CMwjiaKivRjcCjJ6ZZ4z6HTrkVnXkGXS3XTJNCk6sPzuvCUbOJMKmZrQ3f8DDU1TQCinDnk
	lop0YXuu3VDShk9fD3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdu-00000004SH0-1Efl;
	Sat, 23 Aug 2025 09:34:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRrY-00000002dKD-09CN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:31:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afdf5843940so36059666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869482; x=1756474282; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXR/Mce4wnzCN/euqWV2Ip2YQgL/Gld/DHXWnsUXf5U=;
        b=fijBJQk8zlBVfHGHAwCOlVu2X2FJJloOjLGoqYvQz2j6e9/VEjkg0KIPAOtvEwRyKK
         Ey9L/yJBCa2qkEKYdgKGcvzyysI/dJd2R+RlMvirfvHsBaKojYd/YLhNV+iVZhHhVkWl
         lAO/MNyQTjeF36F0UeAsKTD8cE5HLAu8p0Nm9AyjrIYIjX/zjcXGXbT4hf2zrpkq6tyh
         6DlZeg/7mE2n/THjMFExtcaDrV37N6SCZxsu/4IvX7bn//D2/AMMq+kYDNoUOcgAoPde
         aPmlh8U1eseMU+gaUdJfVwpKQBnJO10x9Wawwb43RdZV/nCeAmWX7DbmN4O6D0qgKJ2m
         fs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869482; x=1756474282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXR/Mce4wnzCN/euqWV2Ip2YQgL/Gld/DHXWnsUXf5U=;
        b=lXcSZiAvF6MhI05JYT48Bq/w15kiU5hC4YDzkT9YTjbhrCNT2Cld4lO+ZJgCCBZB6D
         yix8MnYhGqq3k95QBDvUN1J3Pa3t/n1yjVaXrcTM+3JHSwc56g1KiUPbZoRipWWlxtxz
         5nAlDiSLNVH6y/SYNC9MPd8lVFOdvMupZLordxgHTOhmCDfHhM0wha70I5VSY763nFQB
         ERrdDdWk9K/ASpAKcl4XZQGBLIHIDABFL6u3tctI9CpC0fr6WWWP+8crWdC3CT72Zkqs
         DsdyQY66E4lkDOSqReZyMRmzXYt86qV38DWqXaf1SkpIXz5A+MEfgzuDc/v2UIHecMiP
         H1Pw==
X-Gm-Message-State: AOJu0YwY7CuzveF3VciM4wcgaOIXUWELKoVq0/S61oKDed7N5C9RPZP3
	ahCvzueyQRcrUfdA9bmjUDjfxQm9CYFZ+GhkKx2pRrSI3EEetmGm+vLC0P/p8GKUcZA=
X-Gm-Gg: ASbGncu+UYW0zTx/yI4VaRu6f6YYAX0cHzajkEub+KtVJa04vOtHZP5o8N4AOVXG0+H
	B0JvL0qNcDqt0POrL5FZeCQTfcr/xiNBysTYwzPtonnN55VoYVWzXuklZaNl8yPtdzCrDEjd9G1
	SLJGLHu9EXIbj6eYnAucquSEnDNvSdhxRZenFzhgBUKvjhnsAK46KeIv787GMksr22sbPQPo0R2
	2qDYSAEMfxKj1Xi8b82OXWtVfU1v+lSP0HP8RItgmVhKA+XRqihmF3w0fk0P63pkWNa0dW54LJ3
	WjtragPCRb3qlorSgPBEknFWzyI9WpQ9zu+kDTKaSpA8X98egYWJU2PG6ZL+1MuZTusA1D31D6h
	CDwHRWfQbabM8jDqMnyHN/C36vVYGjiKtLFntVZn6/suwVeQjvA==
X-Google-Smtp-Source: AGHT+IE1SyS7rdAiTfqSibtZfokao085p20ry5c6FKV9TDDo0DnlnMgSkdOJ4Z1Iyt5EsBmYWbKM5g==
X-Received: by 2002:a17:907:6e92:b0:af9:6666:4acb with SMTP id a640c23a62f3a-afe295279f9mr138617666b.10.1755869482347;
        Fri, 22 Aug 2025 06:31:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/10] arm64: dts: freescale/nxp/imx: Minor GIC
 interrupt-map cleanups
Date: Fri, 22 Aug 2025 15:31:09 +0200
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1xqGgC/x2NQQqDQAwAvyI5N+CmiuJXSg+riTWgW0m2RRD/3
 qXHmcPMCS6m4jBUJ5h81fWdCoRbBdMS00tQuTBQTW3dE+HYIGdHTVnMPnvGyGzijpOsa/HbgU0
 bA/XzeO8CQwntJrMe/8njeV0/GPNdgnQAAAA=
X-Change-ID: 20250822-b4-dts-interrupt-address-cells-imx-45a128fb371d
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8E6nImJ8N1opGmR7K7GVvgClRbKq2rqRED8a2qwcAxQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEfkFR5SYp6LIxDwIDpcspsTQNZOP6eApiR0
 nS5WmK7QLOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxHwAKCRDBN2bmhouD
 10JzEACXW7APJRig+9Zh6eycLANivQsTEwANrpmd+3ax0sbYfgY6QZmkaTbajHW0mqLqGx5qT09
 Wl+6pVSZ5648eRy/NFIhmrw2R/qYgWb43mbRqx9FyOOoNLn5HRjv+vOhDX+QjADkgW+ar7USaBK
 XsdAcnQe9chvXnwPD4Wta63I7uqczB56/wmt94B1pfVyPwUJMgeNqt70+PGCvCn4qoo0T3q7Sur
 Q1m/qVsJIX3dBFk2/xElUddPPiCiPX+eb4RkvxrJSm6f/WlbG9aMORnoxMw2m8GktzxLNxic/ra
 R36wXN0kGTkIynY/jm7n63paNMnF+xixTE8ZAimjMWRjutg9xf8pYRRgg9guBvT5xc+F3H1w8i6
 tK49RrcKVoY+6GowWiNp5jsoycJ80jCV+jxRlHHQvUSz92Ui0peThrbEC6hS6AdAZ1iPb+DN4QY
 rlD1zs2ap2SxjISRpxBM/xjoTfeigfgpWkOogXtgkHCXGkhykAYKnK1We0H8wlDmyFnNX8b9dZD
 f5o5CgjqGSLyUm+nGKDRKBAku9xJ72jHmtgQBfv/+qyWOiDZmMQuLbXnG/oPD/QACNrSa4JAr1A
 01BVWhlM+Guez6MGZbrRfxYk3Osvcqvi8OVQhP0pa9CWgR4hLUoVmoHEsTZ8O5+KmdO7C76iJN+
 XDPt04+eMv0SsGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063124_093682_58DCDCF9 
X-CRM114-Status: UNSURE (   8.55  )
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

One W=1 warning cleanup for Freescale.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (10):
      arm64: dts: fsl-ls1012a: Add default GIC address cells
      arm64: dts: fsl-ls1043a: Add default GIC address cells
      arm64: dts: fsl-ls1046a: Add default GIC address cells
      arm64: dts: imx8dxl: Add default GIC address cells
      arm64: dts: imx8mm: Add default GIC address cells
      arm64: dts: imx8mp: Add default GIC address cells
      arm64: dts: imx8mq: Add default GIC address cells
      arm64: dts: imx8qm: Add default GIC address cells
      arm64: dts: imx8qxp: Add default GIC address cells
      arm64: dts: imx8: Use GIC_SPI for interrupt-map for readability

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  | 16 ++++++++--------
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  1 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |  1 +
 12 files changed, 25 insertions(+), 16 deletions(-)
---
base-commit: 812efb8b495f2ca50795062b77415b0e8d9d7e53
change-id: 20250822-b4-dts-interrupt-address-cells-imx-45a128fb371d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


