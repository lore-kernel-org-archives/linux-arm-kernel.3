Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29432D59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=In7wYB8YECCaNM8JvljiA/vzvCsYyD5zaWgtY+RjHlw=; b=eC4qdsveoqib0GCfaoJxwSMph7
	l7lsweM11gFSEjUKt77/KWnbRwQsdN/3RiK97ZnMc7EX1KmiQPwcengEZpIbXJqQkcO48Fh8Zd4eo
	XLiMdQ29OnA2FpqJqb4eZuGdK6Cq+YqXZ3Nw+QUU8IyR6Cez5VcvrTR2/sCWlYI8QMoitaljBCJue
	6OlRESVE2CdJ/nKYHi+fWJgP9FEKHNN+Npfg8m9mPDb/6TRikQ5MMzn5hMUOZ1ciqQIxLWovWwaSt
	tx/GfZjY3Vg3E+3hMEO0HoFmXIZzsBqqoFgmBKP4o6Bw1WZh5W7HU9G8TS3CiQcvW3m/bKCYoACHe
	eIzCHZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kAm-00000004Ez2-0YsX;
	Wed, 06 Nov 2024 17:50:28 +0000
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8k91-00000004EjJ-249m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:48:41 +0000
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id C3C911F9E7;
	Wed,  6 Nov 2024 20:48:31 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru [10.177.185.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Wed,  6 Nov 2024 20:48:01 +0300 (MSK)
Received: from MBP-Anastasia.DL (unknown [10.198.46.47])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4XkCNK008Pz1h0Cv;
	Wed,  6 Nov 2024 20:48:00 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	lvc-project@linuxtesting.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1 0/1] arm64: esr: Define ESR_ELx_EC_* constants as UL
Date: Wed,  6 Nov 2024 20:47:55 +0300
Message-ID: <20241106174757.38951-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 188998 [Nov 06 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2024/11/06 15:41:00 #26827080
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_094839_792077_1CEB95EC 
X-CRM114-Status: UNSURE (   6.22  )
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

Incorrect casting is possible in 6.1 stable release using ESR_ELx_EC_*
constants.

The problem has been fixed by the following upstream patch that was adapted
to 6.1. The patch couldn't be applied clearly but the changes made are 
minor.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

