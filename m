Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516CFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk78a+V8SCEPOMRyTIoa4fUSGyDQJ80SaoIOMYf4mxo=; b=hC/hlIrE2rQsCo/erNYvXTDP6u
	sV8Za+wdnOuOmKSCJJnN7ICLPeDbgGRXq0iuvYOx+YtKKTiPO+Fyf1/kUhC2Z7IQ636QGWsD9OMYJ
	R72/S8kGD4Ruv1/lNsN98TjLOd/6p+UrhcKcUn3bWAAKir9Hmz0U0f+EuD6jLsUIQo7sBWdhr4ZzM
	PKCwpdo47M71YtJ9yRKFDLJqMlRIqOjh0An0OhfbMEBYtmMXolPTXR1Z5szhR5bkOO3Mgngc9ZVBo
	8CzEgcoo2P5zOpDAtPs4Gvw8LEPuyIYwP2aQxAPgK+I3S4zPVloKbxikRMVJau9cI/aXxUHFWgl91
	oyeqGCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3ft-00000008WGM-3H8i;
	Thu, 24 Jul 2025 21:40:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3dT-00000008W1z-1kg0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18A5F5C5B90;
	Thu, 24 Jul 2025 21:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CE6C4CEED;
	Thu, 24 Jul 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753393073;
	bh=Kk78a+V8SCEPOMRyTIoa4fUSGyDQJ80SaoIOMYf4mxo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U0RaP6Qy2A85SHsCUAzQFXalB+ePzDyIXEVcPG7Wjg1GQlVN+ybFh6lCa7Y87G2Ql
	 psvtI6Q3fiGY0ZCR/Z6kdnhd7ciIby68asBPKKV/Iunzy4+9Crz1CAdOcW3jiQWTkH
	 BQIqhFcngs9jAS84Jty99lX3eVyyypy28eyCu8zPEMFUPxGTBOw1WhpIbJzDkFo5nR
	 fvwH7Oopc5+E4mDFXiwigN6D9Vy/aC8+XhRjkbeWVqC3qSy+U9gIE2mHfi0a7d9OOs
	 98/BlqFSwWx4E5akKTLMCc8+ZLN/x2FdBfKbn+9ZuzH1peQsrLoFF8ohF3KglOxcjR
	 BFMfz4YZacAkQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 06/80] clk: imx: Remove redundant pm_runtime_mark_last_busy() calls
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 14:37:52 -0700
Message-ID: <175339307281.3513.6881609632116291164@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143755_500316_7D547804 
X-CRM114-Status: UNSURE (   6.55  )
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

Quoting Sakari Ailus (2025-07-04 00:54:00)
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Applied to clk-next

