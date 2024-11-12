Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBA4D42B97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNocvk92r41vpsiP2FgizA6VuQpLe/eC6GyP/Vldde8=; b=y4s3vvY4eSAY8rpClGGX6NYuHw
	qY23RvKD6rWs1JLYsspuqUYldZH1qEHCR1TV7n6A8NiN7Te2XTAzT6oL47Cf5sHg5pI5rX7Gpm9z9
	IZP/xN3TmkY/eeOiY1rN+0/0TFCgr2I5R76Ntarhm5mrOqXOkfXTNfAdPdnORAqKgoepDHIgJpb3r
	MSZXJQGi0yk8Q1nZd8S2gfaR1DN/r3xNXtI9p0ZxgZtHFCVsz2ahr2boZVRVg8jOW61XshYtfZ4p2
	88Cw8cJCxefxx1TReHH2KxmRYcC7YO+/kbkhNWFM3YZft8kXVX7AKsVsOW67rq7smRmTZobnC368o
	TU8aFLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsnJ-00000003x7K-3Gex;
	Tue, 12 Nov 2024 15:27:06 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAske-00000003whX-274h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:24:22 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:78de:3cf6:79c5:d375])
	by albert.telenet-ops.be with cmsmtp
	id brQ92D00l4mJWgD06rQ9ME; Tue, 12 Nov 2024 16:24:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAsk8-006q6m-9e;
	Tue, 12 Nov 2024 16:24:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAskT-001eqb-Pu;
	Tue, 12 Nov 2024 16:24:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.12
Date: Tue, 12 Nov 2024 16:24:05 +0100
Message-Id: <cover.1731424916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_072420_700251_A98D4199 
X-CRM114-Status: GOOD (  13.84  )
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

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.12-tag1

for you to fetch changes up to 124f4f1a18696c4198f9f903fd74034ea8b7d352:

  MAINTAINERS: Re-add cancelled Renesas driver sections (2024-11-11 11:11:17 +0100)

----------------------------------------------------------------
Renesas fixes for v6.12

  - Re-add cancelled Renesas driver sections to the MAINTAINERS file.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Re-add cancelled Renesas driver sections

 MAINTAINERS | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

