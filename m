Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvuuZ6aLqblf+H0W8nqZvZBIx+Xtg4eiL7p4ol//ojc=; b=lZqQJuvlydCAUNwVwt3GJbM9u4
	hUGEx8kzCynL45G98AvuTJMs8lcZtXsBOHbGrcQNkhzh0Ve5JAu5rCtk0dc/0CkmUEhOyDb+HrGUJ
	JyWvHuwpX9sel5LO83TpsAy40W1giIaMJSJSM12/Ch3j3J2QB7sU9oQIBcPcvyULx4b7W8gVxnoBs
	i12vSkNeGv2D40g4l5o4ly4G9x9Qmuah2IF3dtXwxVQm33YjgWY0MDgYWAdAf1V+U7rq3TE0Aeftb
	6BYTsHR8b5tMj8RwpGngJK9XNeTbqakqEQSK4CmommUFWtniQl/JNpe9pJypr1cPHOhGh44+SqJif
	e04HvA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCh4-00000000orv-38f9;
	Mon, 28 Sep 2026 14:51:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCh1-00000000orG-0aho
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:51:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 912994E41098;
	Mon, 28 Sep 2026 14:50:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36976601BD;
	Mon, 28 Sep 2026 14:50:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4672D10329684;
	Mon, 28 Sep 2026 16:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790607053; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=TvuuZ6aLqblf+H0W8nqZvZBIx+Xtg4eiL7p4ol//ojc=;
	b=UKL7/9h7KmpkIo3dALdGSlM5n7z1V5/Yd4YECQ5G4LmP12RroYSNYjfwu7P/4SYsf8U+JF
	54OHmcgorp8B56TQTY85WLxck1r4yQ/ovJbvx1oHdpVRbYQgSaHdYh5bSMUbo+KLjCgukV
	lORj+NtvVj8K7DLUMKPd02Gvm3JE7v83rohMt9sKrrkqoPOaIJJ2gWNAlqKDxDja05yiLa
	q5GR4aCvMdof/nokisMmUqyCAq8HR7eW1meMrwb+5be+XTr9fA9bMOMJQ5jSGMSjh/CKHa
	uIZPQP5flK4JuHJePICzTxXxh6+OXkJKoDYi9oeaiOWtwRV5B308kgP05j8qOg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Report RSS as not supported
Date: Mon, 28 Sep 2026 16:50:40 +0200
Message-ID: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_075059_320577_ED760BAF 
X-CRM114-Status: GOOD (  12.23  )
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

Hi everyone,

This is V2 of an RSS cleanup for stmmac, discovered while running the
rss kselftests on stmmac. It returns bogus indirection tables and key
sizes, when RSS isn't actually available at all.

RSS is currently not supported on any stmmac devices upstream, so
code that was already useless is now effectively dead. It has been the
case since 2019 when the code was added, as platforms need to set rss_en
in their plat data, and no glue ever did that.

Russell King ran a poll in february 2026 [1] asking if the code should
be dropped, without any reply going in either direction.

Jitendra Vegiraju from Broadcom sent 9 iterations of a Broadcom PCIe glue
driver [2] that actually sets rss_en = 1, so there's some hope that this
may be used in the future.

[1]: https://lore.kernel.org/netdev/aYd4BkAeNW6d0iIC@shell.armlinux.org.uk/
[2]: https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju@broadcom.com/

Nvidia platforms seem to be RSS capable, but it's not going to work out
of the box. Let's leave the feature there for now, with proper -EOPNOTSUPP
returned for RSS ops.

V2:
 - target net-next
 - Add a dedicated helper, following Nicolai's review.

V1: https://lore.kernel.org/netdev/20260926093343.292181-1-maxime.chevallier@bootlin.com/#t

Maxime Chevallier (2):
  net: stmmac: Introduce a helper to check RSS support
  net: stmmac: Don't set or get RSS parameters when not supported

 drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    |  4 ++--
 3 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.55.0


