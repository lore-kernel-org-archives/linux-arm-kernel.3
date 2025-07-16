Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1923C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z/Qz9Y+lhSWJPIPgq6p6gay3QQNEYxDeT2knVUbl/Y=; b=bhVvXjHPXPM0DOmL0EX2bvJ5/v
	Od0nOM3MOC48czRS3+xdUprmWA0T+V7BWELS+7m3MM1cQzfHUyha+TL8OhKgiV//ZPXdpEB0JUqQm
	y5QSUfrtQ/Ul/Acrrbw2fh7cLt+/a+mJ/1YxJkE1ewQ0SPL+gNTpPHW771Nlz2+0B7g8ssgCh666r
	cti0gGUOlKok3udsq3AlIFu9fS47PI0cZFhqHL9qj+aZq94mRj5gUHmTY57+pvyfGFBPUG7/4Q1vS
	yuH7V/zA7aLd4uYhF133AxC2eS3a1tTvtGMPQ5yxVE6tcWYr973kACP+4Fn2bcOGXODC6Nojl5+75
	8/LXfY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAcZ-00000008nfP-3knY;
	Wed, 16 Jul 2025 22:29:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAa9-00000008nTX-0FnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 22:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C1A35C0C42;
	Wed, 16 Jul 2025 22:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46704C4CEE7;
	Wed, 16 Jul 2025 22:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752704791;
	bh=JOJeLyCECI7amC2TB9K36NzTKnzUeHZ0ARDaQeBa6so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdlymgH6c/n11Ay4TjcMGaQ/JWnaQnUPc6NHyikP7ZNFd+Z1y9zW4Tt51Phu9lQX8
	 esLs4b9Fr9P+UZ+IWelguH0ZKvp4A053jlvcFwHfhNZeJgBQvkneoWOlPMUYJLeJgi
	 iETUpGG/qcNNtpmUkZlx3HSwr3wKWnVw5oIvSs9Ph1lgRhtGMX4zO4WHgsVqjNpWwt
	 Q3kqy0a1ds+wuEOBc/YITMkNetEOuR60rOuCqTshnwq1iRdq2khiBDNKo84Hozi7DK
	 OrJ1D6LJ2SGWde6eQD2D+PQ2O0eXA3NoJIeiL80yYZYqnGlTdL73B9AxMifFzQS3SG
	 nk9OToyrbKVVQ==
Date: Thu, 17 Jul 2025 00:26:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Yuesong Li <liyuesong@vivo.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] i2c: lpi2c: convert to use secs_to_jiffies()
Message-ID: <qe5s4q5pabhbdbvtvxogmcbcchmnqwj556defrlxxhebhgan35@toxghkobdevv>
References: <20250613110649.3283336-1-liyuesong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613110649.3283336-1-liyuesong@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_152633_138049_25AEA1BC 
X-CRM114-Status: UNSURE (   8.13  )
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

Hi Yuesong,

On Fri, Jun 13, 2025 at 07:06:38PM +0800, Yuesong Li wrote:
> Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
> use it to avoid scaling the time to msec.
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

merged to i2c/i2c-host.

Thanks,
Andi

