Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCACC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGFafObwsjVU02Eyh4DXUOkXxUN1m7wsbVF2MFpd8xY=; b=1LXgO3WBP1V/q5vd3d2iaEsMOR
	8bRL/hnihZOJLzj2ftYw1AObGsXrTbcbQ+7ykh3dG9bz0RJ7n66Q1qfVVbMVhKZLQLDDmgsAMy2u2
	juLsglMV876hNzwAQQO8wsl17q0IDigbWMo3WwjF/9sJEvMTOcPaWDl9WJ+Y+kST1BnMzDpcL0lYl
	psDicuCb3CwDwdDC4u2M20Xh9/Kbnyioy4WWMkJrT51LfCMvz0IlhQ6AJ2xcvx6vhknLFwIn2dFBK
	n0sVv7DuoGxNo+KdBXwysDtYLkyySlJ+Jb46/FbOaDu/DSTkHxU6KUw7PS9Sqx1jzDGusrsQirtFe
	iQv+tXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs1H-00000007VjN-429F;
	Wed, 02 Jul 2025 07:36:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWryx-00000007VX6-1wow
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 07:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDA2E5C117D;
	Wed,  2 Jul 2025 07:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4068C4CEEE;
	Wed,  2 Jul 2025 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751441654;
	bh=hP4hON7E7oXvPH0f+fMbPL2IxVBYqXaro2alxaWbcoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/a6/TsNsNnMYUxaIXN827neJHzWqgazQ3TV8Ous25tztEpY6hR3c7mBETYq0TyL4
	 vuemE43LrGprxUXhuRxN0m3dudlWn8yjnciyTEBVayDdM6690odTKiqJahl3NRQPJg
	 kS5zlbBr74aXYyq4tOj3Xc7Bq3A/vuzl89M4UlAI=
Date: Wed, 2 Jul 2025 09:34:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
Message-ID: <2025070205-ignore-passive-17b4@gregkh>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-18-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701114733.636510-18-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_003415_550012_6B8AB2B2 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, Jul 01, 2025 at 01:47:19PM +0200, Ulf Hansson wrote:
> It has turned out get_dev_from_fwnode() is useful at a few other places
> outside of the driver core, as in gpiolib.c for example. Therefore let's
> make it available as a common helper function.
> 
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/base/core.c    | 8 ++++++--
>  include/linux/device.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

