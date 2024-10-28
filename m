Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1490FD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohUz9CtNZvlwl/uKjQaJUL1p7+iSw3LXALabDVJ8WTI=; b=yBN97rNswMnL4TO6gBRH0Xco9p
	AfGgXzlmkdD/8v1/VTIbT+xknqm/Qn2WlvxXtY37ffcWm7BqaZGAgiBVcUKx5k0bpRAG/zX8OWnB5
	Wh8YL1Km3ioXFyC8oFZf8HEN5XyU+tfmZDnEMSWYLcZHK+sNmykuKpPAoq3v5/TbCFZt3Es8RjagW
	dF4GP6zfmJo9JSAV+hHANB78BLliJDbmArJb58JMeVh2xoGCTNjGFF725U/ylA7HV1ExrKqRtw6Fi
	6AioR9KJSCmNQdMBJKKXlAavbAp5nFvVQAa65ySn+U0n6zaV8G9Xk53TwfGf6V0V61IcfXiHVNRcr
	ArT6XZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XlK-0000000CRTA-3ND8;
	Mon, 28 Oct 2024 21:58:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XMx-0000000CLet-2ze8;
	Mon, 28 Oct 2024 21:33:48 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539fbbadf83so6135662e87.0;
        Mon, 28 Oct 2024 14:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151225; x=1730756025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohUz9CtNZvlwl/uKjQaJUL1p7+iSw3LXALabDVJ8WTI=;
        b=kv25D/+NLXL94CCs8wz1JjYP9imNEydbT03NfDCsJTLyYtvOcLlj5U7BNEOrRJH2T4
         5AMy/Nq0A7O2mhABUGUpiAs2UBdKGn4TTCoNJCnc4h4+gm7OL/em0GAUGdamhp3VxJPy
         Ktzggog0sw5733c45qh4arlre0yPThHmuX0diSAVVf6TFoyq66/oyonZ1P8Xn79UeIC+
         KBIAtyFwTrOsc7L7kQ4MC5PskH23DLFCrZygkG0zyJprUSLAJDQMC6DeTqTT/7mLmOP+
         cNwURersQuszkHaFbT+njQcv9JXMgrW/LhSW42nc5uWg9vT8bKdhlVKj/1nKHNimTRoA
         v7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151226; x=1730756026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohUz9CtNZvlwl/uKjQaJUL1p7+iSw3LXALabDVJ8WTI=;
        b=xE3NG/3/wyD20uRoUpi8wrdCkunf3JX63SeJNYQeiPfZxnrPINCqMcZCb69ZO+LLpA
         A24csQslSAqGcbiqeJp6Xr3tokvjU1ZzRIbzMWivpQEpMsuUFc7wOzd5jGBmaBiqAUjr
         hrkiG9HnRgVe9zzVphyTdu27TXtFOjSUS72nMGAuinfAV8F/W4AlYETb0QOGBMFfJVVz
         U+rLhp8Fm9sgxyuZDCzIUZG/wzXsVuJFUwmtbLtvZkoyZuh0y0bFWbAN7/YR8hwqQBms
         dCPqLGKohzlR8b8qLmDudlMgtSIpa7hn7M7/9mXSg0dcU3oBfJTfR3geKYMJHvqVSyTA
         IagA==
X-Forwarded-Encrypted: i=1; AJvYcCUNH2+Vu6FgfRJlHEMOKhwX7NWZfR6vc3jtGeYPYrQp7Pk8vYNPbBSyMtB8oMhGT/nX4avI6HL8kzDJZl3cM1J+@lists.infradead.org, AJvYcCUTuKTqvxHbh2PndpzmeJ3lj4OzXeDh7ShwC2U5RPK8kG07eMULF2sn0ZdpfYeR6VKtujGb5N1RlLC5Db/KQbI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLhlTNL4sgu6k81DeRoc+Ane/kk5jNKNKkxA8ZKowXlO3eixNU
	4igl96bI08ie3H4Bj8IHF3xZA1ut+5sGkJVmdwW9eL9538IFOvlm
X-Google-Smtp-Source: AGHT+IHboX6tF/kL9fw5rWbEKTXeKT55CdmXXqd4xEFP/Q2yeXehfeAx1CdLdWoclTqVwxmFpiSWXA==
X-Received: by 2002:a05:6512:2820:b0:539:9505:7e5 with SMTP id 2adb3069b0e04-53b348e59a7mr4446540e87.36.1730151225390;
        Mon, 28 Oct 2024 14:33:45 -0700 (PDT)
Received: from localhost.localdomain ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c98b9sm1204625e87.224.2024.10.28.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:33:44 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: add Banana Pi BPI-P2 Pro board
Date: Tue, 29 Oct 2024 02:33:13 +0500
Message-ID: <20241028213314.476776-3-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213314.476776-1-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143347_772472_5C588E08 
X-CRM114-Status: UNSURE (   9.73  )
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

Banana Pi BPI-P2 Pro is the SBC made by Shenzhen SINOVOIP based on
Rockchip RK3308.

Banana Pi BPI-P2 Pro features:
- Rockchip RK3308B-S
- DDR3 512 MB
- eMMC 8 GB
- 100M lan + onboard PoE
- 40 pin and 12 pin headers
- AP6256 BT + WIFI
- TF card slot
- 2x USB 2.0 (Type-C OTG and Type-A)
- Headphone jack

Add devicetree binding for Banana Pi BPI-P2 Pro.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1e3eceb266b7..0c85c15d5c04 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1104,6 +1104,11 @@ properties:
           - const: rockchip,rk3568-evb1-v10
           - const: rockchip,rk3568
 
+      - description: Sinovoip RK3308 Banana Pi BPI-P2 Pro
+        items:
+          - const: sinovoip,rk3308-bpi-p2pro
+          - const: rockchip,rk3308
+
       - description: Sinovoip RK3568 Banana Pi R2 Pro
         items:
           - const: sinovoip,rk3568-bpi-r2pro
-- 
2.39.5


