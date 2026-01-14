Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46002D31A0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YulQyABCOhh08KuJ/4XR2JYgn3KjSXLroNIV1O9N5jY=; b=eqA2LvTM9iP74atgKNc2D/QSOz
	1eqlqKmVW6tfhdU9BKGKbT3o4Zs0iMUazyOxG0+V6YrgDIWaPGMa4m+66jXcbxDlN+9NT6ON99Msr
	SVmevKxbuWQU8GLHiQcKxcNEwpAjvmHsgHVQg7vMGBb56dwhHhZRCdn8ScucWe9/gbkY+gottHJdQ
	zHdebij3UChbXOJrCEfGTL4KSr3LQ9SWPXwz3jc19YbBuQLnYoOUvEbyfaiq9JeMPkT4ZhW3m5t4y
	u810hYDL+O3NXfAREkvqsQa3qAGkVtQA4SnTwLleqf8TnTOFgDJBXn8OAJrL9manGJ5qd2Z68v2aW
	TezEtJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuX0-000000088GW-0ern;
	Wed, 14 Jan 2026 06:39:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuWv-000000088G3-2X95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:39:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWn-0007HT-29; Wed, 14 Jan 2026 07:38:49 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWm-000Xuc-1Z;
	Wed, 14 Jan 2026 07:38:47 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vfuWl-00Bca9-2D;
	Wed, 14 Jan 2026 07:38:47 +0100
Date: Wed, 14 Jan 2026 07:38:47 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
Message-ID: <20260114063847.bu6dx5w7h5jlg7dg@pengutronix.de>
References: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_223858_873869_FB5754C6 
X-CRM114-Status: UNSURE (   7.52  )
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

On 26-01-14, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
> which skips proper cleanup if the clock enable fails. Check the return
> value of clk_prepare_enable() and release resources if failure.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

