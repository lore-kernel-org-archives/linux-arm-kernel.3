Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA017C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFk55K1kly3QmDyy19/fsabJcJ5u/gTtXyl/wVnrSrY=; b=u8IMx8MAU6ZYN3aMnqM/u857lk
	b4DsrH6oO0qSt7DUAKu5VBG5R36/9Q+D9iqqszN+tod7NSg/aJ/otTqaLJ+DZFcXVp8yIAs24VbRa
	jOPgYZ+zsC0loiiTdRUE/ddefNlMhXaf+lSbedaV/XUBzHdLVyjWyohp0usCCamlTvVH6L/3ohfSZ
	fol7GKwHTRa1wMPG1pDFEWpxMgMf5iQYq6WVYRPKSl41v/3nfZQOREZTI+U5xYOwf0IrcD0ItHfUP
	SslyKVtSKcnh9gKVQ/HsTgvJ7TNq/1J5s31kZSnVJadrleed0jvZJYVj8GJ5gObvqtMGKBcRgManC
	UqdSdeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojqA-00000005fAQ-0nA3;
	Tue, 28 Jul 2026 15:35:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojq9-00000005fAF-2IZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:35:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9052600FC;
	Tue, 28 Jul 2026 15:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D75C1F000E9;
	Tue, 28 Jul 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252932;
	bh=MFk55K1kly3QmDyy19/fsabJcJ5u/gTtXyl/wVnrSrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHVlee4AjFj4Rr8cc/GVE39rWLIiCURlB3GmRiKSJRDRNVMJL4v66BJOrC8/YYLlg
	 8OoNDHzJsSsuW7Og+m9+jPZAbm920D4Gb4htpYl623fj21fyxb0JUGLqhu/y0QSXYu
	 l/dDL8eWwjONd3Ss5WBLSj/iaJEo23i6JOidM/FzOyQuu5EmpN7Bd6qkAjsqxmaDET
	 K98qYzlGLL8YR10Z46EZ6hUW9AY3WEMHPxaA4Es39nfn2cdH2TW/biCkMoCyTg/wBK
	 yTA5zc0PcUvDvZ9OlA4jjQwk9wt8lUGhpDe71B8nUKgYj1+5EBzBnst+OWQywdGwW8
	 ZL5WQWKAQiwBg==
Date: Tue, 28 Jul 2026 17:35:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, s.hauer@pengutronix.de, 
	festevam@gmail.com, carlos.song@nxp.com, haibo.chen@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx: mark I2C adapter when hardware is powered
 down
Message-ID: <amjMGwf682luwT22@zenone.zhora.eu>
References: <20260525030400.3182911-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525030400.3182911-1-carlos.song@oss.nxp.com>
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

Hi Carlos,

On Mon, May 25, 2026 at 11:04:00AM +0800, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>   - suspend_noirq and the system entering suspend
>   - the system starting to resume and resume_noirq
> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Fixes: 358025ac091e ("i2c: imx: make controller available until system suspend_noirq() and from resume_noirq()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-fixes.

Thanks,
Andi

