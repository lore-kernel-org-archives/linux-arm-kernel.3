Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09CECA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BoUNg0NWnSD1ZMcCTQtaEQNN7qPQ5dP9cFU4cMtk98A=; b=gL1Ai1U1rrS4IFupJ+UVMc0pab
	9UwlmnHNeEIdHADbo/36lgdLOUSFk1tGdnL9xbhqpHFj1olTbmha7Lo7bbDNbYkonFmYhlmdlL5pD
	w8JIi0YuFrmOsIcgUWoaWtPwS1JoCRXFriYC2ZCiJ+0QejKdSBVNmQw7LoGM0mqvsqs+NI64MnQqN
	t/8t2Dg7eHzMZqp4+CQ3O2RXMWwrpdBOdxMeV+DYj5Ti6Gk+uuA+rf504mO7JvKBSr09CV64pglB6
	c51leAQAG3jRtha3/xH//5H1OlVsbWVSYp1Ra2xmNg1Emni0DS/i3BmTwPnJG0PI4OvjiX0AKybE+
	w0Q7V+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpYQ-00000001pCX-0VRk;
	Fri, 15 Aug 2025 08:12:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umpU5-00000001oeP-0FBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 08:08:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55ce52ab898so2023259e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755245299; x=1755850099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BoUNg0NWnSD1ZMcCTQtaEQNN7qPQ5dP9cFU4cMtk98A=;
        b=wpD5fEbHczPqvAcL0T81xWwXNPFwePZKJuOedI+AhHmttBvexSG1LCrihMTYri0pkx
         RvTAN51W5oEec1h6c8p3BXnntJQnJ39EK7pgPsSsOzzEZjaaLjRYqZr9oGDY3K8xaGEk
         gdTjhLUR9+QMs9Ktry3af4CtSyH2Xw4uqpBqbvcfwVN2LcxoVH2OFi3hQJKA7a+t0BIc
         MjHeSRMmRT+7h2tgVLkghTdxNJOEETXNcshIgbsSkrum5ArV9kfxvrlam92yYTwuHY/I
         gF1OoIKSR21BqEmUme6zw/Y6gFlLdz1le+kD0/9ZeQk7o63DfuBmYEJItHPKVHAbSJNO
         wLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755245299; x=1755850099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoUNg0NWnSD1ZMcCTQtaEQNN7qPQ5dP9cFU4cMtk98A=;
        b=dspBguNhkL3Hr9dBmvgT44dFhlGHL2v6mjn6KTQIgfHc8c8DBMyPzCb1A1yrqMw4oA
         qoASTuQtwdpmZENi3k4y2UfI+ovHbqbIJu+86rOlBg3tABEc+F3q9HVdkT9rBQRKb4AI
         nuYjQmb3+0qRbytS32JpiV03JUjAi47T3tMqLyn77HzdbhmZnpKsXM0t4Jtk6CBKqtv/
         UrHeFyer+t6PMmgCLp7aO8uZYu6V5iGEDwo9WeF3Slw1Ul/9LtR3Hi/CbFOhnXvpyudS
         YOTDMNRJhYZFCqlKoR3bNsCQxEeaist7WRFjkS8o/N+NzXJ+q/glxpT89Np5l8ECS7t7
         cRFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDiGyw0P0E7NipHaHqOeOgnAgL9/pkib6g+QRhEjcU9bYu2uAFWkpGWJfYgzMlXWv1X+rlAA79It3j/BNLGGxX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg4iNwcMCgIdJMF9NdCDlJUaI7+T3MRVvz/piY75o48O1t6nt7
	y6FsZYL4BGtLtbwY/VN4TDsCUT8wLzMqedqGwXGKJiRO1QmMPf1LMHc2LJQqeWRwsAs=
X-Gm-Gg: ASbGncvUsD59vN+PnW1zqPnIVdi7d4vNOx6KPAD0UcK5jLRa4DfUJWPoWxmegOYlJs+
	8vs2QxL+kGtUNnAfZaVZOjDqRce1d1SzxIrXXZN3HcD2AJb+5CZyf3148tHFm3baVZLv7JHEyXO
	6gntfLupKiqy4xk1UAJXoCpdBV37qRnJ+Aeu7tnuMF/1ykqLEU2OBnUGnTmc7Ql0pUEn3ASD1yG
	gPIewlsgCkxxq+sEVA03WiTOer3ecwPrV7o96u9Kv7OLYkT96bnMzQ5PIWrKXLZYcRMKzOoLWe4
	pINzmCcTMWiGVnV943vBxTHxhvf8+HaIAXYVGAiX/HKxHZIPALrWBTsZII+VLr1p/3hlMkm9E9O
	0rvjQeLq8YrEcr9unlS57tlO0RxhKlDDACL5Q9M2c57QU1TCH3OBGQKcJW67FshIGBjRgkCCw
X-Google-Smtp-Source: AGHT+IFt90Urrmo5HV1l7Yk3jJuUZrJK1egAUyTZX0v29li6VQluDLCOt3n47gyYnDJrd4tjNDr5Kw==
X-Received: by 2002:ac2:4bc5:0:b0:55c:af6c:db58 with SMTP id 2adb3069b0e04-55ceea048f6mr305717e87.8.1755245299163;
        Fri, 15 Aug 2025 01:08:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a645d21sm1925151fa.70.2025.08.15.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:08:18 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.17-rc2
Date: Fri, 15 Aug 2025 10:08:16 +0200
Message-ID: <20250815080816.282648-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_010821_102822_3A81D509 
X-CRM114-Status: UNSURE (   8.30  )
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

Here's a PR with a pmdomain fix intended for v6.17-rc2. Details about
the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc1

for you to fetch changes up to b6bcbce3359619d05bf387d4f5cc3af63668dbaa:

  soc/tegra: pmc: Ensure power-domains are in a known state (2025-08-11 12:24:43 +0200)

----------------------------------------------------------------
pmdomain providers:
 - tegra: Ensure pmc power-domains are in a known state

----------------------------------------------------------------
Jon Hunter (1):
      soc/tegra: pmc: Ensure power-domains are in a known state

 drivers/soc/tegra/pmc.c | 51 ++++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

