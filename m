Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CACD206A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+d+kOXWZ77Pa79XMX8gLZVtaDKOXA1/iNRWjymG+eA=; b=Sq5/fCXEiQv5fH2Vs2rpyyMgzX
	tmN0qFf43yJxDmkcptlMqYyemiuuqOY59CaidjISwfUTCFHwhtdXO3onLUOVCS+76sPNyEqNbne5v
	qpM98E/NBhrDUl9kXRh0ihZ14cqgra2sRZubSj1YaC5tF7hhx6zzHoappxRtswJFvDhYMkUnSH8tF
	CdiQHisZ3gdARRncRe83up+yEHOCkBSrGdh8UekEV1qXVjsTqaC/lwnyT8p1EebXzPlZYAOWthjf1
	2ltw+2XzEAutFJo3jElvScj+FFRD7ZeAGwFDu2PwsHJ89cKbFnW4kKGjK4i9mdPNLCs2D1ZDwboVw
	pl7aLx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRA5d-000000086Zd-1VFZ;
	Thu, 04 Dec 2025 14:13:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRA5a-000000086Yh-2Un9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 14:13:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47118259fd8so9857295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764857624; x=1765462424; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+d+kOXWZ77Pa79XMX8gLZVtaDKOXA1/iNRWjymG+eA=;
        b=M0xy9DqsW32OFPrkasFe5ucf9q/s1M/xI+JWtAY1A451QaM+C6wkaqTMrkMDcE/32F
         YGDEFSKHEG4f5MZpzp3kvXpo1QCkGjGM2Qr4JD35F5C4uGwosMP/mX+DCHo5ADph+Pas
         DRoxjvN411sV3pEzap1tEDkqngd7dt4bhkABwDu5B84qLlcjwLspZwZ+jT9jGarXFVWt
         sm256MrAoQ/u527UCADmWfj0ka73l7xYcqBydMJrZWvhql8lN5j2IyGL5wxlgVxXovVn
         +dpBy25bqvne8DkrIXRCqw0CAlC4layK6gIXLKZ2Yb+3FzT41Gr46SAUcT9imIeJwM4P
         p7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764857624; x=1765462424;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+d+kOXWZ77Pa79XMX8gLZVtaDKOXA1/iNRWjymG+eA=;
        b=FgiDB/TCMTycjllBpKU9xEB7avLMf+7hj99CJnPm8UMESC6Nn8j2LK8vakilnZ64eF
         ZxV0g0fIvz7Uyw9Ssr5hG+J9G4YDY36J98muNPD1oAtfhtn7lMu+1FYZeV2JqupTNSXo
         xM+KAq+TJmHP5zDB1zL5y1mg02uAysHgChr4QfBoUUHAH1BSF4PtVdo89A1pYe+FlJ7/
         p00qwG8EzLkUfOp1ks7dU1UITDFuKGaXJ76p09CrqFLj/s2CUefsMDLgPnvmUFwrwI6u
         jXtBJTFIQXBsOY3oNJoqgG9N7u6N4tpCnpnqfXml+k2RyFHagU7AP7eVY+B7dq0Vsuri
         p3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeSjd4RonELuQ/xCMEaQ8VHhsrsknyWgtNQwPmJtldgBMXqZAAhXCMwTq/VSIMs0l5Yua/Bjs6tfJvJAxxjHMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCjYkdBSAzDxrRq1+skp20B+htdHfPSYYE1+eQAqhuNIxhFY99
	JNcTiVsdVnYo0CVxF91pjiZTevEM+o3K9ivE1LSt2Qc6V4oKtQNAy5MQ
X-Gm-Gg: ASbGncu0yanTszOkwamHHvEJnX0Zg/6u/UJF7JtzFzS6Ao3hymvB5sHRLvKQa5bA2Tn
	xPMtePfTO8joala8gYApc8CjK8aaIPBFx2KP1IPPp7bD4VC1g/n3POlAGhI6bp5HuU626a7BnmZ
	Ev4EL7s3qXcc4UZG1G4zsjhtVz9b3iDyDCavoiI+9rIMwFV68h83gKprik78FFyevJgnffF5yh/
	VP10vzG+t6AGw8Qpo8aNjyC9yWr1JjGKSdk7nJIpSswHj/OZd6G5qFkwm9QK1/2vSYdeBg63AT0
	kqbcSD9i4mbVbBacRM8oYx87chA/uXNtYd+TLCfH8T4zY/x0tnSHToM536SEjuB3mKynsKISOqy
	2vTcXr5zebuL8KFKfa6wyP95vprtuVi88UFiInFt2OE0o9BgndJDnFPwfH3fk8xOV6iVs3s3ylz
	IKR8/baK9eU+ehbhPJig5OC27fKRHxUyRVFL2kT8Ecm1i/9Fptqltqu2bTN5WcndOucW8vX43YC
	yls5B3umA==
