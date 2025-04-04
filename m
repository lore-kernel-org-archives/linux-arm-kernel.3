Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAB1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=; b=etGCf3C1hh0qF45jaIzimZTR16
	LYkMTlnJhj3nBtf245OCEkOs1Cl/ajpw3MPy8W/d4QfLzkTKsz+v30b9/wVGJngxrtylqmJEnH0wS
	7cwZnAuTj1rOR1XvcCjZU3P2fUVGa74cCIEJZLpJMpvjzTYeK90rYD1Vqs5pRy1ig0B3ABHoyYifh
	lXjValFEFpH6pDMlT6+ZfUrbSF0dUncbq7e6aHHSCZL7oi03qXo0XrvKOLjMVGV9guh+fC/YCOxOB
	WE18LpyoKL88MGCMd704wg+LEX/b0lcW1b5Z5GdNkXv4Wx6mrJswAfaFJEaziv18756b7YVqWAj5E
	VRDHKLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i9P-0000000C00J-3cTg;
	Fri, 04 Apr 2025 14:36:07 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i5r-0000000BzFx-30Gz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3334665a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777146; x=1744381946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=WZeavRvGzPeK7+nabL1VLqREbCX1oi3VR/nL8wIAShdc1XHiJSliToY9F4AnUbzesz
         uzyrKPQ0CNwy6pXuRyuh71a3eBmWibal9NOj9XT1HUkPFV+ubHc+KJAiyHG3eZzHifuR
         a8f0QwLw86ZBAzthBatFHKAZ0QzRKCPspnNzhteH55jzqfvuYfGcf4dllvGCIGlw8l32
         5gf15lZ8LS9UE3oWWuvomKo4ZKCEV8J1a5xB2hQ6gmtKyctQnY6DxotsvZP0mGfzUvFq
         ZL7ZFcEbo8WeQsUUmQtc6QhQuuta92OYwy2RJLp6Xuilh7J4kJKnI3M/PrU+lRSHHGzB
         iZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777146; x=1744381946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=S8V1l7y7DhIwmvg2MSH5g6O46BRfB0BjU5ANOCc9pd1O0JLKzjM7kvUNXPZiodm3Bu
         SSZDy64E3dWQ85dxm9e1/RfJOt8yrRTcK+trXzXfvHSYI55A7/kqjXBah/743pqf+MA7
         1dtqIynf8XcrxnKVfxyI8Hx7HzwyFA13AZ3g2/CsHHN863M21P3bxbNMOLUKHy2sx2ry
         CVlQ7M7nqeT8nA8JjzNxYVYov9rVC1Ft4ohukeFecHPCtpPkdpediUTgiU8yDvWnRPlp
         fl3So3Yih/1R8oaosRJ03VOieW7VJ96Told2ZjxII6S0irNBYGERD5N3N0EruXKnFBtO
         id+A==
X-Forwarded-Encrypted: i=1; AJvYcCWNcfjzRcMjRWVbf+Iqw2PCGfazLShjsDgXckhv49C9YzX4QyzcbGecfT9qWsCNegL+09QB/h1/Dkyy+RmYhHe0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7scpZ2nbOTcpnQn2VMG+wO58yZP5LaIhObbM4bWiNDGrYUQUH
	0kBCVzYgExivyYkc4THOLQcqdlmya15cMPaAlwUSMtvaisYNltAfYYiwuyf2IQU=
X-Gm-Gg: ASbGnctYSK8LWVOmtgGYkN4O1Ao99jiQXZj8ZewfU+XV2JJ5mjmmulmG3WZSH0xNPa6
	byPKZpan2YaMbfeKqzy9EI+Uh1kwz+9YPd5OguBRwy3jS9vvKScaE++VZoyELVKYAUzRsFs3eEQ
	7i2Z2Se3WXqNgDLvL/NeL2rMr6pXUlQPep5g9pxcHwmxuDKrFGGOM9nAPRwv0KIy+gtV7gc0Syr
	6q5PpDtd8ZUsjKO4XiwixW7Fbgac3EyjiMO377qQJhULFOvdIWknQ9FyhrI/6kv0+vc0bXKFhW5
	SocDc70/GkTNpQ6xxNZ1YO65sbq4pttJFwg/dArNsjrlq9adaXKkkdJisVpoPe7Ao8aBnWhkHce
	8UFBCqsDxKA0KqU2RYpasPA==
X-Google-Smtp-Source: AGHT+IHJ/1I/ptH3pCVDAQfcdNx5KHUGy5Tb2VN4inalxBPszr0OVkQ817HOYwXzW+KxBXdP3/CVtg==
X-Received: by 2002:a05:6402:234e:b0:5e7:b081:aa7c with SMTP id 4fb4d7f45d1cf-5f0b5ebbc4emr2568089a12.12.1743777145883;
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 01/11] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  4 Apr 2025 16:31:24 +0200
Message-ID: <20250404143215.2281034-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073227_751784_AD0F3C34 
X-CRM114-Status: GOOD (  10.44  )
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

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0


