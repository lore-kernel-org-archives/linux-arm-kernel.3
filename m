Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB265EE6457
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/4tOhKzvmXBJvbN6rQ3tIZcm6ERDEOoE4JXkiLEUlg=; b=lSN/4eaPWZc+N1a1iI3ypHa9md
	kQmynpXikAiNTWKsA3gvaYj3p6yjYXur+R25rw6/fNmUautNtKpIU4Rn/PSUZ+c3vo+U/c0MK6Yar
	rFPponFNGb2KirV6SsigB5G4K6TVEdy01jMAbzjEZR9MlPi6StLhbWhFmJrBERQwzHH3U5c6iRop/
	pB1FWEQmPy4DcHqmwzky7U/S1ypkZiLxLoRjOB8Haj7l0xM5n3kzcST5+blkJzS2MtmnSk63uxiRx
	Amb+LDlMrSxqnU7AoaFsv/cTnki9oO6AaRjTUNocr7x4iptbZmZybdMXLdWRV3OR5Akp7FJpXybSO
	+/BHjRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayLe-000000065rR-2lKM;
	Wed, 31 Dec 2025 15:42:54 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayLW-000000065pW-3zD1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:42:49 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3EE3B7A001F;
	Wed, 31 Dec 2025 10:42:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 31 Dec 2025 10:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767195766;
	 x=1767282166; bh=H/4tOhKzvmXBJvbN6rQ3tIZcm6ERDEOoE4JXkiLEUlg=; b=
	DQ/H+DSZKAFZoHrGy1eCUIud8FA8k8qiateBVg/v2CGFGDBHh0pxGQin/6J1KiP9
	AUIdmGrKP/0nSYJNeQGAlxNA+CjjCNNSYbWADpwCzin/lR5nbSH+KPHpRrBt0KJC
	kuEB1AkZbnb2SBRzYyahHJCmBWOAo1C56ro0fwr0FDp/SNadGkT+0iz1BAJcP5Dg
	yiKzKvKtMdonSatbZ8/OnCMxETp56FLQ24wIO/fgqryzJ+R23x0NYwfWO10bh0Tu
	1WRHSciHeI0W5KGVUPZh+AqGc4pLM81kbODXb9wrg64p+d/FfRiuOUhncRacvxzL
	Ix2K8ODDbOemx4jWM2SCIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767195766; x=
	1767282166; bh=H/4tOhKzvmXBJvbN6rQ3tIZcm6ERDEOoE4JXkiLEUlg=; b=h
	gQqoRK6gdnfLo6FdDcvoLdOb1iGq6JpA5er/cbflJRCqyw1jMgnUbj/l1GTJFsMG
	v0Jh7wHxjcR7szijzaSCEFBWnOpKQriwDcC5bdgAlLYrmtJYZJ756CDEVxv+psO5
	vSO5Qlk98w5vREDuTLhDfsMPhWsgGwDzlNy2VgDZ8wOfGJavdAA0fv2xkpwKvMkf
	GhHA8tSHxhn7gOWS1FAjvGBpHx+UbUhurAhf5oT5KWp4cDRAyV3TxUv4KWS51EOg
	NF7rmvARs9zDz8Anv2BFMC0kgZKG6t4nB1bX/tVrgXsJEitBS6Ne0k7GuD+7yFRt
	3YvZbpdlxHonzn+Dnq1xw==
X-ME-Sender: <xms:dkRVaWocZwpKY06znzqoz6G00kXHCrvh0s2EzslLKfsv1FK1cFeB6g>
    <xme:dkRVaQpT3g_GxpTvAoX8EqZ50HSVJuT5RN34xhd2wsKsR3e-nO9IN3w1jfB-9WD82
    Vkx6BHHUGIfR9gwb5uE9U8ZyTjv2Ws6gFetMGbqXTjasf0-YdaqEg>
X-ME-Received: <xmr:dkRVadanPzweAEV9yNhR3-vSwuARnPsHVC25h4PXRV98zddmzJl4pxsQ2zK9GnrMRmgGlL2MbCz2r0Ae56As-HXQsUHMFxGYk1h1RA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeevke
    ekgfejtedtudeujeegueetudfffeetjedugeeiveeuvdeiffetleejlefgkeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghr
    ihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:dkRVaW-a4FcOH0XfD9Zb2qPzMjIjVsGT-8tTUQDkff_AeK9bLKEmXQ>
    <xmx:dkRVaTlQ01zVth3J6MNBHjMmly9G-KaUqjKcUnpDHL6iO3ODsrs3Ww>
    <xmx:dkRVabwTJdATNwXWqfj_J_qxuoHcfP4GMIImVZZFIMrJXueoNb5ypw>
    <xmx:dkRVad5-VKqaAS4AKAQZKppoP26Dt8ixe87jywWUOX18NMjssxYqaQ>
    <xmx:dkRVaQ7bU4eyj3EZ3RiJ1JnkNSVF1RMmYkOcHLDmWNpJMjDtayP-3PhC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 10:42:45 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 16:42:38 +0100
Subject: [PATCH 1/2] arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-arch-arm64-apple-defconfig-v1-1-4ff19805ba39@jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sven Peter <sven@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Uw09thzVOOvg9JNmBSGqTgng4jYapQ8QHlGPEMlOegU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQl0Lux/Muntnfty/6Xb0gc8uMCcrHlM4qxmw2/eUsW
 ZwyL9+5o5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwES2CzH8d3s3I+d6wJwy1U0B
 tl/5jj+zuJC3x61Ewmwm70LftY+7pBj+uxRUVLh6hTdtUdiX5qK60G3Dx5Rn59dwlHGbHzi6/oI
 uEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_074247_030925_4169A5E3 
X-CRM114-Status: UNSURE (   7.54  )
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

Critical devices like the NVMe on Apple silicon systems depend on
APPLE_PMGR_PWRSTATE and others are powered down coming out of reset so
select APPLE_PMGR_PWRSTATE to ensure these devices work. Since the
systems are not totally unsusable (boot to initramfs is expected to
work) allow !PM builds without APPLE_PMGR_PWRSTATE.

Link: https://lore.kernel.org/asahi/2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com/
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index fff14807c965a19cd5ba7a2445be5fd77d94e7a8..200e5067560e4ac2cfeda01c97cfae112954a0fc 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -36,6 +36,7 @@ config ARCH_ALPINE
 config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
+	select APPLE_PMGR_PWRSTATE if PM
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.52.0


