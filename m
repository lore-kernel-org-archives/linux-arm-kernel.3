Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C644AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzGse9mKnJs4fqGvB5U+DSoz52qWSDo3NJf8dxHcs4Q=; b=DLqTimrWn/afkeljk7WxnMbP3e
	FLdLBQ1W4Q68NfExar+4TktCill7oNbeBbHkLbeardbPOjgaQnURXeYe7m5qARHrF/hXkSySfBM57
	bCqpjztlXBiC9iou08ytT8H0+0S9EMZzhcRZ0UtdoBuVrzroW4RhPW0vzJFJgA6fnq7/CpwQOMOdG
	Qwdi+GcFxxsU1I0WnsO0dtieJotHlJuoUZ00rIjZnC/YxgtY4Rzn+QfZ8echim88Gb/Gz7wfdpTJA
	12itvMi/kzGzKY2R3jh+Si6iB2hHglIQxGQfX/GgGO8diK9zmLbObb/OWdyCj5hzmplyxJbEuanlt
	Z60KLeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujK85-0000000DDw7-0p3C;
	Tue, 05 Aug 2025 16:03:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJBS-0000000D5ae-08gI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QzGse9mKnJs4fqGvB5U+DSoz52qWSDo3NJf8dxHcs4Q=; b=sVvo6Hvj7V4ADGp9E0a0mMD8s3
	iaHCb3hQZsAL7Nfr6EBzA/6nwGq/vtIkOWDlBx7sFq9xELn6wDnXECRBLwAA8SpdqUDD3IFzapIyk
	5OVFnJMviL2N8awMriUr3Rv3vNkaFgnZiQdnjrjrxbiDY1eKpHDqt4jTrYJrFRjaOM+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujJAj-003nfq-4I; Tue, 05 Aug 2025 17:01:49 +0200
Date: Tue, 5 Aug 2025 17:01:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, m-malladi@ti.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: ti: icss-iep: Fix incorrect type for return
 value in extts_enable()
Message-ID: <7140f850-dd56-4d97-90b9-9c85494dc1a3@lunn.ch>
References: <20250805142323.1949406-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805142323.1949406-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_080234_075912_8DD8A08A 
X-CRM114-Status: UNSURE (   9.07  )
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

On Tue, Aug 05, 2025 at 07:23:18AM -0700, Alok Tiwari wrote:
> The variable ret in icss_iep_extts_enable() was incorrectly declared
> as u32, while the function returns int and may return negative error
> codes. This will cause sign extension issues and incorrect error
> propagation. Update ret to be int to fix error handling.
> 
> This change corrects the declaration to avoid potential type mismatch.
> 
> Fixes: c1e0230eeaab ("net: ti: icss-iep: Add IEP driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

