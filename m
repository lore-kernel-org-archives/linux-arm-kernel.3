Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D0C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=; b=3CmWVeedXvc9qa1eS1C8HIQy8K
	3owBpgedUH9LbjkJCKA2P47b+hoays1voJuIisY3PmClEVZIpdm1d9EWiw3F4i6PBHpUNvv3Jhyr8
	hY+Cz4mZgCjFfjq+Eb0UFkYGhhnzvPlcciE+3GJ2eALPLj/94urrkxzsVFJxkSVC49+sFWxb3PWds
	qqER5UZ/EdpaAtt2WVw8mJ9fSsg3hxxAudVd65yr+PhD1pM81gPiUV5a25ldkKJDmFjJSdycNBZeg
	NS5u2HSYzUoVvpEYxOHb006WVkOa1UZVVRfobgCBHj+s70oYn0xTUJX5yG8qCZ+f09q3+AHQ0F0DY
	OxsRwW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7II-00000007nTW-33R8;
	Mon, 02 Jun 2025 15:41:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wW-00000007k5U-1oQm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54acc0cd458so5607899e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877554; x=1749482354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=GJW5l/o/7xlbk+vhmyU3xYqFA+CnCdM62s2lhdKT/rEjRkJs3T1GlXVAYAvNZF8D4h
         pt65HZ6VCZvKca3osKPfI0PM5jRCHNhpoYPY4ZgDm7acA5uv5RrbqPG1lhOk/tWc6Zt+
         0u41iBPtkcIfRGcHxJLVVpAs9/Tw5VWSjfXA6Q9i5UqUSgBPKeoEkXoKgeTJ2PfnYj2e
         PzBUtLitRaAQtDPGqJ35y28py0UJY/BtS6y+xm7eWep2zF0ytvXjmWxgHvMC6p3hacJd
         RwWmWykRXQkcgDgJizXgM+YrcfX8mf0mO3cPXUp2aLFoP3T1wSlpctwpvpQgEy3xNdKA
         /WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877554; x=1749482354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FRnrLBkBYHmFUuH4KGx1nHshhZCeSgrXIZ5dzYfvU=;
        b=BvDOYQJyRFZMNZBwFYx4RjxNuK4714d4VlOQVt9Mmg3kGGrZlqVBxmWM3CTtS/oCSb
         C3lmWHn9ECaTvDWm1Iao/TOTJR08CPjybCorqTeNKWqDHXqh08GiDMp5JHDZuwGGCIpa
         q8K3/B7NrCp1k76icN6kR3nbyWOpY7vS9bKPCwWrA8I9R/JIRks3aNEOKTH9TLVFr/rC
         tPnOGDLoeTmZSxKFjDbBb/hWffdeE+kUlZd7ATLgA5mbFSN03UQFIs8RVNQJPBp51vHb
         5f+mifWEvlLx+R55h3/hcUc2ppZAPLPOBCpV/fX1GrKzn4qIK2mjV8TxB22eMqCQ1wjG
         xbhg==
X-Forwarded-Encrypted: i=1; AJvYcCX3oEtFaH1EqyARGQrtei/PTM+ZrHZjCoTfAATAlX2rke1juc+9PG+s5TRgNVrN73fcHXD2dC5I9V1NVbYMHHz7@lists.infradead.org
X-Gm-Message-State: AOJu0YxUL6M2EiTwbBZiSqQV+mM4eiYcdCI9yrrPYF45NsdIq19u92pf
	Es9/2J0OgkvhQZfofovGLkIgX31BWRlJU48AlgPejVciSoRjgOQhX4KWl+6frLCVcrozPR322Gt
	Ydo9R/1o=
X-Gm-Gg: ASbGncuSY4zBgfjLHOauHtm+UgyX/77FjTOLNJR04PLm7A2U5SEtl995Un2/nRKc+qJ
	c0b4JUlmkr9kdXmzGO6SetZhApKoVRcijbbXEI1p7ggPxQlzjupXlE0mkbUpBiJEVArPlDGCG7b
	F8HLoFyEI3QTnhglyyYlXK988guDkwRMue/FqoobvPqgKLhZOlFSToTgN3CGUfSdBmwIJ12rOxF
	6Me0R4tFMFCQvC+BWf21vIDqwL11wfWjDH7QqnCQ2c/t0/0vAKyV5yqqy06P2gUPgPJt6Abjj1C
	eP/NTa1CSNhPo6KQNI2l7Riykd20XCMyab3zhTcxIMANWA9sDHtNsP2qogGRayH2SyCzcccNyRX
	hSQ==
X-Google-Smtp-Source: AGHT+IE+SpRjISuBJ+0qyPRe6UZcsVpz/N5qpzBFRSza5rkSFVM1NCoj9ElY/SVHO3bb6cTtRiaJ4w==
X-Received: by 2002:a05:6000:26ca:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a4f7ab515fmr11075338f8f.58.1748877543609;
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
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
Subject: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Date: Mon,  2 Jun 2025 17:18:49 +0200
Message-ID: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081916_472530_E4D67640 
X-CRM114-Status: GOOD (  12.97  )
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-nxp-stm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index d7ccf9001729..bbc40623728f 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
 	stm_timer->cs.resume = nxp_stm_clocksource_resume;
 	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
 	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	stm_timer->cs.owner = THIS_MODULE;
 
 	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
 	if (ret)
@@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
 	stm_timer->ced.cpumask = cpumask_of(cpu);
 	stm_timer->ced.rating = 460;
 	stm_timer->ced.irq = irq;
+	stm_timer->ced.owner = THIS_MODULE;
 
 	per_cpu(stm_timers, cpu) = stm_timer;
 
-- 
2.43.0


