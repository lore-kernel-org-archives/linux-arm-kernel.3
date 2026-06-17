Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2EECD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=; b=KVSFwvFNMXSHBtCwsbk81H5wPq
	K7VWwQ2yrdVC/M9c5SvlHDkyuUuz9RHlp02Ljw7GFDO8HFLf3Oc9mXjII222SoIk5yL/cscaMjsvW
	N57hU0dTTjOWKvGh1ff212hDVa/CmTu1viJkmKejrOQsT9Goc5TnLKiqykuWx7jtjzX11IiVpDN4l
	E5WqP0Avw8ATEBKg8AWiJMFeAE8phU34pqCt8AYJMf66EMMPBSiYAgiGwaGlpw4esl7H3RruSWOhc
	x+E8gCgXO2dwsZEp+E8G3AWcw5VB9RJz52hirwLABZr056jObOD1Rg9fr+SD+5OQZT/+so/9zm8e7
	ezUGs/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm3C-0000000Guyg-1Kzd;
	Wed, 17 Jun 2026 08:55:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm3A-0000000Guxm-04fa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:55:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0c32f6ce1so38485215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781686507; x=1782291307; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=;
        b=lnW/5IxINKywlLOmuaK/oGB5tD/oBWSyBN3QeqyoLPgOfYdKIn3v0uLm6Ic1N7qHtk
         P5yFV6/N3DYKwFi2lD6iHLf6g+Wf69PtCqTOy+LX4lvYENztj7xkrlslOOCySyJf9MZh
         CYQDLEPfgUdmJq5/41EAPJChELRDZfPWboADYdMeCeKV6fVCXBDJKtIkz8Cad7a3euLL
         DpGnLd6kFZdHnxa9qPoejA8gbcmFRIdiZm7w6jcwh9NnEGDkVuiKTcDRTr7EvVj8fjYg
         HnHrHpJMijPz7u+acFSl20HYQk34YUS43D4uPUkssZod1l4FJnR32Jh1a9cL2gJ827zv
         54yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686507; x=1782291307;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jU2lF5D8WsZ49yodI+DbJaHAzFovQXJU1C8q9EyojGw=;
        b=DODQ+RgL4sU6I9RoW3KyUx8WdA4vzUaTuWc9f7v+GgbPkTMrqES/8sQGPBhEYC/qtH
         pVGgpyqWkh4wJMRbbRO0f3tXDeoj2ilJcm6khC6T/KJmK2bC/SBJ1uQebZNraJEj+EHt
         ctqZNRdxkwpAnKwu7wf7/TQjbFM3FuhFtNzlMViS8QpJuK52iEEPC8IGvKnvkLG/mN9n
         abW4WgWSVIyaP1Yxb9TJmGvAK3XpKhh1G74zb8Pxu53/2KVm5GZrKk2WP4o2Frw8W2II
         c+9XmskYgTYzyaHdLwCWsVGUaLdW6ujxI9Ry4emyUg4ECcN/wemuj52ZhWUvpE6Aip2J
         IdEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hnzfgAdBRQI2SDjp7qePgc2mG5t2lrKCNi73n/ejM/I87zXnMHx5cFBzGwBQTs0KGQKW9LCOJDEHNuZQa+Rxi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Px1cU9H3jkSl/ObjFAtkAZvGLO0C4SeoRB+3BBThPkHufQBG
	mgqR2I13CTvi23F/JPNZR8MLmNVolZO3rEfGwqJoAi2akduDNiDadEuN
X-Gm-Gg: AfdE7cmgdk4CGY0L44NILcgfdz0sTPDYN+ojZNMi82LCDUSBApPQhEO6EJq3O9LyFsl
	D+9tfg/kMh6vhJIZIYSkNaQz1GZkWHCKumYrKdrV4jkKZgz1eLwiCwa0qHH28kiu6BVI77cA1bG
	ehd+IlEQ+DzA+tKElqQo3s98cBnn6StZbUM4VkKq7VU/qIqdTqf6Htl/avToa7BzJt1eCFuADJt
	ndx9EJNnKoU9p+jnh5HOVJO81d8whRa9G3YLwn2fq4t3lUg4DEt1P0FJ05WU4fYtGuIO/4Qc3r1
	+lLadBZam0Z8vDxkfpheF6ZkAygoYAq1AC9y/LL+ZtnSQQGosj9UWFLqP8jzupjc4L4sfK2fGtH
	ouUP7fvnuyc+LKCXwKAeIcA77JJcNkEDVVq+7NwUxmEPDY52jsJdKQAO7+JA24OX/2/881rI8RZ
	rxYXK5xIJmKKReh6iI
