Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CC2C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBQaX6usdhvuzJxt9TKGHGOwd1AovcnWdd6AKE2CtsA=; b=n74N+pgfiyGM7Hi+Y+gtRTC69/
	M4dBgCkQfy9BoKMWu+TQ2AKpyzuBnZpDEFU4vZFOe0KsuY9/YxxGbEIcWaAjNHd0jsjhLEds+k3bY
	P/wY5xIKcaSEXJtKxYxLeWd8xuZWvt/yiuYDq1Rk18ViitAQFq+Yj0PJz+6YdRHY3Og1Przm3Um9H
	YNhqSKNCLsjFFA2SKKHC7y3ecvCg+dCh4D9a+4aHJF84Zobkd9LPGZcTxoCNJYHOq2JTNfQ5hBk1g
	FTFaaM9E7UQ7KcTVgFD0P/WRfH9B/FMT76LoMgEl8JP1xGAyhzBDOchsnu9ndzIReAtP0XQGSxp7a
	BxdKXCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0Vl-0000000A5th-1zuw;
	Wed, 19 Mar 2025 20:59:37 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0U3-0000000A5op-0aFM;
	Wed, 19 Mar 2025 20:57:52 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id A92C9114008E;
	Wed, 19 Mar 2025 16:57:47 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 16:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742417867;
	 x=1742504267; bh=HBQaX6usdhvuzJxt9TKGHGOwd1AovcnWdd6AKE2CtsA=; b=
	Y3U9stg7L1Fvfl5tP+f2BIWNxWWVW5b+XvzccjxM5viokZMXdFHIYCilADloh58S
	SCYtVAvNEKA2aYxiprSoyIlNNTl6cI7boUawoHZqnKQIw3OhHdVMuqCmUyorgtIf
	70ZjKjjdsK/wWj+PxHgDW73BomaYAUJAcidjjxiB8Sa2M35Z0IXK5f5jx4BRqZia
	VO/+i20HX+hbJLgm7Jy9kK/CbNqDlIYWSIBSKjR7GDn7SpxKINQWRE2AHxhWiY5C
	tCsBGrnAEgCi/hJZ3bszjwppm7LPnuIHUmC/QeomIL84WUtqNQMiemgD9mVPEGdc
	IWAgQd8uRZQE30LxTouznw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742417867; x=
	1742504267; bh=HBQaX6usdhvuzJxt9TKGHGOwd1AovcnWdd6AKE2CtsA=; b=b
	3vwGiTDMtYSBsKz34GB5iokG2K5fYzTdfEpMUJxLuod1zww4FMk69r3oVRtg6jbp
	vpFPYEZviPElLob0DfvlcTbXjgTZbpa0d9JtHBJp2wdH4wrTseKTRh7WCrcTsPIk
	P5LjpIHJ+ntTroJJvi9cJUMA8m1AlFATfWYeQlHmdqVBhd4M0mh9br5eTxZIAIr/
	Hq796XvYUcowIoyLbTHf6wpD4+yULSufrzz+knLTB/O7xMtI7LSLJcRU2SEegGHk
	q4IYAQavRVzG1S7x8RrbmQRTLyHmwH9tavIpRuVe06Lfcr3U2x+aVe0ypvhjiFTt
	EpF1HGXVNdrWS+8iRfSmw==
X-ME-Sender: <xms:yy_bZ0Ro8AKP90Dnn3cx82OgcXZJA6IoTHCmJ2Sfs3B-QOa3a_FonQ>
    <xme:yy_bZxyZr5ydY9o2W3Ait5DFtFry3Ls0bhTgd-lKxtlU7oUjtgfyhSvb0thni1_B4
    WwXKHc0-vbx8B7d1eU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhl
    rdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grmhhlohhgihgtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hg
X-ME-Proxy: <xmx:yy_bZx2xg99sRZ9LVUvC4WvR7jrZa8Kj24vDhgO-Ra1rf0odXTZUBw>
    <xmx:yy_bZ4Dj0S2SDPqefK-Fer9GKjWsFosQVmdXr0Sa4QFKIAydV-gRHw>
    <xmx:yy_bZ9ihBgsrPkPiIzHMNVe3YwqiD4_S5hSI-oRl1olTAr1ITlpP-w>
    <xmx:yy_bZ0qVQavu-oJxO9eN1zr6JOVGDkucIY0r7wWybtjpE0aepZp9xA>
    <xmx:yy_bZ9fldrYOTNY9XYK7C8UFvg5CkZpbF1lloWWiVfaV7IgDNqDLSutD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA0922220073; Wed, 19 Mar 2025 16:57:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T9389b2994c5a6e59
Date: Wed, 19 Mar 2025 21:57:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, soc@kernel.org,
 arm <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <47683e40-aa0e-4d86-9226-94f7d56f34ae@app.fastmail.com>
In-Reply-To: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
References: <41ced8db-caeb-4deb-9193-9802fc603180@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_135751_643539_31B32308 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Mar 17, 2025, at 17:13, Neil Armstrong wrote:
> Hi,
>
> Here's a changeset for Amlogic ARM64 DT, also switching to the new PWM bindings,
> adding pinctrl support for Amlogic A4 SoC with a brand new binding style then
> finally gpio_intc node for Amlogic A4 & A5 SoCs.

I'll skip this one for 6.15, seeing that the branch contains both
driver and devicetree changes, which messes up the way I send
the contents.

From the description I also can't tell to what degree there is
backwards compatibility in the new binding, I assume the changed
PWM and pinctrl drivers continue to work find with the old dts
but not the other way round, which is why you sent them together?

     Arnd

