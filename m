Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E192EF06ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJ/WctdqigD32PqEqv3ebe0jqlT5BVVf/tJqU8VMdkg=; b=G+mdCXaK6sW3Voda71Vf37I5Nn
	fWP3CuDQHyErlMgzp0x6LXOriZodtL72ZdtPIgF5QGFPp++L3gSOr5cAtEv2GTq+PYWBTdSPQR0fB
	e83Um+1L6cCEv+6QmNOG9Zs3VfUrg0+J6FER9MO5t8dVe2PQ21qSkCK0yjcSfYwIh1/M+zCTgiXfD
	Th7l/avTEdvhML2lilkp/j8bwUe5hRsdo05d9bauqzlCcEJSOrmPHeNAbEIOWw/ObTD7/OB2R+R0I
	UaSIgh+F75mYZn7SL+cU8ly8ARSYAv/AS63jvzY6U+/oRQNeg96GvM/dzPXMqJB1PjEH8kapsF2Cr
	IFN9MzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpm4G-0000000GtVh-2Gt0;
	Tue, 10 Feb 2026 11:38:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpm4D-0000000GtVM-477W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:38:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-4359a302794so2591941f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770723484; x=1771328284; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJ/WctdqigD32PqEqv3ebe0jqlT5BVVf/tJqU8VMdkg=;
        b=nsbCCDFtbPc3t7k43pwCGU7/aHCEoWip6QXlEjgfDGni+a2lxVSXq/Y6j0vT6G7XS0
         FFMw9Vk3XIQP9kdItK/0z08Gtv1cnJtvInavzFcYS5hID/AlQpt0Chq7iGyA8aAy4+gq
         NqJYGNqE9cf35cnpUlOsXB+idgpo2kzyRBp7g4rSjQrdyeYEvWmyVH+2tkScUc8HE+w6
         CHNSU9UpUA6y2PiN7IBoBmCVYsBw/1APWq0M3DJ5HmLwALXb1trolZceduEihfss645o
         3Bd8WyAI2tok0oRzgk6+47NOfV+PpXxZaHI3jtOeRFTOWz3zHdEJ0U6JeDjpwisGG9Nf
         ikzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770723484; x=1771328284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ/WctdqigD32PqEqv3ebe0jqlT5BVVf/tJqU8VMdkg=;
        b=ctPUcy/w6sl3WY/8sj1qDAuXt4+64BqU973F2VaqBo4i15Ud63AhXJyTzXFdwGOR+4
         E+6Y0uga1arENws59qC2cc1NptFigRxYRVGKF3HIrafJq/eB2TPBXx/aL6CHRQodU5sC
         wwwtYEFvIEL9ZwTn/JFtKGaRDtFLpFIx57sAGPJz53FlrmlYGc1N769N72Ih43aGdNHu
         z43TY0TY9JEoMQZayHdcMIY3FnoPvjzSB+39srLwFt8vTnlEGl6m9+fiIyA5XNLmFSd5
         lyRw7toVkyIA8m08PDTcqx7ExX+FRN81465sgMeViAgb3QPh8znDRPKpFvzYW2DJrZSB
         3Zdw==
X-Forwarded-Encrypted: i=1; AJvYcCUWOG+3OZNUwqQG3h23zSIhLRgtMCj20teslO+u0wlbd8wWvz+oJjC5CxTe5ixQwRJJBNkbVIVN3MsSRdpfnLuS@lists.infradead.org
X-Gm-Message-State: AOJu0YycqfyjaGB4dZLoXJNhAm4bifL5Y9nt4TuFp8ijxUr5tat52ut8
	hkieI+VnCVr2iqfeZrULz4PXnUCy47MgXj+uHzJB24i1R4rQg2SiREfLkbwI9/mNfkE=
X-Gm-Gg: AZuq6aJxq1YAwWA3Gm2rWWEVTT8Fm+IkjBx/0/AIXt8bc059HZXS9uq0/vQx7CPY41/
	B852pWjmYOTNbEX/6K7J4zkruVyafWg0Nkh/39uPyevziYtnWSJmBtI5cTZOg8QXGCSp7O+2xg3
	FoJlPqyUzFZjZtsmwkkyGEGIEEok+7GSoND3AIlUqX+KOZ/AznH0zE+In8eH/VNvrAR3gYQ9xhe
	3s/OufdMseSB2ryWkW47F0YvIZicAk6+awSVE/i/1cTODTpMin0i/fbYzWhtK8G3m5vPWUYELni
	BMy6reYndFcKB+nBsWkx9V0eR9nCovZqClK7tazvV02VzANPDHMvwc1GNdxSQPcwxeCY020x+N9
	NICFKrpPaZC7l6+hakFFe2FaybfCU7DbopJMaJXaTcrIoYgJmHRk5fQ9XpEIdwkUMIVqMI60zr1
	W7PvYG+vzQeFrQ6S3VyF6Avo4xOA6z4BC21WvWo3Yk
X-Received: by 2002:a05:6000:2601:b0:435:d859:5cf with SMTP id ffacd0b85a97d-4362938a761mr23774127f8f.54.1770723483638;
        Tue, 10 Feb 2026 03:38:03 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43631c8d378sm27426330f8f.21.2026.02.10.03.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 03:38:03 -0800 (PST)
Message-ID: <cf4073c76c2db84fd8fac3e1c2a63918bf9d45da.camel@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar	 <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Feb 2026 11:38:30 +0000
In-Reply-To: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
References: <20260210-s2mpg1x-regulators-dts-v2-1-68783c9e0a32@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_033806_233012_0F65E250 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, 2026-02-10 at 11:30 +0000, Andr=C3=A9 Draszik wrote:
> Most rails are the same between Pixel 6 and Pro, with the following
> differences:
> =C2=A0=C2=A0=C2=A0 * only Pro has UWB
> =C2=A0=C2=A0=C2=A0 * Pro uses l2m, not l14m, for TCXO
> =C2=A0=C2=A0=C2=A0 * Pro uses bucka, not l31m, for NFC
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v2:
> - add comments for board-specific and unused rails (Krzysztof)
> - link simple-framebuffer to display regulators
> - Link to v1: https://lore.kernel.org/r/20251113-s2mpg1x-regulators-dts-v=
1-1-80a70ef42be1@linaro.org
> ---
> Please note that this patch depends on the bindings updates for S2MPG1x
> from
> https://lore.kernel.org/all/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd=
@linaro.org/
> for validation to succeed. Almost all of them are in linux-next, but
> patch 1 from that series is still to be applied.

  ^^^^^^^
patch 7

