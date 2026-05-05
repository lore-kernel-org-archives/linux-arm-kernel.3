Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3CFFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=; b=oxrMoOuFLIECx1p4w2XCl/B2cY
	SWuSACl7WU1LLEGf9GJmw8foKeSI2bFc/WCi3uobHDoRq0RJaDAxMSlUIKPHiXXFZ1Fdcre7agtah
	TZdZRawB3wU1uyUG9hXxGB9fz2IsIedMN2dqLJb4sZ4Bc4oIA1OB6d9AiVCbnP++2eWjI1S+QNzY4
	l7KzxkqRboAD9tDzJtJoUY44c0wN65bNsILxE8dmE1KHYEq2BAan9D85dpAnGyntY3iJhG19mQs1u
	n50C1O1qyv2VCpsEX94OM1+OYqCjSKFP7DkOxD24guvxRhmY8JAkFvwIvMyY0d9OpDy6WgebzkeWB
	ojWnCIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKISG-0000000GqR0-3Ozi;
	Tue, 05 May 2026 16:17:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKISE-0000000GqQK-324l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:17:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-671c24f23b1so8387320a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997821; x=1778602621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=AXIjUd4R/lh0KlRao4pVqlHEzAzmqg+/nTQzHCix2Svd1kFv1MbYJQCitpyH0sPKle
         wvJ12eK0kBJnKlQnwewRKJAQftLRxauozmREoF4DcuCHbDM4gu3h8gK3e9XjH8Y971R6
         tn+I4hypeZdWkf9pIuL5kxhZXhpKXG3bHsusbupAX7+Fg6KpkRsR/MRJZpWbks3IHEWs
         T9uCVA+zoUqfYXvcUx/QVaEBJB0zzIVIFg5IJ6jHJpDLbjKVAivSEvn4BHQISEgFxRkp
         x/YLZkvlmWHkWvJe+YmKyzsioKRRlKPeaqytW8Fy5asZtyA2965/xYpNcT6lDE6qQ9go
         CxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997821; x=1778602621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JC3hYS6liihf96hKFXCRKLPQmhVUOWHZUk/IiD0r11M=;
        b=Wf+smsMrnHR0BOl8CIaNby6zoI1R3+WnrhqaPP8e22Ce6NcQup/WGQtbN4Ldvu8ci3
         bLcjqC2gOKuo0SpenxzvfbWqXFR+vziDMXz4kqEkLf+n6NUOMI4ydMobFot6xQnqEcrM
         kubTCDBYm8B4S+pZ3q9u4qNiuseG81WtEF8a9ZyaFLqItVZdz7a1yVpDcTnPU/4YvEIh
         WwuI/7Q706NqMvALtsaoc9ZnF0i40RNbQrCLTaM8/iuwYmRNPkkfBrHC5yxsLQC7rFWp
         XVSDHWR4MNzbDrM7yxcKvX9UqKRO12g5PS4wKqHLqcwzPABIpnrnnAr6WvjzQpMjLLNZ
         Ck5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8imqlcPZqFGi9N3FNwByYqHrWzI9DCGtDBgVxwbXNIKygcX309UggcKvvSavVwGQRMmGnSDSkOjiHX53iosqJv@lists.infradead.org
X-Gm-Message-State: AOJu0YymcPDSrDxfz3xLwhvrv3hdDVGKtERcWNYKcyyCtyYfNRhmYTqe
	4Kej1IsXAY7wqHb3QymaDyM9/eiCY1fX6STvkhKoL1iElrA6NNp/+uN2
X-Gm-Gg: AeBDiesOVKqP6o9Yyo9Q2OcL5ylnLCHo19sO14dYTPLKjHVyC4iBTDTk0fsIEe/z9lh
	y1nQ/KezvCeFvMR4RgJzx0NCS0sAPsIOB1+qgnVP6d45OLHO3LaZzrg/op3b3d0TXCGpaE7DxBo
	o04ClsFenFmkRPVOXCinCH42YgjWWTN+Q+qoxCQgwc4QFIUPyU4g3ZFKagJC2v5BkuOHgudDPZA
	hdyApPBDuGcjSX88T5J2g+4VhlTWW816F5ASDmPb+x7UfLa2XKaOOVOID+5wHuNg49ZH9Sq9x/u
	eWwM7LlKXwvqN1+ctBPv60euCmFjQRsEmewRGJ8xc/Xy7tAOdq/j2Uz1P/Hr94mImfA79JaZ1VF
	KdNUA9429xbAYKQLB7VVpD++PmWiF1YCheV3vTbjNI/Iv+wSl348P63I2nqrANWJ5bmFuJlN9Po
	0yomNL1mvm7n70qwtnt/HQ6iGJzOsctjBX2bkvdSvrR+otk+XSTSbmODb0+fX0akuyPenVkoiKu
	hdfwKCHDLGD0uAdHuE=
X-Received: by 2002:aa7:d319:0:b0:677:866c:6bb2 with SMTP id 4fb4d7f45d1cf-67c1a2e5f85mr5124227a12.16.1777997820593;
        Tue, 05 May 2026 09:17:00 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd91d5727sm554894a12.29.2026.05.05.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:16:59 -0700 (PDT)
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
Subject: Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Date: Tue, 05 May 2026 18:16:56 +0200
Message-ID: <GgrksnDEQem0uehnTU2lzw@gmail.com>
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091702_766865_269EC858 
X-CRM114-Status: UNSURE (   9.51  )
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

Dne torek, 5. maj 2026 ob 15:48:07 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The H616 contains a video engine similar to past SoCs.

Maybe add that it's first to support VP9?

>=20
> Add a new compatible for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Either way:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



