Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350A7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OV1c1wd+nT/3ZS1AtoSVY2W29WK/RpQm1k0fyOO9Mc=; b=4Q/CcvhPAXWbP1DL35wcUq74VD
	mj0phnRhROugCc6AhCxZ9qYvb7cxQr1Up/RZVsI1C6HgpFbMH5bx5/sYVZIRlov7jYmtimabuNguZ
	DPhPptzkCIkurzo42JaBkT+OEDhBtyVfLmKMgpW1heI3H9lmNDrNBTAc83U6VksoCzkdYxEyzQjoM
	u6HcWp7CxfxRTqHz+jskdznC28AHcX0FKbTScY6k1RLjS5FRcQF+7FUcex1oavEl5VUXV6oDCy8Iw
	+ONo3Yp4mgs37+A+BzfSvzY6eqt3fFb/vPzNoff1o2ATdW8+5A6FWV4TjHl+z1cFwi+oOB0EaNyNX
	uWS0B/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOw4x-00000006o6o-2dPH;
	Sat, 21 Dec 2024 09:47:23 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOvzb-00000006nLs-1uCe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 09:41:52 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C8C34114015D;
	Sat, 21 Dec 2024 04:41:50 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 21 Dec 2024 04:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1734774110; x=
	1734860510; bh=0OV1c1wd+nT/3ZS1AtoSVY2W29WK/RpQm1k0fyOO9Mc=; b=W
	nzpz9fyZzLsGnKMZ4ufMLEy/boUvkDC4ENK9CUIn+2AIy7eHXirP5D0GCDD+8j4E
	9eJ58CXjVM0TR7vfO8HoAbuIu8w75tnY4DF8kH6vmmcRkLUmlbhDjpWOO/7joQiD
	OkltuUC8EpDDcShAYkiFRdpcjFywbCu5qPYP27ggpQKokLdIFevtP2wxVHPtO2d0
	d6S7pdlOFFHhJUY+tKoglrxrFaegPD+cBu2Yq4N0C1BShLmRp7GPZyLrRw3VDUp6
	+BsSJBZF298Fnt9n27jMZlisG1RgoU5QZsG80Leg/dZ62jacddsU/lX5xT0OwgN3
	1XJ/HsSrxePwr9XTCCVkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1734774110; x=1734860510; bh=0
	OV1c1wd+nT/3ZS1AtoSVY2W29WK/RpQm1k0fyOO9Mc=; b=CRzB1uubsdHrS0sXs
	i23slcdvtKzdrSNlGG/E8vyYDUkgewP2VV63WyxfJTxcDCNosGnrnHI9pASQQjD1
	mnJqWtP5V22IAxmDGgrgDszqI20sWpWWXIfu6qdtuAln/4d/DcRRXUk2wo5zMpqz
	rEGMsxF/MD2j1xu0KLJtPmLu4mTAzO0lbdV1dP3UrAG2Iy9YHiBCrMg4tHYc+vE6
	q4oSODQq9GvLTnxMwSoBz2dUTmvbZW3ZELm60buGvVRz2cOsagzRjJ8kWST55GrE
	Q0POmqFvh+C860EtFolyZpT6FqNoZPyFzujeCyu8BPXfkvInJs+X+qGLEgp9zOm+
	E5dxw==
X-ME-Sender: <xms:Xo1mZ_CiEb1SnR9UMfzXk1n0BCKNMlDV9-2ruiRASDP4Y99Z_Vxjdw>
    <xme:Xo1mZ1gcHPZvwTmyJGhL3JZLkX07ybasiCE2EqeLjg1fBNwEnpMT3Ahl0Ko7Begix
    FxuipuAHWMffHMX0g>
X-ME-Received: <xmr:Xo1mZ6l573OgwoL372MvPUhuVeaYgvOscj6hqDmsxqkQq4PtdMijl3mXq1mTO6q1pRHyTol_z1ZWYmCD9jPptTN9ucRDBxbcMhNw7e8n9krT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifi
    grihesshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtth
    hopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Xo1mZxwP9H4M36wWQZhfWJuigkzyhdmGuSK1hUB7yskGLQ6q32PZUw>
    <xmx:Xo1mZ0RbkcVIoPoHiA0GvPvS0bFCiNDmZUbSoNJy9z66Un5Dze1BHQ>
    <xmx:Xo1mZ0aQeVIPQkeg0lfpJncHDHg00JtnSP0l8htl65VnRcfC09k__Q>
    <xmx:Xo1mZ1TjhnwXMfYS916iyYS1h6iXTRDCICm7QIP2FZ4yzbBz0lEavw>
    <xmx:Xo1mZ7JgwtS-UDA0ra3AUPyIeW7cy23mn0uhfBpM7Ca2QmsUCoWtLre1>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 04:41:47 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
Date: Sat, 21 Dec 2024 22:26:34 +1300
Message-ID: <20241221094122.27325-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221094122.27325-1-ryan@testtoast.com>
References: <20241221094122.27325-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_014151_565472_CBBDD44F 
X-CRM114-Status: GOOD (  10.76  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for headphone insertion detection via GPIO for the
RG35XX series.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 89de86b442155..cbab10de760c9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -238,8 +238,11 @@ panel_in_rgb: endpoint {
 };
 
 &codec {
-	allwinner,audio-routing = "Line Out", "LINEOUT";
+	/* Both speakers and headphone jack connected to 74HC4052D analog mux*/
+	allwinner,audio-routing = "Speaker", "LINEOUT", 
+				  "Headphone", "LINEOUT";
 	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	allwinner,hp-det-gpios = <&pio 8 3 GPIO_ACTIVE_HIGH>; // PI3
 	status = "okay";
 };
 
-- 
2.47.1


