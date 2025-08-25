Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF7BCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG91uI45uUKeGliVzdh96+GHkDD0Of8ZnOcLCRVdh4U=; b=qPgXB28/Y/eJjXDfb0kBPPVbvR
	yypxSbSAZr8McKVQr2sLEx/qq5Whm9LM4kvzqovyveOh8Nlmku1ey+3PHooFlvA5hOyOCEUr1y49e
	bWndfhZYY0i6Z4KEi2u6/6O3+YbumhZ1SAVYWqx6RnAAdRMS/rX1dkYJR4yF4oa/K6HcihFiYH7Xl
	4dGeG8y2B6i3sf06DVIHj85zFITIDGdamxX5LPzJHQVI+MvMkwEnq2gkhuNKpo7BPGdQ5C3m9ykSQ
	hOIqI+FB4G8sj4eZa9cTWh8bMx3t67twE7WgHD5/onMKbeMKeATx+ysFtKoC9M2TjNcOV3royy9ue
	OLPyZWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYD-00000009Anb-3EQj;
	Mon, 25 Aug 2025 19:08:17 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaFQ-00000008iBD-2VPQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 16:40:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61c7942597fso1578469a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1756140043; x=1756744843; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG91uI45uUKeGliVzdh96+GHkDD0Of8ZnOcLCRVdh4U=;
        b=F+5XymTYvdB1nxwb36KtnaI+QHXfFdJvEs6BaU07/CVfwkHtrIOpxgRW7zcENWmH5H
         7RBkKZZBL4HxCl6O8ivtRPGhDO8FCOAe8WeBJaBfX0oaCoKirm55CN+5s4HvIHIdVShb
         Jii0KoL9FjEdFbAILKQ7m5zqDTQyBGtkC9DI1Jcp6Fk/ZaGAihIz6hJVcoKBZlAQDXlY
         1xzgc09iP4NKLbpLvUcpIRCf83SGlec282SrNoKFgymC0vfBVM6613f9auHpu6X0tqcu
         W0R6db2TJfXxIUEA4/WZIMFLeTZSm4gQ2U/5Fkf1GgxT/3Zl5nRBeHGWxzdsYx4RhQig
         Ws+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756140043; x=1756744843;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FG91uI45uUKeGliVzdh96+GHkDD0Of8ZnOcLCRVdh4U=;
        b=I7aw0u0cjSxIXf/r9r6ptG1sfbo9wOmytYpN4XVuohOrdbLcAR70XV9ogtMSwgoqXf
         +/3bzoogi+TezDoP5zG9AzA/iSggP4FXyrBSXdkfGL6wiJkYPExuCftx/VhM43dOUPUt
         3tEeo2t5wGnZwpLanndT8bkJRXUz/BqOPsKpdpI/7fd3P0fsawalwUj9+a1k/UqL0KTS
         Qf3vc9dYOdMUwzm0GQ6PCWTMHhT3twT604pClMMg8XYsjxmIDUNE5AQ334S8P5Q1Iq85
         zFv2HhGf1YediQlyg/UL6is9oGEtHb26zpiyTttbMEKqBy2pOUapFPd259FSMYeanOkw
         MSvw==
X-Forwarded-Encrypted: i=1; AJvYcCVmh3exz4L7R1pdNRwLc7LNRB0v+sDCmU47T4Lgfr5GOsmJPs8dH6yC/y3D4hfGdzIuwHd+bIRap77CAVGrfAq9@lists.infradead.org
X-Gm-Message-State: AOJu0YxBscQ1Ns8RZrBHIWl2cr4V6h0oe2BOiJsKuDKgDzX/SGPp6ZQV
	ERCe7BxkW+7BJhqWLCamE1EA5pyjZJiDKCV93SsvAeZLV09s5hiqecJxecQuFnpU0B0=
