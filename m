Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74265C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2XDHJ0MeEQmXTlZkkvpVFiRAD3UEq3gNigfSYol0ps=; b=U2Zscfl+ODcHXyigrc1PLL4t3O
	2h2WG+/ko1Db2/6q4ghdc7bHZO4E1OPY/33DPLX6CHxn2knWd1gOM/lu2ns1Seo3i80ePsIkojv4Y
	ZXqbEWXAMtJfhEDccc9VgThQ6ZQAYc9vtDKhc3QNn3h0UtZ4nY955a3fyWfCLdTl81J6lfHjGSNPq
	ZR7gNlawuzbhQLtnEafyefQ4lnCi8JOyWBQPahIjP3o6tzBLVZAt/BKr04JNyBAWxmqgGfh7RC3fw
	GXeRrhAHL+amGMUqlzy/gdBQWWlLI7E2+mEQBouXSksCcC/MEFmIlrYhSfjHhrALfrt+2TsoyrNSQ
	80OVGEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU8-0000000EBxx-2zci;
	Fri, 04 Jul 2025 11:21:40 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbr9-0000000DkdY-23jj;
	Fri, 04 Jul 2025 08:33:16 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C85A94D68A;
	Fri,  4 Jul 2025 10:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751617990;
	bh=1Wb4ZmTEJsSifboKDjUkFOYzbSZxSp7Cj7bjm5Uh7PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNnwCTPpeQ3dIUBs3CEaEcBZC9ZSCczy9UgnBvT7RwXD1li0Fl8Ns8E8bRwMZ8hb1
	 aQVU10Jcq3V0vKhxLAUFoQ/yGL8ptcDaFIb/hDqL4JajHDN/IFDoi5rKadoCQLbTve
	 5yD2txFQ7Rj6wyMYHK60tT7rAsOkkrOg4a0bZ0yWrS2x/2rZnS8fqRG1daeQysxkNa
	 sA7BKstvqe0xAnCjwwsPwYDyOvyh35vX+heZDh0EsJcrm1lBRiJCc4HWcHEGxzz5x8
	 b+xhiH7C2xJu2YcPBLrbFndAWwFjAANtkqudWJB4wt42MxtqZjuB/cL2+mzE5olZKY
	 gC4UcxuJ7rqcg==
Date: Fri, 4 Jul 2025 10:33:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] iommu/mediatek-v1: Tidy up probe_finalize
Message-ID: <aGeRxYJrd48SIlJF@8bytes.org>
References: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_013315_742590_BDB64F77 
X-CRM114-Status: UNSURE (   7.04  )
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

On Fri, Jun 27, 2025 at 04:07:10PM +0100, Robin Murphy wrote:
>  drivers/iommu/mtk_iommu_v1.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Applied, thanks Robin.

