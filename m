Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FEDC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLpZYMENBNgPXFarYmWwn7VwAhRa9SmUHkcGWYZHpG8=; b=fHqTfNGnQGgXOd3g7mHJxeSFQv
	YDYTzrbiX/dOwCo72JU/mE3yw4F6SJ+Ne/ZAJC09a+1qR4mt5h5JVhgYiZsaSb0HQPDtoJzjtIDNH
	OISXCy6ugerJy+vkk8OT7Cf+DnhSAAdKSCI61ExfiCdverIAQ8FQCxN63sA5uQNuZ07ztRaYbAqU7
	vjhPk9DWHyGTwgAYwobnAcFpNoRTOKem/dGt/ulBwmXQXCtIq0I7duNxdfqcPHqGv9zqyetqZbRE8
	gqPXSo7r9s8v1m5M3pzEsnUjNzNlx6MqNHGf0jjMuB0JWcx+T7V9TZRJwip6h4KFIIRBVMc7DIOYi
	EIG6PjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5nt-00000001duQ-19tp;
	Sun, 26 Jul 2026 20:50:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5nr-00000001duH-49yk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:50:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38BCD42CBB;
	Sun, 26 Jul 2026 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4611F000E9;
	Sun, 26 Jul 2026 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785099031;
	bh=HLpZYMENBNgPXFarYmWwn7VwAhRa9SmUHkcGWYZHpG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=In5V3KSSLdWN4HHPW+I8bvUb7SeetiUPoS+vwnKYBb2rUiZOW6WdSPgD7lUHb2ay2
	 aEV8ESrjf0zFLfFex/SkOqNEB0Vj752OA8tBNny/jl1XwEuHlMuT1eq1+pgtxqUNRV
	 4RB4LYce8X4AXHS91Jl3DeTxLBsFytz0qCX4/dsHqKyDntQdurR5j7n9uLgpGXcu8/
	 1nuAFjFRygNUHsQa9d64ooc+nT4MptG5vbo9oXzn3nbgFG/J8JsoyceViKUD7QG5kl
	 K3FdMqec0+WZ5CNDX4q3SMVfQHRxBwc6CQKsoAX6wh7LYKIXkBrEyf5BnVloSBt/y5
	 iBhv21g14JvFA==
Date: Sun, 26 Jul 2026 22:50:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: pxa-pci: use platform_device_set_fwnode()
Message-ID: <amZzAGnHvXxS8CM8@zenone.zhora.eu>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-2-2dee93f42c54@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-2-2dee93f42c54@oss.qualcomm.com>
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

Hi Bartosz,

On Mon, Jul 20, 2026 at 11:24:49AM +0200, Bartosz Golaszewski wrote:
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

