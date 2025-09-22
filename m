Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F045CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=; b=TeModVRMiRdv5um5/c0q2bGi/p
	Wc4XR7wPUV31L9O5r0AlXC9PIeMQo5Hd5nlqYAHVQor228/WGKUHho91d76FMQpD/cYt05HkolWPA
	Mnpov+H9XW7/RDJvw0wPnIuUSsLaZTSzSbzHlZ/uc0ihJBQo73UHOUQ4PUTDIAltQpCL6G9GTMmXz
	Sls5v4fOM6T9BPhEnv5L6KNLu+g1azQk70z5e8ZQ4Ym8JQsAfj74aCyXBQ0VvbkA6BcYbDMIUYZGa
	coNH6uRUaoegjxld0/gvIVGwYRS2LI4ENX7wm23Q2sdVjpx7uOqUSfW+U5ERMYv+bayZwYf3kpeBp
	qR7EesLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cuq-00000009tbI-0RdE;
	Mon, 22 Sep 2025 09:33:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cum-00000009tZb-1gSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:32:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45e03730f83so16980825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758533574; x=1759138374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=;
        b=cwHq+RgnZuVKH0KNo36IhSMRpH2981VcE1i2Qlpqxgg6LE5bsZ8RV0qK6tk4a679Bq
         0T/2w2k0ZuIqLznHNGMff0bQFwazsqElO+WyhRv8s8zwlgePVbn7ReOW2OaLgNJfgEQT
         RoGygA6nXS/YZ7iDtguvadw6LzvASBTc4YSb1RBUJDphvtsfCkS/6eHBUPo/ZNG0Ew4o
         i8uaK1EZuSo78SN0di8k1YgmvQkyHrylJTEXq6jjL7n0+Rp03x41mmyF7QJttw83a7qy
         VFblEBBzAoH1th8YzTHZQVrFKSbr8BuD9bFVANZECHQ5mK5u6yWxepRxmI1MukZ8+RE3
         GGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758533574; x=1759138374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhHEebbyU5CnpObkeR/WFFbKDX/bFW3JYSJRh0+BuBk=;
        b=UvYgu/vBUtWsYH3v5mJDYccoX6rxFFzznRc3ByczNegAyTeYy2BOkJI+RIObCMiS19
         /RrmOOBUvZYlMYTgGFrBGd2asjV/Hc9wT51ycyWUkjNf/y8MtH6evQQCfLE+ifB6EZqc
         OW7G4HWMr+sR4Tnr66HMF/3BBtplyTvSe2JxXD3FbvODbScPRYbBuVBrle3HAhYEfI/v
         /+p6oyEAcLpTYx7eeD+p6nwxkojmgVe728/+V1EQYNMe1MzHfZ5OoMYnA8UCG+eVWEYJ
         gbXv7eBJ/jy9D3ntP5L7lzHRLh3z2nfRogr3ztfdXjdM4OC/c0xV9wvlOYPlpBqjtoVY
         tcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe81sMEByV97GFiuMlx5LIRryc1a5kZosNkLizhPmkeIj1mgS5nFVJ5FS/1SpJwalBFDoIY2PGs5mql0NKnneC@lists.infradead.org
X-Gm-Message-State: AOJu0YzFDK9evJdapoQzDlsZJUN0erNHJ4I8jFH8ahUt3mp55FQLG2X0
	2HnYBSlGOqoV/DRk7DabuNwnHNxPKKEHSxj+CjRykT3nlu+dGygLpPG8jtYTzLDZMSz/7ztiD9w
	NUT3d
X-Gm-Gg: ASbGncvccO8d+69Q3XIhtBJe/QLIcs2lULGLmqbD646Zk0VrXLoXvDPcKQtBVlaLFHs
	IZfSqfSZPLEYj3MtUs/5rBjMhxG8dPTXQyybqOZD4+5dAQNNQyBwMS7hK4VbGyKUQ26gmXim0oH
	p5rAFmp3A1V7u8QF5AztdGjBqPfV20iEVHzkiT5uPrXP9yLjIyGVVvCeKPWZTCScLXqzUrYPPmN
	tHoF5l8bcGWZHYfGA/zOAXv2tgzDM4jeuE8RZPi98AfvrIiqfNba3TehlgXYJcD9PeZCdh3VWrN
	cMnA7H7c9JTo9tNoh55OPl3bPQgWW3Op3KXcxZDN4eC9nARL6NPgAE9Ot0yUbrd6k66KqwZv8dg
	cZSYoDJtHeu81w4utE7BhbvDq0uN130cO3huoFCCc+za5XAk=
X-Google-Smtp-Source: AGHT+IEB2plkqqlj8/pQzKhUN/RKf5fQe1/aelYENrRva9JJezB9Y4IB22RvtTC11NF9vwVMxX6x3g==
X-Received: by 2002:a05:600c:4fd0:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-467f0871186mr116478715e9.31.1758533573752;
        Mon, 22 Sep 2025 02:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm19735964f8f.37.2025.09.22.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:32:53 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH mt76 0/1] wifi: mt76: replace system_wq with system_percpu_wq
Date: Mon, 22 Sep 2025 11:32:42 +0200
Message-ID: <20250922093243.140946-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_023256_466339_187E39F1 
X-CRM114-Status: GOOD (  18.30  )
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

Hi!

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

        "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
        https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this series is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this series ===

1) [P 1] Replace use of system_wq with system_percpu_wq

        system_wq is a per-CPU workqueue, but his name is not clear.
        Because of that, system_wq has been renamed in system_percpu_wq.


Thanks!

Marco Crivellari (1):
  wifi: mt76: replace use of system_wq with system_percpu_wq

 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


