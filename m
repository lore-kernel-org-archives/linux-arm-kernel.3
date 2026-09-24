Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F96C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKg7nDxnOaTzxjNsvD6j1xiQte7wnr/D8GplUBzYPX0=; b=p/fGAHrVBOtwjh6Me0q3apYm0w
	4ZziQiqJnXHuJdZbzMFe81KboTN10UJKj/sImh0HPIrUdp+3DoIgcgqJTFRZ/9q2fB7pJF8Mj5yZH
	/GUEzcZH701zckythcEmiw+WwY8GuxMQdn9m9H8mxRqDVrSPNn+4S4wdz/zlaNhal9bknEiTfIr6H
	93WSGancp4xVvGCTfi4KlTW3ghdEf/bWi//504T7f20vqGpJqRonGh8T+QBXtece6u+ZT3xT6yuMa
	qWa6syzoruxmOIMq/pxGcnVk+QL8HSEJR+X1OTuJ4+sBEjSuWXJqjkkuaEjw4A/lkoTQRvfOdar3b
	mbbiM+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hix-0000000AsnI-20Mr;
	Thu, 24 Sep 2026 11:34:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hiw-0000000Asmb-3Inz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 11:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CKg7nDxnOaTzxjNsvD6j1xiQte7wnr/D8GplUBzYPX0=; b=fwYSVKUgXbzepXHzW/z+26ERry
	yrQV/nc9PqNc/pK3Zzb4F/gABmWddBCscyb5CWkh9ryKAL2SSorGDO69QJUJgHJO2+DUfnUChXIwp
	OzbZlM1NIMFyMwLsGqx8uvVyvdRYB5mF/dzUtEueOe1L2KdXpgr4DiTFyRnuDWtjl/wKkFMtr0sB6
	u5sPBsEVwdilvgfDBaK9BVK4UsLL1i6ZVcBJ2fIKgfk9SL9++9rMhunIPEMzIMETd2/8Jfdb4D20z
	adPbAEay2oZsFVqHlE1iK92ZksC0yNbsdIVr1MGokQslEuOQ+aVGcdxyRCnwmTdfhNh8EI3Mp3yz+
	PBu6Z1Gg==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9hit-0000000FuUX-3dop
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:34:45 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 18CCD1C7465;
	Thu, 24 Sep 2026 13:34:42 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:34:40 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 0/2] iommu: apple-dart: device specific DMA aperture
 support
Message-ID: <arUKwubaodZVrf29@8bytes.org>
References: <20260831-iommu-apple-dart-aperture-v2-0-d16ce3770299@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-iommu-apple-dart-aperture-v2-0-d16ce3770299@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123444_047742_9BBA1AAE 
X-CRM114-Status: UNSURE (   7.67  )
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

On Mon, Aug 31, 2026 at 03:46:07PM +0200, Janne Grunau wrote:
> Janne Grunau (2):
>       dt-bindings: iommu: dart: Support specifying the DMA aperture
>       iommu: apple-dart: Support specifying the DMA aperture in the DT

Applied, thanks.


