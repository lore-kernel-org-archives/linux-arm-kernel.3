Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53CCC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=; b=RaVcBVdTND0AYAWbzRwkVnNX3w
	qECz3s4+JaReG4lKqkatl1JXpgPD7ax0qhgsQ8uovZrvN3NbRFr/tLKSZx0Y3dbLnXm328nwad3Cv
	X5/aVeNslLTTjIaczhaHANt6VlMaeMVERh+V9/ZJXhvT+MXkm1nXm1Y9G36gSPF4Oax8VdmRyqgg+
	bqPPnBfLRHnTrUUs+wdkKVpFvbLtCV7XNWX8oOl1xY6oJnd57ATtqReqJB0N1KFyJYo3i0yIEpDEZ
	Q/fb3f/HefVigXSmefUUL4MMQ1aWKKj6GB0jiMv1bdiMhftnBLsD4Xv0z2TqaVC18Ebo4Es0F6Hi1
	8QX61vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnxP-0000000DKX0-0ZDf;
	Mon, 06 Jul 2026 18:22:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnxM-0000000DKVe-2pcZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:22:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7Rs990243
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v+oE012GSbNPmRWX2SIsV0+R
	GluI//ijk3Ve8PNTH7A=; b=ICNziEBhOwA3ThKdqAlrIYdxEyCtsuwQxSSe4066
	ghoWAku41y/5nokuhHf+oBQP/RpdRhK9lZZE/3sxGgXIw9LmaEnkyJTuY1jBcJ2S
	7VmAgRXMWxsEBAiJLi89Y3uXwkKh+c+LXabxO7jjUmp37skdEt0IR05a/1+2f+tT
	9NqScHRx77IWj03FrLHvBSe8YbOuQk5WzzHLQD4IrFGYPdcHzDcsGT2FxytZ+fZG
	vskpbEP2/yT6z+OmZt/beWQLRIMSlFcew3PRnKM60tMs3Pdgi8xmIox0820yQHlo
	B9NkXIubsaj2gfPpSc01mCbfRAnHJXR0w6DBjJOCrT55uw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtbm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 18:22:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so671099241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362131; x=1783966931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=b0ztEXWWR5k4tvBBce6Lh3mN98WQSjm8SKhvKxoLdxVQvFSivm4J3OlEPCqiJjF6my
         Drn8NLSTIfApZjiGfucEt8uwpJlCbHM7Ji4B4G1ep0TJke30P8TwTN7BvnsTr3JUPnHD
         Cgzlh5kSPcLXEEFK0TdkPeZsrFWfhM9jscZSNiAC9Ju+vM4Q4xWswxqvX7HsgiKiSdYH
         TCT3eQbDtcrC4w4adxRTi8rYDCLrp1T5smzYVdL5lEEk5g8WNy5ngQfOAKmY4c2fVHXD
         psSZN6iJbeegbosqyBRauhrYa90C+7Nb6KZBMp2oyCpqpalhBZb37VnU+qFaVfz5MP0M
         2KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362131; x=1783966931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=rEngOsFUyRPINckipFAtePrDiiiLRvfBpYCZaT5V0Pn5jPAi/ifX3OwwTUVJqbwqoQ
         2963Ye6r+f8CaLzC+pwPvCdjnvO4ipre8GFHwvaGc0UofQmsHb0M2pRE9YrsyHND3dUt
         1GFL2Th/3h2603DD3nZDyM1LuWxmtUq73ASFRFsH8d930DtNR+6l3kpAy6DYL3Bd4kM9
         QCSQ/nJS/uvieWdgJhQuToW8WxbXzHIl35ZEMmi4tNKdswcoABOhE0DRPwkuBPm+W9gB
         6WhTKVOMyXaMjF6NeBwZJ1wehir6K0nK8TiIQNr7C6MtED1CRiz/WK4P9e7Dt3WP9tZp
         Jxzg==
