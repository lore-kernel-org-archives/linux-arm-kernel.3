Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED8EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjC5DK6n9nLBAmpsaRuvFi1ggdVIu+83ktUYSLFQX1o=; b=ZQvIJtgkhRkFg//29mWhoGnkJe
	+MZ9CpCllYyxj2tHfxGCdZ4zQIG5QOp/IHWf3XLoVq6ebhjO8JIMKNAaCoA5tcicCI1/eLGuUvTxx
	XizfY8NQPDXRpZsHOLW80i/SAo2FA4xte0u0dQMS0rTBmAR/CAnHzJNDKt5w+MQ3UmY7Z9ja/F9hE
	9idUaaNhljtCUiRIyyQ5r3beWmXlutSnWPmEBmGtAKjRbC43D4X0XWMZkUiUaOXEWQ6xSb4tnWPTa
	cGHuWLWnHygt6FLFW6QRvz7SVvvowXXqkMLQtJvicDG/aRbiJf5j6rm0pNzZCJNgUn5FtQOj0v/b3
	f4I4iyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3t7-0000000GLqJ-2fVl;
	Fri, 14 Feb 2025 22:10:21 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3mP-0000000GKwN-0Bvt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:03:26 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 210CE2540160;
	Fri, 14 Feb 2025 17:03:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Feb 2025 17:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570603; x=
	1739657003; bh=PjC5DK6n9nLBAmpsaRuvFi1ggdVIu+83ktUYSLFQX1o=; b=q
	5LayLcQWqxxpzDzMFRmJPbIk6QfntwKo/FbTbHNkkzkRvAs++EL5f/zQCqPMDwTY
	crZ5UFAqywyk9I1Aqg+obAfJewNVvN285SvAX53BC+f5EyXRTsomUGkm29ql++OF
	aHC12J82wxhlWLkTDVvv0YkWIAVHWdljsRYIccwro2xGXdhkdC24rVJhx+WhQFmC
	31J8mY9QUZHtllb+E45dwpqlSoEaaJTL1vtPUivqAxRce6K6hcKWa8zJgahZh7Pv
	mSnM0gr6IzA0mk0MxH6kLbkO6mjNWhob5eiaqjmXf/nPh6cyQaAaLqbEggBAXiPm
	boFkaG5YQylLknpMS4Iqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570603; x=1739657003; bh=P
	jC5DK6n9nLBAmpsaRuvFi1ggdVIu+83ktUYSLFQX1o=; b=oFoUqNNbWjnuvB4eu
	HlUpXR04VMD8P05MXIy5n4hMUoSwLwM8qEl7ZaiGRxFmACc68SeSnIINGLJIBJEK
	qm8xDK7Gq94038ge2i0UuiDxrJuw1IHN5dzv+VTJpywSu4sOWj7GngqIipvrj42h
	zRMHxEnWEAvS9t1YtwwQXHawgGGFzus7wxt9AUwweQrbJDKssODTxeIUUeeSOv4C
	IhMk+n6jV9I098Fx0m1HAKSKQs6MC/eMihgdmZivtEuPVHjSqAN4Qo3poabYhQ4A
	1wu6NjOP5Gt1+UYe0iKpvTLXPeS176ntWL063rIY/J+ToFriSB8Y1FjO23JKf1kF
	WS4rA==
X-ME-Sender: <xms:q72vZ6B95s8hr-o13vSU9x5qsrcPFOYAfKeKO97kevI45OqMVEdlRw>
    <xme:q72vZ0hZd3FLY7rB5f1xY4-6CrolJUzD4eY6wISz8sJHMHdnLFY97kxVN9jpqWds1
    NQ1Xx7IyYSDyWK3fw>
X-ME-Received: <xmr:q72vZ9kLyD9Gb-5orgddzlqmF90yBMJYbY0l9RH24aQ3Bnd19sW8lMn4BpwyPLy5qOYuoTtzkOv84l_71jNhpjbBbYqYn7PeWUbfxf-wthxf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:q72vZ4xtwUFTi9ZFIfAtF_Iqo2QzdJc_5b-KlC5642plGy206m4CKA>
    <xmx:q72vZ_QwG2mW1klU4CN51zPYCkrWXrkBWhvjWcu39gIq6wF_k26uFA>
    <xmx:q72vZzasZWg-m9n84US9m-NpeuyKMhdy0T7izO1dcp_hALHqgEfgNw>
    <xmx:q72vZ4RoaNQv-XX38J7yz2ezzo0lQ4J3dt_NNCfSf1SObDOKOVruvw>
    <xmx:q72vZwh-4WeDLKhukE54E5g75C-AHGdwk6KUYiJ87Qd58uhbOtNhLZmN>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:19 -0500 (EST)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 4/5] arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
Date: Sat, 15 Feb 2025 11:02:26 +1300
Message-ID: <20250214220247.10810-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_140325_140860_75C8D59A 
X-CRM114-Status: GOOD (  11.93  )
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
RG35XX series, and add the corresponding routing to the codec node.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Tested-by: Philippe Simons <simons.philippe@gmail.com>

--
Changelog v1..v2:
- Remove vendor prefix from GPIO description.
- Whitespace fix

Changelog v2..v3:
- Add Tested-by tag
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684ad..b482fdf1fdba8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -178,8 +178,11 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 };
 
 &codec {
-	allwinner,audio-routing = "Line Out", "LINEOUT";
+	/* Both speakers and headphone jack connected to 74HC4052D analog mux*/
+	allwinner,audio-routing = "Speaker", "LINEOUT",
+				  "Headphone", "LINEOUT";
 	allwinner,pa-gpios = <&pio 8 5 GPIO_ACTIVE_HIGH>; // PI5
+	hp-det-gpios = <&pio 8 3 GPIO_ACTIVE_HIGH>; // PI3
 	status = "okay";
 };
 
-- 
2.48.1


