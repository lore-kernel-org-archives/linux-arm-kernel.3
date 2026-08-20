Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16081C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPrWoN2v8CC925FSKCBaAsH1PVinm6f1QGFGXJ4kZhM=; b=J4Hvis9MRORaV4novQNkKFrnwo
	qdD84KuN+p2UnGd55Mf+Mpt8lX9048lC5bIkwhQUARiqyJb7YDUitxnr+6sEmlVG5QQRfetbcGLi1
	3dl0cjH+7XiFc5gfLymCKmkr1e4anmazSNsOVqSTnFeo9yfR1xTvQGM/RmbbbSbPeDnRaL3wvF9ZS
	dukeHZ2uVhQPjqkMC0V/9Xo0x+5VTTg5BOxwYL4hiCG1GlhJbA3iI0cEzkUANoUXNtDLa8vD0yISY
	h6y9Mf/Id02vzR4J+iwPMu0F8AEfMizOPmgZvtU56SJcOQRfkKSafSRM1r6ZgijRhlsuAVa8SJIst
	MboqTBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3ib-0000000BhQ5-1maD;
	Thu, 20 Aug 2026 14:26:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3iY-0000000BhOf-04F0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:26:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47fd4531020so1471407f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787235964; x=1787840764; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPrWoN2v8CC925FSKCBaAsH1PVinm6f1QGFGXJ4kZhM=;
        b=A8jt9nhKfwxBvuxaSGdZdq8yYlUrj0REPxdk5ynNZoJeknsxGIF6VaetE+Zs/fFlIi
         E+3bouKVh1KaU3UeGBc6uUiosFaaXgnQ2QlR3j8tOPJqqFXE38nTgZr/VF/YdoXHHd9x
         4as+TejQ7su5P/xjyvhZwaS6ejFTugTiZxV8qF9iekvc9fv6cw6Ar4uB+LxuBSf/ijPF
         x9mTiPUGkLZ2etYbcSzSBNcRiSnlSvqQQpqtGbi4/Ted+UABEDUUZTNJYD3C8O7hvGok
         tu3kRCZE10ZhWGHduk/KEY3S5jxewH+3LkE+wuNvB0SBY8tStFp5ozFvfP4Gc6v2CfaK
         PWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235964; x=1787840764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPrWoN2v8CC925FSKCBaAsH1PVinm6f1QGFGXJ4kZhM=;
        b=CKo58Ql7h+K+KAkHceg7OCUNUYoh0m+EtDjMSlV+R6ONilK4UGvJG8Gp+WujNXgnG6
         O5zmTDcUNOePIthtd5h155djsLnR4EoXvyBLL+kzf11PoxLV+uv5JvLF4PdXNuStwSN8
         Iw9wUglp01UTl8sXPaNQ3dMUETnNcZJEFiMeLQNci4KqbZFiX4Oq40Kh20wx9NfE6/0w
         igt60MWQ2DssvtVLLa43lpNP6LFjEcfQgUcHqgmghCxXi8cj2bRrDxxHbcfBpZPoF3U7
         XMGdJCP+hPkSr2kzRbH8iZozxyYtoUji/+/Ma8oGUzKEEUYQZyOb2vOZ+EqOU581Cb4w
         T9Ng==
X-Forwarded-Encrypted: i=1; AHgh+RrE9ijb13PnhtSD02fojMBZ3RaQOjgJmgk+N1FLIN5L5VR5BJlQ8B4Rs0Itr/BEgpvbsB39rycaeiyReAaIOmW1@lists.infradead.org
X-Gm-Message-State: AFuF++k/oMqsLKB02tP8mK1xRr1qizHvFmKAAcysjsxz96hw4PxUdUwo
	LUvZ383jngXtGce6hlJPrIe/Bsgu/Q0FkrnhjVNel+4HQIKX1VszpnQ4
X-Gm-Gg: AR+sD12mEkd4WIE80+YgdmboycOkju6W5uH0xyqh9H1TpPWNWh6+McaHH5QmhdWdKQP
	Ce0y7yO4JW525OirkpPLEt9isumtqbRkh7ersiDFLEDgNUxug/ilBjbSeCIn19AbNV1ULVsykbK
	OrB1QhZnP6fBFYEWC9qG7kQUSeTGppn5pBu3dPlW7EbGp4+3wKI+ot+wCL+T3SnHgfdkGszhsYR
	6uIYuhaW1706jGLZ5ZKo7RCO14WGVX5UU+09raQdFguRAzJwLY9bBcW1koIvQZ4RcTK7SgMXq/N
	eM5XSuo+wLvutXDJuWnT0dQAkVrcP16XWOk7FvH6L+o3q3PFHV6Yo44Y7/ALTOvYa8G0PE0r16A
	pENIqksbchw97VYtkfG91gbu5Vs6Mdme2tW9hh3/MAFKl3q/9nZ+EZQOcjcyPod9Ksiq+G5w6yT
	zo8BMaMhlbT8HMGyEAk6YnBAQj8IqRBZD7jj0E75QCT1I2DRpaDl72FCz4qqp+3Mu5edZbbgmmH
	x07oCrZPtY5uy5IL12xd2RiyNB3pwhfgcKNQtqriM8J1XSraDV+Jt9H6yk=
X-Received: by 2002:a05:6000:22ca:b0:481:3db1:a62f with SMTP id ffacd0b85a97d-482b1fe6ea8mr22171478f8f.17.1787235963992;
        Thu, 20 Aug 2026 07:26:03 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145153fsm13594027f8f.12.2026.08.20.07.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:26:03 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:25:53 +0200
Subject: [PATCH] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHAOh2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3bTMCt3ilPTcxGTdNAtzE7NUYwsj4zRTJaCGgqJUoCzYsOhYCL+
 4NCkrNbkEZIJSbS0AzGDhlW4AAAA=
X-Change-ID: 20260820-fix-sdgmac-f8746e3823f5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787235963; l=931;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=4xe9JdHgCBai0JGH7S0MmxJgvM0Sop7zHwcV6p6Mdp8=;
 b=a0/mk3vw2cDrDCh3N3xb5RpnXZy+PlXS4pMzL5B5MsHyFd5/98OYiE/qHXrJP2oDVRBMDgDeJ
 focdUrojPcfBG0yZEDZIyJ7hrkJoZaLdUz0mN4DF30pUoyrEJEipXIm
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_072606_083587_7188BB3C 
X-CRM114-Status: GOOD (  11.52  )
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

The RK3576 TRM lists the SDGMAC_GRF register file as 8KB. Adjust the
reg property size accordingly.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..d418bfc04097 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -970,7 +970,7 @@ vo1_grf: syscon@26036000 {
 
 		sdgmac_grf: syscon@26038000 {
 			compatible = "rockchip,rk3576-sdgmac-grf", "syscon";
-			reg = <0x0 0x26038000 0x0 0x1000>;
+			reg = <0x0 0x26038000 0x0 0x2000>;
 		};
 
 		ioc_grf: syscon@26040000 {

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260820-fix-sdgmac-f8746e3823f5

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


