Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7806D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=; b=mldhfhNf36hbqIIcvwQaK9yk7v
	bzqptQY4BDVloHre34JTPUqEiHT+niKvMG9oEDk8NAnvyBACjqnwz7gFgCTX2Q89cGhy++mBNS5wQ
	ZNu7jwQqHjDmPutM6LDNLiC5A/Dv0As+q0BGVnWKA/ETJb8FacVqHK6Wt8HZA8IRPPM+yPhcbaya+
	XoJv41/ZLZLhPm6KVfVJQjzH67knsZ5tHa6WOwDsHtxpJoBEEFW7wDrpuPXEivAPn9KI9P7OQv0Tr
	nbx++SCEV4EwCf6Q2AEm/cwzskP1pIGltqGYQRM9ofc0cAj2H76QqTK3yKjyy9lm0Flu8A2XGsoNQ
	PRmqKFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWki-00000009wNB-3UzR;
	Fri, 19 Dec 2025 09:26:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWkY-00000009wI6-2aBW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=; b=rO6SuNGbSmLcq6Vo9cFKKzYTrq
	wv+4LMb4LMFhdlA3Td89oH19UF8CsoBd4X7EZLaurFifu28ccbroqMTJVBCaRz5LZvgABlrfT2j7N
	esYKSjM6QPfHWgtpRJOCmjpBOLTDif+rpUJ1arxzqD9PgNUcppA/UVfNyqYusXFE9YjuuRDdjwVIt
	rrdoJjC5nc5nDDg3kH4gWG6vE+td/MwEv6zRx6wC9MTUINl1Xlvt7fQjZbec2MUiILrHHZfXkZmHN
	3xBFe+IR0KtIS8WaeQB1zlsXvJ4opcuZSoBLn0M6ya5Xj6DarE5hO1S0koKviQKnKSAnLGzMkObFi
	bH1Os1+w==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVt3-0000000ATYj-1HqK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:30:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso3486985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766136370; x=1766741170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=;
        b=OrP41L4awWlY4DM6xKn2cGglGe+yWzmCdoWEWu6sUUE+ciK/vZm8yxZvSenwUBeYd7
         PJVCqn0xJ1ZhrLHa7DSAWzNtNWFVTBcXU9M/ae1vyzf5YWKKNaXprU/El22qmM6F+HT3
         l37JikFRKr6lnrM2Zbd+ucJ8TujAE1mudcFmDCITS+FrdkT+dw95lAewFjgi+OqBhCF9
         yLIE+zkkd39VVVB5lrFCYxXZ/cR4iByi8oX0ZhYnJsKFIYmq5bNijAS7eZ641sicl6bX
         3OtTC3SIXV/Qe828aOH7sU7Az6a2aI+gIPv+uaQ81dw7sCz1a48I+49DwbF2YXALXskT
         5rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136370; x=1766741170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/mp1cXdFClVmFyKeKpkTnCOC7fFOUEAMCCmxVP0ZFE=;
        b=aSihC1Sk/GiJbr8j0YUzecERfUT6Sp1FUaW9aGaLuj2nB/EUVBeVHwsf9JWYVLOzCl
         bqWMnMhZF2BXvmBLinH/h96lI5uf2KS6tJmfrPCY87hlEFc4V44XjCJL9FYSbehIiqfZ
         xN66fGiF8DKsbMSVk0zqQsyFRtTAyK3ZlIQRrb+0Lec385rakQaiLpkHH7i/t4os1csN
         mIjqqc9nJA4dgKDr2IDjrw3mK9SwfNZ3JeRQg2jpGNSl3kjChpHRQXlsoyZWRhojXPFv
         y4cVdA0Jxdih/OuKWMMbKi4RNUxwS8bEVszg3Oi22QFZcSUFt9gjia4YppgBpcOWv9pr
         gIgw==
X-Forwarded-Encrypted: i=1; AJvYcCXEPuF98+BH0EzuSQjGHOf9uy+gMsL1F7PJWyA2oz5UPwrAg8gkazP+If5uX4HM3yTsTrAPi0vEDdCk1A0c8Ovc@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ6ealvTCQhWONEaGUHkzxMwH2Y+LdmvjODRk99JFMCzsnOxDD
	UMU2u9U688I+8BrQfzdDt7bFkByhB+YYfo7xSY3qRXJbFBaShA1SVW+sfTBmSJmpFe8=
