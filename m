Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E08C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 02:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24jiysXyB/JxeRxXGrThD+4qS8hUsrobbYzYvxv5lPA=; b=Zj2ao7hzVuVz88IIaOdCd5jzZF
	bveiKFim0ORL2g7pHoG15A0uoP0r2QpP98dFS7TZe8Y0PGTfXsfDgT0NqDDMzRiioiS4QWpJzXYdS
	k5mTDkUROCaWnDmLqQoxAdL1ZtFeMTGYSiCGEX0WWkGqZ9YXp2rUpfmJ/2o0GOBiK6k0Ti6xSmTa1
	yHajeWCLg3HJbtjXytziIIn0WihoTloFukBXUfW93UD1vLbgcx7UIiI0lFjZ6vWryeF4jpsDZVn7A
	bdVuB8v4AxKyZ0CGtGUBItHqq/pA5THXqFz/tA3samczOAD51CQ4GlclKfNA8XGW7+dldzWF9jyg2
	ngviIJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkIB-0000000FlGt-24PN;
	Tue, 25 Feb 2025 02:03:27 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkGg-0000000FlC9-1ju6;
	Tue, 25 Feb 2025 02:01:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C5A1611CA;
	Tue, 25 Feb 2025 02:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10831C4CED6;
	Tue, 25 Feb 2025 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740448913;
	bh=24jiysXyB/JxeRxXGrThD+4qS8hUsrobbYzYvxv5lPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m0YNl8hVNoFUnLUYdBUeOSUQqFi/NzUh2IxX88Qn1nBbE8mqcAfiNoOZbZwaLzQtf
	 l5x0F7/7X7AcH+mJypeRs0RJbWk4GKBbY6AIO6jl0HVx/lGfxwRb30J6dV8DSNTUvL
	 /dihr4AzMzwMmM7oQm30NB9WTrJB9oexReCzvF7N3e7Un4tS79Mu+aSy7P+/j92cGv
	 8dJ9bzyXYG9dQZ9gsOmhikj9CAM0VpjeM8U104aFyOe8Ev3Xy0pRGKBGbLE93lTSpY
	 AzYZISjHKGN3lsKJytI6kyyO3+zdvpZTnws4MYR2waLZtXO1kt2P3TxW5IxtgXXCiD
	 EYgsGn4O28c3g==
Date: Mon, 24 Feb 2025 18:01:52 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members
 of struct phy_package_shared
Message-ID: <20250224180152.6e0d3a8b@kernel.org>
In-Reply-To: <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
	<b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
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

On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
> +void *phy_package_shared_get_priv(struct phy_device *phydev);

A bit sad that none of the users can fit in a line with this naming.
Isn't "shared" implied by "package" here ?
How would you feel about phy_package_get_priv() ?

