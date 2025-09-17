Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7BDCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsYcWLS54K1ej44Yjhz6yrulC2XJ3aJ+2KhXmhL8N/4=; b=IpPfC06ywK0zfXAaqyZlOYhSuj
	vPls0kocePgl47y2hFPYGY8lJc6N5nFFP7hob4nacbiPwM0Xjf24i3KPZYap7pyDvgOZU7Bi8esfA
	zyn6rQvBuWPYRK/2uKlofH9IZGwkV0+7VxY73nPD4sFfn9Zr2XgzSxMXlvpVviuAh3AxsxKx2fiIi
	dNb580ngC8KCIVSIqgzSOv8vbI563pReafaBnUczwzIZRKwBOKo8vuR1D18PlS1tQZIYzfzl78LiN
	x7GsGRlwzk5qQBHwsf5PoIzYvUJ6uRVtTV9XMhPFl7+45/EvCxQOrA88Vlj5PdVQgoPkBZPqAyQPM
	LvD6Dm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypXt-0000000B0gX-1LnW;
	Wed, 17 Sep 2025 10:37:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypXr-0000000B0fW-3038
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:37:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46256e402fdso760195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758105470; x=1758710270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wsYcWLS54K1ej44Yjhz6yrulC2XJ3aJ+2KhXmhL8N/4=;
        b=X2/gRBBC9+54MJyLh5EggalFlMBWvo9BVxGDawqIfw9fXdLWNO0ld4gTQjnSuAG7VD
         2hZGpd0ssgvl5U3jCGxgj5nrfMgDp9NuGCxBSI9dWxBZh12ZtLko6suvkA8FmTH+8o9s
         DrnSOe7FRoDTYaNLprRpcI+4rVJIgqBeUFIRnGY897VoP3nlWDxKrGA5HtfaGYYdcAl1
         Q9zSWYX+EKWoDcNaXDPpIzMwbRc28H7ola3lWlMqxl8SJ+bA0+3ABb0fQcy9Gb28UzdE
         Kh0no+bzWvMugiGWPe5cIclzlCyZu3riojm0rbEksPHOBNKvOXMExa9av8OrroAgjJ8f
         eJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758105470; x=1758710270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsYcWLS54K1ej44Yjhz6yrulC2XJ3aJ+2KhXmhL8N/4=;
        b=HAPh8c25JTJFzSwjCGqYYTy5i0yqngahA86QDJDb8lRopbXYuTCq2mQVSBMYkSCRv8
         fvYuxmewWaYAppjs6oOk9wz0wB/NP8TM2VEgkYn5+1SncJQRCOMKGn/pv8wZubUPwg8Q
         Fxnv8yi7fs7TDoI0KMtyaPGAz056LnCoVUACuEvu7eTYviLBnmW5PaMnM7MQdAuVxsmN
         7D12MMATN8hiN3JiTw10emhMUpgauUh3NGJ5y0xEPQ0avHDQxynxCZaXaOfGZAxEO3uv
         yFmYMtHYiRXcWOH9D8IHFQha6WTojmIArTm6UKe3T3rs8nZLvuLbtYwVAcYv1xYhjVXu
         /2Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVtI09DkJNGmK3v59TUkxtsAwgHp3qsDPLXeQlrqNpuilWQEfwlPRPBwTZpvQhnB0Cjp0elX1WoRXhZ/6hceDzg@lists.infradead.org
X-Gm-Message-State: AOJu0YydsgDMasNITfIPVf2NNC5q9K9D0JUhv5R0b9DsXC0QhcB0gq6u
	52iXeQNZJ9g3gvd2DjuoWoQ3H0W4fVA3G+UeM2PJ7ug1Z7HtVfx+d0Qt
X-Gm-Gg: ASbGncsPjuis94ctKJJXWWilYELRel9cFEhllFzqFf6KLj0D9NISTYLEeaOI88cdxfZ
	aess8MmMrmbMG83+NwgJtbrXyeLF7X8tDUz5orBvcRnPkUDdJ1ZZf1C9sMQds6/kb5HpYm/yWvF
	wpfkC1eYrUqz5/zwADqqT9JLbASS/5j6gxUt+P45237EQKtVRW2L8L8PMtI6Tuz+ybadQI2tl9p
	TPnWpKA1mJyWdHidfDEmhSjxIMv6+CzDXCCcReL8kd+RwwZnLLQufh2T/MjF04K5zhgX6gm8vab
	JXl3/dkgB8wYcGyD46qZ/uz2OWahneWex4zZIZNNaRzk8nslAlXTiIULoKHDGZRBeSms0G+/jVq
	DJTYHLI6g+KulY2Q=
