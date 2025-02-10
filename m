Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1BEC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BCAhY1yiejemwSW6GsSgygTIkhjWjlTqnboSBf1Neag=; b=VBGyS8I1UsMgmcxBBR6f+mhB/I
	n15AiO3BwJcust23yY7+gwFgDPpL6tjA9aMDRI0eHhlvQKekUBGeDsT1COfJt9IVU2AiLkFU3Sa1w
	uCEdqGdyUn5puhqu1kgA71KbA37vS/+JD34YgcViGFsAPdI03Pv8rw37KcsueGgsMu/U5PbOEKuws
	iA3mmAEblCSYAwffYtPoCOzi2rIzFxGlDWlpQaB6DFh7AHPCo8iluWSuNU9GFvy79joMQp0BqXskx
	0us9YAL2iOMcIjK2Ox/tmlewIPwaez7JT5r49bGSpwfQt7LilyCHRDeHzrvUdIJz4BQcl6byn6CuL
	UEzh0AtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thT1z-0000000HQIc-293y;
	Mon, 10 Feb 2025 12:36:55 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSxO-0000000HPW5-3w1Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:32:13 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 24567114010D;
	Mon, 10 Feb 2025 07:32:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 10 Feb 2025 07:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1739190726; x=1739277126; bh=BCAhY1yiejemwSW6GsSgy
	gTIkhjWjlTqnboSBf1Neag=; b=yJxl5Qlv7HVphjeZ+GqVFIoL0RViBODDwai0u
	cHXDx8uVPbM9c/l18RaKpgRaxfVcVX3dwpL3xWCg1syue8UGPWbWSwXDGCzuOvPM
	MqCMm1I+oFvxO72qx95G9V5xEO9ngphuHWG7HVKoWNSwHMA1ZL+2sJc3KIIxkUMK
	Dw6aRvNAUowRiHS8uYT3S+RA9gGnF19uBXyHTca3CrTCt1fdM6N05tBhiXj8G/cW
	8Orf++ASv9HjZOQbIz6cn4ge4x2+D2qLldH5Q5bTIrscw1sLTf1fMH3KWNPxlAkx
	G3FZTg3yL7AqarKYuDbWiLW6PFP0uLf/Gn+SPTOxTOwBUXfuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739190726; x=1739277126; bh=BCAhY1yiejemwSW6GsSgygTIkhjWjlTqnbo
	SBf1Neag=; b=a2g21fzlFUhBoaJdFfkgcPF4yg/+rUn1Ubkqvr7FFSngvwhjoPg
	0/rIwP3R65uWJpSbNSEybBxyM0e+GHnPw6CJqUi9oJd4YcXFjMa2qwtMFxZHznDe
	3V9SRbXkHoMAPy6MWeV4oAO+OaGgK76wXw6gNV/lFFZT07h4tNSHJePIXYsDDgfo
	EgoCQU+grKGV8SL2IpABZbMr3vKGyeLDUcvpDXgbxh1ccMY7EgT8WLnPUxBk1mC2
	HWSLY5SlFfWZo32DWWQAJ6fdIOPZtFANzUa6j++w/2hLpECovjiPV/7/JQvl6ThT
	s7JnpYVL0VB9pnEqTAZOWT4Xju30TWIFIcA==
X-ME-Sender: <xms:xvGpZ2BFyywVJDj9F1-E573XV-lMQLFtM3r5mJ9s8pbuyDlH6FL3LQ>
    <xme:xvGpZwjmVi-SQ6XgFHuCM8srfRHay6GO7oWXoDQkiyO4mXNZ3ygXwWGwMBp43wR5v
    mS3AqSuh9CpQ7inIa0>
X-ME-Received: <xmr:xvGpZ5l5azEMmjml4gCSUklyi655F6GzHbJdtACeu2gEBq8ZIbERkJ2jk9QfHVPiRTG2aIhtGOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpehrrghfrggvlhessggvihhmshdrmhgvnecuggftrfgrthhtvghrnhepfeekke
    fgvdehhfefgfeltefhudduueffjeevvdekhffghfeljeegleekhedttdeinecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrfhgrvghlsegsvg
    himhhsrdhmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgv
    rhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmh
    esghhmrghilhdrtghomhdprhgtphhtthhopehrrghfrggvlhdrsggvihhmshesthhorhgr
    uggvgidrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:xvGpZ0yo8aUNVviiyyyb89vc0k4kZds1RsMbSG4mIxJVcPX4FHlFCw>
    <xmx:xvGpZ7S0bA8HTG3FgvR125kUE4EyVGyTMD3gFjY0YVLbxBDrEgiGzA>
    <xmx:xvGpZ_ZEeWoXoHSHf_unSxF-XC1D5rNHXaKHea5dRaBro0O6tHSs2g>
    <xmx:xvGpZ0Ty_KKur6FQR4v1upwT1iID9H8lhxlqH_bfUZe_JLE1wOkssg>
    <xmx:xvGpZ5D7w1zgVZcKanuoJnD3FQaymBW7fMiLO7dnrmb-C-IPK8OIlRoV>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 07:32:03 -0500 (EST)
From: rafael@beims.me
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rafael Beims <rafael.beims@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rafael@beims.me
Subject: [PATCH] arm64: dts: colibri-imx8x: Add missing gpio-line-names
Date: Mon, 10 Feb 2025 09:30:50 -0300
Message-ID: <20250210123134.1659719-1-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_043211_706461_46BD7EDB 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Rafael Beims <rafael.beims@toradex.com>

Add missing gpio-line-names for SODIMM_79 and SODIMM_97

Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index d5abfdb8ede2..ecb35c6b67f5 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -295,8 +295,8 @@ &lsio_gpio0 {
 			  "",
 			  "SODIMM_61",
 			  "SODIMM_103",
-			  "",
-			  "",
+			  "SODIMM_79",
+			  "SODIMM_97",
 			  "",
 			  "SODIMM_25",
 			  "SODIMM_27",
-- 
2.47.2


