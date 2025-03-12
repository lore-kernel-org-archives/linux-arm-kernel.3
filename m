Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gb2WnBHO3Ot9BixCv4lVirnBDQfeIR0mQCU9X3VHw4=; b=TCBOLepMW97KlBGKheEYTZfPTx
	Sy8s42/M5kXhU5OVYuyI1RwJFWH3lFjTIZ3PH+QZjxsWxbcQzFW9C10qnGUv42p57Jw4q63aojfR6
	bbN2EFHY9DgP7gJZLID5D5IsHjXGupai2TzifxsKCPcjU0UGV1jt5OvG6004i28R8FdmuZbkfvzOm
	X+bPPxJsQLWay5qYnTh+hL00wn56LdvvNBqqtrN/cwOJnXq/jcsmMLWrV2ObME6Dz/ZSJBhLioCBI
	DEavd2WBeu5MW+KDRvFuUgDAYNjPwHl19VJi62nxUo+L9bvv7YfPQyOVMR5FuHjspGuaEBTqS1d5J
	wMHXAIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsP3b-000000092wI-3lFb;
	Wed, 12 Mar 2025 16:35:48 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNtb-00000008q8y-3RYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:21:25 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 39B93457EA;
	Wed, 12 Mar 2025 16:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741792879;
	bh=4sQmwkxed47J1yAVFY1M8IrVAON5A+0JqlWOAYiAt0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgUseHpfm/duHTEwQRTgX7/pauJE0Oh8fZ2kNPDxNy4/6mY9AGXU20bYatRDGiRFC
	 2XLH9+jFCs8YySrzCSPu9SQgWGSribYev3e1rQ+pwqqyN1mqPJVu/ga9Vn74BA+J3H
	 UiyzKeGKERMvEZHmat4/khRc4SaEi1wdKZDg2XifJe4ljlAwPT69QcrPko87TXxxkQ
	 IHWTxAmwmKNFxYLYPVgWu/YHImYGBRl75RPl+uE9B9qlgJ1rBoX1F46qGH1sRbTTFZ
	 YBvFflm9hrsYcn3+iyZG/zm5sNDFxrm3QO+dMzCUZ9rBy0T7d0kQHMtsNOzdZtNKZk
	 E8iOdVUM4QuoQ==
Date: Wed, 12 Mar 2025 16:21:18 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <Z9GmbgYKr0VepQZZ@8bytes.org>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z9CEIlXoQJ-A0t-d@8bytes.org>
 <d55240a4-fe4a-48ea-b3a8-9a997bb7267c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d55240a4-fe4a-48ea-b3a8-9a997bb7267c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_082124_076878_013F84CE 
X-CRM114-Status: GOOD (  11.03  )
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

Hi Robin,

On Wed, Mar 12, 2025 at 10:10:04AM +0000, Robin Murphy wrote:
> Argh! When I moved the dma_configure call into iommu_init_device() for
> v2 I moved the warning with it, but of course that needs to stay where
> it was, *after* the point that ops->probe_device has had a chance to
> filter out irrelevant devices. Does this make it behave?

Okay, thanks for the patch. I am currently building a kernel to test it
and will report back.

Regards,

	Joerg

