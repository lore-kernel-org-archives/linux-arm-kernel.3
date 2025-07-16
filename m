Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B0CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fVjopvfyvZ/TJEmsmE46XtdH/DmeO7gMDv32WeqVMg=; b=Ky2HPXMSH/8RbuwBhAJ5Bvg8/2
	ZOIgpaEA2c8kkFkB3gIdx35z5yu6rlmF/lu5nQCYTev7QtcCwA+a4DueoJfKvk7oGgMQvXW4bOnnz
	lN8NdWRTlxGBffv+AHo+bYuroKQPhSQ5wkq1dVy+GnohnkonQO09mwhS8GoehyLCz6JROb9tSAv2Q
	udWMzznJMD7/MUQMtCU474rDPOxpUTcd/w3nR3wUQbfyEN7RAufJ8qrE5aG7KysFZSNiQxjJ0jyAH
	F1vMAbiRxYPJidzV7iIxIP+YEQdfrhP3vnyFLarK/vzfyunZdazVuG0oTd9Nlv5P0erJ64XiM85w1
	nZ4ro/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubws1-000000073UD-25Zk;
	Wed, 16 Jul 2025 07:48:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwmA-000000072mB-1ZRg;
	Wed, 16 Jul 2025 07:42:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 588435C6581;
	Wed, 16 Jul 2025 07:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0D5C4CEF0;
	Wed, 16 Jul 2025 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752651721;
	bh=zdIsE8zMh+Q9b21Tzn+0aEdVw4+F6kLYzxIztPzl06U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MebXlxNvdo6y4CMS/mqxoQ2xFLxVMUEkAK0nDRI0znnVgjscwpAL6eKw1ElxcNis5
	 pLFwQ0fTbKA0C3pg4H1dXXyd2CgXFKAmwJY0D3nZ9rQsTE++t4819Eh7/xs/UQ21Wp
	 mF/RS3IztXa6/ELVGb+PZyJU5a+lbXiGZCXzR8TjQxHROo1+8SKuQe/ucCZa0TM/DX
	 QORRzVFEHTsMl0upK+DPMk+xfPXU/C2a8Zkk7qxy4fgB78RtKf3fKeqk5WT/YvI8sS
	 Na/gdoRKRqq8+/pzlFC+zCHX5N/rjrZD/g2HApXyRkgVKadQGvaxU1KDUfYrPOtZlq
	 0zkTAF5CD23ZA==
Date: Wed, 16 Jul 2025 09:41:54 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Configure root port MPS during host probing
Message-ID: <aHdXwr-UZz6jZX3f@ryzen>
References: <20250620155507.1022099-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620155507.1022099-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_004202_456776_0E1A9903 
X-CRM114-Status: UNSURE (   8.64  )
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

On Fri, Jun 20, 2025 at 11:55:05PM +0800, Hans Zhang wrote:
(snip)
> ---
> 
> Hans Zhang (2):
>   PCI: Configure root port MPS during host probing
>   PCI: dwc: Remove redundant MPS configuration
> 
>  drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
>  drivers/pci/probe.c                    | 10 ++++++++++
>  2 files changed, 10 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.25.1
> 

Any chance of this series getting picked up?


Kind regards,
Niklas

