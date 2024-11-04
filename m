Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAD5D132C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpeaJskM3znAcoTWy70Pz3saAEMGfBseLCz7zfjofsU=; b=Zhv3MR1OND79+nLWOCKuk1mYKe
	JelU6PuM7Nv0gdm/bY6DRs9eVGhI5Q1mJ5BCIic5o85DpnKMXMt9pgWxGvTZOC4SxzyJlype5SiuT
	uwQU13oSXFwhOOTm4LCoHYhgfTUlnUVr22ABP+oOh1R8q7CwZfqIwZpYFn564/RvW1x9/vp/AP+S/
	/NZMTbOINdn3JUcD6FVcc9HqAZ6px8TuLpC6M+xmVzU+jWKWbK8aCMym03YwxmxGd6si3maX5lHd3
	TnyF9e8HlQSuK4S/2pPpoCpluDlzsyQDjKiw8ZJhZnnCq284+VaO+qWUgDPWK9YNmJtRKPFbAKcjG
	nwqLjc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xGL-0000000DtaQ-0QtN;
	Mon, 04 Nov 2024 13:36:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x6b-0000000Dr5G-1neO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 13:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qpeaJskM3znAcoTWy70Pz3saAEMGfBseLCz7zfjofsU=; b=g1/MubIC3Xf7b5z18+xqBLXZjP
	tWV3fJFYJJZV/4T6jc76lfO7kA1M9+f96J364ds4BpSAJbXG80A5i+TBQm1jx+PmuSu2WPZGosa1a
	DS68WFA2I8UcHKzDYbHs0/nClFexDnhMuCHJ+9hGq4fULSoZwjFc7dXDQYLv8RQFW2fvdXhoZWPRe
	A68J/a/ja+42fPxpl5K9Pnd4DtDkZA/4sM5P1PKA3+R0SWtnt+FNDqpW8Cwd2UIdlWhnQPMxtXAeL
	FAgytI9o/O6MnizFxCySontZNHlNphA6oDZeRO58Ln08CkWvTpxTPuLI22n3qio8UPyBMTUiV3JJj
	5Mtx86QA==;
Received: from weierstrass.telenet-ops.be ([195.130.137.81])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x6Y-0000000BKzZ-2d23
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:26:52 +0000
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Xhsgm4Br9z4x243
	for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 14:26:44 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by xavier.telenet-ops.be with cmsmtp
	id YdSh2D00K31l0Qj01dShZH; Mon, 04 Nov 2024 14:26:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvN-Ss;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BJz-J1;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.13
Date: Mon,  4 Nov 2024 14:26:39 +0100
Message-Id: <cover.1730726154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730726152.git.geert+renesas@glider.be>
References: <cover.1730726152.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_132650_810293_B9782B38 
X-CRM114-Status: UNSURE (   8.46  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.13-tag1

for you to fetch changes up to c520bbb523304ba98de9ffeeb0ef289921434125:

  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 (2024-11-03 12:33:11 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.13

  - Enable Battery Backup Function (VBATTB) and RTC support for the
    RZ/G3S SoC and the RZ/G3S SMARC SoM.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

