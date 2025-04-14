Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F247C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+XZ5UGJ/cw2rjUWCkVkP2GZxzsxlJK/WCISXUsWDgk=; b=RKa5bhXRAjv1NU5Rl6/DkOvolV
	zwfKYQvotln45PNaAlhJ1Cqj8v6dvBVHtr3eku90IgKVeenFsMIU4VsplT9ZTH+uZwM3CblPtBfCu
	DbTPuycay+Z59qSGMpUKvZnHpLqPNO++ZX9InvaDqCmlw40mdCn4SrTneUHkiRZiNdUZynkoa+ykC
	dT8tU/Qdpjk4LzxiNZO6GwZIlAgEzKYum/V/DSLjZnBtsju5PWnPXx1YcCobbhXnzaME4PeZ964k6
	nu0Byws8D8LwWy9gWPMqOwEtBAVWhVhx8iLcrcm84BE6I9LsdfljlvVhZnOhRURPC6UkqjRB45PTA
	x0LR3Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IG1-00000001ouw-2VGc;
	Mon, 14 Apr 2025 11:45:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4I7v-00000001n7V-287C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:37:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99m6n028981
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m+XZ5UGJ/cw2rjUWCkVkP2GZ
	xzsxlJK/WCISXUsWDgk=; b=FBlrnFEBEUZZeLsBrt4qkNM8rnE0w0y81jObOsym
	2jr5tnCrgDgIFWI5rb+uWYIIeYsCicDsYMZ+Hp8EgXn3D2e2M6wDu7sVJM33UMhO
	0hWOMuerdNbmkIBCHn4fACvefH4VyTrhG0L0Le3qp5EScsUc8Xof4A3qpv+SaNeu
	JSoJpz90WjscpEXaAydj3azBFH1Mey0Q1xqehv9N6yeDrMCWdT1B66UU18XzQyK2
	t/BXe//WjZvzo5H1s1qlSdReVWr6KbzwA7fTXK3G0B+ZhMl+qvgAiZlcm95gdWXh
	WDBBkOgUQJWJ1cIo3zd4+Mk+nx/MC1tEJMqlfqrFsUaDRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs14e3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:37:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so1260151385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630641; x=1745235441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+XZ5UGJ/cw2rjUWCkVkP2GZxzsxlJK/WCISXUsWDgk=;
        b=vaDi52nHz0EGB6vWwXPXEN21UJbD/ms/7Bs0JDIfcEdfZy+Ig/7WYFoyEsou5nEKkM
         CtxTh7NAZ0mNk54RwMPmp1WEiamruUEN29HzkPxGn0n10+LBYSpN0BY1AJeoXyUIA9Ij
         hVci9DlTs+hpKkpepqKL5bPMMo0eYEQoP2RTrHIUXLRiwlOvPv+cvVoWHVY5B3FFImYY
         DRx4fwM9AGscQs/jE0q/T7ODXWrHrs3T6gmtBWkv/VpETDIDhlal5EKvq6FK9cMSWB8o
         DR463/pbdhVZsy88K/8YkppUiznP+Kzt4aRE12uEUstd0IOfuWg8Rf2GN0rSl6VjSnmE
         jvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpb7rEVBWdBel1b5UDGbZNEO95Eu5Tyxl6CBYVINFFu9MDI2KnRCSwny7/x9nVT2ZM4ixOm+cc345z8pgBawr7@lists.infradead.org
X-Gm-Message-State: AOJu0YxFpHNmidzFBP+85IDj2/jQdy6tNoJp9G6a/IiechyVFVLp0M2V
	0Q23tFDSJT5oYd03VIOSuUsUTSDDjglWnPpjwwRsIB6y69M/MmeWbazIDmKAJQ/mai89+AOaJjz
	YwFVliwQDkf7AoL/amFNtaPwBG8OHg38Nws2u8mF5VeflktEskOB2r7iktsLbzTrCQlHNqezqpA
	==
X-Gm-Gg: ASbGncsVKcd8KcqvAFuf7RiL3C6CpQdasi0eXU9CjDwGQoMCa2PnFAq/OE+erH6fa8o
	2haQHYvVdl+J5NcTfuLYSQCrkZ8EYjm4FpOhuuwxm4Ef8RON+95wgT9SkrMx7Cv625yR20CMjjh
	c/XqxxbVLY0WlwZih+5FXFJyGBCDthAPgnkYBNRQS930cD7IV9FtQy9Ul3+SoPwNt0tOWeMOb2J
	alCftsD0mKqizGe+xUiTo3WAL/W8R5cmDJczwyTmzV1HRVQZ2yVgOw+UAJin/gRQU2jjlhGXl3u
	H8iV8aKF5IdI9Pxz0xNZyfbL+xiZq04gvrq38kaYtNV52Id0frql0X23ueKUQQBmTy/MMvIww2U
	=
