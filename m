Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACCCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEKn7bCKtQ4DC3+ZJIGn7pT8WXFtiTvd9gJWSwXEX6s=; b=DfS73IkxfimoEQudpiQ8jxNQxk
	wa8aPst4bhKkd8oaitlLe9jq0e1L3eukOq8Qa0FtZVGzSK5BDZmqV7KGqehpbLXb1+xOXNKEGjnge
	t6Onaw1Z2O3E++CBaxZI5mGftLT/NT5oZ47ag6YV//b3c5I2lQBZ1MvAzek+cjGTCSMbHHnvUr/0+
	WVJnM9aZWF2WFPLJ3O3EovH/e0EYEtXte/ZPCa1aeI1vQpYGn3VSc+FXdVx6RAdI+muf/YySaQtaz
	42LX37ULK84MbLrM7rM2b0hP0A1l4T0uO8sv4zPNs5SJ9KvH57qd6CtNCLmI6mTUnl2fWiTt1NEqt
	xZFMXXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhR8e-00000003SYI-2u4f;
	Thu, 31 Jul 2025 11:07:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhR64-00000003SIU-38Yp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 11:05:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so3016875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753959915; x=1754564715; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VEKn7bCKtQ4DC3+ZJIGn7pT8WXFtiTvd9gJWSwXEX6s=;
        b=w6H/xKLz3m5OB//Hirja+KNaKZwdx4zKA5t7WyxzMzzfmuZ4avcBPKhghqPNwdqIZw
         8mpilRKlOBHQn2TAYi74qQwNI4M2wahK+O3sjbsFx2OMFgZ+Ma3YHDzz6chvkNszATpn
         hOiXFp8fuSOhgQ+cwVH0ekbAY9TIT8XpbfkWjBhVdhbujQkKFbCfhWiYP2gus8WiDtQD
         JSIcB7kppQOwDWpCRdk2hki+ISyd1JmIgWX9yd0VJzAkbsC0Orsj6nqhD2kYYL539vJb
         aLBq6cJW2OsoGwbiG3za2tNXaRsdeB2f8WHPfkwKHEY9Gk6jZ0uk0Q7Mj0EBHN9Yhzr/
         tcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753959915; x=1754564715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEKn7bCKtQ4DC3+ZJIGn7pT8WXFtiTvd9gJWSwXEX6s=;
        b=wpJ4js2vnI4fk7M+Ii06yiNj2a24G8gM2SfEe5PAYyXY3BqNQFPhq5IQhy31jCZdNn
         junwj9/IRSmdQb71EJeyZWoKCtPqZ+qSkbYegvHQGUvvbFq5M5cwRERyW1iNNUVbEG0R
         M4+fZjhdDnwVDgQY+XDk+xtISl33gcKo2Av+RFJyIJ1kJggRmbla7Aa5MBspOAVQPF08
         o7UlEPGeEalG3IpcMmzW2itQKimDO07+fcH7wY0jMNguKODrc76oyiIFkmXMysbkdvWT
         nOjZN92K6mVvFNpRjMEYmRfmQMLmpPRl0e8OdQc0zMpdTCS3ldEg9JxWmy7puExLJZjr
         lkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXINQqUcY6YunMcXErrDqn70R3f6MYrxHKbiJYZkJJ3VWmXdz3UzkUo9NztiG7So/EzwCHajF0nUuuDMt3/D5a@lists.infradead.org
X-Gm-Message-State: AOJu0YyqJtDnWrsCojQkNnvkOCAjUavrfBlK5aUkaSQ8U3pulIIoC9Bb
	RD4h/XPmDh9U9yAciGFkZmuUTZb5tcjvPL0yIBoPD0cUv9KF4Wxl7D58bdI/A9NSgWM=
X-Gm-Gg: ASbGncuBqpc4zCwg55HthRslMYocDwGlys8PPNHf7qBij4iqxA5ZqDa4pKcGlTSxoqi
	rUu0LvmNf7dDtn+toJKPKJriGJzkKb+Xk2EopYYqV6R5AxzJvOm8/0LW3T8AxYzHLgclApaahmE
	NcCkI2t0k3DxYqROkNdBN3IfnIVn8Ktb43f/MLE4QOdDLmXB20i311UnwmFLvGNV4P/Fs+q8jZg
	fmwyNvrPlIsJTvKIaULfo1WFZ4QV/Fzmonv+gyYdUbZ5yZqL2Qmko9G4+EeIy9qo++L3C2h3rEf
	FQKCCNOdTUsB+dfc3Fobgdtn7cCxFipHHcfnEOcAI3nHaiPIKl4M5w5tfoznf9BY7ULqR1DaWzZ
	XfnQgl4daYowVDm58FaHK8tUm/g==
