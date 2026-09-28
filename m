Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B513C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tthv4QNOxOyNYtXYDtFNIpSdoxUs9R0nFoXW+8tjMSo=; b=LC+FM5dwFq4ipCUfxwaZPDkao5
	zYEhpMgyWOAiOXEGEiFq55/r4/RfFzKCbOchjZdwmLKLx+lQl/tYb3w7HsBXaTrmfkOU2eu2hLcqg
	AMLECQslMPKBsHtWffSU9jCFNNZtIObTSyM81eRze9CaLJd4h6hIcjX8RZySZZ7Lk0Yziq3hr/12K
	oRhfxUaVd/aU7yh84fdsgKdnquiIOtG3iaBJwhDkyEFsF8R4vNnw43iJqQIZLXjW78IIhTFcutRNy
	JWNO4u3sUPxIdKMCrKQxdq7b2djuVNGeUWspYr7Nz28z2GoVCOdpVAnPLcnFPUyNjVpgyxOiPJuWR
	b5yx4R+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Kv-00000000JqR-1B5l;
	Mon, 28 Sep 2026 10:11:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Ku-00000000JqI-02hT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:11:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1934A600D1;
	Mon, 28 Sep 2026 10:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EE21F000FF;
	Mon, 28 Sep 2026 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590310;
	bh=tthv4QNOxOyNYtXYDtFNIpSdoxUs9R0nFoXW+8tjMSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IwoVBfytMJ26vx7VRAjMPhHT0Ffqs9BQ2ZYP5kxEBmUKcaENGeb7zDmVhkFzibn6v
	 FGbmEXCW2QqchMYgGz+BAGy01o3uVy2GPxor17HloaNN2XR86uXtZccdGBPIwnUfKh
	 tWzlQ/+SpPqsAtvY3LPK3BzBo3StorOtd+GS3cabBU2BTMW1Jkw5oZU9nKz3SLB+tW
	 DhcMb81PbLLGB/Je4qZCirvJq/uEC5UWHsagVyNJYbIhnTHTnABuzc3xbGKE/CA+tg
	 4lEqXPf0pyEt8il2auF3DzVUOPuaecCCTLSkEFpIvyxPDc+ckY/S8tVYMSxOlIyiFt
	 bog7FN7tam35A==
Date: Mon, 28 Sep 2026 11:11:43 +0100
From: Simon Horman <horms@kernel.org>
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
Message-ID: <20260928101143.GO13925@horms.kernel.org>
References: <20260928045012.30178-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928045012.30178-1-quentin@q-lab.dev>
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

On Sun, Sep 27, 2026 at 09:50:12PM -0700, Quentin Freimanis wrote:
> When the switch uses a random base MAC address it does not mark each
> port's address as random:
> 
>   $ dmesg | grep "MAC addr"
>   sparx5-switch e00c0000.switch: MAC addr was not set, use random MAC
>   $ cat /sys/class/net/eth0/addr_assign_type
>   0
> 
> 0 is NET_ADDR_PERM, so userspace thinks this is a stable address. Fix by
> tracking the base MAC address assign type in the sparx5 struct and
> applying it to each port's netdev.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>

Reviewed-by: Simon Horman <horms@kernel.org>


