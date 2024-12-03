Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06DBE64A81
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y5ad0avUs5r379umO5xs4htnxZ4LiFXVwnGLxowvNw=; b=hkMEl7NlbG6Bplv9Ef2E11RXNL
	YRJ9AAZ+ZG3lrquDUWzUeP9BUJ+aSiBchbwLO9EaM/JnXHG6z30W5paolOjFB2jSwmbNNor2vis/w
	eHPRWg3KhJbkFh7vsODEfuVuz93ijJ7bRyu3j4Ai2qlKZQi2naJNfMqUlWfTzFxXriApsvbMoiSzE
	jzQZaGbhxmFihK0EJM0wbcIiRse5xGwaA51Jz0lstnZ9d/U0vczfixy7OtC4nj1gMYgwNfPvkWDP4
	8S6666RweQWPoMaYra2m2J8p15+2crPVkUHC6PZ2wS7EWQs7rUlZrwBNk6TsVoaq2Kaqh8hZzr8Lv
	jzqXmGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQty-00000009FnH-3xKt;
	Tue, 03 Dec 2024 11:17:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQjR-00000009CEJ-0iLd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:06:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so46044805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733223975; x=1733828775; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5y5ad0avUs5r379umO5xs4htnxZ4LiFXVwnGLxowvNw=;
        b=J/87mvEuU/Sg+CMpU5GANBVPoxm9rbYxVlRoQ5JsVI2KgffKNztLmw2858HbuCKFpN
         PQH9ySMFWNN9/1fM6ljSVEySaE0GxhEuuZeUk7SguNU588BeKesQNNB3/9cSeo9BaNuz
         1dyoPniPH3UmlcB2YzaY4Ur5RneJNWFyH/LKcC2xl70ALGPSWGKy+dDZvHbZPlRMIfxF
         fUSnwyLqfJkuBDYl9XZjYJK8P6xULlP0QSPDvIYs5A0UGKJVKTrbHWF8JEvH5JD2l09X
         3QWr2I1/t4cj3wlMFQdvh67+zvV1rgCkPY+NUJM0KrUbxiLzmbw54/cDatOnEEU+210a
         wmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733223975; x=1733828775;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y5ad0avUs5r379umO5xs4htnxZ4LiFXVwnGLxowvNw=;
        b=d226lXIqTBrtus5DM1wEHHPkkvWsDy7hDCryemFM/CQLJLTY6qkVKZMmyWnkigWwlb
         +78/XZE4tsUyy+q26O0bpOvIISnzKaqfvp7GOsyd0AHojva5VsWd2hCcXiiv7OGAK90Z
         Tdd3lx1qek3E7s06SeHoBg+/UqLNsJCFrdfh72ZkG4jEyR7m+XYXw2KSzAtuqVhhPUEq
         kGxUu+0sp0h03LZIvaLcm/XvFJT2MlJPHYs5HX3acgQhR1OCuGDcfNXtMaj08RwyIA3l
         bblGvewdEHkS9BqfbMl2I5i43HHKDh1KcEm+jCWiSIlA+32tHv1SWn74LPFA2PdiBlzC
         VpMg==
X-Forwarded-Encrypted: i=1; AJvYcCWKWqjM2dWrTOxMwMbI1G107Z3Nc/pS2lXNHI8hvLd6+h0O4IBdVSZrNel+UNPOlwY+qkBaOZ5q3BD2xs5/w63K@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+B66u2PurlCClFU5k8/mwyM4Ns6JxYLCiDU/cbhZ33TTLW6f2
	dEYuCWjicydRoxZ/UPRUTRLJzQcviuT9I5BHEsKB5Ch+K+hJMUYordLI9zaDlyE=
X-Gm-Gg: ASbGnct1GthiwfNbwSFM+PFrNH33VryzHVurgEsVIGB/vC9JODxRln+iug7s8TgmgDz
	JbxacLCQH7w0Lh4SRy0IZmUzb945WE9AXFGUys1WhDUC43oP2LAavOx8UEmY8/PtXyHilRUmWFC
	8lwv5IRLK9RXhr/33oSOuQf9A9qrBPY2LppM1b1SdY3W2U57GGG4T7txQhfkropVulOdmVPtSTM
	XhtHaKtMv0xiBvD+X6nM7SPuvRpGkhMmT9RME6uUu8ZTH2RVfMFBNM=
X-Google-Smtp-Source: AGHT+IGLmTRJVKICc1kAtHcJQX0sTL1Ubtwsn5MKrksTZEqwhDb+BEw5tNQRlwNX5ov75IPA38SNyg==
X-Received: by 2002:a05:600c:3b8c:b0:434:a4bc:535b with SMTP id 5b1f17b1804b1-434d09bf66dmr16906005e9.11.1733223975578;
        Tue, 03 Dec 2024 03:06:15 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc5asm183847755e9.2.2024.12.03.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:06:15 -0800 (PST)
Message-ID: <d1bade77b5281c1de6b2ddcb4dbbd033e455a116.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 11:06:14 +0000
In-Reply-To: <61a54367-2406-4106-bf8b-9fda4f2d11a6@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
	 <18629c9edd295a524a1c9764f013a0e97e0b275f.camel@linaro.org>
	 <61a54367-2406-4106-bf8b-9fda4f2d11a6@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030617_209875_FBA139F1 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2024-12-03 at 11:30 +0100, Thomas Antoine wrote:
>=20
> Should I explicitly deny their use in the code for the max77759 or is it
> just for information?

I'd probably do something like this, which will indeed deny their reading
and/or writing, both via debugfs, and also normal driver access via
readmap_read()/write() etc:

static const struct regmap_range max77759_registers[] =3D {
	regmap_reg_range(0x00, 0x4f),
	regmap_reg_range(0xb0, 0xbf),
	regmap_reg_range(0xd0, 0xd0),
	regmap_reg_range(0xdc, 0xdf),
	regmap_reg_range(0xfb, 0xfb),
	regmap_reg_range(0xff, 0xff),
};

static const struct regmap_range max77759_ro_registers[] =3D {
	regmap_reg_range(0x3d, 0x3d),
	regmap_reg_range(0xfb, 0xfb),
	regmap_reg_range(0xff, 0xff),
};

static const struct regmap_access_table max77759_write_table =3D {
	.yes_ranges =3D max77759_registers,
	.n_yes_ranges =3D ARRAY_SIZE(max77759_registers),
	.no_ranges =3D max77759_ro_registers,
	.n_no_ranges =3D ARRAY_SIZE(max77759_ro_registers),
};

static const struct regmap_access_table max77759_rd_table =3D {
	.yes_ranges =3D max77759_registers,
	.n_yes_ranges =3D ARRAY_SIZE(max77759_registers),
};

static const struct regmap_config max77759_regmap_config =3D {
	.reg_bits =3D 8,
	.val_bits =3D 8,
	.max_register =3D 0xff,
	.wr_table =3D &max77759_write_table,
	.rd_table =3D &max77759_rd_table,
	.cache_type =3D REGCACHE_NONE,
};

And maybe without cache for now. Most are probably not cacheable anyway.

Cheers,
Andre'


