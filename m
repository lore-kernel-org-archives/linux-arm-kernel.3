Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FE0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwHxlRR2rNoP5RvodLCCVCBCDTljstMJPaQ2gdF2Euc=; b=sC2AuACvr7PssjP0UxKAsD2UOj
	8gXAUKi+WndM39XbDbyCr7JJbsZwIGUHXEVelU/oRhszwTmUyOaOrdxIpQWQYmqYdgCisBJu+h0bK
	fSolOVRtPN1WoPbu+IUX3N4cH8leuZw7+uBsfLTn0LXDhgq9K5aI06j1dhEHclsRXAtRHEwt8wnWM
	FEziBV1h9ruKCloanwHPedK6Mw3lIPM1DLg10WrS5kXIPaZV6AjX5jiAkT9P1KdoVv+ZfkwGSdMOA
	YW+9vorfsJ1uUyKzpwboHKMki0GLC/sTFBGw9FLldfI12cUi9TO4ZPXtu0/fQ8j8dIHoubCQinYhB
	fBCYG9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkCy-0000000FXGu-0KWr;
	Thu, 26 Dec 2024 09:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkBj-0000000FX8q-2Cgy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 09:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4B115C5FB8;
	Thu, 26 Dec 2024 09:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966E1C4CED1;
	Thu, 26 Dec 2024 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735205390;
	bh=96BkSEbj7UyusrdK9u7rlbacr75HohY6DDk6raWfaHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+7UbjyTDXNltC4fEft0Qn+cK/1ZNWGUtNdTXe07qv3dyTSL9+wIsblvr+aFksbqC
	 P/Kt3QTS7b2ir6X+Eq0x7e1AgFvL1qfZdnGoafXuJecIIXxoi15jU51Y17iG+RlniI
	 Im33Kcu+LxsJp7OAlrgsp1h3qV9O7O9ixRM+imNw2Nygb+2SzpIEKROT/EK1ucS8D5
	 xkvlrCSOcqzuYlCTt/RYTyJJYtu2vKtMwZefsZ6e2G4d8HPnfpcCv8O2aNFGOeGgMm
	 PM9WyL+Z33jtAu+niH00CzRrb1IiC3M2YvW9/k3oGKPFsVEr9UFXzduYV7gpAuKQx1
	 VxysPHvJk8lTg==
Date: Thu, 26 Dec 2024 10:29:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v7] i2c: imx: support DMA defer probing
Message-ID: <zxsnqol4qmy7p5vxs525zf3xp7dwx4pqh4lbp2mz25kyaqr44q@n4s6mps6o4ub>
References: <20241226062521.1004809-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226062521.1004809-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_012951_616860_C48B1DE4 
X-CRM114-Status: UNSURE (   9.51  )
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

On Thu, Dec 26, 2024 at 02:25:21PM +0800, Carlos Song wrote:
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
> 
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
> 
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

thanks for following up on all your comments! Merged to
i2c/i2c-host.

Thanks,
Andi

