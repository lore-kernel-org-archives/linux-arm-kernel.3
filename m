Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0C8C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB0MMcjFsZwMY=; b=NB3Lpn9IuLXwTdFyayQi6ejnxu
	GYAUxukanJzAYlBkfyUcj4LS5stQJp82qpKqXYQqzrm31/ovvRUHDt0ZCnJFcMq/2wv8CJE5YH61s
	mUe+PfuhxfYfUsnxdAkIiL19IrrkaqNduuhSvjFtV/NINql2PybaKJXH06UO/uteomZCMr60jN9mP
	w3Y9G8XShVIIGjQXV3uqKWp5f59A/tu0DT7AmLHfZz2waPe7A/rK2ZQUhP5toWZXz8NUVppJEhrOc
	8kpIO6quxfxMwRq1X+3U9ffcU8/lvo7T3i+9peZ7jONIwz1cyMFfvoAPuydze6k8aGYHSsgzlwqcR
	a9DW7eUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7xO-00000002MIB-1PJm;
	Sat, 18 Jan 2025 12:29:42 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7vE-00000002LmB-0JeN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:27:29 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 694C11380166;
	Sat, 18 Jan 2025 07:27:27 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203247; x=1737289647; bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB
	0MMcjFsZwMY=; b=gcTu5LJMrhbS6jd1ge4FqEWhIP1HHSAEd8wKWqZQOCJeoV+s
	Wj4T1TJl3TkLOpfGZd/kJoDckC+9V7BC2fWqJ6mrQ4EvoXgXIyteo0y4G5y2KG0h
	yt4zIXzv+HZRhZ+yZFSLtEHG13gz27kVmhb9ntM6tk1yq1H+s0VYXt09kIGjr7CN
	r9rI9+drffRBQ7KzWHr9AycdmTb6kk7txMTks1ymIXi7l5sBpj4b2ACoel74xylw
	9cOXpBXrOKtKDYlvfoqVM1/BZqcDKjkGrWWx+f0ROSJJQjNuJImDaAOf/ZoVtvVI
	J4oMWWQ88wZptRITNKId6wtbGHzRp+ed0KWJdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203247; x=
	1737289647; bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB0MMcjFsZwMY=; b=X
	qRLoB4QdQgJA1MqU87Wyi/CZ+Mecf1DUbZFJKmlJv5rPPOgtE6rJpbVS3JixlAu6
	29Faxg3CLvfliMBAsKEELk8kwq0ES5S0xikdiMjnosvSEB3ieXHTTQKcRTig314t
	xo91dAEUfIT49LAJbtTLwATwi+qv1tJUSJ8ZVwAHQFqZx9vYvO13V/L6t2JxU6lO
	jmMfcpgoXxJlOBY2FJskaghbTqzGdmO7SuYkWS6RqAhSjIVuMagnok2yERD9Rd3y
	sSiqAzwqCUVLbrBahqvYnXUf/fmEnb9ux6vL05gZcCROJ5jAfDXDkX/YetrOYSN/
	dFaeRZMNOFAdYQmngx0kA==
X-ME-Sender: <xms:L56LZxq_witJUthDw2sjgsQVNrCPkj5Y-87wD9oizYlhZQMvAVYhUA>
    <xme:L56LZzrWipncYyby7NrFTUxKukKhm9UXncN9IZJERhcik7wfU4KZLtLKDTzJH2nbW
    hj7cZHekXxcMLGVRvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihuggsvghrgh
    essghithhmrghthhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilh
    drtghomhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehj
    sehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:L56LZ-Oqbd3b5qsjvppwnb1oGrKETaIu88rEpJp--KxfOdcj5NM23g>
    <xmx:L56LZ84gYXeaYx7bIYMscoR6nC1F-wTfXSMt0SHAFL-VUZAmbTECTA>
    <xmx:L56LZw7Q_zXWKS8GDjphgsi3f96b7EKRqtKdI6awnK5UclbyNel45g>
    <xmx:L56LZ0jGpkSjUfIxa0PTLvf2a6rTDV-ohbb-gtZ346iz7noMz1DB5g>
    <xmx:L56LZ_TmrZ-q_XPyu1jPX8HL520IWnq2bpTH1uFjeXJEyKQtyVVFeV8g>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 245E7BA0070; Sat, 18 Jan 2025 07:27:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:27:06 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>
Message-Id: <ba754230-7808-46e8-98be-314465fc0584@app.fastmail.com>
In-Reply-To: <20250115-z2-v4-3-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-3-d7361ab16ba0@gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_042728_184600_791EFF47 
X-CRM114-Status: UNSURE (   6.18  )
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

On Wed, Jan 15, 2025, at 23:46, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Adds device tree entries for the touchbar digitizer
>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>

Thanks,


Sven

