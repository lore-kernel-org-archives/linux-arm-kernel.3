Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF260C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 20:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPEMmEf06EwqkDHW4zrUmLX7eAmlPmYFpIvUGPbMw7U=; b=I9lHeVQd2/HtbQ+Ty2FqHsQdD+
	pau4nuTLdtKdVRFcnqk2YLut63spHA5WI+jANuv4DBip9CqiqWl9GdbVXjYYnS5gbDevn3hkZW8vo
	4JSoqwEd5X/08n/o8ktrvCc3t5nQPCgcPW8gjzBnGLXecj7yQdQZOnKE8UOkvJt6L6yXQimOn6WTH
	B2sQYHENaVR0g4fs66wSqCQf6MDwg4XOBJebBMuCq8Ujt1MidCDSPIP+E5XjYZ26Dkm0FLNsdHF3U
	1ZZmQhYQEYg0gUGEJZRR2SqXdGFwBZkuqiDPq4Wo0jJ6Jj6GmYETaNffKPSOg3YRI7LiX/SJZVbyP
	4USp0Nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJvw-00000003Ses-2zN4;
	Tue, 22 Jul 2025 20:49:56 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJYr-00000003Qs7-136d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:26:07 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 755BDEC0496;
	Tue, 22 Jul 2025 16:26:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 22 Jul 2025 16:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753215964;
	 x=1753302364; bh=MPEMmEf06EwqkDHW4zrUmLX7eAmlPmYFpIvUGPbMw7U=; b=
	Rd52q2BfCL9/WIb19/Ysv8UGZ9WK2HNVOX2Ey9x/s0HqweP0jYNyn7Q30j86Jyz/
	7CF70njPB9GVR2qrqGrUkTYROhK+krc25ZRhpKhKkS6owDpiws1xKZyJ0WKaNoH9
	4iem1FH9Ip488NgaR/BtEV6IBdx/6lqO7G0VKV0TvvGfUmt3HXIM6tG+Rbm/MPZh
	QZBeHHDR2pN9csn7aHzlCbRRAnsFZbCi++sePtC3X3Fx4Y/wsnv4skNZXwzNpuPz
	uW/lWbyLzhhxLb1RRN5isACPfh1C8MJyDky8jbssKZLBbzn1r+TjG/oTJxMDUuWO
	x13cnNR7lYq+nRftU9QlkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753215964; x=
	1753302364; bh=MPEMmEf06EwqkDHW4zrUmLX7eAmlPmYFpIvUGPbMw7U=; b=H
	Krle+RSR9rlUkkLlbsHvYazh9bnORgBW3Ptun03Rn8DBtmu+7qLuWz6Ec+2sIkdf
	ftWm14RvJCnVNhnvi07AzQ5HTa8PEV2qbt/E6gpMIc7+rfrYMZxHlmTEDqMU0mMI
	sWMFaKdwa8cvkV3Ji82GEld4Jf9NZIbp6qCkko5/95INV0rmvctHoQ+okzmehnuD
	W66mPIs7+MXhzkRA60xgC54gz9/xlq9I6Rs8sGXwHcgZCykp+MtjJlcDr4Dz5k04
	bJJNX9WlrQs7DUFNOCyM39OJSUiMprnGz8eVG8cGrWKys2Vkj5sp7qeABaq66hX9
	VwF1pOWEnv8eMqHl1lp4g==
X-ME-Sender: <xms:2_N_aLPMzpfikfdmv8xVlSV_TZCO10pf9ZZhU4ol_6YTuEryAy-4lQ>
    <xme:2_N_aF8W8KVR9sO-aPd2MWLIKJ7ViLWGroBdfazZtkhU5JCUfOXN2KT3ex_2mWyst
    l4f5j6bXGnhpacXIto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejheekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3PN_aHM83_J50gnp6V0Ph2bL-JK6lWO6KCToQpcVUH8rbOLRg9n4XA>
    <xmx:3PN_aNehchB_5QVS6ARKphS_Iw4kAtWBO3j03SKen2C5-0Maoy_vXg>
    <xmx:3PN_aMs8Cyj35T7ZtPmy6o1_AT-4tXY_PkLx2RxcbMQ2kIwOxwJ7ow>
    <xmx:3PN_aGkBoW_i_fcRJSZ1L-Zhnq5OSPdONC4bhAHEsH5bF2p_jHIh_g>
    <xmx:3PN_aBZiQD9s7Pi5XJvKPPmXagN2SE7nx7sN9pA2iYeFlXiKuQU9JC5Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E0A63700069; Tue, 22 Jul 2025 16:26:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T977abbae7a5b9ff8
Date: Tue, 22 Jul 2025 22:25:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kevin Hilman" <khilman@baylibre.com>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
In-Reply-To: <7h34b4xcxb.fsf@baylibre.com>
References: <7h34b4xcxb.fsf@baylibre.com>
Subject: Re: [GIT PULL] soc: OMAP updates for v6.17
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_132605_360855_B67376BE 
X-CRM114-Status: UNSURE (   5.66  )
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

On Thu, Jul 10, 2025, at 17:50, Kevin Hilman wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>
> ----------------------------------------------------------------
> Kory Maincent (2):
>       arm: omap2plus_defconfig: Enable TPS65219 regulator
>       arm: multi_v7_defconfig: Enable TPS65219 regulator
>
> Li Jun (1):
>       bus: del unnecessary init var

Unfortunately these are changes that I really want in separate
branches, for defconfig and drivers respectively.

Since all three changes are trivial, I ended up cherry-picking
the commits to where I want them. I hope that's ok with you,
let me know if you need the stable commit IDs.

     Arnd

