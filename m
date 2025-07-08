Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272E1C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIpnI+/KkKYMz9Wfww8vVb4elUGSQP7L8IBvr/OnuBk=; b=zuNdzkuoKW9RIv2FrR7WqWIvxT
	7r9A8/oL1sfBqQ5/ef+BFRNbWnU0kq6e7gJIcEoSLPQu+GJzcRNeq8lzlMzrPB9ibTGAHIsxbCE0K
	KQVoTXsM3I2CmDT02nxDvKtxI1vk6S0N/ne48h9Gmc4NWpM5Vz+x3WJmYrPhVt67kbN4DxwxaLMts
	4TloPPl89G+fTEdyvuJWI8nMV8YGW38QIkUmb8KcR/zkOCj0NhCE+2Vv+SvayCl6wFix90NoMweVr
	pSdYJJnBhGFnn/m930NTfdrR/2cRgfwOopkfiHffkHzSYiwo9CuNgzgA1zw4b/GIvXmOpvSbql3RN
	msc9am6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIAw-00000006vKF-0ITC;
	Tue, 08 Jul 2025 23:56:38 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZI8Z-00000006vAu-3IJh;
	Tue, 08 Jul 2025 23:54:13 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e8b3cc05665so2768024276.2;
        Tue, 08 Jul 2025 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752018850; x=1752623650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIpnI+/KkKYMz9Wfww8vVb4elUGSQP7L8IBvr/OnuBk=;
        b=f0pUStFZXAtDGm82iXC4MV6th733jROAORR43kckZSt6Z2ci/L9n1kAfVqZiY6Ix2V
         D5hZobI3pjYMvpG6yVJU9+IjLg5TTCDywcS/tPOFbIl8vSBSoV9Vinf66pXVepQVGNah
         Ms0fYDctulZ6ZhJ98sPjMKXcy6bw/mupdgg9xvCnkFzOitaIhBYmz+o5FtEvI/v4kPRN
         1IIqMoRVqJQ711yYKnZex0B9DYiLrfPL8hvpYgqkKAsrLDPRkJp2kEQcaKW96ObjpWwg
         fDbz2+xtAR79bxEbo8fDV6HbkE8meKPAYyfrWGPjtQiaxm8Ek2HF2G2S0Yr6iEfnRQ8o
         tVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752018850; x=1752623650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIpnI+/KkKYMz9Wfww8vVb4elUGSQP7L8IBvr/OnuBk=;
        b=XfsAWFOTCYeGzwKEHbQSYDEYvgz2KNEvh4er7G/G3LvIMCCVWQq/0MdCD/utp67BaH
         XtNgT9cx+qvlQBqJ/knKJ1uRg7hmKcE4QtZLZJiQ/BqiWDwvh4TqJw+ZoYxnbMPbNk+Z
         yqJqbyEcxSWdDRbiO+61tVewuwJ5ufY/2+1lTcSCMtNrPa2QZyLSvvYV0u1cB1ZqX2B9
         wjOZHcK0NessPtkxjjuyQVxWuH6qouLoV7JkTx2nU5rA/YHhbpD7f67nPy/EdCqMFzMU
         uYHXc59UPUPw9Y4fvaqqk/tqD5SfretXWsn2rAy7HK6Wbn23PJS7HEhupI6ExTn1f7eb
         HC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWST5GzvF53Dt7jgyZe9sJCdHytxeKB7MSsadeNljngNqdVDJ/uRrh6Bm4pF75AxLUDME92N77wyzv56c9DMpcu@lists.infradead.org, AJvYcCXqEA9iKF9lztD6Z403pGit7K1vd3CDFhB4wThDP1zHpWl3IaPXAAXvzSXcdUiabMIN5LCHIl0SiWC5EyMYIn8=@lists.infradead.org
X-Gm-Message-State: AOJu0YynesCItnT76nTmvOL54to/f0dOxWpwlQQGX+cNw+rXBT0lxv9M
	rE/yFgM7axNOxPPxvRUaVBPjeUW3ssBCXsBDZ2G8eSDLLmjt3/0gVlasqqHK/IqWHK1wITia8gg
	WBzuCz+qT1egQVRGKqgDPjywiNmuyp+A=
X-Gm-Gg: ASbGncuiFDRJOd9EVQcZ0zHg2HN/JJntWNHCO7+i2ySHozOw5nC5bDaCFRsZ/pPpwm5
	wN0Uk//W54tWt4iFbavxw+mOca7S9rBMULg9tX+Kl9/5bBwnLzOsx6YAZNK1mrZDIRPLjKCMdH1
	IB5oFhWKDY9cAYk+WtMIRAFQDbL9Lm3SkYv+XkxmNqkjqME/xWrdrfiqljerd+pUalQos=
X-Google-Smtp-Source: AGHT+IHHnkecJrTiDBVoCM7eM4g32Pk1c3raG4mqxUk9pSpJNW1vy947mDXE0F5WHjldRJe6WxHFFxEogzvUMtezeI0=
X-Received: by 2002:a05:690c:9c0e:b0:70e:2ba2:659d with SMTP id
 00721157ae682-717b19634eamr9861137b3.23.1752018850202; Tue, 08 Jul 2025
 16:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250708201745.5900-1-rosenp@gmail.com> <20250708201745.5900-8-rosenp@gmail.com>
 <175201013411.1121693.17824456704959772294.robh@kernel.org>
In-Reply-To: <175201013411.1121693.17824456704959772294.robh@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 8 Jul 2025 16:53:59 -0700
X-Gm-Features: Ac12FXyerQ4XgpTDcxgbBtlk_P_w9tWTj-9IUlprsdtZUPLTaj8qf2lgKgQNTww
Message-ID: <CAKxU2N_oUgqdOymr6RRSe3KYQpXrUUFm0SvOYFogx7NOVMv5LA@mail.gmail.com>
Subject: Re: [PATCHv2 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Stanislaw Gruszka <stf_xl@wp.pl>, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_165411_825588_7DB66BC8 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Jul 8, 2025 at 2:28=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Tue, 08 Jul 2025 13:17:45 -0700, Rosen Penev wrote:
> > Add device-tree bindings for the RT2800 SOC wifi device found in older
> > Ralink/Mediatek devices.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../bindings/net/wireless/ralink,rt2800.yaml  | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/wireless/rali=
nk,rt2800.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/net/wireless/ralink,rt2800.example.dtb:=
 /example-0/wifi@110180000: failed to match any schema with compatible: ['r=
alink,rt2880-wifi']
ralink,rt2880-wifi vs ralink,rt2800-wifi

lovely...
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202507=
08201745.5900-8-rosenp@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

