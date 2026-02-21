Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B61C61DF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s92sJYFqlhkw0TjQVyNXDxEdcBPXkyRZyqBIwjAhEs=; b=pzdDIMfRLe+Lj08+ywE2cHmafu
	gD0u4a7z+EesugQ96k356ztYNoK4s4ddnGPqO8E8bKVaDTEfRAz52vJlxDrciBOSraigVibKku1Cp
	7mLBkCHOYeCsvuvfGQ3B+wscPMOqWaDZpihzkatPKU598dE/kg2fUl2JXd0GFJzP4crS8L7jGE8TH
	FqI5n1CRj8KFpdMhbVrCkw1Ro+phIx5apFXtYgpHBESgZp0GIfPEMSEVB0d4rplvHzYwJE/2+lZuo
	ZyCD0dMay0F0R9iQIfbxfnGEOT9pQi7o3Th0VB8JkYQj37xOQRlIjWzZ/tj3N8cl8eYkvDuTRtbBc
	3HiYtOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtotx-0000000G8q5-3vZB;
	Sat, 21 Feb 2026 15:28:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtotv-0000000G8pZ-0YBS;
	Sat, 21 Feb 2026 15:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5s92sJYFqlhkw0TjQVyNXDxEdcBPXkyRZyqBIwjAhEs=; b=VkSBeE4wVQtSaWBxrHrtzxO5Dw
	b5qIN4wJr2YcOGzIU/Xlg3pWbrTyCsp6zobMTx0Ue8OSKe8TH7s8AFGrgx3LecbOqhnjN1nQWz1VN
	n8nLX5mFn+22Qhs/my6L07QeKvapdQd3HY4Kb6syBeEvCT/Hyd6Es8WZp3OLylckrnpknSsHXJV8x
	GOfSI35BDJjj/VlvSYVkfXHsKjgiv+c/UztONWVSgeGXFn+DGenYmj6ovWS8ARJHHzCL9V2DqDhkg
	Y7t6e0PG5AxmfJky5xDWRrDmpuLTUwVBvjPBjIUgq9Tlw+G2O57Avteix1n8kAhwh3UjiBBcjQSM0
	0Dri2gGw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] soc: rockchip: grf: Fix device node reference leak in
 rockchip_grf_init()
Date: Sat, 21 Feb 2026 16:28:08 +0100
Message-ID: <50476327.XUcTiDjVJD@diego>
In-Reply-To: <20260217-grf-v1-1-2088c966875d@gmail.com>
References: <20260217-grf-v1-1-2088c966875d@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_072811_166236_3447EFB9 
X-CRM114-Status: UNSURE (   8.02  )
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

Hi Felix,

Am Montag, 16. Februar 2026, 21:11:32 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Felix Gu:
> In rockchip_grf_init(), when syscon_node_to_regmap fails, it returns
> without calling of_node_put(), which causes a reference leak.
>=20
> Add the missing of_node_put() call to fix it.
>=20
> Fixes: 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be hand=
led")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Shawn was a bit earlier with a similar fix [0], so their patch will go in.

Heiko



[0] https://lore.kernel.org/all/1770814957-17762-1-git-send-email-shawn.lin=
@rock-chips.com/



