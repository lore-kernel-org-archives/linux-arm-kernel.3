Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11679C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Wb7ryl1h9inAbssxgRRcYN71OQc+xlwlTh30aapwQ0=; b=NjlVxyp8iATsWtkxNFvcePjsKV
	0Jabe9rhz+MGzuvmbnp/ePM7tyIE69mTGX4EeBudZ10HktL6/d1iiEBUyCv7iWyw7kGJ2mUTDsP1S
	gfWN6B0skkcOByYLPyasYW5rL6ZBGJyoEgsVU3ziDtbu2wgzFZH2AOAK9HKOOARSX06AfxOhXnkrr
	Sucx/W2c/GNreumdwO5GDfdhH8E8Gp26e98uupELGYTmfnp/sTthZMgNpAkLYZBjRrdF0H7Nzd63V
	tx+VWYciZJ9NzE69o2jY++Pv6CVVWemftNQ3Eb2D0pSUrh0n5x/vpmhhkWzkEq/W/nzGrop0d9sxJ
	cFHw3/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzm-0000000CTWo-11xW;
	Thu, 03 Jul 2025 20:57:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLte-0000000BpXh-2jv2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17D9E4652C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED631C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Jul 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751556646;
	bh=kf3R69g/8+n9ejwwkL6h4el8NdPueW74hEy4yuQ+Fcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PZMwGe5dNAHXaQXy7PzKulv/A+zJtJvHhx/HmtZ/JUiEEL3LTDkl/EkJGRoMJXlMK
	 4edeGRsBNALWZAnkPPW+RYmJKC67N8n1NeFbAFo3Yhd2LcsB6Ay7qVRFI2a5t6bBsL
	 Pfu87cyQNJvfsrb4xhkgIRx5cqx4xEYj3bcccNodHNShokUkNoTFGqLHzDE6yZ0bPN
	 QzUm6SSXCQ6EVw4MslSkk9Q+h/3NnJYUly4YGAWNFida9xCXJCPfMyO3OC6U6cQcG8
	 /fs/DBU89ZIQZPrWKAUxlJlVQEp+hylznjNgXArJ5VkSM0cZ2JzlVYjKtKnb/YwrFB
	 isoGvoUwwbrqQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10871612a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKCfkUS3YRw3rYyVvUxvfwTi0uiUX2tAwTqDrpc2nKJlPdpYGCkR2a05lFWmXbcMuuA8/F7qdqJeqPxg5GLzQm@lists.infradead.org
X-Gm-Message-State: AOJu0YyUd4UNLfDEAPvRSdveztiNCW7dWdgZ9SxKWOs+qYugjtIHyrWj
	ir9RfzXtvFozl2vWLtiI8uleQ9L0+j2zoCpijoZPUey/l7gHZi1QIkjppIcOFTaANjEPFQW5ucj
	89oIcRvpGJYXdBIjE7wJzTt57WI43ow==
X-Google-Smtp-Source: AGHT+IFGK3wNYEmDTQE7cJvW5bwhu5w4lNajdS9akjc5i1/E/t6dIX21GgObTKsLF38FMy+/VygKrLB7PYcfFn+IPck=
X-Received: by 2002:a17:907:94cb:b0:ade:44f8:569 with SMTP id
 a640c23a62f3a-ae3c2c9d41bmr815278466b.42.1751556644360; Thu, 03 Jul 2025
 08:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 10:30:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrLJ6wiqBk31NhronsUqX4_5FN-Lb26r-3SceDD7kkAA@mail.gmail.com>
X-Gm-Features: Ac12FXxuKTihI_ySZjceamap3hZ9PwUnYru49iIiSxON-urQArDwhuRwHAUu1ZI
Message-ID: <CAL_JsqLrLJ6wiqBk31NhronsUqX4_5FN-Lb26r-3SceDD7kkAA@mail.gmail.com>
Subject: Re: [PATCH v7] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: dinguyen@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_083046_708871_7E28F62A 
X-CRM114-Status: GOOD (  10.26  )
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

On Mon, Jun 30, 2025 at 4:38=E2=80=AFPM Matthew Gerlach
<matthew.gerlach@altera.com> wrote:
>
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.

Did you test this against your dts files?:

ethernet@ff804000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 3]] is too s=
hort
ethernet@ff802000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 2]] is too s=
hort
ethernet@ff800000 (altr,socfpga-stmmac-a10-s10): iommus: [[11, 1]] is too s=
hort

There's also one for 'phy-addr', but that needs to be dropped from the
.dts files as it doesn't appear to be used.

[...]

> +  iommus:
> +    maxItems: 2

You need to add:

minItems: 1


Rob

