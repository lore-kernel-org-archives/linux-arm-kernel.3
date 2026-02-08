Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652DFEF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlwiE2/GmO3LoEyvjlAxI3xvPLTPdJVhsPeNQZFpN6E=; b=ZP3AJocMKQ7PGIrIG4gqcyt0+a
	xRTEXLaZe3NyQx2OmvN7xikbjiri/k0iA8TiwsguOv80DApMvuf68rmOIpYPV6aEmvdM5aOsqFe/A
	as3dWcsGpgY1crcMtpkhRB3rOEWjpXy/X9rZp80DcauR5C2vie8eKAwyyE7LTxoDJDX78IOECE84a
	IasbJ80fv3BwgucofDdT4agxbTrdXvKY7o+mPsWJsYe+LTfXjulQ1qLhy072W2DEGbpGqhkIanAsQ
	hdDvoX1G42aQTW0ca4sIaNJ++wgaKjQgqUiFjRq/bG7NH0enbjfia3O9BoLRqSi1OKKdgktowHoP7
	n6DNMRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow2X-0000000CzlI-2VMH;
	Sun, 08 Feb 2026 04:04:53 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow2T-0000000Czjf-40Gl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:52 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12460a7caa2so2240139c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523489; x=1771128289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlwiE2/GmO3LoEyvjlAxI3xvPLTPdJVhsPeNQZFpN6E=;
        b=Mt6eQHI6w/pbkaBoywAsUfgWr2ecLsPQhgEqQhm7ET0ctNkmsc1mou6F2ic/NuQqQi
         7vnGdkQBva/nNTTN/Ufo9iKVA2UPiL9KdCYMPcUDZkbOZ0WeAEytCtPxG6B6geDUveXC
         ePJ6tIdw70X7+2XmjkkLHqo/I34T5Fq6u3500=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523489; x=1771128289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlwiE2/GmO3LoEyvjlAxI3xvPLTPdJVhsPeNQZFpN6E=;
        b=MrspKnN/qH6cx6UyyeqqV/ux7HM7hWk/d92Oq6TSTv4rf/bSiSMfDdWIahmm1f2I3S
         YEhUWawxXJzE3kf7KJfEIpXbb6Z423BOBKmmrRMg7eXJ3aOwLVIUt5AFieEZ74BRrRpg
         fEbDkXHlw8Do7EvAlNqk5qgVFhrIpKCByO3olF6rJFMrcczOLyneAbL9j/el4LK8ioyU
         qh7tiugUKzLf2kzPQfuUixhaAay178edXQes16D/IJp1BEnVqrOgOiLFqo7Zhat4p591
         wprOgoKHsoXa6y51L3bhblnWEz5djORQYkBc6Pq5Ykc6ZqWbhtXOxEomBw3kPfVALPX7
         EInw==
X-Forwarded-Encrypted: i=1; AJvYcCUZdaQSQx8rpdT4MWZC6nBY54jz07yDBWW2B6p28DRWV4OwUceU3cagbH3GPgyud1aZ45mCE1igYY4qscsaDFR6@lists.infradead.org
X-Gm-Message-State: AOJu0YzvrJf810bjbrUbXDnlYMVl+QU/LPj/BnvCsSiAqLEPFlvqaJ1J
	Xa+mA8LZRjsDwhoOuaVGaoPMB0n8EfkG1UwX9X1/ZS3SUUEcrw3aNmTz+/vBh45nQw==
X-Gm-Gg: AZuq6aIL7Iy/XKVlDPVwkJ5Miv/kzE9rbAPDZshMt94SftUYxupLvoq/ufrec5yl6ci
	gv447oeeGJZVcjb1hrGZNbmKzMZjfBI+relwBbSvw9ksl30bz2vQ1077eJq75SLssQ143DF7Vjn
	QFowuE5npB3Wr6FV2QOTO+cHu/VC+zZsoXCLt0PwlTAlbpxqyKP5qLPPgO5tlP2MqSHfs9LRyNe
	dSBjrK7RnmvLgRzC8XOV+zEanKPzasReQxmmsK84nhAcarHHbZUJQCByIq7nA6MfK4k+NEmbCvw
	IYQNQvlJ9ByI/2p/aF1yzk6vmaV8nSFMNsss1RoX9fDV8+AtC1d5d3csJkLgA+AW1Ce4w4RVqha
	DkUQ0pGtDrv+KOj1Jafp3EyuyYPgToTmiBJszmGqhg822gURB45An40v1ixqbwAYeDGzRyy8ard
	P6riftZYZtAXt98n50HAMFHqe7HrRa+yw3znkGSv2YJm99CBXI7S/Qiyfk+BKcIa9YpEw4u7y/Y
	ndn4hbRyHI=
X-Received: by 2002:a05:7022:697:b0:123:34e8:ae8e with SMTP id a92af1059eb24-127040147c5mr3631257c88.50.1770523488941;
        Sat, 07 Feb 2026 20:04:48 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:47 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nm@ti.com
Subject: [PATCH v2 14/15] soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:36 -0800
Message-ID: <20260207200128.v2.14.I0334ef23106cca2014f28ae56930741ca9238105@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200450_961331_3444FB2C 
X-CRM114-Status: GOOD (  13.11  )
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

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/soc/ti/wkup_m3_ipc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 5845fc652adc..9f74f2dfc217 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -328,9 +328,9 @@ static int wkup_m3_ping(struct wkup_m3_ipc *m3_ipc)
 	 * the RX callback to avoid multiple interrupts being received
 	 * by the CM3.
 	 */
-	ret = mbox_send_message(m3_ipc->mbox, NULL);
+	ret = mbox_ring_doorbell(m3_ipc->mbox);
 	if (ret < 0) {
-		dev_err(dev, "%s: mbox_send_message() failed: %d\n",
+		dev_err(dev, "%s: mbox_ring_doorbell() failed: %d\n",
 			__func__, ret);
 		return ret;
 	}
@@ -343,7 +343,6 @@ static int wkup_m3_ping(struct wkup_m3_ipc *m3_ipc)
 		return -EIO;
 	}
 
-	mbox_client_txdone(m3_ipc->mbox, 0);
 	return 0;
 }
 
@@ -358,14 +357,13 @@ static int wkup_m3_ping_noirq(struct wkup_m3_ipc *m3_ipc)
 		return -EIO;
 	}
 
-	ret = mbox_send_message(m3_ipc->mbox, NULL);
+	ret = mbox_ring_doorbell(m3_ipc->mbox);
 	if (ret < 0) {
-		dev_err(dev, "%s: mbox_send_message() failed: %d\n",
+		dev_err(dev, "%s: mbox_ring_doorbell() failed: %d\n",
 			__func__, ret);
 		return ret;
 	}
 
-	mbox_client_txdone(m3_ipc->mbox, 0);
 	return 0;
 }
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog


