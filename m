Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C470ECD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=; b=2JrutOaIJNTM1fxUT5m4W6ketu
	SyGIukg5O+/bO0Wypee/RI+xzkTmxMSH4Ijic0xtVbnw2/0ZmW4WmxGFJsWpXD7WOt8421x9+eORJ
	ivTM3rlgEHcP7+dLY/u0wSHwidRSlVnO56Td3FBd8qwleTsHGkCIKMrV0SQZ88hB65pic4qil+yxz
	xNOudpMIMrKZCGEhdrqaxZbIQfGD/TX2qRDrRGuu/Xt4lmTq3GYx58v6CRduvzEs+oHxWFxjbsCpw
	5Jf/JkvHO++hV1x5w0vNyDSICmBrVQYJbGuUySWzoztwtMuCReLvuKLSR1LBffWJ/bY70WxiQlMRK
	xzddLqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq12-00000004sa3-13fJ;
	Tue, 09 Jun 2026 06:32:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq0z-00000004sZd-3AlK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:32:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596GB5b1736463
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 06:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fw8rVWdcZwRCeJaEN+LtFUGm
	AVSjdUhQcaecKC5y4SA=; b=ncPU3+e0tUCPM/NMH4qm9+CedFI9ZgnPy1kORLSO
	9OkXVASCDeAoERun2GTlrVeMTp4xZNAjsxFRc6H2wNHzkkNgiT+RS/ShMNBKmozr
	uGA1IIUZtXEek3wadmkEwupr8BJMc7Hrb8W09Ri37QKizorX0K+QTWQq8LkM7Hd4
	ceXVpMtC1YXNbDLwAUyjuEnzBhy1mou4IXxx3BV+PFfflhEaDUTfBCAXlOSYTvQJ
	vSUsZnecQSFj05N0guIj/mCXJ8zH7sIQjjZeeVC7P2uIKpatCi4tSDSTv/Zo6Rhe
	00DZiMz3ZJNJE7UvegEf/ebio/ZPH0/fRVHO6UscRGkJ+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds827d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:32:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51760f997fdso159274921cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986764; x=1781591564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=UTH1lCMnoU+wB0sNIKVuumtZZCbaBCSfL+DnsOCGXNf0s2Ps06wXA3jp9ghIz3GKMQ
         X8e8V5mju+Wjltv+ABAg71yknj7bRqDEDSQDzcbgTmpzun/8qsHwgX1JD6/mEkOOWYaE
         WDerj7Ij9VkEXQZWtTJe6+houbEtWd8LgxdYruA3qPeVyXq1ntB0uy6c8VA0P2iCFm66
         XxDyY7DakICBnJpg51jXdx45qZQGK1+ISfuh3zDE0JINVsKec2A/5IfhiiYIVj+1uujB
         Pwn6uIB7cHkSj3sTnGeFStQroo9/jBBpfjrV1NQBpx4xSygkFnz2duF2cCh5wKuVynQz
         2jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986764; x=1781591564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=Ns+M0JqScXkI4ux3MdoVR6Gnhm4m4A3zJoULnJZOlXToZVAgwuarwIyHbzggwRDBgd
         YNlub08e2c2bhNHjiuuS2SI9i62ahMVWJIpA4TxUF/8ywyTTKyY9Uc6H9mVYNxZYZ+29
         hpCkksk1WBbI0NPIealomW9OmJWr2s2zIM59dN6tufHI9q5wZvcGdNT8h/xNQTnx3oat
         74H/1rU3LQEbhko/CEaLsRGlaEKwkwygCiOGDazHCfIGlM09/Wd/3KQD1jOdkGgeLXtx
         NlTn9f5Cv7ypzkD78lwbN1R2ayAVsrZqRUioVXfyX2AO2WZWtC74i5e7v0DX5dCrGguT
         Yv4A==
X-Forwarded-Encrypted: i=1; AFNElJ+DfAY2kurvMCM15H75ez1RGK5lZfwe5xKBOWi0OyEZ+Pfwrcbd7HN9nMaGPgrpAJn8jJBxmLCvH1nuYUx4ApYd@lists.infradead.org
X-Gm-Message-State: AOJu0YxGPUA/lqSLklEQPESAhoZNlKob97eWWyyAjBv4Q+F7FUgnS43J
	Iap9IohIeCkmSuIrXevTOufCx81Ok+faNFtUoG8OB4ZKeqaicavc4xQ1KeuHGk3tyCKCt93W1pm
	+Z0eJQwy4/HWEUSIbTTkfpoPPvdXSC9bct+5YX1QHWfEsKTKVy5/Ce3D82HNtnQH3p4mYSsmSgX
	XiMw==
X-Gm-Gg: Acq92OF+nSsTJmFiUiraQWNg+aD3vEkaOklBLMKa31dhuY+uxkDmdKSsPtJVywScCfw
	fiLvQRyJCB1qcm92Pp3BfKQ06yXqSigvn2UtnwiEyX8GbBa2jZJc97dQ/kpl6V6q/3lrNW+7ViL
	5FH8AVMuQ/d2v4Ps4/q/OMSUvkExhsKhA0kD21aJobCdUDj4hOSFUlOqQFkpxmES+6ufP5yhATI
	56pSf05vTKaAdb3RyBSbqyO4f330YXkzmFYSLTWKfvYUQVLE85uCDw842j+mk3pWTwluSZcnoZJ
	4oh5zZv2sU3vV//nwZaS2ERVKvSgX5BrPnkpxqRBTcb6850l3//mz5mNtFkPtUxTLe8g5WvUia2
	5v80huF2l/CJvNb0xRi3F9PzmPq5QCgT7GBPjGEgyzyg=
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247781cf.40.1780986763670;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247451cf.40.1780986763119;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2cbb4cbsm251161395e9.0.2026.06.08.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:41 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Message-ID: <3bx5w3q3d6jts4bvf27sclmnvytfdft2pocnspnk2ptwipzvec@edjcz5llvfli>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
X-Proofpoint-ORIG-GUID: JC11N-LRwgHHwNkXYCiVGTxtp7cQL53N
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27b38c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JC11N-LRwgHHwNkXYCiVGTxtp7cQL53N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX2idhbxOqEKEV
 9YKFOQDdDiQf9ooPoYwfydK46sgCghAeJFzr8HwoksqtqJJqGb5EgHh9Cv3yIbaAMU5WVrvurrE
 c4THVb7C3Ly9B4WoWJ4s6zaMAJa9OQs+vrPxEiJXdmaEHfB58pU+KA8lywinoLL39ViKjS4x7Qx
 EJGyxMC37PTA7ugj39YejHHyNrGt/UExgeBkuokzogYTLq0TOmomdTY8Dv/3INL6txJViBe5BDw
 gZwwYgmlQPKE5VCZyxNuS4PIUbO9q0wNhfsC/OHI51+Plw1QLy4iJbaofP88Qbm43KVbyoftC4K
 7LASiySLCmY8uXa7+A2DdQ/d2mJFncaJ6RPlyMX3cWj8RzKf1EdUoe7N0QviIC6Bxe1U0MSmVSu
 2/Fa8tVvm8kBYSVJ5sbuyJXZ/h42ERoJlCPIx/2eKm/tLWeP3M61nFwVJWsrZ1zVH+cuNmYSiLp
 y2K1QOkPrler/Oldzfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_233246_140245_D6422403 
X-CRM114-Status: GOOD (  10.31  )
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

On 26-05-05 20:49:00, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

