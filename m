Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD7DCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ifa3FgzMJhdcyEQYjXisaWYQtz/jhQwaq5a5wqcFCs=; b=AnTFIoUiTp9hzvCDpBBFNOK5Ox
	yJBYnAtsj96vQU6s+VPZLwO0hvLC+WXcnbRMPet1j75/f81aBDGGuY2RiCvvn7rJRPIDLr/BA2WHB
	PbvxkpZjsTP2dffqUKXjMhseTLdiyhV/U1PJ3DhHtnNq9E4JQnrgCGZXgtP7BKYy+sldUaXqnrCcP
	POKqK24KfjXmqZdO3Uj8FS2FkMGBZV1bkV0mTzTbAPnlto+MbwrsPNp+JtPS3N9juKyAMrsKJExGx
	yl+jDPp0b03vZv8gz2kB6LLe8FyCGukL4ysCUi72ZEvDZPObnhhbqpW80BSkPwo5tftDPfTQY7FbW
	00FPbNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqzo-0000000C2G5-3Ig7;
	Mon, 05 Jan 2026 20:16:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqzj-0000000C2F1-2V3p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:16:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a1388cdac3so2453005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644163; x=1768248963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ifa3FgzMJhdcyEQYjXisaWYQtz/jhQwaq5a5wqcFCs=;
        b=HJmmuOeuuSbJCbegZeyuE5YT+/e1euV7bNduw0xns7+B2oqpq/H6rFrYnxBG7TFY+z
         YIP4U66o4J1pqt5ImY5AJKLpX813alg3SeRZNNciWw6MKrceAttoaNE2ayKo631/JlQI
         2iW4C78A9iGnIUmhHuf9Qru0jOxseT3+uyB8Jb3vcKNRLKXfTNFPkWW+ym89XKLEIyTw
         3xzTzZhp1dfzWudacXnp9Vm0AkDsQdM8WMymlBLULXOT57JGVxABDdhMkh80butYgUfL
         T96fj4Cz8d1l8Jsc+RlCPCvwgg2C3BLWJF48Nr8pME4Jpn5F2fX/Nh2i45vnzVmZOQTW
         qUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644163; x=1768248963;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ifa3FgzMJhdcyEQYjXisaWYQtz/jhQwaq5a5wqcFCs=;
        b=v6seVB5woK0V8GB8gUnfxBjiHv0lN1L5suOK96VEQ10IrCvMV7E+5KFLQlmEIct+gg
         Zul5JTzyUCJXDuxcCEAyBviC1jmrK83DW32E9d55AvHTXNruDyc8JiJFIIKDFMmpyE6S
         K6E2i0wwFdvptVyc/qUcjORpoywoCJz3PG2O0tZGShOpk6mpsB/eJu0mJzORgdrsTQfy
         OfkGY7+JImIucD7oo0ONDlYwcOeEZ28CGEUWK6rJ74SPzk/O93GyEUtT5gZCEkojoZbD
         PYhxnpKUc0gQ8iWOLxdn5zioh2v2vnhYlrk48ko63lpIWq6cbD6818/jtpW6Ez0Ec8tX
         lDMg==
X-Gm-Message-State: AOJu0YySEx/XSslQMmkKgrRm2h3nIaOj1SkqLpulxBtVGEFZ/9aBmrvN
	JaS1cbV4cHJXOiQByIP11ZZ1roUBmUUYi2v957vPzCXHstwGl7zBqoffuo9GQsR1PYQ=
X-Gm-Gg: AY/fxX7lPAuMGzs7VYOaTt/EZ3F2XVNm55sBrxIdkUK1DSFhvG1r9Vm0bwNeVTwWuwZ
	BuMaKKxXSIBWeptMN4u1DApML8PdOWuBVf6MMSbr8Y6If04atyOy93H5m+T5mIn/DAtZ9neperA
	TvvANbZGrseuNAhKq9ekcWf+Hn8Bl8soSPJmhm5xMXRd/Y4tE5CmKXrmTSN+XxfCrP39AM9uqm0
	Z1tzrXr+dwS5bDK+iZ5bQZ6jfv016yNVgDIhZTZnJZfkxXTjP8+1XsKufG9cqahlfGk1PROn2EK
	8ZC1Hhk7OKV8Q1QcgTnGbSs+aTKkqZjt+U9rBf5ZtgsRD1hl5k37CoRZRpSj8nVkfg4fpqW9Pmk
	B/net3zHHSZm4aEr6jslK4w39qxfcyWzsEfR0lMZb8xyo6g5mCPlooU9jmZKEyOfyKkVXwQtr1F
	72hVPGF7sE
X-Google-Smtp-Source: AGHT+IHdmIrEr4BVbZEQPNX3+GmY+SREBGPwkRDFt+Xql+oRg3wNX3X+Ikd9nNU24yxL3SJbGllaWw==
X-Received: by 2002:a17:903:32c7:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a3e2df0741mr6144155ad.50.1767644162704;
        Mon, 05 Jan 2026 12:16:02 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm873055ad.88.2026.01.05.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, patches@armlinux.org.uk, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
In-Reply-To: <20251230055230.3212260-1-rdunlap@infradead.org>
References: <20251230055230.3212260-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: omap1: drop unused Kconfig symbol
Message-Id: <176764416184.2561401.16752078199800151881.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:16:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_121603_636704_A174D16E 
X-CRM114-Status: UNSURE (   7.48  )
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


On Mon, 29 Dec 2025 21:52:30 -0800, Randy Dunlap wrote:
> "select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
> due to a botched rebase (says Arnd [1]).
> 
> Drop that line since that symbol is not used anywhere else in the
> kernel source tree.
> 
> [1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
> 
> [...]

Applied, thanks!

[1/1] ARM: omap1: drop unused Kconfig symbol
      commit: dc717e24deb4e626f4ad4896dd722815ef32311a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


