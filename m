Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C314C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KX0PekS4oyZJN7vq29nBWyPFMEjESyyECU6yqKwIP9E=; b=GHRqqIwhTwB09NuvJqAQJ/7LpG
	9I+KLOKf0dprjAoiWacnfEsAZdFS92TaNYpe+rOWeDEudoJCTbgIWhUYULbrvgV+Xpu/+wfIMFqaQ
	azHkt75wiYAiVFlC5LyMuzsiJEVLFtMBFBAfNlBZC2t3p7k7uxyU/kTrPvkkGUKLABChXkuXh4Aj9
	zwQTGYjaVoMGHvQ4k8XuJmTYaBMZwf/dJ/LG/jyfuU1zrkUPfqa3nSQvZtB8Ynqpabh9Xak1A6yb1
	MEb0H7DKT7A/BJy3cSRbjFp8x/88MzJTeUcfhYgRUE7svv3SF7FedWj1BVQa3VRtaDRMq22BwRgeP
	7ZunQVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYW1B-0000000Fwzc-34nC;
	Thu, 16 Jan 2025 19:59:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVzu-0000000Fwtz-1fq2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A72AA42785
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF23C4CEDF
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737057464;
	bh=BpGbL4CFfsflMGaBvp4j9m1dN/ZGd8uGCM2kddow5H8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aqj/PJ7JlbWZi20JPqqhgl4FtKBowEHKrr5py0QJZaT/h7NwbJLKWtfZF5HVJ+f01
	 eaumhpfu06/SjCfeP4TGZg7LFj0jw5dpOxHBHmnfIZjWAOLq6Gictv0ymZ294BVo+6
	 wZxDS8gqUVXCZFkkiyPfGqx6r+MImWIilKWs1HvUPklZ8YaFqKl3Gk24rjgg7ys+D2
	 TpIs5/FNVV7ktyFEOULoBvnjU5NoveD+FaNRhRgWJYYvPlaC2gBzCYDaoTGt87wI8+
	 WcnzI/xvOoCtspwq+cwpNhM8PyQ0GWcAnShRPgNtAGka16GTj2unoDYSF7vH1jGFbW
	 mkYRd0WRyzITQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5439a6179a7so526847e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 11:57:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa+0X5G32SkimTbYfA9B5pGMWVcX3k08uFNBhHgUEX7M2olIJLWl69eFxHJ7MfU8YGuvgXx+sMkWyXlCLDiQhb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3LHn1ZcEgPVoKTNin/HJV6s7+OMh7Z7GL9+dPKZSVVDZpd8wz
	XuYaDpaWkUCTs2H3OVeqYy38sEOeuQMdFZzd85txC9spLNHKN535fsqQkgBU1eYg9yidgJD9VPJ
	PNUZuwRCrlZ8Fnt6S1qW2yObatw==
X-Google-Smtp-Source: AGHT+IE8PDn7axUoinBnTIfZ0cfMVPVQgH/bj9hTJDusIxJXQXf3Z2wDnrh+6FvWe+I1CQJPWkBXl12skSmq8p7UwQ8=
X-Received: by 2002:ac2:4e16:0:b0:540:2fe6:6a3c with SMTP id
 2adb3069b0e04-542abe955e7mr3496186e87.0.1737057463177; Thu, 16 Jan 2025
 11:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20250114220147.757075-1-ninad@linux.ibm.com> <20250114220147.757075-4-ninad@linux.ibm.com>
 <173689907575.1972841.5521973699547085746.robh@kernel.org> <35572405-2dd6-48c9-9113-991196c3f507@linux.ibm.com>
In-Reply-To: <35572405-2dd6-48c9-9113-991196c3f507@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Jan 2025 13:57:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1z4w62pGX0NgM7by+QRFcmBadw=CRVrvF2vv-zgAExg@mail.gmail.com>
X-Gm-Features: AbW1kvaz7cz0JErISAQO978pEbpoqDGvU0yV8aV8M5Xy632yu2go8X9lmt54eW8
Message-ID: <CAL_JsqK1z4w62pGX0NgM7by+QRFcmBadw=CRVrvF2vv-zgAExg@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com, 
	linux-arm-kernel@lists.infradead.org, edumazet@google.com, joel@jms.id.au, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, andrew@codeconstruct.com.au, 
	devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org, eajames@linux.ibm.com, 
	minyard@acm.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_115746_500865_A63D3E22 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, Jan 16, 2025 at 9:04=E2=80=AFAM Ninad Palsule <ninad@linux.ibm.com>=
 wrote:
>
> Hi Rob,
>
> On 1/14/25 17:57, Rob Herring (Arm) wrote:
> > On Tue, 14 Jan 2025 16:01:37 -0600, Ninad Palsule wrote:
> >> Allow parsing GPIO controller children nodes with GPIO hogs.
> >>
> >> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> >> ---
> >>   .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++=
++
> >>   1 file changed, 6 insertions(+)
> >>
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> >
> >
> > doc reference errors (make refcheckdocs):
>
> I am not seeing any error even after upgrading dtschema. Also this mail
> also doesn't show any warning. Is this false negative?

I believe this happens when a prior patch in the series has an error.

Rob

