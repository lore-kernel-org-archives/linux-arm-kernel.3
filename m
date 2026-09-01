Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF1FC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=rKYIeO4s/9ttkEis5sRu9/ROhH
	4b0Gl3Nz8e/VDwPTgw5COr9A9E6PclUPbapg3ZqwtRROtpCddR/acSd7EqGGEYkQfNPyFePYTNXte
	MxzH2n8fHXmdvEvSugspimxc6pcxZDrdvUXtCbrxGZ8b8SjHyzquqJjvXGXIQB6IpHi9U/O2LsZdi
	OOJAe/rkAHx1KxD5GHzD+gz9p0vCZv/myxKkctqldbaV0q+x7uAxDL4DHqDh0VjmsQl42f969nR7P
	qeoCo9ZQhHy6icTaS/3oqap+Oo06IP840cKXGhjfSUutk91wcoGwuK15Z7Wc0gShjmruhab2K6cnE
	UFZVs/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Llh-0000000BYW7-1uyV;
	Tue, 01 Sep 2026 10:31:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Llf-0000000BYVJ-0OLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:31:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJY972323262
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 10:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=L24pVZ/ZqR3UqxGK
	/67Ss2CEWxRkdLC3ayiyFTGUoXWpcWN4OwFx0jrQtRXWn1FW9W5QfwLgb8KTD0k9
	VXA3inANCmxJRdNG1TdFzjqDC2lkfvvladRHjVG4IrE+z65E9aAnsEQTGw71IFRt
	Cth5Kl1JLNSIKsmyJW5tOWNTFgYA2eaAG7rmiTDyTpYah40uhNhRnI9nNlIapDXx
	tgGkDMaYbMwGfILTDIdpdgjsacyyIgftl8+InQ7uxVvbYahckUBUSTutJog97nUF
	ICuTYp4BAjDzqlVCXHjSMsyWarzJJVoGX2cpKxi1M91rxA81h4lNdrgCFXIrEQUf
	kNHixg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9vmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 10:30:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6527052a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 03:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258659; cv=none;
        d=google.com; s=arc-20260327;
        b=GUy5zb8lSM3UzQdvEboOoqxkbSMio6/nO0eB3QvM9HL8H6u+ju66Z0Beto5bS18H53
         CPP2yWEgekcbVkRCvOvLdTMno2a7T5/CgiaQrFO8qnobskSUO0oPW34b9fwNfkNubRVR
         eOk/QY+C/2kWsdxCjtz+/CgWKui4mDSH3hFvQR43mYYsMgFWDwEwlq1/ctWe/A0pig4t
         RBRyxWwo7tbvpipgsc9DFbzyHrJAtLgffN4BvadGI7MZnv4zQMvM5OWsw7IiDyC7hMo6
         vbw9RK0hWY41MV1DJcXhviRog2fhsE9kIqx97kqnN29L0JZWGD8X7dnzm8BdztNLHIE5
         zTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        fh=HUq1dDXFVSYaIBQeb+TCAafCfdGRJtrfTZK5kEm1Avs=;
        b=HwEAZg2RKJugubAaljCPqIn6gqliQiw334S/4x5Nyt8Ff/lSDLjx8xRwiYG7mJMa+v
         9TqbKoaKB8fwwv2hZUb+F1CJGabuLtGBS4EUEdlyXVmzMzaKdF4ZexpSTJLQzMpkACde
         XWyfGASZGBe2irVxsYNqAOcf9HRcHp4zu9Se/oEcCILofTWmorSBIU8X0XJ67vOyJO9R
         GJU2ftfGml5nwY/Grmd63lQPj28R72Oaxz0vgX3ZC55RrgXQfzAKD4atZJtw7HmJjLsh
         o38b/LWRMhh7bNEiPfLg+Yry/CuOnLqJRZe3Wy/1vuxzDqhTQ1+Hrs0tJYR3LLKVCg/Y
         wcNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258659; x=1788863459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=Nnu7oFchOBE5njmxVZF14rO6r4c7Ss2pogynLstTFT8OVeWzyFi8LZ4KIVQ+DyHsBC
         k3SRb/tfZaLxnvvkQNSiggo9sYYr0TpsflaE+yYF3bcaMtCfsp7PSDVn+oTT0FMx1tEJ
         l3lfvUUglkXioIgNY628Be+miJgEDHsUXDKif5OFeIGKfLkZKC0yXzzatdNqFFM9jFBG
         0rfoH4RxjBfpVS83M1uxtvakm5L3Efoh/ilz7ttXG0fSIliADm27WKyXaGjnsfx2HloA
         qpG0qGnrTATfQykxcRr+IMG/C1mwMbDVF+WNgeLeR35ercSrNSyfmHfRIyweYfOwyj+v
         Ggrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258659; x=1788863459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=V6mGzwc2HkhTX2VEPCy5H24IIqpPVczGKZMJr2xmoAHvGqQUZkKG5/RZMqAqtjIksq
         kmxUiLstUochIoppi+OsrpEfe2iOypbxgygIqehF937SFGHfjX0edIczN9fbIErEjK/Q
         GtFqwqZVWag3wUbsn4hJfTtRS6xfo8/GXSORI+hv+zRW0223MKxruWywHOs2n+CkVn/B
         lRTJkalzmGfAkE0KQR53NVdQ9xoTfGiCadMpnTX4A2psrxst2OYtjA7o2sgKKLwoAJ0M
         Y2zHpHxc1edX7IC788KrmkGiRpH0pHN+22juigq9rk7wy1dPJyfQOrm4FivKKpjTwJad
         tXjQ==
