Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3CFD1BDC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTR3+sS9P1VrDSHHp7HFfV8uslvkf5pZfH38msw4fe4=; b=IcccQqjnpnTaIG7BM6EAwW6PrB
	yqdnxFaR4ksJtkVK+vGn2woDNX2+/9NXFdmV5ly1BPu+Jw9BC2lMCuznwCEC6CNfKmoBfydu5itsc
	cZe9B1EKnnrga/rrYlCo/0gPPjrNn4SwtI36hTw5W4KUAhvIVrQ21jd2hCTXjaDG6M4wgmg/IF74W
	gdrU5yVri9NVDGZCjrmDHGCneHZcAtTT/HsZhxsLZhI/R9w7n2gJGzWxufoKz+Lo4Qnfsb5SEQMhT
	GsXtXRBoj9jFPlgMzK//Jx6xzIu3VgYvjujxGP/kZxY5VASiMeLz5na/E16j/Lp7Q5F47kwEUvQ4s
	5Fjdpy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zW5-0000000EJCn-3SpZ;
	Mon, 04 Nov 2024 16:01:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zSR-0000000EIFn-22za
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 15:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UTR3+sS9P1VrDSHHp7HFfV8uslvkf5pZfH38msw4fe4=; b=JTGxvJOHCwdJH6sZtwE8qMd/RR
	tM0UyrRfL8DRIgADcYC21GMV9+Ekp+7lE9bDNjzHPaoLPeLzXZa+DwjdLnuUrIekjlX4+H8qJsb2t
	u2CFW2uTK8vzqDu/niE+v3Y9Flgl5aaiDOyoV7h0NM4SozP5Va2KyGxENkcVbFREEwSSYTmrLmeZV
	hCAfgUF+Rlt9xyAy/qJ0Qn82JL7e1oLGQspBSecfoS9+r+j2wXlO5apeQtHbpVibHV1HJ/j+ML85F
	f0jNGBhi73vfdmdbWzd93JmU+5XZ8r+tsUZ9M+1fuaoA0HsBCvSNZaVzuNR+IL4ZXEZpXbLi6EuWf
	NXOHABoQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zSK-0000000BNIZ-23r8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C4FF5C3C0C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 15:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1BDC4CED2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735838;
	bh=du3D9Ti6JlIpp3Bx+I1pxH4VeSvLJQ6Ys6/W+ho9O+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WhkgX+5Dt2lESakf8onXXzW7cZ5C/VqXTnynUXelk6LMEmiXhiiS5uKvIiglYRRQd
	 r9RgkSZwoBub61J/vu+uTCqUEU5Ysp0D09w42GTSBZWCxX1EfAehu9alRA25tch2LA
	 f0lxhUclCAfrEgeCiP7XMk73AL1jAXLjj481hlXxCSN67ZjIMUU0zsbjfEbevIoMJ/
	 5WrBNrm/zPmv3jByyuHyNh2s3y8gktj41YrXr6X8tTIgUsbLAz6duPWeSGogxZ43h5
	 iX9Q6SKBCIk9tK5vr7TMzpOKsV2UaAlMIR8AmfYR6NIq/rmyqePpo/iA+7ZCt7RwqH
	 axASATQSWEtlQ==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so4009663276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwQRt/dXvDYye8dL1Owgvvu7xkTABMykLtaOK6ju4SrqYaLz9FpbZMnRVQRGS5r3+VdXRsy9S3QxEI780m9EXs@lists.infradead.org
X-Gm-Message-State: AOJu0YwiAjbi1h18S9M+twGF8fyt3/Hc59cBr+pgUWZBClD9i6OZUlR8
	AAjqu9cG+RJqyQy4sWj37rSt8sTokoGii3NBLpmBNw4/O8Gscl7XM5Z6hZYv/GDkICU0Om4GnXG
	NTdUSJ9p/Of4Qpq7laHIOOZXcOQ==
X-Google-Smtp-Source: AGHT+IFJthhkSzkBdnbiB5dDIi1s/eaCvQbG6JsPmn7TbVCmrz/zQ6MVdpFKk0iB6A/Zy7+RL9YE/wF2HoO/7hQxgz4=
X-Received: by 2002:a05:6902:3188:b0:e33:25e2:4af6 with SMTP id
 3f1490d57ef6-e3325e24e4amr5209097276.6.1730735837784; Mon, 04 Nov 2024
 07:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20241102125712.2647325-1-csokas.bence@prolan.hu> <20241102125712.2647325-3-csokas.bence@prolan.hu>
In-Reply-To: <20241102125712.2647325-3-csokas.bence@prolan.hu>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 09:57:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+BFBTUT_VrkmCTV-XBmNvscGF0Bzfj7LEeytRea55aBg@mail.gmail.com>
Message-ID: <CAL_Jsq+BFBTUT_VrkmCTV-XBmNvscGF0Bzfj7LEeytRea55aBg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: sound: Add Allwinner suniv F1C100s
 Audio Codec
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_155728_875600_6A6C839D 
X-CRM114-Status: GOOD (  10.23  )
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

On Sat, Nov 2, 2024 at 8:00=E2=80=AFAM Cs=C3=B3k=C3=A1s, Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Add compatible string for Allwinner suniv F1C100s audio codec.
>
> [ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

