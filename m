Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55553C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id80U8v2uBW901XmmB+DRmaCJiaToKjtFbz2EHfcaK8=; b=XNXM+QcMl/as3w8mYJw1XtqkBd
	m+mQBd9R6BbCLVzpILIQlsZl+tjk41o3Tsb3iq3ykIeDYM0q7eayniNjFJgbkEQmTIuQiuA9rzEbW
	VNqaf9fDL8Gio95cccq67yj5htLs0sS8MvQTWjGk3aZehGkYbxqjMOiAa40N0ZTfrhxEU0N3HY051
	7x5MB9S7C8crUdo9TDxPqwVORkP9ZWfLeAanns/C6WopI38UCHNblkPS6F2qy2+dCUcJICgNH+NHi
	7uzPZf+6DfWMfbWn+L6q5imdpiJX9KNxxPDiiuU02dUwsc3pocerML8pCqS3IRY8+AzWIsZ9QZ5u5
	LwNBmIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqrQ-0000000GSZi-0qiy;
	Sat, 08 Mar 2025 09:52:48 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqpm-0000000GSVp-3E9u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 09:51:08 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 70BFA138283C;
	Sat,  8 Mar 2025 04:51:05 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sat, 08 Mar 2025 04:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741427465; x=1741513865; bh=Id80U8v2uBW901XmmB+DRmaCJiaToKjt
	Fbz2EHfcaK8=; b=AfqRn1hoQFOCcMe1/Vxfxrx+ZZ/raQW3mZoARtgK6lIETf2V
	YG7H6+8Dryag+nuHPg96I2Ua4KNZEu9eADQJv/RqocJ6xEETKWtjZr/+oTtHdtTA
	ba86Evsszm02TU1+TfBimrjkIFQxkq/f/Zujw0s8k6oH49pWk2i5E6Eeq/ISQ6gd
	7nkvNKpsMlZi7q6TnE+nMC7b5ys/1n83uyPT+zAUsmZ90JcAwfZBy9PuuK0lSmq0
	sJu7NUO2djA2GvbqtLHPEYKjWQELfKsDb1gs9LNw2sHswuNBjtmadBlzFDy0uHMy
	ZVk+RyXOmNn88YcTW36TSpwvbfvS2bzQhB+IGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741427465; x=
	1741513865; bh=Id80U8v2uBW901XmmB+DRmaCJiaToKjtFbz2EHfcaK8=; b=X
	zrqzp7WJR48R6EWkoYTBAool9kBMTiWa+CowGLeR89xyrPanGxAgdkF77j59UgqZ
	mW9qKYMoGoUgMGCqQz6u/y2S4PuxVEn+Cpidz0CWaciOa687N8xfPbBAG7b/c/t+
	SqkLMvkIwfLDKP22NbsmqrVUwbzrvp997ph/k8rQlTxK7AJKa2pkWzTHSJSEVARU
	bUERiOw3BhmirCA0u4jMYPM9ofRb6TBTgMz3QpfDBexphbG4VS+wYn74aeX9wGzQ
	gZRt+6QUP6K72lSZbE1j9FmdvaBNdL2Nc58ZY2SpkPuC6MIuFKD3rf9BJs2ijsMt
	g1D13XZ46mfTQ9cBXHF5A==
X-ME-Sender: <xms:CRPMZ-4hA9Wzr9Ncd7JokmUY_a_kw5nkNC_qKYk4PoQ_jYfFKZESEw>
    <xme:CRPMZ35iL3b86BAJwS-ikiL0cIU_JuBCrU5SBEW-tDVZAThoaK7mdInbHpP3inRl5
    H91Ojy4CCkZ1uR1-IA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgepudenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrd
    hkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgv
    thdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:CRPMZ9d7MuwznOq0e5Miq4-S3oa5nKtoKoARHmnipTMSWwhqlNE1Vw>
    <xmx:CRPMZ7JQ2c3LlokOGJOMpgqsYkOWGpv2VV0MIBAVth1HHGrQbaXAWA>
    <xmx:CRPMZyIMY-Cmz-60aixSQpW3NMsEc5R4iziQ2pp0nVWFFM95vvJOMQ>
    <xmx:CRPMZ8xSUbNj7jxnzdVcPrxTrd0ZQHad5FArb2-CX1Qc4FcpO6uUGQ>
    <xmx:CRPMZ_DqDI_j-r5q7ch7SQOCUREA4U0NGlOqUYlQre1o-0up0ILk3uAI>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A337BA006F; Sat,  8 Mar 2025 04:51:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 10:50:43 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-Id: <ff7dec26-5bf8-4c0b-af7c-76064f3386b7@app.fastmail.com>
In-Reply-To: <20250307-spmi-v2-1-eccdb06afb99@gmail.com>
References: <20250307-spmi-v2-0-eccdb06afb99@gmail.com>
 <20250307-spmi-v2-1-eccdb06afb99@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spmi: Add Apple SPMI controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_015107_014976_51C84F1C 
X-CRM114-Status: UNSURE (   5.24  )
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

On Fri, Mar 7, 2025, at 21:08, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the SPMI controller present on most Apple SoCs
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>



Thanks,


Sven

