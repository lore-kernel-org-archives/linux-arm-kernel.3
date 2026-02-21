Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4646C61DEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZD1ZlANrf8P/MlRStCUZSXgHOShp4rteLirP3rZbn8=; b=Ko44Iks4mNKPoLwaoVLSNan3x3
	aSFsVsoe0RTjOzhrHNv3yVYAh//j/fDhPF73CLd/VzusGer2PRIHqWvfFCqrnMB67gPtOdrz+gNQe
	cO96bJwoplyaTAecT42dq+m1L49V3Kr57jhcxzv8X8U203hsRQdJkCQ/tc/RC/dIdr04Bgw7yG0qO
	NZJSjGWeXk3mU2HJutw3Zkcsk+nVBAGzraOH0/xbqVAIjTo2/XXTRKWdc4Y1p9mimK8Hy4dvrGhOl
	/HTPAvApj/8olm7M5yT5TDw/FZXzdfAUfD5N9h0+Lfv5zI7ELXCrXtHCNHRhv4oPQGFYfjhklLJsk
	usZZBXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtoKy-0000000G75x-1l5l;
	Sat, 21 Feb 2026 14:52:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtoKv-0000000G75a-0Xue;
	Sat, 21 Feb 2026 14:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pZD1ZlANrf8P/MlRStCUZSXgHOShp4rteLirP3rZbn8=; b=i4zTMbVo45tAtv8y/QZj4XJPMa
	U0BoNhx2iqCg+9mdhs17QPCQlaIx1n53MSWKvJgXCz+fHroUqXp1fy6Y5JZ5L/tvDeTdZ76CnWYtE
	U2cHEGdUoROjlFWk3Ca/OlhVkjyYwgmNeQT1CdsTeSSrTZEWJSeJG4oHKPjFjjoGr3pIYhusaw45O
	EogR4X49qGWUrKbvABVh0/k2OotblR7YVfknp0xzYOH1awiK48Njyj6m7pOtJ74Txy5WPCy4X3uym
	9hrZ9AMFN9WS1TNPtToorUu7dTwblrZeozUA4tfVm0CrQ2wwZlziNRx+54TJ1np1oOAdMgVTV325K
	JqQZoMqg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaopeitux@foxmail.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>, Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] soc: rockchip: grf: fix device node refcount leak in error path
Date: Sat, 21 Feb 2026 15:51:46 +0100
Message-ID: <6295978.F8r316W7xa@diego>
In-Reply-To: <tencent_BE953AE4AA17D089CF5C87EB6F4400F70206@qq.com>
References: <tencent_BE953AE4AA17D089CF5C87EB6F4400F70206@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_065201_195605_98890E3C 
X-CRM114-Status: UNSURE (   7.60  )
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

Hi,

Am Samstag, 21. Februar 2026, 01:40:27 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb xiaopeitux@foxmail.com:
> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> The for_each_matching_node_and_match() macro automatically manages device
> node reference counts during normal iteration. However, when breaking out
> of the loop early with return, the current iteration's node is not
> automatically released, leading to a reference count leak.
>=20
> Fix this by adding of_node_put() before returning from the loop
> when fails.
>=20
> Fixes: 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be hand=
led")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

=46elix Gu was slightly faster [0], so I'll apply their patch once the merg=
e-
window is closed.

Thanks
Heiko


[0] http://lore.kernel.org/r/20260217-grf-v1-1-2088c966875d@gmail.com



