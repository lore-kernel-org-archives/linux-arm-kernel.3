Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53427CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQUetzEQMP4LAhqW9E/G21GQbOBqRaYhD1bJwLd7FZQ=; b=PahuZxVk9/lqDqhIvCWc3n+gZt
	qaQqQu8lIe2smzNDY8Dc3PhgF3krmdaQ9oqpQUuFALxDc0XqieIfobjoGD9m02Tif4xA+fAO+JJU6
	PK+YIs2IGrc9AYSMKci2/GisA+mWw+VBJLjOFvO7C3RgxK4MoSuN+fkVwmBtCcGn4ykGjJ0nq9RK2
	knVQ7D4I7LuYnkpEtK4T2mjfFfr7/QxE0zBs7AtEIiR69zaaMTl6H2w4flFNF5ph1ZYxVOOX562cw
	blgabrkrlWk09+WJgAdXaCI8IVWQqP8Ghk5Iy1Tp0XcqylBuf1dzZp0cxjDEi8c3MRzubpqqUyFYb
	4bJZIeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Q19-00000008DaC-3Sp3;
	Sat, 27 Sep 2025 08:10:55 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Q17-00000008DYR-07BJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 08:10:54 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-42592472002so7691615ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 01:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758960652; x=1759565452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQUetzEQMP4LAhqW9E/G21GQbOBqRaYhD1bJwLd7FZQ=;
        b=BU31wD6deZCzVuhnCxjv2Uoio9xXc9RxTn79rqpdW5o8n5Ls8ydTG+GseZgOLv1KXb
         vpiLL8zrCqAbBleKotkqS9Bg0fUKPdMlLtkOzr5C9/CqiVGyfCtGBGrhwj1zqS6rVxDK
         E8e6l/TdQmZgKbzmDl0EhtA2lvQjDIuQgbNyaXbKjRT02ildQQWeY55eFsNHB0SOn1PC
         Z7LNP2Z91xgR/7YUBUn3NdkjM45tyehEFcVs0R7Jm4eROF0BRE+1LknjXhRO9trb5B5N
         YvM9fL+EfQknqWxovLx3MQoQ1534Tmnh1whjfDEr6xsFwGsk9dUsGQx8j4pXtDKfAIKl
         xo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758960652; x=1759565452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQUetzEQMP4LAhqW9E/G21GQbOBqRaYhD1bJwLd7FZQ=;
        b=fCIQ1KoiCgfvDWvmVyn28YKQauKEIuoBPLJE2YJCbN6PzM+a7KsJwwsCPF/sQkCx/a
         25m1++kJ9NnNCSJg6t5iW/xx314s4SBVRih98Hcq0cL0VmKFDExZU5cdRGWrXhS0U0FD
         LQCb7DlL+sqdjDitdTNyGy1hDKwgMi5I/4K3WTPnvvB9K6If9WkcL9CkwpQxxw3kptKW
         mHZAvSw2Z4TrGwXAQSzb90t4vEuoABmbTwRBBrb7lLh2EPgi6VEn7cip8k0wxCpPrZ+r
         AAAa9fcOfquRDKexZNOHNWY/TF/UW/Pr3naVvaaj6+xK0mLC2VHMx2+nQQYPdMvwQQbh
         X1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW/kC2hoMTiH6TEHfgKFJrITJp1pipaoyiP+F0rLtMnXPIiLtmDxesQ0DfRUiLEaVBteZTH90xgBDeDSyMusXfm@lists.infradead.org
X-Gm-Message-State: AOJu0YyEJyto/QkWvo9YsoMYrL6QzjF1YsSdsH2VavUF0BKCJ+0tpsdB
	rYyca2cih3YiN/qw2Orbncyw54kNGiXaKOcFsrNvCpYsk3tJy+xpTxEa
X-Gm-Gg: ASbGncsUZz9UTGF53sw8d9zIItPrpILqX000GPJtIAbSxi9+kOJiLs0FePBFIdvNyp2
	f5oWCLI4Ye2BDCjcvPaeNi/bfLpP0eqNVz6Nxq44jPQBi9gHVSv/zGzXVa33eX/+F7rsTOPKeq8
	kD2VxBhBYdzXLZJCRtPH2RpANog/QX4Jrjhf0AIaujIkyouAWgswhBZx71v/anJabt5BD7GChvD
	vwTwK4FEv09hZ3XbpAuZGEY1OLaaeHtmCgJrTGqB/PJQDO+oVXyP4rb2EzrdbdNSD4bc1+J6N76
	UAbr2EpgJcRfvzwg0G9L4kABcYUAOKfWYzSsB1AgSiSc8KMX69m7GA1++jLlVyDB+bKzAMU+x1K
	o6rXSsZ2ccsGt8cpEwm8EVwQOEzGG0y5jf1cJzg==
X-Google-Smtp-Source: AGHT+IH0IVO5vzLeRO4V6lWOrPlzDHkhJS4CVNTknktDnTu3FcBbSqcFVPYeFHLy8GA/XY52U+1p6w==
X-Received: by 2002:a05:6e02:1a27:b0:426:5a34:77ec with SMTP id e9e14a558f8ab-4265a347968mr138432705ab.11.1758960651856;
        Sat, 27 Sep 2025 01:10:51 -0700 (PDT)
Received: from orangepi5-plus.lan ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4282de12fc8sm10852155ab.3.2025.09.27.01.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 01:10:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v2] net: stmmac: Convert open-coded register polling to helper macro
Date: Sat, 27 Sep 2025 16:10:36 +0800
Message-ID: <20250927081036.10611-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_011053_072634_F690C3FA 
X-CRM114-Status: GOOD (  14.34  )
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

Drop the open-coded register polling routines.
Use readl_poll_timeout_atomic() in atomic state.

Also adjust the delay time to 10us which seems more reasonable.

Tested on NXP i.MX8MP and ROCKCHIP RK3588 boards,
the break condition was met right after the first polling,
no delay involved at all.
So the 10us delay should be long enough for most cases.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: fix code alignment, update commit message
V1: https://lore.kernel.org/all/20250924152217.10749-1-0x1207@gmail.com/
---
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 28 ++++---------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..bb110124f21e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -135,7 +135,6 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 static int config_addend(void __iomem *ioaddr, u32 addend)
 {
 	u32 value;
-	int limit;
 
 	writel(addend, ioaddr + PTP_TAR);
 	/* issue command to update the addend value */
@@ -144,23 +143,15 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present addend update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+					 !(value & PTP_TCR_TSADDREG),
+					 10, 100000);
 }
 
 static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 		int add_sub, int gmac4)
 {
 	u32 value;
-	int limit;
 
 	if (add_sub) {
 		/* If the new sec value needs to be subtracted with
@@ -187,16 +178,9 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time adjust/update to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSUPDT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
-		return -EBUSY;
-
-	return 0;
+	return readl_poll_timeout_atomic(ioaddr + PTP_TCR, value,
+					 !(value & PTP_TCR_TSUPDT),
+					 10, 100000);
 }
 
 static void get_systime(void __iomem *ioaddr, u64 *systime)
-- 
2.43.0


