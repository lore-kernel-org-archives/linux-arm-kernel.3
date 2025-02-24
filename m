Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E563BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QVl9iy0l5UnFA6SQ8VJ9JGtMs/TG/0zOp+vPNzgOlQ=; b=Wxesdobzj9uSdFcC+cMkYVjp0h
	9jrVTJm9cM9jVss80CSK9R/8JqgrTy1XW51ogHNFNAwAyYXFs/JW0M7SCAJIWfU3Vf9VaHw603ZqO
	sFsbOhpZBAmaqUcfJd4SubDF7kGpvfkCznqZeByP3X3h26wbVG8Fb8n7LKZpq9OEikyaVGlDdrkcI
	GgT8a+UzTf5bdJZ0SASAFpoZTetVLB4vn1Tem8zJjLBVefQ5bLGeBoXrtQmhEDUYCbOQUcEjIF69C
	B8eMz/KnjtSCeNYOUXOSM5BJSBDLXB5pqI7/STVkn58SRh+umRBUkkv557iJNEYJGmugRFznmc/Mx
	klfYrFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeeC-0000000F1mK-0geT;
	Mon, 24 Feb 2025 20:01:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeZo-0000000F115-0NCx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5QVl9iy0l5UnFA6SQ8VJ9JGtMs/TG/0zOp+vPNzgOlQ=; b=D30BMwIh5uAVK85OGIK+vv6wqa
	HwTaGh1ozXQCKfX8l9l458ZM65bqiKbHNz5MpwzSWQQQanobmjVf6lIBlEMgoZz5YK2Yo2miH7WBE
	SiZi0pbWvjnZYAetzsbfLfS0+jOkHiirImQhYhDr9BLynFUpVhBAKMC34qT+Nz7qqbG8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmeZd-00HHCL-F6; Mon, 24 Feb 2025 20:57:05 +0100
Date: Mon, 24 Feb 2025 20:57:05 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] stmmac: Replace deprecated PCI functions
Message-ID: <0cfca9c6-c2ff-49c1-8e87-51747640712e@lunn.ch>
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-6-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224135321.36603-6-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_115716_126432_8EFB86B2 
X-CRM114-Status: UNSURE (   8.93  )
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

On Mon, Feb 24, 2025 at 02:53:22PM +0100, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The PCI functions
>   - pcim_iomap_regions() and
>   - pcim_iomap_table()
> have been deprecated.
> 
> Replace them with their successor function, pcim_iomap_region().
> 
> Make variable declaration order at closeby places comply with reverse
> christmas tree order.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

