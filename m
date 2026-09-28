Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D242FC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=; b=Qhnr0LxfIBklo/lQv+ioDXcmdm
	ryTNTWNST4uPGOqJC/duEL26vGfxSf04bwcJbemvM/I617m13FK4f6a8XR8Tqw6Ej58of+sdm4o+r
	Le05CF1RbSDwx6f/h6/baqkgSb1CaPDU/jsws4Y+Yx9pT37xID19y4UEbeolpKquHdxToB4NTpM3P
	HZViYkSuqkVd0IgfC64bEHfgqxXA0+icO7b184RM6g6vbOi/BYKlciex6xMJWvAdlEhVBDq3wA8Fk
	ea/fXe38D1OsykL7uMzWwzW4tcvyOcjokORiLWaenDpKAi2773oySV1WxRem6q35xdDi2fLc4bs2b
	203aLw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB65X-0000000Ha6F-16og;
	Mon, 28 Sep 2026 07:47:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB65V-0000000Ha5Y-2TRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:47:50 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so25977245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581667; x=1791186467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=f208OaGJaYdh4x0t30jwymRcg/0/ms3iKZIHMQN0y0F2Jm12ifg/VmMsbYVaaHH2Xw
         OcfnqQsmVjtHsIXEfJFP7ykYStuwlZfBfuHqJYF8ZQvBd5ujbjX1v9gYMY5SFkH1GdDi
         vewhM5sweuHGbe3/7lpbd3XjhiBlLUVtd27OQQ7z31xwXgTWqzYVkHs1qADoVjjKkMey
         kDnW34bdCvOLaJ7hG3hr0Op4liDjkZiCumDN44ocXKtd22z1jf40PK1SbnApgTrDS3Kb
         NcIngqlDV5IOPSt2WF3kDNvTAtN/Snjd0eewJQD9+v/zcyTqk9A1FA1JapcEFZgYdgoJ
         YZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581667; x=1791186467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=LqQ2im1xXqVai7sm4dgRl03q+CIylrN7sVHGJ3Qi5+7uFiGVvMhEG4JbbzGh30qpez
         kbInD2u+EOK2pcPtQcJV3FhGLG2bqgmyZqVmK/qm5A5U8TVSUXYh+SNj4s4qI4+OOkoe
         P/2X4yBmIuWTBn6EXlI9cLTkV39za2T5On1WBQRguaGkoYVUBieg7m9jA0hA/tP8rrql
         98IZBVLlhfcjOKFqTPV+ScADp8V1L9LWDKfUAi00dM8cSZsrDQgNJb/ayq3UXj+FWX0U
         /jxs+ULlmkObvAdXGxo6wNBq2kp4iS7q1Pxfi8A5WCL84O2BFmYQ9GpMK87403NOValp
         nVWA==
X-Forwarded-Encrypted: i=1; AKwUvBwoA3SENGCFbKSHk1MHdGVX7QsmhiGqJG3vgNOdM6Y35YCq/RAf0pJHEwcH2jLW3xAgFsjFEnGrSfveDt0oGM+p@lists.infradead.org
X-Gm-Message-State: AFuF++loN2XELd2vteRrfDtSstAWuJNnlceiMdUjmD4K3TSvB2evltC7
	2/aOwMLLV32FFBrF2Mf6imcWnLudpCU5qetlkb1iw700AnR8JsRp1Qct
X-Gm-Gg: AYBFou1KOqECRcpDFw9QIoLC4k1FMLG+syYGpkB7SIDTN5APK+FEiXmOHevBeDf+MfN
	lXl5mJcwlXLLKbHKlLYsy0mdc8qmryLdE5jXZymRWN6rAlQYD5fLTkHxvCwFFRFdcigJ3l3xvwl
	qLrNuYxb5gs2YMeaAT7839us7nZPCg05o7dw/hamwD4tcaQ7zqE3YVKe82QjaSkcsqw7/KyIxxq
	6qnlUYskqS/nqnluLYY50MsJlxa7TdWcYnMsm6Gee/Yaks4LutwGb95O0/XJ0qHZuJVcQho1b7E
	tzizK0QMOT1U4stRdGTITrlj9xnMBIc6KDuzN2ZDkdJxzhdO0HEVOJPxn9DpurrE9cX4Sx6Mo4D
	yY9DHTBitapno47L13kIvFAlsgk/Wvge950UCufgydlSdXFRxqlaYw/DpiG1aSD8GrheWRuenyX
	VS9sSP3bUzWD9JN1zUNRUIgsN5bdQY6e3mEs388I0beUCJ/oKO5sjINS+7wy9rCOIwUW9b2dfek
	CHuLIAxcsvGn6T6w5cwhFdiuKL1G2P4sgjlSW22U5NqaGrOmxotM2RMsw==
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr36162805e9.21.1790581666994;
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
Received: from localhost.localdomain (host-081.salzburg-online.at. [213.153.56.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm25817668f8f.30.2026.09.28.00.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de,
	stable@vger.kernel.org
Subject: [PATCH v2] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Mon, 28 Sep 2026 09:47:44 +0200
Message-ID: <20260928074744.23378-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260923083729.64831-1-ginger.jzllee@gmail.com>
References: <20260923083729.64831-1-ginger.jzllee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_004749_647426_26EB1FC4 
X-CRM114-Status: GOOD (  12.75  )
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

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region, and only then stops the capture in the
hardware.  flite_irq_handler() runs under fimc->slock and clears
ST_FLITE_OFF, so an interrupt can be handled in between: the handler finds
ST_FLITE_OFF already set, clears it and wakes up fimc->irq_queue before the
capture has actually been stopped.  The wait_event_timeout() right after it
then returns immediately and the driver continues as if the capture had
stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a002be ("[media] fimc-lite: Add ISP FIFO output support")
Cc: stable@vger.kernel.org
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits, as the media CI asks (the commit it
   points at is unchanged)
 - Cc: stable@vger.kernel.org added; the bug goes back to a commit that is in
   stable releases
 - commit message rewrapped to 75 columns
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0


