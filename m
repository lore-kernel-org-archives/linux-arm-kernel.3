Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4ACCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xreD27Fpmb+ZqmNwEP6ViAFZpkCnuQJup+gAGGJ9mTY=; b=jhsWW1+v2GHWxlyHmNNZrLTZ8s
	LdJU6V5uv3rDku1z5MwkFrCHpIN9j8CpzlgUnG//1VefQ4tTOPRjw5xTZqJdEvrAJnHnBMEjVLHLa
	oJHa8wFFjK9OBwuAhFW1FVYcjVSXkhJbDojHWXAslSyAD5YbM1QZap7/4yDy8hKxe1qxDMzkxWkhV
	hXAs+wikAkK5kEOGbb5RfZ7dCCYa9yaTGqbvUZBzhil3Uk6kaZNQ2pA7sgCBu2UlvPUf7ZJVn4ep4
	kt9Edvwlc8X0HR/ck61JCyHJHCMMYMvPDXtUoe27TXiBCX6BByCtTHU7AudlAFiYE+IibOtPLNLzP
	lae9y0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXNT-00000008nod-0Ws9;
	Mon, 11 Aug 2025 18:36:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUaj-00000008Dua-2CGG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83EEB4505B;
	Mon, 11 Aug 2025 15:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D95C4CEED;
	Mon, 11 Aug 2025 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754926659;
	bh=xreD27Fpmb+ZqmNwEP6ViAFZpkCnuQJup+gAGGJ9mTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Oiu9iENrS+e1XQffKABcxvqiEhWohi/qUbxG6ZtAPX1RGPlLyvFq4vT/rvK2TiuWR
	 x1gKlljxCN5FxXuqrpdWM8tjIowrLYip4heXRaIHDOD2TMPhs+i/QxsaNd9oF3LarC
	 jDQAMHY3dehZcZ7F1WEYwb0LsMAJ1D/htkO93jYCz1WUoFE7K1UqhkngyGsXNGiST9
	 j7nyMLStcWg2CQBNDCYYw8ZGCyvdgYX3hrrndQkJvTu7O0cr1cgYIOx9CdtFBC9DmG
	 +J89Eu80mTAd5ZhbnDsUkQYB1mC4GUaOb473XuKIlJzTdgTuIvg1Mjl3qifU/Pe1mL
	 Ywy59rof8eU3w==
Date: Mon, 11 Aug 2025 08:37:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "Simek, Michal"
 <michal.simek@amd.com>, "sean.anderson@linux.dev"
 <sean.anderson@linux.dev>, "Pandey, Radhey Shyam"
 <radhey.shyam.pandey@amd.com>, "horms@kernel.org" <horms@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net] net: xilinx: axienet: Increment Rx skb ring head
 pointer after BD is successfully allocated in dmaengine flow
Message-ID: <20250811083738.04bf1e31@kernel.org>
In-Reply-To: <BL3PR12MB65712291B55DD8D535BAE667C92EA@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20250805191958.412220-1-suraj.gupta2@amd.com>
	<20250808120534.0414ffd0@kernel.org>
	<BL3PR12MB65712291B55DD8D535BAE667C92EA@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083741_586076_0E8A0BD3 
X-CRM114-Status: GOOD (  14.93  )
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

On Sat, 9 Aug 2025 20:31:40 +0000 Gupta, Suraj wrote:
> > The fix itself seems incomplete. Even if we correctly skip the incremen=
t we
> > will never try to catch up with the allocations, the ring will have few=
er
> > outstanding Rx skbs until reset, right? Worst case we drop all the skbs=
 and the
> > ring will be empty, no Rx will happen until reset.
> > The shutdown path seems to be checking for skb =3D NULL so I guess it's=
 correct
> > but good to double check..
>=20
> I agree that Rx ring will have fewer outstanding skbs. But I think
> that difference won't exceed one anytime as descriptors submission
> will fail only once due to insufficient space in AXIDMA BD ring. Rest
> of the time we already will have an extra entry in AXIDMA BD ring.
> Also, invoking callback (where Rx skb ring hp is filled in
> axienet)and freeing AXIDMA BD are part of same tasklet in AXIDMA
> driver so next callback will only be called after freeing a BD. I
> tested running stress tests (Both UPD and TCP netperf). Please let me
> know your thoughts if I'm missing something.

That wasn't my reading, maybe I misinterpreted the code.

=46rom what I could tell the driver tries to give one new buffer for each
buffer completed. So it never tries to "catch up" on previously missed
allocations. IOW say we have a queue with 16 indexes, after 16 failures
(which may be spread out over time) the ring will be empty.

