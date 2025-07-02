Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83510C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=; b=YWbijCgqmKIJBQY71xCok9mAn4
	0V/A+b7rOxA8cLh2sK+ksc9QVWZ/lmVqdWhcfkE7Yo8ejcG+CwRro2X2Ix18WtHSbMq0niQotdmF9
	SyKQ0KkegTn/H46FbJSR57Xn23Y+rHCAOkn39IJT4mfUQFtLFfA6LIGBoe65/6YXZmqd/BR99Y/Av
	WBJlQDW6Jc2Ckz6WHmXkxMuE7txiI6jWt2n+jh1lL+TZAU9UxN7xYzM0kHx76WLaFIHXTQDE8EL0u
	93NZXGt6VbHSoLPXnaXOb6G/gG+VChQNReznF1NU5yZWZ81hYL2pRJ3x5O50s6ZDD9JEoRKKqP8Lj
	ArdH911g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyMN-00000008cQh-3Pe3;
	Wed, 02 Jul 2025 14:22:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPV-00000008R2V-3QB4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=; b=I586/BzYksp/TP1O6BIwJpe+M6
	MxkV7izhlNJFbudDdpgIuD3xi/MNtsajudUNldT+HC4K5NaVshXBOTJHNjdFsitrrRR2lDGfGHt3G
	O8VKjZQqGJochqpUPkdvv7kr3JyDnVohuFYOIDf4hVCtbZtnhUbS2sgT+/2o4ddrDqjftkQyZw+S1
	0htPWYOk3w/lY1gGORaCVKfUDmWZi8tXxYSf9xhSMm9S6CXUuFOyZ1Kn0IyxqhPIL7gxLkG2DUsS/
	jPb4KDwTrYG1dSFjdOF7VXurlBBlf30XLTrNPwDb/Fwrn96n67wJNHnMB4DY24H9GNNP923z9u55T
	vMQYPBQw==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPT-00000007PKS-0Flh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:22:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0c4945c76so642756366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462517; x=1752067317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=mJBUflGJp0SSE8kpxCY0pY4yBy8HK5GwPFEqbwxL6KuUaOBibqj35NHwmbOG8uglBJ
         w9jlhqFQcN5xIcqqoZ6NAI0ImQoDuDAFDki9cYtmT72IIPlRJV79iCbHs+D5NiE47B1d
         Uq1GMrlT9y5HOf6xkTCGj+Thml0sgI+cOwYatxpl/qrSEBlij9hLauHKZU0KVPZI3653
         /yC1chPPxnosCfHPnwo3RNlxdrG1Mavncvyn7MNFreCJ3fv30/eIzlRuZSvYFRXtw5Zm
         E3FKmnPf/UAGwtagdRvLvWT0JpCTj76rOyWRvOKYpy3h9zhIz9zZb5usLY+TG47jGgMz
         Gi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462517; x=1752067317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMG9pPiDXBBKKvDaMKGXpbOZbg8FN9YULFdxboP6NUI=;
        b=NXOIgIqfUtODmzhX40K+0tbH88GLoshQJr5/pPgTlxWPHFWUGHxE3uZZw3lMPGPMBG
         IPYNRZxDSzgDJwoOEe22a4ahWryGShXMyWHH8LwOAJsxwjK0UgbtHWY98/+VgjMP8B3w
         bJuSuUfGSv9lzK6BNi0LG5QFLGgNzt/RBoIl9U/IPDvrKAGwNLtAitITEKZmMK/79q3L
         JBDZbswiNDYopfU2/NQHT+QqyDCOrm9KvVWD/BI/mLdquRFbO6S4WIlGx9t9z95v2YRY
         DTq/YJ0neaiWWQaKlezAZrZgY8MwOnP7EG9VnO3oDlvMy1/yFRH4U2BdPd7Jm1VOz5EK
         hepQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBhoiIQ1ZDy0OCs+JyG0bOQAVz+8rvLTl8bryrRSChnoETMdeR6VMh8+6mFEWRDbP6DrgBSnp1/hShjrt33RK6@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPx20dqKvhdBN4Bn9qdjJtg9ikZRqwl2Qq8a9snIEOomWTjLX
	zQ5yBKU1jnhWdU93neYI6aGs7K8hrZkvSmj0e6NG9yY4emDh8O8Z27M4
X-Gm-Gg: ASbGncsiz0qbcaxs522CWxwpu925mPlrsBwW73v1e4UphxGgX5rvmw6Qpmp4oSrN7qv
	MRyNl+UBdm0aZYMsJ1KFGFtXC531B5FYdggtHLx84BIo0EIe+pTT5EfDrGzs8QtNVdVjzA63UGa
	Bnmm0AYO8yxurNPx1Kyv13ZShEs7Rcg9GRkInloxGD4wfOr6lJ4tCiLFX73pjwYuWgJa4vaT/8K
	CgbbC6YnTo5Q/SnqeM1/ePGuMs7H3dSr1A86TWbzlXjM1+GMUDoITXX41LXjge1deEMTalLLAMm
	ydnMb0qizDgGqqsjOsdppQYZ1IE6ctxTlK1g55eOb9aPxZHQQBI3lM5uXS1/pXDzDHZeczsM1IE
	=
X-Google-Smtp-Source: AGHT+IFvLZMhZjDSfshoFpRc939n2lwSc6MfwBSslCP+I3o/TmLmEUPehK/4SzQi266zJ8iQw+lKjg==
X-Received: by 2002:a17:906:c358:b0:ade:470b:d5ac with SMTP id a640c23a62f3a-ae3c2c7d588mr239742866b.56.1751462517204;
        Wed, 02 Jul 2025 06:21:57 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:56 -0700 (PDT)
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
Subject: [PATCH v5 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed,  2 Jul 2025 16:20:47 +0300
Message-ID: <20250702132104.1537926-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142159_189995_B92DA449 
X-CRM114-Status: GOOD (  12.00  )
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
index 897fc686e6a9..6f4254f562da 100644
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
2.50.0


