Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BACCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=; b=k9dRvmpraj8KGOXnjJO3mBrCFw
	MBVS0hK73AOvYWDw9r++y4+lnJnTVpJvDd7PYIcFddyK1lHg51nHYFgNq77y0QHbNtsFyOfIuYnDS
	vyh8KvCVuNVRwXrA92PiZBcccLCKSSgpIN6S8Sgh/ZRgzUYf4jJ2EgGm0mI0Onbu6meQK9IogWFGL
	xgjvm1zkYGpLSMUYSU7/Vxfs2VeDFFBD8Tw8IqxSRcHEsIJhIHv5zAu9ThBh/4MkKP6sLgh2Q3P3x
	S3p2Fr9X0zWGS6wvfJfJmmhyuPLURbqJnN7uq62MOv7lbhQdYASNB3w2qkAVugfYYIKStg4nz/hMI
	nxNgoigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJA-0000000BwzR-2boX;
	Fri, 22 May 2026 21:21:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ4-0000000Bwte-17Wt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so43262205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484880; x=1780089680; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=pheUxuH9DoozS2zhnmsBPdRgMy9pNWdRFMH4ot0HiJETW8DoTq9DGi5gvx8yp+Di3B
         jJOnpl88/0wv/s/ynntwMqWnN+dUBqnmQETjiodTRilRA9qte1lv43wn8elE7GzwfVkL
         77+Y1xvsh/ezQR3wSY0z5yuXbwlAlTB/8en56//twzudko7hntKnZnQGXtjSUSvrzNMF
         a65wHbnoYFYzaa/RUrIMd57CEIPDzLYgW7xDjOIzjfXUJ8KcSrOO2V3DwjH8D3fUtkZV
         Vy/io6+BOInIezrikCkFzlz03WvvzghmxuTWXHkDzZ46uGpFDfQJrxJ2cB6Is7TbFPZa
         oC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484880; x=1780089680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00ruy8kpQH+b21j+wCBZYocT5CVhNgJL2HRPgVpHHfE=;
        b=Rcl66G1iwhpo8rPhSSCDn74zezabPhJ51zXMOiOC1Cidt1p/T02p8tV2Nb8hMBTK55
         xkxFTr8XknXdEEvA3z57ZsTpLGSUxnzPXPfqPQEZUwwkN804JbcacjpQoh/4lmYbBUky
         JiL7eb4va+Z9w6abXafmoBpLqOAHxye18RkJDkWJB/XPJFCPYHySkv00n0KKG1zAkKAy
         zNAs1cQhjqY/yejz+VxRCzP4sCixkU97NcaSbyiBpKEmi72DB1vZJ6tWXQwwxTUdjYor
         EyiXbz1gDnGHWFxLYEE8kNivnrNOJRuNf+E16YuzgOkFTpJE3/Y2puzV6KJAnx1J41tv
         6aXg==
X-Forwarded-Encrypted: i=1; AFNElJ8mDzMMONcSIZuGw1667Kmen6X/UVDHqrFRVcYTc64ZGs+xUa1f504bwO9Z5sp8PnMO1cR2kYWR56lfe6N/YbYk@lists.infradead.org
X-Gm-Message-State: AOJu0YyiD4nW9xJ12Mepyq0Sd18f8rGKVTj9tb7FY4SyMB8Q8z5ndDXA
	/2jAycKgDHYCBIQvNfelobgi2VZmyqIYlR5yUJ3IDQZMaV9yZ5YWE0CYyrgFFxuoPuI=
X-Gm-Gg: Acq92OFCRFbwL/9SI8hxs8pRtCG+MRxm8Ttwc1Elg4r+fZFijFrI9fyVitBLl/S1L/e
	ZYiMgewannPESTcjkfgc5FxqKGGXLoxGzp4hDGV1g7aLYBkjsL6Z1eS83nQHKUnXjeHTFlzoVFn
	VhMb61vlRorL2R2WGneJFT+5gXk+rnC1nmNLMQLdFf4WkRGAA7JjD1rCOWCjwc7EnZ/Slyh0jdY
	qNACS4MplfRWSSHpLbclcenADN7XoQVqD+iUDIB/p/CrXBjyJPmB6Y2w3vZ7Kkxd0/lH2TaH5cS
	pNDCxapBRpOJi2NqtjgX20kUJw326XP/Poj1IzJE+i4b98O5Rnzqsm7PNTgYR6xQH8cBYC2u4Ih
	2cZZ+JZ7ERBxAIkASme5x2JDWN5s6cHv/FmJazAFuDgUGAJwI8EIIuJDOfmamM5fljwtWUmSOUC
	ADABDFPMo5IrKTWR9HZ+IseM+hc4oZPek=
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490426b0c92mr54271465e9.16.1779484880243;
        Fri, 22 May 2026 14:21:20 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:32 +0200
Subject: [PATCH v3 04/11] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-4-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142122_335241_7F6F6085 
X-CRM114-Status: GOOD (  10.16  )
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


