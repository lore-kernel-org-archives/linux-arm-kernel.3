Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7DACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jK/BJit61+AKutAJR0P94X+7KV8Ubt7aBKM7Qa21V0=; b=2yOQt1hPdkxNfYBc3fMNvlPYsv
	MWK0XpnYBkEIGsvtu/0IL4PSVLIWtfYfaa36SA9vvnN1uIkNlcGuhMmUjnMS+bPOpY0FYz7unIFN4
	2D8fVPmcQZ2162b+EU3+cISIr9EZrORI/aQkYj/1VrY28mwiaza0WO+rmQQSOHZi0T+uj/l2uEtlK
	//4MBJtR9BBIlAR9IivIS0Qg88IwsPYfTZ9lQLJLGirvdp59u3OZ25ubDkMBEgtUVM+oCwL/aaFfR
	VhPHCEolvqOqErAZmUpbac74+9tqxN3/DGLJHbyE3bj/lq4kCUc60IyJ7NE2/jzc/3eMN3x/MuNyl
	Dgu6448w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjU-0000000H56d-1aEl;
	Fri, 07 Nov 2025 10:30:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjS-0000000H558-2YIj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8jK/BJit61+AKutAJR0P94X+7KV8Ubt7aBKM7Qa21V0=; b=BvmIcDF6WIiv1dcul4k2eIM9Oe
	T7amtN+yE1aSF5EyVIMGyO+EKDu3ifgylewes1YC+9DDzpZAkKv3FuniFgxX9lTGKADgZtnc/LSAl
	A3tgYo97IFMtXP0KGvodMGi0dOaOtBWILZider1pSC6vCHtORBsUcG/r7S/cadAzpkwZVt87JtNKI
	eXxopKJbwj2l2Xqjm3d75HbrwZUVykb9T05D7ix6O2pUns8G9xRaS/aNS/00MS1tOUeX0KrXC5Xyt
	hjXIQunVspthjvo4P+PtFI331lKqKWBAWbFl7AR5a2Z8HKGuXbrzMhl2xepvvKdVgQdZNe/+LGJl3
	ePEAQkBA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIri-00000006BFh-3hsF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:34:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23E714427F;
	Fri,  7 Nov 2025 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1762511389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jK/BJit61+AKutAJR0P94X+7KV8Ubt7aBKM7Qa21V0=;
	b=V8LVPEQW72X9Te3PCLgvRZ9RQ37r2aV9aN/ZHurnluGlTpbSI6RRPfOJRpNfuvyafKtk+/
	2+AveWC5DQaXeCtmR9TnaWk7UQ1d/UrzgozvoaUlQTq6ZkL6AOT1pVSClAsfc9Xu51+M39
	zYSFwglNP4eHXtI3F7dIOUMl0dOjcLhqujQ1fKEBgFceDUUlzeTxWhvwYfUMnx6FacAvyw
	WXyjPQyAzu107Fvpu9KWI5pOPyM8vgEP36YIvet0zZlgDy4Putvr2K3PcmbGYSURMe8YjF
	TLxTF4xHHgHPtSM6WWOGo2aCF+t6VsEjono6oyYNnZOHeD2gDhynPqeVj+nUxg==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Fri, 07 Nov 2025 11:29:43 +0100
Subject: [PATCH v2 1/2] m68k: coldfire: Mark platform device resource
 arrays as const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-b4-m5441x-add-rng-support-v2-1-f91d685832b9@yoseli.org>
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
In-Reply-To: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762511384; l=4439;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=JckmVSzukyidG2dui/LSzqe71K/hORksPnHdkUfcy0s=;
 b=ezvsVZEGOwzO9imh4uUDYPibZqM44HE5Mx8qGnrKtz5/fZzh9SAHKsQPv4+Gus6A+wbwwo1KY
 MsUMKxTRPMaDMU5aOvMyypk//4djgE2Q11it3xgr+XloLXPFfuIM8sp
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeelgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeffjefhtdelhffhheevheeutefghfefteeluedvudfhgeegteeitddtuefhhfelteenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkegtrgdtmedukegtjeemhegvfhgtmegtsghfvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemudeileemjedugedtmeektggrtdemudektgejmeehvghftgemtggsfhdvpdhhvghlohephihoshgvlhhiqdihohgtthhordihohhsvghlihdrohhrghdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_093443_068223_81F05AAF 
X-CRM114-Status: GOOD (  11.10  )
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

