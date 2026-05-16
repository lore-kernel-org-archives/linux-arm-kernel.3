Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D81FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD2ArBPSFOgh2QKoBU8QCPS9wr2g9eT1lLjvWeRKPRw=; b=HrZOd5jsRvlgxL4muwM9GYOnKe
	pi2zOTLugcJZ8bObqhkx9J+kU7C7tYiRU4hDBA6Is7IRA9YH/HxwW+kADINPUhF7NSELvlI01uq6R
	xp752TVPpD5BxRLq5q9bABuqy+t+Kff+oTZwvo/CKEuvTJ1UNZSORG6rI8AZTa0gHLVgBX8sTK9Bi
	omIuPiL0PEWp+1IyJLBeRwfy173HyN/WYzHBLuj1u6tvp/LAKlLOnXyySii8+eq9htxvJqTka/fNo
	cPIv91HTTk6o9L3T815tTsVthPaRvKdofsjuzEudVVUw6zKlJgc11Iv/f7h50NU03Y/gZNfQbeHfa
	DxMYfn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO9GO-0000000AKxX-0XFx;
	Sat, 16 May 2026 07:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO9GM-0000000AKxE-2sH9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 07:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D2FE60138;
	Sat, 16 May 2026 07:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F19C19425;
	Sat, 16 May 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778915801;
	bh=xwXKcU1TUzsWKK1bckmURl4whBylKTE0ps8CgElwYR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqJrSSsrGYPyYoshc+G/wBBe4x8NYgE1qTcoESOWPNh7TYdbtcj9b7koI1nI36Don
	 AvupgQB5oTzw3BkAbXeEIp2W1zPmzaGe1YwJCFw3y/i4AeAs1wT75O2rcnVcvxmG3y
	 MSwRp46VbjFL+g4GIX3aUzn3p4L0AS+TtH67XCjo=
Date: Sat, 16 May 2026 09:15:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, shawnguo@kernel.org, hcazarim@yahoo.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via
 sysfs_emit_at()
Message-ID: <2026051633-doorstep-sequence-6782@gregkh>
References: <20260515175002.34853-1-sozdayvek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515175002.34853-1-sozdayvek@gmail.com>
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

On Fri, May 15, 2026 at 10:50:01PM +0500, Stepan Ionichev wrote:
> wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and, for
> every group with a wakeup_src set, writes a line into the sysfs
> output buffer:
> 
> 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
> 		if (!scu_irq_wakeup[i].wakeup_src)
> 			continue;
> 
> 		if (scu_irq_wakeup[i].valid)
> 			sprintf(buf, "Wakeup source group = %d, ...", ...);
> 		else
> 			sprintf(buf, "Spurious SCU wakeup, group = %d, ...", ...);

This is a horrible sysfs file, and breaks all the rules.  Why not just
delete it and use the proper api for it instead?

thanks,
greg k-h

