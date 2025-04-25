Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5464DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7owL616h+sBIPge72zBs+CUaN66C6FDyt+I57CgmAY=; b=DLGiM+NAJbiGvj
	XfZyWMfwUD3Nv6vlB2y7jtRjKlyR/9Dj5PSETH2leAZnAkn7TDF5vvcY9b9Lya58ran9debjZURMm
	YzpENnKzR+JkvySRVUsuUP5fDEJOsSsmrfjO/uvFJfNVsRoB53K08uWbldM58htyfC4rqPW+sQibm
	ImgTBpZiaY5Tly82bSnX/Hu+BRzinAqchhDCG+4kK+H2t1T7X067A0xJ/BnIPiB9XyoyKLuPPM5qN
	gQChZQECSIkarkYRqssFrnFHGTYcSFgHhfWBl8CBlq0cUETWNK6nnsplGz8+0iw5UlXzz2cxpzgmP
	niX+25CtkU4qrIXZnywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88f9-0000000FlZl-0Pgt;
	Fri, 25 Apr 2025 02:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88bk-0000000FlBo-1Xd0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EDCB5C565C;
	Fri, 25 Apr 2025 02:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B978FC4CEE3;
	Fri, 25 Apr 2025 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547363;
	bh=7dhh4pgXnpoNNmP1zUba/AqVU9c6ggKMDn5X/JSgHWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eCTKT5NF+ko/D0Ymvh908TbpHTfRFVlED2cyhNGLU54cjd/AwWZ8yotm3Z/263eWs
	 pMeEO14BV+RXs8rVQp/98Vjp13CIZBmHBlOfriCyXfvD2SYKi6JaRPgFtLBQYnlM4n
	 hJhIb2CCqZ7YmFRRvzVU0pC1Phd2GDVzYCsYunve6o/ez8srbW26sGEy+TaqKfBxjB
	 2pVE+PfKOQmNxPOzzT8xBI+FQK6/fAFf44ruvvutnj4BUs0I+kSw32yEebaJ/us4Xz
	 PlulC9+cw9oEk/nAuD9f8yOo/4IzDd1HYX9WbF5vSDgoqI4jDqINpD5gydqScjlJLR
	 E7ZyAk8ZVjglA==
Date: Thu, 24 Apr 2025 19:16:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v6 06/11] net: ti: prueth: Adds HW timestamping
 support for PTP using PRU-ICSS IEP module
Message-ID: <20250424191600.50d7974c@kernel.org>
In-Reply-To: <20250423072356.146726-7-parvathi@couthit.com>
References: <20250423060707.145166-1-parvathi@couthit.com>
	<20250423072356.146726-7-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_191604_452923_77FCEB67 
X-CRM114-Status: UNSURE (   5.68  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, basharath@couthit.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 23 Apr 2025 12:53:51 +0530 Parvathi Pudi wrote:
> +static inline void icssm_prueth_ptp_ts_enable(struct prueth_emac *emac)

Also do not use "inline" for functions which are not called from 
the fast path. Basically no "inline" unless you can measure real
perf impact.