X-Google-Smtp-Source: AGHT+IE2uAVTLlLGsEyuKRwFnRFU/FdmGqD5jafe8UhDC8Cs0NgSXpOAHHVQxxk7a76FdVpc+nYZfA==
X-Received: by 2002:a05:600c:1d25:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-4589a700e05mr55899935e9.14.1753959915171;
        Thu, 31 Jul 2025 04:05:15 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edfcdc3sm23160775e9.12.2025.07.31.04.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 04:05:14 -0700 (PDT)
Message-ID: <63d090988d04fa81231c984771a563c55daf1bd9.camel@linaro.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Shivendra Pratap	
 <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
 Sebastian Reichel	 <sre@kernel.org>, Rob Herring <robh@kernel.org>, Sudeep
 Holla	 <sudeep.holla@arm.com>, Souvik Chakravarty
 <Souvik.Chakravarty@arm.com>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Yan	 <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Florian
 Fainelli	 <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha
	 <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
 Srinivas Kandagatla
	 <srini@kernel.org>
Date: Thu, 31 Jul 2025 12:05:13 +0100
In-Reply-To: <592902f1-549f-47c5-9ef4-b5c7ef2c9a47@app.fastmail.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
	 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
	 <b45b157593f1865a402f4098cdeafc298a294c6d.camel@linaro.org>
	 <b92c164f-c6df-a2c0-1416-67652a01b179@oss.qualcomm.com>
	 <34c52c88fd8fcbf68c453c1e94e4cd6294becff1.camel@linaro.org>
	 <592902f1-549f-47c5-9ef4-b5c7ef2c9a47@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_040516_801518_D666E202 
X-CRM114-Status: GOOD (  27.78  )
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

On Wed, 2025-07-30 at 19:31 +0200, Arnd Bergmann wrote:
> On Wed, Jul 30, 2025, at 17:23, Andr=C3=A9 Draszik wrote:
> > On Wed, 2025-07-30 at 18:33 +0530, Shivendra Pratap wrote:
> > > On 7/30/2025 2:14 PM, Andr=C3=A9 Draszik wrote:
>=20
> > > 1. For this, both commands will be defined in the psci->reboot-mode D=
T Node with the arguments that
> > > =C2=A0=C2=A0 are defined and supported by the firmware.
> > > 2. Further, such requirement will now be taken care by the underlying=
 firmware that supports
> > > =C2=A0=C2=A0 PSCI vendor-specific reset. When we call into firmware w=
ith vendor specific reset arguments,
> > > =C2=A0=C2=A0 firmware will take care of the defined HW writes and war=
m/cold reset as per the mapping of the
> > > =C2=A0=C2=A0 defined arguments. Firmware and the Linux kernel here ar=
e in agreement for executing the
> > > =C2=A0=C2=A0 vendor-specific resets.
> >=20
> > So that means
> >=20
> > =C2=A0=C2=A0=C2=A0 echo warm > /sys/kernel/reboot/mode
> > =C2=A0=C2=A0=C2=A0 reboot bootloader
> >=20
> > and
> >=20
> > =C2=A0=C2=A0=C2=A0 echo cold > /sys/kernel/reboot/mode
> > =C2=A0=C2=A0=C2=A0 reboot bootloader
> >=20
> > can not be distinguished.
> >=20
> > The firmware can not know whether or not cold or warm reboot was
> > requested in this case by the user.
>=20
> My feeling is that this is fine: the /sys/kernel/reboot/mode
> interface is not really used on anything other than 32-bit
> arm and x86 machines, and the way it is specific as
> cold/warm/hard/soft/gpio is not that useful.

Currently, reboot_mode as such is also used by gs101 and later, we do
distinguish between the reboot_modes (cold/hard and warm/soft), although
generally not via sysfs indeed. And yes, gpio is a strangely specific
one.

I don't have insight into newer SoCs / board designs in that family,
but my understanding is that newer SoCs use PSCI for reboot as well
and I do believe being able to do cold reboot by default and warm
reboot in some cases (crash handling in particular) to still be a
valid use-case.

> I think for the purpose of the new code here, we should talk
> about reboot "commands" instead of "modes" to avoid confusing
> between the global "enum reboot_mode" variable and the
> firmware interface for reboot modes as listed in DT.

+1 It should really have been added as reboot command or reboot target
in the first place.

A.

