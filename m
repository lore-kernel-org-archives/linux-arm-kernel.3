Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9060DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 11:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMMoSzCc5h3tOZ4YYR+aO/iNO1TdT3TVeZmWGA5I9nI=; b=rK74X9Yk9XYsNju0NMAw1Jfgtm
	aFt/xbJow2bBvr/8gcaDlN9XRVgdeWKff+50RlMZA1Mkxv9TAfmimKOAzkJReHSuPMjkzRmjWsJd/
	nE/xIp6QiK926Iw3lo6tuOfGKuwkbRIhNpjuYjH4SIZ7y6+IoZOUU8sWWVbuEWVQNPPohnH7wMeAB
	GAESTPVpcHNs2o1BKeUrJ5DW7n3cTHSyvLxL8wnnfkPkS7meZBxO7Uhy4T8id4kmvXgDQ7IwVuPl4
	fPdx5W8conu3pZlyWvOjG9fK2RpfarPCn0+RKtGxK/p3/vdx8RiSM56tAcOw1+/gyO4QBGsnSO5Vh
	C4IYaMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxORp-0000000EUmm-2o9s;
	Sat, 13 Sep 2025 11:29:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxORn-0000000EUlZ-2v9W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 11:29:40 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b0418f6fc27so471621066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757762977; x=1758367777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMMoSzCc5h3tOZ4YYR+aO/iNO1TdT3TVeZmWGA5I9nI=;
        b=hG/GQUPUgfB5gxgKZ7mhcUM6XpLDUHhDAyqRB6yxVnAVTHlIA+KWWfXOrGgk/VD71k
         Wc4jQoTAfVQ299yJk7FCSWMMaoZ2cnKuuWBXHTkgWxFpendPeLUHjRcavY0JbbGJdK9m
         HLBZKkxsYkezbxl2RGkjsRtyrzUbRNLrgeLDMUgQTByHjfCbwzZ6EdECf4rNtD49O37H
         bVRVk1XdVjubDscg935OzzXWMDWVDwCXEHXJm2GOT9UgZP5pXDcstsjG/1Taiimuo/Zd
         Tga/M4GnaNv84cHE2r19+NwSXFmcORV53g4w/5a8IR6M6a0jZk8NOn9+SlKO4IV90/PU
         FqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757762977; x=1758367777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMMoSzCc5h3tOZ4YYR+aO/iNO1TdT3TVeZmWGA5I9nI=;
        b=oZ2te2LCOsNpYcCbT2q8KJ5B2ys3SsO37hWfPrYIirymjNCtn+siKRAk9Z3x2QBnU0
         hcdcMtpy1erDe9CnfkvmDdFDiO6sMmX5elagHIwDJp+uGIYZ3D5qecIa5QyEhaZhJvHb
         O+pKl+bpRjU9F00w7Y7wpZJBbAZWSmKrVUquJ9WE+FcFzs+pvhHrqzgeCxzTWsUGTDNP
         nc+m/4MeIpS6V60wBstqbATHxSe6ik9FE71YO+DZssqrrDw7aKyTUB+wL7I8KxE2t8UD
         NT0Miy1rcH/a92fNPZGjdtXlxhKWsqVTqFW02lGj3gqoyqK0JvMQpFCwoWjeFJjMEWSL
         NCXA==
X-Forwarded-Encrypted: i=1; AJvYcCUmYR+EEEIJK+OQ/C//S1QekaWJowC42290lih1vjHlJGltfSyecXcGhlma6HqpIHv4LBLkOSZl5WN7Iwep6JiX@lists.infradead.org
X-Gm-Message-State: AOJu0YwjlqJz0hLyiXX16ws8gaHJp9V32TUUQ3S5yOqsaXzrGL9QvQ9d
	EKdYd0NFOBEa9DyuruFb+RL2Dwiw9455PXZOBfnV/e5p2JD2UjbvDaxI
X-Gm-Gg: ASbGncsY0+3S9OcJBbDiWzn8telxKqLZC4w58u7KpnT4ya9Z3VvQftI99FdaE3wn6A+
	JOb25JsvuXy/QAAA0bLNry6x6XpxpKMHkD7VieZ+sWIhcekSnyJ79EmUGWvOnj9NJFHZe1CFlnM
	2Md02i4rcfzjcn6LxuEtBtnAYr3+YVRCrllVfHimqLuvqd3sg5gM2PVM5qqXNmzFpMEQ6dfMIlC
	HMdOKV9u5UPLMgSTBF5+4l5nQPSuIGUKb1zppENBC2oC6/gI24fCfQAuR0gg1Y4NvhPdZPzui83
	AZnlmn9vqk2X285F3IhBfsvi6abu2esWufuRkahF8WwokdUeiVpBvpJsz/4n37VTr5O2awTWKKt
	QajddNqd4lUqSUtPgkwRQcvHzQhMKCtnJgt+9LD5YTJzO4aAfeqy9+T0=
X-Google-Smtp-Source: AGHT+IHjrg9HhMV8KoVTmQL6sNcOl2lLDDIPwEcS0bg0jeSuB02uw0MNZjGq45peF5NvlyJozkp5Pg==
X-Received: by 2002:a17:907:968a:b0:b04:a289:7b with SMTP id a640c23a62f3a-b07c347f8cemr599471366b.4.1757762977003;
        Sat, 13 Sep 2025 04:29:37 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07de03d93csm167035166b.12.2025.09.13.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:29:36 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus
 clocks
Date: Sat, 13 Sep 2025 13:29:34 +0200
Message-ID: <12739001.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250913101600.3932762-1-wens@kernel.org>
References: <20250913101600.3932762-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_042939_771036_A27CD98B 
X-CRM114-Status: GOOD (  16.04  )
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

Dne sobota, 13. september 2025 ob 12:16:00 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> At least in the initial version of U-boot support landed upstream, the
> PRCM bus clocks were not configured, and left at their reset default 24
> MHz clock rate. This is quite slow for the peripherals on them.
>=20
> The recommended rates from the manual are:
>=20
> - AHBS: 200 MHz
> - APBS0: 100 MHz
> - APBS1: 24 MHz
>=20
> Since 24 MHz is the hardware default, just assign rates for the first two.

I think it's better to be explicit than assume. However, this is fine too.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 3aad1b909501..5cd6ddae86c8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -767,6 +767,8 @@ r_ccu: clock-controller@7010000 {
>  				      "pll-audio";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
> +			assigned-clocks =3D <&r_ccu CLK_R_AHB>, <&r_ccu CLK_R_APB0>;
> +			assigned-clock-rates =3D <200000000>, <100000000>;
>  		};
> =20
>  		nmi_intc: interrupt-controller@7010320 {
>=20





