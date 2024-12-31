Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSQxDb3E2iSNxsPxvVgpGLxXiKkf50d4xkctBp6LudY=; b=SPoiz57ElStXamw+TCGy31qXtP
	LO0fgLch7SHWIXSsMGtdQOLAI/5FCVj2F8QuroEapOrmI6NmM9/BAIR8AMCWbZtW4wXg+MOfJCwHz
	rw15cTLKlzkXXMJqpqKVwIK2AmsF7gDU16990Di7xO4t5W+vBpa/19XDsYxt8uWAcnsCmVJ/A5kwH
	yXbwTpwODi7hPWUt1XrulEag3Ely9O9IEZgwQ4GU249vqPnJdfZI1F5Xqc2NDOWFtI9q2PfZ0WgGw
	MHnj8+je5D4/eXwBKWPTHdFwRh+GsMIOVpJ0Fsk7w3wNgpJmh7rzJUg/x0xnHvy88vDQDuwqVfRL5
	06ofE9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQFq-00000006DKz-3430;
	Tue, 31 Dec 2024 00:37:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQEf-00000006DDQ-2OBQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 00:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB131A40C17;
	Tue, 31 Dec 2024 00:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CC7C4CED0;
	Tue, 31 Dec 2024 00:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605347;
	bh=EAQNHH/6r9U3uJVYIBbTF70SQX0U3RKDpaltiKDSXLs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s0z+/oGLrxRQV1Lbs5E2lP0zN3PnLPfA1RJsYuEXpUk/irHqwoUgQs4U3I6OeGTNt
	 IKcxEBZPeC8vAqWXN6SQqmy+owQt7+O7ttLfh8p0N8DLdgLPJlZvSZelOWf6jDCe4O
	 9OKXZXvu2Os0XLDofWL/9Is2W/eC/0GN67MpDLXRZcqs8Loxy0Qk2+YTEr4KiSxW4Y
	 2TbBZpItYFiwvL2rJ0KvifZY05DwY2sklZzfaqcgfevKf1G1D7kksYEgC62Hx/zjUK
	 Zy25n1t+xsfqQKiOOyL0lxox1KU+JL9oq1JWC+TSPqCq8avQpNDcht7gv5dk+VBQt9
	 5DRHNpCvIfuLA==
Message-ID: <6fcf5358bbace7400d35d3fac06254e6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-3-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-3-rohit.visavalia@amd.com>
Subject: Re: [PATCH 2/3] clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:35:45 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_163549_707768_683DFB9C 
X-CRM114-Status: GOOD (  12.42  )
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

Quoting Rohit Visavalia (2024-12-26 04:20:22)
> CCF will try to adjust parent clock to set desire clock frequency of
> child clock. So if pll_ref is not a fixed-clock then while setting rate
> of enc/dec clocks pll_ref may get change, which may make VCU malfunction.
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index f294a2398cb4..c3a4df7e325a 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -550,7 +550,7 @@ static int xvcu_register_clock_provider(struct xvcu_d=
evice *xvcu)
>                 return PTR_ERR(hw);
>         xvcu->pll_post =3D hw;
> =20
> -       parent_data[0].fw_name =3D "pll_ref";
> +       parent_data[0].fw_name =3D "dummy_name";

"dummy_name" isn't part of the binding. It sounds like you want to not
set CLK_SET_RATE_PARENT flag sometimes?

>         parent_data[1].hw =3D xvcu->pll_post;
> =20
>         hws[CLK_XVCU_ENC_CORE] =3D

