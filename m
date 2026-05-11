Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68790CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4Dha3V3dyDcgOa6Jz5YYLbPJnxJR4aqvkeRMGSz7IM=; b=M9JGLdHwiwcoMSTBWciQtjPfM6
	z9eCKZiOIKtGjQFOKnvIid4zYwhr/K41WfKCppMVk/TI4assEHzwNtMIes6+jHOK4p9HUle7dZd5w
	ArkAv/ecNpsfWFKM1T0rzHIroBl8IomQOAe0rgOc2Jy3vtZ0rjbYgJUQdqHmmzhp4Dp4GNCnzRBsW
	0eF6At3r0S4BX7lmvE/mgMqONKdXwLXa8s1Zm3ye3tRyLycfqvHBlkXMu3JumrH4/WvlwmGmjhG1g
	nXQj3WPXs0JVzjBXVO+LK0d5Vv4hZCjhjkqRwut663aqyYK629hmgx0I2UHO592jmoKrOPt5QJ3Ej
	NlIE76yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLX-0000000CeB9-2P9J;
	Mon, 11 May 2026 07:46:35 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLLP-0000000Ce6j-12lF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:46:29 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2f7020a928eso5323718eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778485586; x=1779090386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4Dha3V3dyDcgOa6Jz5YYLbPJnxJR4aqvkeRMGSz7IM=;
        b=Q442GnNG0PLv4vuZjzi7ZczzVyEv80zlwp1y2I+MOvg3dXv4W2FeBbCJx3Qt9aFQSx
         oLQ76dyDClC4SBW6yK1BBMx6xoo1REmjzy/61v0dRInpqkOZFFqEsXnI26+Wb7XaawiL
         Iqek4up9BxKbdfIJNUTL69pfdk57D0e96i8JUEQrH6BcyBrruRkapiiRrVsbxMtQuj0R
         KBopzvO14aGFB1Udy+nnMoYWNKu6zSUHUBNHVLDR11jk40dJwLWRsGokLQIXxjjWzijt
         7WNnWN38/FIJAEA63gI6f+QWUEfa9LFdiuTcIAT2TowcO+HL5fnmngl+PshDklTPktW5
         UDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485586; x=1779090386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4Dha3V3dyDcgOa6Jz5YYLbPJnxJR4aqvkeRMGSz7IM=;
        b=ODRloEaj6lR6yyfsjyvSIUcFKTcIfl9Qt5H46Ego1D1D9Jbd44uSHTRaDlM5njXbd8
         W3/TJMGeIUbm+Lr6op3YbghgreAgqUNcaAtlhdx+f4aDFGTGGuofzZEKOeeiHb+zBBAA
         8mGwDWLNFQRRNdYCcZzRc5MGJoWF/CQ2CnmLC5Mp+wO8iIYJwlYDCOzNkReEqbMjbpJp
         s9swBkQMdiu1Ma6vnpx2svoyhQKV//AX73ACTiQt6r9OR1pP1niTyvpOY0Vitb0/IRS/
         Jo7Xhn1CaCSynfXqUT5/GtpluECWT3o8K9jQ1gvydQvPHWki/GETyA/DxdF7Tk0Z6xAM
         /jBQ==
X-Gm-Message-State: AOJu0YwwQUmSGeCBym+99ngAqTptaGsJTkB4dtvKQh1RNdYlEZ29S6Sa
	p3kEuCTkdf7Jb/3quywy22K4HKwjc4lTXdr+YpFO2vr95tj9qgv+Uchrlg2nucwRFyU=
X-Gm-Gg: Acq92OHmI6XH3ld9SR+6nrkm6ZZjxwRX7DA3ZaZWtPLlJ7Pq12MVYPGmQgw9N8VQJxE
	WhIOWuE1ywfgFsiZ7/divMQeGqDkalVZ/A5cO7d5nkPfgz8nABa7rb8QT9K92hXAJBd2tq74dSf
	L0L/05yy8ofrWpF+itig7cJ9e8t3hn05NHqXAJyzfMCcA/u992z5ks/VxnelUeWHAilZV0pebu6
	z/mtPHRvdtnbSYPg9jz12HyHYDhosLvR0oxfkN1Cg1Ic9Yc1OvAUscY71tVRzj1X2uzFNxQelnJ
	R216V9xBG+3AVaaDW8waSdgo4h5g0ovHx839ZHF8NO2fdmkuNILkoTlRbgTBs8eQ2HU8/gv/r1q
	f99W/h8WtKRoBhiebF3H1VXR7EcK5yc77tHZwolzCXiMFoR7OlnWAE4sel7OcitMemx9L5vBd0X
	zOshhqlabd7FRvORRsuKia+E3goA==
X-Received: by 2002:a05:7301:7c12:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-2f54b89204emr11224440eec.32.1778485586024;
        Mon, 11 May 2026 00:46:26 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm12205702eec.26.2026.05.11.00.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:46:25 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 11 May 2026 00:46:14 -0700
Subject: [PATCH v2 3/3] i2c: xiic: don't clobber msg->len to signal
 block-read completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-i2c-xiic-v2-3-c16380cb1594@nexthop.ai>
References: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
In-Reply-To: <20260511-i2c-xiic-v2-0-c16380cb1594@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778485583; l=1863;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=tjDfjq5O5p81+MNuIlyxeuaZBrECDSK/ynhLod78ZDU=;
 b=gw6nqk9h7ji67ko8VcuiZnbtsh798I4nAiW0eLEU4honRN1DaqpqzEms07K7iy0hP7h8OdbMo
 ofqTUL9Hms6DQLDAvItHCCZB8xleHHnL0lXGtsTNLop4I4Aoo64vfcL
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_004627_323232_B291DE5A 
X-CRM114-Status: GOOD (  16.33  )
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

At the end of a SMBus block read the BNB handler force-set
tx_msg->len = 1 to push xiic_tx_space() to zero so the STATE_DONE
branch would fire. Two problems:

1. tx_msg and rx_msg alias the same i2c_msg struct during a receive
   (see xiic_start_recv), so overwriting tx_msg->len also changes
   rx_msg->len. The i2c core's i2c_smbus_check_pec() then reads the
   PEC from the wrong offset -- buf[0] instead of buf[rxmsg_len + 1]
   -- and either mis-validates or returns -EBADMSG.

2. xiic_start_recv sets tx_pos = msg->len (typically 2 when PEC is
   enabled). xiic_tx_space() is unsigned msg->len - tx_pos, so
   setting msg->len = 1 with tx_pos = 2 underflows to 0xFFFFFFFF and
   xiic_tx_space() never compares equal to 0 -- the STATE_DONE check
   falls through to STATE_ERROR, giving -EIO.

Instead, advance tx_pos up to msg->len. That drives tx_space to 0
without touching msg->len, preserving the buffer length that
xiic_smbus_block_read_setup() already grew to cover the length byte,
the payload and the optional PEC byte.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index a9452eca26df..24183483f1b3 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -865,8 +865,11 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/* Set requested message len=1 to indicate STATE_DONE */
-			i2c->tx_msg->len = 1;
+			/*
+			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
+			 * without truncating the rx_msg length.
+			 */
+			i2c->tx_pos = i2c->tx_msg->len;
 		}
 
 		if (!i2c->tx_msg)

-- 
2.53.0


