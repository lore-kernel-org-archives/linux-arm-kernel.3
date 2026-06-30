Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=; b=oDB3cCapYtu+yMt7BmpmxyCMuB
	0CA/ljyIZ2GmB4B7Afd68wkMoxkiAHm2/uO2YhVkF1YqVos+HCkWyRHX13NaeRQhDlJ8IgXuQbMmR
	I85uZ0a8MYKjwfNte0gT+efjPVZBzuE2d0PBZUmunzBrmxlHqTLdIrja5kkl2UwCr4S3iDQyOi9X9
	ibyrkehKxXypPMw/8Cd9f+5ms3Brir9txnQpSXUDw38DXy+12qwShnKfsGhfn8mqOLw4YQEGRRYJ3
	WgoafN+LGiCSSk3RINxLDcE5vDN8vWbo/lH62VrizEwSsAK/ktdv7Eykt9OuVYvousgvFv9RTxWQC
	HmED56Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNJ1-0000000Ff9u-0cGu;
	Tue, 30 Jun 2026 01:30:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNIx-0000000Ff9E-3O5R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:30:28 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1804790b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782783027; x=1783387827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=YGUyd6NG72Vc9kNWbVpe3xdPguCCF5Tr6jtjf73yse1yJL96s7zuH68yZOcY26yLWk
         G5bHOZRCuv8qGJ+/JEBa+Z6ep1t/dnmRKNgRM8OzdPB06UDrMT8y7/FSMBgH/QCG7VYY
         LwDURdTr0HwPZmTwt6khjc/7CSvkdPuOOAyLwK8DYpS2KZ1mGu33n0wL/7AnmXpUDMHD
         Ongg974L7TSLobVaeX3L8z83+w9baeMeua2icWWC8zedOYcJikQxA9TVEKSZmpqxLndn
         5eH6lCAdz2FcdFOOcBySy58aQf3T06CUiMbtenC18Nr5AEs4afVEqgwnxkTWLP9YnwRq
         kBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782783027; x=1783387827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Qe19a+z1rLWPp/tt9oeqeMHtij9RgDnTjm7JiNj6mo=;
        b=Qsm/gDW+Wf+4fYpvfIAtrrAhNYh4i9FQo5jlqq6aFL+Bx3PuuSZL+CmsKtZeWJnuLY
         SQwj86G1vl/niYJkKlv0ssy2T0r1dBDU7o6VJIXltqcjWPmjPyU+fdfTS7ZGab3Xivd/
         sELE9tN2b5abVR5IrUXR7dAhF6SBeV7v9DLRGMblG21W/+LZj17f5k82FMNynuv2wMck
         4Jdeh52sL/0NO+SZTGumdmrV/b7ff02LP9FCDsOxG4PU80T+sDwwg0415AyaVAvVyoF6
         DSpqwtHUs4Ixqd6HQLS6PsU8EvnnYmp3IRjdAbHpi0/beHyOdx86OhzDu9dKm9Hmo1RK
         jQTw==
X-Forwarded-Encrypted: i=1; AHgh+RpX8ieGvXJiuMaiiuMZuqKoSGzGqVmXFvkNbw7GM3JJtRkRq50FRotcW5ykh/gFs25NBTNrR3Cwri8QjEVwuToO@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAnbMyIsv8IBssDZzesD1MWqHy4JHSLLS51TPjdqyi+LtmZIK
	7s7bAlMBGX9bBJ5pVZrTnixXscm+aEsoxOngC85fIsSNR6I8bPlJnxp1
X-Gm-Gg: AfdE7ckhhMoBEHH40ffUtfKPybEi7Hd5EYpTBWM/gRQS9pZdd6jQ5TiimBVbPlIIEJh
	1gUpY1+fZAaQv+IWlWHKWeInLewl5HA2Oyoq1K2HQk94E1C/9jXCVx5jBrgQJQFHoCwdd7vBzCp
	WOQVUUjwFN24BDNEWG0Y/G1Rq1VechK+bp8ntd31vqm8KnfsFR3rG/jJTxubku4adQQU5Cc2qSo
	bymZGsnj2rdxiZdpiaF891XK1mtTmu31ed2mO2EvGqXSlwzosrxPxRihf5d7E6yaxdEeNeaLvpR
	JrK+AxfGcPgrgqX8Ih/vfb7HXxLkzItSNX6FPZ3CEzy8mql9fyMe23yogMAq2qI0v8MIULShhPm
	v/I/CJrjYV9Kz1Iq4mGUaaaa2sZQOTm/H3uaBJMddyOD/0LxEQU+m9IWFB9GWXshS+K1wS/hzvZ
	wJ2WxGLlmr/jL7oXWwJDWbqT8ISs1TUNPwyYZFRUmGV4/+tKliB9YPTOv6KUWBH6VzYhpXJSWMK
	nlvuavL/g==
X-Received: by 2002:a05:6a00:bd8c:b0:845:259f:8925 with SMTP id d2e1a72fcca58-8479eed8083mr1234602b3a.6.1782783026718;
        Mon, 29 Jun 2026 18:30:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03cb50esm681063b3a.60.2026.06.29.18.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:30:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] ASoC: mediatek: mt2701: add COMPILE_TEST
Date: Mon, 29 Jun 2026 18:30:24 -0700
Message-ID: <20260630013024.1500623-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_183027_849202_37E51892 
X-CRM114-Status: GOOD (  11.75  )
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

Enable COMPILE_TEST for mt2701 to get extra build coverage as done with
other mediatek platforms.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 4af7bbb58010..224746e7664f 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -7,7 +7,7 @@ config SND_SOC_MEDIATEK
 
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC driver for Mediatek MT2701 boards
-- 
2.54.0


