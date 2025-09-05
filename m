Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6070DCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=; b=kG/NFMGuc6MCk774rY8w7T+vxc
	93oGkag9foIhsCSWfjMAt90JCJ51xe7eti4d+JXPr7tUUsN1i2kQkjwH2DxIvFwsHWJrOUNGt0Hd0
	K/PjYU2guYAY7Djn0MSzUBz511WgrnJG5B1UbmTAleqqMzOR/HInVr3TbTsajL+jZ51CcRjmyPuSP
	cjJXuM1BLAWAw1lokxMua0/mzdymNkx7DGzDHrRQUGgmJg9A600gZdUZ8IeiwKVSrufk2PmWEGsfd
	RW5FcPbLNK3ep71+Aan6s2gC+pKaqkil7qNrewn3j1oxHYAZ3UV55KLPQReCG8LRzSQb30x3V1kce
	t93wjEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXWq-00000002McN-29qM;
	Fri, 05 Sep 2025 14:35:04 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTH1-00000000uyR-2qgm;
	Fri, 05 Sep 2025 10:02:28 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7724cacc32bso1567677b3a.0;
        Fri, 05 Sep 2025 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757066546; x=1757671346; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
        b=TibPARTwfQz7ZZZQn7wC3As/AP9d/DQB2288CJUiOvuVbhzlck0pVt9bTorhXyysTH
         5dHs7W96xERrfS/ozlKt8El/PLoT2klIt7rF2Z3LFukcLHSTQq3zVkrqX6k7Febk34cQ
         94Wy8oFIM6mAv7V4hhzuUBG76VCZT6eVMKLoQazyL1FTtokJ7cEOzBXhecmZ+3deUpDw
         JzTpvnSMOrnK6LIg0rVE5ZboZPHrz2spau8HJ2B2lFqUxN6jo5bPw9yyoDWMrlicQf8B
         YpaXOW+waQzmkDAFQ/vyGc532w+XW2FbIJ4dVqTGUxlY2w7JV9dBjpYSXuzFTb3fcz++
         8uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066546; x=1757671346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlJOYlx/z1k0Vlh+9uQQpTUfAOydkzaaPUhFUkrjdUk=;
        b=AwOo4ZNvJ4vek3mLEnFNxfzIZKDWccqqhs93FclYVteqO0mjC83uMqMI4CqEEmxxwU
         0EL6Il2EmUKs2e5eL/fMSSQgdg2JnI/LoHceJPH0R4ZY2+ijW+TlGgZyfNCKdqdk4hfJ
         zkoTyS7ZhpAVl4fY4Oqx1lIrQVQnZ3ucSJCAaD0HQGe9KL0oxZmFCsD/MpSfDi7GCI7P
         NxAF2TNCK7jNLBGr6VBKxXk6XRXM3jOMro5j1NkQ6/7QU81oSj75Hu5yP/fYGfx3SSHG
         0yU8eZhV+mWLIfAszY8XiQ4vU9/7r2G4aH1bf7PVOVyWOaRLyjxMX9HPFq2ZItUrdRn5
         FKNw==
X-Forwarded-Encrypted: i=1; AJvYcCXId+L6xyPJLdgTY5Cy1cz3GF/eOW2xWyDWZ3KNNeJr/k6UtZvqikJ1wgBcW9NEEvYK2PZRuH1l+ZlwqtpfuX0=@lists.infradead.org, AJvYcCXUmTFowHrE+WyRnGdC/hpcMdE763tnTxfT6pwnD0iTITpvYss4PlUkII0d3pOUyQbzXdtNyb4qQt0KC/Uc00/l@lists.infradead.org
X-Gm-Message-State: AOJu0YyRjkE99okO2k+DOExmlho19KXY+3gUZg1ybmG43dF98IpMhEbx
	nVqpcohZ/3b34wA9auHjvrgRGiiJLfSF32C9vuVmyZQPRw7cmD3sz/6i
X-Gm-Gg: ASbGncttqVa8kuuPLMHhP0lie4r5TN74nFO7eRPYJudicl/CVrP9JYDfR5rFMqyGne3
	3GUP6j+yvxwS2NZSlVXJCEIQARfTaLCIX+0qrtxow+s9HGyyWQX5ok5FaSV5kmj3UffltQvAvkf
	3xIarIT/bvjnAlMkLlbMT4KcuNKR9j/FxdYQt+DwVybGE1QUoWuqgVVEEOf5p62TJKL2kb9noob
	cDyudsn/fFIv97cLKDFv3Uy5i/dueqDIhw145Me/rFou5BUrYkH2ZyxRVvbsyOpMb1VPWlbtL5v
	V9jOqbio6T1D1pxnRwD5fUxGTQpHwzt39DVkiHR0sp68/Fi9IBYpQcCCdpZTvl5L3+rEAtTlGLn
	6RYiNrFdnw02v2zvR+6dbRVs=
X-Google-Smtp-Source: AGHT+IEZFsGwp0kL92yq64dCob62/5/Te5BujmP7PaehTnILj7OwdceaDPf5lu2ogbouVgnk8eNmNg==
X-Received: by 2002:a05:6a00:b47:b0:772:51f6:3518 with SMTP id d2e1a72fcca58-77251f65041mr25029357b3a.14.1757066546096;
        Fri, 05 Sep 2025 03:02:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5133:5770:79e8:362b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21898326b3a.17.2025.09.05.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:02:25 -0700 (PDT)
Date: Fri, 5 Sep 2025 03:02:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
	airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org, 
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, 
	mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org, 
	p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org, sean.wang@kernel.org, 
	simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com, 
	tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_030227_714718_8D2CB9A4 
X-CRM114-Status: GOOD (  14.19  )
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

On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> Hi Ariel,
> 
> thanks for your patch!
> 
> On Wed, Aug 20, 2025 at 7:17 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
> 
> > +  ce-gpios:
> > +    description: GPIO connected to the CE (chip enable) pin of the chip
> > +    maxItems: 1
> 
> Mention that this should always have the flag GPIO_ACTIVE_HIGH
> as this is required by the hardware.
> 
> Unfortunately we have no YAML syntax for enforcing flags :/

Theoretically there can be an inverter on the line, so from the AP point
of view the line is active low while from the peripheral POV the pin is
active high... 

Thanks.

-- 
Dmitry

