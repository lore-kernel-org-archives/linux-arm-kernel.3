Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C768108B916
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtkLawOArao2lCnWHz+vxVSKfUKpDNghJlpU1ibhhOc=; b=CLCJTRl1Zc/94sRiwOd4OVw94R
	NhMQlCe2fNF4GzWA10tutUe6ghrB8sUQXBDBRFa8f/zgBJCdOXx3HMStLWj5ekTZtJcCISmo8dOB/
	vj/RoMKP+MP+zupnTHauwvM1EBAukGkCwhq70zDfrvkYPQSkbhe/gyKxqdvFEkzwTkYzrTVJvvxs3
	6dwUroNvS3u/9UedpxpvwkNJ9TbvsYI01P6XPCDD9fgevQYCJrm2AKASJjTb+yUU0Pt5CZyfpMhLX
	e3nEJw5bkGmzvUeC6MytofaoOyx0i/rGzF/+5b4DhCXCHtEoWUS7mZ4tHOxE5oQgo8p3MlnfX52ZM
	JGWPiYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtI-0000000Cl8S-0J5H;
	Fri, 20 Mar 2026 12:23:48 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtF-0000000Cl6Y-1YDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:46 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id A0DFA13800E3;
	Fri, 20 Mar 2026 08:23:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 20 Mar 2026 08:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009424;
	 x=1774016624; bh=jtkLawOArao2lCnWHz+vxVSKfUKpDNghJlpU1ibhhOc=; b=
	LcalUQslf3rG6fhoDzayHx0tTcMSQ7ihtdzHGQdQlTcW6I3NEVtunzF8cplqLzKj
	5Yzh+oDGHLDbqTx2+GB7KkmC8JgC0A/JhfI7wQiQSl39niHKwA42qYZ2l6Xbspkl
	fHvu9vFhxBHFT8zYs1yI+p9kXIQUnxa7MQFPQm0MhIrdPLQMJp89ChwNjCQaQ0mv
	4gsLUfppjS1y8iLM7nWtvinWkpCpDI/PwGMh4oaRLyXxj4iA482eqmGoTcDKso2b
	1HVWqT5mvJrRC8WRy4Cxp7R6c6h+W7js7YS4stZWgSvpNjwAuUJJeRjrD7+aumgc
	0PJsw0ISMQfpdKAI7aN3mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009424; x=
	1774016624; bh=jtkLawOArao2lCnWHz+vxVSKfUKpDNghJlpU1ibhhOc=; b=V
	bj/QsgLRH69dp3fe2nx/b8BsNLWt60iFSQCklJdTERPDOHxbjms2FaRonQQHN2y5
	yzrdx7Jlirepo3TET4DDiyazN5aeIcVGj2TgsnNVTLus4VhxH9mO2tXKUyeKkF1C
	qV1YVZGlzthW/7zmDRRxv/K1hsCWBKXGjJ7+9T3O32LQj1SAzI1ybK1z09Q53H1m
	ru9Rs4c77FWZa8XDseWr1t9ZcbXTsqAyJCzqtKlrjabsRGzEeAH4QqO3HGbRapJy
	8fyERzcBwuMMZGCWbXVlyhapiH+D7t26Gsi6A7bTc/EcCXfkJYyNGJMTINuPsjXh
	c27R5u7iTbkUuKoPwx2qw==
X-ME-Sender: <xms:UDy9aaIHm6yVcW30iyI991a7Cg5zkPOK7oIfrmum1QN9MD8Tm4bMIg>
    <xme:UDy9ac7cYaRkKtiZxyyqRAI8lcECr6mvfgH9X_jpwSPL5YZfvqhdQVy3d8bIAoO8v
    FT3uxMBL9xpjc6mQQ8hkAUaR03Cwtzfjp-Lv4AHWZv1uMS0hLQVyg>
X-ME-Received: <xmr:UDy9aZnnlihSnOCxc9GvK3FFVFAgmIM95zAoV50ueAcdVNHt3dUF4S2SNOcfCfAEYHX_Z5hJPvsHpx1NuoaVOasU6GYWEE6bLM9u0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesgh
    homhhprgdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-ME-Proxy: <xmx:UDy9aWJrqKde_2_UdgrTcWiWchePzM7Rbr0mvpiU4A2BzWmannIzXQ>
    <xmx:UDy9aSEMsnsq6lYq5-qgeVj_AoiMfzR-wDwkxSAhLlL_Of08YSuDJg>
    <xmx:UDy9afMP3rbLGE2Pqrag8taS2uYW7DN2kjkWgZU343LbzcM9c99HHQ>
    <xmx:UDy9aU8twT63cAh__d-AmF8suJWIzz3k412zM-kM8DYWGwMLtfj4cw>
    <xmx:UDy9aT9gBJhghB5JpfKryQobZCqz2whyfjGuMZsRgeN6eslixFcqR5cu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:43 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:21 +0100
Subject: [PATCH 3/9] dt-bindings: power: apple,pmgr-pwrstate: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-3-5842e1e393a8@jannau.net>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=x6Qe6Kw14xao3bSRFl/Kgufiy8EMMno8B7J53ldPVP8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu7RXC/iF+1PTOoqex/ikP6gZsZWu/BQoSd+0pl/l
 He0qh3sKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJG2Swx/OFc57/ssvYhx5YPX
 06xuppluMJfo3q8+eZKB1ywN9Uc7PzAyrLOfeHaT2yOfT4+5D/4uLxOamy/e12i6oHlmb7KJ/+X
 37AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052345_477748_7D65A72A 
X-CRM114-Status: UNSURE (   9.62  )
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

The device power state management of the PMGR blocks on Apple's t8122
SoC (M3) is compatible with the existing driver.
Add "apple,t8122-pmgr-pwrstate" as SoC specific compatible under the
existing "apple,t8103-pmgr-pwrstate" used by the driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index caf15188099921d2b92a20a616945627f34fb869..c9be097cfba0e416081aa5d6677c74d2b34c9ac8 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -43,7 +43,9 @@ properties:
               - apple,t6000-pmgr-pwrstate
           - const: apple,pmgr-pwrstate
       - items:
-          - const: apple,t6020-pmgr-pwrstate
+          - enum:
+              - apple,t6020-pmgr-pwrstate
+              - apple,t8122-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 
   reg:

-- 
2.53.0


