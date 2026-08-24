Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C134C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=; b=VSjioZP01fAYUdWSLYy4cUgkdd
	Fb9jWticNygF2R37fsjeySkhZJSkjtOIxCLoNxLsd5B2sO4xvKnSabVgSgwXv9asMEfUXJt3ZsByG
	duVpeW5naMoSvHuvzODZAeoHkDX9ZfHC6bvmvczH/hfRWDg35+x42hRSa5CIGDU/0C+rHdlPHwQNj
	9uSAqirxZQOztpZnRYlJgEB2UtyqiTvWQzdQeIzuQv3Oejy/FRd/on4cAnCy+f53mDaQ+6Fd/smKg
	SYPOkpifzNcZaVuNWDHC+ZSUpf1n0pcEzxG4m0YbHwTgfhlMp5TUHIVP5yEvEonNqNvC/PKTS8D8/
	w+Z4Q9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP3E-0000000G4Ji-2E1P;
	Mon, 24 Aug 2026 07:25:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP3C-0000000G4IW-17FP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:24:59 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15d111ca99so367511766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556296; x=1788161096; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=lChfjKCpKuc99RWRk/6gwfmlAPmqqlnqj2J/2HJ7Y8dU6VZAtetvmZ1zydC4NF0LOh
         Zts+iOJwuHAIQ82jsmnchJofkpuGiMk+oBpg8DJSsgFJ95EnMFhGDcx0cN07Iehl4TxK
         HdKOTTupSjNOjhXTbm2lEdVREWhMTGSUTitFOHjAujL5XJGTFA+q5pY9txtJKLojN2jC
         HhabEQl7eYrafEjIboZDcg3ysuMg9d3z0G3m9routddemieag7EGUuh7CGNtGanUbngu
         smEm1vxmx01+rFuyj28c7KO2CMmHT89q8moajCnK3x+hBLY1yvlPYd2AKSeYEYV/7cVA
         h4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556296; x=1788161096;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mReJpvtLm9dqdv3WCFEniwlCeMYP2iFL9V8+lCtTCl4=;
        b=ROMi1zQXoDwbU+Q0OeYLWnzYpMzuD6JWVkom3sDeEFxj/JpV1IvsPztiwlDVHdHwur
         pVuRkd95zAORubOzNs9Ez/rALGAeExt7kyPb4Fkn616Uo9wQn7k0QK2Gnni/pQ2mI/Pu
         GcnIV689K8Zz7NSNPq950w2oYyjkzorURZEOqnR9VGRuJ1M6qXY/smNYYBnBikh4+N7E
         f7jJWvsb8ffIYx6lXTrsjtnedPnc/xi3Dh2npdAHYsIrzOBOAo8U9ZYiOpOJbKYxgF2g
         MXhl48zuRYLP5tV3HERS6MkO5msEEOTm60eE2wf4uEN6gCxTDRWegdIAh8aZP5d87wSO
         lMbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqowE/ht3W8RnVMNaOHg077QXTx7ev6gz7Md86JKDm1y11YePE9U4F4MJIRkHmr/mdqGU5F4ZfRkWDq64/nLi6@lists.infradead.org
X-Gm-Message-State: AFuF++nFPNG+ymX0fbuUpENKAaMpxrQFp/XoLf+amfqZFqVSVBsmCRFd
	Psseo6NHBe/Nov+G3nwPwXTfWuO9tvhxck+gIEDUhpmFNeUrH2UKSjZ4z71eB5ta96c=
X-Gm-Gg: AR+sD135r/ztZzapIDqxeakGOjAN+06a2MYkYE08DtQRujWUINUCddP9w4Dqt6kmQaT
	fzg49TuEujJEAREs11NYoKVTcMqeZUnb666LhhSGuoeQEQS2OQqTu7aGKCXbY3n9a0cffC47bT6
	vMjju6HkfmRcTFrTcrfsSTEWbutYEgT2MvW/OFXRkNA3FeNIVUp/JVa4cbLI40uJbAn9btxrvTT
	4ObeVF02FRSq9Ye4s1U6oBGQPyaMlC+ycqHypBYtdAMiV4En8UWpYQtkpvzLKyNXuADaH45hD1R
	SD2IrRxJGjkL1DF3Jyz5gJgfQ48BoOd1Ohg/rGRu8dhgxRa5PilnPmwI8VAfm1ZWQLpN/ZmP8zM
	dzAHDroixrQvUDWRmDLvdWblb+nkp3bH5hYoZO5f1ruVPGnZKtmu0ydSO/JqX07ToNhF2XaveoU
	yj86gsbU3xcqqf6Hw2fqfHaWMnoOfTNQj/SEhkwHZ9RDVhyGbmKz4v7KpKLXDwjcEopMBh04742
	D0FS+3gEwcZOPPnXWfuaRFeCm9jxVPInNUj90HS19t2peMbQOM=
X-Received: by 2002:a17:907:1c26:b0:c1f:29ce:76a1 with SMTP id a640c23a62f3a-c249272d9d8mr2094529166b.19.1787556296453;
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Received: from localhost (host-212-171-227-71.retail.telecomitalia.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1399310066b.32.2026.08.24.00.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:24:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:24:55 +0200
Message-Id: <DKWZTL9MS4PC.UYFAW9NOZG5N@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add MT8512
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 <devicetree@vger.kernel.org>, "Julien Stephan" <jstephan@baylibre.com>,
 <linux-mediatek@lists.infradead.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
 "Chunfeng Yun" <chunfeng.yun@mediatek.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Carlo Caione"
 <ccaione@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260721-ccaione-upstream-mt8512-mtu3-binding-v1-1-2f229c39f121@baylibre.com> <178576344579.3104650.10771178654777991535.robh@kernel.org>
In-Reply-To: <178576344579.3104650.10771178654777991535.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_002458_321515_E209E831 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon Aug 3, 2026 at 3:24 PM CEST, Rob Herring (Arm) wrote:
>
> On Tue, 21 Jul 2026 10:00:28 +0200, Carlo Caione wrote:
>> The MT8512 USB controller uses the standard MTU3 device MAC and IPPC
>> register layout and is handled by the generic mediatek,mtu3 driver. Add
>> the SoC-specific compatible so the controller can be described without a
>> legacy split node.
>>=20
>> For now the only user of this is on the U-Boot side but we want to keep
>> bindings in sync.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, who should pick up this change?

Cheers,

--
Carlo Caione


