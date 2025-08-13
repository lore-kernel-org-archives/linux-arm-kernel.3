Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F683CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKUdB5/3R2W9U89n/9PCrLdFwEKygtsRKugTK8wA8oE=; b=ToEmOq8wRydsz0Umzeee/OXd4u
	DAzyxGqfrJeNc/1lJLmT9RC+hQkabYgGsHO7xZ8XWJI2Ebtm3fBfcZrUfZ5r8J6iVjRBi6jud0kwd
	CeT2YMAFD8G6x5eYkIEMoF4y3Kg7MFQXgPZCecJd1Ny/S3DwNnRQU8/0llpvMgPXxOaZxfsvZR1tG
	4AvKqjFH0/XgjytbaXdFE2+d5F0vp7Z1OJ5czRu3GK1RbD14qoSSGhqhTpnvAYTawTaDMHHvpbo5e
	YwrYkjnC3107FXsb3piNF3bE+uZlRxAyX5SOp5FeBcAmA6VVoL6EXQq1qGNoXgu7VL9DAxAgzqc+h
	T2+RtizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0gj-0000000CN8R-3P3z;
	Wed, 13 Aug 2025 01:54:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um0dc-0000000CMj0-0wwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 01:50:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40499601CF;
	Wed, 13 Aug 2025 01:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CBC4CEF0;
	Wed, 13 Aug 2025 01:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755049846;
	bh=/TWbFKiAUS4Hv5UjHzTDgLkD5NVzeVFAuOyarw2xwAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t8ojr8Jlh97iNz7e1ejsuaKeo4Ov2eO5+NqayT8QoCHQrJ9ynNZ3b7MNw53h1bYT/
	 kg5bmr7wGeQYvGw4sinOCFr76tNnpYfYdedCrZh1rqYrOhjZ0J8SWml9+2kBEpHMs2
	 UU71oRqiedIXSi7FzlXcswk+Ci3cLVNlYBolS12bm8JEOpArqbE67/Y9hr+RoPSZ0Q
	 srTwO5wkiV49t48aCWu3OBv4gctHOK4wlv24ncskC4u5ndBGP4BaZ74083bhaOe4PM
	 B+y2oxoDUuV3PQap7zHpSnHYrtBdwSIg9mpzdZmaPQBNW2PKiPivWRvnohmOvq+qL0
	 9fgiWB4x59f8g==
Date: Tue, 12 Aug 2025 18:50:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukasz.majewski@mailbox.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next RESEND v17 00/12] net: mtip: Add support for MTIP
 imx287 L2 switch driver
Message-ID: <20250812185044.4381fae8@kernel.org>
In-Reply-To: <20250812082939.541733-1-lukasz.majewski@mailbox.org>
References: <20250812082939.541733-1-lukasz.majewski@mailbox.org>
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

On Tue, 12 Aug 2025 10:29:27 +0200 Lukasz Majewski wrote:
> This patch series adds support for More Than IP's L2 switch driver embedded
> in some NXP's SoCs. This one has been tested on imx287, but is also available
> in the vf610.

The arch/arm patches don't apply to net-next any more.
Perhaps we should take this opportunity to drop them?
We will really only apply the bindings and the driver code.
dts and arch/ code need to go to the appropriate arch maintainer..
-- 
pw-bot: cr

