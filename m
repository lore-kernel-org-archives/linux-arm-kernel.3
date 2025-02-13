Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5445EC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRi2by4hF7BVnwNBoTgAL9CtmnTqhyTscqUsWMsbLkE=; b=eZkfnjfAG1mYwMdmfBBfuqphwk
	WCW8GWixRiPBVlAssqMmsGQu/2Jg6GlA7GFExtbb1OYMI4yspcw9W7Hb0uRrxvSy5XolYMl2Y+9Hz
	nzdcyVjN/bFFCBRIB9D+PdGYIjgiQOU1vj7yb4J8u+LKwAlgenbAlSrpcvr0bKuXxA1ZAEkxJUGqX
	BTand8NgqljNA+o9wgzDYNnCS9upfrEYSUJM7gp8LBZT1eQnVlerFLLSL9/slxb0USrDuLL6UK6ET
	1/pPyAEI47xaie6HVyvqMA68Ve4SfI42Pgw9p6f5HZxrvKX9rEvCPQAn1BvDHhG/hfkLkakk6eayc
	7OfLus8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXxo-0000000Ax59-1aZs;
	Thu, 13 Feb 2025 12:05:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXuh-0000000AwW9-3HTh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:01:53 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739448108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRi2by4hF7BVnwNBoTgAL9CtmnTqhyTscqUsWMsbLkE=;
	b=gFnFW5UrQOTpQ94swvZhMjxhGMXUmdllUKHeuFDQK0Iv3lEv7WPpWaXIeU5VL+qcOcmSEn
	kGMFK7iK7mxHYqifI8t7JJaghZu2pWmuNoQZl0H/sS7hc2aAzfJY6uTiz/VUKKb7ufyDvV
	GekiQzi55/iKXCpEU4TxkCFiALIeyIQPOqcDMIikhz9AHKLpm+BCrMkwt7jpDMpW6HskPB
	hTRniWF9zZf9BG1JpYfgOZs2UR+ANvzHYViC0g9vGZOrDUFkZONfFBHYpZxzRzJbGw8yny
	M+2fk9vdaXEG3xtJ/5zxxLJkdMMQyeOe1ee5wJ8rxGbSPv4p9zhZC5qrn+aYNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739448108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pRi2by4hF7BVnwNBoTgAL9CtmnTqhyTscqUsWMsbLkE=;
	b=9+v/6FZN9iYWg8vy7Kso1fLjYJd3UKBNQLlk/DBk8uSIJsOASKi30BUOPU3IuSdJHsDXLY
	ZN2gspy0UDfIpSBw==
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Kory Maincent <kory.maincent@bootlin.com>, Gal
 Pressman <gal@nvidia.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
In-Reply-To: <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
Date: Thu, 13 Feb 2025 13:01:46 +0100
Message-ID: <87cyfmnjdh.fsf@kurt.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_040152_099453_48CB4081 
X-CRM114-Status: GOOD (  15.07  )
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

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu Feb 13 2025, Abdul Rahim, Faizal wrote:
> On 13/2/2025 6:01 am, Vladimir Oltean wrote:
>> On Mon, Feb 10, 2025 at 02:01:58AM -0500, Faizal Rahim wrote:
>>> Introduces support for the FPE feature in the IGC driver.
>>>
>>> The patches aligns with the upstream FPE API:
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.115=
6614-1-vladimir.oltean@nxp.com/
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.730=
54-1-vladimir.oltean@nxp.com/
>>>
>>> It builds upon earlier work:
>>> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.109=
8888-1-vinicius.gomes@intel.com/
>>>
>>> The patch series adds the following functionalities to the IGC driver:
>>> a) Configure FPE using `ethtool --set-mm`.
>>> b) Display FPE settings via `ethtool --show-mm`.
>>> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
>>> e) Enable preemptible/express queue with `fp`:
>>>     tc qdisc add ... root taprio \
>>>     fp E E P P
>>=20
>> Any reason why you are only enabling the preemptible traffic classes
>> with taprio, and not with mqprio as well? I see there will have to be
>> some work harmonizing igc's existing understanding of ring priorities
>> with what Kurt did in 9f3297511dae ("igc: Add MQPRIO offload support"),
>> and I was kind of expecting to see a proposal for that as part of this.
>>
>
> I was planning to enable fpe + mqprio separately since it requires extra=
=20
> effort to explore mqprio with preemptible rings, ring priorities, and=20
> testing to ensure it works properly and there are no regressions.

Well, my idea was to move the current mqprio offload implementation from
legacy TSN Tx mode to the normal TSN Tx mode. Then, taprio and mqprio
can share the same code (with or without fpe). I have a draft patch
ready for that. What do you think about it?

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmet3yoTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgvLKD/9OQPyBrZSv022P25tXUsH7EuBaRKfA
aeLF85hUvtWB9bw1NihFYJsALhL8ouo+CTO9pvlnFlsgtgiB14KLrjShhefXZfTI
Prjpei01Kyb2te+XqjCBmnrz5DriDwUQjDVSxd8WlfuFhm/FquQCp3fATF083LBZ
T7fIsaLnoehBkUj5oMTgFu9EGRD+Pdnq9pQT94pHVPfSc1azLAU8LXzsXqOuCelK
VkM40CJm5hZwRAQz+rl2C6ji7qAukJ7tof61Cj6c6i7jTZAvbZ52QOUlubYNUNsL
yh4fGcYxLIJDp6yZz05Nf3KuEISjRcpxlEQxZF9vcfgSFa8cgwAZdnFdAnG9RH5F
BnO6hhrtoqi9jmDjQbnnROdxeK1zELqhRNmWe7aa6USiiziLg6OHVKBeB9gGQ0B6
F5XuwQjdfb96Mewy4S67FxwN0Ze53X7cqmUfk5WLESArCxrN2LMTuwOCsfYbBgpc
NXeqyFzLrHtvb7nMZkONVsXSAYDqsQ+Q3Ms9DLOUh5+jvn9c8XPEJkNNoG0sQznS
HSGN81QFGjkDACF/D7eiWrA7e6NoJoPMOdeyruHj2ejkZH+0FFA+p7qrWvwytOEx
rT4GG3JqWLcEs/W/1KZbNf7yioJf+kPIxbS7TxBxy+W+dy8DhDA6cJNEspn6uhqw
mbELAM6QhMYsxg==
=HZMH
-----END PGP SIGNATURE-----
--=-=-=--

