Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFA0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TihG5ulYNyC2CWb/2kxjMoSBXPZNtz4RZKnLck4fdFs=; b=vK3zRuTYJpqD63
	m+tEWbuwYEg9NbQeRB+2CXdWwxljv+GLYJ/Pnbf32BeTk1Ayt3gZWYbhUc5rbLXpaMnAbvSUxkvvb
	cGm1kTfn63fUxyKsa8zBjAfyImgct+5rjr5b/OSPruQpHoluHx+t2FIPQ4p3VElEqc11+A6PfbWBr
	cUT+LEU8ci99l5N90GWWKXGuc7jOlJ0bycXS6zjca7vwK4GGBwVwDR1G28hyOM2RxNNN+MnZtU/80
	jk6CvRrrP8WVdq5D/czR9zt2fAyDMV4jRHn9rwJUaJN6yL+hNi5UhAJAfRli6Au8JAsCGcjREXWFm
	BbzqejMUxnZswKMidJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwy7-00000005DIa-0ncH;
	Tue, 11 Feb 2025 20:34:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwwh-00000005D0n-1l48
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3564A40D1C;
	Tue, 11 Feb 2025 20:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87328C4CEDD;
	Tue, 11 Feb 2025 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739306005;
	bh=m6uW5LI+RTAP6gZ7LY7Y5BSyq7TILP8ZnWmH47ViD2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YTdX6qiu5L9Qs3vdGhuZHTeLKJ+uNTRPgU7exdn7QBMmY3Qpg5Pj1ddbM9Yc2QIRJ
	 PwbclK47wvCBblffZ5zBpGhqUUioRkitHcw6goGkSoaw0sz/H9VZcARqQns8tp4KT/
	 CCGIfMqiWN4KcwxADPpWeq9mi0/qXZx+KzkMIH/dspacbbgiKf7GurrDfexv6J73ol
	 VOVyqq/3Z4R/lOzgm/YVjAGq7S2tjEPZ10GrQniJ6CW8y0y0eW7DSzHfgyQmZUanyy
	 QQUiqgz6FkHptDJ8xe72SvxEWaJml+MotLbMRYLEtMre02yjeoKjmwd/7LrorrRflZ
	 Bdy5xqiS4MTrg==
Date: Tue, 11 Feb 2025 14:33:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>, Marc Zyngier <maz@kernel.org>,
	Stan Skowronek <stan@corellium.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] PCI: apple: Set only available ports up
Message-ID: <20250211203324.GA54082@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-pcie-t6-v1-3-b60e6d2501bb@rosenzweig.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_123327_517226_74E35659 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Feb 11, 2025 at 02:54:28PM -0500, Alyssa Rosenzweig wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Fixes "interrupt-map" parsing in of_irq_parse_raw() which takes the
> node's availability into account.
> 
> This became apparent after disabling unused PCIe ports in the Apple
> silicon device trees instead of disabling them.

Is there something missing from this sentence?  "... after disabling
unused ports instead of disabling them" doesn't sound quite complete.

> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Cc: stable@vger.kernel.org

Can we have a hint about what makes this "stable" material?  I can't
tell from the commit log what the impact of this change is.

Bjorn

