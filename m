Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B035D730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cX5VCdirEw7uDW7pBIKifXil6dQCocQ0+NrpOGO976E=; b=a7S7oQ/5GfBx1ZrEGuGHftoY2b
	/hDBi4iSzdLFmf5BlYDU4Bm+ZH52IWtE/LnL9GYwNRdmCiLXQ4hHxOEi4M133eDPKb2VZ3hxGoer6
	EL41EGoJWBV3zrFAxETwLJQtNl8RXKUpf+avVCSJFW0m0iFzA/e3JRfpkIW0nlsj2MuaYWDVAedGO
	hiCzhNkymGd8TKVqX9wAQ74cwHKO83kdbTbw4OYlPpCE/pxA9IPriE5ZA57YSWfZ/AT9KrhSm0LUH
	j4o7xRo4hseQdPbDhIS6CTdE8HxPBIWcQMIyJ8xeKvQtpFbQHYYR7RStTzB16zAxtIr1VpKjotHc0
	USB174Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YcS-00000001TAf-0cWy;
	Fri, 03 Apr 2026 07:07:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YcP-00000001T8e-2jZi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:07:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d029f346eso1545004f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775200020; x=1775804820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cX5VCdirEw7uDW7pBIKifXil6dQCocQ0+NrpOGO976E=;
        b=Il/FOlI4zsJfCVV0JHUp79Czmwj9EvSOdZsd/N+VPm6h1lOxhWApGV7HzjcNUqRzn2
         s6z0JgJnTor1MHH/8TC8QGHnPZohvbz6CP2fDo/1UXCVSTA+azbJJrqtbtWagYpruyq1
         jPpaimBv88hQP/vfBPnfu65ZRjSVGJg3k0rIGflvsAqKl/bH+SQVTCAUCDQdbIaEUc93
         m+z0DcHR0XqVHfTsJ4qPu0ybABuEoC1FnRXVP+81PS9p9eqGcmyYrtd/ljQz+0NxEH7r
         MX9RfkXbkysom2I0fiLW4t9cYlff8oDy+7uNT2CBal1U1x5d4ZF7DkYy17g4Qywo6YvT
         Hwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200020; x=1775804820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX5VCdirEw7uDW7pBIKifXil6dQCocQ0+NrpOGO976E=;
        b=HNWhBu5aikIejeCA1q7jWhscfd0UaAjSFUUsRtoEQ+wPZL8AnHYZEUcDyc8aQ5lTxh
         7fnzc8HCUIxbFDoy2bBLMo2rUntP3Z74f3jSHNlNp/y6R8vscIRdU5Hj8Vi9LKvXx6Nc
         9vIjHnm0Q9qgUGPH0SPXMWsthPzgacplZJaQ7TlgQ5SxMvAhzoMfHISiNxZBlAvbpf3H
         GRDUqY2LeA1u69BQyvb4TKNGeDHAEMBBfgHq3EMI8BNOhzpu3Dr4ze5ft0aZOTYGbPeD
         EJHkagZtFsTJ9ScKZxaX7vKZ3XKXKHcKhmudgJkL3V333VrwpW1ym+eImcV3gskmpdB7
         OB0A==
X-Forwarded-Encrypted: i=1; AJvYcCUVniIF6hRbdfaFVZP4jB0gH1NiuM4+1N75aHmccUQ1Qw4IUmQN+lvuEpQZta1Ax57tlu1z56dYvZwv2fATPe9l@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/OOSy7DSZJH1yqoF4vihBf/wtFX8H8P60eHQ7hECzK8boj7G8
	ISciu8v8RFYbzUwPhvyoYYP92cnA9R910MdcZbcy724NrQ+zlneawn+vITKGhRaWot4=
X-Gm-Gg: AeBDiesZIYda13siO5IrFSoWQU1qVxoeA6HlKwv+rMgSYNvq3923+57vhAhtPZKtbxD
	9GQqUQEydCDwgRuolX5BWptH/rvNjZjjqTGXdxHwt3rCgAJQ3BfaovgCt9qUAI1m2Wpxft75QjV
	uaUhPjwkWddBRejhsoPHG0TBjFDIh7DQDUdKPSMcCcHt9J6B3ZOki9lpaDCf3851SRuR5EHkmup
	5OkuPGO0cASW48mSBMAIuwXpwsnoq/c6n15kgt9UxN2awKtBQOqEOpFh4xKj1b3qsmHmtiOZG/6
	zYBOdCqd2WvqLz6DmeH7WcsXIkCqGfNH19RjWt6RddSRU4tGeC4ejvA7LbZ8k0GHB+lRH7HH3JW
	2kv0Jx8iiDxCSgZEt/t4IDMco16MjUtzdXs9GNpeLPqXHGSj7RFvHMhTt5J0Ux1EKKYEAoz4RVn
	5QDfO91roEUaP9TExjNyqwCCzvBon5+oR6DR0SawJxDA==
X-Received: by 2002:a5d:5f86:0:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-43d292a9591mr2910276f8f.22.1775200019710;
        Fri, 03 Apr 2026 00:06:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm14717944f8f.17.2026.04.03.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:06:59 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip ARM64 SoC updates for v7.1
Date: Fri,  3 Apr 2026 10:06:58 +0300
Message-ID: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000701_692840_9E67C88B 
X-CRM114-Status: UNSURE (   8.09  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-soc-7.1

for you to fetch changes up to e4ffa98a02f4d16eda9a5faec6792493b41dab35:

  arm64: Kconfig: provide a top-level switch for Microchip platforms (2026-03-18 10:55:49 +0200)

----------------------------------------------------------------
Microchip ARM64 SoC updates for v7.1

This update includes:
- use a top-level configuration flag for all Microchip platforms

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: Kconfig: provide a top-level switch for Microchip platforms

 arch/arm64/Kconfig.platforms | 10 ++++------
 arch/arm64/configs/defconfig |  1 +
 2 files changed, 5 insertions(+), 6 deletions(-)

