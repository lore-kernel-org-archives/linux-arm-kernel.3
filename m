Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E98606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 02:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUsr8+59;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikpr1yP/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EEbpi7PJ+4q9acxRxZPPipTgrTyR2mdkDd/Q2MjCxUI=; b=bUsr8+59WktMuZ
	rdOM2+v0sVkLcTKkIFlkM88SGTH781QkUmCSTHy5K9mmbdsWtGiB67LzTPKehCWN+hGZXAJew5Xro
	dXAh2IzFDqiKs4xVMn0WSDFbeTkHZPwsk1fDpbT3blnjZY2f0SmSl+Y4Yl6KLW4+IxBGKbA7lsH8g
	JzIZvzUeB7sHa8xZQTp3Lh+DzWiHA9UsnJwj9NYmtRCccKAZvTFPQqkvPGG0Dsyyft+yWpVXgbZwD
	CmnMXjeoT6bw9KspQbXmU53NFXN+6jd46/Xf46wCtU8626ZdJ50FpIl9KkJRzQxPUGi5kJ8gxiU95
	in6CZ13LYldQysR0vqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhP8-0000000FNzL-35ru;
	Mon, 02 Nov 2026 02:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNhP7-0000000FNzC-10Rl;
	Mon, 02 Nov 2026 02:04:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D8CB41652;
	Mon,  2 Nov 2026 02:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E3C1F000C1;
	Mon,  2 Nov 2026 02:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585048;
	bh=EEbpi7PJ+4q9acxRxZPPipTgrTyR2mdkDd/Q2MjCxUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ikpr1yP/BDH+G/tY5bVXVH762hJ0j/qXhMh4OLtbq2Jrn35JaxyXC96D6sLsjmrE4
	 KPbVzJJC+FosJYbfIowK+k57ZRWBuOKbPrYlDbhGAXM4cgtwz9V26qPqPX10VnvMYU
	 i4UO1TQEjtEIhP4CYVBehDL8o9qxd/8wlU1umuQsgHwFKmphFgiliuWIl/96jYOaBj
	 VwzHHcQ088BatZNotNpgFGjQvf9uZEuCR6La2nMBhwHEt1DwlncQ2C5otlcnTc+zjr
	 BtJsCRdyVuqnKMumA54qEtXwIAIWpPxCEksi9NDtf9dGgbiCxySewoIhiBk99wG3rY
	 Oc9RvZ0f3GYoQ==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, 
 netdev@vger.kernel.org, James Clark <jjc@jclark.com>
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
Message-Id: <179358503716.355577.9187303706042543606.b4-ty@b4>
Date: Sun, 01 Nov 2026 21:03:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=jTkvZ/L7zswWdeg8kLhuRySRfybPm2VPf54LiwO8r88=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKev59w/eKliCdHdSStvmwWPsgaJXbK/eeLpokJ3fzFX
 KsYJAWVO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjItBkM/1O/vdGbIfTsxdZ5
 Xybucvh/+nWaJe/TeVXnTx05Os/618uzjAzPZDOsm0wfL/v4ZCmn3M3XunJfhV7Lr5TcsPwqz1/
 5Y0c5AQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
> clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
> 
> The timestamped MDIO write series [1] needs the reference clock the
> GENET MDIO controller divides its MDC from. On BCM2711 that clock is
> not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
> a compatible match, and mdio-bcm-unimac's clock-frequency handling
> assumes the 250 MHz of the STB chips.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
      https://git.kernel.org/clk/linux/c/af7994af5228
[2/3] clk: bcm2835: register the BCM2711 GISB clock
      https://git.kernel.org/clk/linux/c/ab94dbf30233

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


