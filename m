Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F41E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=; b=THw064LKwujxfksVywh592rlcH
	W2OStCvDUbw7H8fQJd8hMe64Y9/FUwPfG7yXBW4IdbwYEhWG7AT2Vj7nLangKyE64UOdVxtI8K5/3
	LVzTlS62iFViyYtIQ7IELJpoo+q57nx1e61L8AFEVVR9rO4qgiRI5z/TKDSjwdsSdKuo9MXOb452Q
	phiB8AKW7nJN0N4VxXSmHZiYa8LBbsteX8upZcJLDC0iB8YVTCVyncjlhGiaDOUvwfxYZGSUtfxRu
	Auq1IWNZzIIeHdW3RUCS1kqvKFaacq//gw4DL+GOgyPaSAXBhClsKwfefd7m3hd+MNgdoAsIO9db/
	z1r+//6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkpB-0000000DTQX-2Rr2;
	Fri, 03 Jan 2025 16:47:01 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkh7-0000000DRvo-3EJQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaeec07b705so1262409466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922320; x=1736527120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=TZUi57quApHK+FLWFDNFz2Q+6bm9cKRPDQ2oIu4VbP0IxpVdgH+SQ9RFWg061WZWz2
         rDBlG82VNdGoSkp8DDz7shhqCACHB7r57DAd9qqNyh67ffaUJOuBUq5x31SjeAGspk6m
         KwzeGIFn7w4mGj1TE6NoT8gYWknozhnqQWbqFWp/1B0iPrVMknUBUy0ejL5Ea6+/u78k
         l3xLmRfOuDZH3X4SAfzg2wr8cQ8jlM13BvXvdRE9PxNBm/H+GOut3pmGYwVSIypIj+fC
         1VhMCdi+pKBD4yJGVQ2bCcGSEwEIdQFNbcA/KMukGrgPeYm9osMTSj//pD5aNzVlFRRP
         l9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922320; x=1736527120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8obrWVZsJoXmrid0pqmVf5t2hFsLjtOlv8BcTL5IH0U=;
        b=hb6B4lElcuCrkoa1f3nfIPwd2lJOf8K0fz8NEPg+lP0HVHKfOh/k+4/GNTdCYCDENk
         eJv8elGIKDlwEGD/wf3dMlVwSuPXz4XVXOHr0IE0JPwN4VaZc5FoSeWEF2011DLj5BeY
         gNFK54yEEcfmw8ZkhU07be1xGRIpJJUQR/iGgXpZcF2Rjcx4U4QZNlTjsbogg22d6St8
         LejLlohTj0pmmH2Zrhwg8769OLXj2g2YpSYi3mszHxZiU+9nagmH5weaVa/9uyTdvtWC
         byzzFtnI4D7+NVSE+xYqCDAUOl+oQkG9//znNHTeV7zQ3zfoIrtVd76hueO7neBMEHbi
         uARQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkeupnyvL407oIkvrY7h576dN+abgn0hcAEg6HS9KN6D/rwm1ZQCOMiUsLi/vekZQw9AObt/t/mENcvJH5zEyQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMf/o2inn4Dsg2KuP4r/z1lbzS5rfvML+AunWqnNHR/HdH3ctt
	q/Pn0qOyl12vDIlILE9G4BVkW5q+91EK0dfkod012xpFFm6kYcJ7q8pDYidG6yw=
X-Gm-Gg: ASbGncscxiABh7/NSDnO4jN15uNpWOoK+EPqd1XNYa2fo9mkKYcq0E8kI90zbCIDGBq
	M78dJVShDay9eXA00LbIVV47fuId9pI062J242E3v6kczEokM38V06Norh6PRW+A05RV6cpeaaX
	m58Md2RMZoTiZAtgJWEBXm88th27ZE4U9S3FWxsrsgEKF/L1dQKLJLImQNQw1vJxGfNKPW8OFpA
	EPVEHM9M8ikeGvEP7sku6o6ew8yIXNUqMyqPu/hqucNpKxzOaDiJQkbCCWm1w2L+4TzzKTmuLM3
	tisQTnOt0hA=
X-Google-Smtp-Source: AGHT+IH+DUY6nprcntI+5aClJEE8pz4wAhTYG8dCJD+t8yU/xxOBpHwSJqf9myK1PfsCCnfBeBYRqg==
X-Received: by 2002:a17:907:1b96:b0:aae:83c6:c67e with SMTP id a640c23a62f3a-aae83c6c8f5mr3028524366b.55.1735922320359;
        Fri, 03 Jan 2025 08:38:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: defconfig: Enable RZ/G3S thermal
Date: Fri,  3 Jan 2025 18:38:05 +0200
Message-ID: <20250103163805.1775705-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083841_806267_B4956887 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..576a544b8c79 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -706,6 +706,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


