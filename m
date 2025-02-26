Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6Vh6ok9v7vS3mdkra6rnIMarTJ4HEbpvw5ta2XHGVU=; b=mh6R2Zc6cHmV/MJK8IJNw2dd+Y
	1HLwkQLwKz5f5GeS172MRRQGYJAJjCSl+cCslMcmTLEfjyj83PYNeNrvoa3AfNEVv+Xh8CCQt0tcB
	Mqil50k/BwBGytd3OBhiJfBGAe+IFQHeMzkcBrBdRYIKhWE1xbkBk9VVBll+fFowkw7jMJkH4PqZA
	HtIiav8t35mtNgvAK+jsfv3t8yL5VZIQWD4Eqfc52tzLQKa05zdmlt5A01ZIvSs2qWuy0jFZKWrqJ
	b/HEQvWj46Mv07gXiyUAC/IqOQhEJXz2sRaxJsdMf81EsPHXO9duIoO1rQjz7thTDtBFPA4xlm613
	kBLN1sYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJfw-00000004OoT-1K9C;
	Wed, 26 Feb 2025 15:50:20 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJdT-00000004O6G-37Xw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:47:48 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id DAA39138025C;
	Wed, 26 Feb 2025 10:47:46 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Wed, 26 Feb 2025 10:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740584866; x=1740671266; bh=Q6Vh6ok9v7vS3mdkra6rnIMarTJ4HEbp
	vw5ta2XHGVU=; b=PYAy++DDH/OcqFRBTwfBJaauqSElCUNFYbjLAxHjluCeF3fB
	gM5SmcDe0ZvUTRq2mrWajgxXJ1EJ+Q6+Nx/UN/GLSHDCxjHNogFyx/DJCE5B1NyF
	aFk/RBOc1vv2Ody0SJcwB0mB7JHSclL5O/RfmKkicO5jVgaLfNd2na2kJKAYau/p
	x2w0f2doOP2vj30XLJNvewDGU2pWf0/fW77GS9hxZddFqN5HCM0PJ5MN968ftjHW
	5LdedPtsSdM4s0u9ANGD/B+IOWRb4dGw2hS/S9ah64RE7aXHE/OwpeWvARAeHbEI
	FnooeccnRbLV7nYAR0gpI8SKBxp1R9e0lJjwvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740584866; x=
	1740671266; bh=Q6Vh6ok9v7vS3mdkra6rnIMarTJ4HEbpvw5ta2XHGVU=; b=L
	itOKgpYd7s4W2vIpYDz5XFpeZbTH0OczmdjA+bii/mCOFgOQSyF0evE2WP3sNv+T
	DyYUp9688OZtfJJFCdrIjcmn+4FNMptq1wOTPqqfSVYZNlnzW9ntN3o6XILOh2mb
	NsHTiBqd3G4TRL9Kl3/u9CwX/nW03m9E+kHXJzAV7j5DMaaQAJWrdMRlZj1WEka0
	+oKkgXEe+XGhBJQqUa140AX9soLztiQHoR7rWNfmMQAIngpJBGAkztxDqEKELAfn
	4wEcNWfpahzxkjhZRxBcXiOyV4n1dHT8jar72QoiKpG30JRxgVQ9WEejdkIVOE7X
	ivFwC9Ern6Is2pTm6YKRg==
X-ME-Sender: <xms:oje_Z9QZMhxLpTqrf8Ncchj8O95vC2-yjJQpRdPWvO8D6lyhqvQ9fg>
    <xme:oje_Z2yT7_NoFzKGyeR_VZjAdsw_zys1m7cNV4c4M4YITZfq1sKSqnBUe0bKH3aVP
    ot5T7z5Ah602yvPcTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhesjhgrnhhnrg
    hurdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:oje_Zy0lZaJVcsY8STYPuH9UqVc5UgiOXZQzVlprgaOWborWOhO6YQ>
    <xmx:oje_Z1Cu1pSVK0HQwvSLnSj0bK1H-nTFN9-FpOKL6QLeUjG2Mp4k0Q>
    <xmx:oje_Z2jcB4508kLkXV49iNS2PLbpIBff48T0Aq4FNSVNCi3hEELIUg>
    <xmx:oje_Z5rkJGpO8WPvpdqxyoYcFox_D0k3PMM-7XH76f0p3ATq7z10XA>
    <xmx:oje_Z-ccaxV6X53VNPqdlCJDNyFpbjGUnrDajBiBG_EAcEQT3IQYdZiJ>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 90C69BA006F; Wed, 26 Feb 2025 10:47:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 16:47:25 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Janne Grunau" <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <0b3db5a1-a57f-4ccb-9f7c-6df16d4319a5@app.fastmail.com>
In-Reply-To: <Z7y0gJPD5-OQvyog@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-1-1a3af494a48a@svenpeter.dev>
 <Z7y0gJPD5-OQvyog@blossom>
Subject: Re: [PATCH 1/4] soc: apple: rtkit: Add APPLE_RTKIT_PWR_STATE_INIT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_074747_852549_06F4F4CF 
X-CRM114-Status: UNSURE (   9.70  )
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



On Mon, Feb 24, 2025, at 19:03, Alyssa Rosenzweig wrote:
>> -	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_ON);
>> +	msg = FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_STATE_INIT);
>
> Commit message doesn't match the code. Just adding the state doesn't
> imply a behaviour change but the patch is one. How about "Use INIT state
> instead of ON" or something to make explicit the behaviour change?

Good point, will change the commit message to something like this for v2:

    soc: apple: rtkit: Add and use PWR_STATE_INIT instead of _ON

    This state is needed to wake the dcp IOP after m1n1 shut it down
    and works for all other co-processors as well.



Thanks,


Sven

