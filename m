Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B7C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcU3bh0Td9K939Ujta2kcP5qxUMjJXNGzp+UHMOQHJA=; b=VRKjKWHo8YsfDssX9nFMydqM7d
	ADiHp8KPlhHLq8+FBrjbmRuRPAq0YXaWSTlPZ2VmfsgGvAq6kfiGE2ViujJK7gfcZRhmAtsB5jp2Y
	/MO1zSbS62L6gu8lrRVINhYmI2a2XZOK4srWvSNEJoQdnb3CEk+f+4bLqKIAlvBkCfMwU4MdBnyrp
	Il7MLqDMwJxPTVRg5UxhE7xb9xea5eVBCjRldQkPU4nQ2AhxaWlst07D5JyXXdqn+B9+WGosxurDq
	nebu4Jr6pKROT7o0F5V5BoE+jqhUCwLOE/Qc5S1z60PCiUJbrulAm8JYzzj9mGUf1j7hk2kO/NCRU
	C+h9m8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7yd-00000002MZz-45Zd;
	Sat, 18 Jan 2025 12:30:59 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7wb-00000002M3Q-0u2P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:28:54 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 89C3213801CB;
	Sat, 18 Jan 2025 07:28:52 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203332; x=1737289732; bh=zcU3bh0Td9K939Ujta2kcP5qxUMjJXNG
	zp+UHMOQHJA=; b=PpIhHRwtIV1ldVpeF8k2nEeAWepXyEtSMghRgH/3AU1OLQDS
	J2dALAs2RCETq0MieEiKQde9YL/rQLqn1q+Uo5KcvVWB5kmrNh+xETf8i5SknumF
	hGxmDGEHDIp7Er9yCDpbszIaISE5wv7I5hYYAuUIhkFKKWFIhnfaVK0tnpykpVzG
	xHlCYg6ESrorij6VnZYAXO+6PDocSixOPvKyLRkrW15P/ORmPmr3jKCVYnezFv7M
	I5vAEL9qOyBr/lEe0K1Cfy8ARdzF7VEVNTGrVOzlGqWhvdzA2TxTyxL0K5PciV3y
	S4WdbrGLWu9cBM9qLX6cZA/f209wRW8srR4RRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203332; x=
	1737289732; bh=zcU3bh0Td9K939Ujta2kcP5qxUMjJXNGzp+UHMOQHJA=; b=b
	16TOA6wuGADPx6lSClZZ/jLEZvKuZiBA4YbxCaFf6RN0eu2EcdPjhX0GhrTBQsFA
	W7H3ZlanUnBJu0KZkbywJhmLZTsN70LsLndUR2XcLuc5PnQtgQPAltteyZCRbUav
	Fv7v0Is+34Jm3+cjWStjm06fd6nxS9h/54lylavZc2WEk5otktkoXMrhQBmqgO9T
	XkiiAz9/w3s8hIcuCVKC2cw1QgPFGna50wmx839MJJ7lHGyAxf1CzsRfb0fRpqah
	0TtUW8uWtbmEp7enmnhdPC+Uf4+TSnHV4VwZhMR3ab8tREB+XicFX7t+TAF4hVoD
	Bv15uJB34r3V8KOD+tKbw==
X-ME-Sender: <xms:g56LZ5cjVxqkHRBfoDR_1g4qyDsveSxMcYOIBLOj0xV656RkWKgeGQ>
    <xme:g56LZ3PtPYo-eKFJ-b8l2k3yZm5AhBbBsUUOO9e6qKQzWR3fbcqUud1ehXMLI4K4c
    0tCsXZMTXOgMSpSYG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhhisegrlhihsh
    hsrgdrihhspdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthho
    pegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnh
    gvlhesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinh
    grrhhordhorhhg
X-ME-Proxy: <xmx:g56LZyjEFxeZe2qYhJ3oU5wZQHDTDzczvDxfHhrDqDelWHdpdHtrjA>
    <xmx:g56LZy_hHfl_QLoD6sIrpCAykPiohLmfVEJ0WMJI3vAVAWuQYEGsoQ>
    <xmx:g56LZ1vfoH9NZQO3DYRZw3nJYO76Aj722dKQ_lkYptShwifUWE7Bbw>
    <xmx:g56LZxF49TLfXmDKVUZbhDSvCJh2ZyLGiqpNrZ3UkE_f-GdL94P0xA>
    <xmx:hJ6LZwn0bti_1Z1O7mj0PbM0JyGYdgISjzrqGBIRUkTBxbMhQOe5tvcX>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E1AABA0070; Sat, 18 Jan 2025 07:28:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:28:31 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Alyssa Ross" <hi@alyssa.is>
Message-Id: <e78f5268-f0a9-44d5-8dbc-7ef7f26278d5@app.fastmail.com>
In-Reply-To: <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
Subject: Re: [PATCH v4 5/5] MAINTAINERS: Add entries for touchbar display driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_042853_335296_8B354F62 
X-CRM114-Status: UNSURE (   7.67  )
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

On Tue, Jan 14, 2025, at 22:38, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add the MAINTAINERS entries for the driver
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


Thanks,

Sven

