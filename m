Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A84C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 21:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV4cXvR7IyzQ/wF4wre+dCWyJpp3mi1Ow1AOyy26SAk=; b=j4A2Tf4ZTvVyFits0iDbexTtMy
	Sys/OKi+bdnip6Tgc4Al32oXVr4amn4rRKsPTp0/VZoJWLUfFvrxQc40HbHPkugxDKJEGJeFqQ+0O
	9f31ra9hKvZHZVHykJp0rkDNX6E05X7fmCjUcQPormEXNYTpFbM9FJEJvl75BZr9uB4Fsvci33C+V
	Z2EX2WoP9lGMFwGkcPQgLnpJy8kIAQ3+GrZ+wsP+SP55wbCdB0CSp+d28aAHTHiQwYLDSCBm5VeCU
	qykAk/ZgmyiAOKhqn90LQrPigM8kaFHx7nhDAQsXoYRbX2BNYtwbLmszddTLNVi0yfsuWlLGMahH1
	QubSEQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT6Ay-00000000K4x-3rTu;
	Sat, 21 Jun 2025 21:55:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT68k-00000000Jz7-1gVT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 21:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 359245C4BA3;
	Sat, 21 Jun 2025 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5BEC4CEE7;
	Sat, 21 Jun 2025 21:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750542765;
	bh=nQHCSruCNHH1sf9Mwvwst8ohiEy2euUE/z0M6MAEptM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bbIPaVk5U53Akc6BpwPIR+4FSOa4vTGZu1n/jHXTus5cLfXBFg5P+CHGhPl6UqlcJ
	 KFMCPlU4RrVpJ9hNiJ0nifcVwiMz5C9+VzxkmGynfw+mTau1hRUHPUJ6Z2gvKWIXZI
	 Pm9pzbSrTbi/M+IFz0nTx1r9Fw2GGghuypX+fDl7n5Xqq+7bXGjVX9APSI+sgxFR6X
	 Ty9KD6MqQv36qxAWvFstRSChAw/P9q7tm5IBxX0htoGNLqk2eQnxgw/KfCMeezFxpq
	 kHyfQt+YrQkBNsLTgbQcYFtssL9FzfbkaclcNz+i+8eYO+Xbt3o4IWSdaJgqHy0uOx
	 K8ggb3tE6MF+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250210113614.4149050-2-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com> <20250210113614.4149050-2-rohit.visavalia@amd.com>
Subject: Re: [PATCH v3 1/2] clk: xilinx: vcu: unregister pll_post only if registered correctly
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Sat, 21 Jun 2025 14:52:44 -0700
Message-ID: <175054276458.4372.13734001282575754373@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_145246_481877_CFA894E1 
X-CRM114-Status: UNSURE (   7.49  )
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

Quoting Rohit Visavalia (2025-02-10 03:36:13)
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
> Fixes: 4472e1849db7 ("soc: xilinx: vcu: make pll post divider explicit")
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---

Applied to clk-next

