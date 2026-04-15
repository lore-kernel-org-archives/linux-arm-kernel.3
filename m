Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B121DF433D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gvWOWQVPz49XTZTstMQ/fvYu1MF/JxDwsGNwmUvTe68=; b=P38BQQ4sdO7wX2Wc7hdJ8GHIxe
	4uBqJcGkofObQmpAOCYi8HPxZs79xSiy7gYZ5MgBwS66HbTJIRCm8hvjNXh6Y5E/+PUgkfqakCh32
	3kN5Shu+eyIggTDShCubf8/V7VVvYXW3y/353e164/5Juh61mk5BEq1TD88YRKbQkCbcCamJa4pd+
	JQs4Dhgmz8U7WNDItx0W9wQOToz458lfP9watBh+qp67c1ksvrSei4ZJcDiJVFCO8yOLrZ2884/uq
	ChuqqgpCbZEQMWc9MPXxuuh+1wKB2jYWb/cK+D8BJnFvt+gLC6U2S5ssBXBse8JQBsqgTNS28s2DO
	eVOSrssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jX-00000001l3M-3Bul;
	Wed, 15 Apr 2026 23:33:23 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jU-00000001l2b-3dJy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:33:22 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fwyBN0tKMz9txg;
	Thu, 16 Apr 2026 01:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWOWQVPz49XTZTstMQ/fvYu1MF/JxDwsGNwmUvTe68=;
	b=oKP4Oj3+pCqBUNihBLZNhvmVArwceWZ9wffmh9Afe8lUzgwgdQrVkn04/r/W2QPyTwYLKM
	ZC7K+cnBXevP92tJinmH71Mfk6Qs+/ALQrMOpyWqD3/ODVGnZwUXzyb89NbvnoTu4C6aQu
	81ymzOtBlpA4jw7kLz21KeG9TBj4iMDL8oPtinD02keIZ0blBywlcK2iv0FCr3maGwhqXN
	nbDt5CBeqXU1e+qqUpzqq80mTzZ773ZpLP9/sjlvx5EOeOW3EbseOTElxDlyMh4lk8W9sG
	VOwpue7atI4TUTNfoMp2lxdm2EpuLWlGoS/s/EFEuj2S15VuZvzcK69cLEaN9w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvWOWQVPz49XTZTstMQ/fvYu1MF/JxDwsGNwmUvTe68=;
	b=AfAeqXh3NT12dP48aAuh5RQuIdcjsUpXzKEh1IYBwKYexG71oabLSsU/AwXLURLBYpmc4M
	qzzP4YktqsCbzCyj80UMEiBeUJtbW4S9yJolZpHXLkx+kZVYHI9xAxBRN5MX+hKdN0FUEC
	WPkFotwoQLQiLbaCMnmEJtKjT9PkLYyGeFHbUnrRxsR/5IQAaLRA8mttQqMrktXR6cvXk2
	sikdx+UE/OuWbo+FSqn1Ln3t5FOhicUqKCmFhuAqgPk83xneCdu6fK+uvfrFjacZLaiV7y
	3pZYIcL/uJyW86a8MJtFzlOfNgKju4TPFGlx+faL8nWA4RzawZlm53MC+b6vpg==
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
Subject: [PATCH v2 0/4] Describe coresight on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:37 +0200
Message-ID: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rxmaqd7ujwu4pup7znsqwx9x5yhk6sb1
X-MBO-RS-ID: a58143ec36526588d86
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163321_055889_229C0494 
X-CRM114-Status: UNSURE (   8.79  )
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

Implement support for ZT trace bus and ZTR trace clock on R-Mobile A1.
Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile A1 User's Manual:
Hardware , Rev.2.00 Sep. 2013 . I currently do not have access to this
hardware, therefore I am sending this as an RFC patchset.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   6 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 116 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 120 insertions(+), 6 deletions(-)

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


