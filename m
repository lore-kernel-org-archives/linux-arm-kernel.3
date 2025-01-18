Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CAC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=; b=owiHEPPY/IU1o2uLt0fxS+M6s3
	il9Dkb+oQ28QkYWRNZ/wFDJrBCyZPvehT9TkH7RRv9tl7cltQtOReuYGZHTsu+6AbA18SuO9pYbE2
	GSxymUicBTF5uSNCiR01RMUGZ6ETuOvSUzejv617rq5E5GFSHFvJa0R77qCjKeYk86sh+CD56CcMV
	wJ1px35LCTxVxedkzrxmjIDPCRikDkwKGz2/2lxr9/w6oNPS2ph/bu8tmTijm5OuNGR8pDbXQpvHG
	YemZorDoQ0GOrbLpBzUS5NVG8MpTm6aiC8dhmRYGDIDlr+gxKuiSDkpVSndCsLo99rrBngHylEbfb
	c1S0JI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7IC-00000002Icj-2cX1;
	Sat, 18 Jan 2025 11:47:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7Gv-00000002IWx-2RSn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 11:45:50 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso594426866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200748; x=1737805548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=Pu8G74bcIuHvcaiTWn/YN5DKvxr36/mqOKD7icNjgzvc65CXhnwrHDMEHFOllrtCfr
         uHh8ldhued71Z1lVzEDFvSm1S+Pk512tMUJungnwv2DXu5oLaRG2LHuqI6Ay3TP+j+0L
         MvD/Ni8D8xPo2GUKTIHaQYvh8WCa+eZ6GoearSgu49e8JhF0UV0EGJ/7rhOFdW5qReHK
         /ZWOodPuBJD2XlUhnHm4zssm0Uq4SpISkqMPZ3DyFI48cZ83nt9eTkIXithzsvc7ARYH
         UJMjT9iipnOuscL+SfZButxbSVw0MDMbCgBZee1o9oA6d36aPzqbxCKxBUg8HyJKdENK
         tUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200748; x=1737805548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=N18yOeQ3KUM2LLNVjEpgCBHTz5SXogMy3hrHteQFTspmlGn016clHRDrlFOzFfKsKw
         JcNtdnucwic3l3l+Hkv90+jPRa+JjuI2JOcJ3LSla0TFbIiiB7Mnv+tIv1SzjZtMqSSQ
         1p6zDU0KwwQTXThv30+pXINs8PoDYrNML/7bhCTSYTDgtOUJ1u4I/nLVji9tymlioe+J
         nf+rxt/ETd/xq3GWXXq6e540YC68MP6vTY4JoChZ0bodgUgYPHieXwO8elGYoFDMiEa4
         5WTHNDYrT305KhaM54YPb9BSYrrloSDFaxNlNaV4f+HdOiQmNFUbUC7KwM6YpRyjJIBC
         Dh8g==
X-Forwarded-Encrypted: i=1; AJvYcCVotVRZvyV8mHr0e28/7ia0TSollNklS0ARdlzLRVvx02h26/e6kj+S2EPl+HRqcFm2jKni2g+t/pxKr2oBAmHN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz1NfQYbOZZPzaWPsbSAMR36EkLdivOHorBuxLkQ4Bquo7uui9
	RPP3qYQeaQNi87f+eiUgzEp98/m94lngcEuNFPrW5B5kuZycBTgd
X-Gm-Gg: ASbGncuDG731tkZnaQrnpPA9EkgZGH0vt6Yfkl3AAMAVeo4PanB17b/1RMIDPjMmxqQ
	zNUrGqXjj83JlBguqljyTf7mwA4M2kVzVEKx5uBmDnYsg48/rzBmCaI1ormdGKxtdQ5IPLVyKED
	+lA31BNCyHBp7YiRKNx8WFpxp5AdNRZJsA8kui0G+naFbsoZMd7i8xEzkxBXKYn3PsZplmEYz2W
	KknITsppH1V4vHBEYLed3SwUBH2NHzvbH4o4gzXebN4l7m+Avrwt7JWvXUbaVRf3QCIT5gkmMHK
	Mg/HWwzNeKSsfqI=
X-Google-Smtp-Source: AGHT+IEc/dxl1rTjiPZX3AO03wqpI1sxEn2EWC5g3utoZzcrir3URb2QTl/gt3l1bSP0pp4nc7Kr4Q==
X-Received: by 2002:a17:907:1c2a:b0:aac:832:9bf7 with SMTP id a640c23a62f3a-ab38b27be47mr527318766b.24.1737200747437;
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fce6c6sm326568166b.179.2025.01.18.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/14] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Sat, 18 Jan 2025 12:45:45 +0100
Message-ID: <2417745.NG923GbCHz@jernej-laptop>
In-Reply-To: <20241111013033.22793-5-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_034549_641221_49A51FBC 
X-CRM114-Status: GOOD (  14.80  )
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

Dne ponedeljek, 11. november 2024 ob 02:30:23 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC comes with a watchdog very similar to the ones in
> the previous Allwinner SoCs, but oddly enough moves the first half of its
> registers up by one word. Since we have different offsets for these
> registers across the other SoCs as well, this can simply be modelled by
> just stating the new offsets in our per-SoC struct.
> The rest of the IP is the same as in the D1, although the A523 moves its
> watchdog to a separate MMIO frame, so it's not embedded in the timer
> anymore. The driver can be ignorant of this, because the DT will take
> care of this.
>=20
> Add a new struct for the A523, specifying the SoC-specific details, and
> tie the new DT compatible string to it.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



