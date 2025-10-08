Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B39ACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2l8a/RrMPRcP4HFtypecMkniIuriznY41w/vPB6cWA=; b=aDHSu8RnwcP8lOAKoDq/Sxsi9b
	C54WszxQG39XtwSa/0KzFySYkz5zi4ezVHpdwHmndaBsJk2qxe10ZSIL9o7FsYOjhTcJdUs7HoOK4
	MDkdAwPINw+F+hGRc4X92WsV8L487b+Vlp5vkbnuCC70o5020rpiBRfZ4f4qP+PQeDZfJoabvhABd
	Szdy8czO/KgMqeRYHoaOeTNjRn4620fUdPU0SzQg7fj0DXFJTQVkFut3oOFKbKWjM6MgjZRhKLNpw
	EmFZ4q6jRh3eYRHY+It/J+AFhPzwJ88gui/B3qOXwtr90m2741RPGfOCy4UnbrLw8+LuMdgC+aTte
	Kf1CYs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tbt-00000003rVf-0Yaj;
	Wed, 08 Oct 2025 12:49:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tbq-00000003rUX-0XHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:49:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Ooc015714
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 12:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o2l8a/RrMPRcP4HFtypecMkn
	iIuriznY41w/vPB6cWA=; b=A8En/NhyIRh4HBUKryyFxcP6tqikwtzeowJFs/Y/
	bSMfBxwyD7jcPRkkyhOpF7d6hk+X1brXogBJ38N35TZkVAPV88ISBzcEt9z7/ZJ5
	24O7ZR35KJEQii2T1RY91FDEExU1SqmS41wD7tKKuqRSEss2+PNneeq6e6zrjm3I
	lSwJ3QDc1Fpfojoap+WJtabhSPYUoC47wCl7qwaehiBk3X1laIHv6kw1IXjJndlF
	XplTvtDIBLRVK/fis3YjZk/AvZP1Fyn1hSDB6HiUmyr2hsgHPqFELpoecUDIGIwD
	fKw6dZmWAkOdv5SaqgwYtMhhYoynotcg79GgfeENCSeMFQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk72jb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:49:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e45d71f05so152800666d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927772; x=1760532572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2l8a/RrMPRcP4HFtypecMkniIuriznY41w/vPB6cWA=;
        b=JQ/F2z4nZPLYOYp/9THhl82znlKFOed30VB5jrzCkl6U3SAn02pGN6BUonp8pxHc2l
         yayBxl5PxJuRxWRI97z6opGRrsoenZvBmplgNcQLJGZJRf7Jg54rtHaVPFAfXQdUMnAO
         DrzOcooYBX60flzDRNXXoeHEP2XsOnGb3FndHFXWp5d3DCynzd7nWaIzqlJWX6Ill6hB
         uxbVQIqHBHwwIzYHxi26oUY3PaYH+I/lSVsJEVoDEoxVYR+2aSzTM5l2ROb0t0Mp3bvL
         o4B+dwFw1ANipKtDMp6WRYbTyFgSmFFQjmANt/Lr3PSI/v8kKCIv8lWjq/5DKbhXr1MV
         cAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOrneTX4gk+1TokgAcbndj5QURH/totTsINcAQ5q0T7re+dsUrmESSycuTC3CfO/7gp4h8NFoztt05tXNNl1cN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/CYf/PUNBAw1xH50DPy7xcSF/uat63TmWLSy5nW/QrVTFlwHd
	Oa3lySFMlXnSoHnw+Csb8OYIVSUmZy53oFYAsC0sneM3zVHVOHhHBUt8Rj0E8xPLv7QWNIDUfM5
	zaOam9OFO80vJplK6sCRlK6pBLs84nVGVaDApVqZGsQQY2os/N5xL+7AqgtUo3dxphGnZ9KcBMO
	NmYQ==
