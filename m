Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DEECA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4aJei2D1z3FoicM/f9i0yAjxMJd5fQSpmo95ub9mBaE=; b=Ip3fAN0FuUwVZP6x+Em26dfPnl
	jE5bqPGdDul3mJqR7wFL9Iv1rlblKXHZx7/gznEKrw9r4v56soD4/XmmHvBCmmCYlppCVwhlDRzle
	Bj2z3gjxJgD7ZdvK7OoMVlRp6BNF/d5y2i69jprlF0wKFawPseV4mzyjM9705eCUknGQGqXlOXL3Y
	vCmw8C3oI1QhvC2hL8qLnBxtU7bNiSeMH5Thn32jwdfyTL2F6xFtIUt2rr2+cV8jXmNcYQFZlT3XH
	X6ObbfgP9Xrpbf+AHIvC/1+dmcXs9U/ye+Crnrm8ROhLrYldvrdYSbPQkiQ90K/K9FPC/3bK8gsMF
	EgRSsXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upke1-00000004SQw-1qQO;
	Sat, 23 Aug 2025 09:34:41 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRuH-00000002dm1-3zpD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:34:15 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-88432d124e0so4641339f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869653; x=1756474453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aJei2D1z3FoicM/f9i0yAjxMJd5fQSpmo95ub9mBaE=;
        b=fPiKBYzTn4G0uDJS7p/P8EsqwxJAQn5Zsn5tJEGllFkf1XLFrXQ+hEPVr9pvnVvH7x
         c3mz7bqWspW+7q6MR1Bkcqols6NoaTbXlbBkVHR/8wq5mu/nkAQ5Z3MPn8hI8vK0V/Q8
         S4VpzX2yP74AahcWLjUK+tC7mSNrmPsi3HTg4WmEqYqaGFO09zPRENsahqtd8/cBVdAw
         0eiI+XxwQAupQp3Wg96AZuZifpOzAghIHMIU4cZAMu1yycq0LViPI7jBq79LnE+a39dz
         y+iuVSqxjBXcLQAKT4JfhQUYZa68ZKaR23Jh7w/YpxjzSeE3Fm+G5c7NFachdHDGFS7A
         M2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869653; x=1756474453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aJei2D1z3FoicM/f9i0yAjxMJd5fQSpmo95ub9mBaE=;
        b=B9QjYXbfVz+P2+RsMG9GMKaFKSdaezhouvmFnfYX5gxcqu9puAZHQ3CMuavwGbyjrZ
         AEJN4RdaScu/C7d8x3em5Jd8KBqE6dCRey28nwFj2RowsQ5KFVTCGV9/ePqbbv+8GlTj
         OAHJ4fHTIwityWWmd7c4Lx2tqZG0/dw6FDB/zYWJGRPG9+f/mQP/ypsVylxqx9GhAes5
         yCqgR7cUmUea+Erf/+HCyVy5vg//9EhngFA6QJbmSRMLdQZU0PbcX6Qx/2tQmxBMTlfS
         kKUenujRNHC2AUTjeM/+7dTQOOl0joidBI80pqPP46/PTNsC/dFHM7I2/1sGx2WM650e
         yaOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQrecmQ8Kc9lwBabPbrBPOz7IkbchgmCoA1P8TqnMT06xYNCuwpZMrmJDp6R8gov/4Zd9P8JSTjkG2qOoPICb1@lists.infradead.org
X-Gm-Message-State: AOJu0YwtapyKztNYOxt1pzCcuOnPeDVVlkBe/Zyo/GbcQDbml/z4sDxG
	MbFdIgzzSWMC+o24wkjC8E2Qs6OQXgSynf4ETb6WuUBKMDlA5kY4TJbFLOHPDDKxO6FQdIZnZ8F
	2M3MR
