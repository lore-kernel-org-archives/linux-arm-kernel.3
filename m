Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB9C10BA421
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 03:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHofDrFOSqIg9lRoZJqQTBkCqrg8GuJBXjJ+jk8IyEk=; b=aDNIa2UuK91zuE9CSnFZarrM5h
	3AYMlb+Jtjkjmil1ejVW9uDBeiosyPvZ1sZuXirgsAEHNgbarg0nrJI2IU/hs3kn5K6Tase7DJ86D
	g4JH2ojet111eRuMB7W4cbvm5hATHQ54nUsbnH+9Vq44t7I70BpDnS26lhGd0KmvYLd7xitLSyYi2
	jH4seT6k9FM85MYdfhXqi4MjbMcmuw6ImxsodAuwrjUePgNPiX3Qh6lAnVD7DIBSmi581D4gt/kxL
	Zx1AGuNo06h6/SUe3V5bZ3/NVi32wmu5Uzf0dZyIuvba0tRJKnpuodI4rJoR27DUPgJOAYzWb9Bhl
	9g3Alu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xbh-00000006bLs-3oKS;
	Fri, 27 Mar 2026 03:11:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xbg-00000006bLg-2RAq;
	Fri, 27 Mar 2026 03:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7CED60054;
	Fri, 27 Mar 2026 03:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CDAC116C6;
	Fri, 27 Mar 2026 03:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774581090;
	bh=dB+xLM5/BZobo4u+rQqw4CvliEp3K6y7TB/YZt1YJXE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hnEOWSIjDgs8Si4ZA+9p7wvM4GqPZOP3iTc7uW8RsAl+wrqi/G1ISlNSR6zd/8r2m
	 AMoyXNjtmJc/XfB4MD55XWgd1cjzqHMkrPysOQpyNRA9uwwO6ouydbN1/2crVs8gcX
	 lijd8N7xRyRGaJ7CWdjPlLy4PSBvBiFkdPae0PS2L/z2VFSWfdD3RgUMej/gZCq18Q
	 S3F2XxGb5ylKd2td+Ua2vL+2d2VkqfdQjU9jF4UuRj6aXLZthuT96AsgoHud6TMu4C
	 STxmABtIDqoAG/duu/F+y00rQkIqq3vx8PHaiY05Youa6GMX22jWle79r0wF4VQ9gl
	 XmU/Cm/V+nzlg==
Date: Thu, 26 Mar 2026 20:11:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 0/7] J722S SGMII support
Message-ID: <20260326201127.7ceb290f@kernel.org>
In-Reply-To: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
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

On Tue, 24 Mar 2026 13:29:36 +0100 Nora Schiffer wrote:
> The J722S CPSW and SERDES are very similar to the variants found on the
> AM64, but they additionally support SGMII. Introduce new compatible
> strings for the J722S to add this support to the drivers.
> 
> This is a prerequisite for the Single-Pair Ethernet interface of the
> TQ-Systems MBa67xx baseboard for the TQMa67xx SoM, which will be
> submitted separately.

Please repost patch 3+6 as a separate series for net-next.

