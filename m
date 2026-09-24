Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393C5C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=; b=LbFujoAd+jG3QX5m7KK73bn74k
	k/HoAEFGvme4zNujh8bWFY+YMGhp3CcBnoWWhM4OEGZ5ekqBTBZ70fdnrSpYBw1CclkJQ8Xlk7XF/
	mdjo9DEAJxv6OHF1NoV++5TNp1+2zwYob/pLtD78vhozd50SY4QIa3TKjkjR8B3Z0I9dFU/itwdfs
	beswacKQH+ge0rQd0HJGIjiFzvz1HpCdMFDIiiCEfQWhmAsOI3Vb9+bfxUi38kRb4CeG5Z1xZGTRs
	PcdP1QRc6NPrBxVXcYd6XAvdDL5Sm9Wii7Vv3hEO/NowYOrTYV0AY1K2sYuLxtpIi5QhV9SCB3zrM
	aYB6HRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lOY-0000000BPtC-0357;
	Thu, 24 Sep 2026 15:29:58 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNp-0000000BPKi-1o8t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:16 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so20140155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263751; x=1790868551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=y3oUVt2ZJb92CXUxMg1i8ZIZFFxc4pFXiIEnnTrN6SAXoAx/OP1OpwzSvP7ThRl35D
         ouQA7m5AhL9u6+E8R94zVCT8WE433QcE7A2HYVyuoRajHLCuZt/jDu7zrvI8O3Aq0Ry/
         f+T90rDWZU891cGXslf8Vj6L+2ERcnFls7IMiDdp1VAgw51vgGyHJQG7E3D7GaSrgPBa
         DSmgXE0Z/4jeIdBueI8uK0fXl7wkWWHlVTYl670jd4O/QMHyTZZqqEbrUhkmQrU08CV7
         Wg7XMMwkJwLAst/pxHW2nmDrcR9U+q/PWUjau/U2pLSEMRH1HOeYyHQkuhOcTPa9YfZq
         T/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263751; x=1790868551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=U1t1MUy0LJQfcpheYbsbRxClCZiL18XYTD2lBBAA3+q/CJW3rzGBB43RYMURajgJHS
         R01yY6Qkc9mavLMYTzu4RWypgAgc2mX5Uh92LcF0z7CI1G71hFzWLlzAq14k17Hum2S3
         VueTn4BB6oVw6fAzT0CP0FZuO3MYzq8knL8rKoPenLDsZ9d/hvARWj2s2byDAvll9dLz
         oJGyQeOD5wGNeDzZFcvhsHUFzgEpI9CIayESp+Mk+c5Mj0p0nRiFSKmPB2AGD8raY8A/
         ckkjMDv2Ap+08U2aK3NdNok0j+kkcJox1gwaKtk4rX7sjs8lTSmgvI6RUVUArcgvt/NM
         rgQg==
X-Gm-Message-State: AFuF++lbMVdi01Dbcm3y4cywXSqNILsUzii/29ZkGuuqkgGzvxNYSFV4
	a7h2IMY2n58911Vy/YEz1rc+SI9nyIzwqtOcCmtfNI/5YaxcvESLMGoi8FTHcOR34op5SC14mX6
	KcUUu5AQ=
X-Gm-Gg: AYBFou2Ttg7YOT+SKWzepYbI7z3UAg99iDPqSVQjPKhfQrCHSoCADF44lLrhEabhNnz
	pm0BIu/XUrw3paEvW4toXt+MwmxTEwJg3FQb/QxJj+iFFobpNeqop1zomf+A3MdqDXxUILsG2qH
	lmpBUZj7P03b2O4nXIeQ5R5DmvhkQz67WiIAwcIhP9qrLC/6io+ZivqFv2Yu8q/jrkbVNPKxeWU
	uXFcuGd5pq4Uoa30NpDTujA40MjSkUAWripuD1eh/r7epQHQ1ot6ZqZAG4pin2JMfTVi3Ccl1LD
	VIQigqb02qp2LAQofBRmtYx3GkdeBY9ikgSgEvMAf+BiVbeOV17EdcyLSeRB6Kv7oO62YX7E0Ca
	C7rArrw4eHxd3/OBFZe1eCdHcGXDPWjYiFtcVDpMsHezSB2Y0Sp85xeieRCw/HYjmTpC9MJrIu5
	G1ERwtcQqcjMAF0enBuFjHR57wca1kf/xXZZyT071lkN4tX4TLOGoMF26sO7RjqKCFI/Q/siWWp
	l4YZran3govXd6anyepWrlWpmgFXiWKhPKO
X-Received: by 2002:a05:600c:628b:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fe66d1134mr46747255e9.9.1790263751266;
        Thu, 24 Sep 2026 08:29:11 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:10 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Thu, 24 Sep 2026 17:28:40 +0200
Message-ID: <20260924152844.81705-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082913_481054_24FC9EFE 
X-CRM114-Status: UNSURE (   9.24  )
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

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0


