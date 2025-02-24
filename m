Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39171C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Mwr7TfmtvtGkeIg/OdtZgFGQqTQ12adcCYV8UQPq8g=; b=QtLP2tp43bZtir6f0mpXEdEbE2
	T6kx/iepPpQ8uW9E+360xaknrvLnJbtJj3nJ7+l9pPMPMrI0LWXBYvWczsuHpz0jA6xd4VZYCxfmO
	l0beR0XOijcALQAuMtsLait43ERPxzJZpPRLNstXSYF7MGKc+Tq2BkPwM5IzV+u/KW9EQ9yh9VG0t
	oglN1MmAFLcNJ6Uze15c0lOUSM39VMWvIklioKtkbjRHW4c+k6XAobEXA14w5tw4O6aAUzIkgNNyA
	mZtCUUlD4JFTcGQAkvFC677yS23QNvMnEv+2+PDTsyiuXXU4OfduFcTB9zntDP8D9kJYER2sktb4O
	6ArRnPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeZo-0000000F11I-3Jfq;
	Mon, 24 Feb 2025 19:57:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeYK-0000000F0jA-1CXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4Mwr7TfmtvtGkeIg/OdtZgFGQqTQ12adcCYV8UQPq8g=; b=gEjurNuAgfuQye+FsI4vU6rM2N
	9AdM3VBog3sTJEHcgG5CWFpg+zpj/6SwMt8gJunu66xNDXiiFWXHatKYf0UBgBxgXCeQyW00wvfwj
	2XvP0FWjv6v3dU7JU2bOk/plj+gYwwbpw3sa4NjKGMOHzbVVrKS08DSdmCSgymDFjxiw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmeXv-00HH6h-TM; Mon, 24 Feb 2025 20:55:19 +0100
Date: Mon, 24 Feb 2025 20:55:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Philipp Stanner <pstanner@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Qing Zhang <zhangqing@loongson.cn>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/4] stmmac: loongson: Pass correct arg to
 PCI function
Message-ID: <46a6a816-eed2-48ce-a483-fc6b31ad7b32@lunn.ch>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-3-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224135321.36603-3-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_115544_323478_2B3D794B 
X-CRM114-Status: UNSURE (   8.82  )
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

On Mon, Feb 24, 2025 at 02:53:19PM +0100, Philipp Stanner wrote:
> pcim_iomap_regions() should receive the driver's name as its third
> parameter, not the PCI device's name.
> 
> Define the driver name with a macro and use it at the appropriate
> places, including pcim_iomap_regions().
> 
> Cc: stable@vger.kernel.org # v5.14+
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

