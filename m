Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B088ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q4Vf2DmeXuIICczMLsgHOQylq088gF7uO3L3in1vUSo=; b=NtBpqZ47PciXUZx2zDNBBTAvLR
	531ti8zfA9voVFYjM7yXZNCk6xs5JEc6F9IBemernF0RnMkV6AxBdZx9tgJp9pEU3Ku5CREx24dJp
	tQl6qd6/H8HQFO4WDRJpT14w4ArNj2GwecG5qsTVK2hBbypygglrzhn0UuXMKxCzbUlfmGTLkbMxM
	A3GbYHcDkhrX3njA8WqEhpcAgeACK3ye699+BQWA1Mjxjo4bomP/KwqAoXGa7cB0/v8Qd4leGFrG5
	SCIYqmQ0SEvC8YNMqWRAYcmyvrPY6ojjnzpcSk5MIbBBboKVJgcuidurQQUWj8bKTq1OpWUIHQs03
	caHUeIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8SJ-00000007jGX-013H;
	Thu, 01 Oct 2026 04:31:39 +0000
Received: from mail-oi2-x0d.google.com ([2607:f8b0:4864:32::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8SH-00000007jG8-0FGu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:31:38 +0000
Received: by mail-oi2-x0d.google.com with SMTP id 5614622812f47-4e973221218so2809797b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829096; x=1791433896; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q4Vf2DmeXuIICczMLsgHOQylq088gF7uO3L3in1vUSo=;
        b=hQcoETmoJtKNHVJjG+N/adZor54KGLU/YVBO9PDdryA0l+OsNypmLRB/4OGol26dxi
         HweSvioOjwEqVSx1hyrEELPZyoJVZzSfavbWENk8FUyhIwI5oSngag4x0f6IGJriRxCM
         GwZp0DamVb2Wtbvf7dN5s4VDgrQZSpimCmwLOhcuS43BDyXC5pc0q6E8JifqRYgCqwk9
         kpNCjEOH/csWrL07fgoADWhGao4Mg1L/Krq6H+B61tgmT/Dislwa5IpZ/+QcrbrBWTcp
         ITviqm19kczTgwXLb+OcXqnFwgc6LTkmNegqX8MuR6Gi4v81SoIW2yLGbFmiKx3hwMVX
         scIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829096; x=1791433896;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Vf2DmeXuIICczMLsgHOQylq088gF7uO3L3in1vUSo=;
        b=pPANft0CWBNwsEPuaemzIfMhxqzd5+p+mU7SmzNT7vNOqVQH6EXMeJ+Zromp4aNX9L
         EEjxAEM5WPBMPsqhrbMSyxTuZXJwO/T4ghFJIPKOPdnpJQipOxn8EEgKpyQJ7Lgcy5rl
         t8e2Z0USD8Lbg5EtF0ohVod5tNY7CYQV4GTn/RvzXDi6HLuWsxsrPxIlpVF3fH7rtDxX
         MdbbG7TEo0foB19t0HXWBY9qNYhIkSQuTST0wn730IXWTq6q4+/6gY1CLVnMbzXiYPk2
         m5p/we1R4yJDrhI0/oRET0dZGRn16yFspfIQzRtZJHpqKc2+tbzUREIXH85LpznpZFIl
         LcHg==
X-Forwarded-Encrypted: i=1; AKwUvBxv/GowdQzOwL5YgPzy9DxgSjhuXwClpWDUEOBlBYcGfvoNX4ZNTs9wLhgk0WhXYunsXqcmyWcwis1mBKd4F7G7@lists.infradead.org
X-Gm-Message-State: AFuF++m3ayCxQ7RiT2BfiXfVkffIjHHKh4YFEgmHCo2a/uz4MZtPCo0e
	fO2ZLCzLsfnvzWr6ACzuGpfCDOmIha2MT6bPIkLFqIcWkD6dZOzPg55j
X-Gm-Gg: AYBFou2NBscKATZfmt5D3OzYif3aLyPP29MjcLty85SbGa6JWBiec9R/qm0RPtSoETV
	MvEqWEWe8uWD3yUEE0zJpwxztTGlv8Ye65yvXOBtvihMqaZ5ISt5EHSc4OGAnFSLp4fHIzsv6UP
	zPKizpCtI2OPqslg3LcmhjFKQu7D9HLlSLot93e5stl0Wwj5m7mqxYvMuPQFaAya8djRTYSKSu4
	yojVXtigoDIjNsN1sExHLaDA0F4Hg7OsOhblxk4D60qs17/5cle0B+C7xt0+2hKMy+bOk6ynTWm
	54VW0rRoQKbsu1pm7TUBOz7tjXR3lLILlJ6bGUO3ADzIs3csEHNO1Au8tqwxrlORUXsHPf57U2H
	lAS7G3rOyr5+9ppxUZJJE+dx+Dz8VObx+RMDTxSFW1h2XhhYGVwPfC2/uiOssLUiPnYsYpO/LLg
	KAq6i6Ygiqgh/1iprQImEZCXfJw/kiSAPp2Gnxf112iJpIEJ0+9eaX3jG0efjzDLkxfQ30wuVnv
	j+PRuSy4EfBHz7wD4n02Alqxwu2n8pcwmID5X8s21RsDgmkuzEPIDoD8Sul8FzIsrxduuLiPDtK
	/tE9DzX+0HEPZNtBe709fVlL7Nwh07DrnZuBvSRPUI+4kbuIOgxjXg+Z7M7AJ7XCq/Iyn6xM4pF
	gXl/LHCOOsRtofRw4SjI7Gg==
X-Received: by 2002:a05:6808:10ce:b0:4c3:db9b:3eae with SMTP id 5614622812f47-4f1b76329a7mr4055713b6e.15.1790829095989;
        Wed, 30 Sep 2026 21:31:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f349a4d20bsm1378430b6e.5.2026.09.30.21.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:31:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 22:31:32 -0600
Subject: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MQQ7CIBBFr9LMWpIpVGh7FdMF0EFnUapA1aTp3
 SXq8v2f93bIlJgyjM0OiZ6ceY0V2lMD/mbjlQTPlUGi1DgoFLksi/WC00Ns8cVxFuio1wO2WvU
 zVO+eKPD727xApALTb0z02Gq//B9nMwm/LguXsbHGBets10tFyrf67JxE7LzpKATjcdDaSOcNT
 MfxAWAG42q0AAAA
X-Change-ID: 20260930-stmmac-irq-unwind-0be86901638d
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_213137_109793_A4DA22D2 
X-CRM114-Status: GOOD (  11.82  )
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

The safety IRQ is requested after the MAC and optional WoL IRQs. If its
request fails, stmmac_free_irq() frees the unregistered safety IRQ and
leaks the WoL handler. This can warn about an already-free IRQ and make
the next open fail.

Move the safety and WoL cleanup labels into reverse acquisition order.
This also fixes unwind after later per-queue IRQ request failures.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..4f3d452c3503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3797,13 +3797,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20260930-stmmac-irq-unwind-0be86901638d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


