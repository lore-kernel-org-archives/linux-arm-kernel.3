Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BCCCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b06kRf6Nb7vVfuK1gZbo8oyR5EkAU/9kCYKfNJjL8Mc=; b=dUQSViXuKV6ISLaKsyhbMToopH
	8ZBMQNIqFJjFMMhcXpTG3X0Tji5uIWmAWnQgWOOhqBCGeVmFy3rILnWhNNMZYKnR07GiL0wyx3279
	HV+R6avsnLHeRuYFLpmXdwrtGBPvVgHjxWTMmY/KByNwuDgcGwvyomNt7hrIpD/RNmsvLCW1XVlk8
	me7jWwxI8MUrJfFBaRQ6QNF+7kfk0JH6aGQ03isHSbC2ZKAY6ayR/kdeutrJcECkgXhSD688xbOwy
	unInwy1IhY1p/xLD9Y98pQEOLOfknNZnKnXvrErXh8TpyrAA/8jG0+4L+Dq6EQpcUHkO4E2zcvfxN
	PQTETOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHE-0000000Ea3W-3fJC;
	Tue, 02 Sep 2025 00:53:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utC9U-0000000DzVm-1DNj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 21:33:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2445824dc27so42754315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756762403; x=1757367203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b06kRf6Nb7vVfuK1gZbo8oyR5EkAU/9kCYKfNJjL8Mc=;
        b=YdQvIicCYbNAcX/xLafb07BB9MRGT7J2mQQU7po3boC1yNFVREOr85Q30aCprMh+Eu
         Ab067zMu6yHGBTZJGd903HDMRP7N/HhMiMAkH6vJki4doE0RAOb5zQX82UgfXZMiiXQc
         kJmgKIjfPlFIOwbJcOSUIyCZVjamEZE4+v7QOt1dTFL0Ra2DseYP0qFPS2dxb/axdNxm
         uEb+UIzy0n25Nw9AsSsvzXH0+s0TLS5msJpGTLGDf8Vn65r48QwsPrQ/pBUA9bdJrNVu
         VA+xAbF1181qLYdyOoSHBg6PWZNi6sNcWDlJ0s5N5eXvUuVw5vC2q/jSPMWCZTxiIySm
         Zw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756762403; x=1757367203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b06kRf6Nb7vVfuK1gZbo8oyR5EkAU/9kCYKfNJjL8Mc=;
        b=ezltyr80PY0BiZhftikyPHLCU9DrbR/gpPQFXm/NwsD9dRaGGGAPm6VOGuXKPLxfWw
         RKnAelqKF4AmFpytHL2J8SKGWTAWyE2IiVejo3ZrcEPivUsgkM7ilmcqel0dL2gGNRRW
         yphsvhikng4cbRsNvPZWjB/PZXvctttv/ZVxtc/xYY9Xekd86FuD0+fmKg9d7Cme+6ox
         wtTu5Wp0b/cYeI4i7w1nVZX/+y88i1Zxun9xDcgAtUxLfJ3tE3FxlUOVuCRBIZzTx2xg
         uSaPj7XdoUvqBt3om2d43Ci0zigVaD8RPZ8h5if50yZIeKh32YukI3Im1ZYpGYzPbctg
         bBMw==
X-Forwarded-Encrypted: i=1; AJvYcCW3yF7aZTiG+YMheYfk4n7+oULu9dMIeAnn1+kDqpQ51BTCwwfTX6fCwk9l5ZSTrx8GHDKU0OPtkullPYvWxMYA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1MbV9Z6O38XjFRnO0KOg/DYC0kY3hoJcVrlX5ocIq7V95+ll+
	VuqFNLmVpGVXf8iN+qarWnsfIjvYMBC3hvDhwsmGcRb8Bp4phYbT7XzY
X-Gm-Gg: ASbGncvdhYeGy3mwUWNZD2/vBNq1xlJlWOeznaPX84FOpXAeti0ApLpUWplYDbviD59
	4WEeLq+kK47WjWT3Suap3mdkVcCnp6ZIqoNrh0OjsZr0QQgeT8+v/DyF19S1J+1Jgbp4aWlmXVN
	5mTzxs4O5pMkuGf0nEFsnjAdcuPUHYRd7Z1oqqaIgOsiENpydlvb+VsLbViBLOgurjsTmNOYUpd
	K8lqCqA7QSTT6jnWrXWrgaMdLqa+tW1HEuJWRtOrF0ihVSm122Uc97LvYi19Q5T01NN99VErBsZ
	jGzx5dioTIwdjn0vqDk+HRdHOXzaIWFvo+hag+IYCcmvt82j+lzqxEejbCRHXXI8nfD2z5yof9V
	Enj2ipAMxk6bZUUlLAa1mO8Upgg+C9aitoFXzGX4DUetH/Ab3b1ue67cTN6f8qeLmJHhllYXKxH
	Soz1H5/A==
X-Google-Smtp-Source: AGHT+IH3NMenXx2Sa9UT22IbeL9ZxTctK80eQ8eKKHcZ6sShO6McF9d3HknM7Q2bDxzaFGV3/FbFbA==
X-Received: by 2002:a17:902:da88:b0:248:d84a:91de with SMTP id d9443c01a7336-24944a982e4mr126385765ad.38.1756762403450;
        Mon, 01 Sep 2025 14:33:23 -0700 (PDT)
Received: from archlinux ([2601:644:8200:acc7::9ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da479asm111216905ad.73.2025.09.01.14.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 14:33:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Daney <david.daney@cavium.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: thunder_bgx: decrement cleanup index before use
Date: Mon,  1 Sep 2025 14:33:14 -0700
Message-ID: <20250901213314.48599-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_143324_330139_8DA391D2 
X-CRM114-Status: GOOD (  12.81  )
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

All paths in probe that call goto defer do so before assigning phydev
and thus it makes sense to cleanup the prior index. It also fixes a bug
where index 0 does not get cleaned up.

Fixes: b7d3e3d3d21a ("net: thunderx: Don't leak phy device references on -EPROBE_DEFER condition.")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 21495b5dce25..90c718af06c1 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1515,11 +1515,11 @@ static int bgx_init_of_phy(struct bgx *bgx)
 	 * for phy devices we may have already found.
 	 */
 	while (lmac) {
+		lmac--;
 		if (bgx->lmac[lmac].phydev) {
 			put_device(&bgx->lmac[lmac].phydev->mdio.dev);
 			bgx->lmac[lmac].phydev = NULL;
 		}
-		lmac--;
 	}
 	of_node_put(node);
 	return -EPROBE_DEFER;
-- 
2.51.0