X-Forwarded-Encrypted: i=1; AKwUvByNV/4pMGfwhUykKeTZqcLe8AZYEYfD9iGesbAPtD9SEbj35/6zDE9S92eHQXM2XPe+rfvhnyS1Rn9K8G/ZChY5@lists.infradead.org
X-Gm-Message-State: AFuF++mzQ9eEMrMvvntFEDrnXnpH5OxDs5ryaqfYNB11e1gfCqi0JDob
	9FyQMxgZN2ssgOFbu9entPE6VLPof0bjm3rJWoc5wIa7jSNK18gaIFZuCo7RlKWxtYOSKDodkeg
	Ty0LDeurTv6d8pQhf7nugenUQtMtS9sH2BPODAqXIy8QRY4aMMk/ZrKzZR6wmvUsstGK9jv8wyj
	gak1og2oOOgYIDmyKtWA08icONMKfgBNwho8qPGw74jLrj1Q9aFWPB
X-Gm-Gg: AYBFou1VJPR6aF449hW47KiXfmDS73kNYK+12a07mUzEVL8w1reTpdVccqLZet1+Irt
	A/noiU1P+3oa10GjZtJtTXdvj6q6QsCHYIJbVke7MIzQxTTSo1zVA3EQv5LIiYQOXSnW2wupWCY
	nlTUQU6sal/wUAaZN0cegz3KJNj4Pm5SrF+yVE98uJlxA6WixHTI2LmFz/2w==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr48338179a91.9.1788258654329;
        Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-396d0ed8eb2mr48338075a91.9.1788258653663; Tue, 01 Sep 2026
 03:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com>
 <20260827125906.GJ770273@google.com> <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:30:42 +0200
X-Gm-Features: AcwNN1UeB9u2F8V9KZ-ekpacU9KYz87Vz22k3R4eoK1r51ZtRDyRbVXuvUd2fmo
Message-ID: <CAPx+jO8XTr-C6gPRWA2t4TVCTdRQ8oquhrfv7vMmC1oV_DpcZA@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a964 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vprddorpQwRN7yjes_cA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OE_E3NYNwo-rx1BcHAXPW447bM1x0u5M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX4GHUdNCvHwbf
 QFkcDjjOWVbAL1Ogsl6lJi5aaYn/d4uu1c8kp33UdZcCZMHevTLMHZnmiyJuHkgURjXlvSQY0Kp
 cQ7Xnq8n7gfvm2aPn3E709ea56Gm52Q=
X-Proofpoint-GUID: OE_E3NYNwo-rx1BcHAXPW447bM1x0u5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX4svlayfGV2ev
 /m87mAeh3qPh5nzU7nDi9znJR/6tF4MDow+HGhmPqYWIsics/oZ5M/oOm0cjywv5959jeUcxowt
 iSKhBWl/AoUw5v0nFtkU/sI1hQN0Vn61z5p1p/JTJIihVH94mnA5YdEcE1Cne1z7a6DbFxnX/Ng
 sMRLi2JTFFPxM0zQbA4HmcJQFvdiaI6hSRag/6y1mG2m2TZjS0V9vZiIazI5WP18QFhvC+7MUA5
 G2AkAjaj4dNv6RrdzIA0NTJQSrnEBqxnHjalyZRWNbNUBbzhk5b2BsnO7IoyVGZqMu5xvGoy+L4
 cVi4Frymlu0EVd/ZsOanZXRT+NkJtZRzVHAa1MqeKB2DIVUw2QoaFUROUjza+CBfoUxEc2oybQ7
 VYeKnR35Iuuzj7ZOz+zLgzNiHadx2NK8g2Yc2V0r99OHYbeKs65aXitFrK+8ZrhxTynDT1lalsc
 lU896cM9UNWWcjPXmmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_033103_221554_75A24B36 
X-CRM114-Status: GOOD (  33.29  )
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

On Tue, Sep 1, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> > On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
> >
> >> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
> >> <ulf.hansson@oss.qualcomm.com> said:
> >> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
> >> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >> >>
> >> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> >> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> >> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers=
, if
> >> >> introduced, would also need to bind in the same way, leading to sev=
eral
> >> >> drivers attached to a single device node.
> >> >>
> >> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and regist=
ers
> >> >> PSCI child cells. As the first user, register cpuidle-psci-domain a=
s a
> >> >> child cell.
> >> >
> >> > I don't think PSCI should be modeled as an MFD device with childrens=
.
> >> >
> >> > Instead, this looks rather like a better fit for the auxiliary
> >> > bus/driver. Please consider using that instead.
> >> >
> >>
> >> Hi Uffe!
> >>
> >> Since I was the one to suggest MFD - would you mind providing more arg=
uments
> >> in favor of your preferred option?
> >>
> >> My reasoning for MFD was that it is indeed a device that provides mult=
iple
> >> functionalities, of which cpuidle is not really he main one even thoug=
h it's
> >> currently the only driver binding to this node.
> >>
> >> In any case, we'd need a "core" driver binding to the psci node and wi=
th
> >> multiple auxiliary devices with their own drivers, we'd end up reimple=
menting
> >> MFD.
> >
> > Ulf could be correct.
> >
> > MFD is usually reserved for real devices, whereas the aux is a little
> > more loose.  Please consider it as an option.
> >
>
> My point is: if you start registering auxiliary devices from a "core" pla=
tform
> driver based on real child OF nodes then you're basically re-implementing=
 MFD.
>
> At that point you're better off just using the existing MFD infrastructur=
e.

I think it's as Lee said. MFD is for real devices, while auxiliary is
more suited to split up functionality using multiple drivers.

Kind regards
Uffe

