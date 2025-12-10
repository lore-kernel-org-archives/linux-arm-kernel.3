Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E7BD3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=; b=AkrCsZnuF4GqjDObHXF+ey7GQl
	an69PP+1CgnpTBNd44W9rhg7OAt7jf1tX12Qk+pJhzvxUmJEvqA7FGl9IbfDhKlTamdkaGUniZgil
	afmW920av/twgEP1lGEMm87dQ5vrlVAjo9jPHL8weesv4SdVRBUBxhEheyvioYU7qPZ/gNAto1ua2
	Jj1jxOX9LZDFPUG2kZmRxAtt+NY9Dm+/Z226z/PFytsUdpA1UKFUmK8Aa7Pbkm6n6jq2J5Zdcu5xi
	aqJB5/sZEm4fkXTFEChHKmy7EA9FYb5cpwUNsnjkMjCWEYk/73yw2hyJgvQVAGQjIuaWbeOrIMmXg
	PWBAaffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFSD-0000000FEwU-131z;
	Wed, 10 Dec 2025 08:21:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFSA-0000000FEvx-1l1D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 08:21:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6EJfe1780713
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HnPXid0omdHPGaut8KB5nAWM
	wKfDbeTFf33MoQUOo/U=; b=JpmUXVBm5kGIG3UUOa2wLGvW8fMO9OJGlDMfCXvc
	uEnKlIASTDsy1TgCWU2/ixfBVd3RrPmDyVhBxHTUqeOuWOo8j21AsWDW02YNz+zt
	WrKS5lnuJV97yRy/qVKGHu3IQAPidokI+0Ca4ZRf89VtNLGEG5Fy20w4eO3Ayo5h
	vUbyA/viG1rCqgZ4ssNEJjdtKwrLVSduGWqsSIP1QbNyke4bcyteTpWFg5kTFWzH
	Zm3EJBolnw2XYA3CjO7aUZvIIpxiP/lS71AxUXhKEc7pm0Da7ZaVSSvhZDmb3io5
	hMkrFuIlHkdSL1wGTaE6/tXQF3s8B+SA1C/NZ8h+6VHdJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axrhmadyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:21:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so154441351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 00:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765354901; x=1765959701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
        b=jFTeQ2OvxUDFetSVM6turY8cZp4T8VpZ+wOGu9o8Wq0nLPVFbpjAv9ogGAGSiifyit
         dF6yfRtnqLIg1wSby/HcsNX7uD2Z+5x+11OPeGJJFSed83crGbLZFlguB/3ZzHPXRNpV
         vpI4NECrUcLl6WAfnSoa8np3uRsWB61CpsxAlz6idoVUFoy2/bL0UPvAtLvTPQH9VMrp
         JtnnMnuyJlWZUQ/fof+TvhmvUZeXBZJNrTtmKL/Ik6VbyXnIfVzQncgWNQ78X6Viyi5T
         LFmjLkLwqHdxS/sMO1vyVoGCE74M9UCz0LnmXqHirvSLcYONNYww554etT6ZxdJF1piO
         8z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354901; x=1765959701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
        b=mqvmuNQqw0sXAzd4ZQXcCGYq7dOTqNe4DpUGaQ/tqevaB01nITqZ2mFnThDD6b3Xm2
         TGAg15kzR6vQ+fdT/GSm0TtS4sGa2Y4HrQ1vDbqTqCDko4hLuIggShPaaCCfuQwkjWer
         eTXPA58OU3oy31D4Vhk7stNL/7FawheLshA9p93pxRrXo3bCyIV8bH1uh5ENYrvRwYbw
         VpD6EEZoAaGPKkNywtO09bKw5PehuFtFsNM80NkfzYz9w22FY1fS6E5X8UUt64OAskRv
         19fHJuOJxrBWTTJsTzdrF5/A5gj43eKTkLM9ibJH8iKuudeJ8QuHvDBPu1rnHt+lkfFQ
         SBRw==
