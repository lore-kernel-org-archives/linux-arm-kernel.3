Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C006C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=; b=JhyAUMiT1PmqyukPJmuBnOxalI
	/eWD1ERHov/jAMf1+kF3a+FUWt6Uw7J/4Poo7/B1tZfklSxtk3FtRX5o5xwaNKohup+/OdRMGZpzz
	qIYM5TmJk0ytg+sLxDQNMubAvxcW8MBGluX/LKTQ6FKt3tmKCy4QUzDmEM12NAF2ZigsrVfNls4IJ
	uryq3ybfQVYy/JVy9ujhnoSaugQujEzrk9eP8eyv1LEl4P8cgEV9BfWe2+8Oax+oox1c74FWeo2TN
	MC43DI7NlyixuOTCsgSVkdZafD8ammhoTXXHYcUqOXRoO3AaCL28/SK1hqpI1gYw4PkJWutnK9tYN
	P20fMoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzwe-0000000BMEa-3bve;
	Thu, 20 Aug 2026 10:24:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzwc-0000000BME8-1abO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 10:24:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LEos2753052
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=; b=NlB8zap4bl1dTpi/
	b77sQXntHv1GfNurcpg1EXnyTgwpZQ+R78j2BoglrlZvcovg72q6QAhNZfrYzcqr
	GCwMe36xIWlsMUYFJg8JYGU7TK6ZgYfMV+pc0lL6XogJV6HWr0LEOLcfyjLsqv1m
	ZNq4SlEiH17wGWg3jha9yW8w706I3uJe4rCwJjbfD5Am7ydlP/iNJjbivrLwrwS+
	x9zOhcGIvabtlfi89CueWIKKke4cwPHsg46q73d9VcaLPyY/MSWxNOaUT6WI97fp
	1du9a25vtOEz36lozAdQyY+2xlVha4vci5E+Etk7h5hFpMtrrVUJvTbcfOsZ8jJD
	DQkAog==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498qbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 10:24:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487eb67173so3166114b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787221461; cv=none;
        d=google.com; s=arc-20260327;
        b=KlSUP60fZQy6qBbAXwa58mEyp0Oml3iBTT3Urhxc7PKPnp6z9QtqgVSsHHQi8QVxSy
         R7pubqcI45oi1IbRcN8ESu4H3oH1JZgsbjtMo9z1m+0UkjSY+SRHuc901tJxrUppY83x
         PaPq65+NCqnF2509RDlzaNWx/ghX7OUGi+cRu0OP2r9lS9T1bc9VQzFzeKp30Ctc79ld
         4Iy1YCRWhgShbie/rGVLOMwK3ZgSW7colJV/rCkS2kVrQZZgY8JjnClisbk5b5+itelE
         3+RJ/1Gd8i8GZJg3SKFL15ieUb6p+dmTWaI/zDQgmNrYTdytx1rd6Hy2lZfB7T4/nf0u
         Y5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        fh=YWkk4lTWxyqMwz40UXBDonYb0b9Uwgg9sG7k1k/tpPE=;
        b=FcgU1owsBX4CltMTLkdDOvM5DL6WS77/gcyG6I12lRolN0B/M3UbXM9E4T0mtonaFJ
         /3FhFLIqCjh6WIAzNt6L48RIij8RnMhfOsid1k0w5lfu2pF/niSXV4QIt70cQjJ8YBu7
         eygjAwraVmhVLAfof9HOSbn9YkAbDO2lE9ketypv55fc0oXdrGIqe3VGbdYBHUVo+eQW
         cm7gJ2OXwr6d0CX3Rk0wfTdhbpnz+fQyhU4lYwHex2eMeNKkAlDWNDEaT/yJX1yGtZXL
         MPa0lmRZ3fQB8nM7d/SCH9gvzecz1vIGXsbFN/wRg3dvDIEh4Luna1Ahd4DkGWXZjOt0
         6sbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221461; x=1787826261; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=P7CyRzV08rW3u/2qH+fngPIGSBG+kopoAo4dgp9ljVyGbL505W14g+4iV9bgjiSWG/
         uM56OzoOGktcwtGadQFQ9WT+tgENl5RJ6Ptav27ovCRwkSnx81drCAWmoFDCJFEvl1am
         Ia7l+8vDBkYLvtkFUUovicujmEEyu4yDKyFqECN5Pizs72D10DYWSw/fW0r4EJKW0dOJ
         evGNUP5lupNt22q1I+2gWd7u/QVzw7X7Io0SwQZtIV5dVvuwkLjVFqnxwtpJw51n7ffe
         dt/bhZ0pCZwYKkzP6ry7HMLYkQDfEkmDBbNgDJ2RUnuO0OFhfaa1++9aGHfLIoZ8nON5
         yvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221461; x=1787826261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ty5/YlOK6jhAeQysmUgT83beKPjDWgvudsEIa05/S58=;
        b=XbpNDpH2eDowFDcUz5k9I4yfBS3V3+4j8xPG52obkxxvZJQjNPrAFRQz7sm1yy8w+4
         wDNKRCOxSRevvFbA7K6EqyqdH6gPuRP5hNl4QMgXDOCHPRfsngSQjCNMhbcr0YqPh4Mk
         VyFWyt1qGxqFuyuk03HNZPvbaZ0uHsZpxdzEDMZLwphySk2ppQgbcuxlp8Yiixlvtbsd
         gpPzz+eDpEXiT1NrDxBRxCeA45C249jOFCZm1t8DxrLWIcTXIooM9Lenw9YZoZqwahzh
         UnVXdPeu804s53w7JXT1GcLFzfqBq86o37W/ToZ1D14RVr+aZ0k7jPDGa6PmBwNxMZNQ
         lYmw==
