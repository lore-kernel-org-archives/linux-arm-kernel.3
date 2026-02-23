Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F67EC1136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=scwHAtRQd3PclwoYnPSg2AnnEZLGXYap8/BiWfboRfs=; b=r3QwAxbfL8IOmR
	Kj2oJVQyffEWoPqSX1RbBKA1Tow1qCQohBkLgYk28NMikWr+pvLHaUSDKITs8LiVOIBrQyFAk7AUd
	P5GLfats1HFldB2R9UJPjzNRkFTkABrtxa4++LQUQ5iX2DZtfd56tt0qjXwsc4dADigtu7wkCy4IC
	3DSKgg5zteInxQH8XyfG20mf0g8A0aQH/dT0Rf3JUVq1p0uy+S+787IU43yTCyqxxVApnL4NO0SNc
	cnkFkuRiNEY4QOH4xDdXZDeJvidCj18yDrYrWZoTLjkLCBA/9K6cEbDhdl9oeWASMwNfMNlUtPN5g
	u4sAnZOXf8dLPK2cXQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuclq-000000011kp-321y;
	Mon, 23 Feb 2026 20:43:10 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuclo-000000011ju-1Bmm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:43:09 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1D81E7A019D;
	Mon, 23 Feb 2026 15:43:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 23 Feb 2026 15:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1771879383; x=1771965783; bh=sc
	wHAtRQd3PclwoYnPSg2AnnEZLGXYap8/BiWfboRfs=; b=AVrkkxXHj4hUpdukC1
	t1nBp/3hlJo6cLyTWNguEfniKqMg9TqXKhauWhXoZ9kbKIcJFkkhL3sN9RZEy5l6
	7wUvE39xryIL3/Bt/s1UWZlDna5m9AF6YY/82A1I3Lsbq31IR+3i1TgxhaF4z8VB
	3pE6tsqLwG3dUftFrvOc4k0MwkV8EW+nxZoMHIjrjVsX9eLxE7Yx78XH0a1TB2bZ
	7nDm42N7K9V8Kgz3XFOgbYpU5OgKuYCRVWXsSnC81awkl+wWYWMtv0JLjbFxHfNA
	UeEzI/agFNwKpqcJBJox2/ZB8nruVQs3zIAE5LTz+iEIpE3eelzsbAnSiI+xoipm
	icyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771879383; x=1771965783; bh=scwHAtRQd3PclwoYnPSg2AnnEZLG
	XYap8/BiWfboRfs=; b=FIPwPmKlZRP6TS87JDLIQz5kfMt/2wotnE5t92tuY//M
	0RYuPjhQ6uN2SAs6jN2sVE+4nLjk42awIvCgWuZAF40FRa46cWV0FHX9oeP+pCug
	IJaMeLrHPkJnQxFi4upfujVvG648vwzYecoPeLGJ3FpQUM95O64Sr9zrEd9SOQkc
	x3lAneeSJAbx1MNtPGw8fHTyAXrUblEf3lSvShB63D+fBiRVtllyL5ofErb1hb9+
	LtoVZWpDXgmm3tpnwh2Wkn1aqGMM1cKjpv3v5DqPFkNP40XctQbNtiYPAwSMYk+x
	St4QQId9MhuIdlJ3t8KBHN0m4TTSXJFGVPgSTlKTSw==
X-ME-Sender: <xms:17ucaT60LoQQkMbcYDkSmALirIxQ3vOGuZ272OuO-vl3eocC7grKTQ>
    <xme:17ucaUvdK-gEcX9QmvE3h3-0HCFHNrWnBN0xbJ2I0rxEkVr0d0TmtLf2wOjDYF6iG
    IhvmoQ95UCaXcEH-5OzU__w7IsSjB8CA1CLN2O-vKAo6MG-EioWmi0>
