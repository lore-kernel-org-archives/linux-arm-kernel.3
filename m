Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8CFEC102
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTkOFqM2M39cWVqUtU9Hd88xIizvMwzDXk70xhu+U1I=; b=Nj1dawy1K4y+BugAnMsLBZYgjU
	IKN9W5NYfiPwXqSTy6T3tJ9Js4SBqtpgkEridrtjxdS7JB+Tzl43LnwWAFOPxj/Qjd+Fdpch2Egb2
	XMlOU9o4/fPLvEED1BJL+djrKi2iLmQo80xBRxyvrFr3kg5Xnkbxo2AlsKQmVsEXw/JC8K/zqJT5u
	vwtCBNftAgKlmZOxj2lAYL6FrVQ6nB5clVTt7VW9LwgSMIwVKu/1442MxLxvlW6lxyxGz9qJPmswR
	jj6RyEtHgzo8z6Vs3YA1udPPXYHG6mFNM9L2wAYI0KYO66lV14lEVVLJCSvA7nJr2hkhSa6jJZ3vN
	ozzDu3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57gM-00000002ANb-00Lg;
	Tue, 24 Mar 2026 19:44:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57gK-00000002ANE-1JNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B3A3600AC;
	Tue, 24 Mar 2026 19:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF553C19424;
	Tue, 24 Mar 2026 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381490;
	bh=WRF/0A79XI/IfrPujL8sWiRG4jtPsIHG8/HKlYhxfwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BI/PyKSYvjLJXWbEpQrc+czH+55hhTQfVKT55Uu1wKsITHQaRklHZhshTVjzHQFZN
	 XI99w4CrCK+yRfm2877TM5yV4pPdvKaG1DWbUoq9X2UMljaiVAeNppp3zNtFe6VQcR
	 Nbxio4BzKuKvbSdbHpiqyp9b0V4Wi4iBFmRLBu0AraFrnoul9PN3a4ntDRFnw+1WBV
	 6VOLh/84HoNWnxFvJA4p13awciT/KZz8A8WdIkArI2aCUbV0ZkSk5h4r/JYUTPRIIT
	 T8Jt8zQSnSc69wMDv4JXXRT2onYDSQlxz5UqGBDTvOp1c1OxGFbD7+EZxoeS8MPSTJ
	 8n38/skizDzlQ==
From: Mark Brown <broonie@kernel.org>
To: Russell King <linux@armlinux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Armin Wolf <W_Armin@gmx.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Harald Freudenberger <freude@linux.ibm.com>, 
 Holger Dengler <dengler@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org, 
 virtualization@lists.linux.dev, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
Message-Id: <177436441990.98682.12977271865531185229.b4-ty@b4>
Date: Tue, 24 Mar 2026 15:00:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WRF/0A79XI/IfrPujL8sWiRG4jtPsIHG8/HKlYhxfwg=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGnC6amgudhaUXvPlk+pDm3GoyUp8H0DzJj7P23jodGH3vgaM
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJpwumpAAoJECTWi3JdVIfQ7W4H/0HK
 bnLD6QxQOBC+fzyIxZ6G6kEKZPO4GVW3Pfn4yfAzX5qrdKQRkDgps7IYWut/u33hS3f+Z04EmOJ
 lYrLIJIM422nR6nge6hF8EhqNBiTq/w9q7cGC48hH540F15d0sLd2//XCIGupIA1RXpBqVdzq5x
 OT6qjdHSfs8FyZ+oeQmp08Rcg1XfVc+MneH1PzidJufZ+tJUtayZw29OlGfNk6vGZ389vkRi+Ec
 XFn5qSzIYh78B0Z0zXzPv2/IjG8frEcheWdi3dJbD2bUS4h2S1US62r3HG8U3Au0lRz8ggXRMML
 03vuVW3IP0egShhpeZHJhBzFqhYb6LFlY+k9hXc=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 24 Mar 2026 01:59:04 +0100, Danilo Krummrich wrote:
> treewide: Convert buses to use generic driver_override
> 
> This is the follow-up of the driver_override generalization in [1], converting
> the remaining 11 busses and removing the now-unused driver_set_override()
> helper.
> 
> All of them (except AP, which has a different race condition) are prone to the
> potential UAF described in [2], caused by accessing the driver_override field
> from their corresponding match() callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[11/12] spi: use generic driver_override infrastructure
        https://git.kernel.org/broonie/spi/c/cc34d77dd487

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


