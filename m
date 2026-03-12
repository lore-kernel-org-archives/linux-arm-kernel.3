Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD16FED2C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=; b=f4jK3dun9T1BIQsosiw0RVXQUv
	UYpmv3aoG7pU4X2X7kNiwyeTKgih0uwQ1ORiDxdRaGafa3XR/UBUKnauH6BLHmt3jQdPoOlPKNyf1
	LQt+8mhYThjI6byFcyQQ+YpLO75XA1AMrAOOVEao5HkMpODHnuNmYWRq5cYnJm2AvRDHHHeVuokqX
	U/2bKu2zQFcFYjpeYYaY8DwmvMrnKsUceVjAWNt8yG/yko5O951ZDbET6A/hqbFQRkIFjov+jxj/C
	MjQnPYEUISZMpARSlZh4rzNdmq6/0yJDeA1yQZItV7bUR9PeUmMJJWl6x8l0Fflgtbr3AcB1yfRbZ
	a3S3qnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTN-0000000DEXt-1eX0;
	Thu, 12 Mar 2026 04:16:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTK-0000000DERj-2tjH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso285989a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288988; x=1773893788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=Hmo06y7tIRM5WuBcZ6SJ1NzHh6wn/8FhuoVo+lrSLyxC29S8YKlQtquXag1UnDfEj1
         25WAPUqjtZ88/PFh+sVPpzUk6G4ag2awXnleD+UusSPxZNfQzcheuVHfwAGBE5Dl3nQG
         XZ6aFN5mylgsYfGKxw6YBEpP0l8gtW/Ary91lhNyxxKZGObun6USigC9CUgsPvZmT005
         zfBGvayhIClJLzUfEbdvlJ/SCfhvdGMHEXc/lZD8gSY2XfAApgpE70UTTs9BuYDGe4cY
         U+wvURcQujgecQzzzhzeRn7sY5R4vsXAIDUpNBtY0xTZQ7B4hsNEIAYcjT4trVdDZsAG
         TMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288988; x=1773893788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TU3zKdAv8f6aur/yAOI6IEeaGLd3rNJfqjevfSWZ60U=;
        b=YbclY5VribZRgS7wAcr6CxokZKJGhp0tjrYySgzhCBmeZN/D5ihzXgh3DIVnf8oTRF
         DnPjx5iOq+dk/Ms33ee2/whVEMI/S8Q6Yxwd1lb7x5amnfjh/cRXn4HuzyEt3p/Qp1tU
         Uy418smI0Xc2GNH4M9Cp9qfFS9lmA1Aw9M8TxPfHm+1XEmOIpJImwQYwxxqxfTdXUS1e
         bemOAce4LyIqqEk4VkLACSgbwjC7VlcJyAwjGy+MTZD9xINDGpoeus5EMEYEYPiqmb5B
         EtgkFd3FIKZlECLsr94qslRlvJi4n5G6xjKC6Sxvkqw6TMZ5z9l6OP1svAtnEVEw0NTU
         l93g==
X-Forwarded-Encrypted: i=1; AJvYcCWJJT5oDzSZl7pTXndLcJS9xwLUaNgAkzQJV9hnMwS8RXL0MqsMSbqTvCBeWDZrgB5hcRsqunBUcG/ozqYU/P8B@lists.infradead.org
X-Gm-Message-State: AOJu0YziklKztdQj0GHfvXfsiCNkfomhLWHm63MC/fwNdR7XVssf7c3s
	VNx3Cqz7EJdFD6H0sU81k7/Fpg0TV3AxVy54P6kdL0PK/X+5UYPPmGxx
X-Gm-Gg: ATEYQzxde0XyaPak2fmqfbMmo/PaLBz1B6D/XeFtoPhPg3J3eRkKDkpzZOt2XwDO4Pl
	qSmF2i0MH2VWxvMpfpMtCeA7eQaZXAFCYRIZ4Ef42IpkeA7JyYhrmxI+CEtaH8gLlOzX6VFrXsb
	KiK1Tf6MrxP/gBm6ZezVF0vRehnaKBTPwJLBnmCpOfqB5bYsmP/Uk456p3dCGjWeTs0MDJcXyLd
	/M4pmyRdL1k23PMled2XdYsBKMferm+lnvVZdoS7dtLhiWZ4mcWWHnOmW/kncMzlz33S/xb0sOO
	agOw1JBtfY1+TiKFbe8Au5tFMaYIsx5w71HGvf/K0Qy8V+eZ9SzxOAzQXadbl2lifA6tIdnZF8C
	HsldZWL65af8PxZghQctoRSOocwhiD/1vK/GKT5fDcc6ZkzDugTERFODxmcIxYlEwHE8p/VdyaD
	M3kdKf+wb+CIN9voXGu1owJDudXXLEzer0lnIgxCXIIdDPr4F1cXP0XHhZhKld+5MHBmpHlwny2
	eaMWOg=
X-Received: by 2002:a17:90b:37ce:b0:359:120f:d3aa with SMTP id 98e67ed59e1d1-35a01201dd9mr4941745a91.14.1773288988147;
        Wed, 11 Mar 2026 21:16:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:27 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include guard comment
Date: Thu, 12 Mar 2026 13:15:33 +0900
Message-ID: <20260312041533.187553-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211630_729625_7D2EF027 
X-CRM114-Status: GOOD (  12.28  )
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

Correct the mismatched macro name in the #endif comment.

Fixes: 9f1bdd7e8221 ("dt-bindings: pinctrl: mediatek: add support for mt8188")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
index 2688da2f621f..66a451953838 100644
--- a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
+++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
@@ -1277,4 +1277,4 @@
 #define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
 #define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
 
-#endif /* __MEDIATEK_MT8188-PINFUNC_H */
+#endif /* __MEDIATEK_MT8188_PINFUNC_H */
-- 
2.53.0