X-ME-Received: <xmr:17ucaV3U8xYf63k0ZQrN5yyIiLU9ten9t2hs0J-roT5zypp17CIXUG828hr7srCDVFdfYoga4PX0ncDH-N39Z-6QcfYpKnUD0o-6zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepudffle
    ejffefieeigeeluddvgeeklefhffeigefhudejieevgffgkeeftdffvedunecuffhomhgr
    ihhnpeihrghmlhdrrghpphhlvgdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosg
    hhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdgu
    vghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:17ucado2B3UN1q0oBj3SKyVv-ssc3lmEUM5PrQaidwPmF8aK-GQOSg>
    <xmx:17ucaVLN3DIM1OCsmltCkDlABhRqG0XsGevJcVoT5CkvMfu69ipfww>
    <xmx:17ucaZTpEZeCu4Dv6XDyE-6nBFuDd8fIgZkY0uYgu4Npv78knkAN6A>
    <xmx:17ucadN5hOBKISesFuIr7bCY8YsZeqF-A4gCB7W_WgExMjOEzRGZ_w>
    <xmx:17ucaRH7BtlQFxTbuSB01tXlTmqz-xAzbN2Q8D-appUHzBW6QuPGdMgj>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 15:43:02 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v3 0/2] Add Apple interrupt controller 3 support
Date: Mon, 23 Feb 2026 21:42:45 +0100
Message-Id: <20260223-irq-apple-aic3-v3-0-2b7328076b8d@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMW7nGkC/2XMTQ7CIBCG4as0rMUArVhceQ/jYopTO8ZQhEo0T
 e8ubVz4k1l9k7zPyCIGwsh2xcgCJorUuzzKVcFsB+6MnE55MyWUFlIaTuHGwfsrciBbclHKqtU
 AKh/LkQ/Y0mMBD8e8O4pDH56Ln+T8fVNq80slyQXPTItag4bG7C/gHNzXDgc2W0l99vVfr3LfV
 I2tUWprzParn6bpBdfwAzztAAAA
X-Change-ID: 20260119-irq-apple-aic3-0314f6aa2a2a
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=K1H9osKHOHIaNPMYtzrb0CqGgCC4DXD1Xeb2cGWhhGw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw5u69orji+ZHd41N51Khwvvd9eE/ydKXdM9vO7CSHzL
 rqt3S+9oaOUhUGMi0FWTJElSftlB8PqGsWY2gdhMHNYmUCGMHBxCsBEPucwMjTHfs/8IfHe4My2
 6Z4/PulG+T564jVL0Ojdvb/LXeLFRZYxMtxrrdS5IDrN0C+fnTvuhYPRqqorDRfXm4qw3ksI26O
 5jRcA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_124308_555111_5092201E 
X-CRM114-Status: GOOD (  13.41  )
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

Add yet another variant of Apple's interrupt controller. This one might
to stick for more SoC variants than their predecessors. According to
Apple's device trees it is used on all SoCs since the M3 (t8122) up to
M5 (t8142). This information is not 100% reliable since macOS uses
different kernel builds for each SoC variant.
As far as the functionality implemented in the Linux driver it is almost
identical to AICv2. The only noticeable difference is an increased
IRQ_CFG offset.
AICv3 uses the same device tree bindings as AICv2 so add its compatible
to the existing apple,aic2.yaml.
Apple's device tree added many MMIO offsets as properties for the
"aic,3" node. The offsets are the same for all released SoCs with AICv3
so the Linux driver continues to use hard coded offsets.
Compatible strings for AICv3 will be SoC specific like
"apple,t8122-aic3" so a potential future SoC with different offsets
would use a new base compatible string for which the driver uses
different MMIO offsets.
While the offsets are the same on M4 and later SoCs access to
implementation defined system registers will require different
compatible strings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v3:
- sort aic v2 compatible list alphabetically in dt-bindings
- drop mostly duplicate t8122-aic3 example from dt-bindings
- rebase onto v7.0-rc1
- Link to v2: https://lore.kernel.org/r/20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net

Changes in v2:
- allow single "apple,t8122-aic3" compatible in the bindings
- drop leftover #include <linux/of.h> as it's not justified by the
  contents
- comment and white space style fixes
- sort cases by version in switch statement
- Add Sven's Rb:
- Link to v1: https://lore.kernel.org/r/20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net

---
Janne Grunau (2):
      dt-bindings: interrupt-controller: apple,aic2: Add AICv3
      irqchip/apple-aic: Add support for "apple,t8122-aic3"

 .../bindings/interrupt-controller/apple,aic2.yaml  | 30 +++++++++++++++-------
 drivers/irqchip/irq-apple-aic.c                    | 24 ++++++++++++++---
 2 files changed, 42 insertions(+), 12 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260119-irq-apple-aic3-0314f6aa2a2a

Best regards,
-- 
Janne Grunau <j@jannau.net>


