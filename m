Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23B3F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uy5K6i+BQ/ZCb+F1ScR3BTCuEFkunym54py6/4zT4Xk=; b=Xp4BcdlKMdDttVrch+NlLL5bkI
	gqUDQsxIC184p9f3l6Kw8FTI+88bTG5CEcChyu0tj7MGvKcYplrUwws6g8/nx9nw7zV8rIdYYvGP8
	RzxUu4aA0QtfHPQ4NfazACsCyW9/akm/Mwi17TEJ1xyq6cxm6uw0IR8qzgwSyHeePkPDc8pEpawxt
	OwYMgpmvkLJ2AKwXmX2ptEcQVsBny07SnHmfhim7MwrNo6+0Y18ntAzoyd0qwc5f8hpay2L/UZcdr
	k1JS+ni5EGeWXLwkZg9YiC9jGBhK6oZYMjXJ2zETV0OE9dNB4GapHT4q6JspLC09sSd4XvkZXNS1p
	UKx+OnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy69K-00000001bAh-1fVd;
	Thu, 05 Mar 2026 10:41:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy69H-00000001b9U-1dTk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:41:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-482f454be5bso81315135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772707301; x=1773312101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uy5K6i+BQ/ZCb+F1ScR3BTCuEFkunym54py6/4zT4Xk=;
        b=ImGJT3GjDM/S2xiQU8XYevOPaBqKqQBVziokNVEPpiOUqFNH3TvvwFabmqrpzVDG35
         CFuDvawkBjQciSsQ0we8teYBMxwdbQDROEBKfsMySdEz2PC/HdwsrSJn2i3SHVzVXLVp
         6WQa67aUOw3cy+UItgrEpFVFwu8EukMKkUtX1l58OJBQOnaJRKaiFrua+2GerW7eTQC1
         xruh8Snc1ei+NZXqSsjN/wFF3fhh/CSVQPQLYePMHWDVeunCFPekgK811sF0qKYMY1WQ
         0GJp+dUi6kUIrA0GJiW8x88JVnVwBLCFKd/R8TIv20wkFL7UxEjiW9Xiz7FZcon/j2xC
         ObLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707301; x=1773312101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy5K6i+BQ/ZCb+F1ScR3BTCuEFkunym54py6/4zT4Xk=;
        b=RhqS5KfyC14jYyTa9OXY27qHchNUWRS8u06FgiK1CqT3iJh3Bkhy6Bb4LaFnVyYwL/
         YVidC6stY8Qum6+E44QQaBB03hFNQEfM1o1IiERXmxCIRHUiuHKEPKsNpryQatyaFenE
         C2tZjZ3bqPusiTnbXuzAF4DytrCSg2Ot34I5AHRQ2u7A5guR5iLoZx74eRR9EC4mC2nX
         hwaOjZ4cz+VyS9iAmWBCliqpyAOHb30ptkLbxjuFIBsHjcPYEZd1jHIniNiAm5m0jLLb
         9Yq/u+Fc97+oSA8Q6mumko+9FWe/sQP1AdNbVvwHmv2AUT50vQDG/J5gFKwOtVKJ8cyR
         n2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVDIP9aS71ETfgQpBOSLYMW8m+Qpc4Sh93x2lkObtv5zCDAaZoABkqNJ2T153G8DTQo9sjoU3BG8xuQMwIDKLiE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9YS/+rTHLP1T/3SUw+Sd9Thn86TXy1DVb1nChsHzPNYiMrSWw
	s29Uqi/bkkcdg6lmemt8b73kSy6iG1EzM6uV8L5CKLgIcFcm6/owo6/+
