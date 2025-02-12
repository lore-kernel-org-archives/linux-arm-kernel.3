Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB995C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IZAy/eVuHocLtw+QAdIzG1zYEhIMA++9xC/HxPnjm/4=; b=FoGRkUb+8qeOP/bS+c48uFqOlE
	9jOXgGXgain6Fifhm8yv+AG3XWUDTG0nSWNdO/fUCpnIarBsGiJumQk4mCGaJCppZzl7KlYAWEg+n
	9HDVn0g236+u7P6E5wQTVkMUijh5z1DyPtc92IiabDCpZ2RqE00++R99o388VcTD6u/PgZyhR5RsB
	iuAUaF5ms90PMy2OqOL/vO7gwz+BayTDdXUNocqh4RCwrDaH3+o+Kygv5ysOKmZEJV2ArCxLwTCxC
	t/Djh+qrr/WkE2EsmuZfWVOUv0c2ERHfhjBJ9MAQePJpHW4dc/AIyjnQifdV3c+X7iC4EP6cYthAA
	OasgtY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFWc-000000083uJ-0Dxz;
	Wed, 12 Feb 2025 16:23:46 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF9e-00000007yOI-21XT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:00:03 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-866e8a51fa9so583331241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376001; x=1739980801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZAy/eVuHocLtw+QAdIzG1zYEhIMA++9xC/HxPnjm/4=;
        b=LhpzQV1AoLrRB8MVk3gn6G7R5d6DJx525e/6D3F9R3YA6B5YMgE0XdNpdSygzw/ZK9
         qG5X+E3Jf8BLU7d+qftuCMpbsSJmDPpmLe3opsMG5ZZYV8WFq9Oj/MV2M6Ywr01yB3gH
         1LTRYWvolclVj7afPrHsFHN2J8JPEOGCS0ImI3AG7gldzWxfZkXEtspegTIM+RTG+oMW
         /XNpRUJIN88+dloan6X+80FVBh50V8ZNDDQ9q4pk6bI5uNnIGV6NGtgIbWhPGZ3az4Sk
         A6TfTSI81PQYwpQ+Tb+3PAzkGuBXzUC/5JKVtz4I9I0vWcPv/vJ+jvF3thbi2vzmz49M
         9DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376001; x=1739980801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZAy/eVuHocLtw+QAdIzG1zYEhIMA++9xC/HxPnjm/4=;
        b=QnMBwAHjTvGzeNx/YrtqMWF1ig0CNv+i5RLdFl44y4MoOFpJpF3kxjmG8IT6S+HMt/
         AGMSpd0YbtreByuHPtiGAAtNLfsHaIcaB0Eh2nojOdNE1t9v3TugEva9i9NgU/m9EAyD
         JMJAfTTkVE0Vi4JvAsPOmai8NwdFvkfcmBCWwfWIfnDvBRRfbt1TWZEwUhaVmCNlGWba
         F8400gKNjlgAT0aLHsLzc49RortRSdrF7RPCaNZAI2MfBXOznyTJGapPjSkcz1lcs1nG
         om4vgbTZFTrVYBH0yqMhjBXZwBTp35St4VvzPSwaKQhNIyNxZYH0y2KjK0TjmOg16e+k
         MJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCXKP06aTUmMjHhUPyTZE2m/jYLfxQI3yWr5QUsRhN26toaoKdkWGnmewdwPCHMJ63LWYmZZCr1mVmKWRCQyYgPV@lists.infradead.org
X-Gm-Message-State: AOJu0YwwrjSrC0yCO353dYpFaTqiYfxaaQQkLTfKUGvWl5bSYgbByiKg
	QQ7UmsEvLvW9iDBuuvOysQrP+2HyCEgSMIUHqzyzw3iU3WPJco8e
X-Gm-Gg: ASbGncv5HjTx3d0uVPpXFyW5pFRKtUzvkMuY1xCjj1NfNtSP0f0Gbb8U9JFozOaRF4t
	j0CKlIwrreOJ0ezdH1Nnmy3EyFO+6UrUCrEJjPGAnNnKStPeYgzWNwK8nqm2SU8ylxge/QLmJOO
	iJv/73Jnh5gCjMYLOGc0XL+2o8qSIoOp6GnFCHrcY3rqY4D4ZE0PQ69aKZpjk4kvJDfWLcqK0Vj
	CDQVl4B/ARkS1fK7MJeMHZW1elvirLaRAflKOqeyfnBa8r0TiTdBWqVRLzb1PRxxleaiBR+cIMV
	/SDm9E8oCIGWMeAaQVa8D1n183pv63PI0XHxppknWkv0FO6taN7Ouny6clU9MBoNpvO4YPYd/Wc
	WLg==
X-Google-Smtp-Source: AGHT+IH/AsMNaYbBvPxCWDSgZZjA1ZLTc+PqyHoxHdTOXb7RxYggVLAoaNgvJxCHflzGwmZgt2iujw==
X-Received: by 2002:a05:6102:3907:b0:4bb:c670:7ef4 with SMTP id ada2fe7eead31-4bbe1290387mr7187891137.3.1739376001101;
        Wed, 12 Feb 2025 08:00:01 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9636904sm2335213241.3.2025.02.12.07.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:00:00 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1 sysreg for Exynos990
Date: Wed, 12 Feb 2025 15:59:42 +0000
Message-Id: <20250212155943.269-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080002_539826_A16B3DFC 
X-CRM114-Status: UNSURE (   8.92  )
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

Downstream from the Exynos990 kernel source it has more sysreg in
flexpmu, but for now only those two will be added.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..777a2c458 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -87,6 +89,8 @@ allOf:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.48.1


