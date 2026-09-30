Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F9FCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y59Absx07H4EZ/nQKHispdNoG53upukBkzFkCKkGA2Q=; b=SeSP0Xq46CnZ11xpMTyy1cqUsD
	9YGEqKTmC3vazdRFjXCyeJvllI3WlFhxVKo8zjnljDSceTDaMEfA6UXdOf+Sb1PO0tvEKn2jFx6Q+
	XCZSy+RYx9juKBc/Fkc0FxBzyFhEseH7ikV9kIXABIkBSr8VYq0tR1yuB5kfDKWSquIj7cK9C8+we
	CM8Y7T5mrhXNRXBFPWGhojIvXLMy1QVgt+Bnicxf9iUOX5d4CIYz/Pq7XnlBEXLbEjvFQFwd97DNP
	UzmPf2CH1YHo4qAL0AxH6Dwtr/eTa1QnONhAotkQKnJfegC8KNyq43K8Hl7XZLXrK0vOqUF/p1d0b
	U9cFElPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtsT-000000064OO-22Jy;
	Wed, 30 Sep 2026 12:57:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtsS-000000064OG-1bKs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 12:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y59Absx07H4EZ/nQKHispdNoG53upukBkzFkCKkGA2Q=; b=CifAc+PYscNXZeMGhiwDe493PJ
	M87Nt/dieBDVWdUmgGLV2I/bm3HWnBohK+n9iLEIFb9Q6DpW2WIdYzQ4ivY3wHms1H8VE8Pfp4lgL
	LlVdcXDBII3grqJvBpE7eGrRPfx5MasdqlySRxF4iNkB1lngj+uFZPIAx0MQc8wKTNwKDyglCOZR4
	CmbLGPuImyR4d5WhF59XkTSGXyTDP3Zf/QqNGjTQUoxtmx3sOYs3pOkdtiVsw+AbKwshL37CJJEkH
	NvJoF0wa77wYzbFye99OsP0YNYg8wrTJznmTvSo++/JKXd0oApdBhtsF7k4kad+Tlb5e2LkKBZ/QX
	VHoHJUjg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBtsP-00000003oj4-0C1W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=y59Absx07H4EZ/nQKHispdNoG53upukBkzFkCKkGA2Q=; b=VnzVJWLZ/Rnno0pCk4lbV/8+ey
	vMc/4hbp/byS9OTIgoxzyXVrxR/jvcxeIYbRCdNBlogryIBkeNOnPFrbQTPkz/r9D8GMRcqpKhTmT
	AfQl6r7yIzzaGtSULdhRWRdtSkTIzxat3MVIV5WU1FaWnRN8bX9lvpWWi+lckwJZUQD0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBts4-0089rC-R7; Wed, 30 Sep 2026 14:57:16 +0200
Date: Wed, 30 Sep 2026 14:57:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Meghana Malladi <m-malladi@ti.com>
Cc: elfring@users.sourceforge.net, haokexin@gmail.com,
	vadim.fedorenko@linux.dev, jacob.e.keller@intel.com,
	pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	danishanwar@ti.com
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix switch mode for offload
 and non-offload cases
Message-ID: <a2517fd1-3e22-4483-839d-4aa5d9f5f995@lunn.ch>
References: <20260930124356.3083743-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930124356.3083743-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_135737_192969_E1F2D4D0 
X-CRM114-Status: GOOD (  12.12  )
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

On Wed, Sep 30, 2026 at 06:13:56PM +0530, Meghana Malladi wrote:
> Non-offloaded switch mode is failing to forward packets. Following fixes
> ensure smooth operation of switch mode in both offload and non-offload cases:
> 
> - Fix NULL dereference in icssg_enable_fw_offload() when second emac
>   slot is uninitialized during first port open
> - Set port_vlan on both emacs when bridge is formed; previously only
>   the second port was set, causing TX stalls in switch offload mode
> - Track UC/MC flooding state and restore it after firmware restart in
>   non-offload bridge mode; restart cleared IFF_PROMISC-driven flooding,
>   breaking unicast forwarding across bridge ports
> - Defer emac_adjust_link() to after prueth_emac_start() so R30 FORWARD
>   commands don't time out with PRU not running, leaving stale R30 values
>   that caused prueth_emac_restart() to fail in non-offload bridge mode

A bullet point list in the commit message suggests there should be a
patch series of patches, not one patch. You want small, obviously
correct patches with good commit messages.


    Andrew

---
pw-bot: cr

