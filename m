Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9DAFC72DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=; b=h63iyEZHbRRS4F6VVOO0sIv+jz
	FB5FUUNx1TLC+/2iLgNn+296iBqadjc8C2PfX96Ksvy5mH8Ugg1fdSuTLv4Tgz4eQOxjX1yT6WWa5
	i978Pd4xWW097TD0M5wtxuOW+7vsbJQOWdRiPhCiUyI4xn4Sg/F6w1JnXdK/1QQlxAzlJCPKcxAFA
	kRNRpZCYtnT+z0ASfDe9F8Cb0wZTWt6Rmk9X3mcZV9wADVKXnrr6D9M/OU9HHTmQiVmXZTAR1RnUz
	eG9HBQShlLBobnpyanpgtAjGXD/eJAsWvI7yBeh6rkqb1GbALZV0GogbWe/ctLI1QoNH3aEvJPTfX
	ghz4Tq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C1r-00000002OQ4-1wal;
	Wed, 25 Mar 2026 00:23:23 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5C1p-00000002OPZ-3RJM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:23:22 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8cfc795ca97so170850585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398200; x=1775003000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=p4H3mxKXC7GyJwiZbhhpXfNDnVhqjfhwb2pz0aPwlck2s1t4W/lPSqR+UwTeFXJNIg
         Gi9hqDpSggkinIfGaOjWqfikG6BoYhr5hbBKkx3CKXyd/PfjTw1x6ImrdsXvZOtrx44l
         RK3DCsHH6o7FLYECQgeFNmowHsBSg6qwGjhjYueFuYjjca4Mt1D79m9gwnXJAtlnORI4
         pGlz1Hy/ez0IejIZD1Ib5vkK1FpE5a1U4Vf8glVPFi2Zuqt5yAAc1y+Jw8+A9iXpv4JB
         lgrmTEE86TyiIly248qjDrA5fIt1ImPwzmVq2ilA+S5m0vPT2i2Wo5u9k0Cpl3aptxY8
         a3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398200; x=1775003000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqM38fZ/Ssz+tyho4othW8DbZuAzZOYo70QaO7E9QSE=;
        b=OJJHVxZbmiYcPDV4TM5bbZxAsTrdA8W2PY6JYCPVlBolQH3JY1pe5ApnZakrOONTyL
         1V0u8iQcW+4kZkhu47TUQ/t5TDS/TjEEr23SfiqYl+2lgtosH0bisUHQugIoW8+Hpm9m
         hRdcRz6Yp0T4IWbMbuMigKXTFzcvJ/vACNxGCaonDLF3NdEjb/h5RGOh7uaxg4f6SYMC
         6YNz4gK5Wi+pWFRndklngiRjP7gSpFtJdQTcalhA12l5+74RIF3ORD/c7e6bIgtPx6DA
         bC7INKHh236ajJDJUW93aQeJWor/4kQEK9ZzRy4yJ26cY3CLoEJ8vI9px5kR0PXXQv5H
         EwLA==
X-Forwarded-Encrypted: i=1; AJvYcCXgVUnFRLfEN53Uf5fm4YzrWUUBB3GvEH872WTq6IXdL8au+7B5qia0b67/MPj+RVOTFnJnemHE+zH4igj2Y7tW@lists.infradead.org
X-Gm-Message-State: AOJu0YwmXxZa8SVcV3rNoO3rkLgHejSWPkR5pAkorAIKTWRhysdobOK4
	bkggk3a2lYuC36JbrCNIRulhnZ4V+WJ7mmraNNbSESSew6kWxwILBsPR
X-Gm-Gg: ATEYQzxh+XjANBoX3d3qhB+DTV6ha0KRyPssEJgurMgpYsJY3a9ew5YgYBkq/WRJ+T+
	AhtvBN04ealvlqYpVTsdSdoPKmauGc09lJEwyyE3tGLVko50rJsUkhzNR/MqlxI2mX+jDoPwuTZ
	YL7OyzLA6sj1OAUmhLjR0iaBTEg5gzTASpSCT2FjJFwcNVHcxA04LR1si0WEryR2FLVoyvEnqDY
	f3tJzyT5z+iQnvsnxH6Ag8ffCVNFbTiMO0MbrXXGkBTGSdxnQ1flAYn8PBI5QHidfSpxAtjRQhz
	jgl+v3ZWjR4mVG7X7YqyCOcMrv0yimg63IZtn8Si4MQaL6fnCGBmcr3xUWrlFKl8HU9DpXRyEss
	WFX5ilTx2pCmCKBsKbTKJaWXSvrUk0GzyJS6NCbNyHYQDnUGrNIZEQ5N6gd9PsKkQCZdlXrir/g
	Tf5zKpI4cUp+t0vnENUygZc3V7URl3PbRzOKCd1UJzrboDwOGEySoSQpb+GEyXmvnFdNGzeQYwd
	nowIr2mh4PtAg==
X-Received: by 2002:a05:620a:2893:b0:8ca:105a:298e with SMTP id af79cd13be357-8d0010753cfmr213579685a.63.1774398200388;
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536ba60sm128830856d6.44.2026.03.24.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:23:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: sram: sunxi-sram: Add H616 SRAM regions
Date: Wed, 25 Mar 2026 01:23:17 +0100
Message-ID: <3400822.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260324164357.1607247-3-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
 <20260324164357.1607247-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_172321_861728_5D4E8D19 
X-CRM114-Status: GOOD (  12.46  )
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

Dne torek, 24. marec 2026 ob 17:43:50 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The Allwinner H616 has two switchable peripheral SRAM regions:
>=20
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
>=20
>   The mux value for this region is different from previous generations.
>=20
> - The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
>   KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
>   CPU access is disabled, the whole region reads as zero, while writes
>   are ignored.
>=20
>   The mux value for this region is the same as on the A64 and H6.
>=20
> Add compatible strings for both of them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



