Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D26EC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sokq5D7tI+T6oijSo/RXj4RLHZm270EHMfSXqBxtpdk=; b=Wi2iyBmTQYhoFqRYMbtDpxp97D
	gotwYeXVoJYFLP0FxdPg0uAMY+T2/Z8sDLR44zx3J6cqCmeiRXH6kEI7Hb+XDB7kVt+Y/WAUnErZ6
	qiSq+lB8ZfO4JQaNIfAjuwcDi86tCNL2Z8Z1p2HDm5eSAk3OzE7JxM5yQTsUYdMoZF12Da8R6/89+
	aOypl/+WjsWggmN8tdfksS1gP6SMBjjF36LbWI0Q0e5okPvFi0cwCiqxVXfWUKNmI9PWC3o3XlR8Q
	Gsv0/GccAPRGLLqfvz9nAP6N+UBDerLNuexttmbzBRL+q1OSnnrwIl6gKILKlGuQWJm1S0nuRkReK
	yY84JH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX5V-0000000BIuW-2bGp;
	Thu, 30 Jul 2026 20:10:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX5T-0000000BIuK-2Z5c;
	Thu, 30 Jul 2026 20:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9550C6001D;
	Thu, 30 Jul 2026 20:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9941F000E9;
	Thu, 30 Jul 2026 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442238;
	bh=sokq5D7tI+T6oijSo/RXj4RLHZm270EHMfSXqBxtpdk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GKjuKMT2OGLzF6EwLDZzZiZlCPDNuXzonsXiQQBADZ7Zg9je+xB6t/802/s45ZN/J
	 2QYABUoM2JDYkus4bNYaXhTm8uR5r+wfpW3mdbDA+q9G3prX4isOKIrl+YhtyNmBwI
	 EuNXdVxHqxhWvaH3pIzVvqGgLy3gbPuG6H+a0soVJ1gFDH+CpaexXOCTwYOB09Fa0G
	 GR9AKUDAq8O0TfPWZD3IoUhzP9ivrdM9BduBIXqcZvFQU0G+aY6nscgC403AKpLaHV
	 qk4+sNOrCZT4ST1V+1Kelql6IBYWny3kiVCYZbtL+5uvq6icjkNGP4g/cg6YRydkub
	 KIOWdhidtPh0A==
Date: Thu, 30 Jul 2026 13:10:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng
 <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <20260730131037.3d7c4eaa@kernel.org>
In-Reply-To: <20260724190811.198339-6-ansuelsmth@gmail.com>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
	<20260724190811.198339-6-ansuelsmth@gmail.com>
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

On Fri, 24 Jul 2026 21:08:08 +0200 Christian Marangi wrote:
> Airoha AN7581 require dedicated calibration and specific tuneup to make
> the Ethernet port work on specific HW PCB layout.
> 
> The calibration process is similar to Mediatek PHY but Airoha PHY use
> Software calibration process instead of making use of EFUSE.
> 
> It does also require some complex table for TX Amp compensation and
> multiple register settings for EEE and 10/100M to correctly work.
> Also the PHY apply a different TX Amp compensation table based on the
> SoC PDIDR version. Such version info is stored in the SCU SoC registers.
> 
> Add module version as suggested by Airoha to identify the calibration logic
> with a specific version.

Build warning here:

../drivers/net/phy/mediatek/airoha-ge-soc.c:1508:3: warning: variable 'shared' is uninitialized when used here [-Wuninitialized]
 1508 |                 shared->phydev_p0 = phydev;
      |                 ^~~~~~

Sashiko/Gemini has some other review comments so please check before
reposting:
https://sashiko.dev/#/patchset/20260724190811.198339-6-ansuelsmth@gmail.com