X-Forwarded-Encrypted: i=1; AHgh+RoFLE+W9In4ag8bbrBkL9nt9GTXSpAnCGeMFPvUFUTJ1oAKfwjKIgx99R9q+zVPVwTfGf/Qx+LgI/aKifo27216@lists.infradead.org
X-Gm-Message-State: AOJu0YxoHoWS3ybqzLKBisNs+utjTEXi7qNRqAS/5lBYP5YvuSK2Tl78
	eEEVKGEpYeCxRMT+yMX4kXYWe1KJpExP+RAu5Kam5W3S1JNA4a1LFmZ0dOM7+e6se1RzVFQk131
	lRNiPoOYFN97CzAH+chPFOhH4E76Sw3fey1ajNTE0vi5EYjZ0Yph+BpADngrdWdTzCs+QpJSiAT
	FQIg==
X-Gm-Gg: AfdE7cnKVEVgwBF48dTw2rgoe7gSd5lTP6FG0mP+6c++8ayHsZFKHinUuZgz3nhNqw8
	tT9XGBhbz8BTFdI8o9I5nzA/VTRLMGP/t/d+bIUnsPDjgjJ9LXPRiTVJ/KSlUWTYV7BvvNDM3h0
	lUAT9HafdPgAMw85a+2uJadKFwWzfgJhkDJQboB+Nq/dSxdxEaMpJs+IOUOvvOpjGDVLK1zZqGw
	LNFxRfQjtx+tUR7BWW+b6q19wtElhuCUWuzwVVySAWW0h9GI7IZoVHNmNb4QgqDs69WK/Gn3XWj
	xQH4h1HR2Pz7eVPcCe1T1JBZ31rndKK45bgJ7xgAOIhfJ61iqjSOgzFHJmWx2WN0rRYmyFTjV1n
	ByMDpusdwLhUKkg4PkdBnHiLDzWlGuWRe6uZ+328nXSs4dZBIZmlfY0n4HoSNv9MHk3+STL+dr5
	1CT3NTtDgANL4qleGHO3MWGrL8
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895706e0c.0.1783362131242;
        Mon, 06 Jul 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895694e0c.0.1783362130681;
        Mon, 06 Jul 2026 11:22:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm3065981e87.4.2026.07.06.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:22:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <wgaujvwp45q4gfm76py2xbxobz5zc4hotnfxwldeysn7go6t6r@ufcuw7khhadg>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
X-Proofpoint-GUID: 9Jptx7u7c_l1QuHkevy-5pkzL5YgMOXe
X-Proofpoint-ORIG-GUID: 9Jptx7u7c_l1QuHkevy-5pkzL5YgMOXe
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bf254 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Rl_UxCnVGJdxiaxNqnMA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX/mbyxKlXc0mm
 +JAZp2hGXgpX0x5Jxc3sWHImd/TvweLHe+jxJXTvUXLIe/neVq5gT1AhTf6ChQ0ALfjhwXYI85t
 0aJLEo903eG+VT6GMx6LCXWPbTfKEVurZ8entu0a1jP58IfGZRQPN2/Y9wZjr1yirovZAEpNVaz
 NoSsCQc6cDpwHOQvMEXnG1V1Wwbh0k8O4s1vlmKXC4YA2590l1u5M/0uxdWCyoD1r2WH1Atl4ei
 ojRV6HQCgCR6/JV6SIixldDi6W59JD2YOgamzCE95X7HoLkj381ChAJ1ztV47Vhs2g16236VC3I
 eDQiFY7h6bbhNqQ7L4quIoRZFpoitHRWw3kSjGS2jg8LCbZRFLNBolssiatYm0JQ710IOTkHD04
 hTvzycBsxxmVA6f5jlnfOQHd3Gue8HylRrzIAwJhb4cXkEdVejvzHpFgCkx4sCeONBmwbuUW6eK
 Z0BQYckxYGA9r5D8uiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX2Ce2CvweMav1
 Tvtz54q+ky3hOwXnBMa/BBRyO6T8du7xm2aZ4e29VL8MenaWfNTd5Hs1LH5KmZ/AeTga7GiiHxJ
 sM9V6kbR05nBa/TjHXD92/VusmSXI74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_112212_720826_33B6F3E4 
X-CRM114-Status: GOOD (  16.40  )
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

On Mon, Jun 22, 2026 at 08:54:22PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.

As far as I can see, SM8475 uses lucid_ole for PLL0 / PLL1.
So, no, this part is correct.

> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:
> 

-- 
With best wishes
Dmitry

