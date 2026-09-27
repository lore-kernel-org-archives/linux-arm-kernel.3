Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9DFC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=; b=Fkg5gQE1Qq2XuX9ZuRs+euTd9A
	4HF3+OPOc3vgPGrX9MSF4qBUUWm4RZGDKqFsOr+cAo/fm3H0WaxBngVI3jzcR5gg2ICV9J8aAVOGW
	xdV09570M4vx+zNXdV9dNvyg+f3zOs7D6WsffVYNuBIBm3u21/ZCOu5UFgVbpwx7taCqyNwKh1HT3
	WVxX/qLBYMfTikyZLRIMcYgtUo9MY7Cree2qQu3QpBb1hq49oWmnNmprJnkMEMQFCUz3H2nHwdv9P
	2+kLc9g9YQruJw3KukP062XAa4PDyRBd3fm3/4RKzhyB7MF9e4+2+5GhUSo5/Sd91W/CGofLXt4xQ
	Bz72uINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYV-0000000GV1C-0pNr;
	Sun, 27 Sep 2026 15:12:43 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYQ-0000000GUxf-08Zo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:39 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1217938f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521956; x=1791126756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=biBnOK9SJFrdAd8YvBjVVByRUlUGFhVgpeo64yJvnjBMx4pPjBa8v56NQPjLOxsXRi
         2IxahcBvE6eFZZrtFZqtvWdUXuz9+BOdQVQIGV/0H/xvsQV3DiyRyWYvzb0kLyNrjGrc
         73vWGVyNliX0Nnq8KfAdN581HRLUG838ZWzIejonYGl/2iXwWxe0T70zteTEBG1dhvtO
         fKif6C87+eFimB8fBuxHcm7uCaz6sAp4v8Os5TIynVm2CHU5vvokZ3Evv0g8QNpVtK9j
         gakCZ4mMqrPEcyeAo01wc4uID3r3zq9i0Sh4UmalDDMni3ko+1B3rhBje3+ayeM0Iwm2
         e8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521956; x=1791126756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=2WR/TSOBpjH6jc+GmXbifk8efVVKSrFVnYF2PPzwksyzgTZmxaRhxvbKwyCH0TAk4K
         hPRX64vPq2w0qec7PAVv2FCmCh4ZvgbN0vpPQa80kLZHLiSSqmOQFh0whrWfdyLiO6m+
         qgyskwKl4JB5tBP0f60rXGaljCX7wBdFe6sPNVo88he5wQIMz34XKWOGFVjAW1I2qSvK
         Z54SXd2s2pBfxyp/5mPcbSkawtcFkngE1api01WkM5JfryBN1HnRO6//E4AGUR+wlxXN
         3q0ywlW4/xwdOW+OwPLjHAQ8zRXxiJ1oDKvbgsZ7IEzMUJcop3HoFa52CTRvSGC1UK1Y
         twOg==
X-Forwarded-Encrypted: i=1; AKwUvBxx4r9r3hYExM0cG4PT1LtEsDU2EBVFHLkCgTrP4QNG/upfo9bVecIBmBz07mgfmKgfyKKwcNz24Ruj04Csw2Lm@lists.infradead.org
X-Gm-Message-State: AFq9FYLtC6nO3R1YQOH8BX2GFLTVXwSG6+It4fz977aQsxj2W/yOXaAf
	n4hiTdSFrQCAIWx5ePevVIlvBhAoJfbXgNDoJktDg8nIIGm0KIswszqz
X-Gm-Gg: AYBFou33H5PtOSyDTaRJuGSQnx18jnmLj3rLhqIc/7u1IBPnUOjhRR5p/F4cf0/LXPe
	mWUHuuj8FDmAwjHhVX0n+RURBkozFQbokPPwQSisHP8RP5mk57VSpJtvLWlXuS9tkGNjLherOJk
	VAnNsgGBOqewrzGs9o2PWKtW2gd7aWgPFUZgCtdpjnb7+jcwSIYVe25u8pnt0r+FUJ/WHFhoCGD
	4GbNVWK4eT4ONSW6+uLZXwiK3ByWj9fIOhGNAK4oQ+lCZPQXBwBNoe8ZJmyyOFakkquKsm9zC8C
	llfW4bXiQhvexwH7be/+zEBKJlgk4db6Wcy5F/n7LO3S8QzxnyJAqX2lrQR3vY3DswMx+bnPLZd
	k33NbZMG/MmSW3WdIAJgc5os1ypRR9qKp0tBPWkBv98Gbyg52mk9Sh1K7etuaAEPJGdcRby+2TY
	JvAPHZldjoUSsxBHK64t9IhmqzueB2oRjm3nhTRVuAAKfl7UZ+HObDBJmlXQep1UkDb62tLP4O2
	71hYWHl+jmYqOmVOMgIeHllxPjOTvH3
X-Received: by 2002:a05:6000:4b09:b0:487:767:b301 with SMTP id ffacd0b85a97d-48879df7009mr13521375f8f.57.1790521956427;
        Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:35 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:15 +0100
Message-ID: <20260927151016.186493-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081238_120289_851EB128 
X-CRM114-Status: GOOD (  10.11  )
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

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0


