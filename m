Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C87C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=; b=PcUyrLEOKclggmhk660I0GekVJ
	OSKTM93FSgZsUysc4FysWt5f8jzAK0L6MP1JZIcddRGFv7fDGJP9iWJWSTccSiOWGTYy1W5xazM2X
	tvMGD9QsaqVlXiFN6qqkaUvZqZXUNHDf0nNg5CiwhXn2WMf3kNqeqXGtYHLBvoXd0O0XLtpn3DB4x
	atjHKdC6x2/7v9DNpNKi9E3K2Nom7HbAXdsUxsaA5HX/cfpIdztujyYRCPP5tBW5cwPEHme1DMo5H
	UP0tWyvJvk4sduhj0bR3SG9qL9gG0Ne3Iq5MJ4jbw1gjbOoO44w5gC5CjHyQD1rU9pXH2korQhg59
	4sRYhOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaM7q-0000000FwoP-21OS;
	Fri, 11 Jul 2025 22:21:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwN-0000000Fw1f-14xi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 22:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=; b=Q13sweHCptS7XpvpgagPjfpqDj
	OnGVV/GIaOBOxXj/CQM73IaQby+5baxzqvcGo6bFKquDnR+Pe7UL8CvtVvAyqwHqg/kY4rd/w6au4
	PQzPSXDqV8PP0lgYLiW8TZc10PNp7YEluOAN/lXo8de5Q6vLqealJQHYzQEAdcjuWx2e39JdZPz3S
	BVWrd9ISJoeSfOdDWFFJicOdzChtjgt0Osg/C+zMOkbJm7nQq7qsrUnu9T8WxTsP6fT78Ft3lbTK1
	V8eLd/rmD5pOgv6YbN1hjCJTTUBNr/RFi1BsQ+pNNEwJhI784Trb6O4W8Q16IeUIzZ6w0fQBvpYy8
	9jqkw2sg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwJ-00000009MtO-15Fo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:09:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1358684f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271794; x=1752876594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=htHFSpLBTdhNoyDYYB0fa5h9u7uS9H1ySxTVf+sJ/9zDyzIwCiNi0rQ3/bQon/sTR4
         tKK4IvPmhACijH4vVQfiQbL+0QrSoPyRn4yITBTsM5ScS2IErXGHeLgSdqWCvVA05ptL
         J9w9EdIAdGU+SKkOd/pHR6PbfbWhjAwQvKl+OVqK+01vv1hcKnnHFtPRKlRajFWMQrDW
         x9I7vdL7iY0/FBmEe+U0xs6a9NPwzuEFZZktPo3Y2wrEo9VcAVcTtvvhA7TRrJoNoEXN
         ySXkGpfpdmCPZJM6MF1tYRs3tZbA99c/OC9VE8h7WOgv/+61Hmy1MbV51dcw91lD09Rf
         4olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271794; x=1752876594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUDfhSJE8vypj2jOQNw79mTid7Mo8GDTdgpT5HJAMuY=;
        b=nDFSQylRlbYRpHhi+WTUa6lRMy8UstbXayJ03l98YuB5o2kooDuoNMSZ5qCJXOIVqT
         v+BBz8PMj8Y2ih5VzzMhMAl+4sQXqlERkNqVyyskomUG5Jl82m3l06sEnryUqebbtjKn
         9alESnajv4OOOXOox0FNqOxQqU/kxWYLm/PotaByMdzX1h+yORRQOJcBTUkRpZ3jTJl3
         rJCxkdpQUp6O6SxEtp/tnYiiWlZo4D06RegrgLwrXU8EN2Aw5WqspHStRe0HE2PqaLxL
         f7IOct/wGeeCAastqU4x9nERdrt/vKgO+HdXu8MwDYnFq5yZcua6L60TjYDxzPa0YsGL
         qPVw==
X-Forwarded-Encrypted: i=1; AJvYcCWQYTxy2FXQrTUTf0ll4h72nZd7hPoNsr46DG3uJfKQhHLdXORL/OzibxrsP6e7xrMX/kBPrP2DmcJahhRt05ri@lists.infradead.org
X-Gm-Message-State: AOJu0YwnT2V9H3o3JkWt/CMCdQ4DD5V7RJ0KieM9H77UCoNCO9t03Gzc
	vUSAJTafmEi6I+/VeC7poJjF9wdsOJYDFa8h3keMgeOcbKtOaS7Cqaaa
X-Gm-Gg: ASbGnctqrkynD66WSikyPcl2j+3wHYeOpxRPLSXv6vAvtwRZ4+lx0uTBu16FI7VB2Ma
	4C8cLRJ3uo4ZIbpN1TT6ckZDtKAmTjqd+e5fHmQzbx+OPzFAqYZAoDOpgmi1Q3cnyJb+nWuh99S
	FCp5zDrMMNsY/3KvyaFodqBsLKlXl8Iko1w9GEdmuXt621sIUcjEpFgQwtW5DTrg0wjMm/+ZQkd
	DBvr4J/RQoLdwZgi12yipSpzsT5eXzxoRlN5nVPNm/XBkKev4OGvkQIrlkVzpziGr8f741F5EK3
	ThBahu52v6QqNgo0thhkt/q6VagCi8gNNSsT6dowNboa58Z84LoEglImDgagmmK9FP2Jt7YcKVj
	IF5LHetzVN88siiU9FuW/ZB5Qq89YFYbqbVkfuIREMLdiTEavPxQELQfA/XkQLWCwA5fh3/mzB9
	xtcQqV5w8LsaJ1FA==
X-Google-Smtp-Source: AGHT+IFrfogdrgCJD9N76R6dzps69tuCBPv2TcIdLoEKcZbRZKlsXRZeI4f3CBmq7rSlADwE0IUmWw==
X-Received: by 2002:a5d:4389:0:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b5f18cebf9mr4138320f8f.37.1752271793586;
        Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd54c512sm59580125e9.37.2025.07.11.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] memory: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:37 +0200
Message-ID: <20250711220943.2389322-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_230956_493109_5366C103 
X-CRM114-Status: GOOD (  11.58  )
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

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-memory

for you to fetch changes up to 2401dc4dcdd02920faa9a8c4384f1503a15e779a:

  memory: tegra: Add Tegra264 MC and EMC support (2025-07-11 16:49:42 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Updates for v6.17-rc1

Enable support for the memory and external memory controllers found on
Tegra264.

----------------------------------------------------------------
Sumit Gupta (2):
      dt-bindings: memory: tegra: Add Tegra264 support
      memory: tegra: Add Tegra264 MC and EMC support

Thierry Reding (1):
      Merge branch 'for-6.17/dt-bindings' into for-6.17/memory

 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++++-
 drivers/memory/tegra/Makefile                      |   2 +
 drivers/memory/tegra/mc.c                          |   5 +-
 drivers/memory/tegra/mc.h                          |   9 +-
 drivers/memory/tegra/tegra186-emc.c                |   5 +-
 drivers/memory/tegra/tegra186.c                    |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h              |  50 ++++
 drivers/memory/tegra/tegra264.c                    | 313 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 +++++++++
 9 files changed, 613 insertions(+), 8 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h

