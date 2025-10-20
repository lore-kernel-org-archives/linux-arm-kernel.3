Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE20DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PWnVKIiov5KTPY8I52QIFf+vtTOPlLahNCTbyp5PPc=; b=PauNnaCfsQBIWb95UWs8BsHMRB
	khZQgXNWv6aDDWARUm6848O9fAtQEW72uEA5a50LLEgWUhNTM0FxhrCQ1ZOe0Q1uKY5FLMS4kJlUk
	0KdzgoRVhOe1EBPDgB9+PbFbmV/rY71h+NcAEbp9ThIy5abaZzaY6+1SYgQnOhhYrOjmWecS8cAnF
	hmMPZanGo8J/K1GBs5b2OSCJr3QrNESA51Y94dy1Mga15iQp3zp+MJtk0Il9MbXeE+i5d6IbfT2w5
	BrktRmUfwVsZZyFK2xfXVqhdjqtlEgEeeVv2VNv8ThnqQfFgO3VCqRTGQWwUVF6NPTKIQwhQXA3D0
	lCUVLHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqWt-0000000Dtkx-1Pt8;
	Mon, 20 Oct 2025 14:06:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqWp-0000000Dtif-26hp;
	Mon, 20 Oct 2025 14:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0PWnVKIiov5KTPY8I52QIFf+vtTOPlLahNCTbyp5PPc=; b=yjg46oik+aetf7YnXtGPN0VGZ+
	h6il6ri2MY+hGDwuUdoRtlH6a+lMGLhy+KKASiNd5f+d4eXgAGmpH5DzpCK3H3fUnn9kOn48pO7Yx
	DcXyqKHBiVBaP1IxNrF0uJdY+bKNpGIItjOP2532bhdJGK9mMlxKSB788qk/4zcBwWynXX9Nk08kq
	yJz7qVWrv5mej8Ng/DjvWKg/NAk+o+v5V4LuF7nPr54Pxc+Bn5e1YZG348I20YaCoGtJtGK++4CwQ
	+9M3DaTuZESlxpHh93EkfvIbF1RJb3TFNeDBBCXN0gLf1m9SD50o6rf293TDiBkaN3g+s3Q4HxKUn
	L3Xkl8YA==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAqWc-00020A-7K; Mon, 20 Oct 2025 16:06:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
Date: Mon, 20 Oct 2025 16:06:13 +0200
Message-ID: <13870920.uLZWGnKmhe@phil>
In-Reply-To: <20250810-phy-clk-round-rate-v2-7-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-7-9162470bb9f2@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_070627_532758_C0739684 
X-CRM114-Status: UNSURE (   7.29  )
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

Am Montag, 11. August 2025, 00:45:35 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Brian Masney:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>


Reviewed-by: Heiko Stuebner <heiko@sntech.de>



