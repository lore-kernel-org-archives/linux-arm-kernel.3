Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D143BCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQDJv9UMQlWEKvIidyyhqiruXHUjg+2ZPsabXlVxUVo=; b=xtCBbFkfDiams5X8TM2Rqg6rPS
	mtwXvef7OujiAmTf1SjgRIfNEajU7z9KvIEXvff4JjbIOQGukEyS6SAG5e3NtMpf7gRA5NaEidUbY
	M0xtgRMIjuHgFVBArhnwtIVq68RM4rzO4MVqxdvAwphSFgebSlMZZwdkjXtxmQXNcEfl15fiFTm20
	6qkvIjUxk9qvNdUCEuMXHHo73wC3OGczT6ilgOQvwZmBO73a8taJlP2RjMDxiZlQGRzPpQ1XPL1Lu
	P1rL5MSwddw19lV011CIf7aZIqKqNI+Zr0+XOBWutrZigeLRacVEiUg6mB8yz4NUSXkbU8/pq0pDq
	wUKZHYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchv0-0000000948F-2SHo;
	Thu, 25 Jun 2026 11:06:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchux-0000000947J-4ADR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:06:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845b733e82cso269510b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782385606; x=1782990406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQDJv9UMQlWEKvIidyyhqiruXHUjg+2ZPsabXlVxUVo=;
        b=U61x/EGwr4EhOop0MIJAgTAzMM168fq0t2nc6cfImaY8y/8KWceAHsvVk1vL764Fup
         PL/XQvBeAkiPJN/Rej2vWkRvckb84TFS8slXdRibNlWAGfv0r9OFF00ToE2M8X9nQBcV
         FvDYn/DPcyK20VvF3JDdQbQ7H5uONnGk4nwF71M65G6UOVx/PBW+n20nAzTK2+bfig2g
         czJI/qFnql+P0qzQ/KsvP0N3U/JjDKWc7f+v5E6+GBVO1Ymw8V03j7srHgwtg1/FfqN0
         FF48/ooQUv8i+EfFHreV/hJgeSkB5EpJYlJDdyttjba61jvRM6nDVDJcjcTyvFong2Xc
         AFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385606; x=1782990406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQDJv9UMQlWEKvIidyyhqiruXHUjg+2ZPsabXlVxUVo=;
        b=CIxTq9CVJAlEmPF538VgAt8lDQ5Tf9POlxBhelXhpEnUgttrWVqzL25THBIAyJY2VK
         C+sxW6ZItFETYYmtHzoK1KsauTprFvRDoSXirEI/hzLbqbS3X09sU7tnKZiG81CMJSfM
         1W/K2DXHbM170U7rwfZuEd+fCnpF8cOq4NhRafQpxn7Eyc0twJ83aXpzGhFd7lyS5uTj
         sDB98Etyuj2uCWLQrDVdGJge/Hb7lE05Ullk+aXtxb30HLeU3+HPdsh60lDfgEIP34zP
         jLC9B3a/4r0TRdMY1aPvgmxtmbCvMhAqzuZm5kSIhgiU/uppzFQsXInXUqIv5paZpdCN
         BYKw==
X-Forwarded-Encrypted: i=1; AFNElJ9OPLPeH3lMwQTVlY7w9wVlAWeBbHH4LVhSDc2Usgh5N5wxX3+ENUvIA29G4dYYWmJOrJj+8xIBKqIyyYJSHxAu@lists.infradead.org
X-Gm-Message-State: AOJu0YyYfiPtsyBDETnxb3+vJQ6yuD7KI4MQJGFPJApcORN4MwbgKDCT
	Hd/JFfgKikBhfQxJ4gb/HZQ4vCEou0wIHWHCvkqlLB+MyMog7T4MKZgs
X-Gm-Gg: AfdE7clxHMc3cuISBvKZRv61bPX2GPFYU9Ob04f3/Co0099itzC/tPldUwNztNVaBmk
	6Elq+wrhdtIHzMYe9kDGUdaUHawEPtZvn+dAgWVhtU+q14YlNm821zfKWUKGwRkc4PoyzdLUjYC
	SdlFNEhFGrUaQGkb7VFW90RI/ygJBnAt7RnKeIhkX4KtaAH5WVNleSOan1YQVSigSpBSrGaN2lG
	BzXPmttSYsg3irIge1MaFbzNcraTHtSoL7TCJErmzaLdGCFGvaqQNB2I4gcs4YDrjeoKYuy2IR2
	ce8ZZNYSaL9RGzUTqnk+R5suwO2970XuOgOBF6xkXWACriSN4z1M+RsYRSd0mHQl7bK5KwaYm8u
	hDmWEZmuyCahTmnFodogOPQjqDcc8tIQR6zOViHmVh4oS5zrbnswLKgN6NLpuzpxVa80jjtEr+Y
	od5206Hmi6lzrvh6MKG+LMuLi1uNRcUkDwY1is4SMTu5PkfuauDVaoAk3IOQCgHj2ZVsy3U0MzN
	T8=
X-Received: by 2002:a05:6a00:2917:b0:845:4126:222b with SMTP id d2e1a72fcca58-845b3ab542cmr2566928b3a.28.1782385606359;
        Thu, 25 Jun 2026 04:06:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fec0f7sm4412759b3a.22.2026.06.25.04.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:06:45 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 0/2] iio: adc: Add Nuvoton MA35D1 EADC support
Date: Thu, 25 Jun 2026 19:06:36 +0800
Message-Id: <20260625110638.38438-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_040648_033301_E673486D 
X-CRM114-Status: GOOD (  12.17  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds devicetree binding and IIO driver support for the
Nuvoton MA35D1 Enhanced ADC controller.

The MA35D1 EADC controller supports multiple ADC input channels. This
initial upstream driver supports direct raw reads and triggered buffered
capture using the controller end-of-conversion interrupt as the IIO
device trigger.

ADC channels are described using standard firmware child nodes. Both
single-ended and differential channels are supported. Since the
differential enable bit is global in the controller, mixed single-ended
and differential buffered scans are rejected.

DMA support is intentionally not included in this initial version. The
driver uses the interrupt-driven conversion path to keep the first
upstream submission small and easier to review.

Patch 1 adds the devicetree binding.
Patch 2 adds the MA35D1 EADC IIO driver.

Chi-Wen Weng (2):
  dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
  iio: adc: Add Nuvoton MA35D1 EADC driver

 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 100 +++
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ma35d1_eadc.c                 | 636 ++++++++++++++++++
 4 files changed, 747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
 create mode 100644 drivers/iio/adc/ma35d1_eadc.c

-- 
2.25.1


