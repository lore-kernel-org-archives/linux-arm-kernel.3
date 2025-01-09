Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DD4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUlm511Gw6bfAKIjKAuptGEWtpuyyApd/0usSGPr4Ss=; b=Y+nIqFJLs6k16zw7XJyJ+bzOri
	DnZ5lS/xBeczv2T/4xcXKyP1zuBpsoFYAUcudcIbxVN0uhf7QRQ5usPBJ4gDbGEr5eVwkDUkGXlOH
	Z9XFt29bbYUbmE449TAjPk+3dYOUEtuEYgpferZirKG0/f6JNRJumzllTfmAKlrlK5HD9p7hsptvO
	OGnx/fDBknRitUT5oSEhM781W5afX1KA50NKETjCFlMnGMp9DppK2CLjJptkOxXKQW5aEJqZ0Akrb
	1Q4J/VgWLbdfsIQyrUIvlqyoY9SM/PI5ce+TwuLaDtBSRnRHkPWHwVTJwte9gcEGJi9SWZRyN8xJ9
	MjhOhJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvsQ-0000000ClfM-1CfD;
	Thu, 09 Jan 2025 16:59:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvoj-0000000Ckzb-2Qqc;
	Thu, 09 Jan 2025 16:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MUlm511Gw6bfAKIjKAuptGEWtpuyyApd/0usSGPr4Ss=; b=JW/9qBbBthVjUXuTF2VIHsrJMY
	9I+98CZ+krOTVpX+WqGVAJuGPqnFGLQ2wv5CDmrSacSh5shptRVeHGuByG2nIx/hlAPtK/EPoR0PE
	O9P+M2O/Cfwh8wsHH+bP0WiZ8Fy+FSHew4QoUCh6Z/4drJcHh7veco9nM63E8WzvuCD1k8t58KpWb
	dBlPGeE7D97DQ/16ozDLzsikrO2pKakHYwxWOvS+h/Gc1hGuR4sT6vxAAvlMBqWtoSNwZ8s8VttA9
	CMmYDy5+Bt/jb2qGAfqnhGxFw0vNE9xW53ONJk21F3dSJzb/lSZRPCtbgRWtXsQkontwgaxENTQ62
	5PNOUGNg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoh-0003hx-TU; Thu, 09 Jan 2025 17:55:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH] clk: rockchip: rk3588: make refclko25m_ethX critical
Date: Thu,  9 Jan 2025 17:55:17 +0100
Message-ID: <173644170631.2899934.14400201527459535334.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214224820.200665-1-heiko@sntech.de>
References: <20241214224820.200665-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085533_632380_0E9F52EA 
X-CRM114-Status: GOOD (  10.69  )
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


On Sat, 14 Dec 2024 23:48:19 +0100, Heiko Stuebner wrote:
> Ethernet phys normally need a 25MHz refclk input. On a lot of boards
> this is done with a dedicated 25MHz crystal. But the rk3588 CRU also
> provides a means for that via the refclko25m_ethX clock outputs that
> can be used for that function.
> 
> The mdio bus normally probes devices on the bus at runtime, by reading
> specific phy registers. This requires the phy to be running and thus
> also being supplied by its reference clock.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3588: make refclko25m_ethX critical
      commit: cd8b5366636bdff0449b789fb2d33abb20804255

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

