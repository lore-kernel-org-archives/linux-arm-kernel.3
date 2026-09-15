Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE51C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 03:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwXzEuLD3SmIEvHNiDMhry3K3dBXkrZSJCANq2gUbt8=; b=s4Nin2muMlBcgPxhwm5EaRYiLn
	paFNBzHU28SKCa2bd1CTqW/WxnKB7t1nEKUdKNinu7Pwxff3K5DKoosecf93PJoBzgdHfVcdQR6XW
	VtEAj0YYpv1VDKw2oKBb2v67cv5AJq03qCP40LX+cOuYaBeXCcPKgcMy6TKz2kNe+WybZfIK41ZW9
	u4OKrF91HEx32kpfnL7Pv6IyYjomQAYnGX7IilFfYvgEt6ctkVyGdbJzbwcLLzUHPC4CVvNQ3CGFZ
	pCnNBuoLBTDAQ2YNEdu65wu5A0RDpKwopYqQfe/pFIDRmFxNPQKqpAaWsRzB7WSi2wwJhEs0VvIH5
	o68EguuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KGc-00000005ACX-44aE;
	Tue, 15 Sep 2026 03:55:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KGb-00000005ACK-3l5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 03:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A55E56025F;
	Tue, 15 Sep 2026 03:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074F01F000FF;
	Tue, 15 Sep 2026 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789444532;
	bh=lwXzEuLD3SmIEvHNiDMhry3K3dBXkrZSJCANq2gUbt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KpKWC26q4hmfYRbMTa0MEhfrXmHtyTB9tSbfsmd8VNVECKGSFuW3pP10Jiii7Ae3U
	 SF8I8CCAVhMbJfQtqrmwjPnNYoL5gQvbJlBMrR4Zxkzb8X8SlzPc7pp75QuI4ZV6mP
	 1Ax4N5ZRrXaTt7OR7MrUPrXe5mY7MbzHmuuglBEk=
Date: Mon, 14 Sep 2026 20:55:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: linux@armlinux.org.uk, linusw@kernel.org, mark.rutland@arm.com,
 kmehltretter@gmail.com, vbabka@suse.cz, elver@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 r.thapliyal@samsung.com, Hariom Panthi <hariom1.p@samsung.com>
Subject: Re: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section
 to filter it from traces
Message-Id: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
In-Reply-To: <20260914103218.1125401-1-maninder1.s@samsung.com>
References: <CGME20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768@epcas5p4.samsung.com>
	<20260914103218.1125401-1-maninder1.s@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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


> Subject: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section to filter it from traces

fyi, this choice of subject may cause the relevant maintainers to
delete the email unread.

>  arch/arm/kernel/entry-armv.S | 2 ++

Those maintainers.

This is an ARM patch, so label it that way!

