Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2189C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yO2PTptqLO3J42jrF/h3pZfi+qlyfdweEdQ+r5qxEE8=; b=S4GsfmNrqBOBkO
	WBr2r7w3vquNlL9gdcNA+jRYPu/tDNzc4SrCfSKIrtTLEYHP0H8cMnXKgVJ1CbgbuUhjPrGDgy5xl
	reP5A2LpBHk01us0Vskd8UolDzugUMUX1zHqqISk5gLsvavaO8Wrvv5MJ8lj+tp0GVxEVhePbb9Xb
	oznzdj40s/YXd0J4aBSmfJG8trGDE5S5EKCHDu4bw1CjaTWJvrS82BxhjaUhjXIq+Kf3nwrc8v84X
	ByyatDET4T3tZPHye+XqiZTfTPd0H3Lw6Y/U3Nz5hcE25PzSGcDVZhZyk/ENj/zd8cSVIbC46CI9L
	sGQH1pCr95OPa1Kgm3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOGlJ-00000002gpg-23fR;
	Sun, 08 Jun 2025 14:12:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOGjB-00000002gkj-29e2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 14:10:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Abga5019322
	for <linux-arm-kernel@lists.infradead.org>; Sun, 8 Jun 2025 14:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yO2PTptqLO3J42jrF/h3pZfi+qlyfdweEdQ+r5qxEE8=; b=CH
	yg7LiCRv4rvgF/3pTGCDSbQyGJkGoSqh0si9urg82KJ6HH2xb9C06FQMdw0CYuGN
	jWBU1icw28udLpA7au2l4bsCbcgYkVDIc1BJTnmRundJQ7gP+D7NkglMphoG13iv
	J303ljCEZEMFgzMkxCKCiIUzM0LVWCdKNkJsjS5T0rxwa/u0lq9eWCKYlNeLmvJ1
	nqBSA+SpBarXvYlSq+7e4y3rJXyRZdEjQwXYPnsju7tg7Wl1gJMxohZKhBBgsAfl
	JQJWfcBIkEnTXdHJYEzrEmJUd7kn0kOVqNjmGsQwZfJAXXScp6IfGSLNkp/AkxTW
	vftf+rh/NNbYGRWDGI4w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxk3as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 14:10:23 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2e926f54767so3628302fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 07:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749391823; x=1749996623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO2PTptqLO3J42jrF/h3pZfi+qlyfdweEdQ+r5qxEE8=;
        b=hyInNNGzp8n6+smItMWpI9emiNMpcUemOqm8+Xq/awdLTPq2PyJowsK0dm+OjPcAXj
         4MyuDLljgrtyLPQsOEyzhGT02YTx36s/uea+Zn0EC0Bz/ZG7W5smH2ccag5CDHJ/t+xD
         Z0Gel4n/cCaKsQFqF/01gGQFsbaivxnDdjZtRH5NQc7U0h0K+LVmgnbBi7iqxIaJW6R4
         2ue2kzxis3ZHIs9J0E42JUHcl3ioGfYFURAUulnaDouTS9dP5b6ODbIHODKSjSCkBnS/
         3w/Yanfs7Wi6qglB01qCEIhwGa2KxHUv6FCXhzxpVwmXQjzVXRr+SXEnkk88fMJmezhV
         e4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd+D4UTtip7gM3/d3IV0/g9pALlS7xOs38lMWSrqW0i5Di0tlwtX3xKNaD20p5VOU1dZpO0cKxk9FQ9tJdyKYT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpp3mJGJKQ2fGkipUhpif1TB5fyqjKBggF8z2RADSrxT0IAN6z
	pKS8nBeuE0oICIVOT7VqBwXmPB3oMrJrvZ3Ybukx+er0sHlk4SgunRIMxrnLZD0sWKlcylyLIaN
	O5V1vHUYUbPYJI/sfkFcw9Mly7uF83nG4QVVu2naAImfP2Dj+tBmpqvdN/ZzOmVXmk6Y4amjgi2
	RA+HhE6srqJiE8Yp5xiV/9EiwG7DZPcamrVTKd6R7TsV+Z7hEu5Stb
