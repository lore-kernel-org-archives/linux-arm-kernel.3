Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D56DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQOC6VBdO7JTZWJW4HQ8BotVjJhyczmNPNqI6tVh0A0=; b=AByYE5DPGwSSGonlIHFV87GvY+
	ga0N8mSgkEpFC6aFRUvs11a5MZ0SGEP6M9KPYsvQZV0G73kOpejdXGHfZ2rGalMqZSfoj3XF+8uxJ
	uoLVbzPMEpol08uB+BAX+Dcwh0+ROdbbNUK/nLJ7horWWwSsX3AazYjyjuvmAuf8DCvMUK0C3dlR+
	nDKOLcf2RMEuRO0uz1Y58piCNL0aB451b5HLV4Ed5gs1Fq8xvrGm+dzk63lKhtj/gmRDOJ3ZOORmH
	N9Rw6jVkKpqWI8eAqaUs18XEtH0ilXb2pAxKVCMsgAfdvyk2LgP05meW3cdpstIGkDcpq1pt1HvZy
	Sf2soHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrSJ-0000000F9DO-1PuE;
	Wed, 19 Feb 2025 21:18:07 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrHN-0000000F5BY-00fa;
	Wed, 19 Feb 2025 21:06:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abbd96bef64so42425366b.3;
        Wed, 19 Feb 2025 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999207; x=1740604007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sQOC6VBdO7JTZWJW4HQ8BotVjJhyczmNPNqI6tVh0A0=;
        b=QfkP2ylGUO+o8nwqNXUTPmXobDGMZoyYW86pGrngWHpHsBG35EoR9RG6SLUwsC0GCs
         ZtPa/MvNzq/msmvspHkDCAleEzooZV1D/HH2mmrdmTwn6wsl151eD/ZJ7vEOMLONcOFZ
         QvHqpA+jqNcgj+7AmRTUuNMn2iD5GrpWabacnZYwtGP+xiRzCVssAzWw37hOE/Jg5wjf
         cUUIB0w93D0a0DOdc8zWMVb2GNdleacVNyAhFzWPAi4R+N+I3oNKpd+AFSsMvP5TszLP
         SmZ9rXFD+5jHDV2eJggk0yvMoKFmtj0qNwy5yJhzPzfl+Iy8WAb3TThW1bKuteGWExXW
         JBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999207; x=1740604007;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQOC6VBdO7JTZWJW4HQ8BotVjJhyczmNPNqI6tVh0A0=;
        b=RZsCtHKKImq+7pjRz4yVWKjzIwkslZwnjyyaM1fEodygyXIiMFRCXTqq/IhNGyXBpT
         HzVhM3L4fGrkwP/0ITP36nMVqccY6LnVj2yxl0GTzo0Ajd646xrKBRjm8kEaFohjbiWy
         WlnxAtwLSnL8wKGzGkXM/SoJ6+zryaJ9yjqYL7oIVA0GSeU3ZzwkOcfe5fPG3MnBa/CW
         +pCsVpF1LwobSLDxQPFP9nxhfKdM9R2garCqKXGmpX2PAAC/HBTvGf6H611Mjbm6J4Gi
         yEyHSV75h9ccQ9Ov/l1qXcPZYuxW8pHGCdgTVQ7H/e+yhegGkZN3NoW7m4U6x0vL5KH8
         S+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ08INk3NGp16ERc3NiX55R4Am8FaOANdxLyo9d2XSUn45QfSszxcK5C+mE5VlqlVjr1oTwOQ+I5GCeGT1ip87@lists.infradead.org, AJvYcCX5MtaPeCMixNCbZk45N+fqzqi2lZmqQ7U4pK3sr71TaPQywJ9sNFMivp5dqMw/hw5+ATqRoO4CYsL8rg+/Plo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5AEEOQYLfMLWyhRuNZ8muK6yvV53FW8wS8Shlk6TlwadmgRuv
	eGcxaKuCAiRM9n3mOTPFmzp1ZvE4CYU8GujQ9FsRGgmvI8W/ue20
