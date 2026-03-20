Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD407108B900
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMY0lcPntv5uUOV5CJc9+UYjtDKfD9WbUErgzgR4vkQ=; b=gBzvYrXot7hhIr/pXeT5cZ1aN7
	GlCdhNSCgmaZNTNG+LzmHtTWBRedQj+bCtqS+WJ9pSD1uz5GIz+67TPCk56PjtLqpQRTjasO/vZaL
	WJIR9CJ2UZ4YoNadgePeylvE1/Wx/iKWIft0uHhEzcS403fUe/TncaOLmHPzttAUYsHNBQkWSEkzA
	5mbka8Awg1BJa1B+ysf7Qe09PebC4vS2H3FzQ0PczDf3xgGcWQlo7UxbGnb39b7mWD9ipb22IYH68
	GTY/7WHjnIE9YiuQ3ml9oHTZRjnitSsfLYqN9w/Nkz3rWfp9P+hS0LMYkMk3verftE4fZjOpVdeYe
	n4/osg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y4W-0000000Chge-24hM;
	Fri, 20 Mar 2026 11:31:20 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y4T-0000000Chf0-3pFE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:31:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a27daa652fso1764345e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 04:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774006276; cv=none;
        d=google.com; s=arc-20240605;
        b=jcw4gPPeiSWYiiZIWNixAvIzwvORLfrikUweNEtuurxKvRCbgYwAQpT9dOb9fEjjYA
         +XT3wuW17m1pqNdhp7z+dNBapDdJHOPlkUbI9B3Ezs+cndyb9RRmuNWM1Om4hGjthcIJ
         Hhz0DU/h2Y92865bv1jTHRauKYcS7hnyXx3f04uDKIJYJJ6KvJ0FXGnjmKsFIA9NbLvm
         nzgGR/NJ+Mc9KykQmDSXpyH+3r/alEC12f302fplGSCGb0aUfFWZjq63PE2pTKxxT0Db
         CXGFJECA9p6LJQo/58i0g5Xgd5UFNHvhXSqGPyZY9KD44j6RXmLpQvnTZcpvLdhaaDBx
         0Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMY0lcPntv5uUOV5CJc9+UYjtDKfD9WbUErgzgR4vkQ=;
        fh=auTXLGQrWKzpqI9dMIC5nh/uMTBL4To2rCZjjehLP7U=;
        b=IK5LPJVqzkXW4uHJxtTXXb2VA31Bvh/VwXD1TKaaT1F5rZaSjgx6ZS540/DIXUicYg
         awjeMaAQbjmlxJISGZv21v5K8OFM4KRWcupHbqJEBzaW4jsjrxE4v9CTznoAVfe5Eyt9
         R2FS8P2mbAmp7rv6PNDteahvcf50a+4f2p5ebtueQ1K27bpcpI7GGjaUzGG1ABDscP2N
         XW9T+eMvqqUqFpt6bR4XaRdqxStVjYtrznT46s3rjtNlqq7tRARn2+122+yDWcIoBRR7
         lkmjDI6g+Gga3A2L9tVn1boPQSJ2vGw7z4kUulXEwFkE8oMDqURd8tK90fjBu3du4j9S
         SLXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774006276; x=1774611076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMY0lcPntv5uUOV5CJc9+UYjtDKfD9WbUErgzgR4vkQ=;
        b=RbMie5JY881JN595Un2Dh59VuXp8tetc96v/wb9IcQCqxaY+9t2zieyH4T/HVM8GkQ
         TMP3P87P1E5/l+8yV3sBwwrrS+unta9v87UP7y8FNPerNzCoNryyzjHbJEZwtNJ3+Sy2
         aAbcWtmPGY1eKRaa41FMvkY8SSNqj21OD3/GvWbNYjcbN12L8D/8R9zLJEwJoykFJxsA
         p0eS8fi1HmmOnq+RQ148XXV6i4b8jfdqQvhJZhsaEDryq4pb6iDXiXbf9sL/rGUgupOf
         TAemol47X3oKFpnj96bmO5GRAOI2syDfXoZmtB4qc/vTSXwzByhDncJ/Kw9mVd0NSQBT
         Fm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006276; x=1774611076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMY0lcPntv5uUOV5CJc9+UYjtDKfD9WbUErgzgR4vkQ=;
        b=o7O1bIS57CBW26ReeFDKOCx9Bl0cSqEDYflwgmWW6dHJ0YlblE5kBbNOLgsXTuDq7L
         FJQa1LktlznYpRx1crVR2xMe4B55rmfBvri72dpPG/xiL2nIQifmceH+76DMBz0rRXX2
         E1VoMtjZA2XvwB7Ii5sRYuzm7Kx3LSPA7WWTca/srzdTLroxIfj610tLZiavTZ4hlyl1
         CDjNwq+u9Zm3EsZB6E7BBiRJK0s8VHWzg5znJuFvPzlLAj8+ATg7kePhx7pvwd05h8Bf
         V4evWdWP/LgTzro2EXBHOncSGJ1lvHb/EAMxFrvGnkLJg3VaB0u5vJ1LXzyNDvX8gfUh
         O83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzdjHkgrHZcPPUqXefZfDO7tMtoE4Yjfl12W7+Z6SbhtxsF3A08iL9C+qW79uR/FdZlUgZPt2ZVYd6IOt4+MY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+gU6CWE3fwlcrBCApxKkrTqj1Te+pFjf8sQv8AQMstVP3l3TZ
	fWCp+SK4gft8JoPT7YzfbAG4DbWG98BA76qeIdgSDxaVKw6Q1yp4M5HzUnHID4Pz9L/f9zl7yhd
	z6mSQs8ioJG2JivbikPAn6LKm+74QhS8=
