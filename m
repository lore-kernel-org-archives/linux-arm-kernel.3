Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADC9CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dETmxzysQAIIrfvzFS6NhiwZKV/rguUqMxZ2Lb2+BiA=; b=pAwIoigBJlI4vL5zxaSHLU1mUV
	99gngPDNfEjaI8qJ+QQMgAhm+N856oFgwNTFuxduFQ+QMoHZakSo7GEqjUwxHf2Z8puPuoapxprDe
	yN7NG9fMRIEGX+ZAoS21uP63AUAmOTztYNaELWDXYf7VZNe1z4f4y3c+31FblFW18Y8QWaGvnzihx
	e4ZccyYCcGEWIyT+75nmbbV/BEZo9NvrVQELFrzET8p0OCRM0+59jzhj+OWXJMtxpQtrR0wKNAV6/
	f1XXKYeshe9W8x9VriaQKGDe9Om0kp5+oGNICusQGuPyxADVk1c93QoWw4w5O6xyZ77ZSMdX+14Nj
	tIU2UW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof1a-0000000CuFB-2LtY;
	Wed, 20 Aug 2025 09:22:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeOb-0000000CmZB-07WC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:42:14 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so834046166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755679331; x=1756284131; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dETmxzysQAIIrfvzFS6NhiwZKV/rguUqMxZ2Lb2+BiA=;
        b=iqw48Xor885Kri9ZnMYZFwxLFJF7Ud1315Jc3dtcgMGAIDxdiOE+7Hy81dkUj0nyqQ
         4TI/jiTBLkz7ujwt6LwkCN/AHFbc8ukq3NMUYHSLhZEXUP2FmQfFaXNCmg15Y2rYu8s/
         MjELVCtDX5Ter8oJGBrm80H1gBVXex9Og5yf/XZX3Fej0m1YcYOlDbkuDaPnMnKrEGj6
         ouWk/nQqtbwiQHX0qr/pX6OyCRk9+ZH38yueMmFI+ZBewyDVI78V30rSvoM+JspKmUVF
         pZDXxMOIeXmkdL2fTW8eXmNHP8y4RgCuGrAqpoHSxK5rgGCKoAzXX6XrbUXSNxx7ShwG
         6qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679331; x=1756284131;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dETmxzysQAIIrfvzFS6NhiwZKV/rguUqMxZ2Lb2+BiA=;
        b=pRVDKXDnqF9GoVEJKJ8yxEaMXcuW/fwWDASp1R6OjWy0/OeVJf8Q50zFB2BcTZabQ8
         Tds+2afHAwtX/Qb5O6JamU0L1AcOd3xxb7/bUe3oSTQTBEvkq2tV4gIz+M7Rf12EwOKr
         053oX5a4kxFwADKoTbre5sqbj+3T+kT48Nm0A4RhUkh2uG1mrZr4fQiZvsFOglyEGGs2
         Dpt2IIZwyIZ3XyBaRoQdsrG4EwatwHLiaWQvIT/LJXqki5jPQUNQNo57PEyINk/2Bicz
         WBxGefghlKEpPM/4fA1M8FJtBR1a+BBkqb9wmINJ0JoVeY7cF2qPAYrvqf8HRwXyMvFa
         ZlVw==
X-Forwarded-Encrypted: i=1; AJvYcCUfjZUHAM6ucXUTxjrz22hbRxx1IXiIjWf/sgo9j9gKwD+k/BAXFsheaX99Vd+N55MuQnanKpUAqicbKnH+0Ah7@lists.infradead.org
X-Gm-Message-State: AOJu0YzLHW2qmCT+/eGK1ZfP04DUwrGSNu1XePCSzVn+2mei8/rj+dBK
	3kVTsD2mxW86FrgcZZ+EoHQoW6IWBevShVgBqwVJJlz+EYkaoyMt0UqNnZl/k6WTTmY=
X-Gm-Gg: ASbGncuOIs8S/btTBwgyxIwtjkBMuQ2EYmgRjKH2DIYhDw5yU4q7YBELrjkY0x9UMTE
	A/2xHWzHrFSGSy+WMgXuHOG0Vp9/TvrXuTGjbv1/dpi4HYBOmzwm7v87ojfisovjLbXE+DEpcyX
	7IOcq+iT4Q3g1Y7UrXHHpRHPxhCnpqE3XbEp76hZ4fPXxwBea/pGpILnDpvnFufutJPWA8JHAZ9
	MAHbnQCGdVKscIW446n4D90vhNJwdndmApjE3u/qHesPmSQIol+M6H/5icPEsrXA8w8nCR4V2Bu
	3x5cix4eWV8O63Glf2aQjmwFKMZmHdT19XiL51CnWkTEUF6M3cUw/hxnjdrZyWULaIfp2x4mcq+
	Yr/fXTx/fsjiCCv5eREaWC3ymMbwNN4e9DuOQ6kfYneD5nS4/WhSS7Qre/caJTmSpqLI=
