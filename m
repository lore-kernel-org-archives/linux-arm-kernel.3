Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA01BCDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=; b=RHuuHKzey6+UGlHC2+F/htvpAW
	YH1YGZpJiuLppSiPXjUSGGlozd8+pOV87hVK54NqNQP3lIUXx8ZcgIHUz7WDEq+cPYNfasg4Mzna3
	c1v5vdRythsuWU2aUP2UmzNzKc9RjUH7TrgXuIikilq63O3MeEqkRcYwWp0mF8A4nxeAAfxTWk2P8
	TTYWj+aZHEtCh9mGu4t8gTdH5oXYY9zsHArov/GhzOUriNYjjZOfcJ79kpBPF9eXmslqDrKKe0xe3
	JjLNeTjxpyKPgSPQOBUEBK5NsK3lJdkDoBL2VXp2ryMbYyo/qGJJM/isazcwFSJrpi9vCdoXW1vnt
	R6Ralp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qI-0000000AqCo-0Q2h;
	Fri, 26 Jun 2026 08:23:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q1-0000000Aq3D-0EXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c7f3148705so6020105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462179; x=1783066979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=aZj2hlL0lPnlj64cU8ttlQvur1mpOhzDDQcIFb7rkAVHQprtlpJZGz5wETUOpzlpLQ
         W6oo9jrOYKaVcXVJrYjvIr9PIb6URCnEIw/W4Aw8QfupeY/t/GtSLwzaY91fx3ZKcXG1
         J/NTg2a6KTL4rOHXnqZAfa+x4NNEGt8cezHoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462179; x=1783066979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzVIQilP3ckL+D+ToPJDoqRVs2r93lzUUB6zieccihg=;
        b=rh2EZMdOqCsBOPk9BssZDhzfHRbo66wDpX9bZnWU5xnFOf5NmbIdFPy+QirRVIWJu/
         mXGr8YsbAfbcph702Kip7mRHZEpOT9AN9v0RD9P/zZpX/v/tUXu/vE9cN5W2mJ4Y/Aik
         Gw45hZOg4tRGRXq5BBxQfzuPVFaM8gknSzm9tH1r2oCqwJ5llIyRPjv4oxYwWWlPePBZ
         1COOgCpJvnqzETaGhkzoTNjVeVhVWBim3BeVSjjP/pcm2c+RFhAxZmzlzL6QYiDCwMPP
         JigguUZl/77dyHKgPj6Xq6tUxCaGm6VVI6NFx89IjIpJqWFajRx0wqcE3+eZWQx6aq6I
         sR9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq4HtstbI+/SAY0EJuAEBFz3UWsMiKl2BdSsFMt4PAtAAi9z7KEgJni7BWUDvSwZOWOrKJrp77S4pGbWmVO/Dqf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmlse2lwk3b0e3/k4rfiidDnbReoxaCEwpltVj7KLNLO/kVkeC
	JcMd57g10GaCgIegHI/Wo4FDH0iEtvaOUuA36jgkKfjfKgfhve3YBBCv/tJPdFjn7Q==
X-Gm-Gg: AfdE7ck+PkZ4G7ffgMhUTpEZF1B2Qa+xNwKqalXvHF9zJYfZNS/tm2h6mDenkEvjgnX
	Ja4LVF0PMvu/7tUhMSbQZMcwY/OJkJqFliyBsjVa2SgvYCpmkn1vkYYp8uNnj0+TldTdMrA9hKC
	pRimT6H9kpcypbHhcwz8iz6IjJXt24I4U/Den8t4OsRRXzQ0KMJMVgnbCY9Ybd8ZOARN18X/DVL
	BmuYVuC0zDBg2URFOXUsiRWNXgO23rAv69FcT84/hKRlIIkE9ZPMDBpiq8S9uV+TgeGxUVDemBI
	u7sGhBwu4U4d0+NiuFh3G1jQ2yPNhIUgi8Ky/n4Pbi7sBIfDQ4hnE/qrCgKGiX5FrttJMkWvLoJ
	4d9KtAGLQKAbTPhiTR7iJ+ITWjAf+QvnEbX9W6nW2j9mP+xIqLYnwD6KBI1E1fYn5jnRe1C3k8h
	wSPjBkTiuR2cSQ9yREiGR4Mw9M0CCVlkz01QkNR/LdEVgujKZuJLHaSI3ROdak5Dzli4i16MA=
X-Received: by 2002:a17:903:2a8f:b0:2c8:218d:4373 with SMTP id d9443c01a7336-2c8218d4499mr8132345ad.10.1782462179430;
        Fri, 26 Jun 2026 01:22:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:22:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: mtu3: fix system suspend failure and improve gadget PM
Date: Fri, 26 Jun 2026 16:21:50 +0800
Message-ID: <20260626082218.2750459-1-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012301_138281_0C8AFF27 
X-CRM114-Status: UNSURE (   8.49  )
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


This series resolves system suspend failures and improves power
management in the MediaTek MTU3 USB driver when operating in gadget
mode:

Patch 1 fixes a system suspend failure when connected to a host by
restricting the active connection -EBUSY check to runtime autosuspend
and performing a soft disconnect.

Patch 2 improves PHY wakeup handling by conditioning setup on
device_may_wakeup() and restricting it to host mode or runtime suspend.

Regards,
Fei


Fei Shao (2):
  usb: mtu3: allow system suspend during active gadget connection
  usb: mtu3: condition PHY wakeup for host mode and runtime suspend

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 drivers/usb/mtu3/mtu3_plat.c |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


