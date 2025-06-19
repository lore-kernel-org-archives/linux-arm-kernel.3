Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ACEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIqWDwQJOYSkV3+he9XfhSJxreNYHuyVwziNAwlI17I=; b=IuEv31l1ag0Yayq5JvvPVgnTe9
	VHOnm8MUOnuK0xGF1mxf/Y3tUemDqDSDkbQ2ReuVMlhW1yf6ftzLvQdZDSZv676xxPd+Xx0LsKiJh
	0z7WRrlvPefQBIqGc3IHkC+zTXhOcWBE4/Gn+0mVYxZMetn+uttoBu4JVmUnF3nXlKmcwg0OikJa9
	HgccE+Cl69vzDVpveamchKJiwbSSclB7UnQ1LFnlhfvj8Gg6Smq2WTMa1PluAQWiN+VJM+cNi6iEf
	TxCtq65lHYQh6pMFL6tt2ZA98TRi0koZA/s7ZkYUoED4504X0ywLzxUKSmDQCEez5KcF2ydvpGlJ4
	7fFfULCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWO-0000000DZBa-1cxH;
	Thu, 19 Jun 2025 15:49:48 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFNn-0000000DBaI-0rR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:32:48 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 788AC114012D;
	Thu, 19 Jun 2025 09:32:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 19 Jun 2025 09:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750339965;
	 x=1750426365; bh=fIqWDwQJOYSkV3+he9XfhSJxreNYHuyVwziNAwlI17I=; b=
	CdcwNBhJeAKWAAovkzBYNPKNGr4TEWVw6rj3W6mDKB/yoZRPciocJ1zjT2P46nMr
	Bm3Z4otQZtwjiQexV2GzJ+gG0k0JlfjEA9hRYeRskOouecrWiWQQP7MmNfmgfAv8
	u3bpAnP2dh2KGBMJ5aFQ6hfVpOftsHZI2TR+FtQDuAXRion657VpzmPCXMCB/f5K
	U4TxHPSU/4u0wQxP8WErtWNti4ZI0ne8J4yhdTjoiLiGFuB05b6RzyDZ/JApCWDF
	y5JbjXYirZwPnZ+rT9BDnFhx2EBCP8gstbdYYwIac9bA2kI87U06ZcxVEOxvE8g8
	afMrYi4FUSn22KIvkVzMoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750339965; x=
	1750426365; bh=fIqWDwQJOYSkV3+he9XfhSJxreNYHuyVwziNAwlI17I=; b=R
	54bhBGP083Nplo9mRyI6LLQYfMrq7ClZiKrPKJQ1crjnVU/8DKQXq47woSIa7bz7
	OPkxdA/kG22PvlMEwLVt532UpDlxq4Cfc1LQY/67J7BHV/G4CQnOEIYjNAQaeGt1
	ZPWCtgrsEkiWRM5Tfbr8+RALlO16dBU5JKb85NPBVdt7KQnpUa5BsQsVrt33xpQj
	Bm36FxIWPDC8UDUnvdaKxnm/KO+c6XPfOYg+zK15dT3/kVAkdkSwIGA7QfpuQFFU
	MTWJbePn1pXIjN1C49Jq2krSuGC+8Y1N5cy40dhb3/zQVG/VLm/ti9su8j8yy4jB
	vNL7AROwO0NNBk26fDaPg==
X-ME-Sender: <xms:fBFUaNvSpnp-EhufqloOUHQLiQieLwkChRFG9yfKGzi_GPPsGg6OcA>
    <xme:fBFUaGelUq4ZfefOqvPegeRT6QOlYtjWIs6VQssPu6OyjR89LdJFNAbcKLl7tEvY-
    z6T4GOkNs5EtC17QJY>
X-ME-Received: <xmr:fBFUaAxPHz408tTQ6hNN1DeQblAr0y2Lw0stQpN2C3YIIXjtheiLAX2cvpISN28zfXC74HEgSo8H5_3pwUWvs_J72MPsn2EIag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhlihgvnhdrmhgrsh
    hsohhtsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrph
    hinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehgrhgv
    ghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuh
    hsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:fBFUaEPcTCAJjTMhuQPeAKRqr8-crCSxF6X7ohD8wIzgWrvrIDK9dA>
    <xmx:fBFUaN--pTLgTd9mUviIY71-5Hpge0k6Q904UTNihMOSI7zfz7vmUQ>
    <xmx:fBFUaEU7iVIZsRtcqPWDThTDAxz22M_R1Tb4UTOecrbJBX1qEL_voA>
    <xmx:fBFUaOfL51uhInf9I7O-4xveJLthYQpPoya2H6p_YOro6L77Q9ircQ>
    <xmx:fRFUaCvcQhP1SJDti5X9xE47TVcuwCm-5SqDAZHI1nuAMdwdD_9dPA01>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 09:32:43 -0400 (EDT)
Date: Thu, 19 Jun 2025 15:32:42 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH v4 10/19] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Message-ID: <20250619133242.GC2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-11-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-11-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_063247_792951_6CFDDDBA 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Cosmin,

Thanks for your work.

On 2025-06-18 12:58:46 +0300, Cosmin Tanislav wrote:
> The GMSL links can carry power to the serializer when using coaxial
> cables.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 758c0223977d..b345305acc4c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -96,6 +96,10 @@ properties:
>        - required: [port@6]
>        - required: [port@7]
>  
> +patternProperties:
> +  '^port[0-3]-poc-supply$':
> +    description: Regulator providing Power over Coax for GMSL ports
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

