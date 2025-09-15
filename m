Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95544CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgsUeyln5jHJQtg6nGIuuJa3omU5ijeYPDC8tIR2gz0=; b=b3slyvObQfzIj0Vtvk2QBLAb4j
	V3DqOGZf+3R9JT0iCWjyuvC13THAd3Ql52YpVvnFkcwelfm4fd23oZPcsrR7rGVBKwupdOHkfxTA5
	O2y0P2Cq0dTLwQeXHRcOTMs9h8wx6tgPOjlpRRjHsncqQpJdXfDpNS/CKhI7SY9+dJ0AQ8MOJk59Q
	DPtL+jBlPnB+hYuwOzsMj/6FOAHjyF02OhNt+1MvCMezGXsRaxZDkFoWMChLSVVu390C2yleUEN02
	zYg/voHHRP2vPWf9RinZbmqBYB1YxuJQCetICawNscJ8MB5wPtopFX4+k7N0HeFPEnCUY4Jfzjwzh
	Bw7XqSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIVc-00000005sO0-33HX;
	Mon, 15 Sep 2025 23:21:20 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIVZ-00000005sNB-3rPL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 23:21:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2445824dc27so43535385ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757978477; x=1758583277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgsUeyln5jHJQtg6nGIuuJa3omU5ijeYPDC8tIR2gz0=;
        b=zLXysYEVtcM+PY9h6ZHpt926fJLf4oC0LFi2qJCt3AURSwudReB+qGzsGW4hvYAgns
         fLrIXodQmj0E0QePUzsLvXBWLe0gB5iowr+Bgp6YdOGiqO+XK2Z5J2Wo7dKp7OQpPK+n
         pMdv83tYxbH/2gKWw92NjZoox1361fjjfbV9TEMun5rGbiwUCEOKQPsrIaySrieVACac
         svW1GGXGbAubJV+/YSOpYr0mZT3p74CUtDqnSmCXD8/KI0a+0EmJFhwMWr63sao4Ol1Z
         rl6DfwJiDjLjd4sSSVM91ycMFPgiBokduaAU242A86TTLBiHpjcgUIJGyJKrSA73Eeue
         e1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978477; x=1758583277;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgsUeyln5jHJQtg6nGIuuJa3omU5ijeYPDC8tIR2gz0=;
        b=K4342lPgZkCBfCcF7jRP7mganfserp87xqXqK8q8RYP31AI/ab+7rY1ODQBPJ/lw2k
         FwZ4349NyWQQ1SeZxrT0GWPPdZ6+yQ6HaOMxS3Yr9z3LayUt1gCotbWT3/Nmnt97PokO
         +tdLoWQzoACK00Zu1plaxQY0NclQegGCm/Gy9C7P1q7wi6bklMeEH3B6JGRBhp3kUdEn
         z3EQdTM9wsenqkaDr5snUwxHp37uWkCO8sDmxvL4vb91MQNmCCEiyK9OQp1Q0hfADbPf
         wwyPwk5tTAzwRXaLAarmIQxxyt4hIqB9KU4p4COsZQN5ITawl1rQTVEHpYxUfYMMcR8u
         b26Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVE7mwT5ot/d4yOKtoxGJ8VbaPyLNh6X1mwqwmA2q+pdeQ/SikmvAS9QpayBMrmN5IxnlBhUxAqh8in3w3GA88@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Qdqa4ESfGHdyZMeox2W0LQBCjMl10YQgfP7RC4TMwVPO2ff+
	qxcK3wJK8EReEqRF9EhPIj9UoPpUGrmHl/jpGO5XaHlY6cFB8zJ/o7KPDKts+w8rXBc=
X-Gm-Gg: ASbGncvhkBjcFnysIbf70U38OeO7Ffyf0KvPmPNMa/Bs/fVJrgUqKqfZdniTnK3gb+W
	V0ppd/wcpwCKoG1GI+5BhXPmmwe7Jdg7gRrpKfjQKNLmwP7v9h9YUfJ+jOzk8lRa2hbPo7NEUN5
	oPTVhrbW6NQHYr5d7PNHjBpi+/pytIcapsbZSjK5bew5TYWk4vYmnQ/0OfW73WCNVMFmTtS7BHw
	L/cUBwFLUECsh5GgESDCUAyoXrairpZcLXrFY3TYqkhWRajqg2WVheFXnxWHHMzOPisw11vlA11
	jiA3A6JiVSLsazb5omHXB7UGPgYlG7c/qEteuedHptco0DvB2JCNL2UO6cisRYCXw2Bs5gE6nWz
	JMYXsfrYsg1DGybrGxbshQockEwvl8t0=
X-Google-Smtp-Source: AGHT+IEMv8jBnfBFpzOj2tDIE4OBC2iZqPmVd1ibS2mAaD25rPyFSdy7EKxeRUd8V1wYJ+kr0edLjQ==
X-Received: by 2002:a17:903:3888:b0:24c:cc32:788b with SMTP id d9443c01a7336-25d243e7b4cmr166970205ad.3.1757978476693;
        Mon, 15 Sep 2025 16:21:16 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b17c78sm14543629b3a.50.2025.09.15.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:21:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Subject: Re: (subset) [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
Message-Id: <175797847576.2104956.7606973558357095186.b4-ty@baylibre.com>
Date: Mon, 15 Sep 2025 16:21:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_162118_198300_2E2A8057 
X-CRM114-Status: GOOD (  10.85  )
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


On Thu, 10 Jul 2025 19:42:15 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the arm32 subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Coccinelle semantic patch:
> 
> [...]

Applied, thanks!

[1/3] ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      commit: e2c0510935c5485a2dacfd13af3958536b9d138b
[2/3] ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      commit: bb676996ed583464504123721195e98a708fbba9

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


