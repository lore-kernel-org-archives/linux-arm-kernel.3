Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2AFC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 05:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RwvbWHHETKK51FixReBj+oJDEXTCnpFZVoOS2S1OW8=; b=RsyHMd54L+eofP96pddj+DQfDJ
	5o6ToRB933Vdm5xTuibqLte9XPDx9V0yEmp+08O0Qq6R9+R3mQNgNWl4ayNjqig/JaoiaV7E8uIdX
	RuKN+G0ejrofXK1cI6dhcmATTeY5FRwpf/jaUqIIR/FLXBM3zNmpcp5TY4/Rdb6X0zLIdop5D4x/3
	H1UEsPnjs3QfelsTbfDIcAMkjLOwBLX0mQGQXgJWnePjPBX1TLdv8rcn0UWohCxh2XYhOmztN46+Z
	RcXrInoRiapETNDv4vRpRElGP9cwi7ua23NV/iU2D6DFFSVGl/bbzRirXu+1vO3ai/gVYfoo+kuh4
	5wbGfvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhrz-00000007TVG-1H4d;
	Sat, 22 Feb 2025 05:16:07 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhqU-00000007TKH-48AY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 05:14:36 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f88509dad2so24087557b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 21:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740201273; x=1740806073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RwvbWHHETKK51FixReBj+oJDEXTCnpFZVoOS2S1OW8=;
        b=o3g5zmnC8tJ+u77HKzH+lw7rHyWq0beK9lbrLKFWWyZAFBRcrbMGZxO3R/fdg7Ute1
         fgrJTJOmSUoS0XmIX2OMfK/oURuLUkTS6PGDzIcSSXJQktdZnkIu/PqaHIfPTiKuPBpZ
         mnABMGDTyVAb56qYFszgokI679TFiCfmx7/sioQN9QmO30wVOVJ21hgD1Hgrny3GJ1xu
         /7vd079PZiUV4vJE/dRQCUBKg7uXD6SYBGtczHgZhEWkcvwjlgzuoArLi1Pr8PHxyGyU
         ud1N48EErtiUhMtCzcgI1sxiyHNKks9grWF0hEaepB0BEN1qF/eZYaP6TTzGjO52e4HZ
         CXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740201273; x=1740806073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RwvbWHHETKK51FixReBj+oJDEXTCnpFZVoOS2S1OW8=;
        b=E7dre/Q6Tv65hd5jhGbKDLw3cCJa4zqYWwWYWmQzbZPcatx9zAEL30HvRJWEqXF9vT
         heNh+QAUQXnYvKMFRYsEFflfRfkfmxpK7S5OabQ3YU5ToZFG/rhkZTiLyTNf2coOPEqX
         DZ9lgbMqOEmRIi64urYGTKwtquPcyAS8VkmOe4syTNDlHy2Y2nGD00WyuZqMsztckiKZ
         0Hfp+R7fVWimiItWMYBERP0PPimuifnJ1BF9WbjgOFXwGSrPzcwd1TY5tmD8JQRsz8Nm
         evb03kV/jT/VCkWmMprTmJmAP/vtMu4ZCaHLsjPBH5URJU/KRmnbwuA6D/yaPIjKJ7bc
         jQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWsnKUPOsRI+RPLzel4nW/gzDsd0RsG5fA9ioGLck8vR0T7mDPFEL3m3Db4KLdaHcoG4TqU2xfTP90NhfYQ9KbI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Pg270w75l6c+LXxcnuFKP3ZM5GjPHfuJX1bcAoFm50Npmdzf
	mfjc+CF0y7Lr/xFtkFyRzm0s/TvL2Rh/N9Wpl+q/ZkrfNnygBwUOfbVJLTf6DtR2os2eM5U7Lox
	mphbMN2zsMINYIW9nEMgHskOmF7hHH8+IC+dqPA==
X-Gm-Gg: ASbGncvcxT5fYQdaloXs8Zv7FQMsXP6twW26awqbIy6j20nQs7kMXW18IYsbzIXcDEm
	EHhaizqOs31ATyXuVw7MU8y+PRP8j/VY0OhmyMKNd12+J9g0PfZB2/YLeK0QWVCYSEQeq7zNAqe
	Dj72H5WSD5NA20tF4UyJn4IQ==
X-Google-Smtp-Source: AGHT+IGQ/KDfElGvmhXzkExKjHk2cNCssJrpvCzkIdV66lfJ6iHkLOurmTN6M3RYaA42R4m5UEil7RWRi+/OxN7VaZA=
X-Received: by 2002:a05:690c:4587:b0:6ef:60f4:3d41 with SMTP id
 00721157ae682-6fbcc7805f5mr53359567b3.16.1740201273393; Fri, 21 Feb 2025
 21:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-4-09afe1dc2524@quicinc.com>
 <tcm2hn7rpzaazntp5r7ag466ynacexnke43e6ypm4q5mrrlkdb@nem3gzib2l2v>
 <0ec95cca-45ed-4805-8ebd-03563d55627e@quicinc.com> <ofaioilki5qxdq2x5fpbpuk6mid6i6slpyqzwol4e2s4cwdwsf@lgpqy2zil4j6>
 <8c48de90-3dda-40c8-8f7a-01102f7360a3@quicinc.com>
