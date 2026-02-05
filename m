Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C9ECD9A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H6YnkpYDKXhiFVLlVHgZQ6m/aKsIAX0AUzy5h11UG4A=; b=pJY8y0chUnP6Fq2yhsRzuTKhzM
	txySQKJXT+tjU+Z2isL30CB+faoweDlY/+C40JOYmRJWAE4aRG4lYhAz3rmHMoKYvmukribyJXm02
	LC1A45UWgZLN/F7OGLdt5SFhFsROUzMLxnDxgG5KXzVfta9Rq4DnzvQ62R2a6c7nwPESNDVfshQmj
	BIn5xCF1AF3H44H/f+PewgfVHfRLIeLMxSlehzms83utPxnZ/oKvKuTRkJXrkJhp9lqPOb8g4L/ev
	eGb1i+vxkwEMzeURAx0rL+IVVjkUdVeY2Ke5jJseqavfO3GDi8zRnPIPcIgVdGjyOfx5aaB+5Fir3
	WVFDL8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lb-0000000AV5q-1VRZ;
	Thu, 05 Feb 2026 21:19:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo6lV-0000000AV2G-1QKX;
	Thu, 05 Feb 2026 21:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=H6YnkpYDKXhiFVLlVHgZQ6m/aKsIAX0AUzy5h11UG4A=; b=Q1M9CrJuw3KB2QgWcNL35CLbLB
	+J/SRaLXsXF0SNU8ixr++tA7fAX918fB+ioJQ4RXvo8x82lAoGkzJEEl0zqvrw2E8YNY6gX/NWipp
	MboYlXt5FNb0nVBgWrYzM4MV6aBvGPQyAyLMC7VhVwUm0XxDuEpZnxMUA9j43AJLuzEBgj9/oAlF2
	OBCC+Q0HVCQIf9mTK7pg4l18MHEuczRRauX1xnoko/bTGyjgJZWUAf0wIh3+3sgww5ekJoB1bjovR
	8VctrMmIgqk+LBQfQ1BHVXLztzuuhmL/r9fKgcOHU3BvC0IWpC3UD/Z72mDOLi5jpcjR0nFbhLdiD
	9WvP3UKg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vo6lN-007GGK-4s; Thu, 05 Feb 2026 22:19:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: [PATCH v4 0/6] rockchip,otp: Support for RK3528, RK3562 and RK3568
Date: Thu,  5 Feb 2026 22:18:55 +0100
Message-ID: <20260205211901.490181-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_131953_378948_E61341F3 
X-CRM114-Status: GOOD (  13.15  )
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

This is a continuation of Kever's from april 2025 [0] - hence the v4
The original patches seem to have fallen through the cracks.

Additionally this directly inclues the interal word-size patch [1],
that was previously listed as an external dependency.

And finally meanwhile patches for the RK3528 SoC from Jonas have appeared,
so I've included those too, to get the support for all not-yet supported
SoCs done


Changes in v4:
- rebase onto 6.18-rc8 - the rockchip-otp driver did no receive
  additional comments in the meantime
- include the dependency patch about word-sizes
- add support for RK3528

Changes in v3:
- update the clock name from "usr" to "otp" and re-order to sync with
 other soc.
- rebase on rk3576 and rk3528, changes suggest by Jonas
- Use rk3568 data structure for rk3562

Changes in v2:
- Update the commit message and add maxItems in schema.

[0] https://patch.msgid.link/20250415103203.82972-1-kever.yang@rock-chips.com
[1] https://patch.msgid.link/20250316191900.1858944-1-jonas@kwiboo.se


Finley Xiao (2):
  nvmem: rockchip-otp: Add support for RK3568
  nvmem: rockchip-otp: Add support for RK3562

Jonas Karlman (3):
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3528
  nvmem: rockchip-otp: Handle internal word_size in main reg_read op
  nvmem: rockchip-otp: Add support for RK3528

Kever Yang (1):
  dt-bindings: nvmem: rockchip,otp: Add support for RK3562 and RK3568

 .../bindings/nvmem/rockchip,otp.yaml          |  83 +++++++--
 drivers/nvmem/rockchip-otp.c                  | 161 ++++++++++++++----
 2 files changed, 202 insertions(+), 42 deletions(-)

-- 
2.47.2


