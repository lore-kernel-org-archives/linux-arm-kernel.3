Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55C1F532EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWnoCSv8w8q7/YUh5T2kDAJaf06iTTxggP6FxI8TNLA=; b=uvCbYLVQ5EL9w5nkWeHO4lr4tr
	LJoLfizAeezynLZHYko5yXpABmYYAjYADtp1z4Eu8qWk5bWukugXl0B+Sz3BPXFvyzL39X8wp8jK9
	rEpHvbXdpU/BpsgPx5I0MbXXQ3bWZlStAMiBk5j/ChxgjsZsQFFgO4HvZ/UY/Kw0G7T02sG6HbRgq
	OlZtyMOuAnm/YkM/bv0PM8huv8qE/amGQYxDyTqybctDBnLEbt9+1uLSpijkWrgU/bO3HWDm3Z2QL
	x5JirC3CZHWli1vUWSmWMfijqARm3yd/z6m+8E1DHrp/3rMbm1VLzqp38AvxqNyrAJsa8LF8o+yDO
	O2An0XgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpp-00000000xgE-3P30;
	Tue, 24 Mar 2026 08:09:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpo-00000000xfg-0dXQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BAB3600C4;
	Tue, 24 Mar 2026 08:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1B8C19424;
	Tue, 24 Mar 2026 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774339795;
	bh=IKKPJZ+MZDaoxP4vPPsLme6gW/n7DEGEiTEMcgMuYp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0L8IR6Pk68bAp9++dR6ItzOnWZf2MgvBLl2UV5zaHXNUbsVb9RAc04NnLuD2YNf+G
	 GmqZcQvouuvrdE0xPt4YHI6OTcY19NxN8kIn1pWJKzLM1zFnqP+nevgcl7t5hQ7vTE
	 9EDRgh/2RJsqQNRl7woh8a9xc4H6xKdllWSA+5ec=
Date: Tue, 24 Mar 2026 09:09:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Armin Wolf <W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alex Williamson <alex@shazbot.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 12/12] driver core: remove driver_set_override()
Message-ID: <2026032412-finally-lubricant-7fe2@gregkh>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-13-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324005919.2408620-13-dakr@kernel.org>
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

On Tue, Mar 24, 2026 at 01:59:16AM +0100, Danilo Krummrich wrote:
> All buses have been converted from driver_set_override() to the generic
> driver_override infrastructure introduced in commit cb3d1049f4ea
> ("driver core: generalize driver_override in struct device").
> 
> Buses now either opt into the generic sysfs callbacks via the
> bus_type::driver_override flag, or use device_set_driver_override() /
> __device_set_driver_override() directly.
> 
> Thus, remove the now-unused driver_set_override() helper.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/driver.c         | 75 -----------------------------------
>  include/linux/device/driver.h |  2 -
>  2 files changed, 77 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

