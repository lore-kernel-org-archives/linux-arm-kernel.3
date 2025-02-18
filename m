Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25963C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=; b=EJjNNsoWyyVXm8P8aaxPwqgK/V
	GZ2xy7doHlhuRge1q3Sk2I5GW70B4qB3qAeC+46GUmdeTLUahRjrLNaRz7oQQvWXXFhSHKoTNMoIA
	prVOawbrIoseH07Q98tG7JZMXn537yfBvuO7mbbVFF8t9t1Lf0WTgEpda3K3zP2biD3BMlumhEOpV
	jo+b/r0/zloqgtUHEQ1F0K5qvmjMhGcr4ewTVhcb5NMDRXO1ZrO3iUF+zhf4ISR/8+YJWcawo0GnN
	owq4s57KoZzNlZw6vi8srIlsDbCLMYlW6ByI3lnAF/lh7TLCXwEwzWkpmHquoHVGT06s3HY40zNJi
	t1tak2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR8P-000000096z4-1m9S;
	Tue, 18 Feb 2025 17:11:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR5t-000000096EH-1A0J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:09:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso15682455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739898551; x=1740503351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=G7smKqoALnR64gLteTUmbAvStEPcmRdgh0V6wcnjMRMXcMjkKG/8E8pOfYzBk/yf8D
         +3O2KRPKbWrP9+TRZFnw5EY+oWjwVNdxQnu55eQJncUoi3XSpUf20M8i9hWJHk6tlpcE
         EJEQZoT9rGSt+9cm1Wf+xME647pGShnPemVVXILiRgrRrVEMqiramGHI/nATeZ/YCIW+
         RdB12Pm3sDxikoURYcU8zAax4babrMbZmXNJDjCP+6rHRWHKfo19OJ7q+kQPcXA1GE+c
         ad8LOc4h5vWtoHNfQOmHwiDYrmMPn2Msk5jBbs0uNOhAYFrc/fZtwLrk7a989QLLMYpk
         pspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739898551; x=1740503351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=d4W+l+vNhzooTPMFS4YAimXxUbW4WK6VTrRS2zL4yaj3APLv8O1SxYmAJWJUDE1es4
         kVR38yFuf1FsEIY+wYYzra+B0QHWvGQLcrnDf/2p3+ie/uwwOV7V87e9+TJk+yusQy9k
         jMwx+i6a4fRj62cGc31fyjkRhIc03sgzO3h64thZdjXOLV+qmkkxWlD1oLC0dnXZ/+OF
         MjxL/mIx92oMAYY4mnHzAj1AdNQqRsEG8+pmHwiMkN5kLGFi8+V9MTKbBNm/K6Pt8nmw
         4QLKZsKotnboiW+IMvih59e4f68LX8LBs/BnF3oXUkhtWXVr/ecI5HykwSX1RYxwxBby
         DJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCU9dL2ICVkANo29E+e+40XV0395tlK6GVI6LQ81wbrITv0qu4NXAjwMVavq4YgIshJXIbFtfvBEoJrYHIUs70Ej@lists.infradead.org
X-Gm-Message-State: AOJu0Yx307ZtjYIj9u2EA29VWV9051IhHcCWMTlhqbHTEN1xcNv1fPFX
	czxZ6hMulwGLb8vNJ1PCmcXaLD54Ig1OPlSeOt8w2c8XE7PIVMKZ
X-Gm-Gg: ASbGncudkP0pMd88VmC4UD3h2LkXOs2TdRbwoBR5+/T8PBMg1yNL7nTtGJnpTSuRxPX
	UlP3Zg/pysQR2GYNskAGosZ5q6TIPdHbgXJCat3ONFXCkin8oJ2v9oh6U50hGxJxzTqgDM1ghV/
	ZrvlwQLRkaYN+pLe4tcKL8F0PRKhCPS7A9m9OKL5+S6B+vFug/jsPgJToUAFoV6SlXp8ONeT2eD
	rBnt814XTIh0630O0ycfeY6L6jzCWbBTObtVSCELjozwdJCQ/btJMYc2W1Y3J2w02B6W+j+n+La
	uAn7zyhJe5F6qOhQAGMTehKWBctbGsrSibSPEI1/E9ctSfqvjIPsKY1lKd7WSLG8UbA=
X-Google-Smtp-Source: AGHT+IFlGMv2miQ0Z9W2VdMNMeh3ECaEZiiURYqLj/so8NoPpJnlEqidY8yQFjrhffXPtAAVjvhFEA==
X-Received: by 2002:a05:600c:3501:b0:439:955d:7ad9 with SMTP id 5b1f17b1804b1-43999da89c7mr5439285e9.14.1739898550848;
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398148f4fcsm72046035e9.7.2025.02.18.09.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Date: Tue, 18 Feb 2025 18:09:09 +0100
Message-ID: <12609538.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250214003734.14944-6-andre.przywara@arm.com>
References: <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_090913_316507_D3735CEE 
X-CRM114-Status: GOOD (  21.05  )
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

Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far every Allwinner SoC needs a large table in the kernel code, to
> describe the mapping between the pinctrl function names ("uart") and
> the actual pincontroller mux value to be written into the registers.
> This adds a lot of data into a single image kernel, and also looks
> somewhat weird, as the DT can easily store the mux value.
>=20
> Add some code that allows to avoid that table: the struct that describes
> the existing pins will be build at *runtime*, based on very basic
> information provided by the respective SoC's pinctrl driver. This
> consists of the number of pins per bank, plus information which bank
> provides IRQ support, along with the mux value to use for that.
> The code will then iterate over all children of the pincontroller DT
> node (which describe each pin group), and populate that struct with the
> mapping between function names and mux values. The only thing that needs
> adding in the DT is a property with that value, per pin group.
>=20
> When this table is built, it will be handed over to the existing sunxi
> pinctrl driver, which cannot tell a difference between a hardcoded
> struct and this new one built at runtime. It will take care of
> registering the pinctrl device with the pinctrl subsystem.
>=20
> All a new SoC driver would need to do is to provide two arrays, and then
> call the sunxi_pinctrl_dt_table_init() function.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I went through the code and it makes sense. I wonder if we really need to
build whole table instead of having on demand lookups into DT. However,
for now, this will do. So:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks!

Best regards,
Jernej