X-Gm-Gg: ATEYQzzEUpkwkQITH5JaIVX/wLtRqfCQ+t0U2M3NDE2g5MxhBqM0bONT8Uvm1J0nVQ7
	gXg920qDV729e6jIW1RIFN+b/cgtZpd9pNy9AVKATAzglypOI/R0W0i5rySylbBrryjpzCxGWGx
	maccUWr+h3YAnaehMNhIlkd0PvoeEn+ftwMWCW7cIOHr6C6Uv3CLZgCoOSfZgWI4LSzy/fUG8xv
	iAjd+cF5Zo0gCBIr8uR2RutjgIKEDTk7NBcsHkNqheB0wUfInyi6xVeSX0cqfWU7r17C8O+g+U7
	nsyCdGGbS4tOIlMEHULy2vj5kE7Zd+8jfEUJY/nb+FsKCG3KkwqwejkdtAxYkLdtreyknIjjvjJ
	Xhe131hFSmM2upCwMaTYQ+A8cp6wX37paz9tEBnB3Q79IDTUC42xSbLAPDt3NwsJUusVrAK2Ewe
	2T4wgJcdMXpeRZkV9ydpN/m9T7Kb+mDdRUUP2TyihmBPMLOo77IWxQiOmTyh/utL3Fknne8yklh
	ezp6Llusn5/
X-Received: by 2002:a05:600c:1d21:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4851ee7b570mr29539135e9.4.1772707300639;
        Thu, 05 Mar 2026 02:41:40 -0800 (PST)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm34322545f8f.18.2026.03.05.02.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:41:40 -0800 (PST)
From: david.laight.linux@gmail.com
To: Johannes Zink <j.zink@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net-next 1/1] net: stmac: actually error requests to change the auxiliary snapshot capture channel
Date: Thu,  5 Mar 2026 10:41:33 +0000
Message-Id: <20260305104133.3101-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024143_445881_1515C34A 
X-CRM114-Status: GOOD (  16.27  )
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

From: David Laight <david.laight.linux@gmail.com>

Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
request whan a snapshot was already enabled.
However it tested bits in 'acr_value' after they had been masked off
so the check would never return an error.

Change the code so that the test actually works.
Note that when the commit message says:
    Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
    auxiliary snapshot capture channels were silently dropped and the new
    channel was activated.
this only refers to two commits earlier (a few minutes earlier).
Prior to that only a single fixed snapshot channel could be enabled.

Note that the check will reject requests to re-enable the currently
enabled channel.
Plausibly the best fix is just to delete the check completely.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Found by a test for FIELD_GET() returning 'constant zero' from a
non-constant 'reg' value.

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3e30172fa129..aa17335a2031 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -222,19 +222,16 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		write_unlock_irqrestore(&priv->ptp_lock, flags);
 		break;
 	}
-	case PTP_CLK_REQ_EXTTS: {
-		u8 channel;
-
+	case PTP_CLK_REQ_EXTTS:
 		mutex_lock(&priv->aux_ts_lock);
 		acr_value = readl(ptpaddr + PTP_ACR);
-		channel = ilog2(FIELD_GET(PTP_ACR_MASK, acr_value));
-		acr_value &= ~PTP_ACR_MASK;
 
 		if (on) {
-			if (FIELD_GET(PTP_ACR_MASK, acr_value)) {
+			u32 enabled_snapshots = FIELD_GET(PTP_ACR_MASK, acr_value);
+			if (enabled_snapshots) {
 				netdev_err(priv->dev,
 					   "Cannot enable auxiliary snapshot %d as auxiliary snapshot %d is already enabled",
-					rq->extts.index, channel);
+					rq->extts.index, ilog2(enabled_snapshots));
 				mutex_unlock(&priv->aux_ts_lock);
 				return -EBUSY;
 			}
@@ -245,6 +242,7 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 			acr_value |= PTP_ACR_ATSEN(rq->extts.index);
 			acr_value |= PTP_ACR_ATSFC;
 		} else {
+			acr_value &= ~PTP_ACR_MASK;
 			priv->plat->flags &= ~STMMAC_FLAG_EXT_SNAPSHOT_EN;
 		}
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
@@ -256,7 +254,6 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 					 !(acr_value & PTP_ACR_ATSFC),
 					 10, 10000);
 		break;
-	}
 
 	default:
 		break;
-- 
2.39.5


