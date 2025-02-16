Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E4FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJiw3aqC4IqVc=; b=GPiDnihy+VYy0CaJ+wk2G65bGC
	GAOWohmrcHikAC5kv7zMzCE/VS7ZUNOR9ZTtstuoXYr8/fOtDEXqnG55hFC0afY5S+AqgYvPm0trO
	qcJUwrbXDmgMvPDr4noxKq7b62moNJnd+GVAAzlg8vwvJckZAaeLDAf6U9Uw8nNq7YxjrzwN+nzzG
	neendA4YSOzK5g8sQ7EVF+JHGwydwsWSRUq2z9gfFiQJTCnAwpI0Sege1VHZyPsGwEUlFk7XMDkgo
	hiubpWDbAJUeXN6ws7FDSlCU07dLDvdmW7PyCjZASAp7S83Gj+g47uKGyfgCa7/cMT5p5MpVYjD1L
	8K73hXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjQZ-00000002LBq-30j0;
	Sun, 16 Feb 2025 18:31:39 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjP6-00000002L3d-0aCj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:30:10 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8626925400FA;
	Sun, 16 Feb 2025 13:30:05 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 13:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739730605; x=1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJ
	iw3aqC4IqVc=; b=N96rZAMeR/tUe1AL5usu2jp9nGe3Hyfkkmq2eCGoZ+QLg6+h
	UzflLhFdaWXIo9en9Uh6fJCfEQSFkZrBwjJDCV74sP88H3HDnAK8+JR+WhysOkSx
	2sOET0FDZBJYqGyrH64XOlYiZVgCiitOeXnyJU0qZ1p758FRu6BiZ158Ss370JWh
	mKszyRDylBeSVqEt/+QpxNUw9TtC0tDIdU1rLKSd6Ln7qKjalkJY0ImXyPeI2rQ1
	PXxfWVANvrPl/JEtLYRKHXwFq0/mvxyJTIMDUj07gczRW6E1UJpjLid+XkC2j4Ue
	qPQyqOt83d9/j44XgfZmEgFCxrfwi4n0lXnaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739730605; x=
	1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJiw3aqC4IqVc=; b=M
	sEAHXpUU72PiET0Jr777/O6d8vZatx5/QLX5qDqIHuCwYZGGrRVA04SK3Si1ZlP5
	Exb2EdCQSZHP7yi1M54C54w5a3+W7qi7YZ6QnbnamcfgydNnn4oAeUrjYW+RSz1Y
	WIZ1KmzDVBURD8zGzSNwHbPTsABCO01J2lLsDGn/ThskhUbRVsC4a6XezRqtLfkW
	ewdbsff8/74+92c3K7LHZkeYrGlTlqdk65xE+tQGBjJSp/czF8gVxQRn3yLNFH9d
	opTIhG9Xy00/ixR22sQ403ct8v70+YupNzFznNhB9UdjTrRL02oiSwBX9fPKvWds
	WCSdut4RaBpLj/uRJWNvA==
X-ME-Sender: <xms:qy6yZ7GnieHTpuii2ZvseofaO8cOaXH9sCXG_09uEr1uTbOQ9r7jXg>
    <xme:qy6yZ4WIZxFsjqipW8-m7u1kSE_9HtFMSEgYk1NuAIQw08YKd6zX8dkbB1JLAw8o6
    -aEMAC4pFdHrRDfHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdr
    tghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:qy6yZ9L2uJVrlNNxyA26MmkE_CckIKK8KW3gsJR_gOurr6rPJd5p-w>
    <xmx:qy6yZ5Ev_dfVnN6se7DIqZk41wHkglkiTy19z1m1REKfSwHfZcqMQA>
    <xmx:qy6yZxVLeUOyv3pb7foJV63NVFMaZ0JT_sG9JhmSKr80BOdk5gnh9A>
    <xmx:qy6yZ0NyXKLBPTt7UscFwnUZUUQHACsICPODfhUJnJ38QpFEKtolcA>
    <xmx:rS6yZ3FuSdzvqzLJIcLw1zYQqYjGvmzBbnuYocMCl2AiaCigntDLEMGo>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7CE4DBA006F; Sun, 16 Feb 2025 13:30:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 07:29:42 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-Id: <7897968c-da47-4dd0-8a79-cb8b2c3325e1@app.fastmail.com>
In-Reply-To: <20250216085432.6373-13-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
 <20250216085432.6373-13-ryan@testtoast.com>
Subject: Re: [PATCH v6 11/27] drm: sun4i: de3: add YUV support to the color space
 correction module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103008_417897_122E2770 
X-CRM114-Status: UNSURE (   7.50  )
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

On Sun, 16 Feb 2025, at 9:50 PM, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Add coefficients and support for YUV formats to the display engine
> colorspace and dynamic range correction submodule.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---

Apologies this patch inadvertently omits a helper function (sun8i_csc_get_de3_yuv_table). Please disregard and I will send a v7 shortly. Thanks Philippe for reviewing and letting me know.

Regards,

Ryan

