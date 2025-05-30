Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA5CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8QPO6Ef1FQ5IIXSBD6+Fdg7tVKaYzmd0kVEhLTxmWk=; b=t6eXWWhLuPrUwANeSQjqgJkPWG
	dHPctAMscIJsu0t3FQeIEZcfMC0XgZofp/isRuGUx9+dOux59WwWMBiHIAQNEYk2kxcqWEHd9bfrY
	ZZ8KKd4yVxtF1YbX/E9FMtHzGSAhj95Omb65EGJYFFHL4NXrLFT3ae17Se+xYa02zPCxwN7GpRsGV
	xw4Dvx+CYo1L0hdZ/neydn585ccaW1OeGVJmPlz8u5cDwCZuMMJC1vpZ0dzABlgR62fMoxWnjQpCY
	zAliVDwdsPdgTAHSGlohAATCTXwbg2G28WC77wVd66kZmmk9syDiPbkGs1JlGXJWnzZDfsruG4Vkr
	rTVAzYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL4Ac-00000001UTz-3ima;
	Fri, 30 May 2025 18:09:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL47u-00000001UDD-3f9p;
	Fri, 30 May 2025 18:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3A16629C1;
	Fri, 30 May 2025 18:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B016BC4CEE9;
	Fri, 30 May 2025 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748628401;
	bh=t9lFh+oAmPOl6ZvE6QL+On8ZD++9uCDEr437mOmG80I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrszsRdlThRSA3XyFYc1ail8rRNTabDt5j2soWnh75hkIKMZofrTXD1mPXkxFKuUD
	 3bT88hyWWsBT/Hr/RmZM7hT31aJcOdCO+DwwTNqnVWiRWlW86v94dc4UYhafetUEWT
	 rD0Xg/ZiAmmQ00YOcMv+lpMALwfnlFJCUYCHK/py1LCpsrk8F9HAaiLqHBb23c5Xud
	 UBsTBjVPTh9mfuZczJfND/wUCgOPIdB/bKFey8R3G5wVTnTt1f7CSBUMTge90HskM+
	 eKcqhFRu2Mcrshb3L6nW9X0zCB8XnIwyhDGVLHhmXwool8NEhnurcDIq+tOchKd4Qy
	 ZxVzPTHywWWhg==
Date: Fri, 30 May 2025 19:06:37 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: airoha: Fix IPv6 hw acceleration in bridge
 mode
Message-ID: <20250530180637.GR1484967@horms.kernel.org>
References: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
 <20250529-airoha-flowtable-ipv6-fix-v1-2-7c7e53ae0854@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-airoha-flowtable-ipv6-fix-v1-2-7c7e53ae0854@kernel.org>
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

On Thu, May 29, 2025 at 05:52:38PM +0200, Lorenzo Bianconi wrote:
> ib2 and airoha_foe_mac_info_common have not the same offsets in
> airoha_foe_bridge and airoha_foe_ipv6 structures. Fix IPv6 hw
> acceleration in bridge mode resolving ib2 and airoha_foe_mac_info_common
> overwrite in airoha_ppe_foe_commit_subflow_entry routine.

I'd lean towards splitting this into two patches. One to address the issue
described above, and one to address the issue described below.

> Moreover, set
> AIROHA_FOE_MAC_SMAC_ID to 0xf in airoha_ppe_foe_commit_subflow_entry()
> to configure the PPE module to keep original source mac address of the
> bridged packets.
> 
> Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

