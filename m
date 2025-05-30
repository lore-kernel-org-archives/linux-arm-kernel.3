Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A70BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 19:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cTSKXkk0LiYSHSnUQBXvXzXGMFjIKhWXHxQ0piIAQFI=; b=hJY9tlhlD9/R6f
	dbapKHJIt6lWCwFi4cbQiVZ2ZhuKc8LXaj90xWIyvT0YIw9+OmkiBlr+Sz4vP1xSH+zQmfXjdPPQW
	t9IAeKxb/2LALmTM/Es66Yn9zzu1DM1fJuV1uFmXPYtnWlwdbY/0U+0cffeF/wIcLZpbLjclnQfL4
	CtEy9/nphXUpO6cILt57aHCRGPC/Vo6SEoVRA7rkGr3UFbSTg4pWsBsFo96WwxlQG50q4/WTW5uUR
	goLBIlrIhkKYDtFNKmtN2q+DmPReP6stxnW++hScuLYTZy1emBGWqzz2KQqDP9V3q7lRFlvLASmHq
	qF2738ZT2LwXEe4ZXSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5g4-00000001eEa-2LEN;
	Fri, 30 May 2025 19:46:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL5du-00000001dY8-13Pj;
	Fri, 30 May 2025 19:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C95CA4F9B1;
	Fri, 30 May 2025 19:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0552C4CEE9;
	Fri, 30 May 2025 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748634229;
	bh=0vCexfz0/m7ZSD9o27mnf/i5aE11GNqR8VJ8Kkd2bi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EcB+90+TQdOtwEYbs7sd/EeKSL6M6QyvefVoPK/JHZpMYN0ikHItMS+OWqCs5XbPO
	 gza2uSRSWP5zQmS7q5bdlQPx+ERA87keGhtm92VyjgJiKzGoQxbcgSMZqa49Dog996
	 UB573dqxmB/nMK6RiIRwP3N7RjfM0+WghCSGR2qTgF8RFTgeFIhztOEyb+8wAY4vak
	 3spFVglzPoM65fLLmuvFZ1cXtq3uDB5wSfpavP4YOO7pDB7KsxJcqXhDJij5Q6O+PN
	 pwHdPG1iL1OHqMBMFBQFwiQ0lmkbkA5KMeiePRbI/+OPb41FxT0G9J+6GhNAkLK+BA
	 0doHfzZaLM8dQ==
Date: Fri, 30 May 2025 14:43:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <20250530194347.GA217284@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76F22449-6A2D-4F64-BF23-DF733E6B9165@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_124350_361488_982B0E44 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, May 30, 2025 at 07:24:53PM +0200, Niklas Cassel wrote:
> On 30 May 2025 19:19:37 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> >I think all drivers should wait PCIE_T_RRS_READY_MS (100ms) after exit
> >from Conventional Reset (if port only supports <= 5.0 GT/s) or after
> >link training completes (if port supports > 5.0 GT/s).
> >
> >> So I don't think this is a device specific issue but rather
> >> controller specific.  And this makes the Qcom patch that I dropped a
> >> valid one (ofc with change in description).
> >
> >URL?
> 
> PATCH 4/4 of this series.

If you mean
https://lore.kernel.org/r/20250506073934.433176-10-cassel@kernel.org,
that patch merely replaces "100" with PCIE_T_PVPERL_MS, which doesn't
fix anything and is valid regardless of this Plextor-related patch
("PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
ready").

