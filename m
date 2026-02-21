Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ACDC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpBqYzKJdyWjUpSjPg7WvZWakCapieEoFK6pgPGGYMs=; b=f/2dn/wanek8aZXO5lczyvbeb9
	bsyfqcn/jHlaYXW/AuCxZ2fFTAJE8uDFuAVp9pNTMS02lfkK9GgaLjVzG7CCdBqJfb/AuFVDSRRRL
	yE0MuAp4SpUHfJDPIXFiDmd+qjnytsfh303794EAvT3lCNGxx1YRII5N4UJmi3uSk+6j32/DvaDyG
	n7CHBqhX4cXf/N4+3scaas3iXGlfptChG9TTBWfo4TRUpfnxG+zSy2jRLx5HCMvZaKl3cq2Lz5K9A
	ZW37QQAJJxeWvoJChadHtEWYT8MfA/jqNhi1i4VQ6F8jtxzt7SYtabGfWWu46wthTR/fAxoetmiut
	NMdl8MXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtosl-0000000G8fn-3TlG;
	Sat, 21 Feb 2026 15:26:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtosj-0000000G8fK-08k1;
	Sat, 21 Feb 2026 15:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CpBqYzKJdyWjUpSjPg7WvZWakCapieEoFK6pgPGGYMs=; b=wa1bCZvd3zQ4i2ZKK4LlmvRFu7
	FI7MZ8H1i3KUcrEtnbI6HU6uf/BHG7mbx5oj2ai/SXFm0FJ5Usekh+LOeRZjtZRHV0VNfrHuG0WIF
	sdb89KFHLfGpGoN/yFOOjFgt0i06jkR24Y6/oDV4zjHtfW6oNs2AKqkzWogmN2+OQwUvZQp8qVj3A
	Kd6pQZxxY2JAvZ3AU+FnJFfvMsVu+fO2hcGPYeGEsSlFQb4h3qxEZXsLiTbcfZUAj+z5K0NIbddCi
	wpXyCWLccXy5pdq91pjprK2iZ9+8GqoZhMakYgkBVpIU8Z2adRb/uqRvPcSScrRnzaFhFUszEBVrj
	jv3sjFCQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaopeitux@foxmail.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>, Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] soc: rockchip: grf: fix device node refcount leak in error path
Date: Sat, 21 Feb 2026 16:26:45 +0100
Message-ID: <20948198.jiFIW2sfyF@diego>
In-Reply-To: <6295978.F8r316W7xa@diego>
References: <tencent_BE953AE4AA17D089CF5C87EB6F4400F70206@qq.com>
 <6295978.F8r316W7xa@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_072657_090657_24CA1FD4 
X-CRM114-Status: GOOD (  11.52  )
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

Am Samstag, 21. Februar 2026, 15:51:46 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko St=C3=BCbner:
> Hi,
>=20
> Am Samstag, 21. Februar 2026, 01:40:27 Mitteleurop=C3=A4ische Normalzeit =
schrieb xiaopeitux@foxmail.com:
> > From: Pei Xiao <xiaopei01@kylinos.cn>
> >=20
> > The for_each_matching_node_and_match() macro automatically manages devi=
ce
> > node reference counts during normal iteration. However, when breaking o=
ut
> > of the loop early with return, the current iteration's node is not
> > automatically released, leading to a reference count leak.
> >=20
> > Fix this by adding of_node_put() before returning from the loop
> > when fails.
> >=20
> > Fixes: 75fb63ae0312 ("soc: rockchip: grf: Support multiple grf to be ha=
ndled")
> > Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> Felix Gu was slightly faster [0], so I'll apply their patch once the merg=
e-
> window is closed.

and I just realized that Shawn was actually even earlier [1]

>=20
> Thanks
> Heiko
>=20
>=20
> [0] http://lore.kernel.org/r/20260217-grf-v1-1-2088c966875d@gmail.com
[1] https://lore.kernel.org/all/1770814957-17762-1-git-send-email-shawn.lin=
@rock-chips.com/





