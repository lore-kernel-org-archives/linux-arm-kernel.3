Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AF5C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcVd4OhBl6QFD1xyeheTB76pxiiwWJs9iW8l8/CM7SI=; b=hF6FPvvS6R9909FV+GmE8G6ffE
	z2bIFpJfsbax6UNI6M4m9zLFd4OSYWaHQ7sXjMPOaXLCHFlgNoIben71E57+PCeTyDgDxHV+pmhKF
	FE4pr2RwgnpooSdc+CZcWwe+ziOkgZX6Mla1KfejNx2VP3XD0cScyfT/d3F39lBq/bJ1QZwmOIgwP
	qpw6JxNPLFpfODmF/foLrYbiq886nLkOFcdkSEpt70iI+mhzAdxylWhOd4onHRMWNzP/cpcp2z1g3
	XN54GCg8h4QIysNrdBoiXIwaXNZbFD01ftiUfsSiBQusWK5xSJJLCj6gcqnN4PB3WZolL5t3PGUtI
	H4dOU87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQwQ-000000093rQ-27d0;
	Tue, 18 Feb 2025 16:59:26 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQtZ-000000093BU-4145
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:56:31 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1D0B12540135;
	Tue, 18 Feb 2025 11:56:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 18 Feb 2025 11:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739897788; x=1739984188; bh=kcVd4OhBl6QFD1xyeheTB76pxiiwWJs9
	iW8l8/CM7SI=; b=icvSl3XnvftL/NNUY29qomne5qMgfkYZt8wMlD9gq058w9ld
	c4uhTBeL4edDmaZYFbdunBT1pL7FY0RKVvfM10Or3w89c6NBhIIKK+mh8Fj0tqYG
	giUawLFi99hEE+JOwUm6RFF1KHYYZzZqf+3r5js9T9myH5A3mfHz6uFz72NAaROA
	xNIvyTTccIFTVJ+xk4e9e1i99nmjvpXSUe+gi1Nt+a8lowKGqfF2Em4F4eyZcsKS
	GNTa5ZxkefnP/XCfYy+JdQqd1Ex1Z/BAzGiAgw7szu6/j2NdLZohNceNFoPmQZFH
	T8vNwFuk5ACCAOHbSzMzaoySza2MQl6iRwWG2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739897788; x=
	1739984188; bh=kcVd4OhBl6QFD1xyeheTB76pxiiwWJs9iW8l8/CM7SI=; b=A
	5je+2XKOUDg1axCm7tUPQBAQyadz0TWCOdEzfFVg4pLYWkLFrc97C/SHYP4AUcpG
	5FUoVzMGLkYFWeNab+8slJ4ND59IhriLhmQz1ivgTOv0w2PO1omifWHf92hQmQok
	qGhCwFOxtc3AUrpihsAzsDI3IEv8FT0CQ6ZDb1X+Hz9KYSBqIhANRlSKyIq4cHcL
	91LargTyQDt21Uu+HbkCJvlkWWMyTDfurazynLN/3IWOKIRAmTRVfkWIS8xPNdq+
	Feak0Sz0Va4hyoHvk7J4A0b2s0KSXIaQf2AJRXbnrPbLYM1cwsrRYkmEXRm/VIer
	K7LyfO104Z4g4/pj78k6w==
X-ME-Sender: <xms:vLu0Z0fYI7c_7aguukxwy7hmui40Q4LVPUrcDXGc2M7Nb83A73no8g>
    <xme:vLu0Z2P8_Gk-TUHZdjXMSr2R9mnw6F8hyl2kQOSr_871cxphVf6ARDsdqXFmukftj
    O91ETVJmQbBv-AMimA>
X-ME-Received: <xmr:vLu0Z1jAHOgDHuvghuUuGrJeRUm_625kgaDTzl9cnabqBhkaT6CAY0CtNQcuh4TcMJe818grpCAg8jMfKWVa2Bv7nh4uK1QgTUdEA9HKcRUT0B1MyM2xR7iS_knzEHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruh
    drnhgvthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehtoh
    ifihhntghhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehsvhgv
    nhhpvghtvghrrdguvghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:vLu0Z59hEI9YKaEODgQN5vtSiKpqMGA9YIXHA4jm7JFtp_QNTZ1-GQ>
    <xmx:vLu0Zwsvhr6XUY9yrP9yQFEhRczd7X-Gqzs6cpOXOFHLDLKgWqjzqQ>
    <xmx:vLu0ZwGGcBbVHgLg8KcEOvLSxWS3RjCATnjeaDIew666c1Z59je5rw>
    <xmx:vLu0Z_OF1386C00OpnT-Q3KlHuUYRYDe4vrAvwk2Eo2cF_X2OWuyLw>
    <xmx:vLu0ZxHpjJ2XmT1Yd1zt4xFymjIAf7FhBDaHe-q5d7ZifjDmxHggIzMW>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 11:56:26 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH asahi-soc/dt] arm64: dts: apple: t7000: Add missing CPU p-state 7 for J96 and J97
Date: Tue, 18 Feb 2025 17:56:15 +0100
Message-Id: <173989773060.49326.7671492051197942178.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250217-mini4-cpufreq-v1-1-8974e90dd806@gmail.com>
References: <20250217-mini4-cpufreq-v1-1-8974e90dd806@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_085630_053176_D71C3A57 
X-CRM114-Status: UNSURE (   5.03  )
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


On Mon, 17 Feb 2025 14:10:05 +0800, Nick Chan wrote:
> Add missing CPU p-state 7 @ 1512 MHz for iPad mini 4.
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: t7000: Add missing CPU p-state 7 for J96 and J97
      commit: 97aeb6507356c72d87fd93f45705d3f4b1a05d14

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

