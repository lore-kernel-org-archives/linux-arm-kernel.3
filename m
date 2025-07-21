Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FFFC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMKNAupfMStz/V14NuXYIcF11MwYemPMaLcl28atUqQ=; b=ppGtwLYl0spXhmkmul9v6xY9r6
	lPfTxKLLtz/9hQbipR6lD5szSx9lkE2spjcvbEpBsjMNd9SpAHyqta3iESFJd242CjTkjT8W1Z66K
	rVcUgjNkdui0GXl5fU5BaZ4a8BspR8+KPOKfrsGSIlLacMPvFjv7gZvmTHFmDGG7/CV2Wm/VaPPRq
	mNgF5Uxwud7wC3GPGKS7qwfKIn4J9L41QOtCeGAuMTLKDOpM5ACR0weWQHGh/0ozgUTfUOBrmDVOx
	5rLjpevjJ7pg3TV5MTMwFSvnEEYzLvLjxVwgTWx34xMTbREKR9gOXJlnRUowony+mVaKuSiOdM5+6
	lvLnki/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbK-00000000CDY-14qB;
	Mon, 21 Jul 2025 16:42:54 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrYq-0000000HXbv-0J4c;
	Mon, 21 Jul 2025 14:32:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 4693F1D001C8;
	Mon, 21 Jul 2025 10:32:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 10:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753108328;
	 x=1753194728; bh=gMKNAupfMStz/V14NuXYIcF11MwYemPMaLcl28atUqQ=; b=
	D8gMn+UkuxGqmrnLQ8bKSYVeDWgcBIbWu6AQ3cAH8vk5ZZeoHYrQ2Pcez4NqUHyW
	keGowtEEmy/h+fGLJZB7U6oVrgjYq4j1f90Hdeg58Wiv6yS2D6kfWQR3hbjNyW9/
	SOWX53LBxhRhVUKVg3WsWwIOLj1L88dvT1nEN9eL+P+V4MYg8716mIUz4JjH6Zj2
	6zJtMfcWOd7afHBeYULRaqT0HZXAfe77NiqSKoFcrUffoGAgHuMXY4J5EOxDzrl+
	powGW0OTCDyRnzj4F20Rrq6QwrfkMFeYb35nwSMM/TVEBfXUXBSdu+/TbJCUnZvb
	duE8X8xA/x1gs6j7xq/5bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753108328; x=
	1753194728; bh=gMKNAupfMStz/V14NuXYIcF11MwYemPMaLcl28atUqQ=; b=d
	qpzkqFJ4nN223b4dzhJW/uWLduEPQJOVtqauWsi6LMG3z18YOFf8da+Thgqs6hpP
	H4TwLWJ1qt8hspX7c7MG/Nq9CK5v9ST1pElq2fjgAiXEWCoyWaF9u475yxVKcam5
	EtK9YvcUBVRKpYtVeojHMWOM/5kpxMRqq5kGAhyzc/+1A3Farq5qOE1Atz1uwEmW
	WOcKHUuf1AweS5eB/w7QDllMGUa3GnhG+rmsqYMZLT/eoR65aPpKzCdATaQxJ/6n
	lUkyXAG8tF4ePsMx+rDOVS7JzlMd0AYtoM7UBxt+fuWLiAHNl3HjSQ1eJQOe8mqY
	1UkTPfUY9le4me4oRoNog==
X-ME-Sender: <xms:Z09-aDjoAtbt4oz_hquLOelYW_hgx3M6__B8GSSDGjYt5jVrjjJLtw>
    <xme:Z09-aABMdafwrWxno0W-vFk2Iet2VVNakLnH87WDZ27kI6n0GCygNLSskDXRMwCj3
    q43b51q_U9LmU6re-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeekvdeuhfeitdeuieejvedtieeijeefleevffefleekieetjeffvdekgfetuefhgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihgthhgrlhdrsh
    himhgvkhesrghmugdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohephhhshhgrhhesrgigihgrughordgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrlhgvgigrnhgurhgv
    rdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhgrnhhksegtrg
    guvghntggvrdgtohhmpdhrtghpthhtohepphhgrghjsegtrgguvghntggvrdgtohhmpdhr
    tghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Z09-aCOaJXULvBvv--IOW8a2yzp5R56DSAKQvyjkEmnC22NyLjA_wg>
    <xmx:Z09-aKAIMXXASTcUjjEauq50E7V1A-C-J-4qyc57zycYXV4qJifdZg>
    <xmx:Z09-aCXJjKsNb0OiDfTt1jzNPILfa04Qfx5G5aQCs8B2TMvOSZ7IiA>
    <xmx:Z09-aOdhpyzR93WWZFbPrLM4vIdzDHha7ZGCG6DUIfqgNQ5XWWh9KA>
    <xmx:aE9-aO3UqGV5yUTEmzfniPMEzUG6vhDrmrVmbYvdXHAs_euJ3YD_4gDq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 598F7700068; Mon, 21 Jul 2025 10:32:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T10195641ff6473d7
Date: Mon, 21 Jul 2025 16:31:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Harshit Shah" <hshah@axiado.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Jan Kotas" <jank@cadence.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Message-Id: <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
In-Reply-To: <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_073212_310878_598A5E6B 
X-CRM114-Status: GOOD (  15.38  )
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

On Sun, Jul 20, 2025, at 14:09, Krzysztof Kozlowski wrote:
> On 19/07/2025 03:09, Harshit Shah wrote:
>> On 7/17/2025 11:14 PM, Krzysztof Kozlowski wrote:
>>=20
>> It mentions about the special case where "Introducing a completely ne=
w=20
>> SoC platform." we can submit patches to=C2=A0soc@kernel.org directly.
>>=20
>> However I see two different points in the doc.
>>=20
>> 1. Submitting patches directly to soc@kernel.org with email
>>=20
>> 2. There is also mention about the "Branches and Pull requests"
>>=20
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/maintainer-soc.rst?h=3Dv6.16-rc1#n186).=20
>>=20
>>=20
>> I think if we need to use this approach then we need to create a new=20
>> branch on soc and create a pull request based on the same. (with the =
soc=20
>> tree[1])
>
> You do not create branches on other poeple's trees (like soc). You
> create branch on your own tree.

Yes, ideally the base should be -rc1, as for any other pull request.

> You can go with 1 or 2, up to you, I don't know which one is preferred
> by Arnd for new boards.

Separate patches (1) tend to work better for the first contribution
from a new maintainer, since there is less to know in advance.

      Arnd

