Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAB2CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRwBh39GqXNmqTCDkY03IEcf+DDmQW9MTqCgBPdfc/8=; b=pFbcD9xpkLe7hzctc2oVW91fvA
	tdQQxveJPpXeuc6aTv46tZCiN5OG/oc8+t/aTdgk2dwx3Qb7O+kXyK/xA2yNYXF9xxUeDKK9fqW8v
	DH1OyDjI/KkkhIgxws7P2gNhQUR2S2kl9PHqv16cjuSc3NqrBjlgtmpnkOupSGBsukdAb+Jx/K08q
	D/643nycNhB9bsJ6DpCAp2q2cNc62TbdLSns2qL12+R9pAq7qa+Z52p8PdUOE4WTffxwPwdPZ2xU2
	yfb24D39g9szvnTZNPmyiFDK3w1YdL5g0VkopPMexHN8Yr59x/dkKiEtCKsRCC1MR2ju37JMG4uEr
	56lqPJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVg-00000009WSg-3T6d;
	Sat, 02 May 2026 18:56:16 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVe-00000009WRh-1zCL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 18:56:15 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g7HDl6qFDz9tQR;
	Sat,  2 May 2026 20:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRwBh39GqXNmqTCDkY03IEcf+DDmQW9MTqCgBPdfc/8=;
	b=cSC+M0efPcqaKGZVy3Tvk7Demw0T5g6vW0WZD6NV/4PwQWcd4eC99Ej59w3Ri6XRqwLj2t
	sGOdVxuoCnceTVe0PnlXKtUt8GMtF5ZrfNwbP5HxDbSPvXEQvmD7XTQQdu06SSZc33+fvI
	Gtm9N/emaGEWOhRVch3Good6Y5DUxFUkd/3DKmsyG1pL7J9m6Ii30ILuko/UMaxZ0gmTBt
	NI1LLxheCUGGnrDNsSUNId1714nS6dMgxMZ8lEpwbOV5pbZUvMSlSBe65gNzH0jI5syaDG
	0Fpxysi1x0uf1Fw2UfQ/KfqXNrgBbQs9PGX1Tt06UHERsg73sJZUMX4iFjiTZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qbdQClBr;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRwBh39GqXNmqTCDkY03IEcf+DDmQW9MTqCgBPdfc/8=;
	b=qbdQClBrdTqSZlF/7wCdIxX3+ASoi0f8mRQqxQ65I+yAvPgp9C4KJ5VsAc3bsxiGYbGNW7
	DoUXyUISsFGdVV4/bZIhqvbg1h+zlhbbRgJi64XWP/wC8VTRTXt4mAu6A2OOW6JHabLQZZ
	7Oe1s450H586CTUq7RvZehHs473yH0wlrPRzzrfl8F3/umoK3BEP9zE5SsrVyXXhRfZO/y
	NfPFQlt09YW/d8iHWvYI19fzP3NR0DEF3bXZrNRP5C+9F3lL9wyNcF9bg5jMXsww9x/5/H
	2shoHXhbZeOigMxP0ycGnvWKrlvf0++pjOOEjgOVijpE+Rf8+RpqlSy3BZT/PA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] Describe coresight on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:41 +0200
Message-ID: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 29f8f6d9ad634f69e44
X-MBO-RS-META: 86oor7uzk4fqymh5d3ijsxszf1ta3s1q
X-Rspamd-Queue-Id: 4g7HDl6qFDz9tQR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_115614_688909_325507CB 
X-CRM114-Status: UNSURE (   8.15  )
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

Implement support for ZT trace bus and ZTR trace clock on R-Mobile APE6.
Describe coresight topology on R-Mobile APE6. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile APE6 User's Manual
Rev. 0.7, Revision Date: 22-Jan-2013. I currently do not have access to
this hardware.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile APE6
  clk: renesas: r8a73a4: Implement ZT/ZTR trace clock on R-Mobile APE6
  ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6

 .../bindings/clock/renesas,cpg-clocks.yaml    |   2 +
 arch/arm/boot/dts/renesas/r8a73a4.dtsi        | 114 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a73a4.c             |   2 +
 include/dt-bindings/clock/r8a73a4-clock.h     |   2 +
 4 files changed, 117 insertions(+), 3 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


