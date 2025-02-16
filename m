Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=3pdZOkJEzv8AgVuktortMcYakO
	ldLKhXwEH8XULtrXpBulyMUDkgvjSXEq1zUZ9G7IeTG7ak9PUKqoYvByZe0eCZhwQBTxLY2dDNYqz
	+VD4BqmdPkuV38RyS/96Mj5cAA55M93tg8mF0nhX/dc6syRADmpqGHBKvdbsg6yOgYG+B9utpV1Dc
	o5MBN7QHLPQP+gf2rK3/BxpiHJqdtWVOKG4jJ9eZrv4TM0O0kgcFEWUb/cHDWPqsgs7aY3rJm/Mb7
	s2W+muthY1V4jk1lQ8JSx3x4HMCPSazwqxVIVQVekh+YxRe/X9Fa2sDuNxjKkPULtgolF3BXFwWHW
	K0LG55bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjzw-00000002QqW-3NkZ;
	Sun, 16 Feb 2025 19:08:12 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjZ1-00000002MUD-1DLf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:40:24 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1CB7625400C3;
	Sun, 16 Feb 2025 13:40:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 16 Feb 2025 13:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731221; x=
	1739817621; bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=S
	9/Ruk9OGI1fHRkob/9Y67jzlqMZaeKF/NeUc2Bk6b54vs4OHDfenmvKsry+67Hcn
	Bmbxc8F1ZQ+2YIva1p01QoIUKlM0fGPiQumZUBCQOP5comKy1mNxuDSSvzMEeY5M
	3ey+Sccm3MphM3TwHCBRnrDt/W1IPugoRdB3O0TVA0lnd4Wbj975jO9nmteaXVFp
	V3CpiEQVmQZcO9Hn/SLzULNkNoKUGy5XMeyswZj4VDpOcbAHRiwCaZYqmo6R6mKA
	84sE3W7EM7xx66VdUTL4Kt6bvO+tAh6UE6ZvLyasbGe9xRX4MoF+70e9BeiTGqw9
	le304pp+xyk7hYf/kQHFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731221; x=1739817621; bh=8
	S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=g7iJc4tMVK4JDm2pu
	NTnaEbGA3DcV90CBTXvUFzGSn9gftSGIaNVTQxIbBERMAMBV/iAQKfhoomNVC8+y
	3CZkbuYKH1QjdollwISLWjFv7CCWM89LxGNLzBHRlTaBDj+Vn+NPlXpSCXgxYOqi
	OsIwhGuOrtgcQVWf/RremJ2YthD0FJyBpwshrpu6UeiqAijHzjCgSQr7ioks0/r+
	NfZSVZI3PPZbyt7rw9h6SCcKzwD/41xXbSg2QgzX5RY8XeS0QAYN+bLsBbHSZKts
	6E/JGOCwkPo0EvTkCbsolCx1OGUzxcvUQrX7MVTZ0EkZ5/qv3lxu43rPb0rH36R4
	Bq7Gg==
X-ME-Sender: <xms:FTGyZzXIWnZl9wER3MmnE6DsO_9VjnqqeEj42VPUb-VmjmqcUVfSww>
    <xme:FTGyZ7n4WMPDF04weBFUbwW46aZge0ndvJs5esqUv7KkDmjxRaNeYIQMsIuZpNkFO
    TV-I0ggFv0w0qMAQg>
X-ME-Received: <xmr:FTGyZ_Z0RMw3buwGoB_4mokNN3fm8rI5JTPORSWRRxN_JLLA2qJ6MUKBDGBFHb-_kR53QGFjKBH3YVCBd5kd_scgxta3XrCw1P_CtzBezg2m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FTGyZ-U85uWqlsyUHiRSjV1NMN2MZeQ1btwAyDt4yMxWO3Y6t_I6TA>
    <xmx:FTGyZ9lvHbOHeulGv1nvJgCG0R3MK0o5Ox70IqVxMBODiufGylcvVg>
    <xmx:FTGyZ7cx-IDY2lYyaeCKChuvCo1gltRXPhBnl5VoALXbE7npKNM7uQ>
    <xmx:FTGyZ3Emqd_nopGXeNgrWJSkRyUMiUG1Ni7fi23o4yhr3_GmW0inzg>
    <xmx:FTGyZ1MZJxY2aYa0Fdfc_Gj9Y6VoMu559YwlJ0AH3LGjEhRvVYpEJ2Me>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:15 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 21/27] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Mon, 17 Feb 2025 07:36:21 +1300
Message-ID: <20250216183710.8443-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_104023_378645_90108A72 
X-CRM114-Status: UNSURE (   8.31  )
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e40..7fcd55d468d49 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.48.1


