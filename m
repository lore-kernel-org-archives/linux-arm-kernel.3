Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67C5EBFD00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 06:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GliIzvlwvGXQ2uLjTl5zA+OCviZ5rl1rfVxxCL7JYOU=; b=rl2GcT/Mh/amaojuvOydX/1ctF
	bLrr43jdWJm6iUulchAZ/8h1c0adf8SK/d5GWiTDWXEFVjcRBC8Yo5FCBpF4hVPVX7tayGm2ZQzsp
	31y/nqQyLdzONrTQLA0uY6xGnC7WAkDsyAXgRevZcyHJx41Io7HMMkDEtFcWWMUG/vVtQ1xWOuhHZ
	Tze9x1+rL+z9iNj3HOSjQXchrEDUzRb2pG91vPtdasVrnInRlatpWGSFo1Y6Dfh8TGUMCAlLbAzcx
	/dZcY+4rMRPJ/BpILGZFaPtVrIDDr1tLfiLlBghRF2vKhiViWfDfwMAYX0hpQGyJNDyixjOj3bFm5
	NAqo+qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAif-0000000F4Xc-0SfL;
	Mon, 13 Apr 2026 06:24:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAic-0000000F4XC-3V10
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 06:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A09324417D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 06:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C50C116C6;
	Mon, 13 Apr 2026 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776061461;
	bh=xiJ1TaIK6tuLUTvVA4rOAiLZbjlv9meyWs51j4OzaAI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iG/89k6HIWRTFF2cNKRhzQ89mb6Ohocm6LqnRCt5+zxUfjVzAEtnlBSAKrDsYzuav
	 Gbdm/ynYMgZDy/4Fi+bPj1rU3znguTSN3vRIdW9DjhFI5oySx/46SSRg90vSuT4Uhr
	 uOSmaqUY1EKQWmHnItWz2eORwnv18gEHWnY238KWC8+b/3NWbgnFkA4ln1DXwdAfBI
	 YQoSYy5wFD0hB5cSxaX3xISq5UvNe+wxDNpr0hfJzwshFD/OEuFbmZBCB9sn0zJ+0v
	 peb5wvIgfKuvaEocUFRSC2xZBeTT3nLKhpVGL5G16TeAPmEtsy6kwaOeKgFF8CQlaO
	 WorLvzydRmRyA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 477C9F4006E;
	Mon, 13 Apr 2026 02:24:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 02:24:20 -0400
X-ME-Sender: <xms:E4zcacPteAAIBjTEk0Xn-8rgiGW2UKl-17biAuH4txId33cGoRLItg>
    <xme:E4zcadxBbf4qeXsK05ahJqj4fYimXuTpL3dANqYqLskTNPqnM1AA5gCnYimPSTcUD
    toK4UqG1LkTjSPl9_HH7K-wSPbY-bQJyOI-VLKWsus8c7mcFpzRA78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhm
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhuuggvvghp
    rdhhohhllhgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:FIzcacy4D4_fCmxG4Cn9Q1CE3pbtLq1EfHKG9vdYRtFTLtZCKX7JXQ>
    <xmx:FIzcaRwhatPV2jBCJmNARBfilRu2FaT8hIaCMWYfHipoqvj529dLJg>
    <xmx:FIzcaeb91GCm5z6BX65igRAbFRavHrIpGp9zHKF9fPOD6dK_aHSk3g>
    <xmx:FIzcaaUY0R646qQNQ8A95YtAeVUeIFmUJkO8d8wOfONdOcMqwXcA5A>
    <xmx:FIzcaUgEgR_SRaceBasEq8gUGH6grOgKaOOTbtvHUJvLIs2X3Y9NF8ij>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 33F5F700069; Mon, 13 Apr 2026 02:24:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AX0_rBoRXIrB
Date: Mon, 13 Apr 2026 08:23:58 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: arm <arm@kernel.org>, "SoC Team" <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Message-Id: <45bc09d9-33e0-48c4-92a3-9bf8e64ef80a@app.fastmail.com>
In-Reply-To: <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
References: <20260407100841.3150090-1-sudeep.holla@kernel.org>
 <20260411-tireless-agama-of-advance-5bdabf@quoll>
 <20260411-exotic-astonishing-piculet-0cd25e@sudeepholla>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fix for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_232422_959394_A4DBD04E 
X-CRM114-Status: GOOD (  15.81  )
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

On Sat, Apr 11, 2026, at 19:35, Sudeep Holla wrote:
> On Sat, Apr 11, 2026 at 10:49:50AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Apr 07, 2026 at 11:08:39AM +0100, Sudeep Holla wrote:
>> > ----------------------------------------------------------------
>> > Arm FF-A fix for v7.1
>> > 
>> > Use the page aligned backing allocation size when computing the RXTX_MAP
>> > page count. This fixes FF-A RX/TX buffer registration on kernels built
>> > with 16K/64K PAGE_SIZE, where alloc_pages_exact() backs the buffer with a
>> > larger aligned span than the discovered minimum buffer size.
>> 
>> Can we avoid per-driver trees or pulls? You do maintain also ARM SCMI
>> firmware driver, so this could be sent together? I think you also use
>> the same Git tree, right?
>
> Sure, I can put all of the firmware drivers I maintain together. I had
> for some reason assumed individual PR is preferred.

To me, that's a function of how complex the changes are and how
you describe them in the changelog text: If you have a lot of changes
for the merge window, having one branch per firmware type probably
works best, or even multiple ones if you have a series that implements
something new and a number of random changes do existing code.

If you have only a handful of bugfixes across multiple firmware
subsystems, a single 'firmware fixes' is less work for all of
us, with no loss of readability in the git history.

      Arnd

