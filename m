Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11059EF584E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04vk7Tkl67/hhgMqv+BcDZRWNDj7PkIykfjIdYJisGI=; b=wkE3gA5ZNQc1N4rfBFkEpTa8SM
	64keguTrJK3E74PM8QoMzVHId12LqVkJRShZbIutp47A0XXYvUQUBI93UWqv2bm5XvWi+JOr8aXGS
	JuF34RVOKMHIT1nhM/ArXYXS+X/pO8ofMj9uMQT09+h3sgmVuKngMOajtZrKc5gboQv1ht/p8kCnj
	ofG7jeVSwtGyEWUzX1kf2XlDZPaxWYjFBGofITlJUjUIUPLMhxcqfJt+RkrCMpNwBuAXBWs/WKpl8
	ESd+it5ooyAuf+JMApyuwtTLoH4gDpPCG4kX6e0pcdyJUvV2fwpRr4He9sxZKz08R0M4LH08T3hnk
	pLI8k70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrK60-00000004pBG-3RFA;
	Sat, 14 Feb 2026 18:10:20 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrK5y-00000004pAr-2aBD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771092613; x=1771351813;
	bh=04vk7Tkl67/hhgMqv+BcDZRWNDj7PkIykfjIdYJisGI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lzWNZnmzltXz6nKdjeyNDHOlSQzkdIsgEGnJuEuAIh+ldTYFsToo1a3JptAUkBRzK
	 hVnnWL8OXZj55Idi+s7X6HaaUZ64MJDYSZl7/vP9T+KnnoUStrkI0couBie+1kl0+J
	 HoX5nVotwuTsv+X1bHagi6PvugvvER0ewJWICrK1vfg/acODaJyjiwQ9H0kk2N3WBr
	 doGNWDaC2wirfvlYWgMnh3FLeP9dflQrMW6u3T/3tNJXikg+Sqv66J/JBmH3CI5L5t
	 sc09AcozxpqhCC/QgjCiPnawGU6cXvwfKfiFbrBalo/ZHPl+0cBh9JHBbt94zRUq7T
	 I1TghprY9gVLw==
Date: Sat, 14 Feb 2026 18:10:09 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v4 0/2] clk: clocking-wizard: add user clock monitor support
Message-ID: <20260214180933.42143-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 33811916af14432e3496307dc748448316a346c8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_101018_811918_C247B071 
X-CRM114-Status: GOOD (  11.91  )
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

Add support for the clock monitor functionality added in version 6.0 of the
Xilinx clocking wizard IP core, through use of devcoredump.

This is a follow up from a patchset I submitted quite a while ago [1],
where I was attempting to utilise the UIO subsystem instead. Stephen Boyd
suggested use of devcoredump instead [2] and I have finally got round to
giving this a go.

This is currently untested on hardware, so any help testing this would be
much appreciated!

v3 -> v4:
- Patches 1-4,8-9 dropped, as they were submitted/accepted separately [3]
- Patch 7 removed, as no longer creating a new UIO driver
- DT binding patch mostly unchanged. Slight rework and rebase, so removed
  Krzysztof's R-b tag just in case
- Clock monitor support patch now reworked to make use of devcoredump
- Rebased on top of clk-next
v2 -> v3:
- Move kernel doc variable comment to bottom in clk_hw transition patch (2)
- Remove extra line (and add Krzysztof's R-b tag) in binding patch (5)
- Add Krzysztof's A-b tag to dynamic reconfig binding patch (8)
v1 -> v2:
- Split and improve clk_hw+devres transition patch (2+3)
- Fix/improve DT binding patches (5+8)
- Utilise auxiliary bus in monitor support patch (6)
- Add dedicated UIO driver for monitor support (7)

[1]: https://lore.kernel.org/linux-clk/20240826123602.1872-1-hpausten@proto=
nmail.com/
[2]: https://lore.kernel.org/linux-clk/1bd17a02bab46391872e4934895b83e8.sbo=
yd@kernel.org/
[3]: https://lore.kernel.org/linux-clk/20240913191037.2690-1-hpausten@proto=
nmail.com/

Harry Austen (2):
  dt-bindings: clock: xilinx: add description of user monitor interrupt
  clk: clocking-wizard: add user clock monitor support

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++-
 drivers/clk/xilinx/Kconfig                    |  1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 69 +++++++++++++++++--
 3 files changed, 89 insertions(+), 5 deletions(-)
---
base-commit: ea7282e99ead6d2a294cef40acd2a29ada3ab71d

--=20
2.53.0