X-Google-Smtp-Source: AGHT+IHtYgz33VbUlNe7osl81HTRTx4C13vE9/CW5P0/J5lUDoT4fb4a8vSZ742vyf6Iomub3fxbbQ==
X-Received: by 2002:a05:6000:24ca:b0:429:d3a7:18bd with SMTP id ffacd0b85a97d-42f79875179mr3681891f8f.59.1764857624145;
        Thu, 04 Dec 2025 06:13:44 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeb38sm3386105f8f.12.2025.12.04.06.13.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Dec 2025 06:13:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH] arm64: dts: rockchip: add SPDIF audio to Beelink A1
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <f0df035f-3c3d-4649-9f48-3e8e2e69d17b@gmail.com>
Date: Thu, 4 Dec 2025 18:13:29 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5557C31E-3B1D-426C-BF9F-C417FF29E97C@gmail.com>
References: <20250828164300.3829488-1-christianshewitt@gmail.com>
 <66ae20b3-3316-4ec2-9c51-8414c053dc32@arm.com>
 <f0df035f-3c3d-4649-9f48-3e8e2e69d17b@gmail.com>
To: Alex Bee <knaerzche@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_061346_646550_11811340 
X-CRM114-Status: GOOD (  14.76  )
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

> On 4 Dec 2025, at 12:23=E2=80=AFam, Alex Bee <knaerzche@gmail.com> =
wrote:
>=20
> Hi Robin,
>=20
> Am 03.12.25 um 17:21 schrieb Robin Murphy:
>> [ Just noticed this... ]
>>=20
>> On 2025-08-28 5:43 pm, Christian Hewitt wrote:
>>> From: Alex Bee <knaerzche@gmail.com>
>>>=20
>>> Add the required nodes to enable SPDIF audio output on
>>> the Beelink A1 set-top-box.
>>=20
>> But the A1 doesn't have S/PDIF? Only HDMI plus a 3.5mm jack connected =
to the analog audio codec (and possibly the composite TV out) :/
>>=20
> Yeah, sorry - this patch wasn't supposed to be submitted upstream.

Apologies, this is my enthusiasm for trying to clear out the patch
collection LibreELEC has been hoarding by sending things upstream
on behalf of the original authors (and hoarders).

Would you like me to send a revert patch?

Christian

> Regards,
>=20
> Alex
>=20
>> Thanks,
>> Robin.
>>=20
>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>>> ---
>>>   arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 23 =
++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>=20
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts =
b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>> index f7c4578865c5..b276a29bdd85 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>> @@ -58,6 +58,24 @@ ir-receiver {
>>>           gpios =3D <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
>>>           linux,rc-map-name =3D "rc-beelink-gs1";
>>>       };
>>> +
>>> +    spdif_sound: spdif-sound {
>>> +        compatible =3D "simple-audio-card";
>>> +        simple-audio-card,name =3D "SPDIF";
>>> +
>>> +        simple-audio-card,cpu {
>>> +            sound-dai =3D <&spdif>;
>>> +        };
>>> +
>>> +        simple-audio-card,codec {
>>> +            sound-dai =3D <&spdif_dit>;
>>> +        };
>>> +    };
>>> +
>>> +    spdif_dit: spdif-dit {
>>> +        compatible =3D "linux,spdif-dit";
>>> +        #sound-dai-cells =3D <0>;
>>> +    };
>>>   };
>>>     &analog_sound {
>>> @@ -325,6 +343,11 @@ &sdmmc {
>>>       status =3D "okay";
>>>   };
>>>   +&spdif {
>>> +    pinctrl-0 =3D <&spdifm0_tx>;
>>> +    status =3D "okay";
>>> +};
>>> +
>>>   &tsadc {
>>>       rockchip,hw-tshut-mode =3D <0>;
>>>       rockchip,hw-tshut-polarity =3D <0>;


