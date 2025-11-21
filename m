Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7A3CFA74F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 08:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=; b=ov0lHx3sQYGGhdDtYmlwAOEESK
	gO6DbTwpFIWda5jMGayHNEv1VpNb/639eFLIvbL7nz1kZgUmJwNETNdFUUslietXyy5piFWgNOzQs
	idRLP/SaEIJqEHkrrBdrrJYP5xgDkhfDRQ/VdP/8pSktBHK+gWGYeKu1Tnv+xCQqyGSZDFYE58Tzs
	amVf7OC7wdgRrJaXP9fUpQrZEGY2SeOF04GBt4ZuAzZ6zDliphKBetAXveTHXuWoc9prrQPa2bj5Z
	ti+MShn9DHdw8R15tlDgfSKafsVV5sugjFCc48wIY1EVuu7RxypEj5Ktb8tUinNmDoAl8GjtUW42t
	Y4sU5KXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMda-000000085Az-1qpk;
	Fri, 21 Nov 2025 08:37:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMdX-000000085AA-2YPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 08:37:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so10662545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714218; x=1764319018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=SYSzliJsGfI2wlwRyc+BY1wF77EzY1B52qEvg/KXDdk6X3VZRdsrUIGfaykOjCYvpb
         UGiqffU9v1KvTW43kcWmbC+LJVwOUs+mzkfA2HVeG9fxGekL4ewE0u+8pvZ2Vh5PsFr8
         rvTz8s+dAPdN9bME76vx+Cfv3yRp/h7xj1Wf818h9VXubDH4p1jB7AbpVdZAGrtt6kba
         LcPSpIaqVkEMdIe40jop8UiLNn8gQXqxro+SrAa3wuXb1BtHHWy8Qlq3F3+5pmM9jXkG
         35wl0egKwyujfPeuwwk7Wx15SSAA0WyOWoJbm0957IrX9ESS6pAPo+R+GMP6mcg3EkDn
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714218; x=1764319018;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=HzXrYudbqS0Lvm2F1m5Jys6s8Zp76wjcuabAAcZAeeFmZT5QMSZzYH76kE14+gtz5S
         Fj3alxvnoClTE7uvNIj5p10nRFmAsK46FeuMtT+4uLydiKpR77wzwd8DMRjQJO1nGWYJ
         nL4+JVEJohDW4INO/Ea0I7wfkTn4f0ffFVv1hHNUMjbhmcFWeJ4+LFZmivTDvdoq7MvI
         CtdNKEDwtAv5L/ZZVrh8vNnEiByXEV7s0YD4vXi/kM8/qHEwlvvnBDNx1aX3RVq20dmk
         tBDup0segKEtZwA348JnUodi2TYteWr2zIGhMk2+zCnyDIi77DWKjPGbaWaJ024pB3Zq
         jTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6kilc8WFwzck9h5bpr5mucBSsQB5J0hP3dGdaQxzcEdor1FUDbCr3Nt0o6hpJkscPJxYKtxciMs7LXT8kDP0z@lists.infradead.org
X-Gm-Message-State: AOJu0YwHFNiFGT8y1iiHAADFp1OBKfZ3lslTQgHq2VyMBnXFEOaTukuI
	yZE6H3ENWSfUBzDSj8d/hzYlJhble1zPo2iX1vM8LG5URFqjBqIwTApS
X-Gm-Gg: ASbGncs+GuSigqwO+xb3SaLfb1xJKtDo/mqEF6nqvT4zdS/zzHgIajBPiJhr1vLmNjw
	n5eFulaIlw+wHqDSJrIq76HMQQofehYO8lR+YH5utner6b/xMluxFYWJBsQqKu1VWC8NBTDNzoJ
	Oj5hFM/gfvTOrYUWM1O1rYmhYgy8oltd3qLTifHI9unSgGjojA7do+/8P8eHzX5zAMJV5t0Feor
	htdcx4CRe1vf7zMvgPmg1kUFNbs7CoBpPFXbTfvz4mUicjCRANMWwBkTyTOHZdWKxSKyK6WpnK/
	ifGXvFbS8iFhy5KqcMWFayOzo3GXSR0xJduCBUlzlRCGAM3XBSRxqdOxcfqiT65mSdleTnmqnMy
	nL+p6LebHzlYc7beXm+qbKgpQQwjkKv6FszeREUlgI+aL/7agK/cNBQnkLiJWpGV0el+J1t5/K5
	GwFoi76ISCN2m3qaTXXgYmNI2UaXd+kIj1S5ltmeI=
X-Google-Smtp-Source: AGHT+IHPLw2jQaPF5ElF0qIXmxXxh5kNC5rhs4V0teeBNwT7wDD/o8bBEszH0XJ2zTJXCk24Llcm4g==
X-Received: by 2002:a05:600c:1c89:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-477c01fc60amr15542125e9.34.1763714217408;
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dfd643sm78628425e9.14.2025.11.21.00.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Message-ID: <692024a9.7b0a0220.878f3.25a3@mx.google.com>
X-Google-Original-Message-ID: <aSAkpwReMrolkA5k@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:36:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960
 YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-2-ansuelsmth@gmail.com>
 <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_003659_664242_990557D1 
X-CRM114-Status: GOOD (  15.64  )
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

On Fri, Nov 21, 2025 at 09:33:45AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:44:59AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.
> 
> I don't see WM8690 nowhere in the binding, so that's a bit confusing. It
> feels like you mention here entire sound card description but binding is
> for specific component (AFE).
>
> Well, anyway, probably not worth to resend, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Maybe I have to send a new revision for the machine driver so I have to
resent anyway.

I took mt7986 schema as reference and the i2c codec card wasn't defined
in the example.

-- 
	Ansuel

