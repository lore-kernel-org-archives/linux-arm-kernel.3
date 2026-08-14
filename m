Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D4EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S7sFuRCjatzs09JKRbH4HGwrINbYlULF/Unkzu0baA=; b=v4n/hzdnFiTprBwTyGuVBdlrdH
	ggm+tMd3TabZAvALPKEeA56+qZzjAK9SrAO3xajqSDJJh1bp5mGo8v0cwwg/LxObjUiW8SHOYRp85
	1Pf55fyWozMbXOltNqVEWpe7WViM9dbVpg/Du7j/abqvZzYrE8f/cGQo2grDZQrNWaiBGqRN8YFb1
	Mg6e5rtORtLnwFzfdfSgbM7459Hd0PXoGsbj+BMutsN0u6o/l8z2YSWzkdZDgrtzVtQRDiPcKbBPO
	yiMsCA8XQ2aBVcqdBWKvqc8M3DRzmmpDfHeOCyBCWKFiZ9nLNI42c6RCSl5vVF5hA2141oc/aZeSm
	S86VdoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupmE-00000002ZIA-27fQ;
	Fri, 14 Aug 2026 11:08:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupmB-00000002ZHR-37l3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 11:08:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495502852d1so329325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786705717; x=1787310517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S7sFuRCjatzs09JKRbH4HGwrINbYlULF/Unkzu0baA=;
        b=RDqq35jUsTAvM16xD3zfMwdy50gvnedHsFD7CS3h8F5zr5z/uVSGZDljtJEMIkxn0T
         OjaULCgwZqIOWJCww2Ce5riZpX+9EZ5lAUJaP/U4lXltxj0Ma9OYV9ZUD9O5Pyp6vjXA
         yex9pPoBQaeNyooGSdERn7+V7WJ5RIXXg9FhAsM+Vk09F/XAJiI9G9UoZcCwX3xSnLNI
         yYTiRcGZThvkQfBe2Jdao0ycXKb6UnY+v4xitxFFu5Kl8tCSb80FqBgXI1Bre+NiOVkE
         pKMnG9QAE0Kqri+et91L8tsgkCf0j/9lLMABXKXSZdp0PjQmO+RsWTI53jCYcRP8Cz92
         luYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786705717; x=1787310517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S7sFuRCjatzs09JKRbH4HGwrINbYlULF/Unkzu0baA=;
        b=WgK7jcAC1Ux1vG0s2zqrVJ5XI5b3GSP94HRhIKzMT9kGOyexElKKaEkJHsia5LlHas
         5GMK1v4sj3x1Ug6VtZ9JRF1U0ACZzweGlXJrxhjnshFZmLvkrAGTaOXTfIrS1QGbOKss
         GWkF0iz8I4Q8hXGuowqNkJrunz4jimV3gBZcS9mCMy2ofh6penJOt3B/YmrHNkCTD/Gs
         8U9FK1oEU/GN0ZXcees1Ysrar/oVGfBo2fQD0PdwDSf8PH5kL4Vh0y7oL/OfwHctr1dr
         QrCBqGVYT5PM2Ic4rpamha5uA0FS+rA9X8S2S5FCk22mJ7JtJYo46b25W1bUDf1EedXy
         MOlA==
X-Forwarded-Encrypted: i=1; AHgh+RrWcHotVmXhyvOmABrTqjlRfY2wOkMtf9euSB0G+k2375v51CQa5fLd1mKJNL8sq7dzWyAe7uZon/jQhLry5azA@lists.infradead.org
X-Gm-Message-State: AOJu0YzOVSDrAuOqoDryqUIY1JklID3K9i9YOm4S3Hhk+wko4p2P7Q6H
	iqUHjiFd/jq92YSIKn8udUo97KtSFM0HRUrpRybt6aVzVKbSlCVfDyGT
X-Gm-Gg: AR+sD10tAUcM4bnKAeWOYb1u+MWyK51HT3MDciFAYwygUw9kfyRHc+bxRVWWWeHqpjB
	N07HpIsNq1rZcZKIJ/dVQtqoCvdtWp4luc4focIe93uezsHj1fTL/w/fqLyXtBP89CEopnT3HYF
	GJUA7eiB+CKmdDBf+c8e0XW+EUPrqqN22eWvsrea9htsziRKmIqwmAy2MyIJryUzpiWWu/D+Q6L
	THkpnn3Q0W8V5YnKWZqYeESvydf2mInb7Gg3o+dBzit8ien0alFwVKhOAb0fxDXoAScxdzVgCB9
	mhJZL1isO2fQwPJz6wOWc4ifEBjOebpwDkKOwI2pfeIHF+PRflSEZqpuQ+3blaib6ibipkFHCNN
	odUX/9aIxkgc8vjM4FXSkuzI6B8hWQ8tEDjRtD40KcWZfIUIxERPnE5cpoflUpvkrBTY2vNAYOV
	Y2IYSFEaJNe1Kdn1PXZseFrvwpqdtkNXEdV1VYkJ/PLtiUkKzxahi8XN4WiBwOfRYp6DTdyDlZq
	EhiwBFCMB2HEDD2FOmiV8yB9GIHUxBQfQMYmn1C8x97VjkqzxT6QFayV5LkMxrKIPcMpA==