X-Gm-Gg: ASbGncvgVJJQEtzdHvTGPGS8xgCheTfdq6a42PWT5n6NaLSpnzkko68CF0LfJOQlcAY
	HK+TbZ5ZmBe8U+RLMV1Tb8/KRyk8U+Ap0NwLWW0ZEGoARUsHfvZQK+qnIDEaC7xF1Yikvciws4G
	YlNrbIDRHBzMdEjc9K9ljfO7jmAGPIgvXeErcUMOQiQqT64eclcJsPQzPzrXXCfRkRBT2SG15O2
	xwc44Zt2Rng9+WjPg7nQUnl1NI04TpQO2r5iwuQUxtYVSAL2SnB+pVXlLVY1ODr2nUt+x0oeiwm
	IGsRc6sOMlgdEvZ3w5plMO6D7CwtHAMtNui0k9eF+0smScWiexhceo3+AJBMg59SJLG4G3xMMWE
	CLmll8oqmgMqZRyO7eyxRdfqZz+1Dcc/0whOM3s/2NwDQheyobm5H0Vi6FA==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e6ead694f8mr45838981cf.74.1759927772240;
        Wed, 08 Oct 2025 05:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6R45gywYeXfKfF/AAK9J8gCfjus0oEKiXMqBK9n/2HJsk3Zc+ToSrG2ZqrEHLeKIGtHha6Q==
X-Received: by 2002:a05:622a:1492:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e6ead694f8mr45838661cf.74.1759927771781;
        Wed, 08 Oct 2025 05:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fcb2dsm20195561fa.22.2025.10.08.05.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:49:30 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXwhxVWYtBOEoJ
 7HB51TsMi6trsrins7SaIJQqj4PJU4Xa0h4FD8V6BIzUK/i14dqU0h9dMkJOhbD+IBc1+gcGhL0
 TbZ5YHPfQ0TJwRm9IdS6U+6GvH3TaPiezffkju5ALh0VzihXN74ccpK8zhb3gWR0Gn04cSb6Wpi
 WORCF77x3BG6uZ5nynWe3sOINFOBeUIiyksysR57gxHDKFIrlP2Rmc6YDhuk5hoZxBsBJb1m7OL
 NvSoa/yfr95di21F2O2L7+Y8HSzb0yOk6r5OFKkN0QWJiRT98kBY81OwSQ2T+GKn7FN7fEf9L85
 IS9mjL+xaVdTvgheXRgKMuzzI9A+LqNVvKMiVdMEpajWpAilDI7kckdUIHXN2gmVvLE0dMTGQmX
 yEiKh6olLDf99VR7T+MQcALxCxrd8g==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e65ddd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=dL1b4mpT1AD2RcxrWJwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rNad6JQIW0grY9FNQcAC0okOcf5xwHyB
X-Proofpoint-ORIG-GUID: rNad6JQIW0grY9FNQcAC0okOcf5xwHyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_054934_280285_16B16D0E 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> > with their corresponding PHYs.
> > 
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
> 
> > +			mdss1_dp0: displayport-controller@22154000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x22154000 0x0 0x104>,
> 
> sz = 0x200

Hmm, why? I think the memory map specifies these sizes.

> 
> 
> > +			mdss1_dp1: displayport-controller@2215c000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > +				      <0x0 0x2215d000 0x0 0x770>,
> > +				      <0x0 0x2215e000 0x0 0x09c>,
> > +				      <0x0 0x2215f000 0x0 0x09c>,
> > +				      <0x0 0x22160000 0x0 0x09c>,
> > +				      <0x0 0x22161000 0x0 0x09c>,
> > +				      <0x0 0x22162000 0x0 0x23c>,
> > +				      <0x0 0x22163000 0x0 0x23c>;
> 
> 0x2216_2000 and _3000 don't exist, there's no MST2/3

Hmm, I will need to check this...

> 
> sizes should be changed similarly 
> 
> [...]
> 
> >  		dispcc1: clock-controller@22100000 {
> > @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >  				 <&rpmhcc RPMH_CXO_CLK>,
> >  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >  				 <&sleep_clk>,
> > +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> > +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >  				 <0>, <0>, <0>, <0>,
> 
> You need to remove the same amount of zeroes that you added

Nice catch. Which means that somebody was sending untested patches.
Nice.

-- 
With best wishes
Dmitry

