Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A0310FCAE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tA3CYuQv2XiQfD/33D614etMn9c8OW1fecXvIS0+Tb0=; b=H/hWzhCqIqlSAN7N/E5gKxqmNG
	E7auzrj853MgPE1VUYHxNr54PLW0YaomyaRI6vbI4jXfZyXIO+uDm6P4nevPfmXdmBkvxXsiPa+vL
	0TbhNGKDZb55nAyeqsuQz9xXfi4FQ5Q1rtq9jfvylUNpwolBNQ24ZowirLhaCbvk+RoXfKe9wKXML
	0BLPkkfh+Qm+/APqCizPxewpBVKvPibhpJhdzcaztKo5rSFUdnv/Ami9DMhXxcNaDKCkH++9vd1H/
	jG6aszU7BI8IWlxeqX6qKcgDLRd5xi55GgXpV7RvkJe5u/hJBGdQp/HI3OLIhR18FrjhONs9JY06r
	S2x4XRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w837a-0000000G76u-3jlK;
	Wed, 01 Apr 2026 21:29:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w837Y-0000000G76B-3Xwp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 21:29:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so60320a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078944; x=1775683744; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tA3CYuQv2XiQfD/33D614etMn9c8OW1fecXvIS0+Tb0=;
        b=BRmr+9eycF5xrfnfd6epMLAgAXzTVcceybYLbgFVj1/d1WA1jUEehCN0t41w2l4vgc
         bRldjnHg5bTI02lEva/OOQX6Fn9KRU0PMgfmCewhuW54x0kb5Nj2xzuPf+RGxsuxIeMK
         7RXEwswKzE2ooMnqJYFjUH3oO8c7HfzZ255DQilVysrH20G9Gd9e7lFop8jSnMm6tNAH
         BHzFT4PkgGY0O8IPpFQmWIEeNcAtb+Sdx9i+KUlHv8LMvWVJSo1CbJkqukkOgUGLTUYL
         WYNshtE19M0k1dXMy4QdiCdLiwdSb98YsHMcBAOJ42TeJ9MOnLpbRHJKMDEPamp2WDgE
         DAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078944; x=1775683744;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tA3CYuQv2XiQfD/33D614etMn9c8OW1fecXvIS0+Tb0=;
        b=Ol6qlTb9aJNIWPhj5wfQXYT4TQcB3JxIIviwXG42rYrG1KvHt4ELop/B1LEsGsB2yV
         isnwRKD9Q3cvNYhX1wlbE+zqvF+IG/4R3sgCtJ/GEWllr8WhS8HSv/qYvD5VhgR3wpBP
         Fqs5g+m1BCSp1z3XFNv/V4FQlocWRMqxn1tJEf7Ubr1x8yd1lDp8xK80RLLs8I/RwE9Q
         x1YXgZZbbK+7kIpreuhbDy9S0ROl6XFtOXNCQKm9nlzGK6waE8S0vjTJoe5KWeH0xtSr
         K510OZ1Tp2Kb/fyO87MND80SePAqCED898+I5IfWaBnsP/W7uSV3mtTsCgAlTLoRoft8
         Rj5g==
X-Forwarded-Encrypted: i=1; AJvYcCWn0N6hm15oH1oaTQsGyFBmEO4fIqFt9Y2YDfrQ3QSuAz73DynIVyHoTGbbPr6XUZCShwwlfa8K2T6BYjtjjTUI@lists.infradead.org
X-Gm-Message-State: AOJu0YweKgN6RnAzFtTahtTPsWvWoZtqZhTxJlXT4eHoZkKaVa5T4pCZ
	PaoIod6UEY0ksYWqSxQ+aDckoDZY9z5kgctZoxzzVmW3bmdXMg8l+OIsl+8qxgruNPI=
X-Gm-Gg: ATEYQzzwVhwtnLvAW5GyVpnrofvHC+t1Ly++PxNdLh4jsSGGNW2XRB/0bOa5y+xVNcB
	4rXkEzDz78+obxoxTpKSUviLBxWXWON1/ETIyBP8DrkFJyGkCkIHQCqL/SndJHnrdc52B4PLVYF
	t/Ube08TmZtzwWI2CdyprBqFz7sI3JlXzzLVGoHQHGSI9jM6zYYnpPPGWN8Mxc62Jcbq8cXf3v5
	x/v2s8g5EUjECQ0bEtLqI8eUqQfxnhT3lzvrmuSRcHbYT+YOWECG3vkaVDZ1GaVEOGb3eIXxpdA
	p0zcBg/fU6zK9v2qTjSPUugESoO/wSHSjdqKykzwAeTo+u/7bboNdEsMgU3qQmrwYOuX+2NRE6j
	5yX6Hp86cZ8+6xBCBr3hGfUCCBFR9sIOYb3w7REQEJL0dBQE+Y2cSrdV+IoRVUgBtI2u2ppcMXE
	52k2hYNBMHdmOdbatEVf8=
X-Received: by 2002:a05:6a20:734d:b0:39b:b35f:2eb5 with SMTP id adf61e73a8af0-39ef76c1b2emr5611986637.41.1775078943866;
        Wed, 01 Apr 2026 14:29:03 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c647792bsm822742a12.6.2026.04.01.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:29:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: OMAP defconfig updates for v7.1
Date: Wed, 01 Apr 2026 14:29:03 -0700
Message-ID: <7hv7eatlnk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_142904_882817_453A8B04 
X-CRM114-Status: UNSURE (   7.41  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/defconfig-signed

for you to fetch changes up to adcf290f9de2fc4768e5ba07c700e91faf9c86bf:

  arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs (2026-03-05 16:45:57 -0800)

----------------------------------------------------------------
arm: OMAP defconfig updates for v7.1

----------------------------------------------------------------
Andreas Kemnade (1):
      arm: multi_v7_defconfig: Enable more OMAP 3/4 related configs

Kory Maincent (TI) (1):
      ARM: multi_v7_defconfig: omap2plus_defconfig: Enable ITE IT66121 driver

 arch/arm/configs/multi_v7_defconfig  | 28 ++++++++++++++++++++++++++++
 arch/arm/configs/omap2plus_defconfig |  1 +
 2 files changed, 29 insertions(+)

