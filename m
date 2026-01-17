Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB50DC98330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=; b=mEWcSuVYghSkN+CFJPhVmofD1y
	s74TkAfHl8AOX5WK3IxRq/AriK7hhz8P90NvdED0nyE4im2Z4nztyjBrSdPwioDgTuhlpBCtuEX64
	Zv81B5Fm9GHhNqnCuywzarprjmAk72IgcQk6xAYGx/bDV/y3it4gfz1nxAO2txdi4POwy55Q0sQkD
	TaayQDRI7B3r9FHFAMfCF6u7EbWyiIlYFrgeYNroArzPThuQH19zlzJXXYV2JIsEzz8eXLSKMipO+
	tQqn+tqBs0FOcBD39Tv3BcpkoPDdO/HcOiaOQcYaTNkJDeO4iaJkIcY06c2woCnz4g9GNSSWChHKF
	TroVdgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCbl-0000000Fsk8-3Ef0;
	Sat, 17 Jan 2026 20:09:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCbj-0000000Fsjf-2G8c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 20:09:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H296I93178492
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 20:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7V8bBuKNKK2x8c3lgEfAbpN+
	fsyEP0+sJm1A0oWjeBg=; b=UGqhU13BRG9cSmRH9uJJRuX+l6ZHcGijsonHFWvF
	Bac58faD6rtFDBekyjGzPTLqB3jU5/oiEIRG+j0nRuRoMpElC44FbJQnclLvA3xC
	ZUcAJMAXfpYRDEJJ0BIoiqBPyD9TfQZ26XDdHbyf0x9V84xQwLl6VBzB6X+tS8iK
	pbAubTME6sS0AWmxbfr6ON0jjAH0HHwV3VXFGoUzsILi6pYQc86d5f3FMVOVKM63
	TYOiRG2WZaL44meNO0sCADWH/rbtABUunjk9vX8NxBhpJEtCw0qo9L/pKgbKq3qD
	0wxq6oGm7mySjwFyyAdFyLEuL0caqBRhu2e/NgfXPyh/Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cq9gsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 20:09:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c67f65cso1091020085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Jan 2026 12:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768680553; x=1769285353; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=GonnPUtUs4UhC020PrhDWFZaZy0hO4qTZYXbDLiLipxu9cNj1F1jxE3ugd/HSFJDOU
         3ZI4uSLYdQ0IlI6tBWtGyd7b83Bf3rVEZeH8NS7JiGCmJRZ6Wk/QLW8R2aHu9NftyMZs
         qZpScWGaqbCpBcGH6Wt2JjDwATFkbqNCyzCT0v2zJdlURlxxJ4reD5Eb1VbdwRmy3Pz/
         nlEebCzA8gE0ijgUrtRr3nWbUdZCq0wyD6t5GpcdZ7I5sLnVR/3aKCk/ABgA/Xq6icV2
         bsEscCJ2UTvcQsGKFKbhN30zNyiVnhhMIqMcY+53dJ7xwmplC+bDBPOt7aUub7885fm3
         TPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680553; x=1769285353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7V8bBuKNKK2x8c3lgEfAbpN+fsyEP0+sJm1A0oWjeBg=;
        b=t3VQoa+GSNFUE7OkC4lomZ0pW0IHB2WJBX5rtmNESuytWbi2RcGrKZ+haGQ9F301ET
         yIxvTkXW9Qz+tPg4/8oBCx5jTIFyT7LxsGZYyERTdE0w2eK4LY8ZdGSSpajHNJoXB6Yh
         XfHPqQ6pCQp7PDTJJBwWeJEcMCKbN8wjRgcpfsm9cE8Df+/U2F9x2f9kRTvPC7/DWw1S
         q4W0DvLbTndbXlHAGeb9tFwhlNV6UJVysokOuBxrgdQHlxctR12TKoJZY9hSa3NQwnlU
         8HF6ukCtogYG6pxTaR2D5tS5nseld/A381TjUkCwnw7ttoLP4DyzwcNAtLjFT7b6NUjE
         oapw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7ljvV+o/qWRo/YS2MUp2//LLqbn2ktHtqfDFSqYJZ2hrM1d8rGJdF588G3AMwPX3/8tyKDRxdSOWvTxCyplM@lists.infradead.org
