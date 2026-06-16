Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61676CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=; b=eb8H3dinv+/ej3MD7duSys8RQ/
	/BcijyUmhABRnZPP2cIj9zMOGTTdV5WNX8Nyf/tP+0GsK3tufZhL3+L/uM8VangyexbE+lNPYP/pC
	JAbfQ9HXapubQ0UxDHfBnwliWpuvWACg4KbdiDC1MNDumFWGpZm6S7gB8eOhvMbKFMQFr23p/pNSh
	wgpz1U99VwRWDy46cJrflsd51bd5vir/rng7RWSupGga4cP3IqwtfkNS0cMHjSuODNjFfHA3sm3lZ
	hKz3FJlQjBMpFd8XjI1SqSLeBqCxF4PlFQX9FcKCsbm10+cSnBIH1aEOCPAq3xNL9OmUqg3xM2rCo
	6NqPoLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiu-0000000Fey7-3iRl;
	Tue, 16 Jun 2026 11:12:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRir-0000000Fewp-2W60
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84229481d44so2173266b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608368; x=1782213168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=;
        b=k+S0b0WbEmPP/MyhEaP+goelQWiudgAxBgj2bsRxR6GgsJYol3dpvKSmZTPO+J3qdd
         EUvhyQPa6Tajb+f3dZ9C5cGjVVrSGPtlUG0gk+e25djaQHhZuVD9LYjAlM0K68QLZnab
         dwC3pljbF9sua4XS+zwbdiX9M3Z4FoS7j+s6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608368; x=1782213168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=;
        b=KzuN4m0p3gh88WsO6GDMq1XF+56jbNhyScQ1jGZOdtX7Qev+QzgLRULC86Nn8/tahP
         b8HYj0h/w8REWqpO/XuMyPniMOc0LCliZjp/FOQ1jnzA46WFoVENaZG24UbC04hK8uF6
         FIt8jn2fKBaJUyRjqHb6phaQmghjkMGjPWxRjtphphDjeLp5V1I7fx1ydhcjMv9vNQIb
         yH4osvu6ai//BlLTaLOfNlIQDh2R1LtbEuLW8kTlx7jm6nmhWhPPSgrp0Ryp/adloMER
         BsuM+sPiU6Z/gc34O6rjvE6VuDyXM35GD2RiPR7/Cj4NfJGsbI/flzlx/njwdHaH9wGH
         xQZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qPILLxZCG+uvWVQScs75aeuwoWW1C1qWImQRsZgr1vU0RJtZY83nBe5d5Xs7iQg/OFIgDeAAw6Iz91Yn6AnBz@lists.infradead.org
X-Gm-Message-State: AOJu0YyeXAijU/9Qo2Vp5906aY+NH2NkuSOfbpQDK6qP5WM1N41pQM1Q
	x8BLJxyrxxU3WL0vZNiaoZGMF9cdJYCBeNilYm+oOjLtY44ynH4Ct12xKgmWlRoMI/gFcnbUwUe
	veiw=
X-Gm-Gg: Acq92OE3dP1fN3UH4m9n/fPPefpDwUI15THy38QMnIPyFetV/yrVnEFebd1WJT1fla4
	lpSwjsnLxH0OlgiLM/O7iJs+lr54U9YhmzJy5om05Cu5XFlX4N0TZU5DLc4I0TIfmnknXN3zXM9
	qD1TBpIHEYKc8J85sitku9UrMPlV20W5gCedH2LDKOcAcKo8n0sW7RS6l0jZ19luXG5jy28w4aK
	l7gEmBy6wZUM+Yl1O2vqoeBdP3QtBAfPZMH32a1A2IzYJCEWR9sskw7dyGvOHYP96YbJ4HNjnSV
	9biPVo4C3ggSOMKavrQGbWiEf8kmwMAXv002cnWweTtOF/8TYzAD9k/8D2rjOT4voaJ4bcjb+Bp
	5OZVR2kEWGu1VRnT3l5pOp+iuGeIJpINBzQSDgc6+KZTx5+0XaNX1m2apzCl9AKLeWReii9h7KI
	E4fqozr4DUmn+vcn8GN431tTl4eTizLVnKqxRhYy83WxpXpzF2E4Xyf7CHfOMvYEXy7+2+bK4dk
	/Kdveon9XUi5r5wK8InVd8=
X-Received: by 2002:a05:6a00:3691:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-844e1998f75mr15786071b3a.20.1781608367732;
        Tue, 16 Jun 2026 04:12:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Bluetooth: btmtksdio: teardown fixes
Date: Tue, 16 Jun 2026 20:12:05 +0900
Message-ID: <20260616111224.152140-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041249_783276_B11FEE85 
X-CRM114-Status: UNSURE (   8.31  )
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

This is v2 of teardown fixes.

We noticed a number of cases when btmtk close/teardown would hung:

     INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
     __cancel_work_timer+0x3f4/0x460
     cancel_work_sync+0x1c/0x2c
     btmtksdio_flush+0x2c/0x40
     hci_dev_open_sync+0x10c4/0x2190
     [..]

There are several issues with the teardown (close/reset) code
in the driver.  First, the btmtksdio_txrx_work() potentially
can spin forever (infinite loop).  Second, close/flush can
deadlock when run concurrently with btmtksdio_txrx_work().

v1 -> v2:
- added two more patches (deadlock fix, interrupts re-enabling
  enhancement)

Sergey Senozhatsky (3):
  Bluetooth: btmtksdio: correct btmtksdio_txrx_work() loop timeout check
  Bluetooth: btmtksdio: test for bug IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock
    scope

 drivers/bluetooth/btmtksdio.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


