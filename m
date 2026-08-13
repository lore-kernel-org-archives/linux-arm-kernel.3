Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43444C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTYUQK8uwLBOSJl0Vd/0vpmuNbAw3wbk4WjrMQwfYWA=; b=pxQa0Po6X2+jHEEc5RQ4IJ1Tiy
	NPsfa8v+Z5a4U8u4gcjYKnwd1fRODKIGGTuMAeoDyb5+Nl585oDqyOMyWr+iZ1V7uD5TQKAa3uE82
	RKoTkgLEPrjO3ZPMlxl33dqF2bxal1RhOV97bYOTXMvfuV0YNuRur18k7RyZSe9HPpddVLZZvZiix
	/PmN41p5muFm1fTsFFtAQ7ODoDOdGYrbEwrnE6Sru35FJtoOabiyrvHJwZZ76S9GvlQY6P3XToe5f
	Q+XNn1XoaIADaeumg3fSkwD/OA3SkWBbD/ULf1EUtxYaLHrBoVbEZNu0FrXZsCpwXPP0FPOV7nZi8
	08wIM9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP3d-0000000HURm-48mn;
	Thu, 13 Aug 2026 06:36:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP3c-0000000HURf-1zZP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:36:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B025600AF;
	Thu, 13 Aug 2026 06:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85981F000E9;
	Thu, 13 Aug 2026 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603011;
	bh=cTYUQK8uwLBOSJl0Vd/0vpmuNbAw3wbk4WjrMQwfYWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kXCfK3gJ0M2spnfT9LmKSPYACQGbfk3LjYg2tY0d9gmn75TxfEmWWHmGp7ru9RMec
	 adM0l4oq+qQQVGltXmVz/QFWTFZ4lAkXNpXsywP0KQj/X7gdKwqosztbZdIxwIOPM8
	 2DPKrQZkfOvvO+IWA6CGkzRD8bczFV21AxcStP+i1ESlyXg6/u2UvaF4BMmdPMAJf3
	 BxZ/t31Ib8wnD9UxXyd4vF1bf937cC5LnZ0LAcekZXRGquECNLFJSCpd2waMm9RGOH
	 qDcFHtJ+1k0lAMQjr9V62fdQds90f/jbWU+/wgM0RYKuftoPNthBkmpSXiOt5lBu/0
	 XvwY0+NG/65Eg==
Date: Thu, 13 Aug 2026 08:36:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] PCI: iproc: platform: use device functions instead of
 OF.
Message-ID: <iumbya4k72oug2ze3cwhv4ibznsqsd6mawh4dmcvxuia3p5vs5@mbugjn7x4otc>
References: <20260727234408.296186-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727234408.296186-1-rosenp@gmail.com>
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

On Mon, Jul 27, 2026 at 04:44:08PM -0700, Rosen Penev wrote:
> Since this is supposed to be the higher layer file, use higher layer
> than OF to handle this. Remove OF headers as a result.
> 

What do you mean by 'higher layer'? This is a OF only driver. So what's the
point in switching to generic APIs? Please stop doing these not-so-useful
conversions.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

