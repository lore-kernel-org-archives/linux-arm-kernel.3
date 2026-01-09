Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F670D26D94
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5RJrE9iu3AAG2e7ylgK1ozseoLRQiyaoirBfZJAtnQ=; b=qA3BrKNkoRf7rcJfIJ2m3RqBN5
	d92///ZhTOdteHUA1WPaLqdG7FW8ezjEIV9kv1kFPr4m8OTdPZbbezXM0w4NmPyKs67oCw9aXJZOc
	lwN0boUFoIWYWO/d05R2mNOAqxKruY55MQbFIxyFVDB6PsfLXC7U5wAhVpbEHx8T1UP+ErO/NB5bS
	+hOt8LDr5xgHFM8j5ieoK61ChujsNy1R6stYrPkUrxviimWDzBSnbxvJo+85+N+fuoUFaffGeDNfC
	OIYWQ9LKTU0in3d43FpAG0BZnUADyS0BaJI8gCyItKg2hndDotGHHmgh7rsEVGGxpSLEsi5nHtXbE
	EgL8D6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJK3-000000030og-3aY6;
	Fri, 09 Jan 2026 20:43:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJK0-000000030ni-2Vvp;
	Fri, 09 Jan 2026 20:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=f5RJrE9iu3AAG2e7ylgK1ozseoLRQiyaoirBfZJAtnQ=; b=0mvT/PbGRh9OZnqLcSrZpsjnOb
	yP9cFt3trK6oUFCtVbEP5qujsrD2emQSMPcusA0XHuETJz9fqvtMjU73AzVcgO1ujqxJGCRBUblyb
	fI8kdZWpF0bkNWE+pMVAKS1z2egHEQ8f853vglLDqtJdFFCGoWz2GsSwcC+cyCwsYrd+eEKI7Yzo4
	XNPjNcasRe3avUpDqs5zYAaIhGoUS4MjDUxYbXx1j5e+BPjcHwaz3dsSm28CJnl+J13NNBL3OUOiO
	RQl9nCXZNcnCJR8j9Z0vzjpDrakKEYiormETfKSNa7eyh+i5Wp2SSBRg+90qCTZcrvNl2/5rpGuXi
	/0oMxuAw==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veJJs-001g9m-Nf; Fri, 09 Jan 2026 21:42:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
Date: Fri,  9 Jan 2026 21:42:51 +0100
Message-ID: <176799135865.3468380.11555784321903491011.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805030358.3665878-1-linmq006@gmail.com>
References: <20250805030358.3665878-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_124300_639432_9F30C6B3 
X-CRM114-Status: UNSURE (   8.07  )
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


On Tue, 05 Aug 2025 07:03:58 +0400, Miaoqian Lin wrote:
> Replace NULL check with IS_ERR_OR_NULL() check after calling
> rockchip_clk_register_gate_link() since this function
> returns error pointers (ERR_PTR).
> 
> 

Applied, thanks!

[1/1] clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()
      commit: a8d722f03923b1c6166d39482c6df8f017e185d9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

