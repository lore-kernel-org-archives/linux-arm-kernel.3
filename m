Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD39C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMfBL6klZNCVN0ew1RgJN7qJHKindjUUpeOpSnuDApM=; b=MLFxzbM1a9v+JiyXqcyNO+DD3w
	mN4ODwl5wUszNT65ZH3TynGRUu/GrJ49V/awbEKrvXIf/HiMA1vr/xLoD7hx4Wbdap6aR3X8bhXuc
	UJsk1MVf6DyUBKSF4GY0hA4VaIvnN2iNk5klY4jiXTFOtZhVU6tcIyXdjDXybkDRTPELhcdDCurvM
	BTxgcmBqEZlIfge0dltxN4hfT7r8jquvKZgIYu0oB3nHtZ31eEYFbcrtHRnlnFySj6cZdGGT+uD+b
	hjHATo7TvtCpwZvNSPeBq1iuHnHu+jpmhSOevl9U9J/0bR5BhZdnpRST2/n4PUhRVXUZJqR+yIVAr
	sav0OigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tredB-0000000355o-3vT0;
	Mon, 10 Mar 2025 15:01:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdDb-00000002nq4-3lzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E978FA45CEE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D29C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741613454;
	bh=7DK+rBnIB6+gK5GprT7obsuYQKNEBuzPpYg+bZU61VM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYbBZ2/2ikL+BS17LTdpEHIxgL2xK9VseSHknPp71IfzABqCdbh/GmCUBswskRKZo
	 HoLv7IyVMKEHMHmototrTF3Q5T2fpFWdSGXS+ChOyHd83oHP717/kB2NCDNA9L/Dgu
	 kriANQTNFnDwSXG1eqkvhriuL+hE6sh9S4ogtyWgQSXkeUermOqKlNBPO3SxbBOoS7
	 BvYDWknbsRfnwJAFKIEAoOI6iHKCE0F0Tk88ZbUOY44kAiMvTmCRibG4GFbrBeoAcW
	 IUyTxNtHguVQEyq8my/UGqkylg0THx25infYsqmX6e74TbQjSEvrWT3YnKjaUwNtGc
	 uNbNKWYa1XNQA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso5327223a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 06:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXGFW5O9D08RmPfM8D0oPiJ9guOP1DOhvkiCE4/ioLD6V/eFS1IJOavjY3qduMuBUxIY+0O5zHH+bwsUDzJVBA@lists.infradead.org
X-Gm-Message-State: AOJu0YwdCVsdqd2YkpH85CX2gOn7qO8RLq4wNDuG7gAN2Zb3SF0i+naa
	hHPzsE+Vj0wCqjPozmuZgXbyyca5JlQppOZNPEmBDwKJziQ56ItZDtVMrcOnWTAzGfKMFcP4tGx
	voXjBswU0tcMYo8+uJb06OuOv6Q==
X-Google-Smtp-Source: AGHT+IHQqQev9Mt/kBzD3p7JhI6eC5lr1d6ht0exKs8fcQ7bw7GOc5LSSjJJgeGQCo3IH1yYOPaQ4qbZnGMKJ40RyrI=
X-Received: by 2002:a05:6402:4409:b0:5e7:110a:c55 with SMTP id
 4fb4d7f45d1cf-5e7110a0c6dmr3695220a12.18.1741613453358; Mon, 10 Mar 2025
 06:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org> <174140525677.1770282.3232695979994091275.robh@kernel.org>
 <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
In-Reply-To: <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Mar 2025 08:30:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
X-Gm-Features: AQ5f1JqRkP_MsxtbTrRXJIVMatqOMN_D3NTt1ZS-seDKkCW2KxLIXoxniVXXOnU
Message-ID: <CAL_JsqJ6iYm-8BF+4QwimAX69jmivpCNqKbD_AtWkKDtAn_Wgw@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Marek <jonathan@marek.ca>, Maxime Ripard <mripard@kernel.org>, 
	iommu@lists.linux.dev, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_063056_081143_9EF6ADB3 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Mar 7, 2025 at 11:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Mar 07, 2025 at 09:40:56PM -0600, Rob Herring (Arm) wrote:
> >
> > On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Describe the Mobile Display SubSystem (MDSS) device present on the
> > > Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> > > system level. SAR2130P features two DSI hosts and single DisplayPort
> > > controller.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++=
++++++++++
> > >  1 file changed, 445 insertions(+)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneO=
f' conditional failed, one must be fixed:
> >       ['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', =
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', =
'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', =
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', '=
qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qco=
m,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,s=
m6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm71=
50-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-=
dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi=
-ctrl']
> >       'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290=
', 'qcom,mdss-dsi-ctrl']
> >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-co=
ntroller-main.yaml#
>
> It looks like the patch 2 could not be applied and was skipped. Is the
> bot parsing the dependencies from the cover letter?

No, it's not that smart. I need to move it to using b4 though that has
its own quirks when no dependencies are given.

Rob

