Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A4FC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=; b=p5lVM0JEmNE3O8rR0P9Z9V9NST
	10i+ND4BNVTd+mPOnc92g4EzuwkBA56ekIgZjtkS2BiWalvWCbhSAJWC4qZSl4gK+obGDjQpJ+bAY
	HkoPFJTj6orb1B3tFtAEmyk4pOXwjRVJ8kx+p2abUUcbA3mRMf92qgNwhUod/EHDsEfAeJ3GceoCM
	/QhAXc6oXcXOqYYIS4eldKAPCAToWctZOzDRLBkQbljCpAf/+DYcch7wzv6h4Vw75+TtGOtZnnxf9
	M6jaRaXVe1nXJwP4HaNKyts/RflfhUijXH0DuGBubPPtsk+RuaAhFND9c2U4mNWBdy2XLYfyv0BD6
	SMFodJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM739-00000007l0s-0iXI;
	Mon, 02 Jun 2025 15:26:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wF-00000007jyp-3j3R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso30666665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877538; x=1749482338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=rFRWnu/FEx001lC8+ZFraUVq/z2ma88x6PRHjSt/1pZAkGHQde1vCyMieTDv61tX5f
         zhld9LOLxqkEPk0aBCPG8gXXeKT9vdMAtF16cDuEpKhWQ+0b52TM8A2kl7lF2n8EvsYh
         YwXGyhYn5yw0yEvZYLAwHaY8QPafwskztmokzFZse01JtKv+Jp1nkKFobt4FzITvWmlB
         hQzZs6jjfKbk3zRM/lEnTdJshrgiyYGMw/JnSxFVRqbfYuQfS9ZkzjeeAKrsKSRWXwyL
         oWF7uBtGqklBZhVAzAYvfv5F4arE7bd9KYTUqkhfkO76e2+57HxFO553ZWyjuwz5v5Ef
         kTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877538; x=1749482338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=GGmp6CWBGkLJmQfqz4+8EIGekPHcgJt2dP304v8zVCOAL09BjajDoL8aAJqN4PlNgr
         jtUvuQGs353OHAhM/LduCGBKhM5lTuqiLw0VPsDaz/IphImPDRvBH9UWHykcRC35JQbM
         IkEgJudNxHbNsormAOO90UWhfzEFbLAhfM46B7Arn8QJoFOum/PRdnkF/7IcjcSfog49
         8O3dC6H9H14w6JtxTUoSTJ+81UElzfF8XCQ6VFSAaK+vKR4mMGl/+8vl1JkddyQHVf7E
         zIO+hXKLJeuK3YUVSJjdx3+0+xuwgZupoTZS3T1I22hGXjxXgUDYN2beenxRukYhSruS
         82cg==
X-Forwarded-Encrypted: i=1; AJvYcCWSPc7loC+WJt37PAHKH5MpEdytWx1Yk94Ik9naSdIFjntmgIwd9sN0I9aeMAVZeMsOj0PTLEq/lqfNaNb9RPWp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcs+iwURc426JdPeMPEAKU+KWOJI5G5vdVl/Rw+SdKaeloE11r
	jkSauOCe2wfojB98Zg/UTNjLrJd/S0vGs2greefW25LiHVcaTDBMWYjnEK6JrbNeJ+g=
X-Gm-Gg: ASbGncvfMVUBB9devlGwXYAwgmZZFwHexIaT0Ti8nKSPoZTUzy3UDpeNBcCXf9RKKuK
	q8Ly6rjmCKMPQ5kabiddh5Gj57pe23VZUtV0pPMJNHgeKqWKh5H8Rs5YnZxZE8hs+WfHcQMBNSl
	8V45kIZrjOvZ3/pvHMdLm9CP7o0UyURjr1XVCKOYcVA44++2EkZgI8+Ae+gASsZO5zzkovSsfiq
	VZ4D5GSQqT/24sz6voz1kYhwGVqNcuJLMql90EsLH6TeLiYc19AnFsO7OkfoY4V/9Q+OARz2J06
	qCeJ2qc1WZbOJyiLVb2hop7I/hNfOJnHVP2nH+Gx6DIsVcMPWe0CCvXQ5m+Br1IT+vgiJjuLHz4
	h7TVBreyWiMoH