X-Forwarded-Encrypted: i=1; AJvYcCWVXXNHxy+lJMjshpv7jF7yrgtcrxPYxrYvw1iWlADyQEIuDyreLwX+VTtNV7bgT14Zn25GYC/UGqvT4mlL5pRA@lists.infradead.org
X-Gm-Message-State: AOJu0YyGpEiAihE/1b/LEVJ5KDkyfptrnsX7UTmGTYT2l6IYJcahZNdy
	ucoatXXlC2yvYRuCKR0tx5RdSlkcckDoDvIXHIEn63YQ3zdrK3WBiT2BAnN+kEL1epSD8SAi1NB
	oGBqJtAZv3xabhZi90YGs4fypAlV/V/1vf3dXghS3q3zPKetIUl5sA91uf478yNcVFlwr7mZ4Yt
	NRVA==
X-Gm-Gg: ASbGnctzq0D7eCcF5ud1mmZLz87i3kDrkCsGdzG6eQn/YsVc94/uXNP9gB6m8h+MtU9
	HX0ZgDYggws1Ngy+U+3Vz659tg6Fsjtzv1BcySyetiUOla22meNanHS1amLDscl5A2cPJ/2D1Op
	TIl3yMUsLm1yPjGj3+MoDICE5P79P3aks5d8ThratfX5kL7mLSLsAdxabzlwrHFBeaTdKkOIfaM
	HHZoXafFpc89y/Ye193NBaIFuSAk7f2yul4KtysNj/bpeFIZLe98MEi19IWjhKYlH06cRrITg63
	0+obYQc8UrkByvXXRRZEnwMgYGWcw8pwfrILFvS6o5IdBo3y4bvAFSGc3c3y0eqRK5r3IPQfwDK
	vkVc54x+R70BCg7Ll2YWTn8wv+vOEKw/mw/nYthCY6udyd6N8pStHjXbXx2ZQQ852wXT3XkGfyn
	qUNxCfjD5WiW9x24fViwtuqTc=
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f1b1a850d6mr21108811cf.33.1765354900605;
        Wed, 10 Dec 2025 00:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZERnPWe3Yc2HBRs6Tkey0IEG4u7fCpGxa0fWGHQbkO3ydYsnHYceLuRvt9f6FnX3itW8Hgw==
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f1b1a850d6mr21108321cf.33.1765354900148;
        Wed, 10 Dec 2025 00:21:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e54csm6202863e87.59.2025.12.10.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:21:39 -0800 (PST)
Date: Wed, 10 Dec 2025 10:21:37 +0200
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
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d7X4CBjE c=1 sm=1 tr=0 ts=69392d95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bsoMiNti4Xze2ZiuTnAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MSBTYWx0ZWRfXyrou5DrVjSqQ
 qpUm2vWQ+MHFGegJhAQn63XF6/Txy9QoyYsNxc+yn5K1cWhZt4n8F2p9D2sWe4ifiKTtCctt+Oc
 uYooPWGv19boQ22iNnljXtSqqeumzHR32CgAkyZrC3Lpi0TGDPHrEzK1CBlS8jsAdxB9CdsEtLk
 sFMlZ5s217JzHuPTCxHjqKP9PjsibmVo2zKOCaUJ6oeQq+vv3hqpIQQxdxv8AR6UGPuLDT0FATL
 5hGZXhdlmiufH4ng6oHXQnj3vljgxjXZO72RAO/QJwroNMPAK5GCDcUI/yyKlVchR3kmOlYYicS
 q0JWcjtduuWaNrWfbDMfiJrhk0d7tni/Li5r022eFAfEZfR/3huqvUt43oO6ZIZZLmq09ufFuGe
 TC6zTuDPBIIrQa+nzfzG91icQKjrqg==
X-Proofpoint-GUID: HlYhqNfd8w_fvwIxZtwXsIWy3VNx0Jrt
X-Proofpoint-ORIG-GUID: HlYhqNfd8w_fvwIxZtwXsIWy3VNx0Jrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_002142_484816_3769C6D7 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> > Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> > on the Qualcomm Lemans platform.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
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
> The last two regions still happen not to exist

According to the memory map I observe, they do exist.

> https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

-- 
With best wishes
Dmitry

