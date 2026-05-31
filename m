Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AD8CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=; b=nP9M1r051Uu8oMKQOPpedBpuyD
	uOVLqMlHuCFjS04Bm4fMQtVFYeD2SRkVT131WVJtPTgTd/S8I9Kbs4sYF4wzMV18xD5U/HcyTG/lV
	OJ9xv4SWapke7H2Yh5iV1UQaaNNj6budg0+Pmh01sVVGachZOGwnrkPJ7xvQux0Qqo5yr2KhJJ5rl
	hwFqOJOmSSYoXI8Oz5lnonorv5Rd8pdNdETpRzchHnsZxHZ2HGcjeh43gaXWUUDcBr5iQF3FE7O6I
	UUbS2Zldy0lqYUrDjwPBmgmcqm8IdDPxoBZBsER9/PmuzB32jvBozu1ldQkpCVYCWbzr0gKMd5KLa
	Ne/iE7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009geb-18F9;
	Sun, 31 May 2026 15:26:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3A-00000009gb8-1LPk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490426d72f7so81829225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241162; x=1780845962; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=R2b8b3Ca+37m2rQKXbPVM2HGOs0Sb11Renjnvmq6afvO+i8RuHHhkjlNEpQfNvR+Ll
         q+Ecri7ZYXzlJ1IoxAej34labzb9VoR6P0O5IuZOJuTF9NMHyD65xnbphF693kVsyuYW
         4Gd43fJHFY6Vdm/tEwGgkxRAqi9yJGKJlNBZhNmqdh3d7nWgVanArMov/2b2aQ9a0eaV
         YB6OzyNrD0YC6eOhCAGn9qS/FO9KaL1uz0WgQx6BM4I8s24iN/qHX2wMFnGKCneTwxEP
         LBTVcKruW1lqVMFdEo0MT512f7jogTPGa4Zgm90H7/2jAnJEZ+EkyNnry4RNj0HHoW7e
         GNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241162; x=1780845962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=Ea3ZOYewD25CAJKVYyP84HgkktHf9dVKuSJp00uROrUHXsObHFpaCg5U1XgBhdFD+K
         ao1g7WLC74SVTDBbFay4JqZB3bctB1QhSHbNCjIpEMomLyoDw+7AcfzgKvmG6m1EJm2j
         O5Z4JucIZkTAb7dbhbAAdMhRYG3klkPhY0dfTCBEERPO5QJeb6w/cBnjSzP0VnEPi+xT
         V4dftrBJynP5MesWk3NTVygf+K7Oy5CqXcdSpykCMoWW3BlU6gK87RpzCeMqTOupuQM7
         UdV8sAAMwgAnCF4QwhaKsRdI1w/fM51QC8CzJjmo5Z9vu150orDR6p7m/c5hURsmDspr
         5U2g==
X-Forwarded-Encrypted: i=1; AFNElJ+DJ8hcbFENXqT69rBc1VnpblPmXPTJtd6kVR73ocejaETop1NAB1Pq68qMCtDjxnHAQfG8KtMdOnaWlhavBHXI@lists.infradead.org
X-Gm-Message-State: AOJu0YyPeT4BqnO/lI+7OQPmIql0f559TRrq5tymgAZDZat1me+0i7h6
	nzqvFI9T43yB/t5zMO2Ii6wdgUT1coDmK0iwEYeCD0e6VKd+OYxG400t/StlUiX7Gys=
X-Gm-Gg: Acq92OGj3K2WwytKOQ6VSMAee6EW9j4rTmurrUtsaON53Bj2IdkzZCF6PQdACGKyL8X
	QAxj/paphsirqvkiOnylg5cDO81pHEHjBI3fYVt1kJNJhKrBfaCdgCtHOEWxgMw/6+kL9OJhnVT
	Dgs2Lm+nUiidfP7kTZcb4PtvHiLHiGRYUqyNZh4tU/EB2S3O1WsB61ecS/8Qww17SUzWC9LSsnQ
	YJjPZwXBLS+7JZwoxGeJPKw3agderBy6Hf2gIE41vrr6V0ZzD8jfuad7rHVDhfoka4wo2QNb4X7
	0WPMmQU6qFLf+xazQyhTVx0zKtcYrfINsvrSRo5alFkZmydte83jmcrNs+xE0pFL1M/X3RdAlVh
	fiebFAKYo99xwjTP2ASt5aXAcH4luRU2WBdrQ/irlXIwxEHoebq4rDTy/s31xdVF5rEZDgxlnxv
	y61k+acz63T7ACKyx96V+UTltTHnC0w1XjmN2WMAjymA==
X-Received: by 2002:a05:600c:5395:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-490a2904b29mr165959705e9.1.1780241162528;
        Sun, 31 May 2026 08:26:02 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:02 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:57 +0200
Subject: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082604_371581_72A29045 
X-CRM114-Status: GOOD (  10.24  )
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


