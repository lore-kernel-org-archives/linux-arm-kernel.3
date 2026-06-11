Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68795CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=; b=rRDtqLsPTDw/k7aaNuitl+otS4
	GWqmBayGDBmL68nGofMdzMs08egKtedzkEyCnCjcdsrKKVgxUEC/yLCu8Nq0bHTRo8add/IlXR/Dc
	HHbP3nvrbRuIv7ba5oOQVCM36iHHYA+cyYrln0jrYOjgRxOjlIwWdeKcgVr9c6zfnxzW0D4rHpHhT
	1fKpZ/YAevO5lM3+OjjL2vWGM8+2XInGxhHgQaBETuVl32NNlMycPQVLBYLlZ8ER3VSPjrtuHnos/
	RMe46a7UYqK/mPB5qcU1MFJzPP2rSWd85zsL0PYVXJqTzVqQIfl231MOzF/LNKWCoemxScuGD+4tJ
	7JdQuo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGG-00000008cix-3KkL;
	Thu, 11 Jun 2026 03:39:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGC-00000008chD-0hPu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842307473b5so5203746b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149155; x=1781753955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=ikG5v8NB0+hGzhSodmZPTzu/dlWKCb6xN0WPYOHwvVgNvVtBltQGe4GQHB/wCrI5hs
         osHPUF7VECvI1Zg+aQ8QZI9e2fJCIRKC4FWRmlMfHqtrv3BDeU16dJcTtbYQyW2R/411
         6d/8F36g8K4dG1dDZbnUiyMhHbm678f7ZqkZjAlyHFK91wtfw8tWvKKeVuGGKH8iEQeP
         UJUgm5tz7kM/hnk8qy80LIcM5JIW4sAPIpwIU5cuBVPuGaH9+820YIMzu31YNRCOjhRI
         jBGrBSbgmbVIgVDx895wmVyB30bG8ujSSebx8u9oYjZ4thYyzWCoNwntpyEp/Nm+SkB/
         xmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149155; x=1781753955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=gWsSClYt/dRdf5W/IHB9oj5WTtbCdMDuK/BA9AOk4fHmySc4g4Jmjya8Lfp1qS1C17
         TrKETLpCgKcHfa8wbeImFZ3iIQpT6jkVkELVb256OEybzEj2iGW1NA/+ImOuvJID1IKY
         oWqGpob7Id+evHkml646VyiCvbtaR/1k4gmC10UDULzu9gYcFPuqarEB/GVkkY551onJ
         cnYncKrtXwbH84WUFfwykCRC/LCFfHXvP1Nqf+/efMZfD9p8ck6/ex5xLesLxusxz2+b
         hiIHHYwaKW9PJXil59uY+z5c9r2UvFiJlf4QXJXXwip6yh0O+A7KUE5qoN0BiUUd0m41
         SrWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8OVvOyM0k8N/pKlJp99gT/JWJhE8NfUpp3fENHtYrUX9FCeH5JW3n/mTILFHRMCPDNfX+b9KOjHPM8HfZKGR5@lists.infradead.org
X-Gm-Message-State: AOJu0YwOKQidlbojm4yJFdrjNoZJHKhU9Ka1FqXOf9M5vXio1kFtN9q8
	wvSqGTgyl1ZhAkMo10iTyiSSWbY2pYk7dvQ2VpdIQVNN5rQDa58l2jQa
X-Gm-Gg: Acq92OHKAVw533Gcq7aE2ZZrWqjMdLWxc4hCCShPwLfgqNA9GWlDc9yVwrgkdSTO53a
	kPkgZBO9igGbivYSrojgDVy+YsQwb4MiX9TRiVnIr5tO7yUv6d1hDKExWkbP4d9biWzc2nTeOR3
	FNbunsGyppmWzIWy5Cj0a2wPUydrYoI0g9mkmcuip3LlYJpCXFHImAzb/biDznlvYfV+aBgSUNQ
	YxsHppx3RiOGUZbHSYtjaJPJDSN1gEKwhhRuFhMd6MseHJRwym/ubwuEzIt8rVov1WpqDDhioD+
	IdwMam/pyF3YBOlxkHQNHiTSY4KTgIX3mXvwi4EjOBlP8EU9En6+A1FzZgj1ZfZXRzVF9SSeGvj
	wXVq2fyp9oBIE+DYiW9IWaAJlZcr+xuf8qFB5NzR+t8x5aa8htw4uk20EWDiP/72yFqqdYv5DQK
	aP4XpdpdeChCzmyiesxjWj2qLCc6VfaMnpuk9nJJyvLWMfjgJlvIc4/cx+PgwLzp5iOF4NUnmU1
	ch8mKI/oDPMioBoYULtd65pQXnhJ5MH/DzRvCizH0/g7Tn6xutPU6GY
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr915556b3a.39.1781149155261;
        Wed, 10 Jun 2026 20:39:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 1/6] serial: mxs-auart: fix cast type for of_device_get_match_data
Date: Wed, 10 Jun 2026 20:38:51 -0700
Message-ID: <20260611033856.6476-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203916_196624_27A96F25 
X-CRM114-Status: GOOD (  11.94  )
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

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..de97c0f74e7d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
-- 
2.54.0