X-Forwarded-Encrypted: i=1; AHgh+RpLbVmSPLC7d4jGeuSP3trcThDqhtXZYKljwJnIyua5cxqeNSYGfote/7CAm7+M/eBNXAq0E9661Hd7A/qqHbtZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzkMRi2d48xOjaBHnL4pTDpaZrhxTMDY2CbYvYAS6fWjqJ5knF
	pMFQRiTCZ0KTnWragvVggyvgOOCPxj6obVpyVLVVwRP8vet81r2Fowd3i4jbQfeAWnDQdl4rBpE
	Pe97p9D2y2CTO4r7fO0jO/XMPAldpNOBuCeNY8V70nhATQjDZ+v9k7hXIKXz8dz9s5QLk6c5Jd6
	g+JmgSCzUsa6Gl85K25AqT3MXQTcT0Ue5ke/sg1Hila+N3rdYNaAjb
X-Gm-Gg: AR+sD13axAzPzT9R9CMKdM0Xd/jp8XQ1OPQvFWebnU4mh8Jo0uLe3zkk3y1E/ZzDhQo
	Kil93/Nc14Tyv6Bj3dufP29ia5IiGnxmkwUAmcKYBGQJgN05XLUEKYgWrD3IP9Wl4hup0G+zDdb
	HGdzgwfkw7MMXwLH9jAbtf7IUBBXWF1fNMBbHikfNk7tq8dYO2OGH7uj7B9A==
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-851d382e720mr19263273b3a.8.1787221461191;
        Thu, 20 Aug 2026 03:24:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2301:b0:847:7ffd:ce35 with SMTP id
 d2e1a72fcca58-851d382e720mr19263163b3a.8.1787221460718; Thu, 20 Aug 2026
 03:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
 <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com> <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
In-Reply-To: <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:24:09 +0200
X-Gm-Features: AcwNN1XagjqLsUfXCAJXyqu2taAnOsy7gMxOrYs8oiiblP73dGEaPVwCq6ztGis
Message-ID: <CAPx+jO-+hLsAdDC9Ep16cO52cA2c=xKeXvngkGqzoC0FyxXj+A@mail.gmail.com>
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfX2QqOTJ6pOMUL
 2HX1T1JYxRQUvjVmID7AmS5dRprxEFutb9JTx7RVaQtPUOOUfZ2dM4CoWASdy94VC9ZQR/fD0id
 TuhU0q4bsY/xXYLs53UQBEzGZLbVOx0=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86d5d5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-_xB5rzH_TN0feDXJEkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: jyURRwSbcin8Sl8HCJY8WPS79pWE71cU
