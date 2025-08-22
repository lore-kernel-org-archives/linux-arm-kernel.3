Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBFFCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8nAN6lH4iIKWitR1lkqTMUOmZDGNmPb6HAGd4OPNUE=; b=Q7yv49qYi6XFZhvutG1X10dphG
	1B200xmagmeYP7JlXAE7SPS8L9aM93IX6Fb3IaDr3XkkgkCjdhP25u3YA9UqE1zgxaxIDY8+/rMPv
	OJGCvF2TlSdKqmLHPDtVrm/phN7rNK0w3UX61fg3/yvRDoxvL/cAAOvuQTX7A55FEuGb5cLi8jt94
	FENMIznwlaMXw4n+McqGiY/eQBx2a2pXtjiypv9jS6v8iGDenY+uCC5vMuUasgxJsJTuYdmwd9/OT
	2QZf679PAwLWJqyG9xEx70xs3IXhi9B3laPk5xBDplNQGdyPrFur65VsJ5aTKlVPqdubMHOypfhpS
	CxVpOv/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQyF-00000002Ug0-1Vda;
	Fri, 22 Aug 2025 12:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIgE-00000001QMk-0bu0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 03:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x8nAN6lH4iIKWitR1lkqTMUOmZDGNmPb6HAGd4OPNUE=; b=RvFkXOJfmrB4RH1SDa1/+3RQvJ
	x0qYu5x/gpZ91emwNIgr96fc5TFgWSNKKeMU/PDBMlC9xpKDUcyLo9ELvKAc3nPMheO3BYTPvx47h
	lAgHYChOAJoIuPspv2M+HIdnKA8KwmWD39EgvL22W1RuMfN1E8EjHg2ltOOOHqcTj1ZdmEexl3v+s
	08BAeRxZATZjGZST9tHrULObXRq3jLsCnCfQz+MMt7jn228qnM/Wfz8CJmGPqtoeppa5GESmRAGS2
	ormg+2fLa+A16nNowRyYwD3ZvxG4I36APtIPF9dyPXV2qajilgZf9Ifu4xiR1f3WrYtl8TpgzP5mL
	YUwnc7uw==;
Received: from mail-m16.yeah.net ([220.197.32.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIfz-00000000nBh-3NHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 03:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=x8nAN6lH4iIKWitR1lkqTMUOmZDGNmPb6HAGd4OPNUE=;
	b=MWBz1Hhfc54z3LCta+MG6OWeZ2TiBw7nE+XD/Ffgth9DxRt3KZ7lGS/ys2WloX
	JWAOcYJXj9hiflwd2GzsckAeYz8e14pkysUDbCKarBua8Y/M5SwQljaqv3+ENMIt
	gfAghv5QXBL34cAFp750SbYj/Ivdq+l7zlCPgYIVsDNDM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAn_Ict56docRIZAw--.14029S3;
	Fri, 22 Aug 2025 11:42:39 +0800 (CST)
Date: Fri, 22 Aug 2025 11:42:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jacky Bai <ping.bai@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] arm64: dts: freescale: Add dma err irq info on imx94
Message-ID: <aKfnLWqfrErWBwLN@dragon>
References: <20250725070430.660644-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725070430.660644-1-ping.bai@nxp.com>
X-CM-TRANSID: Mc8vCgAn_Ict56docRIZAw--.14029S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrR6zUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAixZWinhqf3uAAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_044252_961999_3A1A5EBB 
X-CRM114-Status: UNSURE (   7.32  )
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

On Fri, Jul 25, 2025 at 03:04:30PM +0800, Jacky Bai wrote:
> Add the err irq info for edma2 and edma4. These two err irq are
> connected to the GIC directly, not irqsteer.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied, thanks!