X-Google-Smtp-Source: AGHT+IGd9hG5YHfH76nGmto9bsoX9DJOOYs0jiBYnyQonK2UIDx2uNqiKNlTaeCJzRAT0d46DtaI3w==
X-Received: by 2002:a05:600c:4fce:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-450d886f21bmr129966005e9.16.1748877537630;
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 0/7] Setting the scene to convert the timers into modules
Date: Mon,  2 Jun 2025 17:18:44 +0200
Message-ID: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081859_939483_593671C9 
X-CRM114-Status: GOOD (  24.98  )
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

The timer drivers are all compiled-in. The initial pre-requisite is to
have them available as soon as possible in the boot process. While
this statement made sense a long time ago, the platforms have today
multiple timers for different purposes along with architected timers
which are initialized very early. For example, a timer can be used as
a backup timer when the local timers are belonging to a power domain
which is shutted down, or used a watchdog timer when the counter are
shared, or also as a pulse width modulation counter. Another use case
is the platform user may want to switch to a timer different from the
architected timers because they have interesting characteristics in
the context of a dedicated platform (eg. automotive).

In some existing drivers, there is already the code to load and unload
a timer driver even if the Kconfig does not allow that. It means, the
need is there but partially upstream.

There were multiple attempts to configure the timer drivers into
modules but it faced the fact that we were unsure if it is correctly
supported by the time framework.

After investigating deeper in the core code it appears we have
everything set for the modularization of the timer drivers.

 - When a clocksource is registered with a better rating, the current
   clocksource is swapped with the new one. The userspace allows to
   change the current clocksource via sysfs

 - A clocksource can be unregistered

 - When a clockevent is registered with a better rating, it becomes
   the active one

 - A clockevent can not be unregistered

A timer driver can be loaded later because of all the supported
above. However unloading is unsupported because a clockevent can not
be unregistered and that will lead to a crash.

But if the timer driver has the module owner set, the core framework
will handle the refcount correctly and will prevent to unload the
module if a clockevent is registered. All the refcounting is working
in different use cases.

 - A clocksource is the current clocksource, the refcount is held

 - A current clocksource is switched to another one, the refcount is
   released

 - A broadcast timer is registered, the refcount is held

 - A local timer is registered, the refcount is held

Consequently, it is possible to unload a module which is only used as
a clocksource. As soon as a clockevent is registered, the refcount is
held and can not be released thus preventing the module to be
unloaded.

That mechanism ensure it is safe to convert the different timer
drivers into modules.

This series adds the module owner in the different driver which are
initialized with the module_platform_driver() function and export the
symbols for the sched_clock_register() function.

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: John Stulz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Saravan Kanna <saravanak@google.com>


Daniel Lezcano (7):
  clocksource/drivers/scx200: Add module owner
  clocksource/drivers/stm32-lp: Add module owner
  clocksource/drivers/sun5i: Add module owner
  clocksource/drivers/tegra186: Add module owner
  clocksource/drivers/stm: Add module owner
  clocksource/drivers/cs5535: Add module owner
  time: Export symbol for sched_clock register function

 drivers/clocksource/scx200_hrt.c     | 1 +
 drivers/clocksource/timer-cs5535.c   | 1 +
 drivers/clocksource/timer-nxp-stm.c  | 2 ++
 drivers/clocksource/timer-stm32-lp.c | 1 +
 drivers/clocksource/timer-sun5i.c    | 2 ++
 drivers/clocksource/timer-tegra186.c | 3 +++
 kernel/time/sched_clock.c            | 4 ++--
 7 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.43.0


