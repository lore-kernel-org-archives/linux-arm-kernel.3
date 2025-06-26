Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA012C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyiFPqDtFrSQdqxYLEQlpBfXMXYJcQrLo+YRsrs7Dww=; b=kw1sSMS8aHrwqSdA2EZVPE9+ZV
	4e6fkHXlSrlYBGGNB2fvQgcfSCtcwpmO250RUYpbG/DSKb0EMyl+st0lX0/OzIOg2xOlje+2yc502
	5zBkdyHSda21jcol/QHC9P5XE4rmEp8HFNUkOImrJzBX4heWIDPRf8ovAVnD99F1y2wgi7H9l5hDG
	J/Rf7VVOFUdWajtlCAOHB9aPbTBkpRaUWxTVzDXaiRsR67ABYT1juP0ivB+AD5c7dWHS+PjFOy4RJ
	wYYFsBN88WfLc52kOH8lp0wZX71px9/KH4qG9eA37M046JiIO/i7MXsUTumQKw+gwPlJPpHX52Rft
	rrZ5FYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhei-0000000AtSs-3C9q;
	Thu, 26 Jun 2025 08:08:24 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhVP-0000000AsBZ-3cXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 07:58:50 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BE4D41F8BC;
	Thu, 26 Jun 2025 09:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750924722;
	bh=dyiFPqDtFrSQdqxYLEQlpBfXMXYJcQrLo+YRsrs7Dww=; h=From:To:Subject;
	b=MCQAiFkEd1aMh3AbCF5YmuzB7I392mwNbcwuMLYzTVwrNUWjpy14Ggx/QX8zPU+mK
	 dHqO09a79r+Xj7G7xLVcFATosAXYjW6bjQ+v23oWK3FCY5KOl2mxUziUIyCoCJwru5
	 3TK9nhKLaqAF10z9SVDx9RBh4eOFpFJuE+LfOHXHmE1keVQX66adloUle2vk8nJqsL
	 SdsUMn21RHDDnSUWJfZScXDuti/fRMx6dRLor3hv5YT2ZnTc5vmMO9qF3V3eVIXX8Q
	 FTtEwcxN7RuKS4lIR4Z81jg1C8s/8Zl3kW4lfgZIaPSe5BcUbw0naOgBjkF+Zg/BHU
	 Zlb0Apcubz21w==
Date: Thu, 26 Jun 2025 09:58:37 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <20250626075837.GA9216@francesco-nb>
References: <20250523082931.23170-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523082931.23170-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_005848_937687_23EEA7C2 
X-CRM114-Status: GOOD (  10.21  )
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

Hello,

On Fri, May 23, 2025 at 10:29:29AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds atomic operations support to the imx-lpi2c driver and split
> the previous v3 patch into two separate patches.
> 
> The first patch replaces the open-coded polling loops with readl_poll_timeout.
> This improves readability and consistency, and prepares the code for
> integration of the second patch, while maintaining the same functionality.
> 
> The second patch implements the .master_xfer_atomic() callback, enabling
> support for atomic I2C transfers.

Just a gentle ping to not forget about this.

Francesco


