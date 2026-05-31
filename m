Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD291CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=; b=Q663vGlg174t0753mrKhDM3mIt
	DkidNxFA2CZNSG3JoVGCsu0PI1oQ9E3/u/ZBfZnMst0opPZaSeyH/Fe37rv9WnvRzq4a2YaYdgUXM
	kKTxqJks0hhx+fO6hhCNP7HNcO7hVNK1l2pyuuKjeD/zXmiBuYFeE/7IisKrXrNy9k1EfGznBjnNC
	ZG59wmNvviwmnwG9BwvhrDt6wDhhNlgmJhvQZUZyjeO3v3xEJSzM7aiADuj/UuDv6bJ2TwMPJIJxn
	BQltEgBkWrClJbVvcgXOxF/OCAzDrzCDyjot85KFSFk6pwkoYoGwuo3d0/e45PzmsKl3rbfrmhNCB
	2DxbmHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThV4-00000009eop-25Mj;
	Sun, 31 May 2026 14:50:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThV1-00000009eoR-301W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 14:50:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36b8d414666so2018949a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780239046; cv=none;
        d=google.com; s=arc-20240605;
        b=dNHHrvt1YPZ7IEwkcVjWt13nY7WdfLoiuQz1/FIfmJGfTB3/86PqkhARdy/ykb0XHo
         dgEVoRu2h8u5l3OstjoKVnqoIHJRB++pdCn7orwYU48fD/PHgLR3LHVF8qloPKF6rg95
         fwdSmhHSc2KlsjlR+z8gyOEIMZkn7qB4b+lg0Rew0ReY12bejzd1ddHAgd7AF6ZR3dLm
         iTT8WTl2ITF4gi0omlJ+p61Zq5FC/TnMeJqzwJK9TVKXvTC0oVqB/kD+SOSWsGsOETXu
         ZS98t2c3OuoDEx49b8/RjZE6vfs1biiNg37lfAN2rjNnfcmx8t7ihx+90jlJoDIypVxO
         HXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        fh=vhBvEmNN2Gd7BiFRFI55/j1uKoeLt8HsxNxb0G6C8XI=;
        b=MuCsGk9XADpbLR+m8ZBgEZVQhn9eKFgVbnn5JM0pF6nSyVjSbZ2LnEZYBqHuaaKQGs
         rlvGajqsTUmuGbEfCEmFtMbpxChrSkHfdH+Pw5N/ERkDLJATOmlJWnMhfB9ibipFMTdj
         HiahDbnq1DvIPXXzu14dAYcekMloQCFz/jmHOoU4Zy3miYH+vfIB5XVYURa2rv9a3DDE
         q8QB9R8ePU9UO+pVX7GSjqm3yImmx9ggDftNIVAT/yCIwZvKD1RubHQc8ertkiRoUcil
         DtiULz3Q+4poc4ar6ZLASAvlFgjaMCwqCqcDWsmV4giVnx1jg8abkABE35M+Of6UkHaI
         nWKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780239046; x=1780843846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        b=WoZ8VFU1CZHhCm8ZA+jOKRVmWusGU+NLKoU93prrRKWoAgXeJYnA9l7kl5s4glwrlZ
         +GVzAKhflHQZmxR1i09PzRYgKNdIayMVBHNIbFLWLBnai48Z9XUIUSTE7qhibzTx0ZSl
         g49P0Uk0hLACjKJyFgCdkWMoKTbV1Mb5dRhmH+NW3y9gBgxepT3XCjir+yVg5B2zgtr2
         dj7xt5ZD/Pvv1eNME2KxD5d7k4rcAQQx+YCpek8Ojonc2EWrM5DfMIqejci30JWCHM6P
         cq3DAlpU4Sx0UiL3Odufw/QoWR+gk87Rkw/o3u++jMAIz3TKK2+zJoz0G1swAobmmlv/
         0XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780239046; x=1780843846;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        b=jal1iRCiSC/CGyz7fyV00BHkCU7zxI/2xKQ/xPji6pdyeWOmjYew1L4pUJXajhAYs9
         yo06EXfN2rcIBLeawJSDGa9mNpONXAyLSWrSQH8hJ12IRG7gz/Lb3lA1PI4vAzv5djhV
         WfnlfT25iGAL6aX2GsO4OzLUfrMCKaNqoVpo4YRJX26sjw8sWGwhyTWO6RWFr4Zff2bV
         fUoPmZxVDgFT6fu5DfD9qqVFHhiKwzYz55/JUCNfqGCdv7XoWLLOrr6yweYmQy14ECHd
         HTvdNJVkr+WaTqQsuhyzKP84UtQIqf6dy+ookOtTakdho6zoLLcARWbR+4hyZdDx2VpU
         dbfg==
