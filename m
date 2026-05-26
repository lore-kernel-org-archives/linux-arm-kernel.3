Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B44CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=; b=ZjHe5XcPk9hPFypy2mVIqLEqcI
	EqkV+M0PujXLljDoLUlakdIa3foK10o6vpgFiK05R2hHxcdTpGUEMU7mleDhlC/kloRmm86fne/DI
	NU02uiZX/2n98de0E0TeBHFAa47C1OuW3RLIZxVkNMls89N9hs/mI68PcQ8s1cHJqvE/UDYS9cPgn
	HH8T/jTixLIuXzyujyXfFj/aPKRFGmijNXQjTkJhgSg5zn/fljfHVptdf0qGTveQ42esrERB1F9bO
	i3c6C19YHb7BHHLkQ8K1uxXEgD/HgKWsQLFJ33gsRmudt188wt77pUBdBR6gGXsgGCjtU7amlb0el
	eXBnfU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRumX-00000002WxW-1WS8;
	Tue, 26 May 2026 16:37:29 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRumU-00000002Ww0-193r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:37:28 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-43acf1694daso6105494fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1779813445; x=1780418245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=HEL4T936s/nS5h0Z96ZhVfw+APwy1p0C5+kKXnev5S8aQkzRpqp/oasBn0WwiMOLGb
         rL/KYbvRtvHe+hmn1b5jgHs9Zn8nEmJ011we0Dd/dRYwCb3IxU/q2+vPIOw03wxS9XHO
         pvnIe3hGcX5sE5rtT0mV6MStCv9kpBS4bUDJGPCd5tKX7aISOIf3bSyFm9BqHu9q4LO1
         p+73BHAa50MIyRTU4e7xBlk3ldGLN5kaqvFmhHoEMMaTPxWb8ZFVIeG6MlBcjwkRIofy
         V8MS0OofcLSDfWoSme6tXEScxOJ9gTgMeDmf28Pwa5KqueXnQHzdLNqW5CN5NjCTHll7
         Ibiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813445; x=1780418245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbEyVDKYB6brZVOZVveRW94ChbWHXbhuaSGALUdMmOo=;
        b=RT2qFgs1A9sfiZoHmMkwfQWerSJx0grS14JrZTjua5sPaCuxPSJA3OJQnjvWXLepY8
         0YyzIm/YYW6gazsP5zWyFM7YbeMa5RtrzvlJqJNVuo8rEICqSK4q+W78Vsyj+BmSdmso
         xZD4me0lmEcu5sUR+A9cZCbQQPcECjFnn6NhJLDLal7Lbyfzps2k/1BRoglxgvPoWXyn
         3gCifstH0eE5Nc5f/uv8p5c8psd8GlWNbm4DkD2c6DT5KazKHeC6J17W0QevNZtmTMcC
         mJrEF4PzZHBCVlu/ZW7HnP0HOqR/4MCUomxqy7/b1zxZMcvy9f8irPBBpeBYNobrwcjg
         jaOg==
X-Forwarded-Encrypted: i=1; AFNElJ9hH4sISixvC1DrzDDLwmruZUkvOzPQix7zQuSqIaPSNkk4dm5Fhs+QBWSsDC0SQExnynSb/SUPV+g4T8Xmk0sM@lists.infradead.org
X-Gm-Message-State: AOJu0YzOBn44qlrmBMWHbdsByTqLZWa1qF5LKlH7O4MasU/mr6S13w5J
	ESlTLothmObmIC146UtHR5pCV4Fa0Hkl0RfTZRWIv8I8ckXysIVeJ7xuBTTfbmykqW0=
X-Gm-Gg: Acq92OH35rMNgCJ9EdwAfAkroj7nsvj4chEhWg8fvad/9CiNeBhtFPaZ+n38cE00MVG
	v8yn0xH+WfxZYZs85cFoa9E+zo8xkAO8eVuBa8joeYF8QmRmOQW4iMDuel6r7vBYZiw3O0PyBC7
	c56CKCp9H/ZzeBcf8O8ztMivJcF8oEcZckKwqaHu4HD2XHFqI7hXMTwlsLL8PNoKUf6EJE5eM3Q
	pWnWFxYQy2AX8XsYQsFvAuFUi/Rrg69DLcw1yT5NCC95oXn+pvqLKCpBF6RQanVllCVR9OjE+yT
	RJ91c1xFXj42KocMOAlTmLC3Hyeg6N6+vjASnVF458sRErt9tT0gcslwrSjeqWtepVmcNuMXhqn
	PhuwtM7AT2ffZ1R32DdxR4sqp7HENHyvVRoghTH1AKfHfXKmIUrCszutxfLVMJBlpnx8hkhyGwL
	Y2Ga9y01Ae48ixOjUz7QiowEiefErFNksbxJJN3SQNTBs5WgzoeYPSRGgfPBRyY46T574F99MhB
	fxFqJOksZx62NXbcrV32KCB
X-Received: by 2002:a05:6871:289a:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-43b5adb7a25mr12258063fac.23.1779813444777;
        Tue, 26 May 2026 09:37:24 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b639fd7adsm13561265fac.14.2026.05.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:37:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Sung-woo Kim <iam@sung-woo.kim>, Josef Bacik <josef@toxicpanda.com>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Thomas Fourier <fourier.thomas@gmail.com>, 
 Al Viro <viro@zeniv.linux.org.uk>, Luke Wang <ziniu.wang_1@nxp.com>, 
 Kees Cook <kees@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nbd@other.debian.org, 
 dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
 linux-scsi@vger.kernel.org
In-Reply-To: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
References: <20260523125210.272274-1-mateusz.nowicki@posteo.net>
Subject: Re: [PATCH v1] block: switch numa_node to int in blk_mq_hw_ctx and
 init_request
Message-Id: <177981344077.464267.4670805396521914701.b4-ty@b4>
Date: Tue, 26 May 2026 10:37:20 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_093726_310616_0A33B16A 
X-CRM114-Status: GOOD (  10.72  )
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


On Sat, 23 May 2026 12:52:35 +0000, Mateusz Nowicki wrote:
> numa_node in blk_mq_hw_ctx and the matching argument of
> blk_mq_ops::init_request can be NUMA_NO_NODE (-1).  Declared as
> unsigned int, NUMA_NO_NODE becomes UINT_MAX and walks off
> nvme_dev::descriptor_pools[] on CONFIG_NUMA=n [1].
> 
> Switch the field and the callback prototype to int and update all
> in-tree init_request implementations.  No functional change:
> cpu_to_node(), kmalloc_node() and blk_alloc_flush_queue() already
> take int.
> 
> [...]

Applied, thanks!

[1/1] block: switch numa_node to int in blk_mq_hw_ctx and init_request
      commit: 65e1c8f96ad1a1f3b72e8a91d1341d570f91d985

Best regards,
-- 
Jens Axboe




