Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA75C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 00:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duQ86+wN0ZS4fzoMXgzUx9KzRhQyssWsDaclYlPUpRg=; b=k6CdoKlrUn7a179eRVqbKCTVJd
	O91EWKjtP8O9kr8EXsvH/x+tgt0+3x10c3ikE+xqNjwlCWyL5uW7iAMDpFKZKvepleZrOVAwUkNpX
	5ZGK0JRfLs/KXebXMLBvoYawVLA/VLVsaNae4koafyawKSr3rPK3jU8AoRZ1BQvxt2WZa6Mx3A1+v
	3vuR++7ocP3+ladVTrrDuw5jPbIGCQ9C+PPteciCz8F/COWRjNbB/ML/QR6FDjBze39K1PSqjbFIF
	TaHWsFkAhGBseBpRFIBQxO22fK3iPp+LJ5dhMejRBONwA/G5x97Xw23xEhyCR/xjWjuhc0LSEk6lN
	XZN1xHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvhz-0000000EuMV-00VI;
	Sun, 23 Aug 2026 00:05:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxvhv-0000000EuM8-48am
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 00:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=duQ86+wN0ZS4fzoMXgzUx9KzRhQyssWsDaclYlPUpRg=; b=fafGSauAonvof8yzK+PfRPxCN7
	YAoQpzFb2TPH/99SJVAYegTh8AciPFU7sQlkD5Hm/MazIZtYxT7sInNSJhBG3qqrsdSSiUetrxm7b
	hVN7DbboS7lqn3RHr2t1u9iZjgC5iEk8tFD/NHuqqSMoB7yogBXniYb3+tGifjUI11oc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxvha-0015GQ-4A; Sun, 23 Aug 2026 02:04:42 +0200
Date: Sun, 23 Aug 2026 02:04:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, shuah@kernel.org,
	joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Message-ID: <d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_170504_032223_5335282A 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri, Aug 21, 2026 at 05:09:59PM +0000, Ovidiu Panait wrote:
> Add a test that validates ping traffic over VLAN interfaces. It aims
> to catch drivers which mishandle hardware VLAN tag stripping, in
> particular QinQ.
> 
> Three VLAN configurations are covered, each with hardware VLAN stripping
> enabled and disabled:
> - a single 802.1q VLAN interface
> - a single 802.1ad VLAN interface
> - an 802.1q VLAN stacked on top of an 802.1ad interface
> 
> NETIF=end1 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
> REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
> run_kselftest.sh -t drivers/net:vlan.py
>   TAP version 13
>   1..1
>   # timeout set to 360
>   # selftests: drivers/net: vlan.py
>   # # Interface: end0, driver: st_gmac
>   # TAP version 13
>   # 1..6
>   # ok 1 vlan.test.8021q_hw
>   # ok 2 vlan.test.8021q_sw
>   # ok 3 vlan.test.8021ad_hw
>   # ok 4 vlan.test.8021ad_sw
>   # ok 5 vlan.test.qinq_hw
>   # ok 6 vlan.test.qinq_sw
>   # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})


+        if current[name]["active"] != state:
+            no_change = False
+            if current[name]["fixed"]:
+                raise KsftXfailEx(f"Device does not support {name}")

I'm not too familiar with the self test framework, so i could have
this wrong.

It looks to me like you fail the text if it is fixed. But does not
fixed just mean the hardware does not support it? So i think it should
actually skip the test?

Now, if it does not say fixed, but ethtool -K reports EOPNOTSUPP, that
would be an error.

Having said that, thanks for spending the time to add a test. We need
more tests like this.

     Andrew