X-Gm-Gg: ASbGncvTgp30XCi5SAebcYQEdCb/jWyJcBW79d2bJlxyNLXCBAn4XQ30xNV7k6JzW32
	C/CeozhDviBu/QqZ7V4kxGpBHktIy+rCoIPEqbNCI+/xn3mS9ye20jazIqqHLhK1Qwn26Ewyaux
	u340BaNw9IlNjbDNN5L5Xw45rAFR0cxzFOMwI=
X-Received: by 2002:a05:6870:a89b:b0:2b8:608d:5dd1 with SMTP id 586e51a60fabf-2ea24557e69mr2394041fac.18.1749391822707;
        Sun, 08 Jun 2025 07:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/1vxTU2Bz/RL3b0T47zztUUQuS+wl46jL0gULc1T9pUpmM4Jcmy2KcloGXMk7S33UepnxfJaeGsBnweZ2wPk=
X-Received: by 2002:a05:6870:a89b:b0:2b8:608d:5dd1 with SMTP id
 586e51a60fabf-2ea24557e69mr2394030fac.18.1749391822287; Sun, 08 Jun 2025
 07:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com> <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
In-Reply-To: <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 07:10:11 -0700
X-Gm-Features: AX0GCFsFNZiZEbNB5QOKdtpp_35NfPnwsAoCQZgzyWAJVSbekumFsonguuDtz3U
Message-ID: <CACSVV03X5EyAb5yCPDn1ot8vOFV_dKG7f6+yO5t9srr31AiUKw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 5VsfiSTdyH7Jr8jfEltQcI0m2KBVvekk
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684599cf cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=rPe8LK6Ab3Gl33toulsA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: 5VsfiSTdyH7Jr8jfEltQcI0m2KBVvekk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDExMiBTYWx0ZWRfX+f+eB17fj11i
 G/IJFlc5B3GELa4yBrwVKMJv41v41dLTqRuCTbZatBafs+UiZ344ERU+2Kfk4v3Qy1yjN0zvWNH
 4N1EtgF0sWT2N2X7pbohsdf7Q8CK1qGnfFKEybJRCKQkla2mwsff0Z7n+CXTIjAfmwxNSBNzeB0
 wm9Db5HSUALRdX9Li2PzyQOw0SrLwiVfoqkLC0osMBCV11AZgJySo2BUdjzXBpTwgSbB+xtDg8p
 HibZbfcFnx/eXwRdPUbKbheO26ptsLZ8jYiHYskuU8JwtnBX/Iu1jWsUgPMcSU3eQhZy/YvjKWW
 9McoQY0XrQ8QThwLgc0/9dSSMwkr4Ann0XF71AVEzRk6b54Xyp+dOyWRy/A/1FqWQufmFGSq0BA
 YYYKArmHuaBmgrBr2kZWH6N3AJwSatg5WqWuiZBvEUqkzhu05QlT/LJEitoEVnEMLxIIiHW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_071025_688903_4827A4A6 
