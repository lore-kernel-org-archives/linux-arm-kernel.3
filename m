Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA1C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzhNcRtCfxWSACKC/UtPCa8G/XdJxqGyTmH3V+EynZw=; b=fl1bqmNu57azPw12HWRIdSbXEf
	KaPqFNc2Qc8Bxi3IvQmvphbBBpcmV10alPqOt8YS9lYBncXqz/q2gSDaqehSGLQdz/0+tLAGAHE0a
	XFLe13Acwc1YyCWmXFOzFkGUbhMMonwWUayuAWMJUq9EKGmbdM5JnliOlsHswCCpSMsHdb/ails7I
	2TeuC3O9V+u0O6k33kcHAYutly4HAKLxMbzD3rmj3EGp72Y0Ce2U7zmjrTFU89XuopUCpiuK5W+uJ
	JrZi5wcSAnPSi5E5vFpp6omaNzUSPlarcQ4S5WrWL1dzrZbDqzG9MAnf3AYM0mDuE2Nc1yXMHuAsj
	68+67G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqv2-0000000GSlM-4By8;
	Sat, 08 Mar 2025 09:56:33 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqtP-0000000GSfb-10Sr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 09:54:52 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 70CA811400E9;
	Sat,  8 Mar 2025 04:54:50 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-12.internal (MEProxy); Sat, 08 Mar 2025 04:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741427690; x=1741514090; bh=hzhNcRtCfxWSACKC/UtPCa8G/XdJxqGy
	TmH3V+EynZw=; b=GY34UcPab4q4u3ZgyuiiGOEBSe3ZPRyWzfdIxpiwvo5BS173
	ir5jRDTAaColjSQLgxNwYuDzg4xh7xq2AejMaJGYhIGfMxwvvALMmbKnUioFuMCo
	UY58TxowS1hLBvYL9wX320hQW18ab2OeyA2T2kqKUMXMIJ2lYiy8JTnxZBi83Tea
	mqD89GA6oSgLJmiCJtu4r0+CwAZTlw2xcmM0UCAhs504zZ7qn8YDkjEcXwdqEncQ
	r380D5nXlMHCWO6uVCyfjxaZvvqa31FHpDgWPAR3fbgXEicZDpUGKnygwEYRq2w9
	cdyI4HoaXrCFKhfvKfsSkYHqw9iKLrALwIe1CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741427690; x=
	1741514090; bh=hzhNcRtCfxWSACKC/UtPCa8G/XdJxqGyTmH3V+EynZw=; b=Q
	lmGl2AWfK3CdyaBWVbRyKwtEcE7mhb/dqOjAbSBGiWo0GOTspQwWM8YapI4UhapM
	82D9ac4aTO/vZMlVCScjxBKl+JjqN53LxovpTOo0Sn+lTicVIB/0yecHV/fnBHoA
	QYyi+pwOxA75THCqSb6iYeuPoNAmCVPxeku+v2F422SeK58NAh1kSrV94MW/jH29
	fugfc9GVfzCkn2EzIiuGDqM8aHyF03LWm2UyzE+EyOP8LEQ3MCMwq3qjJpXHDyJL
	8gN1MDM+lm6G6GmPeiEnoBbi1qKHvep4fkPNg3sxMcUwMU063tEvz5MzXvXRfu2x
	Eb0pO1Mq04PV34D0Ffr6A==
X-ME-Sender: <xms:6RPMZw4BfUqZC77eEAGwtL2yvomJMkDMYVLEeR4W0Bgo0akQtAqZxA>
    <xme:6RPMZx4jCmuQlxFJL0VGNNjhSPYiw5Ywrwkk5vPdRsWBu5xw3sR2vBvDn_8f48bVF
    Q_3OxldQym_QqFvXO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudefvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepueettdelieeugfejvdfgjeevffdtkeel
    ieeggfffhfehheekteelhefgteegtddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgv
    nhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtghpthht
    oheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohepfhhnkhhlrd
    hkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgv
    thdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    hiohhmmhhusehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrhgtrghn
    sehmrghrtggrnhdrshht
X-ME-Proxy: <xmx:6RPMZ_c_5gmt1HFlshi0xWf9s2bh3HDRNENfG9l9jj5bZYh6rJ46kQ>
    <xmx:6RPMZ1KSGIOo2_lpOS4FDWX0eoKJHLOy1mR6QSO00BPjzTWBlra-7Q>
    <xmx:6RPMZ0K9xyDF6pFF2XHGO3psVn4SI4dXT2KT3C7UXEAqIvCyPF8U4g>
    <xmx:6RPMZ2x9057KKDUqC78QsVxDJA-UQcq4_qeyBEgdgUEd3Ki102EoYQ>
    <xmx:6hPMZxAkgPTxMSm3WFjAdmZdQYMZ4EnQjFSGZ7PO4cb6ZMV0S0tepZD4>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 83546BA006F; Sat,  8 Mar 2025 04:54:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 10:54:26 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Hector Martin" <marcan@marcan.st>
Message-Id: <baaf111d-78ff-445a-bad0-277895b34144@app.fastmail.com>
In-Reply-To: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
References: <20250307-isp-dart-v3-0-684fe4489591@gmail.com>
Subject: Re: [PATCH v3 0/2] iommu: apple-dart: Support the ISP DART
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_015451_358678_CCB1EF53 
X-CRM114-Status: UNSURE (   7.24  )
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

Hi,


On Fri, Mar 7, 2025, at 21:07, Sasha Finkelstein via B4 Relay wrote:
> The ISP block has 3 linked DARTs with mismatched bypass support.
> This series adds support for this setup.
>
> (The ISP driver itself is sent as a separate series
> https://lore.kernel.org/asahi/20250219-isp-v1-0-6d3e89b67c31@gmail.com/T/ )
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

For the entire series:

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Thanks,

Sven

