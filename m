Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64E1D10388
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD7JZCX3WSpRYBUjkGKdk6/F/9roVP52zuSU1cyvQeQ=; b=w/uzjiZ6oIqimYEHu11xUO1Trn
	JqUU9ovEgC5Gy8wi6dvQQib+uNILFa+Ix19jtyY1rmgeGveJOIONJgzpjO27I9LryzaUgfNbnWofs
	SNGfED7jfWlmQLSZK/tW+y3ywA2b0+SUGuD5aPIGe1WJui9N7tKPfaSY4AScU1FzW+ddSedwR6s2U
	Xk+micoU3zBIsr7c4hTE0vQwxNr/wb1utZ9Xdti7HUotFIuZUbc1kQVl3AxZ/VvniTx/9wR1OdvAR
	obuzD1n4UYOBfy218WdKlUXKTpn9/KBXtybJVGGA9XNfF+PQTD626htLyL1hqRnh9m2B7mUtS9YtV
	RdCeYypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t46Kl-00000001xUI-1upU;
	Thu, 24 Oct 2024 22:29:35 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t46JC-00000001xM1-06uy;
	Thu, 24 Oct 2024 22:27:59 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso1052026a91.3;
        Thu, 24 Oct 2024 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729808877; x=1730413677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fD7JZCX3WSpRYBUjkGKdk6/F/9roVP52zuSU1cyvQeQ=;
        b=Z+bP6AhAl+uVq8/O6PSaQ0yER6WB6RLFmhVxLk7VN/RHTYozxfTWcrI0H34GvTekp/
         +0F04eyCSKRE+VcJZX9RKKgtyytbUutcsxxFcB2Ufb/8N3x+kmfjU5lYP34UQ71qps8n
         E9Lgryjjdcc5QoBx2PHoUGGB70/XJoycuGMJpKnI/S/MXBuWm8VO9oPp4K/8a7JYLlk5
         tH82Gl9UbirMkY2cNoakmXnTLXennPmSgN/iOHQZqvIbdYa6+rWZfZlE9yJFSdYTChHm
         9WfFtWfG0GPG9mXHUzHmrTvuK9KCXqL8ANyGduC11p/smMrP3SMf3Stb3uwGb0tKOT8h
         hASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729808877; x=1730413677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD7JZCX3WSpRYBUjkGKdk6/F/9roVP52zuSU1cyvQeQ=;
        b=So6jp3AW5ox1jq8CX4GRZWjK4DWlU6Ng9O8NEDOuj8plIdh/6YQEFHwWovhnSO6FH+
         6XpnBrGgOa+kRGBPW3jfnm0yQatPOyHurO2A0jCLYXXF5sLZjUHgpWePfHUM6jQUmzJ+
         3WwxctY5l9CDPGu3raDKiFjE8/LCuZVjnq7oqbpRnhyOhh0YW9w2R6W9gIjBifzY7tib
         9fjwX+NWdMpCxJaeLx8n0QXtdd/etFjfr3YGB7g3MMitFfdE8BxD1k+83l4EuE4wrUV+
         Mu2zhULYz8fQFsZhSBbBHXIvLEzd0En/VNVcomQrFm7aUBLCcfnx8ts1xMeY8f3t9NbH
         GP0g==
X-Forwarded-Encrypted: i=1; AJvYcCVQm+uYpe4uJ1g2iilhXq2u4LblhqIPGbOr780g3lRJYh/Z3w9KXu7wDwA9ooLrsRley7E32RxTOb5YOXlExXzI@lists.infradead.org, AJvYcCXzwqP+/6k5tQMor8DXVpLqLQ+ETHm7kTz9+SUtMPnKudGogC+EXy0xubR+LJP4e/RPz7hW+3XnaQDJMfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJHCEQQVCCy8ODlbx+hV3YWWYjLWsaaOgF3rqKDxmKfa1f+NfW
	OyKdaXa/HWtf4VT9MLCC1T+uS8lrCJIo2GAWkdjwqy5cz/QZauq0