In-Reply-To: <8c48de90-3dda-40c8-8f7a-01102f7360a3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Feb 2025 07:14:22 +0200
X-Gm-Features: AWEUYZm-KOty3ecyZHdCAcNlwh-Kws5SWY_GBymMAYd9Ar5b7QNW2Z98djrEc3Q
Message-ID: <CAA8EJprT5cz=tpSpMVAk7HQwTf8V4BdRuaoZPfdObfxwTjnKzw@mail.gmail.com>
Subject: Re: [PATCH 4/7] phy: qcom: qmp-combo: Add new PHY sequences for SM8750
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_211435_046877_EA091245 
X-CRM114-Status: GOOD (  31.75  )
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

On Sat, 22 Feb 2025 at 04:43, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
>
>
> On 2/4/2025 6:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 07:31:29PM -0800, Wesley Cheng wrote:
> >>
> >> On 1/14/2025 2:23 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 13, 2025 at 01:52:10PM -0800, Melody Olvera wrote:
> >>>> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>>>
> >>>> Add new register offsets and PHY values for SM8750. Some of the prev=
ious
> >>>> definitions can be leveraged from older PHY versions as offsets with=
in
> >>>> registers have not changed. This also updates the PHY sequence that =
is
> >>>> recommended after running hardware characterization.
> >>>>
> >>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 198 +++++++++++++++++++=
+++++++++++
> >>>>  1 file changed, 198 insertions(+)
> >>>>
> >>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy=
/qualcomm/phy-qcom-qmp-combo.c
> >>>> index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..823a60029ea6acbd1f0f=
8c7d27aaa58de39ed758 100644
> >>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> >>>> @@ -1471,6 +1471,139 @@ static const struct qmp_phy_init_tbl x1e8010=
0_usb43dp_pcs_tbl[] =3D {
> >>>>    QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_EQ_CONFIG5, 0x10),
> >>>>  };
> >>>>
> >>>> +static const struct qmp_phy_init_tbl sm8750_usb3_serdes_tbl[] =3D {
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x75),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0x5c)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x0f)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x5c)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0f)=
,
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xc0),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x08),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x75),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0c),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4a),
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x36),
> >>> The only difference from sm8550_usb3_serdes_tbl, it has 0x37 here.
> >> Not sure what the suggestion is here.  I think in general I would want=
 to have a separate table for each chipset, considering that settings may c=
hange/evolve.  Currently, if you're asking to re-use the sm8550 table to av=
oid re-defining this sequence, I think it'll be confusing to folks when the=
y refer to this SOC's PHY settings.
> >
> >
> > No suggestion, merely a question if both tables are correct or not.
> >
> >>>> +  QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> >>>> +};
> >>>> +
> >>> [...]
> >>>
> >>>> @@ -1781,6 +1914,22 @@ static const struct qmp_combo_offsets qmp_com=
bo_offsets_v5 =3D {
> >>>>    .dp_dp_phy      =3D 0x2200,
> >>>>  };
> >>>>
> >>>> +static const struct qmp_combo_offsets qmp_combo_offsets_v8 =3D {
> >>> Why is it v8? Is the actual PHY also v8 rather than v6?
> >> Yes, actual QMP PHY major rev is v8.  If we want to, I can generate a =
separate v8 based header files if that is better.  However, most of the off=
sets for the registers we're taking advantage of in the actual driver has t=
he same offsets as previous revisions.
> >
> > If all registers of a particular set (QSERDE, TX/RX, PCS) are the same,
> > then it should be fine to reuse those (although it creates some
> > questions). If the majority is the same, but there are some differences=
,
> > please create new header file. It is definitely easier to verify that
> > the patch is correct if every piece has the same version.
> >
>
> Hi Dmitry,
>
> I reviewed the differences in the register sets, and there are new addtio=
ns
> in the v8 QMP PHY, however, we do not use or program those registers as o=
f
> now.  I noticed as well in previous versions, we only capture register
> defines if they are used in any of the init sequences.  Assuming this
> applies in this scenario, its probably ok to keep the v6 version until we
> actually need to add any settings for the new registers.

And when we actually need one of those registers, there will be a
confusion because some of the tables for sm8750 will have V6 and some
will have V8. In the worst case the table will have V6 and V8
registers interleaved.
Please provide a new set of defines for V8 registers.

--=20
With best wishes
Dmitry

