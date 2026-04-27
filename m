Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166CEFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=; b=2PKLOnTGGkTbnMh+JJF1PELlhL
	4SoJplSoT22kvSrAfDiKvQ+BNsajgHQzEAMMPBiww7nCySMBUIQvXGU6kqkGsq2VG+mnd+hj6tgpa
	IcoD7pFwE7k32CYHwgAumcKjBnyNVQQ7tsDgGYSw0eNFEyHdaxd+iAXNCDpuSh8GiNlz6Uf4K8Q9v
	/yX6jEPkGDLTiecu75pUDoBajYaYWR18PQf2XOCFnoNc1tqH016iyMdf5A9gMGHowu/NLKGANQGcu
	HUa3d3YREiqigArXLX1c8qlJLI17EATr/+PrepURk97x3n/YIJO3wQnXMXLR3mKSkO2B9X8o6ANBM
	HfktQ31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPQr-0000000HPTj-2d6P;
	Mon, 27 Apr 2026 17:07:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPQp-0000000HPT9-0Csj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:07:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6884768a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309657; x=1777914457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=RDoNCwMStTnC1kTbsKtWgJUSSefl/LMYaV0fINTi4bNm+AkxCTU01lHwEY/jcp1f4S
         NSUpUp+/BxaB6XZ6Nmnuw/2WERxlxD7bDhN0g0cnqHA2qfMrsJCGjZSxBWLSHqse2FDC
         dYwm61fq/ZApiVu3OwYHrwl/vMjLu6qY/kAHS5xk2pbrA4RDNtm9xklScfwNQXwKG0lc
         HDqvNpiBT+dVxdmK58XJFDaeO23uSm3K5rk5/HFLs02y5ZVFzLkS4Eegrxn5C4lzssxz
         IoPqWx9VEYTn+980yqomEYSF+3mYSPAGy5apIChJC8IFko9cftGG29TDP6gR88m4y7oB
         u0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309657; x=1777914457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=SmWqHw7gpePaRGKbJerIsQgE8jEA2qIUqEg7usJIW/ka4RP31E2JKQADGbzyST08KI
         KdF6yNIimzPSd79yiVt046wsZy+OkiJY6vq3fBaKM1By7Rlq577rl2UyThPRSbolmUy0
         YViGCm/HHChGi49xXkXyNqBDYw0jpj0WOI2m9/uEuY++lguOc4ietg7hLtF7Jk4YCovh
         LOutK12qpNvHgp27Iy7DTWbzMcOl2wq2ELSCMBJD8VH5PVNDlNm4ZBDlPvXtsWbVMFXJ
         +cSmYnQAzytEjERUYcoal2iPfbv1/i1cC4WXrRSUARJub89TZZqn5ywBpZHGBoUgQc+C
         ptuA==
X-Forwarded-Encrypted: i=1; AFNElJ99FwchOG2UEH1Fhc4vFjfIuVAzBQZPAblVWvwCElVk8FuzA7u5blAvtDSbrCwwnDI9zWjDELKvggh1Z/cgs08U@lists.infradead.org
X-Gm-Message-State: AOJu0YxL08HRsx4yJKieID+hBbKT6ZhkOZPfTSEmi4kmmjY4gTAB2iBb
	TTJ5+0O6s6EVe5oExITwnVFS1SL+IbRFbtfbw6EtQvtrYb45o5yivs1Y
X-Gm-Gg: AeBDietVgNmUlf8Z1xrFlBCiax6vQgrD4T8rKV3ZZOemqAnmgMBKO5Z/e3VRMOMcqTo
	jZH7gTzy8ApFyn+m8mCFgBOWXbM6Q9WoIMkuxMTd1FOYBXWYKjHBaqJqXpZbcAaXjdTwDTn5/uc
	7f/HXW5EVTUwKCxDkTOWl1pl+BQZEhtpJBsRwwZHu4CLJgWbjsJtmp1OZZYeoqkQABoHH8/ITlM
	mfWEOnfuH1rBv2+XTEAvdC3CQZgg30OJfo/lWYzFjNW/6Z4IOfNXWw2D6LRTJCNQJKU5GSjGt0y
	k1o7VZ6CvlX0AUAV0HJYXPZv0MDU7F8c6OEbIcjesTScdcIF7n7wqhYyL9zqS/9EFhlOu8BzsM7
	U8rCa9kA+v0qVfzUMaP7CSCf94s+k1+ZXAQLwUEUhES0uHnLcOmLnYily/uAExe4sbgqosURCc6
	MXlH+t55PvRxAsl1vcpxd44f9/qwGj+r2gj3PCL/wuMx+FcUvMYv/YsLsGzsV3YWXk8fK2AKP6G
	Iv5n/f2K/LKPsdj1KFiZrTUErly2JIE
X-Received: by 2002:a05:6a20:6a09:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3a398c117f6mr307416637.4.1777309657446;
        Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm39497551b3a.55.2026.04.27.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:07:36 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary braces from single statement if block
Date: Mon, 27 Apr 2026 22:36:33 +0530
Message-ID: <20260427170634.23072-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_100739_090677_DE8177EC 
X-CRM114-Status: GOOD (  10.26  )
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

Remove braces from a single statement if block to
follow kernel coding style and improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


