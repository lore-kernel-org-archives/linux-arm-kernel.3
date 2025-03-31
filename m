Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9935BC36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW05yxRGO3a+2Htch6vXAYBqk9OLY5N7AW6f2uPA3YY=; b=pYWPAfLg7Fvh2+MY+FVkUGloSx
	FqxSB4EW0FbMqS4qej7lbLa5f8OgdNTIVHOe0jdgzfHW9DJ/ycyTq8l0RLb9ALNpSV3pc3Thuu/jM
	dLKKCFp0bSVy3mYHj0xmn/LZ5Hu9zVnnG56VGt4MhkHPYJtrF2tMjOI8LNlqZYflbuRGZa2JSgwNT
	DeJuouxJ4I8gh46+tZrjUSF8xhVQ4mEEN1lTWxvH9yEEl5niatqpYbUT6xVYng4iGYsYtJLxFRTk7
	xYM5wYgTOeJay0X14n5wKCG4hb1Rqa/KO76acUmCKT05OAlW226qja2dU+lUKOiHlwV03UKTaZQ4m
	cVQSxGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIgW-000000013S8-3hF9;
	Mon, 31 Mar 2025 17:12:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIen-000000013Ll-2vYD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 17:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D32B5C5903;
	Mon, 31 Mar 2025 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4B2C4CEE3;
	Mon, 31 Mar 2025 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743441038;
	bh=fW05yxRGO3a+2Htch6vXAYBqk9OLY5N7AW6f2uPA3YY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ORfRDVXaxI9YZrPQrwaQ+hwVtaV18urjj8Ade0KrD+cnNsBYHDMnBo8OSm62QcV8E
	 tvjTrFyYPj73I5d0LVCsqp4aiSVLN7pnjEkR2u34+1lOYKp29syxx6BOAckzcsOqRx
	 QbRRmXrlAwAR2Jz+FTnIh/Lp4grB5xs7hgji/Czjy1EXZtKY1Heg4oF3M2I4IFfl4B
	 S+zIOUnGAn1AsfhLXo4yD2oDUPgGRP32mDTtE4tFypkU/CEIWVvWRh+edPwdRU2laC
	 3KMGU4tG7KRPpOyWNbhdK4frov6v8dGmMznna8/dGQbyV1OmnXpI0WchXqq58TAx/Q
	 xw2ddPWw7axqg==
Date: Mon, 31 Mar 2025 10:10:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] net: mtip: Add support for MTIP imx287 L2 switch
 driver
Message-ID: <20250331101036.68afd26a@kernel.org>
In-Reply-To: <20250331103116.2223899-1-lukma@denx.de>
References: <20250331103116.2223899-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_101041_783437_B528A5FC 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, 31 Mar 2025 12:31:12 +0200 Lukasz Majewski wrote:
> This patch series adds support for More Than IP's L2 switch driver embedded
> in some NXP's SoCs. This one has been tested on imx287, but is also available
> in the vf610.

Lukasz, please post with RFC in the subject tags during the merge
window. As I already said net-next is closed.