X-CRM114-Status: GOOD (  22.08  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jun 7, 2025 at 1:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> > X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> > version of Adreno X1-85 GPU. Describe this new GPU and also add
> > the secure gpu firmware path that should used for X1P42100 CRD.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
> >  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
> >  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++=
+++++++-
> >  3 files changed, 131 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/d=
ts/qcom/x1e80100.dtsi
> > index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc=
901f461384dd9b0d4 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
> >                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> >               };
> >
> > +             qfprom: efuse@221c8000 {
> > +                     compatible =3D "qcom,x1e80100-qfprom", "qcom,qfpr=
om";
> > +                     reg =3D <0 0x221c8000 0 0x1000>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +             };
> > +
> >               pmu@24091000 {
> >                       compatible =3D "qcom,x1e80100-llcc-bwmon", "qcom,=
sc7280-llcc-bwmon";
> >                       reg =3D <0 0x24091000 0 0x1000>;
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boo=
t/dts/qcom/x1p42100-crd.dts
> > index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af8307825=
3fd39ece3a0c26a49 100644
> > --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> > @@ -15,3 +15,7 @@ / {
> >       model =3D "Qualcomm Technologies, Inc. X1P42100 CRD";
> >       compatible =3D "qcom,x1p42100-crd", "qcom,x1p42100";
> >  };
> > +
> > +&gpu_zap_shader {
> > +     firmware-name =3D "qcom/x1p42100/gen71500_zap.mbn";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/d=
ts/qcom/x1p42100.dtsi
> > index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d4364788=
8aa6eacac3de2ac9d 100644
> > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > @@ -17,15 +17,134 @@
> >  /delete-node/ &cpu_pd9;
> >  /delete-node/ &cpu_pd10;
> >  /delete-node/ &cpu_pd11;
> > +/delete-node/ &gpu_opp_table;
> >  /delete-node/ &pcie3_phy;
> >
> >  &gcc {
> >       compatible =3D "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
> >  };
> >
> > -/* The GPU is physically different and will be brought up later */
> > +&gmu {
> > +     /delete-property/ compatible;
> > +     compatible =3D "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> > +};
> > +
> > +&qfprom {
> > +     gpu_speed_bin: gpu_speed_bin@119 {
> > +             reg =3D <0x119 0x2>;
> > +             bits =3D <7 9>;
> > +     };
> > +};
> > +
> >  &gpu {
> >       /delete-property/ compatible;
>
> I think, you can drop this line.
>
> > +
> > +     compatible =3D "qcom,adreno-43030c00", "qcom,adreno";
> > +
> > +     nvmem-cells =3D <&gpu_speed_bin>;
> > +     nvmem-cell-names =3D "speed_bin";
> > +
> > +     gpu_opp_table: opp-table {
> > +             compatible =3D "operating-points-v2-adreno", "operating-p=
oints-v2";
> > +
> > +             opp-1400000000 {
> > +                     opp-hz =3D /bits/ 64 <1400000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> > +                     opp-peak-kBps =3D <16500000>;
> > +                     qcom,opp-acd-level =3D <0xa8295ffd>;
> > +                     opp-supported-hw =3D <0x3>;
> > +             };
> > +
> > +             opp-1250000000 {
> > +                     opp-hz =3D /bits/ 64 <1250000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> > +                     opp-peak-kBps =3D <16500000>;
> > +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> > +                     opp-supported-hw =3D <0x7>;
> > +             };
> > +
> > +             opp-1107000000 {
> > +                     opp-hz =3D /bits/ 64 <1107000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> > +                     opp-peak-kBps =3D <16500000>;
> > +                     qcom,opp-acd-level =3D <0x882a5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             opp-1014000000 {
> > +                     opp-hz =3D /bits/ 64 <1014000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_TURBO>;
> > +                     opp-peak-kBps =3D <14398438>;
> > +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             opp-940000000 {
> > +                     opp-hz =3D /bits/ 64 <940000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM_L1>;
> > +                     opp-peak-kBps =3D <14398438>;
> > +                     qcom,opp-acd-level =3D <0xa82a5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             opp-825000000 {
> > +                     opp-hz =3D /bits/ 64 <825000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_NOM>;
> > +                     opp-peak-kBps =3D <12449219>;
> > +                     qcom,opp-acd-level =3D <0x882b5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             opp-720000000 {
> > +                     opp-hz =3D /bits/ 64 <720000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L2>;
> > +                     opp-peak-kBps =3D <10687500>;
> > +                     qcom,opp-acd-level =3D <0xa82c5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             opp-666000000-0 {
> > +                     opp-hz =3D /bits/ 64 <666000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +                     opp-peak-kBps =3D <8171875>;
> > +                     qcom,opp-acd-level =3D <0xa82d5ffd>;
> > +                     opp-supported-hw =3D <0xf>;
> > +             };
> > +
> > +             /* Only applicable for SKUs which has 666Mhz as Fmax */
> > +             opp-666000000-1 {
> > +                     opp-hz =3D /bits/ 64 <666000000>;
> > +                     opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +                     opp-peak-kBps =3D <16500000>;
>
> This looks odd, why is it so high?

You want max bandwidth on max opp

BR,
-R