X-Received: by 2002:a05:620a:4614:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c7af11fe6dmr2323420185a.36.1744630640820;
        Mon, 14 Apr 2025 04:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbw+g6u8oZDQ91VXBKSLoF7oGbpWST7/9WsxZFJCG+ePEvjN0CGI7O5W9I4H6AJsXJ84jRzg==
X-Received: by 2002:a05:620a:4614:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c7af11fe6dmr2323412585a.36.1744630640230;
        Mon, 14 Apr 2025 04:37:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510b43sm1082671e87.201.2025.04.14.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:37:18 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:37:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcf371 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Dsw0btoO4blozC8r0tUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GviciTTJ69bitzXHLtSqrMzs4Br7Mn8A
X-Proofpoint-ORIG-GUID: GviciTTJ69bitzXHLtSqrMzs4Br7Mn8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=673 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_043723_736663_830C5B8D 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Add display controller, two DSI hosts, two DSI PHYs and a single DP
> > controller. Link DP to the QMP Combo PHY.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> [...]
> 
> > +			mdss_mdp: display-controller@ae01000 {
> > +				compatible = "qcom,sar2130p-dpu";
> > +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> > +				      <0x0 0x0aeb0000 0x0 0x2008>;
> 
> size = 0x3000

Existing platforms (including SM8650) use 0x2008 here. Would you like to
change all the platforms and why?

> 
> [...]
> 
> > +
> > +			mdss_dp0: displayport-controller@ae90000 {
> > +				compatible = "qcom,sar2130p-dp",
> > +					     "qcom,sm8350-dp";
> > +				reg = <0x0 0xae90000 0x0 0x200>,
> > +				      <0x0 0xae90200 0x0 0x200>,
> > +				      <0x0 0xae90400 0x0 0xc00>,
> > +				      <0x0 0xae91000 0x0 0x400>,
> > +				      <0x0 0xae91400 0x0 0x400>;
> > +				interrupt-parent = <&mdss>;
> > +				interrupts = <12>;
> > +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> > +				clock-names = "core_iface",
> > +					      "core_aux",
> > +					      "ctrl_link",
> > +					      "ctrl_link_iface",
> > +					      "stream_pixel";
> > +
> > +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> > +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> > +
> > +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> > +				phy-names = "dp";
> > +
> > +				#sound-dai-cells = <0>;
> > +
> > +				operating-points-v2 = <&dp_opp_table>;
> > +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> > +
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@0 {
> > +						reg = <0>;
> > +
> > +						mdss_dp0_in: endpoint {
> > +							remote-endpoint = <&dpu_intf0_out>;
> > +						};
> > +					};
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +
> > +						mdss_dp0_out: endpoint {
> > +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> > +						};
> > +					};
> > +				};
> > +
> > +				dp_opp_table: opp-table {
> > +					compatible = "operating-points-v2";
> > +
> > +					opp-162000000 {
> > +						opp-hz = /bits/ 64 <162000000>;
> > +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> > +					};
> 
> > +
> > +					opp-270000000 {
> > +						opp-hz = /bits/ 64 <270000000>;
> > +						required-opps = <&rpmhpd_opp_low_svs>;
> > +					};
> > +
> > +					opp-540000000 {
> > +						opp-hz = /bits/ 64 <540000000>;
> > +						required-opps = <&rpmhpd_opp_svs_l1>;
> > +					};
> Weirdly enough the 540 rate isn't in the clock plan for the pclk
> and so isn't 162

Nevertheless we need them for the DP to work.

> 
> > +
> > +					opp-810000000 {
> > +						opp-hz = /bits/ 64 <810000000>;
> > +						required-opps = <&rpmhpd_opp_nom>;
> > +					};
> > +				};
> > +			};
> 
> [...]
> 
> > +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> > +							 <&mdss_dsi0_phy 1>;
> 
> Krzysztof recently introduced defines for these

Ack, I will update once we resolve two remaining points.

> 
> Konrad

-- 
With best wishes
Dmitry

