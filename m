Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A5DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 00:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkcYLVrfyzrDnXAcqc0mS88NGdiWubRSGkl2hXOaqEI=; b=tKAoXDEr5h2QFxUtg9vxf2rRUV
	QNweZw5IzO8Y3gAW2d+nao1dtYJpfFRG0Y3moExijAFCGyPBmtNxGiysSXxkeOdn8D6GC/VxgtBCI
	HuoCB9gtmaV+ceXgVmUINVtJ/S1PIb75by/Q0jf/IiEuuT6+v7U5sOGMjufd/RyPkwKRwiYaCdtXH
	AFO9Rj6+Ptz4N0/FEdHehY2Vl7xJgPBCGmMCFK2dS8sWiFuEWHvzqClnlRCvpWotQGAjd5dT4LgIr
	jlImm5bbgnupd07+xloHEVPIi7Dswp8mgMnzhCAkavUxqMumQtwj9mNeVNBHdyLcv18EuTgKMJpHk
	uV2UZQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQH4-00000006DUm-1aw8;
	Tue, 31 Dec 2024 00:38:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQFr-00000006DL3-3Nxu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 00:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCE4B5C02CB;
	Tue, 31 Dec 2024 00:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C96C4CED0;
	Tue, 31 Dec 2024 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605422;
	bh=dHiL+92MLY20VArQrBRRfiByebHH5+eZfSKhYTwTQbI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j+M8vcOEnLRGnRWknp3w+Leo1dOAhWrF/NLcX/E4geoX4bOOsy+5qiP9xO3+yMT6T
	 +XCbaP4d57ZZNL2aRnRpVE2cwKVisQ+RUoBqJ+bixeoKHOzWQaExjab1M+umE/OwKo
	 qP06QW+5lFyK2PfTZYgYZZ56OcC7uHcrALox/T7vJI02ZMIwWi1VEYEFtnuTQLkk8M
	 dkjePgJRLSHrzwM87MoVvJJoWIt36usddXmU+MHaigyzPGAYED9APlLF/Dh19hhfqN
	 SFqwUwdz3AlQlsqpmu/ncbxEQVyF7dAjRtTW26BV8Yc7OA3xjw+t7Fuf39olkW27+b
	 cJdmLC4y6o0QQ==
Message-ID: <c110a740502cda3fafa55828292ce34c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-4-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-4-rohit.visavalia@amd.com>
Subject: Re: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if registered correctly
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:37:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_163703_886147_FECC3D5C 
X-CRM114-Status: UNSURE (   7.24  )
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

Quoting Rohit Visavalia (2024-12-26 04:20:23)
> If registration of pll_post is failed, it will be set to NULL or ERR,
> unregistering same will fail with following call trace:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 008
> pc : clk_hw_unregister+0xc/0x20
> lr : clk_hw_unregister_fixed_factor+0x18/0x30
> sp : ffff800011923850
> ...
> Call trace:
>  clk_hw_unregister+0xc/0x20
>  clk_hw_unregister_fixed_factor+0x18/0x30
>  xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
>  xvcu_probe+0x2bc/0x53c [xlnx_vcu]
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>

Please add a Fixes tag, and put fixes earlier in the series so they can
be applied while other patches go through review.

