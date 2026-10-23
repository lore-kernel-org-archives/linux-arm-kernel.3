Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080F606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M77yZveF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ot2Zd7PQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0/rEZzYz4eWyMMI0tiEOBuOXvQdPHJRH2AxNxCrxtXw=; b=M77yZveFwwb6Ab
	E26XJVDhFPBdCQKBqAA0y1fYAOFe+IIhU/1lTrAPEpAHsyl6+G10KeEz6KUhi2w3sXTlJjo92Pn8x
	o1mL1heQohiDSWF/zdvPXnKl6SUawmks+6dOkdAiXgPAX+QcMGkZYtzFTHNW13LUuy6q+dZApnaFz
	zL1mPmQ9ueZPzRntEEFyklwsyMVnV0tVwlsEb/BEOFOhqkXo2TU+WTSl/Dqz4voZcZMEoFiQTajRl
	laEFwgqJeCQ2MChh4VxZr4+AxXmXn2ztRCMmcaLESv0C5DFiYnFoDz08w6b1I9J4wgAGnzbdrcUj3
	rvwt+WdIIx0cJEVaprxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNsf-0000000H3IG-3iF0;
	Fri, 23 Oct 2026 22:36:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKNsd-0000000H3I1-3AJm;
	Fri, 23 Oct 2026 22:36:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 267F040546;
	Fri, 23 Oct 2026 22:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC221F031E2;
	Fri, 23 Oct 2026 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795015;
	bh=0/rEZzYz4eWyMMI0tiEOBuOXvQdPHJRH2AxNxCrxtXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ot2Zd7PQIKUjMMTRzAehp/rauHpw78a1PE7deHqyXPB/O2LWtvAIr6+JsUPPi/SkX
	 7nWM8ShnBMSF6F1Yz4e5BJLY0o0ITNsf3bNT2qn4hFW6EmqNr/XJvA//72qmKBhp7W
	 ZnrlsoRRJWpAlNlZyInM8CSO4a3E7UjXurZr5fbhcuAZDnrSEPm/5ak+4AAa7bvDb1
	 VyMY0lDnYQaHJrcUCxtGjgwlVy/horV87gJAK4UMQT9LyMDk2P9j1fh5852N+aoqdW
	 WWavWtXPQmEZaOS99T1ZuN3SE78tiEOiR2JzAYNnI3zWHlqUOxNjKEo/7geLCOTB3/
	 e2mpkqhL8t5PQ==
Date: Fri, 23 Oct 2026 15:36:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Add ethernet support for the Amlogic T7
Message-ID: <20261023153653.4f01855d@kernel.org>
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 21:06:33 +0100 Lucas Tanure wrote:
> The T7 has the same ethernet glue as the G12A. This adds the binding,
> the driver support and the device tree nodes, and enables the port on
> the Khadas VIM4.

## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

