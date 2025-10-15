Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B58CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNu33L8ch36XV1cxGKgfSp3VX2drrLW9N8Hj5z/i8aw=; b=SDtnKjF55nwCYnjJGcp2ztkb2Z
	K8GxlWQ0Lpxc52KRmXAp/Bf1xRbEQbNDPWRmXqQnCifpUQJmp6kXnajUtIavE3wlF8oMbjH6/yfOy
	RhVwqP6R5yDiMr2Amp8JVgo/rbTsDd8xPfIhQS7oVMfUGfJ+uap+7gwZNUzsWElb3o2oXQL2ytZ8r
	Q6JolgX/AcRRdsWuiiS0WEDXHuGvNswHwB000F34b4+Szg2e5Bp2epr1kQ4cSm7yNcF85KAxPtHZP
	s9OxFDF781osPuFvx25Z3kdzQcj4akVfRggZrIimTZiI0M4tOihfN0JbA3gJYu0giuadIDuDZFeLl
	KLwY0lcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjg-00000001H34-0eEv;
	Wed, 15 Oct 2025 10:28:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yjc-00000001Gvv-1pMg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 10:27:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 212A7C09F84;
	Wed, 15 Oct 2025 10:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 329BB606F9;
	Wed, 15 Oct 2025 10:27:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56F12102F22C9;
	Wed, 15 Oct 2025 12:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760524070; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LNu33L8ch36XV1cxGKgfSp3VX2drrLW9N8Hj5z/i8aw=;
	b=mrzSQhafXforNEw0F6kYH3MNXoL/dVHRTdiC2HIEhVwsAJ+CGjuKjlRoQ0ks59MMKitynJ
	lIZtyI9CYYmfNiciyApCb+qZyprauasRMJ9n8bFCDY8JKgH0i0ohcqhMHFe2GVN43CWtqQ
	h4wtx3/ioG62e9D5c+y4B+gJeDa3NbOnnRsrcvWYvb1gwL0fjAu3SE6YDod/NmmdzGCaaT
	HbHro0ZpyGy2LDJ1iytiHhO5kwGBfUe2wwEcGxhabSxX4utJNxQWMokrfJKeH+8AB+lLId
	YbL1o5EevDqCCSbOWpip8PDXdsQOAsLy2IvtzGcjEjfKiDVvpCIpxTB2kA+S7A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/3] net: stmmac: Add support for coarse timestamping
Date: Wed, 15 Oct 2025 12:27:20 +0200
Message-ID: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_032756_661608_5DFACAD5 
X-CRM114-Status: GOOD (  10.19  )
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

Hello everyone,

This is another attempt to support the fine vs coarse timestamping modes
in stmmac.

This mode allows trading off PTP clock frequency adjustment precision
versus timestamping precision.

In coarse mode, we lose the ability to fine-tune the PTP clock
frequency, but get better timestamping precision instead. This is
especially useful when acting as a PTP Grand Master, where the PTP clock
in sync'd to a high-precision GPS clock through PPS inputs.

This has been submitted before as a dedicated ioctl() back in 2020 [1].
Since then, we now have a better representation of timestamp providers
with a dedicated qualifier (approx vs precise).

This series attempts to map these new qualifiers to stmmac's
timestamping modes, see patch 2 for details.

The main drawback IMO is that the qualifiers don't map very well to our
timestamping modes, as the "approx" qualifier actually maps to stmmac's
"coars" mode, but we actually gain in timestamping precision (while
losing frequency precision).

Patch 1 is prep work for the stmmac driver,
Patch 2 adds the mode adjustment. Most of the plumbing to compute addend
values and sub-second increment is already there in the driver.

Patch 3 makes sure our NDO for timestamping provider reconfiguration is
called upon changing the qualifier.

Let me kow what you think of this approach,

Maxime

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Maxime Chevallier (3):
  net: stmmac: Move subsecond increment configuration in dedicated
    helper
  net: stmmac: Allow supporting coarse adjustment mode
  net: ethtool: tsconfig: Re-configure hwtstamp upon provider change

 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 62 +++++++++++++------
 net/ethtool/tsconfig.c                        |  2 +-
 3 files changed, 45 insertions(+), 21 deletions(-)

-- 
2.49.0


