Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99CACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=; b=h8zTLYf8GE6mOrMkDL3TN9d79X
	z9YF9GvtKvAggIQqUMsJ+adqtU4IdXHU+k7b6XGJTRo5JFZ6RkcyJs+vbkvN+UI1f2glvAN67RZSP
	PrFXV7xKovsos6drZxP6MbSO0SeBH37VFkexPozetHjSr9i5UE7pzAcLxG0A0WS3ojHBSc4oOAwpJ
	AL/hlQIrn0W5N1Ee2mHXu40EJkgp8ljczaOqTZqwsOLSMuV2wQBZQzaUXnoKHwPDpMn5flb8JQbBm
	yhZhei9Y3DGLwXvDNbLVPRHVBTHV0XxcQPtDOU1EtY8vwwN+xAzLQABFzWPdoNP9Bau0PGGVYg/FD
	MmD4Dzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEG-00000008aPM-0KXI;
	Sat, 30 May 2026 09:43:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEE-00000008aOa-0hlu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:43:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf008a99d4so29385735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134216; x=1780739016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=ID5bEGdUkmgsrcsBw8XdkdS7fvucVNl64SVMq0bDm0Yg9xd+KOPPLc7yfbKXIpbdhk
         Rs4je6pgbwoFLLdRLWneWKBKxQFIGio4z9ZtNMijT9b4bWpfzRebT7w56zjIVqJ1Z+j1
         65nhwHRvknKgKUy5Z3anHHTOczPMu1o1F1ogJA82U77TH+tMZWdELaEdFqr7DG/jct73
         zg7g2zNt/m9QhDP60cUNEHN2i0zwe2nv5I/VK3ZoWaGp+6kwXyLPbeFJFqSo8J+b1xdR
         YLrf1iB31aMzy6xQ+bXoSj/ZnWh1UeNlTmxO1O/tRhHl23w1s6wkhX/wLvkzvwQTNX01
         aDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134216; x=1780739016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=exe6KMkbZ3eiHlrYa8P9d6HcwFC6H6xqZfRL2GL4Zef8mVKOpWREV/j9wvrpxXQ5LN
         1vhTPspUWibvqrXoKTNaG0D4Zkc0XrFPr71QXaexsMBCq0UMFxtEBAGUVxSV88ESI5d1
         6OZuvHpRHKsXNvuO5lwjQ8h8b944Cw1WgbOJ/Ob8cFwbtPdF/Dmk0R+1U1CxIeTAM9pT
         Hp1xsIOPDwNrBgJ8WlnucIjqRjNObvHUtdab3I9lOcORMotzIN5ltmquNIO3WiTzTPig
         A8eb6ZVhkkV3tTRTeaFIRg+ozqD2BmTzUEg2qLeTeLi3LgXqJJTCkcO1Vkd8eSI6g357
         PVkA==
X-Forwarded-Encrypted: i=1; AFNElJ/jWGxEHTr0M/xa5nWqE3EOD7McwzkkxboxpUz2ZchQvoUh8N+V5vjKJ/iKz0IkpBwIk6RrMmavCirC+++OEzyN@lists.infradead.org
X-Gm-Message-State: AOJu0YwnQomqBeeKWiXqbSBPQ9YvJrR6nXbBr/wJ19xVeo/ja/rxWNFQ
	hBLKROc9Okh6sU5Wuch7MUbo/D3OdfwZdMyFRSPBOpFYPcnbgUbG9mDsQQ/w3g==
X-Gm-Gg: Acq92OEfeLdXLjH9C8D1sd2zkDQJT8x1Jz7b/FrTYxIRqUg+9qDdnsnM55EC+c0H39b
	AAlmwyjK18yLerhIfXEAL4vV0DY3EIkhjNqB22NoReXF9yY99zKalNMQEZyfT6RpowZHL6cL8j5
	Tsme1NAO7X/wYGwcJB4IZuLm7DlrRyfiDUdRd/KTcWEZlcLfE1oJtqPJR5sKCHIiEC7sYrx+5Yc
	ak+MHLVWNL1rPgRbUbETxhjiFt2TCFfUBLntyR7SGR3AerYnRO6uNZ8/7CyoqdGkiZHrgd+Ukh8
	UKN1B/QDmyRvero+r8cTHRR3l+Anjs94eiTWy4akkC5j/qOFua/MAdlkSxOOt+FGRvVHUzqZ3j+
	/R2ND7PpAjPgeNXLJPJtyzmVIgcc+Rq3xdLwFgzsnkeI3roUnmUhDnejL/XWwpT7A5fwFEt+Cb+
	uquWVcAtVe6MBWg5sQv+dpARMq9edBnjM=
X-Received: by 2002:a17:903:46c4:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c0ab926140mr12404095ad.25.1780134216487;
        Sat, 30 May 2026 02:43:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:43:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 0/8] media: meson: Fix memory leak in error path in vdec
Date: Sat, 30 May 2026 15:12:46 +0530
Message-ID: <20260530094326.11892-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024338_232317_3148A9B5 
X-CRM114-Status: GOOD (  16.86  )
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

v6: Changes

The previous approach had some technical issues, so this new version
takes a slightly different approach, I have fixed the DMA warnings
found during basic testing.

I have donse basic testing on the Odroid N2+ and found that
the clocks are not enabling for decoder.

It also seems some Mali GPU configurations are still missing.

You can reproduce the test case using:

mpv --hwdec=v4l2m2m Big_Buck_Bunny_1080_10s_30MB.mp4

Please let me know your feedback so we can discuss and address these
points!

Thanks
-Anand 

V5: Changes

[v5] https://lore.kernel.org/all/20260525095216.12078-2-linux.amoon@gmail.com/
 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check,
  leading to simultaneous hardware programming.
--

V4: Changes:

v4: https://lore.kernel.org/all/20260521073449.10057-2-linux.amoon@gmail.com/

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

Thanks
-Anand

Anand Moon (8):
  media: meson: vdec: Fix memory leaks and lifetime of m2m device
  media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race
    conditions
  media: meson: vdec: Handle kthread failure and free codec state
  media: meson: vdec: Condition buffer flushing on queue type in
    start_streaming
  media: meson: vdec: Cancel esparser work during teardown
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: vdec: Fix NULL pointer dereference in ISR handlers
  gpu: drm: meson: Fix DMA max segment size for DMABUF imports

 drivers/gpu/drm/meson/meson_drv.c       |   2 +
 drivers/staging/media/meson/vdec/vdec.c | 179 +++++++++++++++++-------
 drivers/staging/media/meson/vdec/vdec.h |   4 +-
 3 files changed, 136 insertions(+), 49 deletions(-)


base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
-- 
2.50.1


