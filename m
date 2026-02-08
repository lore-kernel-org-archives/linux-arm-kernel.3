Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBA9EF06E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1WMZsabyRtxW/BORr83pHAp7XMgNG5LzmQLBp1LufE=; b=aqNwm2l92XmONrgmG+o85Cl1aT
	KHp0e2SddFb4lIXYNZ6nbV7Uw5Cflg/bAMQ66cDWXBPIAyaR5l5ocTjBopza85R35iEiODzyCPEny
	BNHaLH0iqLLAn/5vHl8aZGhqw9ORYiABdTEyOgJ+XZ6LCTaUGBNM+qHhOqQE0s1Nm8RoSDx68F5vf
	WFmi0kY/5cHoQ3GDTJEjo7GF9DdO3eXxeJHxmJrQg8pWluL1jFokg6o+aHFug4Dh4ZGvfJQqFU+dh
	JxYcbSMTsmzCWQw01sPdi4oIoKvItPw9qRVE4oj1/sENQHexvvF6kEzgtryG301pi5Pb2Hd1nEVYL
	BcA9QVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow2Z-0000000CzmP-3oZZ;
	Sun, 08 Feb 2026 04:04:55 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow2W-0000000CzkT-2KR7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:53 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-124899ee9d3so2282376c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523492; x=1771128292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1WMZsabyRtxW/BORr83pHAp7XMgNG5LzmQLBp1LufE=;
        b=Ub/MCeistSqn/pcxdmgzN4FABLC75AfW9kcIUlL0QHfbumdHtdz/qsGEl0ItMTsO4S
         9MFvGMqwz0mouTKzzL9lie00WfS0xNdH0Zdfi24iV1uYCuoGj2YfHyiu9Fu21XUHCtpW
         6NGRyAPyWPyh3rah7edFxhV820k10wYshin34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523492; x=1771128292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1WMZsabyRtxW/BORr83pHAp7XMgNG5LzmQLBp1LufE=;
        b=wNiYdHZiFVeZrq6zhNHpG09CPzECVBfunYwL0AmUVx0xIKp3ea+UCB2CJ1dV+ZI5o1
         gdwej4buQAKY/UoFAqG62koQFTDt9nyh8jDW2+omJWC81S+djTBV6YRpo/0WI1NbSqpX
         oh4LrU4pl9g6ldr6CPjPYsZpsZFzOoH41V2gXyxCWh6Dy9cbr3gwv6A6PPm69qpCB/MR
         GglN9LSISsTyUxNd20aHN7Bce7CPCKJYMB94nsYzdQxTHHbIm9D5ogZAUxOFmm2Ruqg8
         czo/QmDXxJ+KhZABblPc11bIJGw+fe0nn4elXB5McIUU5Pi6bRjR++GLZogX7kcsXg8a
         Y+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5eIkjqgrpPPHjRoF2E4YDZKPA7QMnq7if8Neu1/YqbSY1xrie5WKTEpXHhuckW5p2bIDBRm7xFjCreOKKOd5G@lists.infradead.org
X-Gm-Message-State: AOJu0YxavS1XZEmnoIYAXFZHLrsp1mmI/Zalmfewzi7h12M4q5SH/LWg
	wMGcwfgY4v2+ZXHWw6aPurn6uvKvF7NzK6jve/Oq3ynw09UQDm7lgtTNhQb4aanaSj5ltfo2G3G
	wL6o=
X-Gm-Gg: AZuq6aJnFp7f/lw8lyp+b+v1ijV83kp3eSDACZDmOaHUjhuqEGRsgssJfBe4YQoRip0
	Zt08e+mHsbkBdrB/pL9aNVq7jAJWbd4ZqtHFIA7f5+7Iylt7mPN7zbvOd925y5eSp/x7o+Gm+fi
	rJDB0b99xclJru4AIhtloyhwvGvrl+r1bJpdGQCJzB4KXcOZ/YsQDBd8adcu9deF/JBTzH+nW+6
	euceDUhmbsJaF12cXnvpsacKnd+sepeyPSDOaT1XDnUEujJFszrh/xj4K+sB4ye/oVqFNR/MYd1
	H1TOXk5V+MFmVi/DL8mkk0Ev4+G12UMf4o29QrzUbmnQz6z5yP8md6N6TJeGctcZhKQwnMWDevO
	wHP0lMQvbQIMeyMwaM1DAuV8Ei66dDoVd9LzbRFR6PXPCTujcqRZiQLMEru6+g/P3sHAzO1PrAw
	6g9AorYq7qcJwZl1jpBFFT7PchvHLn+8Htu0IM5TpaZGmcD0RRmDISAyCyhb67+1v4zGzyvBw=
X-Received: by 2002:a05:7022:92c:b0:123:35cb:96d2 with SMTP id a92af1059eb24-12703fc6b75mr4209766c88.21.1770523491742;
        Sat, 07 Feb 2026 20:04:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:49 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	jay.buddhabhatti@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com
Subject: [PATCH v2 15/15] drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:37 -0800
Message-ID: <20260207200128.v2.15.Ib15a93253dc4bf021c41036096b8e289702878ba@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200452_596959_793C9119 
X-CRM114-Status: GOOD (  13.22  )
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

 drivers/soc/xilinx/zynqmp_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 9b7b2858b22a..7d8e311fcdc7 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -144,7 +144,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
 		/* Send NULL message to mbox controller to ack the message */
-		ret = mbox_send_message(rx_chan, NULL);
+		ret = mbox_ring_doorbell(rx_chan);
 		if (ret)
 			pr_err("IPI ack failed. Error %d\n", ret);
 	}
-- 
2.53.0.rc2.204.g2597b5adb4-goog


