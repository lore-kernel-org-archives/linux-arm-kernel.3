Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F73DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2oOEbdJekGXI3A9rV0u8aK5n45P2xwaK+3iBiwkQKI=; b=1Hx/Ni1wBW6GQ25gyme6LbWRqV
	X3k8id/1uRn/AL9hRLeZ5dCyHJBtRHLUxanMyfJNcSG+HaCvoGFibt/CqnMu79rljsZu2EsqGLom6
	BO/gQyMu9uMSZZ8EZMDpk0dFL6f/XWLOKFL9lIiFAe4rFmBIdKbJrVcT06pNcVUw1huOsVKDctNK8
	f2b6rBTSRRZRKF9wf9zwAhlVI5ltQLeBhuXwIrcAxOpLBzNpqdj/DG+KqFYOMDT1QiaKaWuGhZ1oq
	WmJKHfHLUZ2UGRv7vKZo0JZs9KIBhAdM/QdMdrFDf5wVX+XX+yyxIjS48elueFtuGYoXyz3sT/7ci
	SERs3YNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4o7-00000008dUH-2JqZ;
	Thu, 24 Jul 2025 22:52:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4EH-00000008Zd3-3RQs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B8075C67B5;
	Thu, 24 Jul 2025 22:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0010CC4CEED;
	Thu, 24 Jul 2025 22:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395357;
	bh=U2oOEbdJekGXI3A9rV0u8aK5n45P2xwaK+3iBiwkQKI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fXqetHVFnvsdrucU3xwpLibN8E4/WY9IYuRC7pMDOPqUvmkWA5BY0gkY5WFR83AC6
	 V9HpZjUwfksxTxjyFwPbVg2xwErQDyRa4tcfEDmoUw/3ng7dLN2SrG+H31dELbuN+i
	 ulZCv0kwBPXfNrGTLdqSbwvh32is89Y1CyjK8pMIhjp89uVDVf1Yvb4aNA6xDwpZRQ
	 36q4tid9lsoohItNALMf0rKqp8TbApiMpv0Pv1nDTmfOrnf4PjUy2fMIktyycV6T7j
	 7Vn+tNWfgFAb5j6gOtFtLVvLKP0Ozg8b30sB/sJWhxqcZYwkl4jRBwhe+bmrI8QjK7
	 KUlBR7mmDY3JQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-6-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-6-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 06/13] clk: imx: fracn-gppll: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:56 -0700
Message-ID: <175339535635.3513.16202959951085662157@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151557_893959_8FFE8ED2 
X-CRM114-Status: UNSURE (   7.23  )
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

Quoting Brian Masney (2025-07-10 14:10:38)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

