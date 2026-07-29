Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF46C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=; b=L0nsiYEbdECSq3M2DN+Z+XhfBt
	P2wOzZhy507ng6rV4aqbQKRrjPbVeh1JgDALS32bp3JcKSdEdWNeOR1X7jPukDi/oZRKs3k4KZ9md
	49UyossQHuCj0ZPjeQLuqJy1wNrfAI5+DbqrB8rpuIBa+FQ0geJpMlMcOxbPiu1y5f4+AWWxsYbma
	dAM/0qlaXNi3ieVLsbBiW2KFKn2E3z18K1rgZpvg9hdJU0rmvT1CGvD+wngnsSAvsyUhJZXgUPgZD
	E22XVLg0jDIxMynawXZESh5vWc/Q3QsTFHivu3VOsomih8ryWqlW5ssxj0YNMAkyJKiXCW88cOYAX
	7au518uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxRa-00000006z0Q-3SBb;
	Wed, 29 Jul 2026 06:07:06 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxRQ-00000006yxe-007X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:06:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-848d21bbaffso618557b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305215; x=1785910015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=XZIZbryiSukENAFvmrX5fQIA3v6fJQeBo/phVO4wCPxdJyNYD7v9MNGp7AdUqHoi8B
         sLsrlZWQ/daLkipzuBCMuy7r4ArM6Bxp23RUpmZx13A+l/jz+Sln4Qk9i/4MBLqhcCfx
         11hM6vDG5Nkz3nadAvRMEoDYWBpKe+C2ly9TX8NZGrUKx5XiR+dO5ienhK0NSV9K/hfy
         oycyxT9y0mxo79Fvgk09sTCPbGLEplJ3iivH3UsY56jBmbMFmf21Ug85Kg3ULcjfk4lU
         qF+vv5CBV3iYVy3HuplTVnBP4H1ZQayVVjhxQUI5fIG05pguJ9u0xzgPbDeEp7CQmGep
         xXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305215; x=1785910015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=YPvGznvvMCDw0KV3izC5yLWnLLYEGfHQUuKZA8PuSZXXoQDqTk6UPfgh7lBWpLa2tR
         tUTN17mgfTG1qoAMxcZorRvfZUg9cs5APBhn13t71FIc/i89wghuQUnkisyoUF5/yQe7
         9en0Tq+IRGVmrtlPOtHlvFjfYFKzv/ZI+F8bm1DRnz2wYv5G9lngyF5pjaf0H0R0m/WH
         vLz6RuRD9rjAK2wjuOHWaHm+OdduIH44/s1xYV1+3wrsfWdmzkSxXUP8E464XepRcVnk
         p/tKbSBO4QwfNUUSi+35GfKAaCqhIWfTLWn5EjGgzgDywl/reQ+PSrkPfVvLXbZOIUA9
         iCng==
X-Forwarded-Encrypted: i=1; AHgh+Romj/bHGcwjVeYCdM6Po8dQiXvh/y7Ydoi+FwXybsHqUaDbpSVVUBnEu091GrpdLobXcU4D61KHH2rYYksFqXRi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2xa1H/Bnj5HCMOl3DxmyDZRWBKitv1nsGHM4vi0iSY+lK2/V
	zz3iD4c97/Iiapxqq0aLXkQf0qCKYMLSj1bJ8ZNtPzPBKam08fcDXNDs
X-Gm-Gg: AR+sD10nR8bUvpd69jfAUV9I2RLrP9rxh7yxg65OhQQkphPR0nmLuoGwRer4ZuaDH+S
	TIW/bE04797VAyq6DCry9idpJ/fbVvSeL+PvVC0I4RGuR7YodTFcfDSq23CxPtufslaZov7M5by
	mCLKSHP9NZoWgi4pC9TVEEG2rDJdHVhKSC8067LHuR9SAGd8h5/fpSTfNHJCMUOBDmoEPhYBiHU
	ZluuFgeXvAkl5jIFuOHJlCd+xRr6aG6ePS2lJNvoek6zsZlCWZKqyD4fMu+AeRiVOQhn22A/zbb
	BBagxOVdYMkcsTDAWysv8YWvGYiSGiCrrr+hs2o/+VBnJB3IJfl4Yin7a3lPcaaNu9ozJBtMQ2w
	DH2TUC/jAPHn37ksE9WN9gUen8LC7Ndmk7jBiHBPukF/vcoHvpSFn5v3Ye+W6JptKS/2qq/6jeF
	w+gOhnUj5eXNQ0F/F4oyIntAI3ziT8byL7RrUHa2hKRdE0zJ/xKpjCayocRUWkiNmKHKts/Ccvx
	HA7qvPh9DtPRwrKe2MeZehEXnI1rUgH4kvJxa8rB08Yrt7ivcI=
X-Received: by 2002:a05:6a00:4614:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84e93264595mr5862999b3a.35.1785305215191;
        Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:06:54 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 0/2] media: hantro: fix runtime PM resource handling
Date: Wed, 29 Jul 2026 06:04:38 +0000
Message-ID: <20260729060440.2092-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_230656_044644_7ECAABCE 
X-CRM114-Status: GOOD (  10.17  )
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

The Hantro device_run() path acquires a runtime PM reference before
invoking the codec-specific run callback. Failure paths can leave the
runtime PM reference and enabled clocks held.

Patch 1 moves clock enable and disable operations into the runtime PM
callbacks and releases the runtime PM reference when device_run()
fails. It retains the existing CONFIG_PM conditional so that the patch
remains independently buildable.

Patch 2 removes the explicit CONFIG_PM conditional, defines the PM
operations with DEFINE_RUNTIME_DEV_PM_OPS(), and uses pm_ptr() when
assigning the PM operations to the platform driver.

Changes in v5:
- Split the runtime PM changes into two patches.
- Move clock management into the runtime PM callbacks.
- Release the runtime PM reference on device_run() failure.
- Retain the CONFIG_PM conditional in patch 1.
- Remove the CONFIG_PM conditional in patch 2 using
  DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr().

v4:
https://lore.kernel.org/linux-media/20260728045921.4761-1-tharitt97@gmail.com

Tharit Tangkijwanichakul (2):
  media: hantro: release runtime resources when device_run fails
  media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS

 .../media/platform/verisilicon/hantro_drv.c   | 75 ++++++++++---------
 1 file changed, 41 insertions(+), 34 deletions(-)
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3


