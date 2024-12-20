Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46320E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw54lRKJ9zspgJOPu+fKLS5p4U1o19MLGIwtiaELNxo=; b=vM1e/qsmt7P7wOz8h+7HAto7wZ
	KtTPvP37Qj8CULncN3ErreEB1+e2LbHlkvRwaTZFA54weRjIgt1qDPjhl5d7fzXQL1DFmcUX58HhY
	RqrMy1TbXLIkn+tLtDtwSwRQLiqmRSqqCFX1/j/IDuDNBTgE3JvHnxcSYv51kFdGumLUq7EgcczuH
	A4jskYvwbpTcwHHELMDEJ7iVZRoWHlHH4tl82Altv+ICXEVbHzjdT3RM45fGrR4QMHyIkxzybyzTT
	jZ3ly0MrDaj2UNyA64VBSk3fgg1yglTOhXN5OffTkIasVkvpmJ1ZKsnc0YEiAqf+mGJiK7srYssoA
	dKBKsB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavf-00000004g9k-2Vf7;
	Fri, 20 Dec 2024 11:12:23 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHc-00000004bJm-03sk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:31:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by laurent.telenet-ops.be with cmsmtp
	id qyWq2D00N5V3mYk01yWq5i; Fri, 20 Dec 2024 11:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3j-EG;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gNE-G2;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.14
Date: Fri, 20 Dec 2024 11:28:46 +0100
Message-Id: <cover.1734689801.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734689797.git.geert+renesas@glider.be>
References: <cover.1734689797.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023100_195450_74910CAA 
X-CRM114-Status: UNSURE (   5.73  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.14-tag1

for you to fetch changes up to 12e0bd600e3c2f33f9db0e3b91f6b8d8d95b7dbe:

  soc: renesas: Add RZ/G3E (R9A09G047) config option (2024-12-13 11:09:01 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.14

  - Initial support for the Renesas RZ/G3E (R9A09G047) SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: Add RZ/G3E (R9A09G047) config option

 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

