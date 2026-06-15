Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C09FCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=; b=KjKYGLxWiKtFdiSQgujSYQR9zL
	zJXt1xRAr4uA1Vya/1NGDQWwjeKGo12tgESIZH7LG4ZxSfQn7DdVipWzQu7aDv5cD3a/6lBGrA3wZ
	dVLJBMlsiqaeEb4XwMCyo931oETUnnCRfzglNkWAOUSWJHpkxmI+NKJIf5ZtubhQ8MgtHWo0fIaDV
	p/dD7uyS2jwMYS8Lbrj2vY/ArMuPOB+LIZs7jOYpMkLKGTlaMtUOypSOj7WytqirTDny7qqsEgf/u
	3Im3qeU54UXxfZWUmbWh6J9/Ec4CXTediQZa3Y9BTcr9YsSn6jcGbZ/gOxH1C5NUGYXmwC6TpFdnz
	yiATs6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyQ5-0000000DYd2-3joW;
	Mon, 15 Jun 2026 03:55:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyQ3-0000000DYcf-0FRE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:55:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1krLB3309132
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V5iYWamYBGi2g8X7XD8Ib5OY
	dq2ngK3owfPK32tRL48=; b=PBqZaOn1Mm3Oh21rL2hiBioLYSupkG3cmm4KUfYe
	mxmuJm7Fm5A19YvPHu6zLwEKJVGvRvSCgGVeYdo/NBzXqDM3lYkRzU9tF9JEtaNJ
	5VTXoNHPQaceMTusIrT+dc2hdQJ1FTvHfiQEW+Np3V/D+/HcwhCClYB+idhK6CwA
	+vTGh3weu/DDo7VhLdLaxAhsHhWz4MNWJYwJ8f9R76jmz9QKqVkm+guTftMjK3kC
	6yATU0P5UCM827/3ekTbic95ipQZMw+IxZN5jLtjdq2QM1jsdst/ewu2rCWLK7og
	cgB4+/mjT7mWnD1gOPKDfSwSBUiBrJZwVaE5Knt1jvrv+w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6we0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 03:55:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842308adb3bso4122862b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781495725; x=1782100525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=Z3ng5hJ/JMFT8cDZQgsDMDNEGYdoAyqNuTOZlSBre9OqMBhFhcM+DErrh6/T0IXyQq
         rNdJxRCql9XskV76wTJueHpE09NO739WnN2zLWT5mOkoJjt24mT8ujVCVi0mvPwQ39oc
         XGOLsmFHFS7+mxJqQorTgTxjWujoFfews9JAdw39nGBxxhTpfGcnv/Glj4r3tZn4svy7
         SJk8/i0n4CUrvPOnKzvlX3OdOZGNrzUOH1kNs2akWtURckWmknzdQBXUg1M+2xmG1ECa
         uNHLToBqhfR7GLFXospi1r1R1Xxnt4rQokGJmkg57bv1BpX08C4QhFpnduksbY7MMICv
         wp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781495725; x=1782100525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5iYWamYBGi2g8X7XD8Ib5OYdq2ngK3owfPK32tRL48=;
        b=GNavAPtglTj1t3H3UZ8OgYTOtnsPMeykVROP7y/7eCYiKA2hlvd8bL1GDNN4SgSq11
         fPbPDMxwLrTlocIkoPV02r32fjnGF+zRJWpxBDIB2D1mO38elGSIQJD/SagaX0vfhh+5
         mJ6f33OGcVp/4HvLTtRsjP4f6y/eMSNcu6FlXzzehiyqiUiIBeHgaSs8ftIV3cJklzuo
         9CFfyotRiyeAB33h6Dyo8sKP5z4P+Z8f4Ae/Ha/lx8QfpdF24pmGJVD5Kgq43xXT2NsV
         OO95vWy3mYiPkMo6lUvQIK7xrerAzsc5U5vKlvuQwl1GigiUoriLac+llAxVqJadsB+u
         ZLbg==
