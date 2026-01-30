Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9CEE6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U1U/8LFbm7g5yPxUTPlvGNrI7c4l4CyFa801D7eJd0=; b=PzzJoaKKCSKLt4Av+vKoCoWNtw
	RNt16eRvFp8ZrdKO4uoJ7sDIN+8hUF2OS5ZE/V3utzm0ewn4fB2WZ+VrUlJowuhB350NPrRH10Y3t
	B/1GP4xql+qDpiuobl6iZPqhTNw2DK1y3HzGHcRcVgpizt89mJct/FyNaBWI5FqM8lCx2sf9QiGXf
	oqPnHYsrgCeyLvGkrAobcCrgbpDB3BCIKynN0ZycE8XjJlpp9g/esv92m4Bbe2D1Q0Rni0fPdihP2
	sh4yKkzyCcQssgi6rZ5Ym8FVTTt54PTs9rdAOYrTDm5UyeTnZohoucuJqTFWvmRk3WhaTAV0cVlB4
	MtavBKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQh-00000001xW0-488G;
	Fri, 30 Jan 2026 20:49:23 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQf-00000001xUc-2oc3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:49:22 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-124a55b7bfbso18935c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806161; x=1770410961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3U1U/8LFbm7g5yPxUTPlvGNrI7c4l4CyFa801D7eJd0=;
        b=lkMWPhYFhZiV8Kp7bol2rGYxE5Om32lnwdTlmlEA6alliVYd5Ex2i6GHsp/wvCjwxs
         YwMbyAIJpIjgQ/FxTCLiGHdZfqCdYi4zub8WsHQCD+vOAZWh/2Vcw74CtKhF8KuII0es
         82EOOsCAILkcgE1JyrtWnMzpbIHwHYXCg+1d5UmisEGsYg+USmfTGuqp0UqbHcJ5nD6z
         15vJwBxDD9exvVue3mBuRn8IMxfVxhIthTMBMuJCOGgx71fBW2TBZSkIGiU2L2ERzcK6
         SRO/JNKGpjUfMFhr3kP/7JaQ2uzKd6z5LNeuEwFg6VNMrbTOJyiv2azcO+uSoM2301ce
         hQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806161; x=1770410961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3U1U/8LFbm7g5yPxUTPlvGNrI7c4l4CyFa801D7eJd0=;
        b=H+Efj7Nqhtq/d0Gh2aN/0YFViPMdC06gJzNp85+klXA3AywIwUVBb7syrQBZSnnlbn
         K7DuWVKTdiOvUZdgb3DuwrkD8X5ra2Bgp79tY6hOJqf6IF58jwv3PCADsATqFEjprMJM
         uEejfMK5bNnvh/p5NCdKI0fQhoyDwKoEmjrjOMv9SMoclZU2jcLE9hppa7zanvHJHiw4
         1eKgmE29wURX0/bjCugUFr4bEwXboOLhDbF/Ce468C/RMeVTf2kOKV/x29cKVJVW3dau
         0qE1zQeUk5cmS1pum2bTXSTxKRx/rJbQBdSz4zh28PeuBEWJchFjvMxindqlJUn4fOZA
         7jGg==
X-Forwarded-Encrypted: i=1; AJvYcCXCcUPW93FHIox9nJEYsx5Yt87RS0s/A6u5mkxwvOP3pjae/XvvLgAoaICoYwIkUJ1YBmbBNA7/SQXiWqUiWKff@lists.infradead.org
X-Gm-Message-State: AOJu0YzybA1L+G+v3qv0ofe6gQETjY2Kbtrj+dzZofqYPSxSmn8gPmZZ
	CrkKqdOR3f3ZOO7sRHQxhrSvI1bnNXkqsT9JlATwATH5zJ6f1/hUJEh5
X-Gm-Gg: AZuq6aKP+cMZ9oKF5iSc6eYehnSQosCp1hi7heZUHELyy8OaGLULqYwPQ4yXJle9HTk
	AnDhgjaxUL6OhPdpj82MFPJXRV0uUKW465JrWOUts4sQKIgPyj7QmVi9eWrnEEwBalNfuSTieC9
	CddHVIah5QJvADf1Cn3NtHlQ4TWLQSBfRLqUTpOFHnmgz8dbtUb0/BypYIWdCTbaLLUuDRcXJR7
	bOEtEhZRXj0bk5BC5rr86wGZP95a7rXWSD+mUWTMur+cqeusNJVFGIuwypYbhUxE/ayk7DnJhQN
	f9dkt13xv/rCIBTURAeVRwIDe8xWmW5jOhWxRbW0JOBcGhz9pGxybo+0wBF4sm5fZZXZYyQcnOE
	vypVqjj9wSYIT/aV/uzxBEhWq4NFSqUe67NDOV8kQgqww8H1is2C59p0endAcyLlN+o+1yzaofs
	RnJL/L
X-Received: by 2002:a05:7022:660b:b0:11b:862d:8031 with SMTP id a92af1059eb24-125c0f12e0cmr1066124c88.0.1769806160920;
        Fri, 30 Jan 2026 12:49:20 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:49:20 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: gascoar@gmail.com
Subject: [PATCH 1/2] media: bcm2835-unicam: remove obsolete comment
Date: Fri, 30 Jan 2026 17:45:41 -0300
Message-ID: <20260130204628.312246-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_124921_890817_DE962C09 
X-CRM114-Status: GOOD (  12.07  )
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

The bcm2835-camera driver was dropped in commit <90204a38a760>, but it still
mentioned as a current driver in a comment section. 

Remove the comment making reference to it.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index f10064107d54..551c4e97af8c 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -14,10 +14,6 @@
  * and TI CAL camera interface driver by
  *    Benoit Parrot <bparrot@ti.com>
  *
- *
- * There are two camera drivers in the kernel for BCM283x - this one and
- * bcm2835-camera (currently in staging).
- *
  * This driver directly controls the Unicam peripheral - there is no
  * involvement with the VideoCore firmware. Unicam receives CSI-2 or CCP2 data
  * and writes it into SDRAM. The only potential processing options are to
-- 
2.52.0


