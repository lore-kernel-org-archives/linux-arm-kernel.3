Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF14C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtNbkKW92oiyf/MEWed49iOf2vBzLZ2dwi5nMQkMZIc=; b=ZM48XCIorU4YcOX0kLe6Bmfbu+
	P7mojJD/dUz8sfspEm3S+/KrZL/0dH8qHzfHTQkg/HPKaQH3HTB1TBjN3Pnj7XPN5wLhAPXL/I+Hx
	xQLlKH3c7rvux7aIf4mA0lhzRtSv35HypPWzMGLiZ37twZ21QVU7Mrim2ATYNrf9W4rbQPY3RmsrZ
	roSw/f4Q0+ZIxJ1Pv8WGDM8yhKZQc/IV7thIPmDjg1w7IBztghh0k3fI8rp0j8EhTKMAFZn5Jlp3u
	wKl4tB7EuhTzTruFcQPjK+Hk7HgLQe8YFVQhQays58D4G3UlOfkUBQPVc3QkO1T4XwnhVPRmPLfPy
	ea2PyMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHSM-0000000C5Ln-3FdL;
	Thu, 06 Mar 2025 20:04:34 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHKk-0000000C46k-2HXc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 19:56:43 +0000
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E3F2E114018C;
	Thu,  6 Mar 2025 14:56:38 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 06 Mar 2025 14:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741290998; x=1741377398; bh=vtNbkKW92oiyf/MEWed49iOf2vBzLZ2d
	wi5nMQkMZIc=; b=ouj9JeLTgrXCx8BuncX57zY1qS606ouLDBYXMspDJxMXAsBu
	DTd4CaabpmKucH4R1TrWq7V9s2nb4u2yIMNAkVEvE0BNBv0HRt91tkmkl98nwr+G
	aEG13IPuK0QnOWCv4qdsc3ijIetAip87ac9VdPoSyKjpThkc6D1SswQ7+HLTqNzH
	fDnokTMxpin6dtQZvIl5NFJeQ9kdJcK+PvhT+qv0fyMcNQZNuRSNFG4/1wqhvEll
	Rou9mdzh2eo/txOI9sw4SNPwqNUHbwi5HbTnl8SbQjVeZGU6nHc/KVqtntmUoRgF
	3TUkM4TxNa8Ivg4ud6imy6BCPTwefyFD5Nlu+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741290998; x=
	1741377398; bh=vtNbkKW92oiyf/MEWed49iOf2vBzLZ2dwi5nMQkMZIc=; b=N
	xX0pN5HeT34HZqxVu98+U7wiz6BYZ90rGbPc80C4MHpde5rPS43wGMX6OSHbjlcT
	miGKGxE7J2Cd51IfqMK2CrLYtrM5KcKSqj8RNbUJjUtG8CaJeETx9f6fL5JCFDTR
	MpjTQ0NB0m6EG7uyoFIZnLxK7bVZCCtuy1xxl4CjDzcKMbpMv159gUp1V8llAm9L
	MOZzlbDTO0dympwy617AOzYQLHqjJE/LdfG+I+odMG6KR5l8KELKotktrsOv3oL1
	US4fmSY2bIgvswal9++vjq/HZQnSdmrVFr17KMgXp0ekwo2uLyvD6fjicwZvaFQS
	1SLlZIzZu0OurTWmJeOhA==
X-ME-Sender: <xms:9v3JZ7lvEmwPT69snFH8eVv6Y42cnFRNAxH62XeI8RhyBgkXw4DjoA>
    <xme:9v3JZ-3ju0g6eTH2TOwJsO3v17HEOipiVN8BXvhaS8tGRYGUrkKUt87pPm-f1Pkvq
    jSsJgIDtOq9xrhxJRM>
X-ME-Received: <xmr:9v3JZxpSo2LAYSTDuCr3JYdLG4prV5_rPIGsYXUOUuJfwCkbQzVv29RVIaTWJS2C3LDWniEda3hg8WA3cJJzyMidwBh7g9j2I4A4_sP5HC7MoMNNqWk0R0zx2fjz6zQETA5dnl3bCWd0xbH2cgnC46ydLeW9t9jV_QTMVOWW5fR4_OVJ8Qt7dxHqPq99Yoycpa0W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepfeefjeeiueejteffjeetueekjedtgfehiedt
    uefgtdeuvdfgfefhledufeevgffgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehtohifihhntghhvghnmhhisehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtohepkhhriihkodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlhihsshgrsehroh
    hsvghniiifvghighdrihhopdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:9v3JZzm9KDznGdcZs_dVEDUiTzahiftdf77uyXeSGDPY694uzATSiA>
    <xmx:9v3JZ52LKVIos3GMrngwOoYyiEe77xOfpbtd12UjzPoy1qOkqay0vg>
    <xmx:9v3JZyscwqqR5mEQZdaIw3O15X4JmrOyqfGKgtudAPOd3xkwcjMRsA>
    <xmx:9v3JZ9UxNs7g636yz5cb4TwjvoH995PVjcj-iPpW_YhyXlB6r-EDVQ>
    <xmx:9v3JZys_LuNuW9qp-z_RihXTje-4G52tbfTkXAq3RrKBRAwdWzSDRrH1>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Mar 2025 14:56:36 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
Subject: Re: [PATCH RESEND v2 0/5] arm64: dts: apple: Add DWI backlight dt
 nodes
Message-Id: <174129099660.23709.379545131530961336.b4-ty@svenpeter.dev>
Date: Thu, 06 Mar 2025 20:56:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115642_668410_E85BF52E 
X-CRM114-Status: UNSURE (   6.65  )
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

On Fri, 28 Feb 2025 12:32:11 +0800, Nick Chan wrote:
> Add device tree nodes for DWI backlight found on some Apple iPhones, iPads
> and iPod touches. Not all devices have this feature, as some devices
> instead have their backlights directly connected to the WLED output of a
> PMU or use self-emissive panels.
> 
> Resned because a network error occured and some patches failed to send.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/dt), thanks!

[1/5] arm64: dts: apple: s5l8960x: Add backlight nodes
      https://github.com/AsahiLinux/linux/commit/0f8f64b2329f
[2/5] arm64: dts: apple: t7000: Add backlight nodes
      https://github.com/AsahiLinux/linux/commit/897359ae3c50
[3/5] arm64: dts: apple: s800-0-3: Add backlight nodes
      https://github.com/AsahiLinux/linux/commit/4384b6c781bc
[4/5] arm64: dts: apple: t8010: Add backlight nodes
      https://github.com/AsahiLinux/linux/commit/074db7d6f51b
[5/5] arm64: dts: apple: t8015: Add backlight nodes
      https://github.com/AsahiLinux/linux/commit/e1bc21d8f8fd

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>