X-Gm-Gg: ASbGncsPu6blISeYopC0XQByNR/ia91NskexeYSFv8Zp2lrW0Vey8DUJApippO1iJFi
	10KGBf+dmWJofzXj1Rz2DC2WVBdkybtCHcQ+tcUa2V8ExaPtFMza1n9LGzVzf3/2ZrVlK+6yi+l
	1UdSf5MXXOkFetHvOmTMwG2E1vwmND5vIUqd7DNVR902uLa2DrmExalKLLwqlEDb34Qw2AK6pTh
	rhS+fptKL3qeEk3yVb0qCmodacObk06IapNxg3xgJfo4H7oE17JBgH4U74kQoik++VNtOJXTT/z
	bdTwkaNuwML1U08PCVbh0DIMrxytRf1otXPcFyFjreo5QqdQKeEVIMD/fWlPzMo4hxgPitt4Ww4
	UHlohh7mkpRhd2yqnNEKt2mGImss7w9InSbwF5oOqsYzGAqJjYu11U21FbeYVwTVXulxYjosx/V
	4IAC3krGA=
X-Google-Smtp-Source: AGHT+IGu7yDhimqarpn/Kul5ATaQYK3XNF+RsBue2iV/8jImfh2cK1HapM9OHJ5Cw2ex5dYQq6jdSw==
X-Received: by 2002:a17:907:9494:b0:aba:6385:b46d with SMTP id a640c23a62f3a-abb711c8145mr2105807966b.50.1739999207287;
        Wed, 19 Feb 2025 13:06:47 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb9553fbd0sm712082766b.84.2025.02.19.13.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:06:46 -0800 (PST)
Message-ID: <3ea191bd-7b59-40b4-b357-7fe7a9565420@gmail.com>
Date: Wed, 19 Feb 2025 22:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 7/8] net: phy: mscc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130649_058620_DE708400 
X-CRM114-Status: GOOD (  12.60  )
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

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mscc/mscc_ptp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_ptp.c b/drivers/net/phy/mscc/mscc_ptp.c
index 738a8822f..ca4203d6a 100644
--- a/drivers/net/phy/mscc/mscc_ptp.c
+++ b/drivers/net/phy/mscc/mscc_ptp.c
@@ -645,11 +645,12 @@ static int __vsc85xx_gettime(struct ptp_clock_info *info, struct timespec64 *ts)
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	val = vsc85xx_ts_read_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL);
 	val |= PTP_LTC_CTRL_SAVE_ENA;
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_CTRL, val);
@@ -696,11 +697,12 @@ static int __vsc85xx_settime(struct ptp_clock_info *info,
 {
 	struct vsc85xx_ptp *ptp = container_of(info, struct vsc85xx_ptp, caps);
 	struct phy_device *phydev = ptp->phydev;
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
 	struct vsc8531_private *priv = phydev->priv;
+	struct vsc85xx_shared_private *shared;
 	u32 val;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_MSB,
 			     PTP_LTC_LOAD_SEC_MSB(ts->tv_sec));
 	vsc85xx_ts_write_csr(phydev, PROCESSOR, MSCC_PHY_PTP_LTC_LOAD_SEC_LSB,
@@ -1580,8 +1582,9 @@ int vsc8584_ptp_probe(struct phy_device *phydev)
 
 int vsc8584_ptp_probe_once(struct phy_device *phydev)
 {
-	struct vsc85xx_shared_private *shared =
-		(struct vsc85xx_shared_private *)phydev->shared->priv;
+	struct vsc85xx_shared_private *shared;
+
+	shared = phy_package_shared_get_priv(phydev);
 
 	/* Initialize shared GPIO lock */
 	mutex_init(&shared->gpio_lock);
-- 
2.48.1



