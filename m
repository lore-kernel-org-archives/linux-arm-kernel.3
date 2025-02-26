Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA1DC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JzbIqeQXUt8q2PM+AILYY5fiQ+cZd3odHZ4dQjhTTRw=; b=bu4Gfczzd0PMsjXnoFDEVXJ+50
	n+SBA+B1n/QPdHBPF4tCZVlkL15H4HHKfY7AuSNZ4xeEupzBGlnLLxwDdY+BBxg7jn16GF+INc9T4
	J2hFzd3LPPAKkn9iJ/+f1zEitH6+ckiFRQ2WWYtRH8RJ9Mfo/gbwBjFpBq5eA4d0/rBPmTX+O0QZ4
	jyi9mrUPq7kSdWoaXjgyXhUgBUgzY4FWuq+kvfI5OLcWF0+FHLmypn7gu8Itn8dzGc5FHAAvCjywz
	pEVFvYJwYnLfJB3u27yl3TleXCoY5l8mj5WTpfWYm9YZ1U9yG3Wv4aUJi/CHTsfLVaelJ/fbQKL2V
	YZFls1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd1-000000033pY-4540;
	Wed, 26 Feb 2025 09:22:55 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnD9L-00000002xxr-42zz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE42961290;
	Wed, 26 Feb 2025 08:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C50C4CED6;
	Wed, 26 Feb 2025 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740559934;
	bh=u8k8xkGSvhfumPla5cLuAM1wtrrO9kw4b4n1qMmxcCY=;
	h=From:To:Cc:Subject:Date:From;
	b=InbfX1ymiwGRRXfIM2HIgSzuEvpsr2TD33DQR5OF4niI33b2i21t11TqLm7YpGrEL
	 1p7La3xwQ2KiSlnf1tfOWALWS9XL0uP8RT8jKAh7pKSQSIwM2K/RXB7+bNalyG9V1O
	 JArbg9GEEg6U6zyEoLJfZOTxvayYKZmeG/bf5ZUQuFeAUAPC9mg8RCD706lGjqWFeb
	 GSr6j0jsM6neFbNz0V/8SsXCb+WRz8kb4rH3hf+Y64yu2q7dkzwjXGiVkaVZjui9lJ
	 pMEalQNm3asNM5ulpwslW+K/Fb0v3RsU/EUAMxyR+vAhoCTrCTk6MDynk7WpvXKqSW
	 Nvzybh344ZoJA==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH net-next v4 0/4] stmmac: Several PCI-related improvements
Date: Wed, 26 Feb 2025 09:52:04 +0100
Message-ID: <20250226085208.97891-1-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes in v4:
  - Add missing full stop. (Yanteng)
  - Move forgotten unused-variable-removes to the appropriate places.
  - Add applicable RB / TB tags

Changes in v3:
  - Several formatting nits (Paolo)
  - Split up patch into a patch series (Yanteng)

Philipp Stanner (4):
  stmmac: loongson: Pass correct arg to PCI function
  stmmac: loongson: Remove surplus loop
  stmmac: Remove pcim_* functions for driver detach
  stmmac: Replace deprecated PCI functions

 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 31 ++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 26 +++++-----------
 2 files changed, 16 insertions(+), 41 deletions(-)

-- 
2.48.1


