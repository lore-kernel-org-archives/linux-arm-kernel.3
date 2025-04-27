Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AF1C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZhFo4zuHwRSU=; b=xmU+HL+xEXjaPLLs18JHw1zIby
	zWgWkzdbJtf9uF9Jwcr7NzKzoIy539js/0Cvk9kYxpazpMh7C2DEPtSIh3LUDOo4yaljRcIWSfvDE
	AJK+ALiLfv8u5xKduShQM/89ZkHK9i5T1PWcnl81GrEh9a8CwWrMdzme66yEdFULpEx7aUeUeR8DN
	Z4YfGL+wPS7mz9nWXU+wGA0E0YTCe1Jzy4HFaZhSmN2rWiP5i5K3GBIl/iVAuBke6Yu7IZ7l/hX2L
	jZJney9fV8i+F/ekbT9Vc7OuSj3OOX+HaYqI9N5G8Qta2pQkRyfZiQQGfrNlNrmNFKG7UPLaJgowS
	MQREjW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90Ed-00000003Pma-1UrX;
	Sun, 27 Apr 2025 11:31:47 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90Cf-00000003PXZ-0mvj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:29:47 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F1702540219;
	Sun, 27 Apr 2025 07:29:41 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 27 Apr 2025 07:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1745753381; x=1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZ
	hFo4zuHwRSU=; b=cHiGN+ZHVQvwAmWDVqx50p8JoFWULaccQJvoTA0aQQhbWoFj
	6J7CETqWlKWiUxtKkRoO5VBEsJc6Am067bGJBPDJwas4PXB2FBqDdwB4cW40fhmj
	wW7+AXxGlx5lVtBORqbrSngOYGPpMo0CvUWAa45O4OOu7+7wunwDjjoonqC7g/zW
	Wdnh+EFjZyvK1jID1HhANCjNFi9iIEdoQ0r7P92cG721VszlAtd/czvo6+R8Hnxd
	ucQR93PRE5ZxsRismq+JU6fyHS6HATK+azAFOjjrYuhZcxpk1Z0JCOm6aexDIxt9
	fT5+7FT2550zPfT/Cm8SqfCMPnSLrPEoNfBqnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745753381; x=
	1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZhFo4zuHwRSU=; b=E
	jsUXopkgxavIZ1xItTb/bHcd5C9+Mg0mtnK92mV2vksvqWHpIuKCP+LQ9bu5hBCc
	TZ2zPdMVV72GaMriRYLOEZTZN2BUlRteq/ZRE2Kz93PfwQOjIWE0wawVSOd54nKk
	seKri/NZ/obQ3FAeZXO8dbcnPWXrcLAfqCvty8lppFSb5WdiwkR/0yTZYCUgLtRG
	veElxm/j9xyyoVLMrHwkYYF7cSjcxkS79ZjK941CezfydKUJSLjMV4vODtI/wrcn
	343CLszdcrK/IUnuzPChqz6yiHhvgSImt7VzQWkWukoosIkOqVrsgctzZcDflKy3
	DsI3xeOBJqtDICJKGf9QA==
X-ME-Sender: <xms:IxUOaJOdB7skIWg1gp5gI_f5bSLHlrtJ5DizHoMVXln4GRcU_grfCA>
    <xme:IxUOaL9FSn8d4Om1QrpZrSgSwOPFF8UE367CRXKJQIUYLtao_KGS2rQ5caiW6IfgV
    zZK3DICYOyduSjMrYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheejleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhes
    jhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehnrghvvggvnheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:IxUOaISkvdKNkauBTau3Yk86BBkDs_xaQlGa8g1PKqItwEO6sr7_Aw>
    <xmx:IxUOaFsQIYPEGVcnbw5bn1-nmmufSyYvjad865GJP9x0WREMbgpV5g>
    <xmx:IxUOaBd97cPa0WAqm8KOVrSh9n-zwiAuFqZ3Oln3jFSUdNAWa0GCEQ>
    <xmx:IxUOaB2Jm45REZl8uOecpL_ceCAb7Zm9Jwx7F71mScOODKnIaRvMpQ>
    <xmx:JRUOaB2nIin_JYaVvDIelqSp6Cg24ftqlZtTrULSUZnnWHPvRJfd7SeL>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F050BA0070; Sun, 27 Apr 2025 07:29:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5434dab6164679dd
Date: Sun, 27 Apr 2025 13:29:17 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Neal Gompa" <neal@gompa.dev>,
 "Hector Martin" <marcan@marcan.st>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c6590a37-97b0-4497-8cc1-c4572897f0dc@app.fastmail.com>
In-Reply-To: <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
 <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_042945_768839_F08354F5 
X-CRM114-Status: GOOD (  11.93  )
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

Hi,


On Thu, Apr 17, 2025, at 15:07, Andi Shyti wrote:
> Hi Sven, Hector,
>
> ...
>
>> +/*
>> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
>> + * use 100ms here which should be plenty.
>> + */
>> +#define TRANSFER_TIMEOUT_MS	100
>
> Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
> naming belonging to this driver.
>
> 100ms looks a bit too much to me, but if you say it works, then
> it works.
>

The problem here is that we only have very outdated documentation for this
hardware and no real idea what changed since Apple bought PASemi and continued
using their i2c controller.
We know that 10ms (which used to be the original timeout iirc) is not nearly
enough and we also know that we need at least 25ms for clock strechting
(assuming nothing changed in the past 10+ years).
We just bumped it to 100ms to be safe after we very rarely got error
reports which we tracked down to timeouts and haven't gotten any reports
since.


I've addressed all your other comments for v3 which I'll send out in a few minutes.


Best,


Sven

