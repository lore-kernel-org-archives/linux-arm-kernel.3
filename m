Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656BCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q94cEm6FCaSAKBEdMBjIEjdeXqF1F87b4/rCcCWWN4o=; b=PQbgB37wwRgx68+IPGANXRdzCJ
	y8zOqrmuM+Ul9u6Qc2KrXYDYSNr+fxDs96vrEC13yr3yo8LA3IBG2MLY2SP7vCQhWzoyuqZ1PS1lF
	eue/Rk42Pnky9cB5ywqKrt7H5sNl6qaTNUL8dOLnyM98aU4W3/0zsTO4oeNls9UMSspknrHawKYom
	r7Lr2BA4JBqyEZV5lobV9pdMdSVIgFOE7TLplTP9BHY9e2c4T1fHVUaw+v5wjG1txQwWM9WrgW9gT
	YzFQMwqGUTHxTr/STkA1mQhS4ZbSXsvwVtb+ZZxIqBm39eg8n+IfhaWKi5ChGkjkEfTFf9+asC+Ia
	NbG2GfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93GW-000000023yr-2Ghb;
	Wed, 15 Oct 2025 15:18:12 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93GU-000000023xx-115v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:18:11 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A074B7A011C;
	Wed, 15 Oct 2025 11:18:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 11:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760541488;
	 x=1760627888; bh=Q94cEm6FCaSAKBEdMBjIEjdeXqF1F87b4/rCcCWWN4o=; b=
	z0tWasn5NLH5PWa6Lt7aj23YAt2R87SevP2ewmQ7Tlfp/g5x3ty09IxZpS1IZ4UV
	lRX5Kct2T0Qk8eF+xKbR3FPWF3Kfn2aUyBVY7kd8mQC4i0GnEIM8fq+0iar9xRCz
	jIAzre1AQADoAzZ7RJBl4/WJOBtxwvZbhzvUf3fIFQhNMpoR1xMGHh8p5UQ/o9Hk
	8i+zzGe3mlva3xwKfQIeRMW49hH3xQTstw/aUot7YUrWmRvHhvFcWPUCyLQ1lrA6
	8NDOA5mUPxrdDUE9w+jwl9kzDeb+1/iMrDzzSJmsQ1NCwe3K8aEJdwzgZpbJpMSU
	f+t2jj2QySyTipbMldTPKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760541488; x=
	1760627888; bh=Q94cEm6FCaSAKBEdMBjIEjdeXqF1F87b4/rCcCWWN4o=; b=c
	mXbB2/dBnzApHYMY2nF1CnHXNdo6QDVvy6pksn7v32VQXkFfUZMCcLcq3J+sxAlx
	XybDIxqrLDdf5PgzxHPOka+GX9Zm80WPYfjX3ZDrAyS4wpczPMOmW4Q+s3MdKSaE
	6f16Yjlttz3OeKrt+ItiNWc6geXnOnhB/J5s3Qzer8hPtz6pTOwpuwqfn7t0BduL
	DYkcp+wMNOmpu6WDm6PCbjB5JyMQIpPA9PHHOnOkCdTxZ/zd/31oACMp8aaK99Gd
	PurMRphsTCY3M105irYCPFF8qraCT0zfHv4G0dMIxllhzEfZEMf6+RIkN9Sxr2Hd
	lflq2Py1DG9ZBfkT/6uwQ==
X-ME-Sender: <xms:L7vvaBvpAYcPT57i2blDb65F3BQSxDIOxXZubgX1ftJN6Sdgv6A9bA>
    <xme:L7vvaFRWsV2w8ISkqIGaUFGa03S3yO1vrcseBBpDjYD_rTjyQxhkoCehpWDAU4TmZ
    6ENCOymHflL5lNGrJnGMe14yYZo55Gwfata8mJHNXe7WjOWu5TbFdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehmrghrvghkrdhvrghsuhhtsehmrghilhgsohigrdhorhhgpdhrtghpthhtoheplh
    hirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehkuhhnihhn
    ohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:L7vvaHQvib3ShXhZmMaBUgEFKuITHe0r5iPyGfVKrMjRuc4_Sg3vUQ>
    <xmx:L7vvaH1nZNm_-3Kf0NQx7oWxCpyM_WZ56HmP-p9XBpexpwUC6TAvjw>
    <xmx:L7vvaDAcgyU-_QPZcCV7nSVowBLdNcWre2eL58ticfBnUwR4zw-XmA>
    <xmx:L7vvaDg-T9Wxkg1JiZzJS5DQ_8uRGHNJTlHBF0ybDUsXtTSrJctyUA>
    <xmx:MLvvaPFA_FJuj11EZC5Dv5Pi45EK_83F877jG4vrz98NqgpDUCOPvREs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3A6AA700054; Wed, 15 Oct 2025 11:18:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AZW5Y86ioerw
Date: Wed, 15 Oct 2025 17:17:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 "Marek Vasut" <marek.vasut@mailbox.org>
Message-Id: <2e3e7194-d580-4b8c-bbcb-bb8d31adae14@app.fastmail.com>
In-Reply-To: <CAMuHMdVD+YocwQJduG9rALL26Uh8ue8WLFXVSV1y1ZfrMG=JbA@mail.gmail.com>
References: <87freu5jxf.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdV=60U2n7iK1rCX=MecLw9M+afN8cap5GUL-apF49i-rw@mail.gmail.com>
 <877bzr97no.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUbi7iRsXoYCwz_=Jt7ARGbeL-oG597swmsGODO8rLsqQ@mail.gmail.com>
 <b80f879b-1f5b-4289-9cc3-075642d110ed@app.fastmail.com>
 <CAMuHMdVWwUZg5i9oRr9pLWav=aygEjqurGKBqtTKtaBZObQ+zg@mail.gmail.com>
 <CAMuHMdXXiDM4AMyXxaxGv-JYNpZ0CD75v4tAa5C3RmFy4m0GtQ@mail.gmail.com>
 <ax626myd63skmkpb6zleyncggclkivpox2mdvnhcccsplh6gcp@scfguuubd2yp>
 <CAMuHMdVqOR2kPy7V+N5oCFrKZA0R7JHC_+QsjFc5c43F1KFFiw@mail.gmail.com>
 <b3b13e21-ae54-4499-a569-0442bb9cfc8f@app.fastmail.com>
 <CAMuHMdVD+YocwQJduG9rALL26Uh8ue8WLFXVSV1y1ZfrMG=JbA@mail.gmail.com>
Subject: Re: [issue report] ARM: compile error of frame size
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_081810_750513_4FF92F56 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, Oct 15, 2025, at 16:58, Geert Uytterhoeven wrote:
> On Wed, 15 Oct 2025 at 13:03, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Oct 15, 2025, at 12:07, Geert Uytterhoeven wrote:
>>
>> MIPS does have larger stack usage than most other architectures
>> here, and I do account for that with an architecture specific
>> base value as well, but in order to catch actual bugs in newly
>> written code, this has to be as small as possible.
>>
>> What is the stack usage you observe in your configuration?
>
> 1056 bytes on arm64, 1040 on mips64, i.e. just above the "32-bit"
> default of 1024, but far from the "64-bit" default of 2048.
>

Ok, great, I'm not worried then.

     Arnd

