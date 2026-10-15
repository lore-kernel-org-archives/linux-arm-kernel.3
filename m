Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6941CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IjZ5GoX8cufqsMSGcZxUhgcFDrYZWhJP2v9qR94LpCw=; b=cflqGWnq2mugsneQ5L/k/m2tod
	9K0uaUW2czkAbU+UMQXa/LRiXZMFHgTr2zR5U+FDhPzUSLa9aJvVgl/oYJ+1L9PVu09y+z0TuomFE
	sSzOHxIMgo1kmXU85MmpCTfO54vKSykob0QIIn53Wwk+a+/LARvL8zyFoOTyqIjOgvfvFTQ3AEiv8
	exO6YehPjUJg7y7wLTDZ0NMfx+dwSvQqonlS90PZYt1lrZ1exCux11Cofm8kBencw/JNPLxCzPAnM
	fZ7c0o68luNYJspbt2qJkbObjS48w/SvL/JWbVja3D0j2w7hcX4z+5V6uCMNuKpdKt+YrTwxeCADz
	HBXj3OEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM0o-00000000JYQ-2nRk;
	Thu, 15 Oct 2026 14:00:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM0k-00000000JVa-3M3a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:00:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a16c399641so51507995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792072842; x=1792677642; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IjZ5GoX8cufqsMSGcZxUhgcFDrYZWhJP2v9qR94LpCw=;
        b=NYz4lNFwQ0ERL8FCbuVyf4uNMkKFr4nRF6tnJWj1WOtjtMQRRa7GiEQ7GdV+ksrtFt
         V4nDWqQVFijphlaQoMgB8RqHZeZh3khpxZvJaGFeTpBu0ETWguh3jT2cpazlWsD0v17d
         dGkYUObrsfCS5Fe8r+bVbIv3AVilmbK/7ugW58Oz4ftCdpLHfnDOHkANtQpe4QyTdSij
         XvhgsL/jsqBnhPFVwyOtYwMclwX6nae0SUE8XDyaPpDNm875tJs7dZCUZdeKGHrIaQ+5
         n0mBm6Swj9zxxazuyaWcjvPs8ERsKAZe6FO9UEcICwQ/0FUsT4cTnMP2Tv5zr8bzn+KJ
         DS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072842; x=1792677642;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IjZ5GoX8cufqsMSGcZxUhgcFDrYZWhJP2v9qR94LpCw=;
        b=gL+kzUlmasSVdWlxCAiHg217FE+3zkSKchTAtYBZZlDqaOmDs5LBJR8fKsCFLakudp
         68o33OE0S/IzOzkF2SR0tAWrvXit57p1eTJTRnlMv+3aMfrFNmYyey/i+s4YEXZz1y6K
         +ppeEF4BcW4lEIrl3Dfqrrg4goZnV5aBpZWmGsV5GrwFBl3tFTcgBa2wSUfbkTFRs1+Z
         8buvlpgtM3udd4I5hxGjitxGMY/I15RSkU02Q0vXed5Rp5OlDxvGSb+rFDPmBXP6Nibd
         yf3aQeOXZnBzoDdV2V4xEWgoN3C6aSF9dEb3NznBM9tIdadj2Cw2INO2J5/mOHYhe40S
         LoVA==
X-Gm-Message-State: AFq9FYJmC57Jx70vxVg6+jOH/1OjwX4JVYG16MtmER22af+1q3c4971I
	d4+lG5rmev0yEJUfwlXd0K0PrVaMhnF6CoERZlmA7LnCqWjZNIUlrwy6ullgZaat5kHZA3jPAGc
	iJIHNfhE=
X-Gm-Gg: AYBFou0y3uCF8aTsR1+HUYRdLFCV9yGQzoB9WB+ZYhEQ9TjaWWnSXnBx7ElU7V/PVSc
	DfFzn07GCjy2PUVFKmBBerxDErcrKsVZCAZ7Viv0JfyUN1zHIsRqseCOwCA/M29JdSQfEdH6puB
	DEgu1awMfmDYHpCPdKab0Y0sMk2xEQ4JcmFVA6HmkIyXa5hYbcwDs3RrrLEOJX37PK1DSVvZPUH
	BifwwdYW4lwZav4Zn6A+QDQ2NgU59IbOdahisJEPdr2C3Rd5pYcGq5PKvQQHrqzIQ03zRN1OWp4
	CS2Ksedz8bE1mxfXRLJ3fKGshWhoeZZwK8BOYXfuTeK02/lkKlNyHNpPLlgyVvrWBxjY1jalE8/
	aTtcY10hmXkq+4caAzvRmYR25tVZ/b7c9MAaYfy3htwzYlaO3nIv0+XDpgSJLLjM3Bs2tStZcDF
	SlJIgzghkl68wV1B7R9k4mO4V9EYMbs3Ckx0FHMkI12SwxRy3TesW+3A1xw8KzQqkBeVuquB2Hh
	SUlE2cca2zDehQNAVMCSc37rcTCMZBOz0hM8i/FUvU3IJkif6Rvp0v+VanXYrbTvQ==
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr372999995e9.4.1792072842052;
        Thu, 15 Oct 2026 07:00:42 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm76448915e9.14.2026.10.15.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:00:40 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 15 Oct 2026 18:00:34 +0400
Subject: [PATCH] i2c: rk3x: Disable the controller between transfers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1gac+Fd6FXHhzESNFlsmWgTx7
 p3q8lu8d4ByEFZ4JgcE/orKe4kwaQJu7JaBUXw0UEaVyUyJQg7DnO/oRTv7YqSiqskXff6wFmL
 2CdzLfi2b9rZudmK3/j9wnj+BZc+7dAAAAA==
X-Change-ID: 20261015-i2c-rk3x-disable-24672d4f38bb
To: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0MyRWputcyymbn9GnSoejC1ng4GIi49RK59WG2Bqlzk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRduNO+qsfyNUfr68zvNveOzHwVd8p2lcn3aw61j1/Y8
 P3OOni0uGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpnv6c4Z9NTaSB50vO9RNM1/QdezxLxeSf3LuLjHGVEc/Pv9r+Ysp9hv9BjC6
 +si9XhKxUS/wW/eCUm9xE//td62X/t2byne+fx84BAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_070046_860892_5AE077E4 
X-CRM114-Status: GOOD (  11.49  )
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

The driver leaves the controller enabled once a transfer completes, and
an enabled controller keeps tracking the bus. If the lines collapse under
it while idle, as happens when a target's supply is switched off while
its bus pull-ups stay powered, its state machine wedges driving SDA low.
Every later transfer then times out, since the timeout path only requests
a STOP and never disables the controller, and the stuck state even
survives a kexec.

Clear the enable bit once each transfer is done, successful or not, so
that the controller does not watch an idle bus and starts every transfer
from a clean state.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index fcede9f6ed54..dbf1ed30fda6 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1125,6 +1125,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		}
 	}
 
+	/*
+	 * Do not leave the controller enabled between transfers. It keeps
+	 * tracking the bus while enabled, and if the lines collapse under it,
+	 * e.g. as an unpowered target clamps them, its state machine wedges
+	 * driving SDA low until it is disabled. This also gets it out of
+	 * whatever state it was stuck in when a transfer timed out.
+	 */
+	val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
+	i2c_writel(i2c, val, REG_CON);
+
 	clk_disable(i2c->pclk);
 	clk_disable(i2c->clk);
 

---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261015-i2c-rk3x-disable-24672d4f38bb

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


