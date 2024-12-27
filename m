Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 22:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hft0l2VsBKQrx1uvLAzxchtG6mj9lfwEqEDAWhneDd0=; b=J9Z+/ERRO7UdXsnqsaVv8YfRvo
	LzWkPn/CYnAXfRJdQ5jzU4O9ttX5cqMTh+bEliAt4q6VskLfEtXhIyaVq5E3p6mjpPDnCQG7cGA1U
	57PMzbpEswZfanYxX8feGIC4wkxgD4uSxVhycZha8MUzUJyW+ZKgHiwoat1u/ex9kBT9VLUqZ1uLa
	JQeMaJrpEL7zzZmGl0u5sIEcktEaCwkvyVFVQU3Y6wq9Rc5fMHblkopqK9GytSR+8fnk5RwvSmBNW
	q4IaVFFGPK3KZ9Vj01/ueyJpoqYJsbwhoESA7XXVfxvmJJl2y8MXOb/8NGFZSaqHcuHYLQNSBvJy4
	6BiM+UKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRIXz-000000011T7-1twr;
	Fri, 27 Dec 2024 22:11:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRIWn-000000011Jd-0ox5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 22:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D028BA4187A;
	Fri, 27 Dec 2024 22:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE59C4CED0;
	Fri, 27 Dec 2024 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735337391;
	bh=Gy7RQh43p81red2VPwbsXvh8YfkHq1heFjtuOnZf4eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyPt0OUW/c4pxG1tG9qOmg9Ru2qnoqFv7b2m6OLSUlaqkt6+yrbTPOhmr776PGa4G
	 Hlmq/lUUtECGt/KHm4oF+SI/pj3rYK+dlHCsciy8KOI3Vb9OqLISaOPcehJnVf5eFz
	 1cFXK0R+vM7O4XTTB3A0QoNjP2TpRIQLkqnQDSj8dQuJr2HghJMoigIlfYSoidvOOq
	 dsg1z9RHqUvhyO41I7eRA5WY9XWVzoUotmtZCYf+dwIe9kKqJBb2IvjQb29jc07SY7
	 cwdQawAhcbRx4PFtZF/geVeQc1vOECEvEez+zCRGDZT19Mdf6Z6pvatunPvPNKieP4
	 h4DhlXytL6N8g==
Date: Fri, 27 Dec 2024 23:09:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, frank.li@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] i2c: imx-lpi2c: add target mode support
Message-ID: <bnc3walr3iemiz4ljb4agoer7moevnph4sm4x34nc7ybo3irhk@z65dk3nvr66u>
References: <20241227072857.1146099-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227072857.1146099-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_140953_298596_0D4B4758 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Dec 27, 2024 at 03:28:57PM +0800, Carlos Song wrote:
> LPI2C support master controller and target controller enabled
> simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has a separate control and status
> registers. When target is enabled and an interrupt has been
> triggered, target register status will be checked to determine
> IRQ source. Then enter the corresponding interrupt handler
> function of master or target to handle the interrupt event.
> 
> This patch supports basic target data read/write operations in
> 7-bit target address. LPI2C target mode can be enabled by using
> I2C slave backend. I2C slave backend behaves like a standard I2C
> client. For simple use and test, Linux I2C slave EEPROM backend
> can be used.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

