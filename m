Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52E4EEF319
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVLaL6Pe/vYrwUbYcug+Ovp1mp1+ydzWEyoM82UXZ9Q=; b=j3CUT8lfqAKFw8eHblpvq/49hA
	I8NTxXPy1gZpHKkav04U6kO2qwWsePe3BpNbzgx5Punxo+ue8DsQuTRC2wEGybYn3tAW+qJD6xgr0
	Vu3eUEDbB1XaZHT8mxvY522DMyPu3Vr/I9DrpwF2C8CeznWDpuEZlP8vDIgg2UH9+8noqeFFnArte
	qDNM8kbD9CE3n2idIAmAMBNizx6vgHgZxIcuIL608RZW3ilzFitSLi/99xO1shFT959c2zNN3H3Gq
	2oXkcBsVIPyfkvvHbY6XNKxWTgymvt+vp4X7Oh4AQRTWigMdoeX0Zbo2XeXSPmvkjqqj8on99M+4d
	4MG1XCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy486-00000001ClN-0CQb;
	Thu, 05 Mar 2026 08:32:22 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy483-00000001Cl1-2wEg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=UVLaL6Pe/vYrwUbYcug+Ovp1mp1+ydzWEyoM82UXZ9Q=; b=QuqLYNEIwTyOJilhTq+juHtXZT
	2EfnaDsNpK8kLNO0yprRtZ7dk8PduIEKDD6xierhNtM499NT7FR9eP/RCjIws+J4j8l+aC5rWVXoB
	T+LlkB2W+3Nmi3DjRETBZ8uoQkZ4DSXktdtUsbqYtWihC646CWnknm55JH1+kNPP8+2cjoM3lgzGf
	KlAx+cuCfWNpEx/i2lguahbkQzplK+qo4tXcJXUeE0V+l4CQ7qRFTopUoT0+I30heHyrNMo9EpU7V
	2gKFwN60U5ouDI3nMyOzlinzwMIr4fW1JqK4W0a++HEpostwkNB6PU2mWSSlHy+qfNMeJr7LKmtEQ
	D718UyrA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy47v-0009JJ-05;
	Thu, 05 Mar 2026 09:32:11 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vy47u-000PSq-16;
	Thu, 05 Mar 2026 09:32:10 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 08:32:08 +0000
Message-Id: <DGUPJD1VRSH8.6EHJG20V49KE@folker-schwesinger.de>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260305082919.5940-1-rahulnavale04@gmail.com>
In-Reply-To: <20260305082919.5940-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27930/Wed Mar  4 08:24:08 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_003219_739964_73C7FB5C 
X-CRM114-Status: UNSURE (   4.08  )
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

On Thu Mar 5, 2026 at 9:29 AM CET, Rahul Navale wrote:
> logs:
> <4>[    0.302360] dma_slave_caps:
> <4>[    0.302364]   src_addr_widths    =3D 0x00000000
> <4>[    0.302368]   dst_addr_widths    =3D 0x00000000
> <4>[    0.302371]   directions         =3D 0x00000000
> <4>[    0.302374]   min_burst          =3D 0x00000000
> <4>[    0.302377]   max_burst          =3D 0x00000000
> <4>[    0.302380]   max_sg_burst       =3D 0x00000000
> <4>[    0.302383]   cmd_pause          =3D 0x00
> <4>[    0.302386]   cmd_resume         =3D 0x00
> <4>[    0.302388]   cmd_terminate      =3D 0x00
> <4>[    0.302391]   residue_granularity=3D 0x00000000
> <4>[    0.302394]   descriptor_reuse   =3D 0x00
> <4>[    0.302398] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> <4>[    0.302401] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> <4>[    0.302404] dma_slave_caps:
> <4>[    0.302406]   src_addr_widths    =3D 0x00000000
> <4>[    0.302409]   dst_addr_widths    =3D 0x00000000
> <4>[    0.302412]   directions         =3D 0x00000001
> <4>[    0.302415]   min_burst          =3D 0x00000000
> <4>[    0.302418]   max_burst          =3D 0x00000000
> <4>[    0.302421]   max_sg_burst       =3D 0x00000000
> <4>[    0.302423]   cmd_pause          =3D 0x00
> <4>[    0.302426]   cmd_resume         =3D 0x00
> <4>[    0.302429]   cmd_terminate      =3D 0x01
> <4>[    0.302431]   residue_granularity=3D 0x00000001
> <4>[    0.302434]   descriptor_reuse   =3D 0x00

Could you confirm that the DMA IP core in your PL design operates in
Scatter Gather mode?

