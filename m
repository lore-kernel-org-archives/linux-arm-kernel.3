Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96437C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZIgXNwGR7Yo99elXKD9uUVyzk04ncHtQVluQu/4NnI=; b=x+Js2Ym8YYb1Q2er8KnhIJxZvc
	u3PXt2zYmuLlpVQS7Hw2zrrgDKE6HktqVNILuHNh6BTZEonFwyEr77Qqi2Tux8G2aSPmGrds1Kw2N
	mHWXF0TfMRhxR64Q1tr2eM0bo8YTj75uQXb+q0o3jtEmHvrJN8FiTl3mdhnEJLDfjUnbpOQMpSULs
	+3odLDn8pkMlhp1YrIQoXeqSWVmpQgMzfDN3CAh9x80MGzVzHp+ZSCwakKcC007pd+wuPB47+P81N
	ZGRU5TcO49fsNVOioFtsn8EJSZtHd+85GkpS4A1FsaUCAR/DXBzu04YbeyMevTe4+nZcMBnSfIA1Y
	o7cRds2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gFn-00000008vAl-21GB;
	Tue, 29 Apr 2025 08:23:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gCk-00000008uUn-2wqI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:20:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83BDA5C57EB;
	Tue, 29 Apr 2025 08:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B46C4CEEA;
	Tue, 29 Apr 2025 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745914837;
	bh=rAqlEeY2Ob/LlJLDaCVezRDiR75ozTPIeV2/nB52+C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbhOeGs5WP1RIpjW5cIh8caOS7QhJo38dcGo4ivryLS1ZS98PL8xrtq6W1RnF6kS2
	 KMifMwmttIRwvDljBoUemDtEsAfDx1rD8d2nIozOxbgeswHWZEECbtZ7+D0ivu7qPk
	 lsHK6OWzO06jW6tBHfPLyMxq7eylq3DEoIUqBWrz+aZgYdhSXlSIimHhMZaoZ06B2s
	 LulBcZcsKAmJfik2x9osewbJ/UWV3+fC3H81OXUnkTPC9oVKf8TFeqrfY3A6PAzowj
	 WmoPKwipbWVen6sH613vxqyrPlU5Nc2Agr5HjJUPn2yeNon1/4cgXbUweQ9Fi26F0K
	 7V4TmJ1D/LPwQ==
Date: Tue, 29 Apr 2025 10:20:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Message-ID: <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421062341.2471922-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_012038_789548_C77D9B2A 
X-CRM114-Status: UNSURE (   8.75  )
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

Hi Carlos,

On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Deferred probe with pm_runtime_put() may delay clock disable, causing
> incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> clock is disabled immediately.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host-fixes with all the changes I suggested.

Thanks,
Andi

