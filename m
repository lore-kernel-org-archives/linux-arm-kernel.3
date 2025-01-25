Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C104C02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdIMwhJ8hC1QC8RbpwkAhUuLla40fvTl8JmybcX17Ek=; b=YLyTm2HjZyXM9Rn3RD7gzMU97j
	ycQ/akTupUnJqlVYWgJk4dCXWRoKYxM2yLYB+2HMcQl3fJRdqo1j4a/sjtDPW+mtSqInC0ErV+pxy
	TvChdMiWO3zZ6HDE5STeCCvnA794Md/CUgDCGoAfEwCG3usN+xucYtPbqQyVKZQ03ylc037YdYVmg
	Ckb1A+ejp5738GGi2z1NZ91lclIhaAgCVoIsZo9IvTW0bCXfPji7eEanu9d6YKlUYlUDoULGMl3MR
	7/Tx4hrWYU95hK3QNgNFMz/wJbfYECqJO2LN32ziQdfZ6DXeHJymOdQUcqFnougGlpLltSCwJw3+e
	4xDgGBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaHL-0000000GBx1-362s;
	Sat, 25 Jan 2025 07:08:27 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEQ-0000000GBfk-3Rk1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:28 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E845711400EC;
	Sat, 25 Jan 2025 02:05:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788725; x=
	1737875125; bh=HdIMwhJ8hC1QC8RbpwkAhUuLla40fvTl8JmybcX17Ek=; b=o
	UXtML8VTe1AS5ZbXENmEh9Y41Nq6nF1YxJs66muN1ddyCMh1NTQMnvRdhH+7QAFh
	rBh9zy3YEL4hSvLTdUL2b3QnM0dNfQKRJDP91KVIgoEqipBR+A2+hoNJ08Rw5JDC
	3ST4FklzZQs9GiqUWPcKq2L/uJMwsCOQb85fzyaaFMG3iQadOGczi8SsTonvIYFk
	v5dDawqqRVtE6XgxRSs54rfvGbOay+BsWIT7z3nqkU+Ns3OUG3/UXJiysuQWrygx
	PF0aiWwcUiJ7iYTBpPCMbtCalb9D4V7TwsguNq1BS567jDnHs9OG25YD6jLEmgAO
	aq3PJim9M6Gyt4dNNHVAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788725; x=1737875125; bh=H
	dIMwhJ8hC1QC8RbpwkAhUuLla40fvTl8JmybcX17Ek=; b=hV8ZNZmaoob38TAJQ
	P5dsajXdf1E2E7xbXHtxU3O5VKmhVZ/HXjhWsWAULagmUI/cRzXYwOG1CNQQ0jEf
	KdfgzMkjEfhdMJwIepC97dJUY/i9L49qt9vxOhFdUDfmouu14AgLWNWC69Wb9m/f
	WYTmzyILS5xxKlSsKa4TcN5jq/wwR0j2DKGoBVtWB/OrlXWf6Zdj4QL0JURYRWHq
	RgJRK5/H1UWjyPrao5VNcPukTQUeyhMkq4t9SkpyYbDNqFC/4tj6JFpegL3lF3gy
	7bSLDLvTGEdh7Q4+kmmiKMXzcpxEaWpED5fIug8cvo0ZDWoTZJBnrHzhLMUO4Rj0
	JkB4Q==
X-ME-Sender: <xms:NY2UZ3W3amUC1Ec3Y246_WKUpsAzE0NPIzzTgKF60u6qjxGbWDhFSg>
    <xme:NY2UZ_lWFe00dNaNz05RFY882x5PDyWNfOeV3NEQcaSrgPZsuiyC4FWBNW6ZwQW5P
    cvw2zAcsNppKycP3g>
X-ME-Received: <xmr:NY2UZzYWJjFT5LDFPD5vG4j6PIH8tNCGwrnJR1OHdvKQbeAZQzs5Llqkf1fVFt-zfvZPsRVAyNDMdflPCJqGe-Sa2hxPN1-fAlGXGjgubmMm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:NY2UZyVl17cqwAKaG98tsBBcziq8AeiRjZfSJnArdu5DT2bNiSW8UQ>
    <xmx:NY2UZxkT9VuCLubmGgVIRPNiV6AQ-yc8HJBInZ8tE_9FGL8VD5QrYQ>
    <xmx:NY2UZ_czdCCUOzHlPcbWz36rbBcOLEc3OVEUKnYqtllypjkNZ2jeVA>
    <xmx:NY2UZ7Gbe8RE4iFBIqYrmuq6N1QJZnqbkxYYQF74CZCHzYDeg5Iufw>
    <xmx:NY2UZzk5oRLVFhoVveMfhEsNpJcax6W1XnWfP9B1MZLH4zrdBg1kvMZp>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:21 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 1/5] ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
Date: Sat, 25 Jan 2025 20:00:11 +1300
Message-ID: <20250125070458.13822-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230526_918789_A27B1A99 
X-CRM114-Status: GOOD (  10.28  )
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

Devices integrating Allwinner SoCs may use line-out or headphone jacks
with jack detection circuits attached to a GPIO. For example, a number
of Anbernic devices featuring the H700 SoC use this mechanism to switch
between a headphone jack and an internal speaker.

Add extra routing endpoints to support this.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Remove vendor prefix from hp-det-gpios
- Amend commit message
---
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ccae64ce30719..b4eca702febc7 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -102,6 +102,10 @@ properties:
     maxItems: 1
     description: GPIO to enable the external amplifier
 
+  hp-det-gpios:
+    maxItems: 1
+    description: GPIO for headphone/line-out detection
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -251,8 +255,10 @@ allOf:
         allwinner,audio-routing:
           items:
             enum:
+              - Headphone
               - LINEOUT
               - Line Out
+              - Speaker
 
         dmas:
           items:
-- 
2.48.1