X-Google-Smtp-Source: AGHT+IGQmCYk2RoxkOpXP4PJ+QT2gDC7178GzCSx0ES9YMS9JzYskSa3vPomTHV9tDwOnPLPR2pM0w==
X-Received: by 2002:a17:90b:17c1:b0:2e0:9d3e:bc2a with SMTP id 98e67ed59e1d1-2e76b6cda50mr8866774a91.32.1729808876652;
        Thu, 24 Oct 2024 15:27:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e57f74asm2019615a91.46.2024.10.24.15.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 15:27:56 -0700 (PDT)
Date: Fri, 25 Oct 2024 06:27:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Message-ID: <s2rbj66rarjs33fvmyrwtmeq562pbx7mif5fld56tnk3fm73m5@hlsufkbunu3t>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
 <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
 <20241023-paper-crease-befa8239f7f0@spud>
 <5cv7wcdddxa4ruggrk36cwaquo5srcrjqqwefqzcju2s3yhl73@ekpyw6zrpfug>
 <20241024-wad-dusk-3d49f9ac4dff@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-wad-dusk-3d49f9ac4dff@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_152758_095225_F88CA02A 
X-CRM114-Status: GOOD (  28.10  )
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

On Thu, Oct 24, 2024 at 06:04:31PM +0100, Conor Dooley wrote:
> On Thu, Oct 24, 2024 at 06:38:29AM +0800, Inochi Amaoto wrote:
> > On Wed, Oct 23, 2024 at 09:49:34PM +0100, Conor Dooley wrote:
> > > On Wed, Oct 23, 2024 at 08:31:24AM +0800, Inochi Amaoto wrote:
> > > > On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> > > > > On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > > > > > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > > > > > with some extra clock.
> > > > > > 
> > > > > > Add necessary compatible string for this device.
> > > > > > 
> > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > > > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> > > > > >  2 files changed, 146 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > index 3c4007cb65f8..69f6bb36970b 100644
> > > > > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > > > > @@ -99,6 +99,7 @@ properties:
> > > > > >          - snps,dwmac-5.30a
> > > > > >          - snps,dwxgmac
> > > > > >          - snps,dwxgmac-2.10
> > > > > > +        - sophgo,sg2044-dwmac
> > > > > >          - starfive,jh7100-dwmac
> > > > > >          - starfive,jh7110-dwmac
> > > > > >  
> > > > > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..93c41550b0b6
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > > > > @@ -0,0 +1,145 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: StarFive JH7110 DWMAC glue layer
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > +
> > > > > > +select:
> > > > > > +  properties:
> > > > > > +    compatible:
> > > > > > +      contains:
> > > > > > +        enum:
> > > > > > +          - sophgo,sg2044-dwmac
> > > > > > +  required:
> > > > > > +    - compatible
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    items:
> > > > > > +      - const: sophgo,sg2044-dwmac
> > > > > > +      - const: snps,dwmac-5.30a
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description: GMAC main clock
> > > > > > +      - description: PTP clock
> > > > > > +      - description: TX clock
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: stmmaceth
> > > > > > +      - const: ptp_ref
> > > > > > +      - const: tx
> > > > > > +
> > > > > > +  sophgo,syscon:
> > > > > 
> > > > > How many dwmac instances does the sg2044 have?
> > > > > 
> > > > 
> > > > Only one, there is another 100G dwxgmac instance, but it does not
> > > > use this syscon.
> > > 
> > > That dwxgmac is a different device, with a different compatible etc?
> > 
> > Yes, it needs a different compatiable, and maybe a new binding is needed
> > since the 100G and 1G IP are different.
> 
> In that case, you don't /need/ a syscon property at all, much less one
> with offsets. You can just look up the syscon by compatible and hard
> code the offset in the driver.

Good, look up the syscon is a good idea. Thanks for this suggestion.

Regards,
Inochi

