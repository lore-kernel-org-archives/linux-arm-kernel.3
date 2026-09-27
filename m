Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F69C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=; b=lw3leX0lR2REqZN9VLuo/41IMM
	we85SM96h6hErnvmX6V5IN0zFNwJ4LeuDZu++ka1G3hhkjKagjMScc8TNcOn17Vr2sQ6QsTu0/keG
	Sb+n/JfcOSAn2PWZW6b6CFp1EA2rbjBqIBQjhZeRkRWWOVhEQnvzJG+FUdRfKGgQBLCcUb876ufTn
	drekSwGUJDu3zNk2O4vgE6/fWPEDnpYDTUAyzHln/PqUZrhQqVR8mCnhjM5d2HhqXu4Sv49Splwzl
	36ZFKQLRud5FKO1zs+CoSxNQ4eNCo4pNMDAV5ITtJ5FhNc9WcN+RgHfv+ViXrmRm0C2gF7lLA6SSB
	ppOXB5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYE-0000000GUrH-35EE;
	Sun, 27 Sep 2026 15:12:26 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqYC-0000000GUqJ-2c14
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:12:25 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843378fb37so1310241f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521943; x=1791126743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=fPn+S7pBsh+JzdwLDf7dSHHMe5PtTZMU79RPcKuh+Xf/uXGsdGpx0T1a+L1iP6rWhh
         FfAIeSyAoNkpgMzwHoSytCkkKwEHtRNRuck4oqR9Df998agjlZ1Lt1OL1guTw7LtTO1g
         mgBa/LEidA4QaxwG+QfibUftrdNQRIILJ2F7f7HV29JfgkHvqeo9J3RBAkapiIeo2pOx
         VI7eh7rpegt4IsXd7H8KpqXt/twpuTVPummWxetH6BPi38W159nuY6tRpK81ECfNhU8U
         trWtuzw4AR2XRi6NaUvYpIIaEIuowu0aBpn63Kd/p1fTCuu05DoxOeR4Id4Uq1LXwqrM
         QnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521943; x=1791126743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=sE8/amcMIW+Hefr7u1Msi3apEdguALfLA7kd+wvgp6Y90jMHpXQeQLkaz7M0hI3Yxf
         Pqz6AioHjKqejD6RkEPINMeM1uXzr3ipkmQT7lreHVEqRJ012w11yqyjZlkOXhtqNv5e
         7W3BhZywLEI+zusk6VOQqwPAVMAikybWdqO2NCBUVuPPJP7Gbj+ajJ3dSAZX7nx0Gzj4
         RjjNPO6Fz4mIK9LI58NHj7Jmqt2+6ezEe2Ocn2GbISLydfzA9aLb91SoCKo9gAUGnRQl
         2qwhAawF5146YBfUst7UcWUoba6Lyx30BhtnH833ak5jwBU8aFssSGM49CA2RFcXIfZg
         rUWw==
X-Forwarded-Encrypted: i=1; AKwUvBzQjyURjXUYgg7k+hvx/xsVQ9VZKSy1ywgJWLB2bxlxz7t+xWUSD9uAljhQM4a6qlq+gnOtB2u3dfQbvr8L1L+Q@lists.infradead.org
X-Gm-Message-State: AFq9FYIW3z74IcFMoYZA9XB7S55bMbOjK+thbcQl6AT1oo4S4YNDs4xM
	2pBkvFO06Uu7DFAI+2HPmUvNVaZZugmDIAlI/jgKCYwE/8K5gQFqMqDV
X-Gm-Gg: AYBFou3DYVEoY/jb+qDXP5piccDWHRwkuli5AqJ6NoV05bLGnIQQEg/tVy5ZR9YHsKd
	AbuKL2pwPseRSwM0hx/XyUeCXj9tmZ8LuTHruGY8N+NqM10EwiXDSKmDsO9oUdKonDXH31QwdbR
	neS2UPu/i5rTgO94FFznop43UlG7oL62+9ZdGOLaugqGrZsPoiM5uHQUxHji2NO4fnA80v69T0w
	6u1Seh6HEiPyD7QmeFbEbhuLVjL+jHKszxQnAz3uKZPocHDQR+F1bBcRienJ1/HjAOG6nqdJapu
	mVsu6+CMolH5hxFo8XlZk1TiDc6Xv4/i05aqkVCGs0U/0SqkwFRY9UEvZIOSK8NrdoZbJuR657U
	DaZsZu2/494/1mXBetEiPFrm1jT5UYCn+0fH6ejpDO5rVPjZX//IseQGd1IwU1BStNfK93OYxTZ
	DsVWIqiDjXKr99nsZQZBTehXsy1mQy6kPI784a+aUvo2Azz7S0a3NTkhyMye1UkMgfOqUGwznh9
	H0f9JOSsCOL0JVxrn6Zxfs6PFaiIX5Y
X-Received: by 2002:a05:6000:4693:b0:487:342:d141 with SMTP id ffacd0b85a97d-488774f4f02mr11163439f8f.23.1790521942896;
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:10 +0100
Message-ID: <20260927151016.186493-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081224_674618_3D5A076A 
X-CRM114-Status: GOOD (  10.13  )
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

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0


