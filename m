Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA65CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 00:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMHUdaciQEUphG0YAP/vw1pJBdgfUfPJFNc+8L14fKw=; b=oxJgIUdhOO1/RO7AkCn0a9VaKq
	GWtn56q+Hesi90vPPPukT3CTlAqFu7uwFTFg1HC4lU2sYq6M/zGZoe/babcEkw5x9OsYxHRSs68sH
	CD2LvGF5LZT4YUh4VGCbjxDcCCWHXhPly13xwex8VbMlqrYRl0FFMdFoJsV3bGPaFxndrgEfM0WF/
	c+pecm0s+aXGsAuSlb/5JuFWwqtOdjpC9ZXvAbLSMQ35ejrsX392R+l/GT5RQrCDdLJ0G1d6hJb1X
	imPL55Oyd4MEtB6BK8+YsdZ5HHU+jYmJUrxk04PrkPz4ExyKwg0YNjApqpeDYSbItQtmxBSUUtVwl
	ErRKSo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJWQ-00000005zxT-0Udp;
	Tue, 16 Sep 2025 00:26:14 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyJWN-00000005zvB-03CH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 00:26:12 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5693E14000F9;
	Mon, 15 Sep 2025 20:26:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 15 Sep 2025 20:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1757982367;
	 x=1758068767; bh=OMHUdaciQEUphG0YAP/vw1pJBdgfUfPJFNc+8L14fKw=; b=
	h+6R8rQMQZMbVkvm/8OpxCafDntSB5HiLMPjv0ycnPhwN/XAwfDBVUkrz0xt43LZ
	Cap4xH0Uz5G30lOf0prvtqtuCLpdbqE9vqIIcfpbkTt/N4MqpDjz2mNa9ECH3E5H
	NYUKoD4VpumGD1d+Sh0qXw/W1SlxW/OWe8XgK8IUdC9eX2ekBXElAflsoIryeHrR
	3eo1t2wWr7RamCdElyHbKH7u5DmgZAx4oNU7fr+IUicdcD78tJqOGNAowEv2AzJg
	3UVLeiqkStup83o0YZZFTqnT3HK9q9dn2hmIoSsgCUvJz78YkCIoRKpQVUkHbem7
	SMUJbMLZRjXl4M4uSSjtLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757982367; x=
	1758068767; bh=OMHUdaciQEUphG0YAP/vw1pJBdgfUfPJFNc+8L14fKw=; b=g
	Jnc1JZRxWDrJ/YxbKbUTXHzuXHnNO5Yst4vX2QRGSHGD1OSWjdmpFs63+e0Odi0I
	/IPprkPLQKUSelb6qnejzjwE9IsG/kZ6e8+zN6xz7NoVV9FeY82mOyVMuOG1V6oI
	XbN06nZFFjz3+Q2smFVTNqReeG6lH71C12yXp3XyUZAzM06PUd/mq51aihr8xFS8
	OcmTfmlQ+Jb2/JKuN6zFyTzXx/UW1WToJyrPPkFKPMJYfu5wafrDczNpjYPNdQij
	alClrGyMsU4R1Yav9JNJ+ix5pZLmnvLdESbzCNcooq03sTtXMKIV1Wm/MdqLl4Hk
	dcx5darB4s6TF50ZFcymA==
X-ME-Sender: <xms:nq7IaNC8LclF1Q39bRVq820D64NwFTSsMh9yGIhvRyzrKEuT9VgaAw>
    <xme:nq7IaKtfp_9tdRuXbQSIcuNnTb674NdvHWGB_yot10CrGqw-J9kEPLDuNVssGVNjy
    RPE5UXKxcfkZ7nuPqM>
X-ME-Received: <xmr:nq7IaLTIDHMBwS5kjupfqID2xlaCGoENQr_iNK29R6HIYs7I2dCxvyyha1fN9qq7A1jMJdnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefledufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnhephfekvdekvdfhtddvteehueeuleetjefhieehjeeuhfdtuddtvdeguddtkeevlefh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfies
    tghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:nq7IaBJmBF_j__0JuQ5MHQ-LYvwEytGwCYotXI2b9j_ksMMQ_egk6Q>
    <xmx:nq7IaOve2U-arkChzWhmTL7q5MiUHiNFTmBFdiC33dB6UyVEtaPaEA>
    <xmx:nq7IaI-iOU_nq89e4WIck3KrOlT1CYuxrI7QOLLGqxZ-LNXKTkYV8A>
    <xmx:nq7IaI2CaYyDTUeKRkO7g5Xj7PEG49K-HuXlRy3fABbX7ctCrJ5toA>
    <xmx:n67IaMD7FtHuDwd1vsvSnOTu6SLrJYS-MeUy0frF1-abbsf6-RuIAB5E>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 20:26:05 -0400 (EDT)
Message-ID: <5ccc4945-87f6-4325-b034-ca3f2f90257a@bsdio.com>
Date: Mon, 15 Sep 2025 18:26:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250911051009.4044609-1-rebecca@bsdio.com>
 <20250911051009.4044609-3-rebecca@bsdio.com>
 <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <58a092c5-5dd0-4718-831a-e25ecb184087@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_172611_451575_43582B33 
X-CRM114-Status: UNSURE (   7.47  )
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

On 9/11/25 08:09, Andrew Lunn wrote:
> There is no phy-handle here, and no mdio node in this file. What is
> the MAC connected to? Does it connect to the hosts Ethernet interface?

Yes, it's connected to one of the host's 10Gb Ethernet interfaces.

> RGMII pinctrl is referenced here. This opens up the question about
> RGMII delays. What is this MAC connected to?

It's the AST2500 MAC2, connected to the management LAN ethernet port.


-- 

Rebecca Cran


