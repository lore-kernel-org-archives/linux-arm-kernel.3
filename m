Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA049CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cVW14CxuHH6XMS02s4qPCeAXwNI63im2JshZ0C4ctU=; b=kumBFEU/5hIWTewLmR4EaMsT4S
	7pnzg4UxsOmZptyl5lp54O7SVowW4JFl+NsPzPATWjAUW83iw02nWKk7YOCjpgHyBq/GX/sl+VfHI
	7r2gllP34wuoBGRe5MPdyztuAU1CLAU89ZskmFpPoUs/JjmDQZqVr0SKkMERZHXTQUBG/FlwLjhMN
	RWQoq4hRIZJ7hyJG8nkSXUnR2oVAomVoxN5I9WTOejE76omMRG+w2tXaBcnFLfFEaIPBbLQXarjNa
	MrdbRoHHyfc4Q168PV9+er2XpusAiIVTnsIQU6I5j++EfZsDuUQrsiEYoNJz5CpLNXP/HYgCNgYVY
	LWZ2yl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq0B-00000004sUI-3Bno;
	Tue, 09 Jun 2026 06:31:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq09-00000004sTv-2zZP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:31:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 275F44422F;
	Tue,  9 Jun 2026 06:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C2D1F00899;
	Tue,  9 Jun 2026 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780986713;
	bh=9cVW14CxuHH6XMS02s4qPCeAXwNI63im2JshZ0C4ctU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=I36rCwizpJSZyKVIsZkBmdlWaFimb33Sof3TGcXA9WlVvdRP6gToOWZdvXukJ9jL+
	 5SVEMKWrYVmGTxMjBMMczCYBVlQlb0ljjMetAnAaBddkldG5g1DeFiTNvt/h+apXMG
	 yeBE+dfYKQMSqRajbRyU/vDR9Dypo2rTY7QIlHedCvqph5jJnbHD8LoLdC0QM0IHja
	 4/xfhdmId/CoFv4tmlFVaaFRcF1ObRKOA9VPciyAhsYEUi7RcPgz9JlUfuA32+hg5x
	 bIz1OGlgeHzDU3z+ZzoMR9AQkpypPfB6pBougvko2H3eBSCSH37l4EWGY7GrqDAWN+
	 acs82JagAzwaQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35BCEF40075;
	Tue,  9 Jun 2026 02:31:51 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 02:31:51 -0400
X-ME-Sender: <xms:V7MnapoRZE115mv3OE1zemucjsva6zjZtD5d3LsnPgo655T0S1_hOw>
    <xme:V7Mnameu8nxCzvSST9MMvGJscv5vZhpBAdbcMmboEfheSYhr55P0vRBiJ0xjWN4Wb
    SxlxanxBk8mUaIbIG7n7TYC69uxcjn-LY5Jbu_tl1eHxWiSk2V7yw>
X-ME-Proxy-Cause: dmFkZTFT0QeOWg6z5S4Eyrduc7ntI2XZ8ybouC2z/7kLY4pY3mTLgtkacitZwNL0VP8Z+4
    i4UPqGOWioNbD8PElNjGgAiflyJ41PIsAAy+dD3ap/EH+TIAFzLxd+eA15lYonXwFjoOXm
    AKsU7Rq+u5U3jQ88y9qztBhSwCBkMRpJPnBR1JdzCnxPqezwVJAo/ivpK09iFH3/nF6WJo
    YO4ZqSmOgzUBstd3L/zqENBtA9r9ayIfL0J65bWVdVShBuwriyuFMEK/DNuMYYCR4QHL0P
    69x8Jv4sWE89NJ6Y2jLFRTyobPkf+u9dagvkxQrWTh7cFlpWSLv+eOEi7AbetLf87SYZaQ
    wEdjX5HLugz4TrS6h5hEFzg3wvewAiBqfJB1VhgirTBJK7Z5+mi4t/WhE42TBtP1+u3Ft9
    BEGoJTCVdWezAbERphPOMzN7Xs6Ww/JJqfJ2iG4yB2ymnmk6z5cXgyCU/l8ZmXDejy1iux
    nxIGX8vKp8sx5VhXOhGykeqMiho9sWDJe5REpSnNTRAAVVWR6IFKTbYhEozF1pJqJh6KXa
    uRhNRa0XsAfrFUH1snAI+NgurLh9E85q0b0eeeluRqIMM1dRoLf5asDBnpVwciTtgxGueD
    sp0lAJe9rKMlnCbk1Z4+Ym9JonWancXM30q7gcQtuJoJnqqguwszhcyU5F2Q
