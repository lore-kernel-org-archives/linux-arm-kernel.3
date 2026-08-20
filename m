Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KbWAJa3C683yffh0RsfqBofb1SIppeFKhvek2Ax4mqg=; b=Wofj2lx6FonEauNgH/9HK5u//P
	H7t9/DAlVJsXSUHlWESindTbH8FyFXsItiCQtzli23lwtnn8GIwmiU0FYQ97YcbLZpn7F1Wgi216k
	ajRtEQtAhjlykXJY3lDlQsXycDNwdkS8JsDFaH3uiIAi+hDoKipEL8x53xqWadHSiiYyAWLDE0vq9
	xXFjqbC6X7HuWultn2wVPRGn+65rsuhM0W1R8Vf+Hmr7JLYYLQfrT3j7t2bTusDmPIwG14xHicnsG
	1qNoDGzpc1bd5dAUtDEINTqb5VXpG2c8Wa1id+t3FAtQWZH6wslxvhqK/+SPtLITpux/6zvfxsBjh
	HGSJzmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2MA-0000000Bahi-23Ib;
	Thu, 20 Aug 2026 12:58:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2M8-0000000BahL-1teq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:58:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1487601f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787230730; x=1787835530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KbWAJa3C683yffh0RsfqBofb1SIppeFKhvek2Ax4mqg=;
        b=Yd0QzWETiW9iGkxkpwf4bIJkjNUTGEtkUPjPVIpNISOve2+pTPO9E4Pj8XgNo+beXt
         7hX6/V13uKBz9USogTW1UFBgafN6taDrP2rsc05m7sHdNDzjxdLrpHJJ6TXiNPi25FYW
         kgGGCu6d+k8Tc4hSQWbN4ie5LRlwmt2aT7sqtdOgoW0JkCRu6p5jkx2coUpYsriqDC2L
         IYuUDEzwUhoAPYJElgkbLxwwk6kJgGOUJsV4we+xkFDO3NVYVqrAfQ483WFinnFHyIze
         3aswcTUpuA+rC6DkyddXBWOqLc7EHhxkDi6jOA560+FOL8aJEc9JXJ5aBqgb6+8O7gFi
         IUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230730; x=1787835530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KbWAJa3C683yffh0RsfqBofb1SIppeFKhvek2Ax4mqg=;
        b=NW4CcQpo1yRR1uqBwqRDmQ7mrFeQuF1ZznIlIp6wYXiSrO7C0cIeu+yy353ejYrN3a
         G1K/yI9aMI+W8jk/cpvln/PnSo5n9nmD/HL7hw9RfQu5ap+9DNgMWMaDPxWslyUgGW48
         mhJcAQGlwkGeyVX30UE3TduifjJTjXIpGK5TSon4GgyH+47Aw71iQm3/hTNFVOKsgMbe
         S8EloTLfOeLGUoxFfaCjdyVYLT6/WOlNen78c4ITxIeSlW8x0hKBXNhY8cmAZn3Hm4+y
         g3OnX2nvCOnW5bqRfjZJoXfWj+4J0fDbQvbsCDvM8/k/+iPZi2xA96EC2TRpZCqhpFpG
         cBHA==
X-Forwarded-Encrypted: i=1; AHgh+RqpEPjxabaQS1vZADuJ5nCQj4Xv0PzSgjSnvYIBt6RoJSzVnf46lmXGwwIiSoQbH4lBB9dvDy5Wpsp/MMTrWppR@lists.infradead.org
X-Gm-Message-State: AFuF++nOr7+eYl2xf1rB2d/0+wuC2vrq8HJMoX6HUuqzgq6eKQ0vz6lO
	Hj+Pvox+f58thSfy0WIh3/D8U2DCwGrit5otILAqdg3soZni9eFROcmXKfsvUuWQrC+RtZli/1j
	WOnd/n9M=
X-Gm-Gg: AR+sD12OdSoTWZ7Kzs8AFOc4L0otuSbjIKRsFt0KFET8opUDPodHBoJJa5AxHIdE9YD
	DgN3TKlFxAq3WRRfDGYZTimKrlAW4aUoyETWI5gCg7QjBsUse6mCxJ4bVaXrrbkoL7GJECyTdM3
	czNqnegYxoMD57BuA6JgrQ2tX75R7+tLSw19aEaMuZ4FTWeNxjssOeU4S8RGzldqPqqpDz7U1Du
	lzUY6Bzn8N3hp3StcW+bCVUTNlHSvoNBfjQJMKpsueuA4IlaGS60Q7OOHfdFYtjOQ8ATkQRCPqk
	eOFhUfyfROGa0Fz/7+rUeRPU+VlUf0tqvxSWISgvqu8ppmp/hYi3m5th0e+wCuCPbqpEjMzhaA/
	+7Jp06nz5OaBm8gxgoRhDON+LcD53gC27ssLx+0bpyXmJK+ZxYEGwbQIPJt8UOxm93yhw9TUK1J
	BhzLGVE4VjKSn+dhzdY8rXuagMLDE2GSnPM8wvMl6ODlUzhZT7GlBavqv5Yz8RC1hF9+cNz+O7e
	gcXvv8YM65JoeLcbDy5LwOF7GGwetBlw2U=
X-Received: by 2002:a5d:64e6:0:b0:474:530:9d with SMTP id ffacd0b85a97d-482b1fd894bmr21727223f8f.13.1787230730303;
        Thu, 20 Aug 2026 05:58:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c45d1sm11095767f8f.30.2026.08.20.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:58:49 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-spi@vger.kernel.org
Cc: lhjeff911@gmail.com,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH] spi: sunplus: handle signal interruption in transfer wait
Date: Thu, 20 Aug 2026 14:58:35 +0200
Message-ID: <20260820125835.1584270-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055852_532622_6CF42E2E 
X-CRM114-Status: GOOD (  12.72  )
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

wait_for_completion_interruptible_timeout() returns -ERESTARTSYS when
interrupted by a signal, 0 on timeout, and positive on success. The
previous check was:

    if (!wait_for_completion_interruptible_timeout(...))

SIGKILL caused the interrupted path to fall through as if the transfer
succeeded. The loop then re-entered mutex_lock() on the next
iteration, which is TASK_UNINTERRUPTIBLE. The process could not be
killed while blocked there.

Check ret <= 0 and return -EINTR for the interrupted case so the process
can exit promptly on SIGKILL.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/spi/spi-sunplus-sp7021.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index d78f48bc2b0a..607fc01c4207 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -338,10 +338,15 @@ static int sp7021_spi_host_transfer_one(struct spi_controller *ctlr, struct spi_
 				      SP7021_SPI_START_FD;
 		writel(reg_temp, pspim->m_base + SP7021_SPI_STATUS_REG);
 
-		if (!wait_for_completion_interruptible_timeout(&pspim->isr_done, timeout)) {
-			dev_err(&spi->dev, "wait_for_completion err\n");
-			mutex_unlock(&pspim->buf_lock);
-			return -ETIMEDOUT;
+		{
+			long ret = wait_for_completion_interruptible_timeout(
+						&pspim->isr_done, timeout);
+			if (ret <= 0) {
+				dev_err(&spi->dev, ret == 0 ? "SPI transfer timeout\n"
+							    : "SPI transfer interrupted\n");
+				mutex_unlock(&pspim->buf_lock);
+				return ret == 0 ? -ETIMEDOUT : -EINTR;
+			}
 		}
 
 		reg_temp = readl(pspim->m_base + SP7021_SPI_STATUS_REG);
-- 
2.53.0