X-Received: by 2002:a05:600c:1395:b0:499:77de:78ba with SMTP id 5b1f17b1804b1-499879826b2mr34045235e9.2.1786705717053;
        Fri, 14 Aug 2026 04:08:37 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D33002713106A8ABE6E8B.dsl.pool.telekom.hu. [2001:4c4e:1b8d:3300:2713:106a:8abe:6e8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877d7974sm37724265e9.1.2026.08.14.04.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:08:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Fri, 14 Aug 2026 13:08:21 +0200
Message-ID: <20260814110825.14893-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260814082652.3852617-1-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-9-gahing@gahingwoo.com> <20260813095718.9747-1-royalnet026@gmail.com> <20260814082652.3852617-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_040839_821962_3E9B6A74 
X-CRM114-Status: GOOD (  10.60  )
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

Hi Jiaxing,

Here is the RK3588 column, all 27 operators, ROCKET_SEED=7, scored the
way perch.py scores: a channel is good when its maxdiff (md below)
against max(cpu, output zero point) is at most 1.

Setup: Orange Pi 5 Plus (RK3588), kernel 7.2.0-rc6, the rocket driver
from this kernel's tree rebuilt with my clocks-by-name and devfreq
patches on top, Mesa at bf70ab68a21, teflon delegate, model
mobilenet_v1_1_224_quant.tflite from the Mesa test suite
(md5 4f348b87dca3315d2b3646cf5a3b31cf), per-operator models generated
with the four byte output patch you described. The "correct hw" column
is your chainmodel.py against the same model file. One difference to
flag up front: against this model file chainmodel prints 36/256 for
operator 8 where your table has 34/256, so our model files are not
byte-identical, and the columns below should be read against each
other rather than against your FINDINGS numbers.

  op  kind        correct hw       RK3588
  0   conv         32/32   md 1     32/32   md 1
  1   depthwise    28/32   md 3     28/32   md 3
  2   1x1          22/64   md 6     22/64   md 6
  3   depthwise    21/64   md 13    21/64   md 13
  4   1x1          18/128  md 14     8/128  md 15
  5   depthwise     9/128  md 13     3/128  md 15
  6   1x1           4/128  md 23     1/128  md 24
  7   depthwise     7/128  md 10     3/128  md 12
  8   1x1          36/256  md 7     20/256  md 17
  9   depthwise    32/256  md 11    22/256  md 13
  10  1x1          29/256  md 9     28/256  md 10
  11  depthwise    53/256  md 8     48/256  md 11
  12  1x1         166/512  md 11   121/512  md 13
  13  depthwise   142/512  md 9    137/512  md 12
  14  1x1          82/512  md 7     72/512  md 10
  15  depthwise   154/512  md 10   115/512  md 15
  16  1x1          82/512  md 7     71/512  md 10
  17  depthwise   156/512  md 14   141/512  md 21
  18  1x1          92/512  md 7     77/512  md 10
  19  depthwise   170/512  md 7    152/512  md 12
  20  1x1         102/512  md 8     84/512  md 10
  21  depthwise   166/512  md 13   150/512  md 12
  22  1x1         174/512  md 6    161/512  md 7
  23  depthwise   293/512  md 5    261/512  md 7
  24  1x1         671/1024 md 6    636/1024 md 5
  25  depthwise   718/1024 md 9    684/1024 md 8
  26  1x1         572/1024 md 25   574/1024 md 23

Three things stand out from here.

Operators 0 through 3 score identically to your chain simulation --
same good-channel counts, same maxdiff -- including operator 3, the
stride 2 depthwise with the asymmetric padding you suspect for the
first RK3576 divergence. They are not byte-identical to the simulated
hardware: diffing the raw tensors against the requant_hw chain shows a
few hundred elements per surface already off by 1-4 at operators 0-3.
That looks like the same small extra rounding difference that pushes
the scores below your column from operator 4 on; through operator 3 it
just stays under the maxdiff <= 1 scoring threshold.

There is no md 255 anywhere. From operator 4 on, RK3588 sits somewhat
below the simulation (8 vs 18 at op 4, 1 vs 4 at op 6), but the
maxdiff never exceeds 24 across all 27 operators and the deep layers
track the simulation closely (574 vs 572 at op 26).

A control run with ROCKET_SEED=11 keeps the same character: operator 0
still 32/32, no saturated maxdiff anywhere, worst case md 35 at
operator 6.

So from the RK3588 side your read looks right: the deep-layer
compounding is the reference artifact, and the RK3576 collapse from
operator 4 with maxdiff 255 has no counterpart here.

Igor

