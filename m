Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA37CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojCn15B6iZ2/YRyy7xwnimgeXQIGzxn5SRtz1qisXlA=; b=Qa0wnl0EgZJeApM2X1lk3kWnH4
	02iRsyf/9Xve2PjST56RPEsp0XprYTsZbC6b3pBlAkQpFBqPcFD4CVov094cB4W+win7ibqNlJIJp
	AOnf2VFNCt8bFGW+QKO+kQI+12cyYfcsl9mhnbLQciZC+jTdVlsD1oNQN7MO5FYwRFGg7IGlbY0Ao
	uv1lkgsKSDL0pp3qfmWwvk8xWwwqT/LPpmcONhmjIWeFElr7RCuY+QzMA4edIPR88uF7xXSlY+1l1
	3JLvmfHr5r0T7G3Z2XN0NLknxTkEOQ9cYMIXYs0W+fi688SA9xsBdhmIxY51hWlJq1Lw7LnchqQB4
	u9132gkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFa-000000006hk-1uH0;
	Tue, 02 Sep 2025 13:40:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNeo-0000000GU7v-27RW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B737043B8B;
	Tue,  2 Sep 2025 09:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F102C4CEED;
	Tue,  2 Sep 2025 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806629;
	bh=IjciWVKVeDiCqwXrYhdDxhtJbkeS2xlNWZmzO33IbIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqNrc8jWPVyV+gBipGCQSvfMJQ4dMu3W/CRaEWJKoPs88vgLlkoQIVMXtrLNcBcJR
	 kIAR7aYWJtMOXiVsajs8A2k8cblBb+3vy8Oa7fBPYrIxBsv7dr8LZt1Zhrh6sf7Mkp
	 VC6Tvtrm/xwix2XnaK5nfxkBmcjMqYWlg4BaTZezqg/bmscMHS4sWG5Wrg1lGTRnvH
	 hPsTO3UMane3hrF/xiVvbjfDHYTGuBao9uzk+LyR9l5yzH5czUp4J6y17hn6H/aT92
	 ZAUOaNIHyBxeYb6ofmFxN90k6EmUrD/MEKIjiSK1nryQXPbrCmqidbqcl0Ya6Ld0Vy
	 wrTc3e23rJyDQ==
Date: Tue, 2 Sep 2025 10:50:25 +0100
From: Simon Horman <horms@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Daney <david.daney@cavium.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: thunder_bgx: decrement cleanup index before use
Message-ID: <20250902095025.GA15473@horms.kernel.org>
References: <20250901213314.48599-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901213314.48599-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_025030_559534_4478B504 
X-CRM114-Status: GOOD (  10.46  )
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

On Mon, Sep 01, 2025 at 02:33:14PM -0700, Rosen Penev wrote:
> All paths in probe that call goto defer do so before assigning phydev
> and thus it makes sense to cleanup the prior index. It also fixes a bug
> where index 0 does not get cleaned up.
> 
> Fixes: b7d3e3d3d21a ("net: thunderx: Don't leak phy device references on -EPROBE_DEFER condition.")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

As I reviewed an earlier revision (yesterday)
where this was part of another patch:

Reviewed-by: Simon Horman <horms@kernel.org>

