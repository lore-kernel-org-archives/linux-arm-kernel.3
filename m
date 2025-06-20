Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05CDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tj/Xwk891GYSkSPbp1zOl4nGGFjBWl+x0JXMaKYQgy4=; b=pIZs1sjfjwt1ZTElfgaNjd0Ieu
	QNpU1PTOCtHIhDKCCiaCkh1D8M6U8MHB8gOtxFmhTPlhM5TjhH+fWZVGonF9w9Jqd2QL81fy2n6nj
	CodY2JFcoXS18oAzwH7ftrkbuDo9Kc32l2LFAo0NRLFJo5tA+5pXqN+zfMzlW1MwqgDgigpgyiYX9
	diSj9maUVUb1oFDoLQUnTupjOKnBGc1OsvII0SvBWnsUNudwZSV+o+KD/Gu1Hlxlj1O4NBSW9GDfl
	PCRoiyywHsVr9WItwpgyKWgRPR3aJANbKBx0d/BPkxne/slpj4EcxkBJS6Tc6XunewKJZyLQTSs2w
	kTC18SMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPk5-0000000ETPh-2wVs;
	Fri, 20 Jun 2025 00:36:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSPdy-0000000ET35-0E9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 00:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 104B75C57E1;
	Fri, 20 Jun 2025 00:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F35C4CEEF;
	Fri, 20 Jun 2025 00:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750379409;
	bh=94Lp03DmKEYMZSuv0ZiVjs4rQ14XbBrJIqhyLo0+8J8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L8VLQmM8Uba3vvqfAPrS8yiZXctb0PiTE5txEc+xp6R3EmtXXRN0Ko7mFFS7pnp4D
	 ezVfLxBo68B/Cx1y4poNuvLeI50x7gMz8+VqwXPH+u5sILgVhy3elN6iMtWcc5aFF2
	 gcrif9pW3bErm1NsNgw1Fb7hgaP3c723b9vHIkyR70zZzt/V56v+zxkycnhZAUnLGy
	 /Re/1BW3GD8JKlsUtEwGQjkK4jAE5n7S4NSepDmkhzxSOgoxuhMMnTtZF+Zh/wJtil
	 6DJH0Z1ISidwdMyNQgXsS0Ien98f3w8PyiZMfSX2ZYCnZmp7GM51/kOLbBz54EdSfS
	 ZQMHFJdTGhjWg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
References: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
Subject: Re: [PATCH v3] clk: scmi: Handle case where child clocks are initialized before their parents
From: Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
To: Cristian Marussi <cristian.marussi@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 19 Jun 2025 17:30:08 -0700
Message-ID: <175037940843.4372.15491046245744789361@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_173010_130113_51B263CF 
X-CRM114-Status: GOOD (  12.84  )
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

Quoting Sascha Hauer (2025-06-12 05:56:57)
> The SCMI clock driver currently assumes that parent clocks are always
> initialized before their children. However, this assumption can fail if
> a child clock is encountered before its parent during probe.
>=20
> This leads to an issue during initialization of the parent_data array:
>=20
>     sclk->parent_data[i].hw =3D hws[sclk->info->parents[i]];
>=20
> If the parent clock's hardware structure has not been initialized yet,
> this assignment results in invalid data.
>=20
> To resolve this, allocate all struct scmi_clk instances as a contiguous
> array at the beginning of the probe and populate the hws[] array
> upfront. This ensures that any parent referenced later is already
> initialized, regardless of the order in which clocks are processed.
>=20
> Note that we can no longer free individual scmi_clk instances if
> scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
> platform has proper per-agent clock discovery.
>=20
> Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
> Reviewed-by: peng.fan@nxp.com
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---

Applied to clk-fixes

