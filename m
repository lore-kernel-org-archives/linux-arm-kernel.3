Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18AACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=; b=AVRw95mdX3MEwm
	c/IjZtQepzBqhXa/09KZIoHHnP24eviWdZsQNtO8c+48wE6fma6x8hFh8sE1sKkU/DOLeThCNVA9L
	D0ZsX5GmcXJmnYOwgwL/Jd4kVmB9Gdt7F+MVUGpQRinKmf5ifTcNaH++gaUb1/QDLmsFHEoAH4YVp
	I8AyDq3H/kJr9L+yBimUfVBLtKnPbA9ZrqVACKNaUKvrsTbTjmNysXCWd0T43EcFEJhhStYt6sBl3
	4N1XXH01Dzs6zxTpmXgcd7ILQDNxVJ43xNLDin9Ja8U4nVTSByJADWtlVepCj0Um6deTvUP4yU/98
	PsAKIvFBZ4jcPQC3lYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxvu-00000006yW7-0ei1;
	Thu, 21 May 2026 07:35:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxvq-00000006yVE-44Tk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:35:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-367c26471f5so3664310a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348901; x=1779953701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=YARh+ZuZfypRV4LZSsTFU174GCbiIOdfw5zD/ye1AbH4gsD1FKiV+nCggXpSPMuT4F
         Cpu8h+i93vykKzVrqz8m4aFsvlunsGszngzncmODEO1FhHCgjilAz7eDb+aaerI7N+iT
         0tc6z4qxaHggEucMr4iusBZGev3bq0RI1X9v9BlQmM14gLMPhjFnqjzce2kSpAIWUgIO
         PGo3CdWVuRXalQYdZ51hlUApfOpejhMxEuCGtKuYZus55u4aVn10mDCOJi8qdVUILVdq
         zV21JCrRaGYEtHMYT5zv5hCfV/XfLvaYmwusU/w+Xa8TbSY7GDwCIotzb2ez/u2HRgdm
         d4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348901; x=1779953701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=E5zqqb/kgmP/ai+2uCISp1kH1FHm+bLxdJMrknktVV3EhHoMZUA5hVKskaE2MfLJ91
         Y9Yz19ObPum2N3m2zi6RqWpxLIDVkzk8x1+XSPpbnlgVkvJRGcyswBmxGOoxzUmw/yOT
         SyinUeP6slPp5OfQKHIAh4SQulwDABxoaCOwbW3p9b6v+8lYnwWyjdpZ8LAls05JLL9T
         ekMILNOE/IHoGQLCsznBQHYtai/yRNERoknWqUilnxSIRBSUoMok09EeTDfZz9ecoSdM
         lcExG3/GQMHrBByl/cfXafDwx7FpPSexlCu4UUCNCeSD0xplnLo9jwmimeXccSk726Dj
         1lag==
X-Forwarded-Encrypted: i=1; AFNElJ/dVa9kySIJSpl7R/xt4kj+wAJ44dp2tYyf/UaDxYO7TRnsrxDmWH76NJ+7WFnZ5co0c/v7Muv1SApLiHWHK4HG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5CSODPC0JVh8HBYRbBvRfv1kBZHgywtAvudT2sykE29Rnc1/h
	AX/lXzJnWwbRB65MxJ0GZ1oP+KxE6MrkRb61381vUDRgZUOVFXGnmMzj
X-Gm-Gg: Acq92OE3Ey80XNldHKQ3S5eprcVFzOogTiUQEAd5frGjyiRAylxsE8AQDVMyfgp0frh
	KQwRgs6PJnhtFpHoxxgsBIKS5Zjx1MDN7nPZg9iLh7UsoWb9BghmwhJZYwMN+W15oQ71BSf2ALx
	pkX1bHFyGsFFa7L7oQ8Uuuzt9dgT0s9GSn6+vxeTD0na5zp8E4iUj9sHlsJIPy2bYVHvl+utbpd
	2xfBBguYuCowfGYiy93Ya0AN8ZhsHIi27fZALVOgm5r2/Zl/zTEiJII7Po3YmbBDdyChI/FRwLC
	469eeLwPP8cOiy/eXz0JhUymV+TmVINjkVWKViILTaClLxcVZw8pmfxcmmjDEfE/CgnkkfUeooP
	pnFDttta75grRQoIMlgP3KdR0xuTtFQ9X/hk6HvrbuHIi18AIYNvz+WpPJh5ApdK6B9D+OZSq4/
	4cPKfTFndPUwxXclIWXE5o
X-Received: by 2002:a17:90b:57ce:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a44f18393mr1788402a91.3.1779348901391;
        Thu, 21 May 2026 00:35:01 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 0/3] media: meson: Fix memory leak in error path in
Date: Thu, 21 May 2026 13:04:10 +0530
Message-ID: <20260521073449.10057-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003503_015569_1DE8F665 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Sashiko <sashiko-bot@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Following chamges try to fix the memory leak reported by Sashiko 

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free 
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak 
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (3):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Add error handling for recycle thread creation
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)


base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
-- 
2.50.1


