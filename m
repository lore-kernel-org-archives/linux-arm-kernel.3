Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA3B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nrjdDKKI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dSHJZR5Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YXve5J5rsnqYTJLKWzayn9tENd9Qyjaq81ooexAaK8U=; b=nrjdDKKIoK7ZijdWEqLImtc4Kb
	Hfko0dUxqmZ0Jc/ucq0qfSHA9cm8/E1qW2FHlUGdYAbzq83TPawTxAbdUru9xPy0r5vW4IDi6WcO6
	jBrK9Btjb/zk7ogViAiH7ZkEEpXx8soYqZyFkwEX+FzgdjHdeZdFIyO6ZAJmFi5Ps3NZYYhzFbn3W
	HgrUoGnO6MTewGk3MPPynrwn3l7k9mnqwPh31C5s/TrikBdcyVwZ0HuCwiwEqegJqnPmnYvdN4r8d
	S6JgdDYh8K7iVLgxyh3swki++ijGEbvxiOpP044TPcs1Dvk9xAqxc2RsdSh6TqpCP4FD5y7qqwJtu
	3SiWF4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl3s-0000000BaZA-3J6T;
	Fri, 30 Oct 2026 11:46:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl3r-0000000BaYz-2N6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:46:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09A9B60252;
	Fri, 30 Oct 2026 11:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319591F000C1;
	Fri, 30 Oct 2026 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360778;
	bh=YXve5J5rsnqYTJLKWzayn9tENd9Qyjaq81ooexAaK8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dSHJZR5Qm57R+XmDN7nseugSBUb4jFjuF5tRuJ2zPSaBRHh42g6ty20A52MeffUvL
	 AWbyGU9Cg7LPilw5pHZJXz9o5WZr/1a0gmxpCeiguDQ/Zhq6krg8TpiWQHAKJiMU40
	 oAsixTK0DvYLv+QSfV7a76FrfSTVoeEhnyz8svEDw6pD3j42BPhieW0ei10cFsuesK
	 PRJaL0IN5PGzL4x6FlokCRh0NxY/vKVMcYJtgGkJ7Vp2UUl7LNsik4BBhePTBzchx7
	 yafGfu1lMlV2/WZkaw2wkjhbqInWgzUOkEPotHg4t2h7ngk0BfhBH456KiDRZwlqV2
	 efwz6svJqBXrA==
Date: Fri, 30 Oct 2026 12:46:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Biju Das <biju.das.au@gmail.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 5/9] dt-bindings: clock: renesas,r8a78000-cpg: Add CAN-FD
 clock
Message-ID: <20261030-automatic-marten-of-painting-f5a3d4@quoll>
References: <cover.1793278754.git.geert+renesas@glider.be>
 <843d6df21b3ed139ec71a702e57fd5b516c139a1.1793278754.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <843d6df21b3ed139ec71a702e57fd5b516c139a1.1793278754.git.geert+renesas@glider.be>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 02:11:06PM +0100, Geert Uytterhoeven wrote:
> Add a definition for the CANFD_SCP_MAIN clock, as used by the Controller
> Area Network Flexible Data Rate (CAN-FD) modules on R-Car X5H.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg:
> Add PWM clocks"
> https://lore.kernel.org/e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be

Maybe just squash it there?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