X-Forwarded-Encrypted: i=1; AFNElJ97YUMwDWXETgZh86MNU5IuuM+WeVCBPAmmdEjbOVXjnbaPzpcHskGtcDufipiNLmWdv0BlzZi52/uu7FslxodF@lists.infradead.org
X-Gm-Message-State: AOJu0YzjV2x6R81q60g3HFEjdlhd5f3CehnyLd1x+kUEQIwlyBaSWrhr
	OENkyk9PZhBpNjMnoSJutrjodqjwc/v0+kFdWYZKXj/0sM5NH4u6PhculyoSdz21ozfX9Bie5Fj
	VfJmLnj57/ntED53vVkR5BMihjpgEAU8=
X-Gm-Gg: Acq92OEtiu+47Kk0L4cMQw+kgMUIoShVClx1aBHnsWX1xP3pQBQNp9wusbKGMEi2hmY
	eAuisWgxthHcEMtKc77L6Nb6MyBtWQE/zF2mvHb3qiehYFSjbkMfKvBzmb1wEXwpLy5RzcpxbMU
	SKB/eEoA3BQ7nPSbnAUYZHThwzEYU2J0OB9LiKGW6ivk1V7gcTy59Ef5AHkw02dEzk3MtDb9PJF
	LDQu1fXwAll0XQzCj2w0HG4iKdH48awmJcJNU1TZjidzfs4qU4+eVOz/5PlnZlkrnXdajnKLGrk
	lXT983rr04o85IpojObb7kQwZyfGIU4=
X-Received: by 2002:a17:90a:d2cf:b0:36d:649b:ea46 with SMTP id
 98e67ed59e1d1-36d649beaffmr5225695a91.2.1780239046249; Sun, 31 May 2026
 07:50:46 -0700 (PDT)
MIME-Version: 1.0
From: Grewstad <dogestad24@gmail.com>
Date: Sun, 31 May 2026 20:20:35 +0530
X-Gm-Features: AVHnY4I0bdqKDSDpbxtaHikPCrAQjQXtcW7k-UTC0757o0c6aHNjTsyA3G1MFds
Message-ID: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
Subject: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: gregkh@linuxfoundation.org
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_075047_780797_967D6E73 
X-CRM114-Status: GOOD (  10.36  )
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

Dear Maintainers,

I am interested in contributing to the Xilinx AXI-Stream FIFO driver
located in drivers/staging/axis-fifo.

While reviewing the driver, I noticed that it does not currently
contain a TODO file describing the work required for graduation from
staging. I would like to create such a file, but before doing so I
would appreciate guidance on the expected long-term direction for the
driver.

The driver currently exposes a custom userspace ABI through a
miscdevice. While this provides a generic interface to the FIFO, it
does not integrate with existing kernel subsystem tooling. One possible
incremental improvement in this area could be a transition from
miscdevice to a proper character device (cdev) interface, to allow for
a more clearly defined and maintainable userspace ABI.

Some possible directions that came to mind are:

- UIO, if the intent is to provide userspace control over a generic
  AXI-stream FIFO with minimal kernel policy.
- IIO, for data acquisition or SDR-oriented applications that could
  benefit from existing buffer infrastructure and userspace tooling.
- Networking, for packet-oriented AXI-stream use cases.

Before drafting a TODO file and proposing patches, I would like to
understand whether there is a preferred subsystem model for this
hardware, or whether the current architecture is expected to remain in
place.

Any guidance would be greatly appreciated.

Thank you,

Arihan Bhor