X-Gm-Message-State: AOJu0YyOVNLNmssy0loO09rgY8oA6MgxRnHdh69vRtM5BnHDRjj8UeIe
	z9uwzNI8ex4awD49dMmTVsMRNkleZQMNnMJt8BtV3qGLS7WhRTUL25P53+cpzNXjjOl9mRINVIv
	e2P3uGB8R9GZO8kG3VWXk+8ct4r4k87leKDNpsVQqp3JepaE+rZds1r8Aoe3Roe4WN9pGdlbMRZ
	rFFg==
X-Gm-Gg: AY/fxX6uvxAfFRP2+ZMUFv1r0/CXeCGIGw/nhJmpYwqAyVBzQjsrZ2w8jGD/vf25AdH
	375+ihuCH/vrahY+nBeaAMGVtwO5zX8RT+pzEZxbNKHzgLkClotz79ILrlj+8tqb6unOsBNzYRh
	ReGJEC2bHUZpcuZZ0oZouf0RlwnL4RVpJqaWc+Bs34OKGUCsgD7wnCYaCX5xzDIJRc23wmsrBQr
	q93LsMok2loBn366ZTGQsasmDjvBsTmw5+bEx3QM63C9KuoQehObQVSD1GSCtiicFg9/q4JsBxv
	TDgH6aVEAvkhYvkS3qfX1w3OxaoGuIo0u8Dy/tFY4/EaMbP1rAoedblvIruNrHifIqZTJFJO317
	BSecnn3r+9uhU++jNLAkJHpJ9
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929202885a.48.1768680552961;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8c5:3881:da82 with SMTP id af79cd13be357-8c6a6944c4bmr929198585a.48.1768680552304;
        Sat, 17 Jan 2026 12:09:12 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm12742304f8f.29.2026.01.17.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:09:11 -0800 (PST)
Date: Sat, 17 Jan 2026 22:09:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Message-ID: <zf7yc4s7i3fo6tcbenzmce5n5jszanw47umqixczxomx4ryby3@bo62yj6fyviy>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
X-Proofpoint-GUID: D9OzBDnvSkeY61yHZTHyQIdVBbLtk2AT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDE3MCBTYWx0ZWRfXzy+7MXRwm4Rf
 mUCuvev1HC8BWKGLiqSidELZ2Uo/1vSOW891vstAKO0Qn4x2Xs4TQUqhB6wqDeO7xRbc6Cz3JtR
 QpWYOnSwk24lMp53HpINPPW1fKq/dTeR8ahAf8Mq7L1R512lHkZZTaU9hBXTZwg3++tYF1CZqZG
 TqEf0bqf9ka69r1S+yXqV7lUuy+cpXACsyxHs3JUCtxNSVxie/rO6s4MPXsD+syFllfMb3K4Ik3
 ACBOe8lRd0lsYQmQUjRnAtfZl2xC4JZIMzQuk/dvs0fbZK0yYaOH2NonIq5fg7fvSsKd8dT6+j5
 F6CHpZqbRF9SSwXH2qQk60LCKUK6zIAdrCo6OA4xF3ZLzme3jnqHIjkGreT2qnnurUSjznRJ8Ut
 JcmtU6634Fk+QpIYUh9M/tA45BZyBHNT8geKB7AVUTHgytcKv5Sy6ptNfI5PpeRPJNO2SgDm5JL
 xmhnkdGnSVAJe/HpSLA==
X-Proofpoint-ORIG-GUID: D9OzBDnvSkeY61yHZTHyQIdVBbLtk2AT
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696bec6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kZO3GQxq1qvB2pjO5BgA:9
 a=CjuIK1q_8ugA:10 a=_pNNAR3j44AA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_120915_623660_F223DA5B 
X-CRM114-Status: GOOD (  11.33  )
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

On 26-01-13 15:52:42, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 24.19 MHz. Add support for
> 241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

