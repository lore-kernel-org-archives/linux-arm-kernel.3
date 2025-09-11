Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798ACAC583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 05:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=2wahWQbM9ywp5Y/rYQo5XRoHew
	xhGjW2PDsLYPiof6ig/rocgnaN6F7qkYEsfUqo4ye1P59jdnKetDrf3pIcGcmNWcJBVcI1ExKJJmH
	RBFodzLrTV+OYDzsT72Wy+HGt62sOkljZNUmUlPddaZ/JofBxZFe65jZegA1Ae1JkrNDVQxL0VSGy
	zCcSEGgIk+y0ygEqonKlrZftARmzHH6tcR9WrbsYz4vWT0mBbl2BNNVf9rqfdsHS+h4ZW2EItC4Fu
	CWMjKe09lo45Gv1679RSkQWZ2UsZZD7XzZpd2+xFs1N5xpDu/iV/bsLYiBvPDgHTLs6qZXxxOabL6
	HtpHQ1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZa3-00000000wjz-3hUC;
	Thu, 11 Sep 2025 05:10:47 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZZx-00000000wgY-3QXf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 05:10:43 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D22827A007E;
	Thu, 11 Sep 2025 01:10:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 11 Sep 2025 01:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1757567440; x=
	1757653840; bh=96KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=a
	WJfl+fHaZw/mD4A0YC0DDJOpn1RfQz0b7oDnIS4Cn3YT3DDGOx1v3BByvwdPLXcP
	+94DKx3Fh/JjnNsB6jXkxua4CtkmOxh/EnQIe7ZWMUOXtZRMFZgHCa3d4VZodkTG
	XbR5AsAnmigWVPAXoAzig/NGqJVf64wNsxz+GlnFMm1Ty9vjOHuEdrnCSYttsYtq
	cmnk9E6JasQGtKBQqp4NAbrRIIIkEUC8UuBj5ps6DyegFCzPSuSXCN3zw5kFQaMc
	2oK9HdjqR4YdLlAEEWEvpR9rd4GEZsRm1WbL4uaSJFqRJVPYdh4R8JXvN3wmKvCu
	Fsy3ZH0GSJY+l3QnQsqfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1757567440; x=1757653840; bh=9
	6KHcK7LleltChpzhPpywBhRsLQkTbjtjGXxMC2iELA=; b=a5eWwZ8AqMYi328tq
	iIvDYEDPtfp3mQWa+Ur0LcAfvGgtr6G48aA2a5dpxgopXrwMUltqxefgRE2wuFeT
	sAbKmsVqOp/S9wLOfHt3uS6l0bGHtupsiAQ4vF6H8jVoiASXvVytbCFI5XksTXHk
	IsY3p0my2Vbv31UyY2tzdI4iUTPrtoFCjcODDIZrAWZZfDbTuiHF4oepvoGz6j3g
	HONVJC3JG2ph7IXsJ3mdzKFDWJUB6fmGx8wKQLtuv9MLKdNj0JhsIntklBrmfT9c
	MjKsXz9t6sZSUptQsJoVFBeQOdpaWdsTQKNjOy1SLs95LlM77y6h2xJ2Wv0l+OdU
	58thQ==
X-ME-Sender: <xms:z1nCaD_CB9TG43YGVAaneaxCdz9KhcEr3RcIWQnDAxciVjO4WQM_Rg>
    <xme:z1nCaLi5F7EQmXnFqM7CBms-ZCtCQ3RK-pWgOrzaNR2TqChYVw5ENhdYnwCjFpRSI
    u7DlPjowmdbskiEbgk>
X-ME-Received: <xmr:z1nCaMac5kXWQ45oq7PRamOF5asNHOG-_IZoNxaloIPIbiJXrivhNkV-9Hm90zzjKqkUWvyACeig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpeegffeuueelvdeggfdvvdfgtedvudfhfeekudekieektddukeefteetieefvdelfeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvg
    gttggrsegsshguihhordgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgt
    phhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilh
    grsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:z1nCaI_hQGFWsU1qhnus-fPH1BiVd5n2pZ_Kp30_EZkcb2lkKSZn8g>
    <xmx:z1nCaGMapetGo919lVEcimdrpT_GODRNIXR9zZnD_30kFk0GvaYUXQ>
    <xmx:z1nCaNH_QwPvHo4_tHsqUzADeYSQYcFeMtjkoL3cUO7e8Wq8x57taQ>
    <xmx:z1nCaMy_Dli99A6M1XEgLcse_mFu7OdQRgWgNS-Vv-WvwRly0Mb9pw>
    <xmx:0FnCaFKkG9-3-SGs-M_ZnmneEUZZrdSaiDxquyQdUm_MhLIvZnLJLQju>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Sep 2025 01:10:38 -0400 (EDT)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Wed, 10 Sep 2025 23:10:04 -0600
Message-ID: <20250911051009.4044609-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911051009.4044609-1-rebecca@bsdio.com>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_221042_193593_243EF923 
X-CRM114-Status: UNSURE (   7.38  )
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

Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
compatibles.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..7d5c6bfaeb97 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -34,6 +34,7 @@ properties:
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
+              - asrock,altrad8-bmc
               - asrock,e3c246d4i-bmc
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
-- 
2.47.3


