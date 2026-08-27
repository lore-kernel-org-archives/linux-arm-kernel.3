Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF2C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoQU/6fzzXlG8e+LszOJee1lrSsQe+ACl9wBVnDv6zA=; b=3FDYACJ2mIJv9b98YC5PoN9nbO
	zxgUJvASR+mVCrCrONhNawnD5Pr9suQZkWSPgrW6ZZJyn85sUsc/+C9mMLMFFhCphXbT5T8b7g/Q3
	7AgcBX/c1JAS8uDgd5vjOgqaX1Hbim93CAOjMnVvAFkUCD5/ksnF1J8NZeeqRII4vZyeH7reK9Fus
	vFs6qFxlUzv1gue68llChi2LcBx5ICr4P8PJajqHoNwqJB1SILFITTLfRqStelPJSUYBuwmqb/I4N
	J6EvRaDJ4spMEQTe+CD6e09rriTBoigKXDuuxOa90dcTYq6kBqgV2PCFBco1l3zcUqovA4bx3FDw1
	grHMHobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzebM-00000004Zhr-3a9Y;
	Thu, 27 Aug 2026 18:13:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzebL-00000004Zh1-0TCf;
	Thu, 27 Aug 2026 18:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IoQU/6fzzXlG8e+LszOJee1lrSsQe+ACl9wBVnDv6zA=; b=dHqgXAoVmI0kVTLChoKEvm9ki1
	0+1g6Rlq4XeWS0grpmb/rQsHCvZ8r+YlQc8p6GRYvmBcnm2TrEL61m8KpvyK/KqoiEi+QkFaHLi/m
	iQckVUu4djA4uI/ZpGarA5rEe+WaZ28I5I504JZe+DSnPODMsG/fMnNZOiI3DjQWrfK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzeaz-001hnJ-8B; Thu, 27 Aug 2026 20:13:01 +0200
Date: Thu, 27 Aug 2026 20:13:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksei Sviridkin <f@lex.la>
Cc: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Vladimir Oltean <olteanv@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: dsa: mt7530: populate lpi_interfaces to
 fix EEE support
Message-ID: <55dbbbcf-f3b2-4e2d-bc3b-78fb0be4d843@lunn.ch>
References: <20260824024117.46154-1-f@lex.la>
 <20260824024117.46154-2-f@lex.la>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824024117.46154-2-f@lex.la>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_111323_148801_D6150F32 
X-CRM114-Status: GOOD (  10.28  )
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

On Mon, Aug 24, 2026 at 05:41:16AM +0300, Aleksei Sviridkin wrote:
> mt753x_phylink_get_caps() fills in lpi_capabilities and
> lpi_timer_default but never lpi_interfaces, so phylink treats the MAC
> as not supporting EEE: ethtool reports "Not supported" and
> phy_disable_eee() keeps userspace locked out. That undoes what
> commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
> switch on all boards") arranged: EEE off by default, but enableable
> with ethtool.
> 
> Copy the supported interfaces into lpi_interfaces after
> mac_port_get_caps() has populated them, and leave the speeds above
> 1 Gbps out for now: drop 2500BASE-X from the copy, drop MAC_2500FD

Blah, blah, blah.

Please assume i can read the patch and understand what it does.

The commit message is about answering the question "Why?". That you
often cannot see from the code.

    Andrew

---
pw-bot: cr

