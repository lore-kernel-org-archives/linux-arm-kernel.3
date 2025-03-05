Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AF5C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=; b=oJqCGKgcNR+h/eM12LKRKdSJt7
	TQmK9lnToo0SWOqNdj5D9cR8NSGuLDZ5fjMEX9h3YI0fjxZC8t1ujFjkiP+6G+t5IDs1gIj8GpbO5
	+i0V0oFr3OkhNJ519udXQ9Muqj7sS+zbGFX3CK8fUV83xZ6w0qkdigorMYzkaLr3BDZ6dx03BOGkP
	MmNPqU6SB/gJtrzp9XWCCkj0JiFU1GfpckgAxslHcXzK/zNYKx2jOQm8kegTE/KWMqQdV7lmCRC9c
	RmbzwX+M6jhG3jfQgUXx2/EguWbwgUavJCBkwfbyJ4nG6NHN5fP3sOAi6/R5rzecAin5KjBnYPASo
	51Qdn4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppob-00000008MZ1-3HoF;
	Wed, 05 Mar 2025 14:33:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSW-000000087pp-0xvH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=; b=bHlyUaK/fcslgDBCMsBnVkhDWV
	s6nrIVDyomuLtA+j1ZoGgAerDn1YG+9+O+Zk9U352NcIx/nDNPcImlxhOxq0Ayfs5pV0xK5acrMul
	oooEVDj+m/foH4dIKjOh2KCKyOHZiBZfe5V0G3iHiO14U6DkhyHb2ATNwdpm7pFfdwZ3Aze+ONTu/
	4PNT2aIeTy1Zi2XCxr2HCKpIoJJVm0K6QBcA1fTF5nZUZQeHxnHkYgLUMYx3QbMd3ia2WGZ+M6iK7
	wmf8lBzrUAbX3gcEi8VJjQ4MstpzkmrJd11DaL6RX+CasQwqBgXs4JYAtlAAPpfSRmKrk0zC3Jp9j
	BnWvjipw==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSS-00000005Xbq-3EID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:06:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso6042662a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180002; x=1741784802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
        b=zCBHJuRXDoSzOI6CHdVsOQf4lVUORUd/p+AkzSon/d0Hu7Fk/sD+cFgdRoszXijkj4
         BVuFkZ56wUb+2pU0//4mti1A5iY+tUsEz+f14YMcL+8ayfgw31IU2o2IArSvV+hgINqM
         6zRXXNsnaHzxZzOVGAwPc2QVY1Tbb6/uvoRLozC0PUXL06kEqvUt98+u3chEF50oca4e
         em0Z89kLFAkVAX8ux7oemYn9N/BaqyF9vfFp6Rnda0r2+wSdg0b5eAS2pVl6YBw7JZxP
         lXiJCmwhVfehgVJumQ2i2/tj+74e11hzdbOvTKCd5n//32A1laYitcEGB6ge7SKDyJ+w
         LW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180002; x=1741784802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvA69GRM940nbh4WvjTd5eG8jH1Ow0PBoCzHHS2i3Ls=;
        b=xKtJdfMfkEo463jbIyPMd0AS5dlCII1TZJGtryly503cAs6LSssoeqD7OqB1LAu3oD
         FquY8sXDGoBoFDRBarNkUgTVxrkFy+yuNrd1BXqECkADMeDQO39reMTa1/P6wLUJHzWw
         wngb/XXkjzDGUg7hLbTy9rtKMJc7UuaYbflGsxSENxeOvILxf03mRGfeUTNAcHf1coH5
         4shVmH+jxxIK4hY5K7b+3g9Kqv0dkAJbnW6SKevNe05SN/uukuWl9/4yt/RGKwDQ0+3K
         lw50XQlzfPa26FJ91bTP7uhQcfuD1pVXjNTnbYxar3VwHv/3eOYQxy2GHtHUReI0Bo80
         KhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtADKVtD+hke+m1FZvID5pwCBpg+CH563JQb5Zb7WMh6ypbByQZBn923l7DpyLEHBToNnE2LTiu1FvshsZxmvh@lists.infradead.org
X-Gm-Message-State: AOJu0YwT34uFmRmFy25YEHaJPwZGxx2vHQKIKZeh1Kf2omKzqpw7lR2r
	ykQLGgg07ug5DNRRufXxpi8hPlJwktCZ7v4827cP2cKQNqHiQ2W+0R6KZpvt+yU=
X-Gm-Gg: ASbGncuWS3v54l+UenGE7ye+HAblYTcyws7pXPDHfxFoYgyf3DjBRN4l2i6qfPyuw7U
	5RBWNocIM7URm+WXdchWrBPozTjbPfbaR1yScpkU0n9PKqUYmBfl8YBk9wWhc+LZiOOzjXx2qHX
	m6KTaV23kFPwMn18JOURYT1B0f7Xa4lTDr+n8fSouZl+xKta40rIdEWmZae1MpXIbuPWUt+d+L/
	qx7xsGKPyQB7DvlhklYAfoLn0ngdzdXnFBC1WqQYgvu9Rjt28eLfuh1jVJ5o3EeZ+sVtl5rnkBL
	i3WnrB89/Mtfx46dxWtAxTlACZ1dybD0d6oUe3IW6jZp+3uARFgaLxawKY+jzdYWHpzzYSiHIk9
	nVa37Zlr6sp/xArB1yFq7yA==
X-Google-Smtp-Source: AGHT+IEjtiBAYCTH0+e95UXzOpV6Qk/1lP6TuM4iQbwFmlqCq9fGF9wURhaIIhsi+UMHMk8/oJkTeQ==
X-Received: by 2002:a50:c8cd:0:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5e5bcd64d5amr155764a12.9.1741180002364;
        Wed, 05 Mar 2025 05:06:42 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:41 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Wed,  5 Mar 2025 14:04:07 +0100
Message-ID: <20250305130634.1850178-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_130644_837439_3CE9F887 
X-CRM114-Status: GOOD (  10.79  )
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