X-Gm-Gg: AY/fxX4Vf5cFotZ9I0eK0Q1XPAZxFCozTQ3sGHHcN87ggs1kDpyUy+Aki2nXPmXGsuV
	WlLl5QbLKH/Z+a5bc6WYxQ4KEQH4suB0S2VCNN3u9l3F2tTVmPKw1u0KO+CeFsdi8F7H3fi/ZWi
	GPNqx9YLFhDkoWYlB90fzcvE7fvABrYCHQeYd3qfAXO2XXs4g+vQTkAOSa1Zs+CXQMAhUi0voSu
	rsKNz3x9eQUkiKNrr4eUFlIeWXM4z24jw+RnaCMZ5k2D53jDMkycIZEYRWdIsky514lJ6mH6k2h
	qx04fJa5LBjkBb92yQoqwBP274T/ElON3rnzSpgXgB6CN+bIfOobRpL478Rm3c76k0f+8U+OxDS
	iiTn1XLcjA0/RknM9rL9P7QkCeqq8xb4cWd1Wu5SOcCjG8JGt2Jw2oKCXm6sBKbw/MH3lsa12D7
	dB7SCxD+Dl6pOhTbQAzQssBJYhimzKVZ0s5xrKszZJC5M8AtAb8XuKosuiIOFFRvIz5TcT1LKMN
	wg=
X-Google-Smtp-Source: AGHT+IFEGjvrlWAs0NpG2elZsaHgNsCZyVGl9rExLbOyNOaoYdDfMM8vBeF0ffSfqRLAATFuQzu3Vg==
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr18629415e9.11.1766136369925;
        Fri, 19 Dec 2025 01:26:09 -0800 (PST)
Received: from localhost (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de. [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47be3a2b419sm32705035e9.1.2025.12.19.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:26:09 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 8/8] scsi: ufs: Convert to scsi bus methods
Date: Fri, 19 Dec 2025 10:25:37 +0100
Message-ID: <69f17c7d4f8f587e2a56e3ea268d441d98a6a895.1766133330.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=JFJvLGnyaHaCV/eJzejgi5pSvHr6D8xakNdWbDoTCoQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGlFGiGjjk6qc0RvRyJZG5ixc8Wz+NTnF0Cizh6nRvjrn03iE 4kBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpRRohAAoJEI+A+1h9Ev5Ov6MH/jlY GNzBxxjQ/8nlY7aC9rclIr1Lin6LyW5AQ18LOuo0fVz3sG8R3ZFEKxjSgJeIMXKXO8nP9NCVvQr TUPIpYMAUlkYaMsrnD61k+Xqver+dgeMYDw4FC64WIuD2/DQjl/gg5d8OB/KKKCN1Qr1sNhNb/R nKRnwHJkzdfscRfMOPZviEplerBOt/hwrbVwnpSDdokMqZfZDI2OR1gP1+HsVT3JDJrj71gFBLl /LnuX6EB0ADIkKNSzywAiVQqiHSjGZVjCYl7zi+RNSdS/QZ4IHFnMT8nvWK+2GcTo5KX9i8eIxj TopuKY6AKRdIz1k5qDtUXiNO97+TxTahd1eMKyk=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083057_566002_C0B6CE15 
X-CRM114-Status: GOOD (  15.76  )
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

The scsi subsystem has implemented dedicated callbacks for probe, remove
and shutdown. Make use of them. This fixes a runtime warning about the
driver needing to be converted to the bus probe method.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/ufs/core/ufshcd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index da1e89e95d07..78669c205568 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10525,9 +10525,8 @@ int ufshcd_runtime_resume(struct device *dev)
 EXPORT_SYMBOL(ufshcd_runtime_resume);
 #endif /* CONFIG_PM */
 
-static void ufshcd_wl_shutdown(struct device *dev)
+static void ufshcd_wl_shutdown(struct scsi_device *sdev)
 {
-	struct scsi_device *sdev = to_scsi_device(dev);
 	struct ufs_hba *hba = shost_priv(sdev->host);
 
 	down(&hba->host_sem);
@@ -11133,9 +11132,9 @@ static int ufshcd_wl_poweroff(struct device *dev)
 }
 #endif
 
-static int ufshcd_wl_probe(struct device *dev)
+static int ufshcd_wl_probe(struct scsi_device *sdev)
 {
-	struct scsi_device *sdev = to_scsi_device(dev);
+	struct device *dev = &sdev->sdev_gendev;
 
 	if (!is_device_wlun(sdev))
 		return -ENODEV;
@@ -11147,10 +11146,11 @@ static int ufshcd_wl_probe(struct device *dev)
 	return  0;
 }
 
-static int ufshcd_wl_remove(struct device *dev)
+static void ufshcd_wl_remove(struct scsi_device *sdev)
 {
+	struct device *dev = &sdev->sdev_gendev;
+
 	pm_runtime_forbid(dev);
-	return 0;
 }
 
 static const struct dev_pm_ops ufshcd_wl_pm_ops = {
@@ -11223,12 +11223,12 @@ static void ufshcd_check_header_layout(void)
  * Hence register a scsi driver for ufs wluns only.
  */
 static struct scsi_driver ufs_dev_wlun_template = {
+	.probe = ufshcd_wl_probe,
+	.remove = ufshcd_wl_remove,
+	.shutdown = ufshcd_wl_shutdown,
 	.gendrv = {
 		.name = "ufs_device_wlun",
-		.probe = ufshcd_wl_probe,
-		.remove = ufshcd_wl_remove,
 		.pm = &ufshcd_wl_pm_ops,
-		.shutdown = ufshcd_wl_shutdown,
 	},
 };
 
-- 
2.47.3


