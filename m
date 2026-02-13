Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB49EDF148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=; b=T2R77k+jVXaLFAogYw+oOFruVH
	Nca9CCiKDInY25zSEGmbSVtFhmIgy9OiwH0ugNeI0EBswC9JMkvq1cQaXRHJFoZDuiBRA5AS2kSzy
	egFaRCdkSueIbR8nJZHMCg5bf2MgVin3/Isn6H29VHK5DKhzu0QusU9OnIXpnGzs2czNSi5qRGAqV
	Lx2SDvDU9FhWNc7ikbPgw5j4oYRaVAUcsVCBKYWC84wu01IBrJEjciVF2TqEcAARNKSEanpf5we3M
	8N/bRdpXKapOmEinwyL4pSHXTvitRAcWTrmpCZVV8ed701ARYeUIYC4tsxAB542tHMkkV9gIQy/sx
	xR/8Hx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr8W-00000003O0M-2xYs;
	Fri, 13 Feb 2026 11:15:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr8U-00000003NyU-0SaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:14:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so895133a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770981296; x=1771586096; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=gd31OtO3XA64VTYceeuLU3UPkpuFVCXuWSH5pCX4s9/3pM8l2asYxQWZuZ9msCJB86
         HrkZgIz52cb3IkcpZRJchsflDSpXY1JKjVl6okb2uCf1Bqx2ZRaJEfmye8f/VLHB57mn
         wo1KJb69mGMo44BvtwU6zHyfaaR1ktsYLXvHizzKttTV/8qgzK53HLydxL0R4nO6f5rz
         wbca81pOOxQsYwitN7ctgBEGHUmuub9pOvTcVtRiwsZ/7vzuIhWrPy+7+YFVW/GuA8Cl
         xNM30eKPfq6fbAicS6z4H8WNLU+jm+8d8BzzwmUyqXUQD7uwEZlo3MRsZST8q+8ZRhqz
         7Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770981296; x=1771586096;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ytPLGxNj2ElVA8s+TjvSjee8Qn3nzSUlf4+BWnRGjg=;
        b=H+/lDKHxOQmVRsqqHzKnlaM6h8VYluiRO2z8S81J0vscLUITbIFPW84MWldifoiFfe
         mTtnmOooUXs4hzZpIPtFJWZ0B0gu6EibhjYGGIoBZx7ftxRSv9u2sp+CKth9KlYVOpzr
         pWJllaX1eEJ1jNSrq3WfhJmggmpM1yhw51VVf72BbDGA3evad+HoXITpB+nZxOYkqg2F
         mjj+5eDU2akaUKxQsStR7erWRL3TjhLNAedIDbixmc+QjpcJ1ELwHhYIgCFg4TSIJYG7
         nyF8upVnTXPqoOU+ghe2kYyewaNOOo1Ga+ajW3VFRcbu4RbHVLWqKBSlTVaReJJwn61D
         QY5g==
X-Forwarded-Encrypted: i=1; AJvYcCUU21CwQKqRAq3DYuq7yf+vyZKk49lDk2TmssVvFYBJXhAwYVJSe06/AOPd3Oeul//DjcNDeBR/3CefpGylS62b@lists.infradead.org
X-Gm-Message-State: AOJu0YxvbHC8se+Nxi2OwGd/BEWNf00LHh0tMNv9nmZ69+IRq5UxtaWb
	w/jmGBBdy6l1TGujhQwY5b5mrKGDrBcRki6cI7wBTuyZe9UTOkSo+mbS
X-Gm-Gg: AZuq6aKokI0rRxXzwXjTMfKuMTYtjdis0Fc66RozMEozT5Vv++EXkX/akOQPpOpcr/S
	DgWchl9i0eAsV+h0eZQed3cmCtdToY6mL/15rzX79WnRCwtKZ8wwfvoEnO4TWKHoxpSQ5KTagz9
	aAlYlVaV14chvIcU4LAXGh4s4pQRtMVImcg/lviWSdGr2vddp7SvMd5m9r8acMpZSxdlPQeIS99
	rOrBY0ovt63UUk0pYKrcTMbPLMLQwaSTPbnscn4fnbQk26MR9tKaRRwEQLqZKKObCif1skJOsgP
	lnqebG2WRXJNkSNqM/tiuwgNPD5l65Lwc7vAKBKzqnu48Qu0pzDB2QEzLi+DjY/V4ligFJbHbI9
	rfvCCrDS9+0E8qlUbUZXKbThak91c5JmWwITE3O92Z9GKlWWWvUCwJFwcG/LHQiEjkyk15DUOcu
	2//um5zWc5Pu+mPMruPAPgxlgOI0oCZ0I1XplGtpw4PAcdIEzwTauaqMQ2FpN63I2oTFsQQGo20
	HWd
X-Received: by 2002:a17:907:9715:b0:b84:2b70:98ec with SMTP id a640c23a62f3a-b8fb44d62efmr75438766b.42.1770981295511;
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fbe407520sm3908666b.43.2026.02.13.03.14.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:14:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
Date: Fri, 13 Feb 2026 12:14:43 +0100
Cc: Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D93350ED-72E3-43B5-BA4F-42E0FE491B2A@gmail.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_031458_164115_DBB22131 
X-CRM114-Status: GOOD (  14.37  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Krzysztof Kozlowski =
<krzk@kernel.org> w dniu 13 lut 2026, o godz. 09:55:
>=20
> On 13/02/2026 09:31, Zhentao Guo wrote:
>>>>>>=20
>>>>> Why? What for?
>>>>>=20
>>>>> What is canvas provider?
>>>> The canvas provider is: drivers/soc/amlogic/meson-canvas.c
>>> What is this "canvas" device.
>> You can think of canvas as the agent through which the decoder =
hardware=20
>> accesses DDR.
>=20
> AGAIN:
>=20
> What is the canvas device. Describe or point me to bindings describing
> it. Your current bindings say that canvas is "a collection of metadata
> that describes a pixel buffer" so there is no way it handles DDR =
access.
>=20
> NAK
>=20
>>>> In short, canvas is a hardware IP inside the Amlogic SoC. The =
decoder IP
>>>> needs to access DDR through canvas IP, so we need to reference the
>>> Why decoder cannot access DDR directly?
>> The internal topology of the S4 chip is designed this way, we don't =
know=20
>> why our VLSI colleauges designed like this. But similar designs have=20=

>> been removed in subsequent chips, eliminating the need to rely on a=20=

>> common hardware IP.
>=20
> Quite poor explanation. Based on this, this as well could be entry in
> device reg lists.
>=20
> Anyway, I am done guessing, explain properly the hardware instead of
> answering with half-baked responses just so I will go away.
>=20
>=20
> Best regards,
> Krzysztof
>=20

Krzysztof,

May you pls explain me: what added value - to upstreaming aml video =
decoder - will be provided by giving NAK .... because canvas/DDR access =
details explanations are not enough detailed FOR YOU?



