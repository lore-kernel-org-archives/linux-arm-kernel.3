Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPBYFiAweKzLygU/co8iY53bvVtiA5upX/HaNd3eSYM=; b=tJrtQXCPzxIIat2ft7gNVI6fzy
	k6RZNGLwumCFAGENqEbMFuOT4rjNTrxQqBk7f4RHLXsgDjzCpJqMavzYEB/qCsXnlGUL+HtNu6Ujg
	TXYuse0rPgHma4317FJ8fjbHephFkq0pjMlA33zWUFC4EZKx5wFIZQhfeMwycy9N3TywPCPi+bzk9
	B9IHYLcDbASdbo/bskhJGAxThztmF5VD5vcgv2wpa09fTlVDrrEmLwPuvOrmhBYq35ZtBR+TnDQk7
	tc3lyz15u3g2dnsCoVCbvaH8lIxUDM8R2uj2qJ6PKq/WeE1u1M4jM5g0QduXCDHvtIVe38E6SQphh
	nWMYNDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6pt-0000000Gk5T-4C1d;
	Sat, 15 Feb 2025 01:19:14 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6oR-0000000Gjwk-1R11
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 01:17:44 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id DB3D21380105;
	Fri, 14 Feb 2025 20:17:41 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 20:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739582261; x=1739668661; bh=hPBYFiAweKzLygU/co8iY53bvVtiA5up
	X/HaNd3eSYM=; b=Hxhx1nkyQ5uF4Ow8rzokIProVSGAzqzyB2NygjkCRpoCVBhZ
	1zVzXpaNJf7Y8ZTxXigS6XFKUUzjC3GfH3xek/2PfeWnL7TDRV5Q6ayGkMs9gtA9
	wVINimPihowRNxpNm8jRSxPDMpmC430ynzD72FUnIY79Ojtea7oev5d9Qf62cgR9
	hW/VOW+R+aRnw3xYNx2NM62SpU337D2BHyIoLkiUAVYSWRvH4hqoTOIaaqdHj1Ts
	k7WPX6ee6sYAaSzCnwMMupQjtuiioY6gSKrQssEdbjNafCz0qf1Tr/pXJsvUEpfX
	9LMabGfXlLZbZ3lRgpPFaDX8TBa+mex1AyaBjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739582261; x=
	1739668661; bh=hPBYFiAweKzLygU/co8iY53bvVtiA5upX/HaNd3eSYM=; b=O
	N1iSdRXvdS33leQGOQaUeO0XVj2m2kBDw5uabBTwFOk0CBX3nzgnDiOWswKEkRXY
	GBzkrLObdjw2LipUuAlOMn92f8sUGL2acPODzuIpboZCtKVfLDXkokgDB/LAoRn2
	GMXDiUaWdrPlPBWKBvrQA46CFdNxW+AeeawKUNQ94H/GzfQVyG7cSDn8ns9TwQW+
	l7QfysoX1fBvNeQ0qUlBNJ0OpeYDuJ0iNf59xzfvbn9z2Kv42cxhxpighdw4/tJl
	EIwqeTjqN7KSqFqr/ACxJySbDIazfilzTREqQtWHELED7ksCcLPbWMCTI+1xQmkW
	bnkIlJeD8L+95EXKXr9QQ==
X-ME-Sender: <xms:NOuvZ2m1JWa_dM05Egspp3NUZb-EucncXLW-5xIUpVeFRacklHev6g>
    <xme:NOuvZ92vzPEfdL9w4jp4iBIbxu7O0f72N6FJjzUF2BlFR0M9laStv5yD7TDPn5TH4
    EAXfmXZX6RV4VheuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NOuvZ0rHQ5e6sbUBcy5t76b_C0Oh9jpZPxrjuqVep3FaomZk9Sf25Q>
    <xmx:NOuvZ6nCA3aM90ZVzT1kDiyuXOAwB2Dh-IrQIUGwUepb2rLDvgY9QA>
    <xmx:NOuvZ018jd52c-TNbNxRaEwu8LWYEJM2NyqATFz_jKlk4Co6Yg7wOQ>
    <xmx:NOuvZxu3zb1RggKnd4ZY63bH8xdgKWrhQb0bBhkE0prbt8LYZOnO0w>
    <xmx:NeuvZ-XZ820qASIJ3wVhpgyixDut7xHJznx1iHQ5tg7f7AoKOECLuVEd>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BF98FBA006F; Fri, 14 Feb 2025 20:17:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 14:17:19 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <40fdbece-009e-4c7d-85e9-2d2488dfd91e@app.fastmail.com>
In-Reply-To: <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-2-ryan@testtoast.com>
 <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
Subject: Re: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_171743_626286_4CAA4946 
X-CRM114-Status: UNSURE (   5.49  )
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

On Sun, 20 Oct 2024, at 3:11 AM, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 10:04:33PM +1300, Ryan Walklin wrote:

Hi Dmitry, thanks for reviewing, and apologies for the delay in replying.

>> -enum sun8i_csc_mode {
>> -	SUN8I_CSC_MODE_OFF,
>> -	SUN8I_CSC_MODE_YUV2RGB,
>> -	SUN8I_CSC_MODE_YVU2RGB,
>> +enum format_type {
>
> enum sun8i_format_type, unless there is a strong reason to name it
> otherwise.

No problem, will make that change.

Regards,

Ryan

