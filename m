Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14335C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=; b=FauBqyg8c7tbf2eZcPngk/yJQi
	cK/GHSGYi0JqDvUePd3sUtPVqYWbqYRwMY/+7HMDbkOsFb/txiBud0blnksEKZR40MB57K/LbmmtS
	2sH79kulTAmNZvvenIncFLyAv2j0RlcRrxT3cJPliZQEb3hfn6RylgPYWsAthTNWdmmNOPSC3bHJi
	inpTc2pyzoHoRhnAfmDA7BRq6HXdUFic7DTvvJRIt90zYDsd6kzTP3puBLylcCfzE98w3bN02HI9I
	40+NvDTuXOPvQjR+27A9pO8mRjq/nWNTcNg7VjShj7ZUi4u9QY2AmvSDivVPvB4VDMszr1QwxGc98
	ONXPvGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7G7-00000007n1Y-45ND;
	Mon, 02 Jun 2025 15:39:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wN-00000007k3W-3n3g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so33055855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877546; x=1749482346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=xACOexf1WdK+HcW1nGk5MT/NL4qx+qNoL7obaEHajAkF3urJErVAeGg7v5+CMtD4gl
         YcdgkemhEYeoHCtod5ewnovyEG7hoI//uoSZhW7VfqPdTNxkP2S9r1xznHQGwMaKPI2L
         N1+QeHboVMAMKj+rm+4L5UHRk+2KpnASEYw4YFn1HzNNOtPoSBzxQFQuV1tn0IFhdNc8
         twG4wvTyEbZASbTwVEo9tXUe9iPTFBcYAvRoeFzgwqnaQq/NsAEUpu6pNdf9ae1RdTX1
         gvuXxNkT69a5rT120nQ4FZuW+OLcEoY6SkTP6tX++3N1Ck6YTx4Q/s5bxhThaucXhuz7
         98QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877546; x=1749482346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4kATdXtYuRJowbluuoUfq4iaqlYfYT07dwMRu/eijw=;
        b=MEpq8fjsfNaIYxKJS/OzwGryuxx8XN24qqYNC/CfgtX6kjMgl83u0fdXyx+6sLY/7a
         ucNlkSVY11OX9JN1eJYGNah2qMDXUA8i0TZUHE3hFcPQfERHxb0yjn5HSZcl8tfvle6N
         k0mZMT6CQiRP1Vv2zCeoPxkPoFXhe8uupQMiqZuh5y2104QkzWaZoQniiRgqrUxfh53F
         FgKG73VDGTuw7yO91QjfAx/XdqMW07jkbzGsrfNlzqMsxJ/rYfgIP+D7zU9DUunI5tmZ
         8avwapq7YIu0Ce8bdZg4cVIqNgWbMRLjQbPZl9iDC9RltZvr8Ze1W0s8F6lvdlPww2uT
         ESrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/X0ObDRDIkgNz/tgm2VuxHqPGPTuOlfhMj1ADo/kgl+K8T7xeTJfEN5AtwALy906f1Q0nBE/XbjzhqhyD13md@lists.infradead.org
X-Gm-Message-State: AOJu0YwiJpsxICG9a5Wb7cDESOei69d3WzQmjsU+HcHv+Shn5heUlnYZ
	CLA/XHFOSdrrhS0ZG1oBGySnM4GqTGxuEdbNb9fQIa1MtWLXTuwtDU3Q9zEHivUMBS4=
X-Gm-Gg: ASbGncubJtcmpcW/AW2kEwd+ueGswQCx6K73ECtFio66k/jv6bgI66PinlIWth9XgA+
	bMJDkIs1k/S8KD2oRkaOCUjDCEwrqHRCzL+roM2/gYRLKwW2rXU974eyCLyZDUSNz4diTiRKm+L
	0A15IuFmfGcQvZ6W1EtMik4lfxdJNZ3mnS23w7TzubYVGXUxTySB8A1xb1XoAP6AvXJrQIRI9rV
	H3vOcSJDExqVFT2vh36EWjTPtPN1bEVyzanZKrMvSITvkVwgTiTDu+6V/ImyxY6hNumclbyRY9z
	fklPZv2ch5C9g7Qofge+H+QkgJmHy3Mo3rkzK3jtdeCuufLZ6ZbdWSCn3PKBkCSi6mQOS/qtQQm
	F8w==
X-Google-Smtp-Source: AGHT+IGo3+b4mB4bJZk3jsrIr83JxAnU/93JoVte/2RVs9090BDS0xWFY0i+YN16EfaKcepr/Do0FQ==
X-Received: by 2002:a5d:588f:0:b0:3a4:de13:2a25 with SMTP id ffacd0b85a97d-3a4f89dcb7cmr10264360f8f.45.1748877546552;
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
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
Subject: [PATCH v1 7/7] time: Export symbol for sched_clock register function
Date: Mon,  2 Jun 2025 17:18:51 +0200
Message-ID: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081907_956975_2593A274 
X-CRM114-Status: GOOD (  13.70  )
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

The timer drivers could be converted into modules. The different
functions to register the clocksource or the clockevent are already
exporting their symbols for modules but the sched_clock_register()
function is missing.

Export the symbols so the drivers using this function can be converted
into modules.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 kernel/time/sched_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index cc15fe293719..cc1afec306b3 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
 	return HRTIMER_RESTART;
 }
 
-void __init
-sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
+void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 {
 	u64 res, wrap, new_mask, new_epoch, cyc, ns;
 	u32 new_mult, new_shift;
@@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
+EXPORT_SYMBOL_GPL(sched_clock_register);
 
 void __init generic_sched_clock_init(void)
 {
-- 
2.43.0


