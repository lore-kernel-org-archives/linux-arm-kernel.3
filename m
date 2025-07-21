Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0FCC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RwTqgVahnIycuQB0jvWM/hbHUq4yj3nsucQtLH8+hs=; b=Hhco2vk3Y7496XApl1LNbG8qFE
	CRvKFj+B04mrSKA+MiBa7NZyNwd03EU3uej7uKmXNYlRubcq83X6s4nb3KmJHVkIf2cnEX8dUdj6F
	+jwrqweYyYRlEgH1CRP90KvwxQRz2ouJmMcoBL6a8mmPa4rA/uCuWgSEucNcAEkR+FLXpzZJjpL+V
	JWVLP9n4EHS5BbIGSo3vyDd9LrwDlkrCW2Qcpglzcb8h27aGPa9o1zBkBS/BM0wh/HkfkwSSL9i0a
	lKAOetwQFljuY+OWc8X8D6cPN89QTFq5J0a4NPjHLMkxCAG82eBTehHycyzAfqVg71SR1JLkNhcqU
	swrVncUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udu0b-00000000HLA-1pzB;
	Mon, 21 Jul 2025 17:09:01 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtQz-00000000BDA-0PnL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 16:32:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bm5Rh62Bqz6L4ws;
	Tue, 22 Jul 2025 00:28:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 914F51402EC;
	Tue, 22 Jul 2025 00:32:04 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 21 Jul
 2025 18:32:03 +0200
Date: Mon, 21 Jul 2025 17:32:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>
Subject: Re: [RFC PATCH 12/36] platform: arm64: Move ec devices to an ec
 subdirectory
Message-ID: <20250721173202.00002b51@huawei.com>
In-Reply-To: <20250711183648.30766-13-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-13-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_093213_280603_356617C1 
X-CRM114-Status: GOOD (  15.54  )
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

On Fri, 11 Jul 2025 18:36:24 +0000
James Morse <james.morse@arm.com> wrote:

> commit 363c8aea257 "platform: Add ARM64 platform directory" added a
> subdirectory for arm64 platform devices, but claims that all such
> devices must be 'EC like'.
>=20
> The arm64 MPAM driver manages an MMIO interface that appears in memory
> controllers, caches, IOMMU and connection points on the interconnect.
> It doesn't fit into any existing subsystem.
>=20
> It would be convenient to use this subdirectory for drivers for other
> arm64 platform devices which aren't closely coupled to the architecture
> code and don't fit into any existing subsystem.
>=20
> Move the existing code and maintainer entries to be under
> drivers/platform/arm64/ec. The MPAM driver will be added under
> drivers/platform/arm64/mpam.
>=20
> Signed-off-by: James Morse <james.morse@arm.com>


>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4bac4ea21b64..bea01d413666 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3549,15 +3549,15 @@ S:	Maintained
>  F:	arch/arm64/boot/Makefile
>  F:	scripts/make_fit.py
> =20
> -ARM64 PLATFORM DRIVERS
> -M:	Hans de Goede <hansg@kernel.org>
> +ARM64 EC PLATFORM DRIVERS
> +M:	Hans de Goede <hdegoede@redhat.com>

Smells like a rebase error as Hans' email address chagned
to the kernel.org one in the 6.16 cycle.

>  M:	Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>  R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git
> -F:	drivers/platform/arm64/
> +F:	drivers/platform/arm64/ec

Other than that looks sensible to me but obviously needs tags from Hans or =
Ilpo.

Jonathan



