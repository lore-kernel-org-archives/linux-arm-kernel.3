Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5BDCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML8MT93NBaCozkqy3f5m8pHWK455oP1ORVjpuJLm5oc=; b=HWG2pmE4JT6ozDFc3NX7iqrOsC
	MAVRvpOirkQ4GyjfHJOaOPLODMeY/lhOX8rh0EK5mua1ngkxbAivvIDSftMM+8jhdSkqSyJMzUqeF
	c85LEhkpRBI36Z/XaaSEEtXpx1vI4ZMbC+idMwwME3za+FxOuMGnWnIjFp7Yg3O2BqnXJD+Gg/5j+
	BDbJJFzOiUkjbpbqbLA1z5cUONmEjqRNaLbtZFtc9Qb1HQspVyyu65KrEDim6lMNBHhdTc6XnPlJM
	ayIro/Jb1S3bB5VqMySgUhX85hSFqnhvnV6FFq1YZgn/pU/2ddmIdYjI/mpRyfj1kcdcnj6IqYwF/
	TK4CmD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PB9-000000003bE-1l7U;
	Wed, 24 Sep 2025 13:05:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PB6-000000003aU-37MA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 13:05:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso5226122b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758719100; x=1759323900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML8MT93NBaCozkqy3f5m8pHWK455oP1ORVjpuJLm5oc=;
        b=ccQ4w7/tOWMaTpRUVeil3K2n22jRXswxKUOwT6Srkdy7+axpt9uukE8mFRYIEPQ5Gx
         mAP4p4EyFHxAXTpX+qw7nMrq9aQJLH0zFIk1KjoLdILd7yn1nGjxttXV0D6RlFmDNMdt
         NvbR3hnW8PM5FlZkb81gJDXF/8G80cpdbOd84171HBu2gqaEGJTNqoSTYJEmh2MUY6wZ
         Nc+Qm+nyggvaIJszBoRXmxeOWF2xiIT4UYejkViqRytlSKvdMMZpA8JLHe2m510Kh1a6
         GTa98/v/waSZBTVmieU6T2ge/SdkWuGXKBK3rnnWq36nT5HxXEvDGMs/Ub/WBU94Yes8
         jwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719100; x=1759323900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML8MT93NBaCozkqy3f5m8pHWK455oP1ORVjpuJLm5oc=;
        b=w42quY6smY1hN3hWlK9KmQfrcitUi1nKok4+3M/Guwt+HniOjaeHmjEu/sejjxhIu8
         GxExL+1vXZR2Ge2kl3ibHwcLGrXTUIkAIPlnW0SMwM9SeiYbyRX0JLraq7mK/ZK7UajI
         mnTJcKeRPKn7FmRt8CWha3dQqxEZgCCjbL91CSIsIE87RmuDkeVkhfGoPUuJHueETiW8
         BcngUpWHdFS1uyRDQFOr/XYZ4q6x3qU2MNbWw+4cDdTyl4RecSkfkt1L7rCPk0CHuuIE
         p5VpFn/W/1eaelVazRK8UbedkhwmpqcmawPzEDNEdUhFEPzrQJfxXtrZSRvum3j4DEOS
         or4g==
X-Forwarded-Encrypted: i=1; AJvYcCUG5E5TP1vgxfwrDxlK8/wgx0bxdoRpXRBxctMHMyqELX8+rRKWN7Ftv4JhM9gqJqVXY7pVonIhk2y53w01GblF@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIGlr9AEQKqooGyYstvAz1+vUvMGen0vlcNCoRyp4kV+7feTj
	yQsx0eIwge8xvbcLyVFCQgE8JU4EFFkBw8SZPynFw5aGI12Xg9SqQF2JuX3CTySCMfzhsL6pFHj
	MIz98v+oedk86zHTlNrY/ilSHi7qzVO0=
X-Gm-Gg: ASbGncvJFz9b68F0zkGj3DDwkgId2amX6Gz+humckSOn4U9yC1o6MfxPg35U4dvWeq8
	bMfa+mAxGC6ISy7TbtfSb7uaxHlQYzLn7AodMDZ6VqZsLZ5Hbtu24lYtA/0HjwstkHDyJvhucCL
	+DPTOJu8q4A5QOe37MUowyl6678Cbg9f5DqW7aWiqY3cCOXIYaRgXsbE+hMobq/VNQWzt9hHBwU
	P4SC32D
X-Google-Smtp-Source: AGHT+IGCUZlb7GHgT5j+JVNTpOON3z17rHhaJH8wYaV5Fzq+5A7QIaXDxQAJZsuGjTC053XYov/IrdtaNcnRVtX6QBE=
X-Received: by 2002:a05:6a20:6723:b0:2d5:e559:d241 with SMTP id
 adf61e73a8af0-2d5e559e089mr4875908637.7.1758719099609; Wed, 24 Sep 2025
 06:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch> <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
 <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
In-Reply-To: <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 21:04:48 +0800
X-Gm-Features: AS18NWDPd9WPADUis1pKLRli7PBC0PtWHTmrvMja5YpnlZ2VdCkq5JfPN2APv_M
Message-ID: <CABh9gBcoWbXurPo0f9U9+gz8k6gttUvj=NMMDVfgjo5dgaTLSA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_060500_790471_9B59D8BF 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, Sep 22, 2025 at 10:47=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> > On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > >
> > > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > > Summary:
> > > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > > based on the AST2600 BMC.
> > > >
> > > > The Yosemite5 platform provides monitoring of voltages, power,
> > > > temperatures, and other critical parameters across the motherboard,
> > > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > > logs relevant events and performs appropriate system actions in
> > > > response to abnormal conditions.
> > > >
> > > > Kevin Tung (2):
> > > >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> > >
> > > The threading between your patches are broken? How did you send them?
> > > git send-email? b4 send?
> >
> > Yes, the threading is broken. I initially used git send-email, but for
> > some reason, only the cover letter was sent. I then sent the remaining
> > dt-bindings and DTS patches separately as a follow-up.
>
> I recommend using b4, it helps blunt some of the sharp edges of git-
> send-email.
>
> https://b4.docs.kernel.org/en/latest/
>
> Can you please send v2 of the series so that it's properly threaded,
> after applying tags you've collected for the involved patches, and
> checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-
> yosemite5.dtb`?
>
> Andrew

Sure! I have sent v2 of the series using b4, and the patches are now
properly threaded.
I also checked the work with `make CHECK_DTBS=3Dy
aspeed/aspeed-bmc-facebook- yosemite5.dtb`,
and the warnings that appear are not related to these patches.

Kevin

