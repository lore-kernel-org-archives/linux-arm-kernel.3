Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96CCC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=; b=CrFD4/5Z/KoFve9S00S14w9RIw
	w3qtK1RQPkQF5KxBPDPmqVjpnMkCmScHstJjHo9x/orWEdmtxbdnskxyxojIBrOSYktYFPQry85s4
	xiEdPjE5GiIV67nL2zh1TtwFpWvSe1TJPv4ezKqA6SGirnf9j+wdNUOjPhx4EuNbAY8NxNcNEs6R6
	ympXaYEl2fMWy7g1l2JO5D3Z7Bz8iaGdM629LJX9KYshrOExvWQXduytCVmR7JusTj/eS9UryWKTw
	lGf0BBa1vvdKETwG72036BNM3ncOuQT5ms1cI7+p+TVNVNZaIQpml1EzxGjN9e3/+9nxoA8DlZvi8
	nFAuxlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrc6-0000000HY2F-2C0e;
	Mon, 21 Jul 2025 14:35:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqMS-0000000HMVc-2k4s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:15:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so24231145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753103719; x=1753708519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=nFeBx+iy5izNN+n/JyNOXodpTIUpJ29TQRoGOosHxS7kqZsctzNQjlvKEsz/T/RvHn
         TU18IYeaRlQEaPQjcu85k2C8UtODGnBcnWAGLUXAWGSEmJijdGtumA38P1Z7HNkzkIo2
         P7KiyOCeqjDxeTqXmV/3wcfHlBJqzxB7dGwi5WEnSpXGeqZmjDUYgMf1fCqOg0DQqHom
         Pu8VYdkI2+rlllwgTCun8oWRuW6JXM9uuA6Ek6HQ9/TqLWsWg3nDekRsmi1VSOLuWo6D
         TsC+REO2VBmn90aOW1rQmNiPvPcLVvQhjPSArazjT27RZRAwR4aE/RNAfuBr3X84F/2m
         xIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103719; x=1753708519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TODX06Luzw1Bg3HrSiWsMUDdqd0hRUT9XELHjALG528=;
        b=BSmJB62MG2wPYOIClk2NQNWZWE8sz0UFoahrsb/5f/IfhwXMy8ffvSHA+uKVvdM9sd
         AfEJAzMPXPLyifiJtreD1u0ixAp1ix8IPqGEs1JG11KFzVhbHBo6ganrFeKo+RBxyPm6
         OZkO2EP6T3qyTx5wFiWE8JiX9Ulq+l9O1wMbc5+O+VZb6n07B8fzlAOOsywHLVn3q1E6
         8MSBJPfPOs72osCAKrbBaDyuaccl30K7fD2AdMQDxqDgLfpLihhS+LRuhGhWC/389igF
         0hV2SAijVyixuCfgPfQgU//QV+2xpaXdt6CNMWqIZ/EZg4oQWDeFZkrD+uN4FYf8SevL
         FM7w==
X-Forwarded-Encrypted: i=1; AJvYcCUbr1ps2HMywbGg3o3v4qHPlZQbj9YK9X6ikp88w0oBBEKwtPI2JZec7zIPqOOe/jgXJsz6Du/TmrItzqP2iRl0@lists.infradead.org
X-Gm-Message-State: AOJu0YzWavXVAPRvxtdNdiJfYxi9LmojsYZSnn+IRy+Xyjn8ERlkfEao
	VdQS/VBxsTjsdjgIGFAxYZyv7p0dnrmyzqpbm0Zxx0yteX/xQqHl219aQeZ3dCPOFVE=
X-Gm-Gg: ASbGncuIkNLMkREcBkd3dvuIuobCESjf4wMmjKhV2s5uFCxTAsPTpEXINK8yTp2ZaP+
	oY90DCXHO1UqzAgZ3hEUgM7P5AGwJHeUuc206f/pvhA7kSdNCxkCahgZEIA4nrhB/bvP+MXFE2m
	lxSh8goPPBS7YGCcxT1g9QC8cQrugxPKalwEBlqjtJ9lsRXaR5iwEHIMzCSnsrYZjb7OMHZPUmk
	3o86mltNtxmcQ9QX5BmJsrXCmyQHtxz4fHaWemNepW83CLx3hqe3eetsanOq3zYFYWCCErK10r2
	oW/wjD5MiFfn1VG3T5EiX33yQI04RkJvLLTPfIY2p2b5kTaKoHoMrUgObx2DK9fCqzh9PIsIEUn
	8o/oBIwYTL7Uh/xHT5yIEE8A=
X-Google-Smtp-Source: AGHT+IE6hSA6IgSYZzhjcHqll782tZfplfgYxnmAitmMV8tqIpsaPAw0Kw0vQ/HRkVaESo1pggEX6Q==
X-Received: by 2002:a05:6000:430c:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3b613e984ccmr12169355f8f.32.1753103718407;
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e818525sm159556685e9.16.2025.07.21.06.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] soc: fsl: qe: convert set_multiple() to returning an integer
Date: Mon, 21 Jul 2025 15:15:11 +0200
Message-ID: <20250721131511.75316-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_061520_854223_2057B324 
X-CRM114-Status: GOOD (  13.69  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the new GPIO line setter callbacks missed the
set_multiple() in this file. Convert it to using the new callback.

Fixes: 52ccf19527fd ("soc: fsl: qe: use new GPIO line value setter callbacks")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is a follow-up to commit 52ccf19527fd ("soc: fsl: qe: use new GPIO
line value setter callbacks") in which I did not convert the second GPIO
callback. Could you please apply it on top of Christophe's
pull-request[1] and queue it for v6.17?

[1] https://patchwork.kernel.org/project/linux-soc/patch/c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu/

 drivers/soc/fsl/qe/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5391cce4e6ef..710a3a03758b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -79,8 +79,8 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static void qe_gpio_set_multiple(struct gpio_chip *gc,
-				 unsigned long *mask, unsigned long *bits)
+static int qe_gpio_set_multiple(struct gpio_chip *gc,
+				unsigned long *mask, unsigned long *bits)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
@@ -104,6 +104,8 @@ static void qe_gpio_set_multiple(struct gpio_chip *gc,
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
+
+	return 0;
 }
 
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -320,7 +322,7 @@ static int __init qe_add_gpiochips(void)
 		gc->direction_output = qe_gpio_dir_out;
 		gc->get = qe_gpio_get;
 		gc->set_rv = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
+		gc->set_multiple_rv = qe_gpio_set_multiple;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
 		if (ret)
-- 
2.48.1


