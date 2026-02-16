Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F09E83821
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrUBV+EHratYBsRTOcBaUousa7P5GwgK6vHEbze9WVI=; b=ALTmkKl6g57bS7p+k3sMhqja4o
	zKvwdwL27lerqEO0muax0UX429dPG/vLYzjuCe0L8gDlSrtYL9IhGz20hpRkVGZ+OWhG+Pk/KxGiw
	MaO1jkN6/1YLzfmLq2k6yEBSsSx2qmvVvS27QKB4tA5amgqMcEEcvr5+l7+gBFiCMcLenJVF/hAy3
	WAa8jA5s6XwNg1oI0rsl5tEIjiMR9VlDzCMVAPOH+1hvaFvipJG4JjP5pqZUHkv8KXA1KK0jFvl2y
	aUAWURw/F2voCRJkLI5rDK1j1j3pIukgaNop2ge5y3GX/w12ZJqtf21Ug/Q9r0yW6myhdwYe0WsQV
	jrOeDJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34p-000000078HF-0sKn;
	Mon, 16 Feb 2026 18:12:07 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34e-000000078Em-2UAY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:12:05 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1270be4d125so2419873c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265515; x=1771870315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrUBV+EHratYBsRTOcBaUousa7P5GwgK6vHEbze9WVI=;
        b=BzhS7/R5yfKFVJJ50bW0btVFVh/5N+EwFCx7WbRL2Tg9Q293hy5qsEkyOUDLYKVU3m
         QuFYx2BWZQ7yuMyKupLhd5i+frjA5a2MNzzAs7WDxETchk98ayJxdMW9TizwMP32eDUK
         /JGagkoUbJmp2fBGeYrHrApxM0GmfETXCdNHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265515; x=1771870315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GrUBV+EHratYBsRTOcBaUousa7P5GwgK6vHEbze9WVI=;
        b=hSgVvSxpWIz9KmsVmhgBpipa8ampu0FkQ4anzecgK1dPfliRaBUCsl5Qlp5b4UypUD
         iHW1Zgdu4szGuRfTAKtmoNlw6Xs34C7JLGG+WMWfN3hdSZJifJ+74Pcu82i2lPOPARJm
         XcQCuJfbXg6FzfmQzYKTVUbIfWj43L4W0w8wBZto4NpjdILtHX+WvntLlJ8EpODyweYL
         Y0tqW4PRXWvS9A2KydkUvoU4RBV+t9QvCbizKSRZM4z8tEVIXJCe1UgkfkuYDESV47qU
         zGoE4gU4dzFtUfB9Jqn4dhSf1aYj2usPQX9QTtlMr8i82V/+u454HxUOCqq/G091bXE1
         6jzA==
X-Forwarded-Encrypted: i=1; AJvYcCXTbVTuEuRHVEarokP2KycnwWFkHq2rhJABwEBtpvSYgZ9MTjTgDRwdEmZNCGiP9HVPnH/kQ2iWpUU6OLNU6sAd@lists.infradead.org
X-Gm-Message-State: AOJu0YyCLpC12yBVHnFV8vGunQaIee8cXCHoJ+F4zVpIpdwoT7xdr9q5
	jmdgW2jcsV2pSH7f11yvqJv/c2S/fsvzBIiawV/zR3MuI4IZM4dhFrYTfhO6PhREwg==
X-Gm-Gg: AZuq6aI4AdL4kd7kNkMuCN7wiAGUvaBeW8KvUyON7qsOijMOretv6q2YU2ZVrPHTfOa
	4VM6Jvg/UI6r3xUyD+GYMQSdgBzz52E2bCfUAuH6cfJDYRnI0tFyFfHHRSU8geJPSUffgmYjCkv
	PObZR4KhUkRjx+QtkBe07C+QyXouTBitIPs6R27HCcn4Y5335R5Q0e/uuuDfU0M7r7R5BEF4gMh
	1tsstXAZlMQIWFZjslX2nUysy3naQXMu9/MWHarh8awAT/6n0Q/1t3AfBpD5QyltJ3mLvMSRJrC
	QfDkNMWAsJB4ZbjZDJ0CULSDzDizImWn/dfmYyWe7F8tMWKwJMjm8xNyB2GtmuqwIeS+RxGB57n
	kHp1jxbpNFXHcN5m9jYQ9bRnY5bxAZ2f0rzZPMlvgxtn+zoCGojLFQHTdH6ZFWOVYo0mRSox6X3
	tmUe1ujxvkvodOohIOc6rwXi4itVXw60D/4Yf1+cYNywHlN9rT62Y4ZU5EtXCXyWsXjQbptXE3V
	wHJBIp7tzw=
X-Received: by 2002:a05:7022:6897:b0:11a:51f9:daf with SMTP id a92af1059eb24-12741b7283fmr3078155c88.14.1771265515351;
        Mon, 16 Feb 2026 10:11:55 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:54 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nm@ti.com
Subject: [PATCH v3 14/15] soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:51 -0800
Message-ID: <20260216100943.v3.14.I0334ef23106cca2014f28ae56930741ca9238105@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_101159_784091_6BB8C993 
X-CRM114-Status: GOOD (  13.26  )
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
2.53.0.273.g2a3d683680-goog