X-Google-Smtp-Source: AGHT+IEac2OEaqE2OoGnweWa6iOptxoUoAiXM3h5Vw1WEpE7VDgBBgHTZqHGUTgnoBZuEdKM1TFNmg==
X-Received: by 2002:a17:907:9715:b0:ae3:6f35:36fe with SMTP id a640c23a62f3a-afdf01e915cmr146724366b.47.1755679330638;
        Wed, 20 Aug 2025 01:42:10 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478bf3sm138377366b.53.2025.08.20.01.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:42:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 10:42:09 +0200
Message-Id: <DC74DPI8WS81.17VCYVY34C2F9@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
 <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
 <55420d89-fcd4-4cb5-a918-d8bbe2a03d19@oss.qualcomm.com>
In-Reply-To: <55420d89-fcd4-4cb5-a918-d8bbe2a03d19@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_014213_085106_05C581A8 
X-CRM114-Status: GOOD (  30.28  )
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

Hi Konrad,

On Sat Aug 2, 2025 at 2:04 PM CEST, Konrad Dybcio wrote:
> On 7/29/25 8:49 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>>>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>>>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>>>>> Add a devicetree description for the Milos SoC, which is for example
>>>>>> Snapdragon 7s Gen 3 (SM7635).
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>> +
>>>>>> +		spmi_bus: spmi@c400000 {
>>>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>>>>
>>>>> There's two bus instances on this platform, check out the x1e binding
>>>>
>>>> Will do
>>>
>>> One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can'=
t
>>> reuse the existing PMIC dtsi files since they all reference &spmi_bus.
>>>
>>> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
>>> connected to anything so just adding the label spmi_bus on spmi_bus0
>>> would be fine.
>>>
>>> Can I add this to the device dts? Not going to be pretty though...
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index d12eaa585b31..69605c9ed344 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -11,6 +11,9 @@
>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>  #include "milos.dtsi"
>>> +
>>> +spmi_bus: &spmi_bus0 {};
>>> +
>>>  #include "pm7550.dtsi"
>>>  #include "pm8550vs.dtsi"
>>>  #include "pmiv0104.dtsi" /* PMIV0108 */
>>>
>>> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
>>> other designs than SM7635 recommend using spmi_bus1 for some stuff.
>>>
>>> But I guess longer term we'd need to figure out a solution to this, how
>>> to place a PMIC on a given SPMI bus, if reference designs start to
>>> recommend putting different PMIC on the separate busses.
>>=20
>> Any feedback on this regarding the spmi_bus label?
>
> I had an offline chat with Bjorn and we only came up with janky
> solutions :)
>
> What you propose works well if the PMICs are all on bus0, which is
> not the case for the newest platforms. If some instances are on bus0
> and others are on bus1, things get ugly really quick and we're going
> to drown in #ifdefs.
>
>
> An alternative that I've seen downstream is to define PMIC nodes in
> the root of a dtsi file (not in the root of DT, i.e. NOT under / { })
> and do the following:
>
> &spmi_busN {
> 	#include "pmABCDX.dtsi"
> };
>
> Which is "okay", but has the visible downside of having to define the
> temp alarm thermal zone in each board's DT separately (and doing
> mid-file includes which is.. fine I guess, but also something we avoided
> upstream for the longest time)
>
>
> Both are less than ideal when it comes to altering the SID under
> "interrupts", fixing that would help immensely. We were hoping to
> leverage something like Johan's work on drivers/mfd/qcom-pm8008.c,
> but that seems like a longer term project.
>
> Please voice your opinions

Since nobody else jumped in, how can we continue?

One janky solution in my mind is somewhat similar to the PMxxxx_SID
defines, doing something like "#define PM7550_SPMI spmi_bus0" and then
using "&PM7550_SPMI {}" in the dtsi. I didn't try it so not sure that
actually works but something like this should I imagine.

But fortunately my Milos device doesn't have the problem that it
actually uses both SPMI busses for different PMICs, so similar to other
SoCs that already have two SPMI busses, I could somewhat ignore the
problem and let someone else figure out how to actually place PMICs on
spmi_bus0 and spmi_bus1 if they have such a hardware.

Regards
Luca

>
> Konrad


