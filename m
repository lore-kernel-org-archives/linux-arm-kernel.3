Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA980CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=; b=jMdtaEFBWj/euQXkcAd+XDtwXv
	LClvc+mr7RLFMFGHJ0naEQ4NInArty9+5ykO8YxzotpsXCqoXrwcO6onNQyz8TOUQJGAVZIrjrJd3
	LPBdv7ElFolNcb6qEiL2oLFjZTmKTHrptUp8/V7HGmp/F0SXxJOjPCNCn2unS499FTgKyb8suqAgn
	iuoOWsoBYsLTHOT+sPTIGGHQVZhzPbRwcZ6wsvUXJI1oKeaWejMRViar3DHrxUzFn3UnGtif24q7W
	gOYmjEwb9UMf6lkhw+/9y/2IffP1CEc/EXV6GBhUGfvlrYHUstSbrY5lauQ0tWkjcKhqOD5XCTjgf
	Eztl2vag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2C-0000000GjYz-2MXp;
	Wed, 17 Jun 2026 06:46:00 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk26-0000000GjVz-3p9R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:45:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2716073a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678754; x=1782283554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=;
        b=MTgxmXsDd8u8Pq6e6g4nVw04kKG/VN5Jw4UGbSL4tSPhp41OiyVAvbWEpZv/rqmH5g
         kBGusQXdo5G6oeCqBD3hFC7gbFT1t5K/gulpLO78y+1YC9n69+0BkD9WUFNibr9EJkbW
         Sp5xdPP4j/tC7YwdY4uDCdAkyCLrvBVmzYNHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678754; x=1782283554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=;
        b=Byd1djcUe+lqT05V17wipHVRkZjmapmiohAZdFC1FTfm7Y9lCGni/l8EovkJx/oE3V
         jEeVnZvrKYuv6HbSnuGFTCx4v4Sdg0gIsVtL+/gafwd+gscLEbj+fppAfPN/lo5H1MYm
         VGy3sZ6R3gU/AdgoIcELuyRruMn7yQKE3Ddbjv9apvJP9BfOuCjdeRzP5RzEXSSb8vS7
         OBL8gomMsBBD7+sLhoXRP3msPkJhPHoQOCcB6qpOvntsmu0rE2aoP+iCost7byJfs8YI
         WzVRQkS2e+dukguCrR0ijAuNmnqFuGzChjuRcI8dpk5iZYdTCyCcrbS4ZFRnXfYetmbM
         X53w==
X-Forwarded-Encrypted: i=1; AFNElJ/OH6NA7NtzUFlW2POT3wHfFaO521NAIlk3hu3QFGe0UtED0HJP066E+mcciUPxKxqbHkAJ5CDDIkRkLJSYjf5x@lists.infradead.org
X-Gm-Message-State: AOJu0YxlSoEeMR2YRFj++zztSMdvhudcOmsfROxivvJU+9Myw/WolZ7S
	LfrNpGHdmYQiaWfU5xkB6kOq/AdxlhkN/a/x3lRsGCGENGWpz2myNLiKn9SEwy2g7Q==
X-Gm-Gg: AfdE7cnnLTAORUDQYruDx6HDNkczg/1SkuEnNNnhadwK4B7q9xoff6uxkUb0/u9oRKI
	YnQNIdKsIqV4RC/0s2FZtlMzUI4gWTYc7Z0R7MTn5D8x6lmDpaEBpqTq3WXU+fHVfWV0CaITsNP
	BzSRStGVm1Jg0EUP0UHcn23QQBOFJoOmJaq+jhj7nTIl2d6lwF5EnvsLJ/hNL05FCNLLbQvhFHo
	gwPAi6e6I5ylWl7c40liJY/hglo5gpIBLtqke4zn7Y0RdAuQH2jnyO1CHBbvTTifWyS84+o6h+M
	D+Ug5cj6j5STQhRsqgVaErOyhVH0mi2BZuicz/DQW98r3WK/fSrNveF97ZytX+1JcScKI8spc8h
	Wism60OFpkxGmKYQ8WFHxmdOxStHtniQi5xde6xAORHeI92jF/sXl95kqCU4KzlEMkCv4rqD94U
	dPFjl8R/6M7Qxxz421A5N+mgYltUDdRmey4xVUBos83VhXKN0zUZQW3BbEl+qKUxvatLXvf5ISR
	Vo=
X-Received: by 2002:a17:902:e78d:b0:2c4:358:db32 with SMTP id d9443c01a7336-2c6bc0c6dd7mr24581365ad.13.1781678753662;
        Tue, 16 Jun 2026 23:45:53 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:53 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 0/2] Bluetooth: btmtksdio: teardown fixes
Date: Wed, 17 Jun 2026 15:45:30 +0900
Message-ID: <20260617064543.574704-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234554_979583_7F3A7094 
X-CRM114-Status: UNSURE (   7.24  )
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

This fixes several teardown issues:

     INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
     __cancel_work_timer+0x3f4/0x460
     cancel_work_sync+0x1c/0x2c
     btmtksdio_flush+0x2c/0x40
     hci_dev_open_sync+0x10c4/0x2190
     [..]

close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
In addition btmtksdio_txrx_work() re-enables interrupts regardless of
close/flush being executed on another CPU.

v2 -> v3:
- dropped infinite btmtksdio_txrx_work() loop fix (already merged)

Sergey Senozhatsky (2):
  Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock
    scope

 drivers/bluetooth/btmtksdio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


