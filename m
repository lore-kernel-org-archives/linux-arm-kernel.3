Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E360C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oKhxSVXGDVm+qucXMK8YNhWI4lwMIt4fOF8+IcyMJ5E=; b=OJakQKelSd1HLi
	zJGL9J3g4QrTlYRQ1o7oPjXmwJpi5211mialsMgM8dWyL8L/rXPZNd/lBDSe6l6kZApgpLu/aAWnK
	JL8j64sf2vNQT8QGNcis8I1RKtKhnX3oJbRtnzFM4NG4htuWKi4pos3Fzbsyp4ion5eTn1IW4UAa/
	pYc0+E+5iPpRLCpBoy6VPhSADzMYdsnJzOCVw6jTdIsUOOxTcJSt83n3+SVElIvahY4V9hvW7GGWE
	RDvqGyZzV/ISOZxC5cgj7GKv95tz3xDhQcP7QU0eotkICRz9d4uYaDJHcJAAmKXkbtgyCH1X1xVxU
	5XvFsNi2SK9e5shZMeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecP9-0000000Ha8z-1A13;
	Tue, 30 Jun 2026 17:37:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecP7-0000000Ha8c-1Hlv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:37:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEB8542A84;
	Tue, 30 Jun 2026 17:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BEC1F000E9;
	Tue, 30 Jun 2026 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841066;
	bh=oKhxSVXGDVm+qucXMK8YNhWI4lwMIt4fOF8+IcyMJ5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=NERHJxgTlKQbLnw800mRU4wiRtidr8eWnJrJ6u1axUtwriB6g9JzkCQhz9rrdY+Xc
	 Lg0RB0duZfXGnPVNlEWZ+xrl17cdL0/H+Do75pa/AK56vUOiNxUfSPEmwcy7QrFuOu
	 cl0CLGjqiv5VrS0cr4EHHyY+93wUMTJpIfXXkscL1KpRb1DYFb+DXMuEz9kcKGeSdT
	 KC5zCbtLTjHFlFzb1MgU0oh+jk/utS6XyjtH+7ukIKxnctwVGEz3358ser+97m8ZgH
	 vH/UKSJJPjwAfB6CHNNYWYATM4bChF3YkQZ+p7sWTDFX7J58HFOoTt+ao4cFAIisti
	 HckZe76qpZXbQ==
Date: Tue, 30 Jun 2026 12:37:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitkumar.karwar@nxp.com,
	neeraj.sanjaykale@nxp.com, marcel@holtmann.org,
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	sherry.sun@nxp.com
Subject: Re: [PATCH V4 1/8] PCI: imx6: Move pci_pwrctrl_create_devices() to
 imx_pcie_probe()
Message-ID: <20260630173745.GA155769@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630103139.3823329-2-sherry.sun@oss.nxp.com>
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

On Tue, Jun 30, 2026 at 06:31:32PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> Move pci_pwrctrl_create_devices() to imx_pcie_probe() so that it is only
> called once during probe, similar to other regulator_get calls.

Can we say something in the subject about the purpose of this?  "Move
X to Y" summarizes the code change but not the motivation.

I guess previously pci_pwrctrl_create_devices() would be called during
probe and then again during resume, and we don't want it called during
resume?

