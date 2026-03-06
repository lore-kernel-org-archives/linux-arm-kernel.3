Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F886F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wc96x2Km5MRcB3LJal5Kw6RV2T1teZ1rXwvu8I4aDs=; b=izBe9ufdKQHSS9YkmWG01QkmgK
	15b2clhH/esSB6D/F5nSCfX0W6JGYVDxEL1pWK23O+DrExDnF5GrDi1BvpcodP6aJy7ylH7HwSmwe
	mDacsjoUwxAHaF5XKN1+s+MXITJiPDvlbkL25rKA6nyFcl6BgfQCCaUBGnl2tAdK0cY6YliuIXPeY
	H02K1a6x9ajA4Bjugf6oxokApMgv/vURTadwDtNYxD0M35riy/hvChlAYMNmENz+zlh/zLzwuex6K
	6dSRL94AhXCHvlEeiuPTfMQ121k2wLgs6QQp045yosiK/mGhjg0yHQASQfAZ6ku7eVuu+AMYkrK/L
	3362HQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySfR-00000003Umg-10MZ;
	Fri, 06 Mar 2026 10:44:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySfO-00000003UmO-1rHr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:44:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a13323ba85so2096994e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772793860; x=1773398660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wc96x2Km5MRcB3LJal5Kw6RV2T1teZ1rXwvu8I4aDs=;
        b=d55uXomp4lbJn8MOWIcCq+5iDz3aGZKCv+8vBV7GZyFdMFLCF05wnC83MebiAhyYSd
         enkIYFqhbOsldez4lortN/jqTBixmvET1hm8f4za4Tr1JsHWIfNYmDrsic4bwI77u/cV
         ffQkH23o8NzI5uD0RX87D3R9YCFQ0Eb9Ho3UbwK+suiiuF6GEu1whQnbWSHSr7WXrvau
         Lsp6pKg28YppcOouvQ3VHCFqnDESyKYX86xqfKI33VHMf4KknkgjjYArvKBG5srZ6ysX
         Y/5u5FKNW85TUW5y8HMObKm+KplZNfaBrV2z5NlSMKBMkCJP2Jd5f6bBh2PFdVnMfY+t
         DKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793860; x=1773398660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wc96x2Km5MRcB3LJal5Kw6RV2T1teZ1rXwvu8I4aDs=;
        b=uTLTUXQ++hr484mFjEyA4VigUVOCgCnt92UuzkgBtheyH9Tql1Cj9Y3h1+vaCWfctU
         kyJzlCzc+9ivntJDy3Ki35pq2ohARcJ9yUKklSI3I70EEPjB7DRNIb0Ifx/zp9hC+Z4c
         iRsZ5crptIdG4pM4ik7Qu0c1v7/n0LEG6s0nHLCUiFYvGnNMj0uh1/QNv03JNlTdPw/W
         h3H4h/Ht4ywHXdnaO4m2bJqXz5b8uYmQkl1zre2kSwIYrIWIH3s/yeHUiapV9CnayELe
         PhH+wkgsuWp5FvMT3vLRJ8l6nNxjF5++N1ltj49xJPzUV8RWfUisN4zG8274tF3EAOMS
         ZsZg==
X-Forwarded-Encrypted: i=1; AJvYcCWXqAzOZdShNkCexwhexYeGm6ZleayS+tZEK9aO6l8Mg1m5tngq42Ahv+pOxxGfYcCBg0UlsCGcYiW1yY3G49Sz@lists.infradead.org
X-Gm-Message-State: AOJu0YyLm5vhgKyXJkJiM7ohmZcfmfQy+mZXLzDcfnmaxUaXIpqZqtxx
	38gqoVEXfEBfbz3aGvJSCtIX6jwr7dwJhkSyYTDQmIAA0KxAXiv2e6OipKKDnhA9TNc=
X-Gm-Gg: ATEYQzybBhgwo5EuTkmuX5eCbxbZCoG83Cxfh8jede5h0qtqGEmOkJgLIF59Zu3AVjv
	lBJHRu6qe9FeSm2vAb1IjnBQi2D8rF688WXgHlQXNm6IMpjNYDVr2aqVgG/u01bB0Ido/+LryIp
	kCMtMeU5MbUMATz+WOpA6wl19l7L3voq/9vBxy0hnrpvaFNcqekwlWHTvR4sbDWYrKH7jRApz+3
	dWtYG0J8+UX2qeKtGkQFFrQy+DapTa/CwTC2SyhobfhzHd+35Hm8LoB1wRv5n2sQBT4jKxkfymi
	2h9ri4m/4dLP7Y7eH3XLZtu4eH7YVUTn2HD2EVkyjGbo5Q/uD2OwCCLMO9ZD/jWCqs3pogbXWMG
	ZrFx3xjFdcJO5JC8ikdS0LvGTjhZeb33DM+JnDNV7U1oNnMOJVv48EqRJ1xppdb06oNDmo5JrF8
	3lU8XtDZnWVLBSAZynlrc7tQ304h2+Xc62sfvs9OKgCFg33LU1zDCjtpDg1pEVEDYhVJOCeCFrv
	RhZ4LbsiTY=
X-Received: by 2002:a2e:a4b1:0:b0:38a:1a50:d842 with SMTP id 38308e7fff4ca-38a40d6681dmr5483721fa.30.1772793860101;
        Fri, 06 Mar 2026 02:44:20 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a41fb441fsm1715781fa.20.2026.03.06.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:44:19 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.0-rc3
Date: Fri,  6 Mar 2026 11:43:53 +0100
Message-ID: <20260306104356.60885-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_024422_520138_F4978CCA 
X-CRM114-Status: UNSURE (   9.61  )
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

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v7.0-rc3.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1

for you to fetch changes up to 0fb59eaca18f1254ecdce34354eec3cb1b3b5e10:

  pmdomain: rockchip: Fix PD_VCODEC for RK3588 (2026-03-04 11:22:36 +0100)

----------------------------------------------------------------
pmdomain providers:
 - rockchip: Fix PD_VCODEC for RK3588
 - bcm: Fix broken reset status read for bcm2835

----------------------------------------------------------------
Maíra Canal (1):
      pmdomain: bcm: bcm2835-power: Fix broken reset status read

Shawn Lin (1):
      pmdomain: rockchip: Fix PD_VCODEC for RK3588

 drivers/pmdomain/bcm/bcm2835-power.c   | 6 +++---
 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

