Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJZTQ2SY6vcVQkibydt8riYRRhAOudyW7VtRh27AZQo=; b=QrWH8HYAT9mAiAmp49D79gNMHp
	KQCCoQrmgOa9cw3u6ALhugt3SGykqPUW5dybo9J0gfMgkZW8kqySiB5pPJXhdKqx4X14t9wKy0qoF
	0HA4VTcptwKRi79mCRWt9AS/UGQ/xTGIeSfVOzMECujFMWOV9N+NoZcCgFKpWiP3WusBMlCR/LA6B
	065dLzW4+H4rLSoNWv5cz6ARbzPERt/h5ifRVrtYa3pYGBrHVmf5saiaUbHPtZJQ2sdvBTd29/LXU
	jxmjEXXKbIyi6EQfc2YP+ASY3SCn0cDg4U9GMl8OlhK3zMYtYsBxve/k+85m5DDSPON1oBK96Q1/c
	/J2j093A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HOE-0000000EOEh-2VjU;
	Fri, 11 Apr 2025 16:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HMP-0000000ENxR-0jS4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 16:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC6BF44040;
	Fri, 11 Apr 2025 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABFAC4CEE2;
	Fri, 11 Apr 2025 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744389368;
	bh=57EeinT2kFyZ3eosPEp0yhJlIy364+wh69p+Prj2EKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDmjxAYm5b0bmRinJ1+KmL15n0Aam/EUskqODzz2KdMFYiIuv0uVDY5Mu2t9noqE9
	 Oz/0e5o4SdRpqsDjyGz0uZ9ncVaF5qQQ0PcZkVGvnVO/UFtVJTdfGTe6+pNof/ALH1
	 vFA1+tNU+0Okw+44X1B/4ZEkpQnhJ/w2s68uW0ilKH/wcuXO5Zzoq6zxhkDzVddFSm
	 MFLNuKGgYkIk3WzvYTVq+pfdW7GTW383TmwrMFG82Lty99Durco3wZsF2W42lT2K4+
	 y46BsEwtef8lwu3gCyXR9+MWwa4UNMZWYZpXazsDBp1z97rGGSWgKaTPji/uk3/ag9
	 x3+U+4W3giOhQ==
Date: Fri, 11 Apr 2025 17:36:02 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN implementation
Message-ID: <20250411163602.GM395307@horms.kernel.org>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408081354.25881-2-boon.khai.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_093609_248607_7B5AC8E1 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, Apr 08, 2025 at 04:13:53PM +0800, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c

...

> @@ -965,45 +807,6 @@ static void dwmac4_set_mac_loopback(void __iomem *ioaddr, bool enable)
>  	writel(value, ioaddr + GMAC_CONFIG);
>  }
>  
> -static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				    u16 perfect_match, bool is_double)

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index a6d395c6bacd..d9f41c047e5e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -614,76 +614,6 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
>  	return 0;
>  }
>  
> -static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				      u16 perfect_match, bool is_double)

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

...

> +static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
> +			     __le16 perfect_match, bool is_double)

...

Hi,

The signature of this new function does not appear to match that of the
functions it replaces. And it appears to regress the endian annotation of
perfect_match which was corrected in commit e9dbebae2e3c ("net: stmmac:
Correct byte order of perfect_match")

Flagged by Sparse.

