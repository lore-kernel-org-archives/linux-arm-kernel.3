Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B442C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Udlp4ocv8KpmIVXbeOHVNYW3cA1AnHLAImNbn95Z4I=; b=HDAxqSMqyywRBzUjaH+XERXeiz
	YldafsOI97cL5IeOFvZ4cAEMT5d+vXqZ6eRGUY8huk04XNt1uRKexwzVKowzDk3DdH47AaO2iaoIU
	Pz4u2TnIXzxLyceYQa8nJ2c4iL+VjAVMQ0Qms6QO1A6e6UgC0Rj0mtL+8pNloadmaH5WoWXQQaqtI
	yob/HSidVHYFe8uuEgQm4qrF/KGiq0OGuqLfGFL+1IU48Oejg8mF2UhUeSGMjcs3XRrXGF322+tHX
	UoYx0KMPV/msEIFUoblkP0DADa+0HpAE8kn+PizDbokd0+ZwXm+1UBzd+pBCfWsd7pYrDIOOllenS
	+yavPXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPsb-0000000F3yh-2J9A;
	Sun, 20 Jul 2025 08:58:45 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPlR-0000000F3XV-3W6n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:23 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 599377A015F;
	Sun, 20 Jul 2025 04:51:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 20 Jul 2025 04:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001480; x=
	1753087880; bh=0Udlp4ocv8KpmIVXbeOHVNYW3cA1AnHLAImNbn95Z4I=; b=K
	rau3LBYoueXNHUOx/gE6C7dS8wdOmCgr+85KqQVn6LPvIJjxA6qCU4/3XJuk8dAB
	3pnqj2uZ9OgC2PFrEob84DG0d+/kFEfRlqZKChM9SubL0Er6DRtSsn4LPJ8+5OJU
	0F89JCbgEwu4Btbe3thYH3c4mPcpQclzLlMV5yhPswthvHGHXUm4KWfI/JKR2W+Y
	REUSqhIUsRaTdVKT8v0QDeacA23axZWNCT3ZxoUb7JY7PhXz7e3brDqI8rGNctjW
	Cw8eF73zBiBMSSSijcJJ5OwK6ygDpItBOndH08tP4jDXbpg5v1atjlnc41/Frw41
	Tr6lFldPDN869dMJj648A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001480; x=1753087880; bh=0
	Udlp4ocv8KpmIVXbeOHVNYW3cA1AnHLAImNbn95Z4I=; b=ELuXtyxeQSEI8FrXK
	FiYoOlmkmviYMMxyVYERgY6H9gS1Vqhhrje7H34pANINJasEXTBaff/TuSv7TW1n
	ZkH60GzCyX4q78epp0sXAvIwBbWA1z3Rxtd+SGgtzJ/bgwch+wPCSwo/K57jQH+E
	Tr07bHJgp6qtf2wBfM7exoMA2ykmhMos095o/4cLMzmsoVf/AjU6MgZUZJsgbCQ7
	kxm1xRxAw0QU5PanbJVUjsx1yM2teJAINmz5Fk6J02zOQmtIDBhw3soy+JizczCi
	r1nIStWNC1OmDiAWFkytK+cTIBh4A2i88922lc0tGhE6k8uZVPp4+716WkbVIA3n
	s4kQA==
X-ME-Sender: <xms:B658aL5GVUVwgP_wUiXwFZyeVPxQOO-klUmfKASnP7WnZUDCMCNZFg>
    <xme:B658aLzuAZS2M-eK3MvwsXaulTz23z1QbseHNxQaenxJRpSliexDF-wqhXpkgecmO
    bH7KsF4-VwU6YoRiA>
X-ME-Received: <xmr:B658aMrZBbDf8NqHumHzHSp4XdxUZnR0I_Jg4-FpouqIsYJWy3xmt_Hqzx6fhdYVmYAyFFJCK1tVM9nqLMmlQDt-2d7QcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:B658aN10YPYrjfe8o-N3-zsj3UfpC9ERSTvmFHAXFErcRdRhiE5npw>
    <xmx:B658aFDOBC6NC2fbcOocCvLxswbGShz7oMUTha-LTKwOzI97DeHSjw>
    <xmx:B658aOO91FledQP2aWMUMBLKy-pfrJ3Us8Hk8zmetSwn4F929-fd2w>
    <xmx:B658aJSV9PYKHAY1uyPLWdPs47imEK-SqMzJU56UoFa-TkRSfkTFfA>
    <xmx:CK58aI3SvIxdFtBWEV-8WcS45Z3RfXcvuAmpCgKuUXfO-dA_jS2Erv5o>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:15 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 02/12] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 20 Jul 2025 20:48:40 +1200
Message-ID: <20250720085047.5340-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015121_929770_AD364C9E 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33. Note that the DE33
requires 3 register blocks instead of 1. To keep things simple
remove the maxItems value for registers for the child nodes and instead
rely on the bindings for the child nodes such as
allwinner,sun8i-a83t-de2-mixer.yaml to enforce the max values.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..9d9418c40b95 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
@@ -47,9 +49,6 @@ patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
 
     required:
       - reg
-- 
2.50.1


