Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3006ACA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WeCGbzmbDMCGHEECOh1TDjR3OoHLvO5PyQaBzCE8Lc=; b=zd2enl+OSaY1kPR15a4kGRXOsk
	aaCNddFUE+CGApIlxm1jaWYQFT4NgQXG65ACJ2TPgpqGG21DTdGnqh0rxS2nb1IpARmWNv+oWN/Oj
	REhsAR8N4LWk6MuR/WpMLRRa0Z3ww55KEWI3eXVm4I5NY5X0+6iW/Kg2zQ73o9rtMwz2/jleIUUo/
	JVSL4cOchSnnpebtVA+pgXZcP546zr48UkOZdi9MFg+DxZG6KZelybbShZD7EzqjFx9tMhBsaGSou
	ucb4vMLigOt1tbZLq3sdya3vIvd1fBbnwhMjYzQCE6WhoMxb2aj4jlC9eT2TSf1ltKvyjKvR4jyuS
	Yuf8JRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLb-0000000CfKL-1v1P;
	Fri, 02 Oct 2026 23:07:23 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmLY-0000000CfJa-0xz0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 23:07:21 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-3396cec93b6so101535eec.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982439; x=1791587239; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2WeCGbzmbDMCGHEECOh1TDjR3OoHLvO5PyQaBzCE8Lc=;
        b=FR7GXdLKtCmPXcYNqHowcmMLsZ18a77XOzC00lY/rZ+JpkpSP9MwAySgMqqZV5Rsj7
         DI8yfGpQrkiQe1k932cyUPebZdn897XBYoWApMvC35IPJZ6xrxvjwZo7v3tBOhwtwVW0
         RPNAk9XRmbdN41fsC9DhVzkD/pjIkugacheBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982439; x=1791587239;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2WeCGbzmbDMCGHEECOh1TDjR3OoHLvO5PyQaBzCE8Lc=;
        b=t08UPmXOtsAECmCV5xL31KgPZnaR24CbjewUDQ7vKlcuDBVlwawnRH/+UDxbq7k9Uv
         Nys5fZaaVGdGCD/3Nj3CXbg5noLwobXy+FiaZBGr4ZBTz/1BMxJR+uWwGcNcH+AF8XXX
         iTjH57OiHdrZgGO9TtV/SiOkLtjITHbZhEWmJglXWNYm5o7plLwast2DY5zwRUWhpR7K
         Uyn13e16jbhHQ8s97vEoKUO0DfrzlLD0ANj6p5zsrVUqgLbPqqA5x6NzvA/l7JaRn7Dy
         o9WvQlVGsEfg79CDOFfnGmAGUJtuNeiusG0RjV8iw+K9X69qnZ/wBa4Z3m7m9W/kNrvn
         djGg==
X-Forwarded-Encrypted: i=1; AKwUvBxN02D+pDOwF3JsCFugC9EL+s+c3U1He/CqkPkPkDewKtR4fbaSnwQG6r8fHcDS116UWMT1uIb5qtg24emjEBZ0@lists.infradead.org
X-Gm-Message-State: AFq9FYK2qKuO2d1xZ3dFiw0wj2iDiKEzgcofV1BBBrpRcHFomekMOhwQ
	XK55PxmE/IWUJb2qrlLX7JdZY404d4ercUwsvXfAUQg4zuO1eLdJtIIMni/swP6nKg==
X-Gm-Gg: AYBFou04iEwNPKzIPPU5dqeAm21tn2mIbQweFZxFbZlBGtKOYk71SoZYYCLurkf0Nvy
	gid94lr2pSD1OF9yEb6hxb7XmUdFk0PeRi8M6pCjNb8zE0NrcO9550BmMl3t+WkBZBwz16UXE8V
	uAw8Oi5ebqVwuIlMjHfTxN9hrjG1p+MlaM1Fvrg60xkV2I9nzuztWLyO8cVhJlp6WnPUCtc0whu
	pQH3bq0tNfIBugp5cvGnR0BqAIBQHqoOkQdoPvC8HIZg6sKrBnj94MkhoqmX+dkFlJ0iZNEbK+l
	WlBd0RU6WSn+/0MHmWrY3m9LehUQmxNuGrswcrh8P91sOOQv6UMCTaS5gZomDdvXEhQ69SVOHzH
	af0amGZ9FnhUkzboNIx2REfFVA6yX/P5qsnVUu0TDama82tuwaNib4+RNA2Nvdf0hrOYkefymHV
	TfbzbVy4IBApdlVpULoWVQqR3wkbsJoKiZ0gs38HKykEOCD7K2K2+V45BdfjIZRzZVgDh9ExiGF
	QczPQvEIh7GNuudbOlp6K+88bC7rPQtwCflHw==
X-Received: by 2002:a05:693c:83c3:20b0:33b:f5b7:f494 with SMTP id 5a478bee46e88-34f1509e567mr5123379eec.13.1790982438582;
        Fri, 02 Oct 2026 16:07:18 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34f14f98527sm8357014eec.16.2026.10.02.16.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:17 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/5] PM: runtime: Improve autosuspend child to parent propagation
Date: Fri,  2 Oct 2026 16:03:04 -0700
Message-ID: <20261002230714.507921-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_160720_301018_74AC1054 
X-CRM114-Status: GOOD (  14.22  )
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

See patch 3 for the primary change here.

In short: today, children can resume/suspend without extending the
autosuspend expiration of their parent. For parents where their activity
is largely driven by their children, this makes it easy to experience
"premature" suspend.

Many .runtime_idle() implementations seem to try to work around this
problem, and one in particular (stm32-adc) documented their problems
heavily in c537d3457542 ("iio: adc: stm32-adc: fix runtime autosuspend
delay when slow polling").

This is an attempt to improve the PM core, as suggested in review for that
change:
https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/

This will make it easier to simplify many other drivers too, as a
significant use of .runtime_idle() is to simply extend a parent's
last_busy timestamp, as a proxy for "last activity performed by a
child".

The changes:

1) Preparatory fix, noticed while making the following changes

2) Because the last_busy mathematics get a little more complex, I have
   to change last_busy to use an atomic64_t type

3) Propagate last_busy from dependent devices (children, consumers) to
   their dependencies (parent, suppliers)

4) Add KUnit tests

5) Remove the pm_runtime_mark_last_busy() workaround from the stm32-adc
   driver

To follow on with #5: I believe almost every other .runtime_idle()
implementation in the tree can be removed after patch 3. (There are a
handful of drivers that should just use autosuspend. And perhaps 2 or 3
other drivers that do other non-trivial work with .runtime_idle(). But
most are redundant.) I may work on that next, if this works out.

- Brian


Brian Norris (5):
  PM: runtime: Only queue an idle check for RPM-linked suppliers (part
    2)
  PM: runtime: Convert last_busy to atomic64_t
  PM: runtime: Propagate last_busy from dependent to dependency
  PM: runtime: Add tests for last_busy propagation
  iio: adc: stm32-adc: Drop runtime_idle()

 drivers/base/power/runtime-test.c | 101 ++++++++++++++++++++++++++++++
 drivers/base/power/runtime.c      |  29 ++++++++-
 drivers/iio/adc/stm32-adc-core.c  |   9 +--
 include/linux/pm.h                |   3 +-
 include/linux/pm_runtime.h        |   2 +-
 5 files changed, 132 insertions(+), 12 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


