Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5085FEE642E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zRvk/nOzB0Tp+A3fJ9KZKPiPm1cPPjhvzPZ3yF5gRls=; b=4fevsUAxF4FfMIWS/VRttTs+jN
	vpyxl7LKDM7GEWxwUY3DQsxHw3tbgIElgXSoeZO+vubmYlCWYOVXi0P0X1BEL3xAxy0Z9G8u++C+4
	oqOaFdd6AHJtRCFdFhoP48Ja1j+sDcaMGQv4TKdcCx+40lDyEnMrZitRWtPLsqBPATNgX2TUfxfYx
	3RlnyQS+Mov0qR4Xv/NXvglgF5wOkF1XCOqjEHp4dToKAeh2QDChOM88KNR9CKThENNZIDG6MxtnY
	xs18RPDORX+E/EnJSTzAtjAT6KPCPQeIrgjAuGcfElB11DFux4VRE23Rs1WthvQZS8PEy+JkmtxU3
	tkqYUZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDN-00000005xvj-32v7;
	Wed, 31 Dec 2025 12:22:09 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDK-00000005xvM-3N76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:08 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6FFAB1D000CF;
	Wed, 31 Dec 2025 07:22:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 31 Dec 2025 07:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767183725; x=1767270125; bh=zR
	vk/nOzB0Tp+A3fJ9KZKPiPm1cPPjhvzPZ3yF5gRls=; b=E+HOrg53Xnacj8NhCo
	yh8/JIMB9hEAHPTVlPFFWgoajkbAe0E47uc0Rz91+55QqHQLeyOlETdfuZ8Zwf0o
	YarHDctummfpoi+FDCPwRktH0WyauOFexRKrjpWoZruEl+lYgDpwm3xPlYe0Zj+L
	3QmbKnNt+z6pdM2Eit1hCL5v671HBvs0u8WLkEhl/Y9JOlSpICyIY+Dlso5wgseV
	v/8NRq1bLdDJhcrjfLKunLnG96LrEIfCGeOrm4mfsbB6i/NBEUWOfrVQB2kyWYZu
	BGxTQxakrxHWKUFbXfDiIWPUsfPKbWUKXlkAqoEpxqgui8YtrgnHXH96TnEhb7F0
	6XrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767183725; x=1767270125; bh=zRvk/nOzB0Tp+A3fJ9KZKPiPm1cP
	PjhvzPZ3yF5gRls=; b=o9WA2wTHA8+wgYgKRPho/ZIhOhyaSjLOB+Y7MgDI7J7r
	qeom/dFVWG0HK29fkl2sG4x1TvU+k5F2BAE/utYJzRuxTvUcd6vZeR4yRSPjjT/a
	8Tn3E6dWr0rEQgWaJmlAY7pC0AAr+tWV1hbL3NKoCVBda3elFCcWNkrqR+A4D1G5
	Shk2+h10us4ozi7I3WKNXh57Fo8kF08nP5QNOFcYnus3lLKwA6OKae/S4ZMJ4YG5
	a6YsUQUnkHaZZ3wHlSzLvYHpXm0xft66xkQ6J5nxor4/ejddnBGMMONUtgzenFMl
	JjnO4/hF+x2xH31xVFmcUwNUfsnt2kej/IKsQZOzGQ==
X-ME-Sender: <xms:bBVVad2v3144adM6FA6tLZFSxgatyc6A7tFftItfs1qJGz169gr1Bw>
    <xme:bBVVaVqsqFVKZDjuBqBRd85_Kc3ZQ7Ih3HTUgykOcSwF6Cq7p8_RQ1anns5bUuSa_
    I1T06BOw42HLGx3G52nR2GPHt6EE3LOtdyeV6cizj6BPhtj7CwL0EA>
X-ME-Received: <xmr:bBVVadLULDlaKUsXEvzg-BXIlfuEy5d04oeixrZfXlMDuTyQyQRYKLU_kfks6q1Qd7H1f8Tq84TKxhrQym68W8yiqOtbVF1ZY6NgjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhtuh
    hrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdgt
    lhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    nhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:bBVVaRQb4hdswrJK_l5PU9gDkLJaKyZHTKtFtqn1mQ9UTqibN3EvIQ>
    <xmx:bBVVaVONomfu0ogpm2Z4jtyaMssARlLc6r9-TARacenzwh_jGTcb6w>
    <xmx:bBVVaeU8HcDEsnPtBRy594UGL2A-0Y3_lNrCfuY7t5_byQREgoZcvw>
    <xmx:bBVVaQjNNEckMFdZjqt2SfOiAlSx7ctZnFKL98MWgGSQHm6V367fIA>
    <xmx:bRVVaRnjyk9aiMLSM_RWjHRY2vxsbx3A9OnHY8UISqaimLOenESc83hh>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 07:22:04 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:22:00 +0100
Subject: [PATCH] clk: clk-apple-nco: Add "apple,t8103-nco" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-apple-nco-t8103-base-compat-v1-1-6459e65b6299@jannau.net>
X-B4-Tracking: v=1; b=H4sIAGcVVWkC/x3NywrCMBBG4Vcps3YgF8Tgq4iLcfqrgzUJSRGh9
 N0NLr/NORt1NEOn87RRw8e6lTzgDxPpU/IDbPMwBReOPkTPurxYal3AWQuvybvIN+lgLe8qK88
 QF09QRUo0KrXhbt//4XLd9x+PvR8UcQAAAA==
X-Change-ID: 20251231-clk-apple-nco-t8103-base-compat-dea037ecce88
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=NfH/EVhKHGNRXy6pl4rolyAG7g4vT7LN9g0dWp0UYdw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQ0awGtiW24TnbKu8kfsvpsFv+u/P+swPSAXs33d/zY
 EbLnSVrO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEzkdjIjw+Oj2pbTll/x5yiX
 vBfCznfz8d+46ieX95/ekXjXkfn9tHsM/4McpTgWznz0ufOZ73SnzIlpV67kPguqkLGdzPClfF3
 8cz4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042206_893439_6DE2B454 
X-CRM114-Status: GOOD (  10.65  )
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

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,nco" anymore [1]. Use
"apple,t8103-nco" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
Cc: stable@vger.kernel.org
Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
device trees in [2].

Changes compared to that series:
- add "Fixes:" and "Cc: stable" for handling this as fix adding a device
  id
- add Neal's and Stephen's trailers
---
 drivers/clk/clk-apple-nco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index d3ced4a0f029ec0440ff42d49d31e314fdf86846..434c067968bbc1afdb5c9216277486bf826666c2 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -320,6 +320,7 @@ static int applnco_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id applnco_ids[] = {
+	{ .compatible = "apple,t8103-nco" },
 	{ .compatible = "apple,nco" },
 	{ }
 };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-clk-apple-nco-t8103-base-compat-dea037ecce88

Best regards,
-- 
Janne Grunau <j@jannau.net>


