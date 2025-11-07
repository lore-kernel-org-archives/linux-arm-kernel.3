Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C82ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmq9pT7Misz9s4VB/B7TdNfaf15j6zAigKUGG6pS/SY=; b=FIEr6TXti9Z5ZbKAKVHQvqSf7W
	t897z8I+fm49ydhf8Y9NPaTmdBs2LOUDyeMzKwxoN/F8cent0cyA4rWoCph2aCWyVlIjacIGqHkn0
	LuShqVHc9KUTQ7bEDHM+u91RoCOURzit6XAusK6mAywEkL/xOulAFcPAHVeRxSTDTSC7jis877DfF
	oasWVkefEpPnv8inPPH97KVqLoHsvjLtm35Ge3D/ubKhXNdUDLILLeNu5Svy9gijE9fDJ+5XpQ+54
	gG/y++7QVC7tECxz4Ikzf62BUlIAjg7lSgLHuFA8EkpWkQZm0G/T7UcoZKYgssui5QpYXTs+5a9+4
	dBou2TdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQaQ-00000000LNe-0hrF;
	Fri, 07 Nov 2025 17:49:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQaN-00000000LMW-1mrv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:49:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429b7eecf7cso756118f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 09:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762537758; x=1763142558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cmq9pT7Misz9s4VB/B7TdNfaf15j6zAigKUGG6pS/SY=;
        b=WLAJyGkFFcBAPL/5BcMcPS4vEj14BLErArahfpTfuOM3xQ1ODi0bQRuLmv7Y5CnW50
         wjDXl3TuWC9/UDGRPi8crHnFnXksANkxXvYu7/KX4W4dINC8/hE48uQYFtM4gNTkqWf+
         +vIsxXyWr2Uo80MGlPposh47wDw+BP1UTess8BtxgSgU4UMiQOHERPO9+gMX4viHBrVX
         CeNpgc+wn2wf2k7Tl3BwvD1KMt5c8PrlApAyKgEsw7E+llnOGTQ/gibqNF2PaF2A87/l
         /2FvRXs0vfltOE9eTTZtz49YLmtdlr9MBXJPO7CuSHnEjzPMghVIZuNt81in5AUGqL3E
         OPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762537758; x=1763142558;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmq9pT7Misz9s4VB/B7TdNfaf15j6zAigKUGG6pS/SY=;
        b=H2dOLnGnPaxKp4nG9DeRyeD/5GqRwc/OZ4MeK6pdMh4JPPD+jBsnZeCuawAv/J5kKy
         S/FOyjDZ0W0YjMfye1AI20VTN4QZZ2vmQCmxiUuOQh7Er1BAyJ697VjoxkBe72Du81x8
         Mc01uOLgsLzbZmmwhusSPqWlcA8Glwu6S+Xhxo5jlbE1hH3x96E7loTCngyiL/lnUl6g
         xDc4fuHKQj//sDhWL/6vZkCGRwa/nwDcZW9XskPVzAA+zAADeeHi0cGHWM3tcwTgrTMM
         NYQbsJ29sIl0zEuSygtbMmAQGIVAIjmabdqAKtoSH3WAAN4gHVpcCU8hFnHGK/SjAeOZ
         c+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgBr/vo4cr3vChsIvjvX2kJU0QwRBUyUMqnIPmhGoA0P7/5sI9Vw7xZhl6n/3e5Dl7IdTbpLs6kPTNDKiWPWkB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0SJYLgk6CGFbeB+X5uHBQlolX7EHpkdvaDHPP2N4UJjzu+36E
	IAcxaIEGDdpSKKd527dpkOMZh6uFlvg75K+EllbaNIYQzkwHxkMXc7bi
X-Gm-Gg: ASbGnctyUXyjBQvaArELNMFMNuqdJagJM+vq/APjhUW7FzIFJP+uBn97xxuHGvvL66X
	cWveCBXkymBUAIGcP18AN+EvB0oboBgcjM0KfnCWCXnJDVLO2SMVxC+tnFPfcvmdDWLuxscZSur
	ru4mpquJ8rNZDRmoRdxcvC47Rguo65nGpNjI6kWhQp3oTcaP40q/tCWiHRLiggUlC/9tDVe6zVA
	IeLdMB5vUbbZZKBZGjYGVkgy1/kOOhY+VgLUED9AFZpiGWUbByX6yHZ272eZx7XbXSaYG9qg6qt
	W2gHOPoPFJJJBjvi6l6rR76tyvP2rzL70skymKxpyclOSzTJBz7WzzCgDkNrx34sYWr8JSpL4wE
	UgA/XWSCRcGU5R0V2vAyTZszYSW3yMN9mJzngSoOnMbbkliC5X5qTHuyx2CRiWNt+uZ6ieOKkfW
	wJ9CKmY1N6bVD5sXdWcMxF+WvSCCbD
X-Google-Smtp-Source: AGHT+IGejCZdNQWYzzYKXyulx7D4hGO+/hfj3nCbt4DKHyJm8dB3hqEzCyD5AYyGNe1UabBQmO/UtQ==
X-Received: by 2002:a05:6000:250c:b0:429:8bb2:d0ce with SMTP id ffacd0b85a97d-42b26fb47d7mr2445454f8f.18.1762537757448;
        Fri, 07 Nov 2025 09:49:17 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e07asm6575381f8f.17.2025.11.07.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:49:17 -0800 (PST)
Message-ID: <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
X-Google-Original-Message-ID: <aQ4xGRCSkjsVWQRt@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 18:49:13 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-washstand-motivator-c5e5e5d30dae@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_094919_504191_87525F8E 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > minor difference on some function group (PCM and LED gpio).
> > 
> > To not bloat the EN7581 schema with massive if condition, use a
> > dedicated YAML schema for Airoha AN7583.
> 
> You went to more effort than I would have here with that conditional!
>

Well it was suggested by Rob and it's honestly a copy paste of en7581
with the relevant thing changed.

> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> 
> What's up with this regex? Why does it allow either - or $?

It's to permit either mux-* or unique node name with mux. Pattern is
also used by mt7622 or other schema. Other use mux- to require a name
after the mux.

Example

./xlnx,zynqmp-pinctrl.yaml:37:      '^mux':
./xlnx,pinctrl-zynq.yaml:45:      '^mux':
./xlnx,versal-pinctrl.yaml:34:      '^mux':
./microchip,pic64gx-pinctrl-gpio2.yaml:27:  '^mux-':
./microchip,mpfs-pinctrl-iomux0.yaml:33:  '^mux-':
./airoha,en7581-pinctrl.yaml:51:      '^mux(-|$)':
./mediatek,mt7622-pinctrl.yaml:72:      '^mux(-|$)':
./nuvoton,wpcm450-pinctrl.yaml:64:  "^mux-":

-- 
	Ansuel

