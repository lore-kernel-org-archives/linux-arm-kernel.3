Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C7E63FEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm9FGkRc1QRpNSImSwgwSEPvOU2SLgI61ARuYW5LgUM=; b=SrWjx3HNdOD78nexbu09PAj7WV
	EoSu1UnGn+ZfutNo8mR8TAIRYdfmvXU7SaNDWio8ymyNbLgnoE7rpvkEGC6e9op7eFv2coNMOfo/6
	F8Eicq+z+CnKn4SiEhATbtxUaXEAc3QodNoQP0wdAfouBLh2OFznm8FHaEn9qLjpHw0t3cXCieqEY
	4+bJq8bZwdYejQQfi+6AgtxxUh/wmd00rtl3WgyHDb7QsiRhmLLhuSRpWCyCqyHQL2tAiaU4nVWre
	CKI4OTRrHarB+zlRa973hUkQ21hQlrvtmco2WlO1gUoJf4qKxWpvD8dieLW9IVqAvE24NfM1mTCpY
	gHftHoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w96Xl-00000003hHy-0MYM;
	Sat, 04 Apr 2026 19:20:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w96Xi-00000003hHc-2TjP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 19:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1359541720;
	Sat,  4 Apr 2026 19:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00214C19421;
	Sat,  4 Apr 2026 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775330423;
	bh=Gm9FGkRc1QRpNSImSwgwSEPvOU2SLgI61ARuYW5LgUM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jmGUx9ea8KKZGI+yk4InrpqyltSpIFXbxzumeqJLrPMsCCsI1AmriWu84nJMybHDm
	 YQX3Ac/MMmi2g9ubzYQwGTmoLjoD5HvqXXGENZ7sZF+bdgDoJQgXEb5+YyoFBlZFth
	 rIDl6Or9j72Pxfg8gbRbLoxXUMFAACLFbQ4DfxU/vKJfbDZ88r7qcAUikXvNARJnPR
	 UKzC1aGXBRx4bgxjkQ5ETAqx1gHtveCsTmzJzi7+wf9pVTh4t9trQOG4pictre3Zqy
	 coxYtZTwXCoUTOSXcrTxyqOyBWyu2eDrD5N4/86+0enySLlkVbuU3KeCQL6A1XpL4u
	 dWWtgOZ4j3TJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 21:20:13 +0200
Message-Id: <DHKM3WP2ZJYE.84WX6IAGUH5@kernel.org>
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
Cc: "Russell King" <linux@armlinux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Nipun Gupta"
 <nipun.gupta@amd.com>, "Nikhil Agarwal" <nikhil.agarwal@amd.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, "Haiyang Zhang" <haiyangz@microsoft.com>,
 "Wei Liu" <wei.liu@kernel.org>, "Dexuan Cui" <decui@microsoft.com>, "Long
 Li" <longli@microsoft.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Vineeth Vijayan"
 <vneethv@linux.ibm.com>, "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Harald
 Freudenberger" <freude@linux.ibm.com>, "Holger Dengler"
 <dengler@linux.ibm.com>, "Mark Brown" <broonie@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Jason Wang" <jasowang@redhat.com>, "Xuan Zhuo"
 <xuanzhuo@linux.alibaba.com>, =?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, "Alex Williamson" <alex@shazbot.org>, "Juergen
 Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-hyperv@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <virtualization@lists.linux.dev>, <kvm@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
 <76355cb5-0b5d-4a29-9702-8d020a79f4c0@kernel.org>
 <DHKJ7VWI1CHO.3ETHUGQVPFFDE@kernel.org>
 <a8c85884-e2ba-4a3a-a660-9715f0de2704@kernel.org>
In-Reply-To: <a8c85884-e2ba-4a3a-a660-9715f0de2704@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_122026_661055_08B8DEBA 
X-CRM114-Status: UNSURE (   3.32  )
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

On Sat Apr 4, 2026 at 7:09 PM CEST, Christophe Leroy (CS GROUP) wrote:
> Yes please pick it up as my tree is based on rc1.

Applied the patch to driver-core-testing, thanks!

