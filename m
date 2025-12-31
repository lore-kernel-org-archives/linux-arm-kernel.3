Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA7EE6457
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6oRe6tM7R6Ju3l0/UD6yTJIFi+xI6pVQx4B5hRZ+Eg=; b=bQfs73iV+mZBtC
	0zBa184aQfSjtDcyVvlEBqk75gIvN8nO0801LSweaYUMP53j2SFH6EPdbbRqK2VAGjGNCngAYd7s1
	d3MZ06AOEtJRV951YnchBIzjRKHknkNwXlmZkc96hb2xaGGJe1MU4fmWtIXrueLi/m79JxFMrEyS/
	JNn7JtsScZmJtdxt5b/RRDStMcx5jmOjviHXqZhlRHz7u03nH1xOaYJVVBNTyBXLK2ydVAGB5c+tg
	m7qw2vmq8MwkRxSUuLepBzlxOO8hhfUfXIWQE1Bkv7K3WMJW1gLjFT+h1d/ZPfoDy5qS1kfdpRfU+
	CoyCQ6fvb4mr0Cly/DuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayLZ-000000065qH-1VGu;
	Wed, 31 Dec 2025 15:42:49 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vayLW-000000065pT-1rwi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:42:48 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 32F7F7A011B;
	Wed, 31 Dec 2025 10:42:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 31 Dec 2025 10:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767195764; x=1767282164; bh=I6
	oRe6tM7R6Ju3l0/UD6yTJIFi+xI6pVQx4B5hRZ+Eg=; b=jhTBESzBoAdAlpku+d
	xL/KVxF57a0d+v7qceHkGA279nAhmiKOXPMORorbXKrS0YZZJm2zYPUgLKch/MDd
	mvT5Okgcrp838I8fxxnoOmkN08RI0NPZb530wmQ1UMkNpI/ZYN11XWpGh+SKza7r
	ISrJ3O9T4wHl/UvxdaqUZCN3NPNcNtj3xH7voHYTEKqvjBox2GDTP3LQ/K6010bB
	UFXTbiagmUN4ulxll+vcRBMNaigdqMLdD+I9otQJEOXHYyBn9tqMf7t/TlHiLq8c
	chbr0yytZyVDm+DSDiReKCel1xL6zpPyIo3gh/LIKmSxD5JoZ2TphPC06MUyBiij
	wFpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767195764; x=1767282164; bh=I6oRe6tM7R6Ju3l0/UD6yTJIFi+x
	I6pVQx4B5hRZ+Eg=; b=emrrACMrzmuwagPrTygCkHEJeu5yncGjK1Bwe3AV3RWe
	AaleHMcOeifuihFieddpPS0qewDVe1Z056VPAzEyGrIjJv5wsG7eApX7S3w8cGnm
	XUhVBfs8GKafhWAGZp1cKSozOiz7oIOTKworPXeTk+mjxype/fO1al0zAX36WZ3I
	HIuQ7z8Iq6DYMd27yQCeF3zH87dd5faSO3egWjFhus66u7SxcLMS07/ny97GQzqJ
	GbekHxPZ5SI887Kuh4/BpYBrU2AEPlxOyIWhxwHJrF2YdoHRaKOIwXSUBmqpyUat
	ZiFNj/AQBG9GYQO8/vJ1WYPGTEV9sC9m1YPG0jHf8g==
X-ME-Sender: <xms:c0RVaR31Yhv5FFUGawspHUC6_GssS7CI1zj4hdM7dc2drnSfVie5vA>
    <xme:c0RVaUFpzo4KGcEaEPMsfIY7-spBabchdTxHAONWlv5e0PChfmPcUptwqMOxLF4rh
    BRFSdNdkQVgpTQvqa7NJEt_eAn37U4SFM8DueluaXk0aMYsjbj2cw>
X-ME-Received: <xmr:c0RVaUGHIinlXWwG3C2g5WjfQdfcMwvn0Y5K9JnHZHGOAbk0qGW_oSkrGq5kdSsnTp7dDtPoiXUddQP2btRs6oW1-0hXs41-v7Xq7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeeulefghf
    efvdegleefudeuhfefhfejiefhffeufeejiefhhfehueetuedvuefhhfenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeekpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhn
    rghssegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:c0RVaf7c18kU6C2rY6GTj7sXYaBz-5R5k17glCuKgcjcTJ6U9K4rGA>
    <xmx:c0RVaRwhu2aL7oh-Pw_BbyOZy6kJ9aoNKe6IToHFmevp-sOOax2N2A>
    <xmx:c0RVaWP2yLiyyFn54RyjTC0v8Caal1E_GLKzudCib8GKhWltBdr9zw>
    <xmx:c0RVafkJsrkJuQvRKmA1kjJkzEa4CzvcarBox64u53jehiaU8c1QkA>
    <xmx:dERVabGFEc5XcgRVvTEspDQKjlpiGQE_SF3EX6hC87tVe2-_CdXKjcf5>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 10:42:43 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/2] arm64: defconfig: Enable Apple Silicon drivers
Date: Wed, 31 Dec 2025 16:42:37 +0100
Message-Id: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1EVWkC/x3MMQqAMAxA0atIZgM2WgevIg4lTTWgtbQggnh3i
 8uHt/wHimSVAlPzQJZLi56xwrQN8ObiKqi+Gqgja6g36DJvNcc4oEtpF/QS+IxBVyTyYq3rvWG
 GOkhZgt7/fF7e9wNAW+YlbAAAAA==
X-Change-ID: 20251231-arch-arm64-apple-defconfig-22de55a3d1cc
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sven Peter <sven@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=KqSgDg7CquEl312Ugml0wCimCxIYnUg6l1lGkneON8I=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQl8J31xgu7J4uU2aw8Z+H/SvPpRXVtvr6cafc76uJT
 m2bLDKpo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwERaFRn+ihtMFZgc3Bwae8Gr
 2k532mUb/SNPVXeX/UgrjDT/w/vUjeGfjYi/Y+OtvbnZDNpKb7tyktwWHwh7eO99FmOU/ZL5Vne
 4AQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_074247_025819_BD21C534 
X-CRM114-Status: UNSURE (   6.66  )
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

Many Apple silicon specific drivers used "default ARCH_APPLE". [1]
attempted to fix this and add the drivers to arm64's defconfig. While
default Kconfig removals were merged adding the drivers to defconfig
was not. A follow-up based on the discussion was never sent and then
apparently forgotten.
This small series addresses that. APPLE_PMGR_PWRSTATE is now selected by
ARCH_APPLE as it is considered critical for booting just like interrupt
controller. Since its absence does not break booting completely but
leaves just a mostly useless system allow !PM builds without
APPLE_PMGR_PWRSTATE.
The defconfig change is updated to include forgotten drivers and drivers
which were added in the meantime.

1: https://lore.kernel.org/asahi/20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (1):
      arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE

Sven Peter (1):
      arm64: defconfig: Enable Apple Silicon drivers

 arch/arm64/Kconfig.platforms |  1 +
 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-arch-arm64-apple-defconfig-22de55a3d1cc

Best regards,
-- 
Janne Grunau <j@jannau.net>


