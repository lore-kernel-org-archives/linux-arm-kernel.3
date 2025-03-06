Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD16C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD2otB9iYHNsUbW/D4OEwYhgL/joU14RHmM6fxcguBY=; b=W4hHGve3bqhSc0BWxbZqOffRK5
	V5cJiu4Td0hKQBGEYtqMPF+k790bVs77Y+ypiuYgX1IN7sGzg+nCHSyuNbfDANVVdvlJLeNdJsEZ0
	FwOhD7Zoy7fGCGO6tjm9GR8Y+xoP6v1mxZAbq8LZ3Z7rIRf200+bYpSL9P5out1WEjQ/ipqjTVj3X
	h3j0AdH63gRg405fCrlZDw4CXWoJ+aG1DDCZgT9zgTUGfM+WZO2cx6AfsqYIUKqbdnOabHQox02ZD
	4IKZjDrSFzHlHv2GNPw51KKNS3567E5tRUQH9YgGJvEQpN0P9YdGWoBuY0mmYJeyYO5gLB7U/SaL6
	NwqCGd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD00-0000000BIT8-1Nw7;
	Thu, 06 Mar 2025 15:19:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBtr-0000000B9Zx-1aAo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 14:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7AB6BA44CDB;
	Thu,  6 Mar 2025 14:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49D4C4CEE0;
	Thu,  6 Mar 2025 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741270113;
	bh=LkIfOHx5/dcrgATekQOsPiV7zPoeugPYPaspJUC3TN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbBGOB0R7RKhs/DksPDnNSPytvTgwWFHcsTcpTedR628UAdd1V7hYr2OoQ1UTTBvW
	 02xNfRmtsjukygDZ9U43L1V+ZUKF1AYJG6SxQlIJ7KKWZO79EfwGkxPWJQYH7Ttilf
	 3cFm0gEfLbNCT7erksLlyqRjF6GyCUq8wW7rDPKu3tF3FdWFBhnzQC1ZpeyCrIyZBw
	 fYJgkFk9mKgfbi0laikEy2b/4+jDbzZ+2cAhTRd9PS3BsOuxBKrnbBlmzWkA/u3aix
	 wt4PolrAAQV/mMkl4XJJalcoH+8oFj3v/7Bamf309Ggo6+KQE+jEXj5SO2PGZsfoko
	 9elPEPwaigtaw==
From: William Breathitt Gray <wbg@kernel.org>
To: =?UTF-8?q?Cs=C3=B3k=C3=A1s=20Bence?= <csokas.bence@prolan.hu>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	William Breathitt Gray <wbg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix undefined counter channel state on probe
Date: Thu,  6 Mar 2025 23:08:23 +0900
Message-ID: <174126995863.355997.16346927228585162675.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
References: <20250305-preset-capture-mode-microchip-tcb-capture-v1-1-632c95c6421e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=566; i=wbg@kernel.org; h=from:subject:message-id; bh=ZYCqo0M2oAeDQGbSQHEhiD46dBjTRHS0YFHniKGFDv0=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDOknV787fUt35qeoyqI1PbW3rYTOMHd/VktWXLrpzh1po 0snF1RO6yhlYRDjYpAVU2TpNT9798ElVY0fL+Zvg5nDygQyhIGLUwAmkpHAyLBIM/3u+faOSfom QZ+i/j/YcJ73uMP/TxOre9o28EZdFF3F8IfLqeXPV9bY909uN9zx4Y4VDNcLXlDx6e5cnZ0Rkhu vW3IDAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_060835_478773_85EB8834 
X-CRM114-Status: UNSURE (   7.02  )
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


On Wed, 05 Mar 2025 19:01:19 +0900, William Breathitt Gray wrote:
> Hardware initialize of the timer counter channel does not occur on probe
> thus leaving the Count in an undefined state until the first
> function_write() callback is executed. Fix this by performing the proper
> hardware initialization during probe.
> 
> 

Applied to counter-fixes.

[1/1] counter: microchip-tcb-capture: Fix undefined counter channel state on probe
      commit: c0c9c73434666dc99ee156b25e7e722150bee001

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

