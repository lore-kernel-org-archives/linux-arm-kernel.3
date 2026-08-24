Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B63C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=; b=cR5RlvX5kmI/moTEpsUa6tNQrZ
	cmUueV0vkR1i0FnvWOQMBdSPhc1RM/9WCARZ0+4wdaTpa5DLicjKJTxAGZWHt6m3bI1p+TZxP+B3h
	s7p+QS2CCmgCsoS6i6OhV0RXy/AYzfHzaLZWDvHGhHPrVeeneIJ3oQnw3l38lnSLEU3PI4CpqRSIH
	Kxa3aQN9ODNCLZoGG6lZd7FU1Pubp/Rnkowa3fc7IpUKb6Ta8ipMekIoHWkhyd/AFqHy8LFl6+BSi
	mhVaVFaW6Dv1KfH8f14Pot3HCfRVWOS+MxAkrQzgcNPqvIqVsczmicr5juKhBOcWBYJ5fd+lCN4Ad
	jI5pHhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPNu-0000000G8aa-30OE;
	Mon, 24 Aug 2026 07:46:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPNo-0000000G8Zj-0JDr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:46:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RFGJ3067007
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1UEfkp70xx0vLD/E4HUvwEd
	QnrJJo29zF4VvLZULIE=; b=ebbm179aTnExabRNo4ZQbYNeLgKwGWYOFwJVTYbe
	oqQKvsXbPIS8I8elsQS98Vxx9+ifEfmF2xl6pwR0vDpk1THK6e+KBrl2ngSuAuZE
	NlNcmveh9r3Un51vCDYyzd9prwusYrTg0ZrHqFp3IRpvv3nqvT/EOqmwRdr/jJ/3
	nITnt5Y0CrHAwJrnlowRDDzADz0VWXFHak9NEHJTYIxuxCXSLaaf/7bXXMiOLKV9
	sym8Elu4gUEqfg9qD/dJ3SRo/dhjM0+q8v6d9VtuK5t8HYXa2FdrnLcL4BUjZmvH
	Ak1AlFCYbns0RZO3jS/Lyo1Pw1ONdjoR5h4Rm/SrBPO0Lg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphgkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:46:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dd69b00cfso39469161cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557574; x=1788162374; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=SKx1CMTleqi5t6zsVlxKooSD1vzNN1QTYzpLADe3WuV+EvWpNyQi8xqR2bHCG/yjg5
         kGsXd6y3aiOIDf16kyq2bG07iUsx6TH9aJCbP3pGkGe33NcvSU8KbMVIUzIBtcr6ZmMM
         ucrwGDbixsNMBzg8PrGhZfhKoRXyRHTisMosHdeV36AXTeWhdnH2MIdaFrYhX6p2ult+
         IWFHDKotMWliu+rnHnjyVggPeKBfI4o6NGOJXA6oXKjfO6UCcTFNtxPeWKaO118GIvX9
         r6MD1ca0zIoNF7mtrQXUkGzNinBm13VCfbO9JnjpRTY3VHg/gqfuuTcR6X2BO0qlKd0R
         JOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557574; x=1788162374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=APiXS1HoIP8H3WU3RXjo4h2Kvq67NN6U6nmcOgQgmrbyyHlfM3dFfeWU6fv8vV0OmY
         CTDvXDRTfup/0rw9K0bHt3EvUryWPkyLjNJOXikViUepq+Hr9mzfAbM3HZQjL9htlhZc
         znw0SwkAr1er+FeU0fLwHvrPcW3zw9bQjn/yM7PajQMozeWzY+hNPnSnXg43ZdE+8dHt
         QVySLprQ5GrzKMniBj3iGLtW9c+OGXmfqwDCPF2qtM6hAk53BurfQ4BQQImdov8mrJMm
         tHe+a3DZYhZWzyNFmsZJ9U1cBZ3ZH/7SHSgdhCL9PnLzJcPsI4IUQrj/0HBIWWZAB+fV
         Hang==
