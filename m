Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34009E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XT9W1UnwoTETfgMRzfaw6iHxfIVKRAUJazzXFdIx/Uk=; b=ZbIqykxLmYgIvDU03QUySXO6sA
	nX0nUEZV74gsSOH11WbCIk8IQO4n4Fmq+O60WBYv+p/KS+MKQ9kqqXK3/beDTzEQ7JYkD5fedJzAE
	0qGDZGUF1+i7GMw06vNBKdYx5P1waLW8VcSj+cR6TLCIAt8Dd5yT0Jjjgn6wLSBC53/3lFe7KQcNq
	nMX+0yFhiJZvz/EHNgieppW44wv5EbT00o6KBvc9raQRxQmabDmnC6Z5AT1hMooWtiBQlu3HiJ8AD
	tbjmAEcDOoxI+V+JtIQtB0990VlLd8M6wuLTP/g+LVuZzwTnDmjl6wFaasjPnizVYvg9EyJdigIsh
	Ey73gr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavi-00000004gFN-3rsb;
	Fri, 20 Dec 2024 11:12:26 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHc-00000004bJn-1FHy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:31:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by baptiste.telenet-ops.be with cmsmtp
	id qyWq2D00X5V3mYk01yWqKA; Fri, 20 Dec 2024 11:30:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3r-LJ;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gN8-Di;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.14
Date: Fri, 20 Dec 2024 11:28:44 +0100
Message-Id: <cover.1734689797.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023100_474175_EC83234A 
X-CRM114-Status: GOOD (  17.01  )
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

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.14.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.14

    - Enable Watchdog support for the RZ/V2H(P) SoC and the RZ/V2H EVK
      board in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.13-rc1,
    - Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
      defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.14

    - Initial support for the Renesas RZ/G3E (R9A09G047) SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.14

    - Add more serial (SCIF), power monitor, ADC, and sound support for
      the RZ/G3S SoC and the RZ/G3S SMARC SoM and development board,
    - Add support for the R-Car V4H ES3.0 (R8A779G3) SoC on the White Hawk
      Single development board,
    - Add display support for the R-Car V4M SoC and the Gray Hawk Single
      development board,
    - Add video capture support for the Gray Hawk Single development
      board,
    - Add initial support for the RZ/G3E (R9A09G047) SoC and the RZ/G3E
      SMARC SoM and Carrier-II EVK development board,
    - Add support for 5-port MATEnet on the Falcon Ethernet sub-board,
    - Miscellaneous fixes and improvements.

Note that the third part includes DT bindings and binding definitions
for the RZ/G3E SoC, which are shared by DT source files and the clock
driver.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