X-Google-Smtp-Source: AGHT+IHmbRK/RR/f6CMsiKwgVCww0CbZLWw9FNcy1YCsTBab4ScCzhgCjBGfKDPKwCMgjbZt1yeo9Q==
X-Received: by 2002:a05:600c:3d92:b0:45f:2919:5e8d with SMTP id 5b1f17b1804b1-46201cac25dmr7562685e9.1.1758105469624;
        Wed, 17 Sep 2025 03:37:49 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e93dd85sm34991125e9.22.2025.09.17.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:37:48 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:37:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	DENG Qingfang <dqfext@gmail.com>, Lee Jones <lee@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [net-next PATCH v18 3/8] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Message-ID: <20250917103745.vhdsvrrv7z23qpnn@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-4-ansuelsmth@gmail.com>
 <175795551518.2905345.11331954231627495466.robh@kernel.org>
 <20250915201938.GA3326233-robh@kernel.org>
 <68c8a6fd.050a0220.26bdf7.871a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c8a6fd.050a0220.26bdf7.871a@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_033751_793939_71C98F77 
X-CRM114-Status: GOOD (  29.74  )
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

On Tue, Sep 16, 2025 at 01:53:27AM +0200, Christian Marangi wrote:
> On Mon, Sep 15, 2025 at 03:19:38PM -0500, Rob Herring wrote:
> > On Mon, Sep 15, 2025 at 12:01:47PM -0500, Rob Herring (Arm) wrote:
> > > 
> > > On Mon, 15 Sep 2025 12:45:39 +0200, Christian Marangi wrote:
> > > > Document support for Airoha AN8855 Switch SoC. This SoC expose various
> > > > peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> > > > 
> > > > It does also support i2c and timers but those are not currently
> > > > supported/used.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
> > > >  1 file changed, 173 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> > > > 
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml:
> > > 	Error in referenced schema matching $id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml
> > > 	Tried these paths (check schema $id if path is wrong):
> > > 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> > > 	/usr/local/lib/python3.13/dist-packages/dtschema/schemas/nvmem/airoha,an8855-efuse.yaml
> > > 
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): efuse: {'compatible': ['airoha,an8855-efuse'], '#nvmem-cell-cells': 0, 'nvmem-layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells': 1, 'shift-sel-port0-tx-a@c': {'reg': [[12, 4]], 'phandle': 3}, 'shift-sel-port0-tx-b@10': {'reg': [[16, 4]], 'phandle': 4}, 'shift-sel-port0-tx-c@14': {'reg': [[20, 4]], 'phandle': 5}, 'shift-sel-port0-tx-d@18': {'reg': [[24, 4]], 'phandle': 6}, 'shift-sel-port1-tx-a@1c': {'reg': [[28, 4]], 'phandle': 7}, 'shift-sel-port1-tx-b@20': {'reg': [[32, 4]], 'phandle': 8}, 'shift-sel-port1-tx-c@24': {'reg': [[36, 4]], 'phandle': 9}, 'shift-sel-port1-tx-d@28': {'reg': [[40, 4]], 'phandle': 10}}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#"}
> > > 	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> > > Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/efuse: failed to match any schema with compatible: ['airoha,an8855-efuse']
> > 
> > Why are we on v18 and still getting errors? I only review patches 
> > without errors.
> 
> Hi Rob,
> 
> the problem is that the MFD driver and the schema patch subset of this
> series has been picked separately and are now in linux-next.

Link for MFD driver? I don't see the MFD driver in linux-next.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/mfd

> I tried to make the bot happy by using base-commit but it doesn't seem
> to work. Any hint for this? 
> 
> The errors comes from the missing efuse schema.

So the efuse schema is in the nvmem tree and this schema needs to go
through the mfd tree.

For v17, you used "base-commit: 04b74f665961599e807b24af28099a29d691b18c":
https://lore.kernel.org/netdev/20250911133929.30874-4-ansuelsmth@gmail.com/
I ran "git show", after fetching linux-next, where all trees should be
included, and didn't find this commit. What does it represent?