X-Forwarded-Encrypted: i=1; AHgh+RoXabQpDx2muIIWJ3WYRbc6Vpfx8j00gDCr4yu1ln5u1aknJY/+mkH1SHQC4AJUeLoRTs+szjMLKNuLIJzNrato@lists.infradead.org
X-Gm-Message-State: AFuF++l7zAazy3aR+JHwDczJ8YHB1GuTZ8IkYjCX0JlFEo4EWG8vViPT
	wc6dAWCijW4gxMvHAF6jVFcmQVwrMQFd4AWFlEp97GWcRBgNEJR5rFhxCdLZ5Ajqu1yZ9w/Yt3x
	Q5ePFnEW6V4ReY8FBRvR1yUSFA9Hm3I9NxIpDfr2mYIdE9t0XDJIUtDSUIH9Ybek3U0QMZS7KhW
	ZqkA==
X-Gm-Gg: AR+sD103enVP4tUkItBcHQC4SqWIB5zQmMpR3qBsCYmp5yC3eSNgvI1Sv/awrANPS4Q
	PsKydZ/7B/8b/YInSlZuEwMho5iJJ95RqvDFpHX9FGY1gcn2SOppNSVGDxxj442aol5x0VaM3xQ
	wDIoiWFSK6TLDsYbgKbzBpXmOWHOHlbBDq1G2RkU6b+TdZQfPwVqdfj5PxPbqxDARg2ObL0DtkS
	miMCcnmIppwviuA4FlOyxgL9ZZMVEdSl5yv+ebwVHMK7bBZNZ4reuYfqP8IC4mW7TXBVR2+eOio
	V/8remd9nOD6sQ16Wdqkb7jB0XFl40pwSDsoXr8b3Nz+VQLdeOot2/YzImcDrrq5lLDEDCorW08
	mmPcbCwK/bJtLVwI=
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846361cf.3.1787557574347;
        Mon, 24 Aug 2026 00:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846011cf.3.1787557573742;
        Mon, 24 Aug 2026 00:46:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1254309066b.29.2026.08.24.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:46:12 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:46:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <5gwqlrycd36aqu2xhzcil6rs55v5qbe7yshhbedwacq3xvaufh@5xi4z6xyhxls>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX0g8aIEPwmwxv
 wXcjlij3+rP2jCc7vQVNGS3poBd8Vdp5un4OnUd3eOaKOor6xPfNRhA6WT3lEubo7ulrxBqYsh9
 Uo2yKWVuHArwRlGO14bsaCPoX5BsJNUoir7jSHbr1VXD0Bd/ZnC5F7Reec6vp9CpHhku5PaQms4
 MlrgJEUY4bLIN6f7q2uuA1DCaPPJIe7QWdWp+gsqe0GRopO1ad3MF4kADle0C8kZgIkmbvUazrM
 tpX7oif/foIDuN/TDF4+DnOMXCv8hRxjK6nR0myh4tuMxZ987o21Prle2MqqGKD/hT4eE7Phst4
 ubEgzLYuqy4IS6jPCygddQ/zjayqCx3QV3aEexcS48QUDLuQbz1sCx8Z3hPuYGdKbV7JgMqTAK7
 uZw4MYSc0jf5oHrsIpVcOQWnW0wTjp1Rf6uPZEG0q6RGZI3Q9H55/x16x6UTpgWEd0h3YpRgb/e
 ssI78NyWwqvIDMB62xA==
X-Proofpoint-GUID: Dui4544n81Y9L7PehkgZplESoBWvLwUR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX8GSeHDjbrD7c
 5nIEwgOvQjRqRJqTclu2kcqGaS4kwCBQaD5+r68WmninkJt84Dkg2tWuERFoaxX9Gr67035J4CA
 lVH/XuGRTbFtz6SqyXUWQvLs5XWgI10=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bf6c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Dui4544n81Y9L7PehkgZplESoBWvLwUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004617_503512_A3664D63 
X-CRM114-Status: GOOD (  12.85  )
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

On 26-08-21 21:38:58, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

