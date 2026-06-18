Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA2FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=; b=RrSucsiNkcjbZEmJXDRYl2bKsJ
	thx985vaXuY+DitR0g1x1EjzwqrfEgykECiRMWs2BxNVCKiQHXZAp7lr83zt9ZVMCRTpEPOuj083y
	X8SWqEr5mHO3V/wYdkvQljdrLsdAOGOnF1bF6/aUmdB++lCoZXBVa3Tk0j0WgB4PkjkBC0H6RCfSg
	wP3iWUtyEXXsQjtidLQlZalKV92lDegJG9aPuwxZ4CQt4pAC42tbFUXIwpG3R1eYxj6tNAHZ0lcoO
	FzrXItTHa7w4zxgqYnB4DMdesSf8LIFLrv9d0jzjdtG31B5iUH8xuICsnac0hXSkVvsBqaeW5HJBp
	fSU8Mi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CQ-00000000YJS-3wxi;
	Thu, 18 Jun 2026 03:13:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CO-00000000YII-2nEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 03:13:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so195304b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 20:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781752427; x=1782357227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=;
        b=Au7XKgiMcSmHb2PiI4VQKjsdfOBp0uKydS7sXsZoTkwM3xbRdTCfFVCXqTICiYQy/a
         iUZgJXUC07CPUrRbtqmjgkRVY3YP3kdUbVI9p54eb8HVTUFANFd++SghkXc8N4pHgnAg
         sYltc55ZLvAvPL5VYQW2iNUTWOOOeU0xHMEBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752427; x=1782357227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jDBMo+uapTMqM+YZcqPtN2LM56ZOb5vW285QSsulV4=;
        b=UDqfydUoSomhjKEjxuWd4Ecoo6EViJn4NJ1DvgaO4UMWLWqM0nbK8UR9+FFMMnv4nK
         +dMovE1CS/Z6TN3i6pStUSn1BW82HQu+XtMs4HtxNAAx2WLyQTENHnZBG6O7spgEp9IU
         0/sfPk+QPPEtta6B9orHDRLhyN3J7KgKyHlh2TCVCm2UafowFKFOAap0Glj6PbPgp3Sf
         E4hAJWDHPed+5D7kDMXCtB2z2qd8ef5rNLd95jbOMU34gJnfQklZPPBf+AKM+cAOWXwB
         HELUOuugit1m9rYbcucjh4K8mpW2pbX5i4j85U2Z0oxHFupyxWKrwf/qqMqrAnDU2T9l
         cyjA==
X-Forwarded-Encrypted: i=1; AFNElJ8v7w31kINi9YsOTnR51DERXTs1CVzhy1RNkBt1Brdzn8ldAj9I6/9ARQS+YmRWBEIxN0SR8b99lSlDsans29Km@lists.infradead.org
X-Gm-Message-State: AOJu0YwQbuv2+6H4gSGpJaWFOtHzXaYSyd3J3+LTTAY7HWmuQMvonMs9
	tLnibzWEe2tUjXa2Pl3CaLpi0l5nBRpRdygQ/Dp2qomtmWl7i3iiVbqxvha5y+LppA==
X-Gm-Gg: AfdE7cluGkbq1B30D/yEb809Plw0CWWVDRozbt9MdGYPxZhccwVND+5JrR/wT22DXig
	Oi4EeQzkckqn7+OBi5dzS2aSVc62sGnDR1r76wsA5PJj2oy7k0p64eAdvjj/xjAUgzVE1qKVmyi
	SRWzleWgeeOw5AXrypl79xX7cn3lhbpmnSuUn7zgEnTpKS23TavLO/1jUmX5kc/H18sHEDrVguL
	WbIe/4MVP0iNZHvC4AP4qm8/rXDizYdJBB3f6KE2j5o7rtjV39geHUK4Z+phTlmsLL9Zmt1U86V
	IEz9rYdp1LWQuDCgHa2sAUykd7OHL63Zuz1vJjFNnmCvsvSiS5vL3fXWCDaQEQpe8sapll0Lrgt
	0XeDIbHm/fCmyM46u1dpFXZeB+s6s3tzSJjSsLaoPbOzIW0NNrumbaKT40Qxy9HU3Xod0gBI0zr
	pwktn2ofb7IV6qfl3b93aSSnLk4ad0v/JeO8N8b5PKkDzyCVpEiayN8UEpG29rhVd+TUqcYsION
	Bw=
X-Received: by 2002:a05:6a00:84d:b0:842:1ffc:55b5 with SMTP id d2e1a72fcca58-8453b1959a3mr1855321b3a.26.1781752427130;
        Wed, 17 Jun 2026 20:13:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b046911sm17548232b3a.53.2026.06.17.20.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:13:46 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Date: Thu, 18 Jun 2026 12:13:20 +0900
Message-ID: <20260618031338.1011410-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201348_746363_AE6C1A3C 
X-CRM114-Status: UNSURE (   7.17  )
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

v3 -> v4:
- fix commit message linter warnings/errors (tabs, subject line over 80
  chars).

Sergey Senozhatsky (2):
  Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope

 drivers/bluetooth/btmtksdio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

--
2.54.0.1189.g8c84645362-goog


