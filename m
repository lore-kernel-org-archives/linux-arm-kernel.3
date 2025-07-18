Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A89C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=; b=FW6jw2rbG3shMSd9gKPuC63Hc5
	qQ4BoigdOaz9MUzWE2LWhIQolvP8kDh+zs02YBXqYSKklhe8n12b8EKX6cw0laLKqckdjmSpgkVaW
	VpAWlKdgZ3qcCP14VS5PSzxK2j95f96m+ZcGneSUCbaQp3Al3op/RnMf2sAdAyHcfVstUiIUOTSi8
	w7E2bH66zvYGYDchI0SxfAcqdi0t2TpA1eluoUiCkExmEaLIGmUDSripmQKa8BdqCFjUrNgbiz3bh
	pCkzP1m6TEM1hUvuLkDdZGRGMveH1yC/KVjSZ5ldiMmfYtYDFN7qCDwKcLpxRe3M4B1Vl8LBR04fB
	90L98mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnxK-0000000D5sF-2xP6;
	Fri, 18 Jul 2025 16:29:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmyJ-0000000Cw5Q-2T0s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:26:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a54690d369so1791818f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852362; x=1753457162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=O44gc33my4Uup6D24i/BkHHyaZAGPo1Zll/P64OCaxQNAMjoUIwKwkNie2Ml0B2rXy
         q4MXEsE16Crx9umVJ9xBVg9w7eqTd53EiEYXiKBF0LWKoKnwa6yjw7UgJ8RLMxzX5gw+
         FuNMNdU3VS+L2rbSUsOAWi2449Q9B24F3aF0fx6T2J2fdeysJy6VsUuQ6LKXNRVCMTtf
         1/xxfvZ0eRadOmIj6D/sb6/8c94zEhIZHVEr0cR5G0XkaARk5pO0Il2UPjqqEIPPJFwg
         Wby72XNf/mdqna3XFaCa16bzqMOQL817GzTwZGZ3EMVZdvn379CTbZLM3W4h1adjV9E3
         aYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852362; x=1753457162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=pKyb2soXQYBE0GuywUjBPnLhy8IzG442O4MbPWFxl1VldpIHiYWQJD5kWalAgkmi4G
         O7hWq+vXAfhXY0WgMeq9FDNLX+Lum4+zYpsJyouPReqMTmpdr7Uk0Mo5K7iscgYkcUkT
         CQSQeRA5zES3ZW9rw21Sc46jQkQHz53Z1ND9jXUhaaNnxrokW8Vq6OTUzP1ozX5oPQKw
         oh2eIPWdF+oqbn/A5ZqBdK2SAdciQjNcqOlZwbWBLzCDwGli5hK8meAwtN2XX7Nk2iap
         wPYDvz1+ZSy+q3NXWLokv5YymDDqzOokmwNtup2PJVgdN1FxyRVMWOQgE1wUzxnVAWxM
         MTug==
X-Forwarded-Encrypted: i=1; AJvYcCU+ClN1bnwGxgT1vFiffw80oH+WXmwo5A1yDTUEqYcMvokSq9Ppvw4E7pLeMx/V7Ozif3QSWiY+FFe2byfV4Pqu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx974qI6UQi4MotgR7ZM7FfN6499OirReb+y6KPynKsQ3uAtG0k
	BKjmOi2nKuKfhtm/mwwdJqPO80VZScb49+Sw4X78is7A+YCaHJXYb1OY
X-Gm-Gg: ASbGnctrbVw9A1bkDz6T2Mpz0P6EYtKUnPIErFR8hOHPzoNEDcWSZruifhY5Aqnu5XZ
	+diIckyJb/QruA3XOq/cMNtAkc0/w5h9WaQbGbCgkmBYdIHIKQTnCGY+u5AOAhT3eQ5Kt1TsAJd
	WdN/Z7GDHOQwgvXOHKQl67bBw97l9lCHLcC4YLeNNdQaCAgfXRKLMAfv77FKOhqVypovjB1megC
	LhSTkRaLEm0k4xykXELBOhj+V811NiAWSSsOYwaXr19TNbj9tumNoAmkegLgsnN9Z23b114+VOK
	ihNd13qMuH8x6aL4hIgpYkCIHmg6UxFaIKnFMLFtpyWvG3/kCw8tQTURzIIwcibFN+xdqPMju7s
	KWoQH4nc+142svsY3LCKT0eP/Eusrs7xx3ZY4+cmp9TfYqw==
X-Google-Smtp-Source: AGHT+IG0koCSub14mOqUfW6e8Tvqyn6CFRoCyGdB+mJuGBdWbBt+uqo8D0kUkKp6accmL+/IMAlZzg==
X-Received: by 2002:a5d:64e3:0:b0:3b4:9721:2b2d with SMTP id ffacd0b85a97d-3b60e4b8289mr10630245f8f.9.1752852361783;
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Fri, 18 Jul 2025 18:24:57 +0300
Message-ID: <20250718152500.2656391-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082603_634177_62B80639 
X-CRM114-Status: GOOD (  11.47  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1