X-ME-Proxy: <xmx:V7Mnarble0pwjkE_7YhgAahliXMbQH-zJV-FMhh0Vo225d_uaGzbaQ>
    <xmx:V7MnavbvD-WJixjTpRNbVUmFMt3WUdWknFu_5_hMnuncD3ThvB-dnQ>
    <xmx:V7Mnau32lH_vp-FfGhx90w1SaqphVHzCJxm3a0ywDm83jsotvCPYEw>
    <xmx:V7MnanZUgCXHNAw5zTNMLkS1bpPFe_ckgiLJju_yL5znmAF7kWdFCA>
    <xmx:V7MnajlRhooJNXLU6ZdPb7qf28Zq9usC6xacsV83k3tEqjwUaKa6cEjU>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E00F182007E; Tue,  9 Jun 2026 02:31:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 08:31:30 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Liz Prucka" <lizprucka@google.com>,
 "Seth Jenkins" <sethjenkins@google.com>, "Kees Cook" <kees@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>, "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Jann Horn" <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <12e57bd2-5eb3-4de0-bec7-b46b58935977@app.fastmail.com>
In-Reply-To: <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-32-ardb+git@google.com>
 <a1b27e97-182c-485d-a448-56c19c5de2c2@samsung.com>
 <CGME20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0@eucas1p1.samsung.com>
 <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
Subject: Re: [PATCH v7 15/15] arm64: mm: Unmap kernel data/bss entirely from the linear
 map
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Tue, 9 Jun 2026, at 08:28, Marek Szyprowski wrote:
> On 09.06.2026 08:22, Marek Szyprowski wrote:
>> On 29.05.2026 17:02, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The linear aliases of the kernel text and rodata are also mapped
>>> read-only in the linear map. Given that the contents of these regions
>>> are mostly identical to the version in the loadable image, mapping t=
hem
>>> read-only and leaving their contents visible is a reasonable hardeni=
ng
>>> measure.
>>>
>>> Data and bss, however, are now also mapped read-only but the content=
s of
>>> these regions are more likely to contain data that we'd rather not l=
eak.
>>> So let's unmap these entirely in the linear map when the kernel is
>>> running normally.
>>>
>>> When going into hibernation or waking up from it, these regions need=
 to
>>> be mapped, so map the region initially, and toggle the valid bit so
>>> map/unmap the region as needed.
>>>
>>> Doing so is required because pages covering the kernel image are mar=
ked
>>> as PageReserved, and therefore disregarded for snapshotting by the
>>> hibernate logic unless they are mapped.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> This commit landed in yesterday's linux-next as commit 63e0b6a5b693
>> ("arm64: mm: Unmap kernel data/bss entirely from the linear map").
>> In my tests I found that it breaks booting of RaspberryPi3 and
>> RaspberryPi4 boards with the following kernel panic:
> One more comment - reverting=C2=A063e0b6a5b693 and 53205d56212c (depen=
dent
> change) on top of next-20260608 fixes this issue.
>

Thanks for the report, and for the confirmation that those reverts fix
the issue - this was reported here as well:

https://lore.kernel.org/all/aicVyebkEMs6w6UV@sirena.co.uk/


