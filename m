Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F83CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=; b=f2Z06vwqRfR/gAAOhZNg/hP1Wg
	OkVuiCSMvIdwReb93NJ8SippAL3iOY3J/50o1tpHALpfARxiKMnhKMWH5yRI4noejY7nIVe+S42Sz
	YrH8Ha+dG6hK71rmrz271Olh1knURU9Ctvganf8Ueqx6jIsE707hkL7tRm78vf5OsvVuU64l7st1L
	9lgtuf/Rh8G0sADBsseJQufppwZKkCj/AiPtYw3bNEdJByjE2awM/zWh55cb1gMhXsuuwS9EsIJ7i
	od1nZcD+zKrV2bX0c9Zjthm1tva53hqPX9Bx7PMP4i2ln0Xt7Z5Iv1SHwWOmCVjolwMN7LRZpw1YG
	bTNhaGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIU1-0000000Gqqr-2rKR;
	Tue, 05 May 2026 16:18:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKITz-0000000GqpB-0pGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:18:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48d146705b4so13859605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997929; x=1778602729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=rPDsms7XfJJLy2X9SD0z0KDTzHKZeC0fkqaueuOUTCGZkoS+huwG77Ac9qHj2K5YnG
         PUYWsHw6nJiI2nmtOPJ0ZapW4gFWq8X4bZ5mx6PWlI6f51SF/hTMoIRExCyuk+wVWhy4
         bhS1NG3/Bnnezzn1NGH8Nqk+j+vbefZckaUMG6J/EHOyYQ+ttiFJFPv2aNTK8Gu/AD4R
         4MCaoPa7leA2Bba0W3kwf3rx5h6CcM81F0fWL5I/jn7APpaUNDr6OBcEj8nQrKItDtrk
         Be0qc3MHve6OZZXGG9MNQ+x69qqw3VKPsazjvEX/FIcm9Qi2Am7kUmhtFH12YZYr/QzJ
         P+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997929; x=1778602729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFgK8lPtkO+1vWsJ8rKW8KSPYA1D7WBjiFbzZGEngaU=;
        b=K8Kfzo/ctbCrzbwIRSy1+gTWFiG4VD6v5L+dF7vm+17sjv8AgV0qyTMTQZdYnMF0fT
         TuompT8VSWXZcJnwiMgflHexLwOyXERaD0kPTQ7xSBnHkU4cA7A5U1vGIkjoj3sWLPiP
         NabvPlrwLoOKwJeQOgP3EeTveG+GtHn1dwTX2dnZ4Jt1qjrcMkGBhA/BeXfTpngNyuh+
         epVCWIFS5Iipqow/WCWjzDc5+Iej7IJH4dlRIlxpZEN2feS290gz3BYbrp+1jH3sk2UG
         SJFTA9Ag8eyJi8QLdy1X9tTpTfQ/JNDrqBdPIsLEmBclf2jncBKgqCX6FJey7m1GENPn
         sl5A==
X-Forwarded-Encrypted: i=1; AFNElJ9FzP1ddyR0uvmLWtAvZmKJEkRu2V1kh51TzPa5IVPWlU1zHVOvbWFXRyreQS+boSpf9FuG6OTSZQ8ods1+HsfG@lists.infradead.org
X-Gm-Message-State: AOJu0YyrpJDqOpXxJQtIdG569ixY2FvzAgJcazjzitCJGWe3ibqYnE4K
	7NRBDQmCaaKlWLtPJoLa3gCJ5FLjnC05AggV7XaZRUc6Airj0njITq9s
X-Gm-Gg: AeBDietwB/xzVsr31rE6ah7VhncftZMhJ7ZALO8l6VenB9BbBuw9oprhKxcZlhmOxvN
	ESntewijzoxGrD1iCNiSj2ndPPmCUoD1PrE+nX2fHvHh9gqhT1ysnCnN75YJJlU7O+6m07x8+1B
	bo5SLASXop28X/ap1JE2nD55/vw602RAdWjjmtLGhMjWpynfxGec4/a+ieYBFdLEzHWgmDZtj3+
	AAKRj0yYu5UtCRRli3T012/H0DgCpj8+x5BoNe1wfN7ha7/h+y+P89kptd6bxupLF9Rl1e+h2SF
	3BbtnKRtrOItmMXOKnT+nDzPkPgk5DHLFCZzsTuZat7iya9bAuXVPC3pEsqjcjHR+SggpEn4E2F
	Iam86B8+YQ/SS/TfCK468DmXx5xEYWQzitFhL7MJ57Nzi08C286xt8BjKAFTX710YwuDClm4TVm
	1NGNedMeMop6dnBJBZzvuFKUA61DK9H0+0pIND7LiwLaKpPA/sHP7+km4vzGoLUwLjX6xvCQMDK
	mIdVrGNplFnOsehSHfn75iL9TIR
X-Received: by 2002:a05:600d:8408:b0:48a:53ea:13df with SMTP id 5b1f17b1804b1-48d186dc892mr46627055e9.2.1777997929083;
        Tue, 05 May 2026 09:18:49 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm5425787f8f.34.2026.05.05.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video
 engine
Date: Tue, 05 May 2026 18:18:46 +0200
Message-ID: <YPmvp_egR-m-cMSokrsA5w@gmail.com>
In-Reply-To: <20260505134812.408316-7-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-7-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091851_238991_5FF7E6C1 
X-CRM114-Status: GOOD (  11.68  )
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

Dne torek, 5. maj 2026 ob 15:48:10 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The video engine on the H6 actually has two IOMMU ports. The one already
> listed is simply named "VE" in the user manual. The missing one is named
> "VE_R" and is probably either read-only or used for reference frames.
> Either way, it should be listed.
>=20
> Add a reference to the "VE_R" IOMMU port to the video engine node.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