X-Gm-Gg: ASbGncuGttOzrvWOtCQehVhOj6m1BH5clT+CKmjXbQahOQVEVBf4cZrrZJVxa8QbcAj
	LuPkHm0Q3OAwn/I3/WZXoIaTLyyODt0YwP4pwRBKFPsGIQ6xGtvp5rm6yk83e4yyYHTcBRymFO3
	yTqk/PEdR/kht0WbxUCzxz/Rdr9wG5S+/nq9RCI7kh9++Cd4zZKR9vipQGgvOLmQiIP9E1EMb86
	RrtIBWpW6p8+FbKOG9ECNRya2IQKU8j2aCrF08E+mgrZ0iyFVFPGnRHl2/R0jcHu9XbhFy+4rId
	sU3YnUbTWfjuKwyHPmThKkbdpBDEUwh2G76q83vEtt3Q1pT7JA/hBB2lUsFlRi+94YbWYZ9s+FJ
	zEjfLeYa69zIFOftXtpflCXvcE40z/t0CSw==
X-Google-Smtp-Source: AGHT+IFWv14XXu3qM6W4iFpmxaKe34h/+JST+1sZFMnSYZhgxLEm3aL6IP0FQduAVDsMOFUj0cWipQ==
X-Received: by 2002:a05:6602:15d0:b0:881:57fd:a0a with SMTP id ca18e2360f4ac-886bd0eb71emr149827239f.1.1755869652995;
        Fri, 22 Aug 2025 06:34:12 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8843f9c2cc7sm817991539f.18.2025.08.22.06.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:34:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Add default GIC address cells
Date: Fri, 22 Aug 2025 15:34:08 +0200
Message-ID: <20250822133407.312505-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+z/EFpF8WgN5W8/JRWZjj0WgigfKAKt9hnbpDkDegME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHHP9946N6yImc7LpXAfGj7MZi7zGmlQ5lX4n
 bKbW1wGjtGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxzwAKCRDBN2bmhouD
 11xLD/43BpRj2JOlkNnpXpTUHIpjuw5IL0zszbAjL6pKXjDTJnIYfhCyJPeO39GYGiVD1bUtFs+
 baWKJXFt+oGbqHXff3tjbt3a2NCAelyklNH02P0koNe5df5nLdzA43+as/prN0UUDcmIY+tfxex
 tVgpzcw+5bRK4pYcseVpxscCJnzlX+7YCKyGZGXNCfOkDHbxR+IN2kLAXLlrNqSmcSHfkr8Y2g+
 koLZ4BdH/HJvJKkZ1EqTJdc0go11IOX+UZTRYkwnkOuHlUPGe8It1Xj/bwlU6dWlFTCGkBm6Tbn
 4SEXL1H1t3+g0o2EWkXeJ5HWuEHy2VXVSGlmq92izX2525xFw+lFkIeaM0MgJwxCTlrP8X+0bNo
 3zwc5Y7MI0/8Mj+TO/gPzutmO3m3W9F057Wlle/pTXEfe3GjJsbTRbYLxA5H9jp3H3vNvivdp8E
 +9YIJihUjcmHXArYPCLExr6EL46399vcZW+lD/kdH6iOGu0YDdjDTY14bLa9rkwmmVC+v5U5jWP
 qg/YbCQg+otOZAMiNLOkBX7+MztUyNaAuZIhsg3HgDl0EgK/0Jc6KEXDlcotfKIyrPS07NLrp+g
 0JDU65KmpiYXjZ+n5IwNWldRFSvvQkdEmbEqN2IxsZEgRYyT/8MhSZ9mS0vRpPF4b+NAm5HfChV 8jVOHCHNicTCpXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063413_993150_58EF4A60 
X-CRM114-Status: GOOD (  11.37  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map:
    Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f..940f1c483198 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -270,6 +270,7 @@ gicv2: interrupt-controller@7fff9000 {
 			      <0x7fffc000 0x2000>,
 			      <0x7fffe000 0x2000>;
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 		};
 
-- 
2.48.1


