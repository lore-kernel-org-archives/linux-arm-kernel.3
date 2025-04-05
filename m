Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vya8iaw7Anhfwsf5FS132RTtxwL4SCtVczzoO4BHfVA=; b=NQFan/jJrORJDRDiIwaz7iLvzj
	xQWpXY8SXUAJgPBrICfnQaUNnU1wBwZhNHO31Eb2xLp19ZK9H2MFmrl1Z20F+0Qf7xxfPDsklfmfF
	WRChh/PCp5BOIi8lg/LJxVtIOdoe70cQ6XCLfjRKaTA12vWiWBBbmI9+tkVWblAjodkkHeYRrdxBA
	wxGSBkHsvy6QvtuxR0I/5o9Uy7h9TMhqosKnSO4QDkrsUNnpplMg2QMv+Io4Qg81wv3mmAdhYWgOr
	rkz7CUiZjdOLnEtXlGnPSJXD0zAW7s86971k9rooPirrM3l4P6C7xwOj+T+2awGL6v4z+UlZYLio7
	KJEQu/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11Q1-0000000Dsk7-2dBK;
	Sat, 05 Apr 2025 11:10:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11OH-0000000Dsfp-0bii
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 11:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00E5CA42FA2;
	Sat,  5 Apr 2025 11:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2891AC4CEE4;
	Sat,  5 Apr 2025 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743851323;
	bh=dezxj8VSTZLrhrjMvBNRo9xpOTdQox3P2xIB/cWe9ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANM4kS03MtTUdM32rgSWs9YpCS0CGFaMqXHu4IKzHuAfwLypIYNdLmV/vR36aA0/U
	 cELzkwwwuV0gKzDs/uYnYx0TYaiD6GSfh+OAWmz+xCutCfhyxqj1ohLctBXjCLWPC/
	 93hfZf4v++soFdMTZC11JQK/O73giTWHHilMaRG8=
Date: Sat, 5 Apr 2025 12:07:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in
 the ast_vhub_init_dev
Message-ID: <2025040527-recite-stunt-893f@gregkh>
References: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_040845_251519_FA910AA5 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sat, Mar 29, 2025 at 08:29:11AM +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function ast_vhub_init_dev.
> 
> A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Please properly wrap your changelog text.

> Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")

No cc: stable?

Also, your Subject line has "Subject:" in it twice, something went wrong
with the patch when you sent it out :(

thanks,

greg k-h

