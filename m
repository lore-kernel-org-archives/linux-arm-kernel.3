Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE966D735FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxJMvDCbMSCvUg5LlGYYvlzkhtyu+bAro8yaV/kZpq8=; b=n01ZnFjP6MNyXqM+pEIpRWctpu
	EqkJqXBqLjSy1WLBKk+rEvv8jcUVuSHTLhbpq61lhpFjqB6hXsqJEOqa76NbUbJRaIuIqh7Yaz85I
	h2HhAzcXOJHr1GJRXz/CZuG1iR2jYhgjVOn61AFl0ZPFtyROVnUn9AF99Xpn2POr1DNezsrZoUvBj
	ijbin71c81shl8HbOArHP0o1fmxNCKwM9ITvYUsS97uTL3ipPuPpnho1rCmjLunxrdZ+CL4gEQ3/L
	tGHLCH9d6Wo9b2d1r9GOWweulY567H7r9uQQx9E07PVGQk4YTBGEsYlYM38elCpUUaQRbCywt4Zs8
	+J0gnI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKiv-00000001sPJ-2D74;
	Sat, 30 Nov 2024 10:29:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKhw-00000001s9I-1b8t;
	Sat, 30 Nov 2024 10:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CB615C5960;
	Sat, 30 Nov 2024 10:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB4C4CECC;
	Sat, 30 Nov 2024 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732962491;
	bh=H0noXI74C/Zki/cAOUy3v09yRzJnW9gLLKsDYh9ILj0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lkzg3Ng8Nd3eRCvOR5+7VFIy11KPI7flKiR1AsNRfmZnUC/tuV7JKtiFhwetJbd9S
	 oDjTgoxJaCaSuieHu+qpH2hzSkgS5BtmHYbHFQbdKSpbBNlSP6JRvmE+2dXmS6XLMR
	 LEV7+x3VReDOmaNFj4CsWoDEkT6yIzhyeYOYoDa9nLM5YIu7br8Cwc4MB9RRQIRIth
	 no0I+bfsXLu/F0V+Ed0EDXk1WHXb0PrPvPpYpCZg5wRAfSoyBjT6XXjL28yE7mXCnm
	 hlTv1YOMDPxBEKA1uY56amW2K0UXZKSJk9pLnzsGqlH37gZKxhQEe2Mx7ndm7Vje3L
	 0MKI+2noO14UQ==
Message-ID: <db90b752-307c-4baa-9aea-c3fbb07e5cb3@kernel.org>
Date: Sat, 30 Nov 2024 19:28:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <8b0fefdf-0e5b-42bb-b1ee-ccdddd13856d@stanley.mountain>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <8b0fefdf-0e5b-42bb-b1ee-ccdddd13856d@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_022812_466913_A635056A 
X-CRM114-Status: UNSURE (   5.94  )
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

On 11/30/24 19:01, Dan Carpenter wrote:
> Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.
> 
> Fixes: c35a85126116 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory allocations")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Oops. My bad :)

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

Note that this patch is in Linus tree now so the Fixes tag should be:

Fixes: 945648019466 ("PCI: rockchip-ep: Refactor rockchip_pcie_ep_probe() memory
allocations")

Thanks !

-- 
Damien Le Moal
Western Digital Research