Add 'const' qualifier to all static resource arrays in device.c.
These arrays are never modified at runtime, they are only read by
platform device registration functions.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/coldfire/device.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index b6958ec2a220cf91a78a14fc7fa18749451412f7..20adba27a687029ef53249bad71b342d563d612b 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -111,7 +111,7 @@ static struct fec_platform_data fec_pdata = {
  *	block. It is Freescale's own hardware block. Some ColdFires
  *	have 2 of these.
  */
-static struct resource mcf_fec0_resources[] = {
+static const struct resource mcf_fec0_resources[] = {
 	{
 		.start		= MCFFEC_BASE0,
 		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
@@ -148,7 +148,7 @@ static struct platform_device mcf_fec0 = {
 #endif /* MCFFEC_BASE0 */
 
 #ifdef MCFFEC_BASE1
-static struct resource mcf_fec1_resources[] = {
+static const struct resource mcf_fec1_resources[] = {
 	{
 		.start		= MCFFEC_BASE1,
 		.end		= MCFFEC_BASE1 + MCFFEC_SIZE1 - 1,
@@ -189,7 +189,7 @@ static struct platform_device mcf_fec1 = {
  *	The ColdFire QSPI module is an SPI protocol hardware block used
  *	on a number of different ColdFire CPUs.
  */
-static struct resource mcf_qspi_resources[] = {
+static const struct resource mcf_qspi_resources[] = {
 	{
 		.start		= MCFQSPI_BASE,
 		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
@@ -340,7 +340,7 @@ static struct platform_device mcf_qspi = {
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 
 #if IS_ENABLED(CONFIG_I2C_IMX)
-static struct resource mcf_i2c0_resources[] = {
+static const struct resource mcf_i2c0_resources[] = {
 	{
 		.start          = MCFI2C_BASE0,
 		.end            = MCFI2C_BASE0 + MCFI2C_SIZE0 - 1,
@@ -361,7 +361,7 @@ static struct platform_device mcf_i2c0 = {
 };
 #ifdef MCFI2C_BASE1
 
-static struct resource mcf_i2c1_resources[] = {
+static const struct resource mcf_i2c1_resources[] = {
 	{
 		.start          = MCFI2C_BASE1,
 		.end            = MCFI2C_BASE1 + MCFI2C_SIZE1 - 1,
@@ -385,7 +385,7 @@ static struct platform_device mcf_i2c1 = {
 
 #ifdef MCFI2C_BASE2
 
-static struct resource mcf_i2c2_resources[] = {
+static const struct resource mcf_i2c2_resources[] = {
 	{
 		.start          = MCFI2C_BASE2,
 		.end            = MCFI2C_BASE2 + MCFI2C_SIZE2 - 1,
@@ -409,7 +409,7 @@ static struct platform_device mcf_i2c2 = {
 
 #ifdef MCFI2C_BASE3
 
-static struct resource mcf_i2c3_resources[] = {
+static const struct resource mcf_i2c3_resources[] = {
 	{
 		.start          = MCFI2C_BASE3,
 		.end            = MCFI2C_BASE3 + MCFI2C_SIZE3 - 1,
@@ -433,7 +433,7 @@ static struct platform_device mcf_i2c3 = {
 
 #ifdef MCFI2C_BASE4
 
-static struct resource mcf_i2c4_resources[] = {
+static const struct resource mcf_i2c4_resources[] = {
 	{
 		.start          = MCFI2C_BASE4,
 		.end            = MCFI2C_BASE4 + MCFI2C_SIZE4 - 1,
@@ -457,7 +457,7 @@ static struct platform_device mcf_i2c4 = {
 
 #ifdef MCFI2C_BASE5
 
-static struct resource mcf_i2c5_resources[] = {
+static const struct resource mcf_i2c5_resources[] = {
 	{
 		.start          = MCFI2C_BASE5,
 		.end            = MCFI2C_BASE5 + MCFI2C_SIZE5 - 1,
@@ -507,7 +507,7 @@ static struct mcf_edma_platform_data mcf_edma_data = {
 	.slavecnt		= ARRAY_SIZE(mcf_edma_map),
 };
 
-static struct resource mcf_edma_resources[] = {
+static const struct resource mcf_edma_resources[] = {
 	{
 		.start		= MCFEDMA_BASE,
 		.end		= MCFEDMA_BASE + MCFEDMA_SIZE - 1,
@@ -560,7 +560,7 @@ static struct mcf_esdhc_platform_data mcf_esdhc_data = {
 	.cd_type = ESDHC_CD_NONE,
 };
 
-static struct resource mcf_esdhc_resources[] = {
+static const struct resource mcf_esdhc_resources[] = {
 	{
 		.start = MCFSDHC_BASE,
 		.end = MCFSDHC_BASE + MCFSDHC_SIZE - 1,
@@ -590,7 +590,7 @@ static struct flexcan_platform_data mcf5441x_flexcan_info = {
 	.clock_frequency = 120000000,
 };
 
-static struct resource mcf5441x_flexcan0_resource[] = {
+static const struct resource mcf5441x_flexcan0_resource[] = {
 	{
 		.start = MCFFLEXCAN_BASE0,
 		.end = MCFFLEXCAN_BASE0 + MCFFLEXCAN_SIZE,

-- 
2.39.5