X-Gm-Gg: ASbGnctfJ63RgDAVlN/AGtx4tgnJCLyDqcsartd+vWUEZuZytl93MGgCs1nLCEXE22y
	SKd0e5yZ5cjWir2adP7iLqTT9IIG5EJ4vIhb0+sB2Uy5vydim80ElrySwAhOxeZuvOpyA40CyYc
	EaB3kBDHCt9UMZTFOBoc4WxN6qSdDyFK4tVC5qA+SYuddttB2zNfVB8xKUoED6RDSOQqWX70vNI
	YfIi2fdgBM8dGPM4PQ/O2kR82A0RD/R2ZPjb6fyq036ae9YCftQCNUqiUs3IHsXDnv9VSd5sgRq
	BCyFndC3C3C6dD2/H18NnUkEdS9Ww5+Evac/T4cLaZMNb16KRX+CTZbCx/f30p4ob60tQu3DVtR
	wJwbh0+mG5PGhb9clpZc7FS/q67eHN1zhMAqredwN0UDkNqMl7Etv2MdbmtJVqWlJZGomcZwwkk
	vjlBY=
X-Google-Smtp-Source: AGHT+IFV4UU2TtRx1l7OIqQ1JFPaW34gENjDAO9Ve5xixYInhHmsQvVFhIsO1C/Qynf9MIpQCOZJoA==
X-Received: by 2002:a17:907:d8a:b0:afe:6648:a243 with SMTP id a640c23a62f3a-afe9cb1b5e3mr24664366b.3.1756140042823;
        Mon, 25 Aug 2025 09:40:42 -0700 (PDT)
