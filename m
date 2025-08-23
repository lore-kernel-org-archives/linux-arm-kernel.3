Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1586CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT5aGklpLSOry0yNA9sTS19R2dJWWLhIf5yLUeAuuD0=; b=4udZu/ScnanGkZa3f73BcfVngN
	vtnsQJf5hsPkuyjgOaA+dB2BWsldXMc2tEPQMwxddZjUvU4d7nu2gM0lUlhOFfd4RbPMm5fyQwkCm
	2EGb2xi8PilbhI12jgjoQopLSMgCocfjUxeC5h0nXj7uQGVJy5PuPBQ7ipThR+ATyrRNUb/M+Sne+
	7NRlhJQzMJKKNcGdUgCJ78Cw7xXXPUFpyF52ZcRZbE5Z8RGlW+CK6NEomHo5NfwPndhWRUp23RxXr
	Km/nYTIWb+KvekzPYowqYRzGtypIFf1d7RjArf9zBCVRBHVbA59FsB2bAi7l3sDvHhp1vrmd7d/O7
	s96QLiOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBM-00000004b8s-08O4;
	Sat, 23 Aug 2025 10:09:08 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksk-00000004Zo9-276l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:49:55 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id E5D731D0008C;
	Sat, 23 Aug 2025 05:49:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 23 Aug 2025 05:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755942591;
	 x=1756028991; bh=oT5aGklpLSOry0yNA9sTS19R2dJWWLhIf5yLUeAuuD0=; b=
	PsmckjTlqae1lzwYkRfHYHvkr1cUa9njigPTloF8nOtyz/B4Ttuv113Kjzr6kGcI
	vK0OH+ogsVQvJoFKT8qFq6x8eSwoprY35gR3Eteerv8VaSGIYDKa6Hjg5Y3+qo70
	tsWaX0QLrgeW+ldCjjr25SdI5GUHvPJidTY47odLmciBuHZ5dKH1Fi3ghz5/HyQA
	/gAhMMwicQP8XFWpFdgsy8jJ8wfEbJ+v3Ex3cw4+r7wSHlz9WCzrTPOmvGx5j9HG
	iEl9I+62zsSMsbNS6mwiKpuo8XgRj14G1JORPth0VEe9ZJ6A803YkVzh3GEEIH3m
	Z75PHMOjhBVijvaR72hpXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755942591; x=
	1756028991; bh=oT5aGklpLSOry0yNA9sTS19R2dJWWLhIf5yLUeAuuD0=; b=A
	LLfk5UiO+4wciDQXn8d1rsxQHnKNXs0ZY7x3Jbzu558TTwrrUF50VESKq8EiAwLv
	7B4Z3Z9uH6hRtZu+CPQiUmiIEFDJyGYdJOYCUvCLKXHJ3j7C2H5Pc62JOL+ed3Zh
	8Sg/d5OBbGlmhwFEi4e48y2I2ylUv1YfYNmgcvAOxCeOFop3rXbA8woQgjEJydmW
	UlYOePR9YYTpCriRRtYSBjUc6W04wqInkXR3h36sBuFvTFpw2RkRDujuXDkl5VAa
	8UzAbwXtoZqWSl8LyuVRcLKIOTVtjsFRIj8+gj8zLF3DT9BUjKRF4498uuyKmZWg
	3MfY1gw9QFdeU96TKHc8w==
X-ME-Sender: <xms:v46paESoL9nOr8W_9fuyBJPaGAgXL8aKjEKQWUR1MWLqg6szQm7mvA>
    <xme:v46paJAKnygnQ3RdYhuqz-VMTmsqbyZmrG4Wx1ouKSFz7mHrisrk7z0HQomZ8Vq53
    _2Hp5nq03XXFg4MxCE>
X-ME-Received: <xmr:v46paMsmdfwL_TvWSRMC5RX7Uia4umjDkDC7WFWSnByVreM9EDAbfScoJmGUDvYgf1v4n51a-AnBZkHHeSTtO2V2WiIHqGRAIYQUVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:v46paH9uSqvBPi4pV69nlfBxQvECSeMpaWEB10Y_JsURF-wUrmB3vA>
    <xmx:v46paDRlKWv1VICqoBM2IcUeeMF2dhWVGCESTwHM3WZgzvndZPCs8A>
    <xmx:v46paJVi-BcKniuKXUwOhrmawJ3WOfImcNqLKzDQIuazjp-CCiPpag>
    <xmx:v46paF9XkLUzIRQs5y-lkDhSTPi8iVZvAXtZrVNBK3tckZhF_mv3ZQ>
    <xmx:v46paP8Vq3GfE5mS-00p1ZZxVGzADhTQqRbgxaDMmQgZzix2quaGW3Vg>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Aug 2025 05:49:51 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 23 Aug 2025 11:49:44 +0200
Subject: [PATCH v2 1/5] arm64: dts: apple: t8103-j457: Fix PCIe ethernet
 iommu-map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-apple-dt-sync-6-17-v2-1-6dc0daeb4786@jannau.net>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=XWIZbXwdxDJd23FH6/oKGvuq/lQptExK9nszv65rwJI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyVfTuvnRMX2tB3Sq7zV2rls5l2B/wZZFXY5rpVecpsq
 NmrFpnaUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCI3Ixn+2eca3eDfwuYy51u3
 vaTXxjWJrPzTkuff1t7RE3tGsrWpiJFhWt3/gr/uj5rqGUq2J/9fdSnzZbFyfF55pU+Cfv+Ui4U
 MAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_024954_597841_8669D0B9 
X-CRM114-Status: GOOD (  10.87  )
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

PCIe `port01` of t8103-j457 (iMac, M1, 2 USB-C ports, 2021) is unused
and disabled. Linux' PCI subsystem assigns the ethernet nic from
`port02` to bus 02. This results into assigning `pcie0_dart_1` from the
disabled port as iommu. The `pcie0_dart_1` instance is disabled and
probably fused off (it is on the M2 Pro Mac mini which has a disabled
PCIe port as well).
Without iommu the ethernet nic is not expected work.
Adjusts the "bus-range" and the PCIe devices "reg" property to PCI
subsystem's bus number.

Fixes: 7c77ab91b33d ("arm64: dts: apple: Add missing M1 (t8103) devices")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j457.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..7089ccf3ce55661f3f83810496daed40c8199189 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -21,6 +21,14 @@ aliases {
 	};
 };
 
+/*
+ * Adjust pcie0's iommu-map to account for the disabled port01.
+ */
+&pcie0 {
+	iommu-map = <0x100 &pcie0_dart_0 1 1>,
+			<0x200 &pcie0_dart_2 1 1>;
+};
+
 &bluetooth0 {
 	brcm,board-type = "apple,santorini";
 };
@@ -36,10 +44,10 @@ &wifi0 {
  */
 
 &port02 {
-	bus-range = <3 3>;
+	bus-range = <2 2>;
 	status = "okay";
 	ethernet0: ethernet@0,0 {
-		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		reg = <0x20000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 00];
 	};

-- 
2.50.1


