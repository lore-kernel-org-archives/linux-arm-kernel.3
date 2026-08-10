Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3AC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=; b=mxuw+oebaziQRzlTXGINo/v1tW
	AxjY9dSxZlF+fYu9+kuXr7c0+gR0fMsWMdHYduTZfvHSa8vlXvItklcdv/MBEz0SFhDrJaRoENhoZ
	t4kTOR8pwKasU3VTTCIqHJPRE8TwJJpouIO45EnyRWekLkUfSt1bp5SzBW9uf/HcyF1zqi8Y02GYs
	n7wrsLzgazeEfimCDGj0eadGkIXQXQQ1oyjuoztJUGBUwhKTXqB86LZ6VMK0wh0XBtZXC4hmHFFnu
	XmE2oY27wDp7befq4dhQEqCdSYNiD3s6eSPG/L3prnQj+/+mKsjV5hIjG2D0ZzEb3eyXBf2V2Ql7w
	JincwHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO2I-0000000BaOT-2rkk;
	Mon, 10 Aug 2026 11:19:18 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO2G-0000000BaNi-18tr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:19:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1125668a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786360755; x=1786965555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=bGeVhsaA94aoqHU0BT9E5jFqYKTmWDeglC0W1X4ahJZQox+XcK8qEVki8im4aXxrxt
         MrVTB3cdTozHJOhcbDbxh6GkfIo+2PdmTQ/FLrVh32zSvpeDkKsbvG0SmaHlxbsmIcZA
         HgIrNNrZwDWCZq0fPA7Xgad+enoqPqNc/9h4RPXh2EFLA95BrDZ5jBO4eilxEw0G3RIL
         ZGPaQCefXswwkFf9psCS2IkIAsRd4X+tMQfiiutKMVopGUnEGO28T5njok+6hkVxdVFS
         aK0c2/2nM6tPqCMPj/ZYmWXO1hrWXOtrpV9IWj3zPeQAUdC77WIeGCqZv5TN/iZX3Y1r
         IDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360755; x=1786965555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbur70RJgLEFDEhR3vA+p5Aod61I3uq30QWhp7Vm+/c=;
        b=AoO5KLVo5ewuk/ZILUS/DyhWddQSs/Z8PJ7bgpb6BxLCGGwxrq9xxtDT5CDD5nffoS
         ZTaPof8KIzFZVsD/EeRpfciB3K1O5ee8uCxxZBAwKw1jUrzxL8L9sbr6Y45gLBIUPePA
         43pgbMb38MGTl49d+V8ByLcDQL3PKmXDyb2IBsGoxzIraaVcES/GwxzhQ2GPYyOQZUBJ
         KG0rHwehzEm9N/kJoIyG3xMzrpCpdsYZgEtM+fLXAl+nbBbnbUcQwoXmRkU1LpAKWEJY
         324m/bbplmYRKZNdZ0Z8B+5Kouv0/NJyRJHSGBSBP6+GnJ7cgwbwWlriSlZDhv2SOB9v
         ItVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz8DwfwlRzHoRz4s6HrLClk0kTLLvUZ/qPcwMtTG2663NZzZZG10H1WwpZXRZWCjEQgMEVkJKZhD6yG4L+91mL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1KRkpFFMFiMwwOgWDBQch3PeIlT2P5/pN8Q0mVDJVIzItVOTy
	DJdLGkOAvVwjPimPO8j0K39jT/IoF1m295RCkn05oU2C+V/nF103BSHl
X-Gm-Gg: AR+sD12BWZ72F1n11v4zzue1iyyC3z2ib2FGbzjYL7B0kzuo8gXi6woL4OcR68F6XTb
	FldkNP5mLMsv4yuvJel09+of7NRmqzCyyTYGwT6wXEEmrS8S4ci07kKe+HWfUSB6nRJ4YQhEVB5
	fmzoDzkORCzcPWF6Q7GVAkz5wkvJBTOQMWALilh8ROjn4tJDCuawBeiHfHN0s2uZOFYPUqLVOLr
	gJGwC34oJ1xMq25NWn+U5OFD1WBkByDyDIpOEYhY6MSdAFHiacQCnc7ALDz7hnteGUaFYno8Fhe
	cMusFMSC5FrmZROohowoE7XXXErmTEy5eoVYeU+2Jts9Q9UcX2QsN4HE47Ng2N5uERvM7qByG1/
	Y3LREIiskj9DFLLR/n2EBHAdLko//xuXFcmU1lKoV9APu7eT+Q4/w6quJV0BNcfDGpl9Z2GCDI7
	CDqmlfm7KNRGYxKlAT0DacWJupvMH0xksL6yR9OsKzZzZwbZ0JbHzNIY6oMJNSvQd3fhkxzZh4Z
	+fFy3v/nlF1dn8O1LLuPrd8JVaV/xQkEVqgfVN2rPWCvclpwjWdQr3QB5Mms/ZHxera31HzAZEu
	m258s7QqH/auKVY=
X-Received: by 2002:a17:90b:4b91:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-3909d7a4839mr25823292a91.1.1786360755337;
        Mon, 10 Aug 2026 04:19:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm14798046a91.0.2026.08.10.04.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:19:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] thermal/drivers/brcmstb_thermal: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 18:18:41 +0700
Message-ID: <20260810111841.77898-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810111841.77898-1-phucduc.bui@gmail.com>
References: <20260810111841.77898-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_041916_977123_DA0480A0 
X-CRM114-Status: GOOD (  14.54  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index a9ffa596f7c0..477d078ce326 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -350,7 +350,9 @@ static int brcmstb_thermal_probe(struct platform_device *pdev)
 	priv->thermal = thermal;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						brcmstb_tmon_irq_thread,
 						IRQF_ONESHOT,
-- 
2.43.0


