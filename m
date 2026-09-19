Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB6C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 03:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SomL1EgF1gQuj2EcXeMbEnVo0bM+gu1vUjDO33Ekojg=; b=X/ZJAAJMnBLNMmN6cZlR9E5S3C
	1WIsg2iglVLC9hP9GHhpaqg9kpvKuC5ja3bDRF1kSIMTl6u/CbouWF1agft3R1foRG8XdyxkDpMHw
	Jr5qlC7o+/I507bLFtqod4vcDBrPuVQXY1IQ7ewoHXVRCApHgWKmlieJxEDEXUy5Veq4PmBBJpYNq
	QdwMXtQDaGgH3joMjRhB0uV2/xiQXPfLZPHshF/oOaSK8pojzQxdxhlzehkPr/FwPHrVB5mcbYSW/
	0j8yXqW/KQ0JFuc+gDvKMRKljkNoo+7jIE883Z3b46luyyuzwhnon02OskC/uDYLYOsDwyt0JoQD+
	IkmgEOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4S-0000000FvVw-0zS6;
	Sat, 19 Sep 2026 03:49:00 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4P-0000000FvVF-16Zb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 03:48:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so12562775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 20:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789736; x=1790394536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SomL1EgF1gQuj2EcXeMbEnVo0bM+gu1vUjDO33Ekojg=;
        b=ZWH0pkNhf2IPgm7yLE/c241KEzTWyvS9UsEfe8LsTdWZDoMuJ+07v7h/k17uhpgndz
         kX9sRfaAxuVOVowdvD4TqepAI6bhGE88OP06P7CUAt9JkFHcZYzSL53SUOEGL+jJ3dXu
         iE4nFePJq+94rJOtEGHcgei/iKJEOMmuokTMrm4rH31FJKuxaAnzBHaV6AdaUOFc9Mmb
         Hu0Qy+RKlIhqAlx65wtoOws5B0DOvgzqqCWALT8rgsPLyoDvwlj9fcE/rSaXABrrzGyk
         wwaUvqUZRHuR0BDeOKcTscQID9kVhpjF7e8dRQmHkJ9B0EiTQVXxj4Cvo9RP/5DqIFAG
         4KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789736; x=1790394536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SomL1EgF1gQuj2EcXeMbEnVo0bM+gu1vUjDO33Ekojg=;
        b=E2MQqbkPHWKLUnjkSlxysy7/BOuM7I3AqMzpnv0N7RG3/9tFUrmzVVhHFuWFMfooBr
         BciZ+yBosQZFpgDejbyDeberaXS0diTuorpmGF9N4xKGEWGwdOxuVaL3g0QFLVw8Ri+L
         /j3f/lPwY0J/SCUMbWdo1U3VMZTervZ2S6yxumcaz8sjxJaRrRajqYaKDpdqbqtnR32a
         yrO7gLCuzSJW5mYdXR6IT7cAw5eVZeIi7uq8KJqxacVlH04ytrBqHHW7KAMDpzX6K2bc
         vp8EeWxpJ66a+jW61aOv92x4ZBJJcGCKMbels/EW4bh2F+Mvr9ysymM62A8dE2dk1oxu
         6T+w==
X-Forwarded-Encrypted: i=1; AKwUvBwFyknjDfS7QdjnSqFqHN8JGzHKCLwYRPeWIUsQwfg7Oip2Ub1Zbq54c8Eyl/VQ0EpuTvTKaB3xShTm1l0VYERt@lists.infradead.org
X-Gm-Message-State: AFuF++maXZ+EZTzJyKjQrLLHkHi4lT1nwP71iZbvBOqrmPE5xwNCiG65
	O5Kxl0AvKu6BsgLBnXoWh5QFiitdbWc1FGEIz+1Ogr9BEIZ13vtaT/M=
X-Gm-Gg: AYBFou2wcQ8PNXceP2pz5/XuXxT34FGjH4EhLZQaQg6UauUiLqNr9hMZh8gY1pOVryg
	u0XKzdeTW07dA87K5Rlk2KZ/Ftx6I5PqTOtDTirwAhZpM1pgsCO4UG2Te4wFqFkxgSE7yFthWms
	WqrmoKwVtG2EfB8K2P+B4PVoRfAbhxrxAvWPrt4Hzume9Sl6X66g/KFI28nlYlcqt13InkydWRV
	kB817JPRFsdgEHiZWeoQblBVCoMQy3QZyLRH9MPqJjyhCj4+hpt8HfbMoaZqYhPmdmiHgMA+5vg
	fMNPqqVTJwVOS71HcqNB54FmZb1ROtryKfI2Nrbi1k64R480FleEdrD8txA1n7T13nq2udLUx6/
	oDU6kPcNtEVLHVUNzdaOOy0eBiNCrHpZJ5Z66jcapMFAQ+0XoMatQVsWjASO0yrCFFiwRX6pXJs
	J3fd8CVsWpzwxpOeDq5Vy8tI/EGO7FfrG345lQOboC83f4wjhuSznciDSQBoKFI4vmM1vaLKub9
	iXhshqRcswJ55qo5N2s+XcgWdcMYa9E7xxc32T1DCt/Nlx6zpUoevDkme8cmUXZ0i/Cna8SMev4
	j1w=
X-Received: by 2002:a17:90b:4f4c:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-39e6a7f221fmr2814204a91.41.1789789736430;
        Fri, 18 Sep 2026 20:48:56 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:48:56 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 0/2] firmware: raspberrypi: Handle device registration errors
Date: Sat, 19 Sep 2026 03:48:38 +0000
Message-ID: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_204857_302722_DC905466 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

Hi,

This series improves error handling when registering the Raspberry Pi
firmware hwmon and clock platform devices.

The first patch checks errors returned by platform_device_register_data()
and unwinds previously allocated resources when registration fails. It
preserves the existing behavior of skipping hwmon registration when the
RPI_FIRMWARE_GET_THROTTLED request fails.

The second patch fixes formatting issues reported by checkpatch.

Triet Hoang (2):
  firmware: raspberrypi: Handle device registration errors
  firmware: raspberrypi: Clean up local formatting

 drivers/firmware/raspberrypi.c | 60 ++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 14 deletions(-)

-- 
2.53.0


