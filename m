Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF77C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGi1rwym2I6sBWfNVUXqZVoYxgVmoGLVRkUZgtYr+sg=; b=TE8h1ig6uXQwT1uZ/OtjP5Qt4a
	QvhQhIXZUS/MFpjhJIgcpIh2xPj28+WhxJ+Zj9V5nqiPzUOUUBCP36kz4q5331HAJJw76IBtQD7Tl
	k/o3Vmz8DHEfqleJvpzPteqErNdns0Q8pqEoSzODQls44qS1YDKytBiNvmFz2hh6JL0G4wXB51OKR
	hXp1ePsZdQ+FWqL/xoe3OeLrEaDmXHbw9d/cF5gofMCIgnLloiy8NAtnerB4/Ya7HQvxSEQ/R25SV
	R0Mkd7b9CpWZBo3GrvgEibYMfEmJ1OvVi4BngCy8fxtqhVgWGq/h1fIvp4xId1SK+TOZdDbzw+qjw
	WQGH+9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJp6-0000000CO6e-2kxs;
	Thu, 06 Mar 2025 22:36:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJnT-0000000CNr1-3Z52
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BBC5A45224;
	Thu,  6 Mar 2025 22:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47383C4CEE0;
	Thu,  6 Mar 2025 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300468;
	bh=jnmEI0O48dE/8nutBn2HVLhExmXei9Y4n/ey1QBf6Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pEzHs+VrlHLMd6zr1qi15LpNpPfR1LabvhCacarSCskvDHYep7dWk3zsDEMunufkk
	 lC/TV9815LsESFjZhqaQfBqnK+8KGbWmLDZqL7o6o7NUqwcE+g4uoX163PY+O9ECkM
	 sg8/P832YOFgKaN0v9ynHgTO42xYgjDEiL7UnbTTpImtLts114YI5AZDk47h0ebGgd
	 2+eZfUNhELiIsxjp5Qbjm2pg0cHcWt6AFs6hZbRskG+4LJPXpZ1HOBwJv/lahbIC/0
	 EVq4FOQjmnV65GO93QN3IeWVN0KjvLkNO+KVOTHb6b6G4E4sXJm9izqq8wXiNwHLfn
	 5aoBXxnE38T5A==
Date: Thu, 6 Mar 2025 14:34:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 06/13] net: enetc: add RSS support for
 i.MX95 ENETC PF
Message-ID: <20250306143427.2bf83572@kernel.org>
In-Reply-To: <20250304072201.1332603-7-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-7-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_143431_979412_76720500 
X-CRM114-Status: GOOD (  12.68  )
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

On Tue,  4 Mar 2025 15:21:54 +0800 Wei Fang wrote:
> Add Receive side scaling (RSS) support for i.MX95 ENETC PF to improve
> the network performance and balance the CPU loading. The main changes
> are as follows.
> 
> 1. Since i.MX95 ENETC (v4) use NTMP 2.0 to manage the RSS table, which
> is different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> 2. Since the offset of the RSS key registers of i.MX95 ENETC is also
> different from that of LS1028A, so add enetc_get_rss_key_base() to get
> the base offset for the different chips, so that enetc_set_rss_key()
> and enetc_get_rss_key() can be reused for this trivial.

Please split this patch into refactoring of existing code and new
additions.

