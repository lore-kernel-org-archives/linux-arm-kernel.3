Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF61C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2xB54k8wnP3j+i/BezsfM/iJmqJZPrpAP/RKUP1HHU=; b=w/DtklkmEQH3nd6DtGAsk4R9XQ
	m+/kiVz+3L07P9XrlmeN4XbPQIAlOoctF8X6S6ev9/C7SaZwCGvo3+U7bSXkvfg958feult9da1mg
	ETjSePHZYpOvd8R2ZTnzryQCx/UjfuHFBkHKrOPiEyaRYG7pjQU8DvnzGR3+VU5G04a87CPoVxZMp
	WAQkYvmv43WwpsTLPRu4dBsT5aWhstf3aztCRnNiQRWAXG06u/kiFuxep3HSQpMVZx1fGs1srzucL
	YkYMh8v+2AYYDKqlc3NtdTAjkBrFN2+Uciia+FET7sPS3tCs2OIMQft+yHg8gxZupMV9K1+RrGepQ
	/BbCIQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2Iv-0000000EeFE-3H2k;
	Tue, 07 Jul 2026 09:41:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2It-0000000EeEW-2VMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=u2xB54k8wnP3j+i/BezsfM/iJmqJZPrpAP/RKUP1HHU=; b=D5jb2t6iILMTxhDn9DydV+DJS8
	lvx3Kc8zQac0BqKhR7encW4rHqpeP2GYBZ4IsrICbfw5rO1HTI3HYm0LpXnsFNZcejbTHueJ+jk1K
	g+EEwqNJ922YrexciPdtRsgj/ncWzAzJO3tEJFJ0Qr+99UyQdmZwnRVZq9zy8muujX1HABhpCbUXn
	K0+tOP5IAWN21Cpxkn7HNhRdFbXlZTI8ccZk0o0oAhU1DlHCc91MaYV/oImKPYBCi2+HMRhdIrwDQ
	FFvXckyt1qsOswrJrGEsLTRyjwXElvIZ0jh1QveLjwqkv0GMVR47Ex8t9kdr7F2edsUx2tn9IvVZ8
	BbRc1GeQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	zhangqing@rock-chips.com,
	sebastian.reichel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	andyshrk@163.com,
	macromorgan@hotmail.com
Subject: Re: [PATCH v2 0/2] Bring dclk_vop2 in line with other VPs on RK3588
Date: Tue,  7 Jul 2026 11:41:06 +0200
Message-ID: <178341726130.481833.2104125095372172924.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304121426.1184680-1-heiko@sntech.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_024123_695799_CED2FCD0 
X-CRM114-Status: UNSURE (   9.71  )
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


On Wed, 04 Mar 2026 13:14:24 +0100, Heiko Stuebner wrote:
> The dclk for VP2 behaves differently and its use can currently break
> other peripherals, so fix that and additionally allow it to drive
> the same outputs.
> 
> I've kept Quentin's Tested-by from v1, as the overall change is the same
> but did not transfer his Reviewed-by, as the series-structure changed.
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
      commit: 13b10571cc353448275365ede1a5396d20dfe839
[2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs
      commit: 778dd30867ad783b6903b0aa24a0ab5e97c2dff6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

