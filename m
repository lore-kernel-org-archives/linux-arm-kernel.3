Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5438E6BF37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6CpvZFNYPfcLlyPGQOHHlGwc6V5tahEaj7nU7bw5qc=; b=03GKKW9mOeOT5w7JKSeejC9w3U
	4SvNtSqoJ0T2QdY6uMswoieXLPwGJVDIkQ0Qds9cvfM84ls/yLfpw7DQyseuOPxrCTsPnm25pkTCE
	dPgIM3xdfnsT9K8ooyBK5b7+J8a1zYqwkA9XscuVGtfFmenkk3JQsac85t8VKaIdMSqCojA3gZBpc
	y4DepCIL/TU1lRgRiCrLM59aoOj/KHFV1cP3uF0vCBczQ2z4UaKZHopQclwBgTvFggrg4MEMXTRJ3
	dEHViUD6ruO6b+ZaZ/x1QJLMA7EwSF28+sXfJxe7KkRy9gXnMf0bfHn2coVpIlPftVaA6O81MEFvx
	hBZJroFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQw-00000001xbP-1uH6;
	Fri, 30 Jan 2026 20:49:38 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQt-00000001xZl-1yNm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:49:36 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ae5283dae8so129522eec.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806175; x=1770410975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6CpvZFNYPfcLlyPGQOHHlGwc6V5tahEaj7nU7bw5qc=;
        b=Pr0leFtDV9s1gSSgbXksnCWLFdX2CQi2/AhxHy/MhAuOmkzGCUsbIJmTlU+Q/+8AWV
         acBfu5F2tT/zWdVzLEuxlIV+x/USfLVxnui3Cfp7emzrXY1xAGK2Hx1xvGK2DN/YgOZa
         5A6HDSveOhF1s2BerqPEB0rEWL//jLJcFFsOFBmDt2Ni66Wa8t+bMIcZYwjlZ7jBrC1c
         vDVPsjBeOzWX6/xnwcpq828iljrIGonvzJ7SXcJPq1zzU34tAN057dRyp7XJ9O5jqq3g
         AIxsbcwkFPqD0FQ4JYp6PxKhOWM7Jm5WBO1cK2tHS1+TkH0D7/DR/v6tyBVM3bq5JX3r
         8c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806175; x=1770410975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6CpvZFNYPfcLlyPGQOHHlGwc6V5tahEaj7nU7bw5qc=;
        b=IteiSOfjZpFeiucQ4k0RRXqkd7RGW+jPjt0GJnOj35Zhk/zL7ZEb1AajG/p1/WU1f6
         O20VAtDfk8CId4ZNp+fC7+7eKPHAY9hggi/+ZCqlssXnY09RbIGfWYSPSWoNWF5/JPrZ
         4V66w0ydwpyio7tBJ7H/dn/fxiCSWe+76FuCrtxek7vSvdQc/4F9JY8iy/tf2NRgBwQS
         yj0Gx+MFAEiSFMRI/oifY6pd7yRwuiahKYZP9h+vMLVfevGm+qHsLZTlihgacDtZ9BXq
         5xvfn5Zi6Y8HRD1pp9uIZatqIhRG7onTNmbVg4OhgBxcf9ZFa2lNGDgyErqjccDtvltD
         jXrA==
X-Forwarded-Encrypted: i=1; AJvYcCX8GIdgWl0vm6XDtM5zCEs5nKf13HK7JNu7/WkiqvoIJpt1Mmqq3EKU0/BaG3tDAlQFDg6abSRArivSDy8ch3Ex@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLmS6W1/RbElCx25m1vuXhJnX0xIq8oSBi2njttkHaYMcX7YX
	hVzzaDQ/dW3cztDJrYSeUxMrXJGW2a9n5M4OrvB41NNuHRmiK2R+Gy7U
X-Gm-Gg: AZuq6aIVP+QjF2VtdfEhbSU0tBuaBPUztzFhBkL7S0S8Tn10XX+y9hXHPJMgAOgRvkp
	9TAGI9lnWc0z48MWN1+152RX7PlV/5GkMIxgsQneYhciYxT3WvQ1XCgPsE6zJXUmEUeeJaLAd6z
	WaSBAqoQRd9/Fp2E0wZ+qc2qtKUn+I6dYReuakYv7HpBgsU0zotnr1NA6wvhu+pVfzfkuJF6Ys3
	VlSr6yV8ohORNokKUYMdXx0/LG8lOrx7xv4bFiQp88LJYXg7GGbDHMGjXkiku1i1tMh0LKKjiEN
	hyjFfW4fCoUB35QyFSo4GQ5uIIGAmb+5+PoIlNLeLuu/0RrX0dHUDtTze4098GNvplwZL3ewbme
	9THkYbLEbxhwnBd21siXnP5X2cI/3WmYH05CEdQBTRhesw0Det1qtgHEijhNgbyxnWnoDIFG9sb
	mvYleP
X-Received: by 2002:a05:7022:41e:b0:11b:ad6a:6e39 with SMTP id a92af1059eb24-125c100d211mr1072667c88.5.1769806174567;
        Fri, 30 Jan 2026 12:49:34 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:49:34 -0800 (PST)
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
Subject: [PATCH 2/2] media: bcm2835-unicam: remove reference to dropped driver in Kconfig
Date: Fri, 30 Jan 2026 17:45:43 -0300
Message-ID: <20260130204628.312246-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_124935_535775_30208844 
X-CRM114-Status: GOOD (  11.45  )
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

The bcm2835-camera driver was dropped in commit <90204a38a760>.
Remove the paragraph in Kconfig making reference to it.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/media/platform/broadcom/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index 32b76ebfcd9a..93ba565d9a02 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -14,10 +14,5 @@ config VIDEO_BCM2835_UNICAM
 	  This is a V4L2 driver that controls the CSI-2 receiver directly,
 	  independently from the VC4 firmware.
 
-	  This driver is mutually exclusive with the use of bcm2835-camera. The
-	  firmware will disable all access to the peripheral from within the
-	  firmware if it finds a DT node using it, and bcm2835-camera will
-	  therefore fail to probe.
-
 	  To compile this driver as a module, choose M here. The module will be
 	  called bcm2835-unicam.
-- 
2.52.0