X-Forwarded-Encrypted: i=1; AFNElJ/oXRMzDqCrH0RaDjDoT0+Fm84ylDNvycAoYNa0KVasDl7Dzspw687uo7hdDTSP2KzxaSbulPupg2FUPlqsY1Vb@lists.infradead.org
X-Gm-Message-State: AOJu0YxorLFj7UkyhuEDi7wCssH3fZ6R/mEaiV7TL0E1VNGGzXrgwoKr
	S+3wC6JvzggZA38nBjlFPMDsiVnGSxg3va35QI82e7/QjvfFVrHNxDMtM3OACk9dZSRTHrj7j0J
	MXuSq8m/mNyGa/B9uX6PThFW2l3LFpPJr0y0TFLwaV/3ccHCFj7xtLPQE46aj2f0tzS6UYqFQAf
	n4yA==
X-Gm-Gg: Acq92OG8yDlolzJ7jdOFJW24GJUVZiYZCnY6GtA3WxLBiLc9q52IinHp7HxLtik/1vF
	ddHqihMqU3fPDhvAkO2ofBKaxc3Hxwi11sMoDnB4nGl93mAyWLLxpftuEps/yf8SsiQMP1ky1HS
	f84f623gQTrcb42Z75OnHbjxNWf0SLtRGMCfueiEfOM5j0txtmyUPgsM94v3/KG6RipPaEEgeyK
	mNdw3qzwVYhaXSQ0rYPufxjLgTL/QJ/E8vvXSRs9qFDlCKBzMOv23LEXgOQwE4IKzoT0Uo4Yy5D
	DnNsJ4u83kr4f54RVeaL/sbl82TvRrEpR7On0JelCU0mfxsNuLgfynBOMP/R41nkH+P6qCYhjDR
	0ttZCB/HEWiSLlJ03e3+fjfrvT1Z0PjT21L4=
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448206b3a.25.1781495725011;
        Sun, 14 Jun 2026 20:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c5:b0:842:6004:3fbe with SMTP id d2e1a72fcca58-844e1a28e6fmr10448182b3a.25.1781495724608;
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm8482573b3a.59.2026.06.14.20.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 20:55:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:25:16 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable
 ethernet0
Message-ID: <ai93pMA6MQ2zBv6q@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-7-f0f4a1d19929@oss.qualcomm.com>
 <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fde35ce-52dd-4679-9952-728b6553b843@lunn.ch>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfXw5kkAylsuIQ2
 /mpkpUb7cAf8+bz8ygVC/jw5uaF+aBQW8rWSGB0efr/7m/zrI3l0TA5mxAgJVLgzL899Qc7dPoc
 XL4+YSmCvZxcOiDk1cL6oqwbF//RPB8=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f77ae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HuS8l_LH735D3i-wPbwA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: H4vX_t_oGFbRLaMkNCHSAPOYjmRRW-CV
X-Proofpoint-ORIG-GUID: H4vX_t_oGFbRLaMkNCHSAPOYjmRRW-CV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNyBTYWx0ZWRfXzrYp+6wnXjrL
 QHASrdbh/UZg31wntj0lr1aXgsTdjAezNFyAHY8BY5h8T967DZk5nyESuGtErC7BsKG7e1o04tG
 d4TZm1FtXT53uyumDWOw9I9LVuWcykxaJDNdrXDsiBfbEkC3Hol2qiyUEk7O7Wpo8DCtxzP8otQ
 MA97n5wUPEE5AZvtYp+1S+617XNn3O4A+0IR3u3ss1w3pYPpBF9PYbkw4Qn4mkYwPp1WAaFAYtY
 Trz4o33uD2wAzveaZqaoQ00HtyHSfDMJz0wcYVUPvgC9S6nfjfXtG8MtiyIor0OAbdZTsmgi/cE
 wVJKkfmm2WJhDlMJyJaVz96qPR2z1ZiQv7W8J9H+3iCiwH1g/gWKHE0Jx3TGjH3OqkFYroYU40C
 tg5+z394+KuSdi2kORzCeWYhPEsLhNHC+nRGYlxfUwr6oABow1xf1IY0+Vm9q3Ldz0qe6CH+iYA
 STSq+7vdzbl2MhcpoAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_205527_303484_0C93C860 
X-CRM114-Status: GOOD (  14.49  )
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

On Thu, Jun 11, 2026 at 10:58:39PM +0200, Andrew Lunn wrote:
> > +		ethphy0: ethernet-phy@7 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <7>;
> > +			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> 
> Are these two needed? It should default to 2ns, since that is what the
> RGMII standard says the delay should be.
> 
That is true, I will remove these in v2.

	Ayaan

