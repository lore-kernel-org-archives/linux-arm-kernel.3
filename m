Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D217CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmiFHqTevzpTd67JED8R3CjY5+3NzH7Hvg1rhxsNPiY=; b=0Ne03BJ5bgYd7mZxy9D2ZpvTRp
	PNyxHIKW6gMknXllBY19plxmwU0XbwTqJnGd1mlIiUCFZ6WoyrlWQJFznB5RUzWTSTJAkW75D7ars
	FepnNEc857lxOw3Hw2abL47JxvEhrKZsWkoyKAlBZGQ6DTyEB/VNafR2hFi6OvBX9TXXNL2uZ1evY
	zhL0gBx6q9noC8zR3ay2ilx7w3YozNX4Mj8hRXiWG/GL6WaftK/VR4XtUEsKCEPoE9PfABlBwoYz5
	AvQsucxPspsYLmzOgGlhQE9GGQPq2UXQ+fqW5Pz1UkXFDRgZbAwL96BAihtnIK6wl1B8Djr5W26IK
	68yerndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13M1-0000000DZop-3cpC;
	Tue, 23 Sep 2025 13:46:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13Lz-0000000DZnz-1Wgo;
	Tue, 23 Sep 2025 13:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C48D1449D0;
	Tue, 23 Sep 2025 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C0DC4CEF5;
	Tue, 23 Sep 2025 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758635205;
	bh=FO1IaZWhYXzPZ1kV2cp8Kfr5N2is+biotDlknM0E+x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxQ7VDKfAzJIYa13xErJ+FpKQkM0PJmDHnphGd9CMCFROVxi8kNFAWh/WESrHULj8
	 VLgqHBFIBpQXCtb/GASS4fKMOjmBwZRD7wACS7+FLfDx2ytcroOdgLi/XLulEJQ7NA
	 eNLCLXjkrcFO4s0XZFhspPWr/XwYMMrWpNf12Cwy0wyvAWs1hrhZHgSbO1wapC2gpT
	 4W/lMZbVbEYoyuQoOrhA7kGpyuDXmTm0Ft5mrMqqZvR1kv9x+VF9ILnrRUcYFHInJt
	 uHe+M9HvRIDEV+RyIx9VqgjQDSF4y7mjWkxmTEowB9J7dXKXY2UNJoe3h5D6fiEAoh
	 cpGKGLsVB4rKg==
Date: Tue, 23 Sep 2025 15:46:37 +0200
From: Niklas Cassel <cassel@kernel.org>
To: David Bremner <david@tethera.net>
Cc: devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org,
	bhelgaas@google.com, heiko@sntech.de,
	krishna.chundru@oss.qualcomm.com, kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, lukas@wunner.de, mahesh@linux.ibm.com,
	mani@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
	oohall@gmail.com, p.zabel@pengutronix.de, robh@kernel.org,
	wilfred.mallawa@wdc.com, will@kernel.org
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aNKkI00EAJb8LD9S@fedora>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <87ldm548u2.fsf@tethera.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldm548u2.fsf@tethera.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_064647_424683_A1B85751 
X-CRM114-Status: GOOD (  17.13  )
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

Hello David,

On Tue, Sep 23, 2025 at 10:06:13AM -0300, David Bremner wrote:
> 
> I have been testing this series on the 6.17 pre-releases, lightly
> patched by the collabora [1] and mnt-reform [2] teams. I have been testing
> on bare hardware, on MNT Research's pocket-reform product. I'm afraid I
> can only offer CI level feedback, but in case it helps
> 
> 1) The series now applies cleanly onto collabora's rockchip-devel branch
> 2) The resulting kernel boots and runs OK.
> 3) the resulting kernel still fails the "platform" pm_test [3] with
>  "rockchip-dw-pcie a40c00000.pcie: Phy link never came up"
> 
> Of course there could be other reasons for (3), I don't know that much
> about it.

I don't think this driver has support for hibernate in upstream.

Did you try forward porting this patch:
https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/

Also, have you tried the downstream driver?
If it is working there, perhaps you could try to isolate the changes
that make it work there.

Otherwise, I would recommend you to reach out to author of the patch
above ask for support.


Kind regards,
Niklas

