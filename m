Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF49D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6CI2JJxrt75m45cwXmLOXKbpv11yL317iRzR+Z7ZaE=; b=3hD5tZ0pgORBTC8LDCEAPi6tuR
	MpNuA5CvmbpHsWQWdSA0RuBcRPG5RKWY3J6YpvbrwWQPD+TGoTiZgJpo9pEsU/TpiyE1xAEkR0F7I
	VkY+QvmFz5VYlOza7+gLSIIoLAeyjGAek+xwzQ3RACRqWixcjvidZ51E9SrEBn+JFBOoaHy8+JMFn
	4pz+MJ4zNhigceV4F2QYsBIBd1Bv+iOFaQG8BD9VuZE+nfYpdkWPJZ+tRbPPKr8A1mbbzbyPoRowq
	V/ce/pVaVKWTcnp0U4S2abx1COQqUOcqEDfYAUDNvOSx6ExYnvROlsUiD+sQLwJFUFW4oSfecTlnw
	BS+v7MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYWr-00000009pa5-1lxy;
	Thu, 14 Nov 2024 12:00:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXyG-00000009ieW-0hN7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 11:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12D84A418E8;
	Thu, 14 Nov 2024 11:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75964C4CECD;
	Thu, 14 Nov 2024 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731583506;
	bh=EF+ANVAHa4r5Nmh3iDwTFEvrbHbm9uJkURJzb5PQ07Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUCFFougLX8RbrTxIm6Bfjnw0gNrSwIFdRPtO9YL4iNHh653Wy7AKDGdBz3u10u9z
	 GnsIO+c2pciC4V0zv2fqNeEIdDeFPYyKVf1Z6LJgAC+TR9DcLtD53mg7SAdcKWGgpK
	 pr8l+3BZqEjpFXBiuhahGX2yW+qtQM037nSi1jPd7/agv+CcrO3Ahy3CZ37v7tCDfQ
	 c1ycrTisQSuKMfY6b51OT0ODlbOGBGPOpiKpXYX7qVdvHqZUpGG3jldk7NcmHlqfW3
	 qr8GBESlZMQR9HVxarfZ+GsjaCfBCLyOMBCHGw66kN3d6JNFsN9R0OXI1PqoM6mOC4
	 I1PjZJkfaD/MA==
Date: Thu, 14 Nov 2024 12:25:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hongbo Li <lihongbo22@huawei.com>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next v2] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
Message-ID: <ZzXeD2I-ybbhE-iT@localhost.localdomain>
References: <20240904022633.2079803-1-lihongbo22@huawei.com>
 <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_032508_309798_91E6CF80 
X-CRM114-Status: UNSURE (   9.88  )
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

Le Thu, Nov 14, 2024 at 08:38:59AM +0100, Christophe Leroy a écrit :
> Hi,
> 
> Le 04/09/2024 à 04:26, Hongbo Li a écrit :
> > Replace kthread_create/kthread_bind/wake_up_process() with
> > kthread_run_on_cpu() to simplify the code.
> > 
> > Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> 
> A similar change is proposed as part of a larger series, see patch 7 in that
> series
> https://lore.kernel.org/lkml/20241112142248.20503-1-frederic@kernel.org/
> 
> I prefer to leave this patch aside and not interfere with Frederic's work.

Speaking of, feel free to take it, the conversions to kthread_run_on_cpu()
are standalone patches.

Thanks.

> 
> Christophe