X-Received: by 2002:a17:902:f64d:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6bc0e9707mr27907285ad.17.1781686507025;
        Wed, 17 Jun 2026 01:55:07 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm15031735ad.68.2026.06.17.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:55:06 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: lorenzo@kernel.org
Cc: netdev@vger.kernel.org, nbd@nbd.name, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: Fix TX scheduler queue mask loop upper bound
Date: Wed, 17 Jun 2026 16:55:01 +0800
Message-ID: <178168650178.2224380.3950331731013129336@gmail.com>
In-Reply-To: <178166704952.2212140.11002626760717132754@gmail.com>
References: <178166704952.2212140.11002626760717132754@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_015508_082615_A2123F3D 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Jun 17, 2026, Lorenzo Bianconi wrote:
> Even if the current codebase supports just AIROHA_NUM_QOS_CHANNEL (4), the hw
> exposes 32 hw QoS channels (AIROHA_NUM_TX_RING). Here we are just clearing the
> configuration, so I guess the current implementation is correct.

Hi Lorenzo,

You are right that there is no functional impact, and I agree this
should not go to net. Let me explain the register layout I was worried
about, and you can decide whether it is worth a net-next cleanup or
should just be dropped.

The two macros are:

	REG_QUEUE_CLOSE_CFG(_n)             = 0x00a0 + ((_n) & 0xfc)
	TXQ_DISABLE_CHAN_QUEUE_MASK(_n, _m) = BIT((_m) + (((_n) & 0x3) << 3))

REG_QUEUE_CLOSE_CFG() masks the channel with 0xfc, and the bit macro
folds the channel with & 0x3 (mod 4) shifted by 3. So one 32-bit
register holds 4 channels x 8 queues, 8 queue bits per channel:

	channel 0 -> reg 0x00a0, bits  0..7
	channel 1 -> reg 0x00a0, bits  8..15
	channel 2 -> reg 0x00a0, bits 16..23
	channel 3 -> reg 0x00a0, bits 24..31
	channel 4 -> reg 0x00a4, bits  0..7
	...

In airoha_qdma_set_chan_tx_sched() the loop variable 'i' is passed as
the *queue* argument _m, not as a channel:

	for (i = 0; i < AIROHA_NUM_TX_RING; i++)   // i = 0..31
		airoha_qdma_clear(qdma, REG_QUEUE_CLOSE_CFG(channel),
				  TXQ_DISABLE_CHAN_QUEUE_MASK(channel, i));

Since each channel only has AIROHA_NUM_QOS_QUEUES (8) queues, the correct
logic is to clear the 8 queue bits belonging to 'channel'. With i running
up to 31 the BIT() shift instead walks past those 8 bits and into the bit
ranges of the other channels folded into the same register. For channel 0
the accumulated mask becomes 0xffffffff, i.e. it touches channels 1..3 as
well.

This is harmless today only because REG_QUEUE_CLOSE_CFG is written
exclusively here, via airoha_qdma_clear() (RMW clear), and the register
resets to 0 and is never set anywhere -- so clearing extra bits is a
no-op. Functionally the current code is fine, as you say.

The point is just the loop-bound semantics: 'i' is a per-channel queue
index, so the bound should be AIROHA_NUM_QOS_QUEUES (8), not
AIROHA_NUM_TX_RING (32). The two happen to be related (32 == 4 channels *
8 queues) but mean different things.

Since there is no functional change, feel free to drop this if you would
rather not carry a cosmetic patch. If you think the clarity is worth it I
can resend against net-next without the Fixes tag.

Thanks,
Wayen