Received: from localhost (83-97-14-181.biz.kpn.net. [83.97.14.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe9c908431sm11361366b.92.2025.08.25.09.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 09:40:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 18:40:41 +0200
Message-Id: <DCBNOTQVTDWB.EH08W10NACXL@fairphone.com>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
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
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
 <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
 <55420d89-fcd4-4cb5-a918-d8bbe2a03d19@oss.qualcomm.com>
 <DC74DPI8WS81.17VCYVY34C2F9@fairphone.com>
 <2hv4yuc7rgtglihc2um2lr5ix4dfqxd4abb2bqb445zkhpjpsi@rozikfwrdtlk>
 <DCBMOZQ7BFI9.2B3A3PEZ0DTYD@fairphone.com>
 <2bk7s43nrkmhhgsqq65mxhbmrapyjejyjugnae7wfbttqjmtbf@dk2fe64qrmwx>
In-Reply-To: <2bk7s43nrkmhhgsqq65mxhbmrapyjejyjugnae7wfbttqjmtbf@dk2fe64qrmwx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_094044_662289_CCD330DD 
X-CRM114-Status: GOOD (  42.37  )
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

On Mon Aug 25, 2025 at 6:36 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 05:53:53PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Wed Aug 20, 2025 at 1:52 PM CEST, Dmitry Baryshkov wrote:
>> > On Wed, Aug 20, 2025 at 10:42:09AM +0200, Luca Weiss wrote:
>> >> Hi Konrad,
>> >>=20
>> >> On Sat Aug 2, 2025 at 2:04 PM CEST, Konrad Dybcio wrote:
>> >> > On 7/29/25 8:49 AM, Luca Weiss wrote:
>> >> >> Hi Konrad,
>> >> >>=20
>> >> >> On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
>> >> >>> Hi Konrad,
>> >> >>>
>> >> >>> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>> >> >>>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>> >> >>>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>> >> >>>>>> Add a devicetree description for the Milos SoC, which is for e=
xample
>> >> >>>>>> Snapdragon 7s Gen 3 (SM7635).
>> >> >>>>>>
>> >> >>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >> >>>>>> ---
>> >> >>>>>
>> >> >>>>> [...]
>> >> >>>>>> +
>> >> >>>>>> +		spmi_bus: spmi@c400000 {
>> >> >>>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>> >> >>>>>
>> >> >>>>> There's two bus instances on this platform, check out the x1e b=
inding
>> >> >>>>
>> >> >>>> Will do
>> >> >>>
>> >> >>> One problem: If we make the labels spmi_bus0 and spmi_bus1 then w=
e can't
>> >> >>> reuse the existing PMIC dtsi files since they all reference &spmi=
_bus.
>> >> >>>
>> >> >>> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* i=
s not
>> >> >>> connected to anything so just adding the label spmi_bus on spmi_b=
us0
>> >> >>> would be fine.
>> >> >>>
>> >> >>> Can I add this to the device dts? Not going to be pretty though..=
.
>> >> >>>
>> >> >>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/a=
rch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >> >>> index d12eaa585b31..69605c9ed344 100644
>> >> >>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >> >>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> >> >>> @@ -11,6 +11,9 @@
>> >> >>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> >> >>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> >> >>>  #include "milos.dtsi"
>> >> >>> +
>> >> >>> +spmi_bus: &spmi_bus0 {};
>> >> >>> +
>> >> >>>  #include "pm7550.dtsi"
>> >> >>>  #include "pm8550vs.dtsi"
>> >> >>>  #include "pmiv0104.dtsi" /* PMIV0108 */
>> >> >>>
>> >> >>> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not =
sure
>> >> >>> other designs than SM7635 recommend using spmi_bus1 for some stuf=
f.
>> >> >>>
>> >> >>> But I guess longer term we'd need to figure out a solution to thi=
s, how
>> >> >>> to place a PMIC on a given SPMI bus, if reference designs start t=
o
>> >> >>> recommend putting different PMIC on the separate busses.
>> >> >>=20
>> >> >> Any feedback on this regarding the spmi_bus label?
>> >> >
>> >> > I had an offline chat with Bjorn and we only came up with janky
>> >> > solutions :)
>> >> >
>> >> > What you propose works well if the PMICs are all on bus0, which is
>> >> > not the case for the newest platforms. If some instances are on bus=
0
>> >> > and others are on bus1, things get ugly really quick and we're goin=
g
>> >> > to drown in #ifdefs.
>> >> >
>> >> >
>> >> > An alternative that I've seen downstream is to define PMIC nodes in
>> >> > the root of a dtsi file (not in the root of DT, i.e. NOT under / { =
})
>> >> > and do the following:
>> >> >
>> >> > &spmi_busN {
>> >> > 	#include "pmABCDX.dtsi"
>> >> > };
>> >> >
>> >> > Which is "okay", but has the visible downside of having to define t=
he
>> >> > temp alarm thermal zone in each board's DT separately (and doing
>> >> > mid-file includes which is.. fine I guess, but also something we av=
oided
>> >> > upstream for the longest time)
>> >> >
>> >> >
>> >> > Both are less than ideal when it comes to altering the SID under
>> >> > "interrupts", fixing that would help immensely. We were hoping to
>> >> > leverage something like Johan's work on drivers/mfd/qcom-pm8008.c,
>> >> > but that seems like a longer term project.
>> >> >
>> >> > Please voice your opinions
>> >>=20
>> >> Since nobody else jumped in, how can we continue?
>> >>=20
>> >> One janky solution in my mind is somewhat similar to the PMxxxx_SID
>> >> defines, doing something like "#define PM7550_SPMI spmi_bus0" and the=
n
>> >> using "&PM7550_SPMI {}" in the dtsi. I didn't try it so not sure that
>> >> actually works but something like this should I imagine.
>> >>=20
>> >> But fortunately my Milos device doesn't have the problem that it
>> >> actually uses both SPMI busses for different PMICs, so similar to oth=
er
>> >> SoCs that already have two SPMI busses, I could somewhat ignore the
>> >> problem and let someone else figure out how to actually place PMICs o=
n
>> >> spmi_bus0 and spmi_bus1 if they have such a hardware.
>> >
>> > I'd say, ignore it for now.
>>=20
>> You mean ignoring that there's a second SPMI bus on this SoC, and just
>> modelling one with the label "spmi_bus"? Or something else?
>>=20
>>=20
>> I have also actually tried out the C define solution that I was writing
>> about in my previous email and this is actually working, see diff below.
>> In my opinion it just expands on what we have with the SID defines, so
>> shouldn't be tooo unacceptable :)
>
> I think we tried previously using C preprocessor to rework SID handling
> and it wasn't accepted by DT maintainers.

I don't know anything about that, but yeah...

>
> I'd say, ignore the second bus for now, unless it gets actually used for
> major PMICs.

The only 'problem' with this is once we do figure out a solution, the
SoC bindings will change, so both dt-bindings and dtsi needs to be
updated. But that's the case also for sm8550 and friends that currently
ignore the second SPMI bus upstream.

On FP6 again, it's definitely not a problem since everything's just on
the first SPMI bus anyways.

So then I'll revert the change to compatible =3D "qcom,milos-spmi-pmic-arb"=
, "qcom,x1e80100-spmi-pmic-arb";
plus associated subnodes for the next revision.

Regards
Luca

