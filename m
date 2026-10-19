Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zH/WJL12;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnlc54Uq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuCA8FALs5XB63BHgci+9kNkPVibLG6q04A/+CjblyQ=; b=zH/WJL123JBmVn3SRAstZvuCNq
	A8wTh5zBMjNeemLONATySpwFdCDu25y5MWdrAByaaivpvA1CjomIeioRwCD76WY+U7eJRrrU3ship
	UaDqZFmBb3rA29PbflFVhd/CtjLWnsuDnwgHXGTwCvNEtzGd+3Fw8l9ayH9Cn9eQp6AK3POYCRaX8
	C5YygSrVuMVhbL2mh0aH0fh1Q50U/PG0TM4D3plFeQ1BZVtGODOHVxD2+K9U8jpzICZ78+U1MP641
	v/6TGRcZttMgou20UCC6kTXqdb+8/mmsi3v0ahPH5xaDjIvw6AuqyfdKogng/cY+sseKmiDtTJN4B
	rcf6Cwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq5h-00000007x7a-0IWK;
	Mon, 19 Oct 2026 16:20:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIq5g-00000007x6w-1atx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 818D860534;
	Mon, 19 Oct 2026 16:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651561F000C4;
	Mon, 19 Oct 2026 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426799;
	bh=RuCA8FALs5XB63BHgci+9kNkPVibLG6q04A/+CjblyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lnlc54UqHCLaUlrGGl5GW/i9SIefxlsNuimk/lYP1lQ+vIZM64q/r9ceyLqHAMiBI
	 fWLNV5F1jDfoZv7W6c77V8xMN/nOcELRnVtxvRAnuBPTRY2VYepws0Oy0vyQSoTbxS
	 lD6gJLKXX901HeOspu2pGQV2no4zkZsCptwNTh0/nX9ZGJzM2JTjNweiY2cx72BD8k
	 fosHLGad4CznoP2JgalBgpLic9AH5bvGD9LU5d0WHjHIeohI6i9T+BcTIPVyJt+nli
	 L8If6pnhS4wM8cgRdktkqNp2A+89JGt4SFcynRt/bRkNzgN3LtvP3Zji9hjLtn7ZB3
	 22PWxBv32jwzw==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-4-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-4-9352be6b86b1@kernel.org>
Subject: Re: (subset) [PATCH v3 04/18] dt-bindings: mfd: db8500-prcmu:
 Deprecate EPOD regulators
Message-Id: <179242679515.1178810.16625867453853597322.b4-ty@b4>
Date: Mon, 19 Oct 2026 17:19:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 21 Sep 2026 00:48:10 +0200, Linus Walleij wrote:
> Deprecate the db8500-prcmu-regulators node and make it optional as EPOD
> control moves to generic power domains. External consumers of VAPE and
> VSMPS2 now use the actual AB8500 or AB8505 buck regulators.
> 
> Stop requiring the individual regulator child nodes while retaining
> their definitions for existing device trees.
> 
> [...]

Applied, thanks!

[04/18] dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators
        commit: c8132247fe4df52e9982d74c986bb199d792b85b

--
Lee Jones [李琼斯]


