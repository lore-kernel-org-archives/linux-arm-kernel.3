Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4627FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=; b=2NnY9zGO7K4bqJOat4k5BbpYCs
	da7XpW8c2q+NY9pPqOy927fiDnLuIC7/UYRE10KORgIDZ27mg+0ug/Sk4V5YP0pA4hwhmeAhDKdzh
	aRk3Ov1KGKf8RHE90aRbJYeP4RjGf0wmQhOSe2iuDIgdcYDzWPaRijDVnjzpCvp9pe4w7MhNCdDWj
	20l5+mO5curkX7d9q6ljMdVbR6dUQlobga1MCtKAKXJ8w/HpY/o/VcbMEcP/uHYvDYnpXakYK/Y5W
	RLkIOq0UTtd2qopKUeZ0dZs6GAt1+bgWCwXJtg+OS7iUIMH6a5bWqsaZ82Uo397r7/Bk/7Bc8rNCv
	fLYbrsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugeEH-0000000G42S-0NFz;
	Tue, 29 Jul 2025 06:54:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uge9q-0000000G3Jo-33Uy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 06:49:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61521cd7be2so2906338a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 23:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753771792; x=1754376592; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=pVrrSveLdmVjPgZudB8pJBZQaT4WCho9rJDvw+/G4fKX+xydtrQHGxTtxM7vSyg5tW
         jCXKvt4iddFGb/VV4QPOUdvobmikXLJJ4w0juBF2v5wtXbSrKr/Vd5/eZN8iC1sVSA5p
         HJGeEDez9B5XUJ77VCmF/clGmJa9Oq4xp0smFcACrWESWiWPY6QnWUITKFNU6yO/2izQ
         JvySL4MyKNB5jGRXF+Sn5Rq88T/C/1cVEr9bwSMB0SNqy1d10EN48bs//1dNWp7IyzFU
         OXWFQRBeisT0D0b0+FdJ5F70W9BxWooNJqMz4hO1wVs21mYiVSoPHJwfnuaJDXyOBAUY
         g8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771792; x=1754376592;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=sw80L5GjDlQej7qQo7aJ5GTTQe/trkxk/DAvgfS9kK5DIGOHxOLbSSNXE8XEsiVDYw
         ll7PkaEwXbR5GsVyYzxFMkw50c93WEzNBJmjxsU1vDoSo26DPUMOUy7LHHJZMQMZskwz
         d8XMORMn9clw+wacUjkqJeU8YRqzmwwCvEu8H5AV7NVX3okXAaoXJhk4osOb19vESi2T
         V2yaGmSqfDes+iVeH/XdQTAt08ScQvJXXpJD3mYvVfO2nh21IiAu3hzGKbpGehBliJun
         WSFtzYuxSsr61sVJP1QEpJJIzZfBfBjqrFTMm7KTEt2e1mXnp/+Ow3KVm4eygzFULYZ2
         B1qA==
X-Forwarded-Encrypted: i=1; AJvYcCX27JVALTWYHve6cCL7UUkneWWzq9RPDwRRmVSPqj/WhDMDyNnGZtNVf/ReSnnKIWs6ZZO5ideFUP0D15zlTKqa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Ylswm5KtpF9ADcr1hosuIFyj8hxA3lJwyLJeNzLNP2zqli6g
	p7Q1xAni0F84gEyBrhE374ZDv4R5gN3tj7GQ1+2NmyK2EdSumdl1J4R+pHwEi3NeO2c=
X-Gm-Gg: ASbGncvdmy/JMxP1hlhIX/cHVUOcOz10EmIl6+HYx7zty78Z58IfJbrAVnums+PCC+O
	piPm16OkZcZdzs1dp4QWeJsT82MCqjbN+EAGnV0h5d6t8N4sy/tpMKW5spzpTJJjs3AKiFdKp8J
	Nndp9Eki6zBmYyrnNuDptA6daPybMrf64j55XYu4CP0J8SlTIPU0p728dqdywBWIfOK2c/hLS4/
	XSL5qqbYWTYqTBwvcj45GC/1+kejpQBCY6OVLVftzewoEWperpsXkhFmivVLWDw/deS5Qqaqry+
	6QffrkQ/4sy74THJn+jv96kQ6h1A6Q3TC468D16u2F4sDeGhpk+WgQ2TCAXK7xseYrIFqgzA0zO
	/1G/9HxACAGSG5mss0+RwGS+Ybthjm+tki3UtHo9dPhzXXfD9SKid0AfaeAtc2rlu/bk=
X-Google-Smtp-Source: AGHT+IFY1cXRHhDZKmmaOPFoMzRlis7auiB0SY6wze0NFezD/noiXwvsAjKX3xVSDeubNvW/ghlrqg==
X-Received: by 2002:a17:907:868c:b0:ae0:da16:f550 with SMTP id a640c23a62f3a-af619d062b6mr1776275666b.49.1753771792232;
        Mon, 28 Jul 2025 23:49:52 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600b1sm546209366b.7.2025.07.28.23.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:49:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 08:49:50 +0200
Message-Id: <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Will Deacon" <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Robert Marko" <robimarko@gmail.com>, "Das
 Srinagesh" <quic_gurus@quicinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>, "Amit
 Kucheria" <amitk@kernel.org>, "Thara Gopinath" <thara.gopinath@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
In-Reply-To: <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_234954_787541_75F5B3DD 
X-CRM114-Status: GOOD (  22.29  )
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

On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>>> Add a devicetree description for the Milos SoC, which is for example
>>>> Snapdragon 7s Gen 3 (SM7635).
>>>>=20
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>
>>> [...]
>>>> +
>>>> +		spmi_bus: spmi@c400000 {
>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>>
>>> There's two bus instances on this platform, check out the x1e binding
>>
>> Will do
>
> One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can't
> reuse the existing PMIC dtsi files since they all reference &spmi_bus.
>
> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
> connected to anything so just adding the label spmi_bus on spmi_bus0
> would be fine.
>
> Can I add this to the device dts? Not going to be pretty though...
>
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index d12eaa585b31..69605c9ed344 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -11,6 +11,9 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "milos.dtsi"
> +
> +spmi_bus: &spmi_bus0 {};
> +
>  #include "pm7550.dtsi"
>  #include "pm8550vs.dtsi"
>  #include "pmiv0104.dtsi" /* PMIV0108 */
>
> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
> other designs than SM7635 recommend using spmi_bus1 for some stuff.
>
> But I guess longer term we'd need to figure out a solution to this, how
> to place a PMIC on a given SPMI bus, if reference designs start to
> recommend putting different PMIC on the separate busses.

Any feedback on this regarding the spmi_bus label?

Regards
Luca

>
> Regards
> Luca


