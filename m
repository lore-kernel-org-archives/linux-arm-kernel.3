Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD93CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=; b=TbsOa/eIH2rs6qI2+D4/QoCViI
	nd/HUPy8krfmDhM2cxQ3yx4b5qvICTKm5FG3GT1UOZpmr/ZyvE+SurCCy219lMg19TeowcZOB91ib
	s6xOYH0r/pYi7xECd2rsXprIbbtJ0JWcm4dnAk9L06aTo4/W+rF2rw/mssQQtOKPSyqWT5uQVIuyI
	zQUdUF9FvCaOXya7h8YL84oa8C2dVFI3BqZTel6nIkeif8N7f83rw1kn4e2w4PDwXOwOP1+0OrF9D
	UibB2vQnpPtFZFEyf8o8uYKjiynjQf80v6E6+BXeRQR61i6npHAO1sE4aJ2VuW8BU0mxdHvPZofOD
	W5FU8wrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPeB-00000008Kqa-0C1g;
	Wed, 10 Jun 2026 20:35:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPe0-00000008Kdw-2IDY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490b613a17bso70915985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123723; x=1781728523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=lTblFJ+gG1bp1v1U7pSWDiXO+9BoHaD1Of/KD4Yl6BGQMOYmPPVDgQkujWsn+ziIUr
         5xOCJObxKm2Z8ZIkE6lYGfJlXUZfWweiAk19Ze+s3pCJ9YWDoiatZDTNFg8EJvU2fnF0
         WiRZDWURJSJsF0LZ7oKmCPWUnRcdP88ABEbLS7zcMjHAk12jcqQtT96aKa9VqpweQZO5
         aO1JltglvaObpzpKXyoDJYtLoAjSCoRbbFdJqBBhJNcGhd8GYi3zc9T60UA9Mk3zxcDe
         G80a6F9/pAHXcEBhrWGJI1fsyUJ7Za+DZBDNEyyezl9SBe7ghPoy/oLoaZdaBZxFChcn
         zLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123723; x=1781728523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=LVg8PFlQdY+w+elSYk7irtvIo17JGzaE4ICdnrriow+Pai6BbOxu9cAyR68si9l4d+
         zlvpjxOTAPWoTAPyVLpmdhpYPw6fRTKwkmgoadgGDDzkSdW/ItkrfaoRiEQOvct40+mj
         lWlPb+PJshnEGw34m3sgRgqtNe/AaYECTUAVF0/SzhChCOO7JbmrrWKQEOEqqTul23mC
         mHJ4kU5aP3PGXEET569kfUzEhlpP5Un2eYLbq9SOtg2ZSNarLuYiMRJDbb2XewehsmbX
         ni0ziDYi3zn38to3VYNP6qttpSVIO9KEg/pNnywCVFRLyZGe7hXrOLCODe7ccsC0VZzK
         hisg==
X-Forwarded-Encrypted: i=1; AFNElJ9BGAmgO5mxoWkFmXUbtI9Y3suuXAt8GjaL06cJXHy8MnWWfsqfLWNjCCX7TkmrFc19qKKBh9lh1tc3UxYLcDkd@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGnnOCc0PT3HU07iiv1rM/d3ByUB82nCvdTha2Btfl0+tCObA
	ZtceAk7aS+QmLuRJBDq4KaKwluCia81Eqp+WLbXeTq9guu8P2mYSzUGJdfiM7NF7qgU=
X-Gm-Gg: Acq92OEjzpaoq/C681gPj3agjOY/pnGJ48RSgZnxpScgvazwULkjGhFvHAhYMJgSEqm
	g27QnNFVQS9QKPY4t7G0cJCYhlIJGUTTD62E3z+D/O8wq+ksT6mwDcFHf/o+teDPvDuve6XTkjY
	2fU+MHck9hqNDYA2AnBeujIgFtrS8f0ygrniehODDoHokoaLv4VGYbyTzYTPIrlfhGQL2VytXvh
	12ScFQmteZqYXfXHA4fJpmAP36sIQYS2Gn+ySr6K6xDO7DjtrlMFRgz/72tJ3tqcwSe29BNtqZL
	++IFukwAQETN1Soh0gbsFUqRHV+OsxVNayOYqGnRlbQA6E7QAXPPNrZmcwoR7t54+7usANcH9jY
	7cYcEcNNDskzoNZzycyOE12OSju56Y7Yy6lG5tRoVBfLSRRa9DjuGICxP2OcezML57PYrvKD7XW
	0OtR30caIm21NNy5pOtuN/EwTsj85kY7fMDKh4XIUdLQ==
X-Received: by 2002:a05:600c:4fd1:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-490d723a47bmr117954105e9.32.1781123722748;
        Wed, 10 Jun 2026 13:35:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:15 +0200
Subject: [PATCH v5 10/10] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-10-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_133524_595615_6537AC43 
X-CRM114-Status: GOOD (  10.81  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0


