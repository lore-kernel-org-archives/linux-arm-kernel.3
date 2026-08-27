Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF86BC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou+uZZvM10YocibGfvW+Y0EZIVXwfNylKTXt7B6QMwo=; b=oDMZR4i/9wkeJtCZEMCq96Dj/F
	VtQms51vb/pPo+4PsMzIczQu2rH2iJSJGXWuXv8aj4Smo2zqX4sHoNVNy6ToZPc9CR5QLNMKMN0t+
	qtUbNk4uz7r/rofJ+tTk8LujA37YIJIuNuUxB2kgoqvQiKTRoym55hkcWBpAIMlYxJ1NQSN2m3VeZ
	rz21DewT3QjuO3uOCbH2HoWWfe0lsZ4zqbcumhY4Vt+vmL03pkff1bLpFGsrqHugyS7fo2jb5Qw/R
	j8dddfFMrZtaCuuCOslr/2Ib9LGUjfbVAPh0/oa+g8+iewwdFeNV8rlV7cu5BjnO0KM63LqyJhvL/
	fDO9DPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzP5U-00000003HHV-2qgE;
	Thu, 27 Aug 2026 01:39:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzP5S-00000003HH3-2EIe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 01:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ou+uZZvM10YocibGfvW+Y0EZIVXwfNylKTXt7B6QMwo=; b=Ad6sPjaGO7Hg6oF/G5TltzpdSJ
	iX6Li/VJDUhXX2HjPkvLrmJA4U7H7hJ/OaX+VIp+ipdt0CL6IAuU1yB2RMwUfYu4KlRh/qvZF6NUm
	gsxpK8y+uaq37hz+2/D5zz4bzmuE2pwIPQ6neKhBdCHiJcf1TUtpbNNUc5GlYdyFrvj0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzP5C-001ahP-Gm; Thu, 27 Aug 2026 03:39:10 +0200
Date: Thu, 27 Aug 2026 03:39:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: ll_temac: Return actual error from
 of_get_mac_address()
Message-ID: <1f602a6f-fc89-485f-9df5-aa6da3e756a8@lunn.ch>
References: <20260827012439.162651-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827012439.162651-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_183926_574046_225E2DB2 
X-CRM114-Status: UNSURE (   8.78  )
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

On Wed, Aug 26, 2026 at 06:24:39PM -0700, Rosen Penev wrote:
> When of_get_mac_address() fails, return the actual error code (rc)
> instead of the hardcoded -ENODEV. This preserves the original error
> information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
> and helps callers handle the failure appropriately.
> 
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

