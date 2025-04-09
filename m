Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BAC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7QO4XxBsidc/k+388zWruWPPsPpYT/wiCzlONis2iU=; b=3w2FUxrkpZqjoZCINhahj1XivD
	qGM4oBRHBa1WLSrHiFnK+oFJ3nKxEWtEtx5xn4HUJgEgaWrvedHNZ4nWVQNPuAFZIadPJBX33o4Q4
	0/6wb/9IHN992KqSzkfuX2F7AaGkGn6UJSfuk+N8XO7/espJKkocotMKha49AxhURYCYH1ChVfdyR
	OYif12ea9fT64UQ8AwmGYOj87lekYjTcQ6CT4a0FRhxLkClWWo/CdPUEUWr7P1lk9efyY9IlCgajN
	JkKwiF9BLFSSPbXygCpnwzuFXCLxTZmYlVwpbVI9ZD5HD8qkt++Ob5o8OeFzC7sjLuOQa7tlIEEYI
	GPQUA8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QDZ-00000006TZm-0kC3;
	Wed, 09 Apr 2025 07:51:29 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QBh-00000006TGL-3019
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:49:35 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 6655613801B8;
	Wed,  9 Apr 2025 03:49:30 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 03:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744184970;
	 x=1744271370; bh=b7QO4XxBsidc/k+388zWruWPPsPpYT/wiCzlONis2iU=; b=
	kd1hed4qBru5mq0PUNDyFPHnc1oWGZoYE/UlqjQfMKgzDcx+ZVvgexHpDYGUQRbm
	H80NpaFeQehhRv/p2U7rrK11YycAYQ2DH0B3AwF1diLPC+p0BglmPcsKI8m6Hi9e
	pCxG6gwq5W3/kAqcoSGSFK/b+1AUNlGRo6IpxQ3HUobUtTmQk6xUsO2+/Z41K9DL
	QzZgRSkZ8GtjAaq1TB3mKxsSHPhcRZTOPvXq4dDwpvPgsoBYEV+O0iZC1UNHooPR
	VCRExzQbmr78sN38+iy8OJVUGFm8a5+cvTpJukWp4BL06yOg++ak8h4oYsmrg/2P
	g2oLPElnsgGU1e0977qxdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744184970; x=
	1744271370; bh=b7QO4XxBsidc/k+388zWruWPPsPpYT/wiCzlONis2iU=; b=D
	eHRGbSP+L+TDl8aAREeve+Jf4texGRhNYy3cOjhovDbyOBvC3rjfhxH8uIwQ2zfw
	cJNL520BLh4Gh4gjBXbbPuMNsw3TvnCCBwnxeDHRbp25gEqCg6dbpG99m0zga0yO
	6satkEa6+eqfll7+YpEDYUWeYNiDmu/btCYQQ3tsoC7/WnvZNjxO4aAs06MQR0KX
	qiBSX/fS9kK+nzjVRzxE6Zwo+8FswfnJjwDubzIJEmvlubBOQCL7vhOYBGbXzWzS
	KDjia4a16Dc2SQst83A2ALbPfl53b5Vwlofufm5FkZV7Vj468Xm33l9e485DKOgW
	uFVxdGtrA+Bg/YYYuvliA==
X-ME-Sender: <xms:iSb2Z2Et506oI8LNEYn1Jy3l7oSy2nJHIIfWyojPUtFNQBTv7SZorA>
    <xme:iSb2Z3WUlYb46-DmmRyrTFDn1czxWaZSiT3Y8_eNAf8uE9al9iy8i89CcuNsXbQST
    NIcZMj-hMS-IcaRTZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iSb2ZwKsTfrLqpDyBgskviGCEFI-4Xn2ksXcaYtH4ixw0U2NKKqrHQ>
    <xmx:iSb2ZwF1V-6fwB7e-EhikcvO3A0UvwgoNxPjJ-_mzSwJTVrg2qGTuA>
    <xmx:iSb2Z8V7iwX4xcw85J6wpH2W4Pnw2BMcAvVk0_5PL_1vOwWVRonICw>
    <xmx:iSb2ZzNNGR5BENWLma_5U_rPgbdvYGpgL5POptKyYMsIIniJ4TvbVA>
    <xmx:iib2Z0BjNWvTXgczBR0xN7gwz1CxxiOuyWw3ZfF-kJI6DzOJAJY1AQaO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D75382220073; Wed,  9 Apr 2025 03:49:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tf8f308e4370a4290
Date: Wed, 09 Apr 2025 09:48:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>
In-Reply-To: <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
Subject: Re: [PATCH 13/24] arm64/sysreg: Add ICH_HFGWTR_EL2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_004934_030738_E5591422 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> Add ICH_HFGWTR_EL2 register description to sysreg.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

No comment on the contents, but I feel that having ten patches
adding new sysregs one group at a time is a bit worse than a
single patch adding them all. The patch descriptions don't add
any particular information about why these are distinct, and you
need them all anyway, so I'd suggest combining them into a
larger patch.

      Arnd