X-Gm-Gg: ATEYQzzEz5/Mk5VrjRVePvD23qC6ntNaY+kx07gPg0gRqQ2Jcd9919VnlXzIJHCopli
	ZxeP/Eg4vW2n9D2SeElIMsbC3A4VPWPaqnmOZ7SdBhLrntwbor6TUdxW2iAX/LrxfG2+w3i+TVL
	+WQR/GGUCNGCo1GlVZHtO+xIwgUrpGBawP9Vkw7oPQlSaGkx65SLEI9lqRFuYHL19dliGWOymIT
	Jy0nJdJtDFyN9VzftK/ws2lFxvuyrduZG/P71WAJxT9YUUfX+CrRPyzdv2SK+8ZliEjboXm1m/2
	WtMzT5BDlcybUeKKAJf3MmZU7vNCsOxbNfccNOrDSEcMDTGDn9bSzLOPX0/61BaH+O1OSMk=
X-Received: by 2002:a05:6512:3b91:b0:5a2:81b0:90a0 with SMTP id
 2adb3069b0e04-5a285b54accmr941245e87.27.1774006275214; Fri, 20 Mar 2026
 04:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260313131058.708361-1-festevam@gmail.com>
In-Reply-To: <20260313131058.708361-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Mar 2026 08:31:03 -0300
X-Gm-Features: AaiRm50va_ccG5R5WwBO3W7VyJgC0oVZfJyFxH8ga_r3f46fHiK6ATpXoolqHSE
Message-ID: <CAOMZO5CksZdgaT1Rg1J9L_T0exsNSbO2G=OCnL5sOr060-neiA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shawn.lin@rock-chips.com, Fabio Estevam <festevam@nabladev.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_043117_973131_8F833234 
X-CRM114-Status: UNSURE (   9.34  )
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

Hi Heiko,

On Fri, Mar 13, 2026 at 10:11=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add the PMU GRF and IOC compatible strings for the RV1103B SoC.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Does this version of the series look good to you?

Thanks