X-Proofpoint-GUID: jyURRwSbcin8Sl8HCJY8WPS79pWE71cU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NiBTYWx0ZWRfX6tHLlVW/B+RN
 pzLepvfmdoRG1gbKa2YJfMLhziEcQ5JOSTw3ex0752qdLSkUWHkNUQbqX7JF8JxaumtjgOAglyg
 dPHG7nO4mui2IcF4UAfCMfr41UN5nhDzhFujnOpEiDaYuWDOI5taWzVP0yynD5sRKzBg5iSMh8A
 BsCANdkLGUOEX6HX60sTwmhg+cEPN9kEQDdrDHKa81nDlXfIGF46tEgu70ALbhZK2y0e0BaQQLv
 N6czeac0jH0vuxsoYzyukXXUTLehyluiZcvPUEIpzWt3bW0Hy4UBDJ3ABsBq02OAL1hJzmITIM4
 rVSSlLtISW4TJC384PkSNGwGB/tT+1ZpVdXcAnBUXK0wREHeLg3M9PULZ5J5G7ZDk2By3qPr9jl
 iUFfF7xsd0nqYHpFJh9W+mAJTmpdEckCSLyCOZK0BXDIRPbvR6kRX+5bKX6WdAGXLLRWprtMjgo
 aRRyugZXh4xlwPQmjGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_032422_422874_A996B557 
X-CRM114-Status: GOOD (  32.40  )
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

On Wed, Aug 19, 2026 at 3:30=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Jul 8, 2026 at 5:53=E2=80=AFPM Ulf Hansson <ulf.hansson@oss.qualc=
omm.com> wrote:
>
> > On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.or=
g> wrote:
> > >
> > > Add a DB8500 regulator driver for the VAPE and VSMPS2 compatibility n=
odes.
> > >
> > > Back the regulator enable state with the corresponding power domains.
> > >
> > > This is done for off-chip consumers: the corresponding voltage rails =
are
> > > routed out so they are used for powering different peripherals using
> > > these voltages as supplies.
> > >
> > > Assisted-by: Codex:gpt-5-5
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> (...)
> > > @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
> > >                                 // DB8500_REGULATOR_VAPE
> > >                                 db8500_vape_reg: db8500_vape {
> > >                                         regulator-always-on;
> > > +                                       power-domains =3D <&pm_domain=
s DOMAIN_VAPE>;
> >
> > Hmm, isn't this the other way around? The power-domains node should
> > have a regulator supply?
>
> They probably have that, but that is not what this is about,
> it's the other way around.
>
> > We may even consider to skip to model the regulator altogether and
> > make the power domain operate directly on the prcmu instead.
>
> That is what the series tries to do, as a whole. Sorry if that was unclea=
r...
>
> What we do in this patch is to deal with the fact that two of the power
> domains, when enabled, also turn on two external power rails outside
> of the SoC.
>
> Since external components such as I2C devices cannot really be
> claimed as "being inside a power domain" they take a regulator.

So with I2C devices you are not referring to the I2C controllers, right?

Are you saying that these external I2C devices consume the same
regulator as the power-domain DOMAIN_VAPE uses?

I thought these types of external devices in general use a different
voltage range. Moreover, do note that DOMAIN_VAPE also has
corresponding OPPs (performance states) that change the voltage level
based on the requested OPP. I am not sure an external I2C would be
able to cope with that.

>
> This is based on my understanding that power domains is an
> SoC-internal concept only, so there is a clear boundary if something
> outside of the SoC starts to use such an externalized power rail.
>
> All this regulator does is to make sure the corresponding power domain
> is enabled when the regulator is enabled.
>
> I will repost all the patches once v7.3-rc1 is out.
>
> Yours,
> Linus Walleij

Great! I really appreciate that you move this forward!

Kind regards
Uffe

