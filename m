Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1CDC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h9u9uRgNdOHE3Hm6tQKrXhbypx1MeLyG0qZtrVKyk00=; b=vR2qbgNl9vRAKc4yjiO7O3kEls
	YydjrzHHFGbvBQwvrdkiuoSZ9m4ZICZNO9GNx1o8ypyFbObBPqGdXrAYWIdsl4d7aNa7B0MImo6pv
	eUnZ1yYq+6rwf55JQwNqz4pi0/5oURIiP7OHdPlXxM5tAr/iUhzvz/mGGAzIrnSlETCNjh4WcWwqG
	mgIHIrojK6BkqgdOwqzTljgVN7rhZZg5V4XmTpNulK7Hba3sf20OJFpE7vrcPDaV7N9PYYDvIyoV0
	d70AtiXKKCkUElXvd4fkth3AfjLqcdD1vz9jYPWVr7IjAvbU7+uIp3DzhwrcBMZGaLf3Dw3Pl6ent
	aOimgIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpD2E-000000094tp-0lwu;
	Wed, 29 Jul 2026 22:45:58 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpD2B-000000094tQ-1yht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:45:57 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5bf9506704fso519718e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785365153; x=1785969953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9u9uRgNdOHE3Hm6tQKrXhbypx1MeLyG0qZtrVKyk00=;
        b=X7qaw4ZV/24NwNpoqFcTPTi5+IZKnddZBzlGkncCaC01fH5lcDaxL8Z6g/Izo6PXmz
         4v52vQGLMvzHWboUY4y0tXJls/vpq3/osDag7lGfQFDThc3TA5OUvZfaD8ASoWKNs7pP
         5Uefa4JF9vqG+AI7LDJThiz71KD4pAIMs3re69/Ml0kfKTjiGfqDBbw6TFBVs4upbfqA
         1t054bL+to6XnFePCL1QKS10UshYk7xlFPkEZIZl4KEQcuvHsZIobhwQxFSDg9OTO7XA
         XfX4sWei8QANA/SjkVR+v4STffvjiFof6b/fTR1WCFPymHTZayUL5xmLCwrK+Ui3xkLQ
         Wweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785365153; x=1785969953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9u9uRgNdOHE3Hm6tQKrXhbypx1MeLyG0qZtrVKyk00=;
        b=KaK5jtOIlcFG7BdxaOE/KElYy+1qHxQbsZE0gFIoStow/Z2tg7znY3v01hKoEgCHVq
         cDlvr5o6y4/xqxtvdX9KeyJSOrxCybLDa8gEkTUv9b3dUJT2mIhLPovIvEAB26jOYBtY
         WSy52sLdzBltq1S3Js9GXJq191iY4ck01Db6bySKbvgVsseU9e49ems78QdVNieK4XEz
         hsqNrjR1PduBIrpbym4JrMjbzvtrLE8a4h9CSXtGtpITDcPOMC3IbM5pX7m8AviLFrG6
         qDSUd0H9B34uC0Ev/ixbRMcLc4E8H7wIaXB2ErCR8adO593ZWOgTQwZKCv1O7ym7d6zk
         H1Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp49Tpsfk4tq7k2q4MzPVVcEu1SpYsdK2T1bcGgvU+4FDonQqcKNiFNc3yzJhGOvNAJsCCJZdMjX7zee3Vz3tRN@lists.infradead.org
X-Gm-Message-State: AOJu0YwlGM1xbFEuQPWR+fcCY/jSCv41n+D2TBF3B+xrNShDESgc3qUJ
	/uVxBYiR+DnPrI4y8u6MXUk0CSBwdgXYZfDuYYaB4pZS5mLkOW83FSQg
X-Gm-Gg: AR+sD10s9WD9zVyPMMv/qfBtJOKTMczffL8mO55MmVLOEPhmLdf2i8eE6mmIcE/r2g8
	GUAXqiJmksO3ksZkOcxEoveGTvE/57zyRh9H1SNW3xeddW5IAa8GRcNyDoNIBsL2cEHAN9Y00LX
	ehPjlb8OqC5/ZU6NviVaIjHhMvk+FIkA835MemcZgsKCCtTBOgWyJVV+pcJNPv6LqBpXk3Ob5iF
	nXUhvBygsPt1/MRdpd49OzIJEwn8L50h8zBAvZCmP8Wsux5yQ/f+dt31YWBH+nCdlvIdy4Fml3t
	kh/S3VskHUB7OrsLMRthLLvrL6tRkqg9U9DBKoOAXs7+38hTDsOoNByfqRxq3BfGZUBOOWJL6oD
	KE3w/Fc6N/w3fmEtp5x/jKp1CskJJ/C1GciGkhlmWIqnb9H6P6xEsrV7vE+GWeqafhxh8aQEOmJ
	+e87vrBi+Zq0OiK4J6dOLe+CmEHuoPcUgV4/qCGxTKh5iiudJwEuMtFw+bGoAYpRTDXIXdnTPsT
	qc6cEnJItHwYSLPV4ddxd53riMSAnKBTaasYw==
X-Received: by 2002:a05:6122:4684:b0:5bd:c27a:dafd with SMTP id 71dfb90a1353d-5c365fb257emr35318e0c.3.1785365153129;
        Wed, 29 Jul 2026 15:45:53 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:a913:91a7:b883:6046])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c366570bd9sm24356e0c.8.2026.07.29.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:45:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: kuba@kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	qiangqing.zhang@nxp.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	Clark Wang <xiaoning.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH net] net: stmmac: Select sleep pin state after suspending phylink
Date: Wed, 29 Jul 2026 19:45:35 -0300
Message-ID: <20260729224535.506598-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_154555_526698_E0396280 
X-CRM114-Status: GOOD (  11.68  )
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

From: Clark Wang <xiaoning.wang@nxp.com>

When MAC Wake-on-LAN is disabled, stmmac_suspend() selects the sleep
pinctrl state before calling phylink_suspend().

phylink_suspend() may access PHY registers over MDIO while stopping or
reconfiguring the PHY. If selecting the sleep state muxes the MDC and
MDIO pins away from the MDIO bus function, these accesses no longer work.

Select the sleep pin state only after phylink_suspend() has completed.

Keep the transition conditional on MAC Wake-on-LAN being disabled so
that the pins remain active when the MAC must receive wake-up packets.

Fixes: 90702dcd19c0 ("net: stmmac: fix MAC not working when system resume back with WoL active")
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
[fabio: Reworded subject/commit log for clarity and made it priv->wolopts conditional]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Based on the NXP kernel fix:

https://github.com/nxp-imx/linux-imx/commit/7905fa71ed07d8c2f1da88ad9fffd5ac5e89461f

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0de4bc949913..36ab66ad80fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8183,13 +8183,15 @@ int stmmac_suspend(struct device *dev)
 		priv->irq_wake = 1;
 	} else {
 		stmmac_mac_set(priv, priv->ioaddr, false);
-		pinctrl_pm_select_sleep_state(priv->device);
 	}
 
 	mutex_unlock(&priv->lock);
 
 	rtnl_lock();
 	phylink_suspend(priv->phylink, !!priv->wolopts);
+
+	if (!priv->wolopts)
+		pinctrl_pm_select_sleep_state(priv->device);
 	rtnl_unlock();
 
 	if (stmmac_fpe_supported(priv))
-- 
2.43.0


