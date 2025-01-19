Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA83C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 23:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBENx3nytvUOSb3r0/nKxwfjI7erCpAy5kDKOzDInfg=; b=hesQSq90VephsUWcHRYJjLjKiR
	Qo1DMJJrfHZc5MKFN89Amv33l1VeNO+Gdce4H+CE93DB1IVmXBPQXk46Mqfdc4fyrNk1tAdxnyQ18
	1pd+T1UnpN8hF99LN5z7QVQg3Uh+QR+VyXT/3NWIpaeXT22YeJe3kyK7kHMZzYaS8qHKaySRMAF6X
	asUU14bdEc65NR7853QX20uvwz8CEXak5AAMYUjwlNzMb7f7w5NHV3z5IHRXIQLIZtriJfNz2sCNP
	cSKUk+SVLRI2gMLELED0KlkVWGoeukRfpi0IwdAlobr7VpXVUeb6cGIrTUbPoFZgTMDNiM21sQrRd
	Z7A63CCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZedK-00000004RI8-2LRY;
	Sun, 19 Jan 2025 23:23:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZec3-00000004RD6-2twA;
	Sun, 19 Jan 2025 23:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 397205C4B43;
	Sun, 19 Jan 2025 23:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D635DC4CED6;
	Sun, 19 Jan 2025 23:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737328909;
	bh=XKGZeDhU7PiQpRL7YUAxTH2jEdoWiRxN53NNgDlLeD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h/hmYgiuG4Dav+bb3wj0XPjSalVEFtLV8aec+edtN7flfYYWSRqiCzXbyzRyjInPI
	 el5xLioyc+gr6uifqUHcrlzNQhDHSrHu++a9y624q5VT7pB188CeTwTs2eHUxddUsJ
	 tccF7vNSRqpkCTw4NBgf/OU/R3mAlDmmPWR8w/SIDRK5k1vcVWSZYRtT+xNLHh1/sh
	 vDe/WZK+ZSiug8SLRhEpiYcRkB4pcJ9uNBI2lvbLnALUud22u9Q6N5oa3+Bb3zk3SV
	 gR4xg4eKMASthk80E7JwrlBuHL5wSmp4qXaIoAR/aV7CvrPTrpbR2Ya5VBz4sTi5Xh
	 5kn5xrfcKSzLg==
Message-ID: <44d9b02c-becc-4578-ba06-d4d9fa77b493@kernel.org>
Date: Sun, 19 Jan 2025 16:21:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Content-Language: en-US
To: =?UTF-8?B?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKQ==?=
 <Shiming.Cheng@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "horms@kernel.org" <horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 =?UTF-8?B?TGVuYSBXYW5nICjnjovlqJwp?= <Lena.Wang@mediatek.com>
References: <20250103054413.31581-1-shiming.cheng@mediatek.com>
 <76edb53b44ba5f073206d70cee1839ecaabc7d2a.camel@mediatek.com>
 <8645aa77-eb46-4d87-94ce-97cd812fd69e@kernel.org>
 <5dbb7b8db7f4d31b620e5780e4716a9881252534.camel@mediatek.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <5dbb7b8db7f4d31b620e5780e4716a9881252534.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_152151_789410_886DD49F 
X-CRM114-Status: UNSURE (   5.87  )
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

On 1/13/25 8:11 PM, Shiming Cheng (成诗明) wrote:
> 
>   ip -6 -netns test1 rule add from all unreachable pri 1
>   ip -netns test1 rule add from all unreachable pri 1

The bug is in ipv4, ip_route_output_key_hash_rc():

   err = fib_lookup(net, fl4, res, 0);
   if (err) {
        res->fi = NULL;
        res->table = NULL;
        if (fl4->flowi4_oif &&
           (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)) {
...

The fib lookup should fail because of the unreachable rule, but the
output side is overlooking it for this legacy reason.

ip6_route_output_flags does not have this exception and so it is rightly
failing.


