Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C350EFCE3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg8b3VUqbaKdYh3k3ySRyeTGMl5pXbzZIMHk7oalclY=; b=u2mcAc3bCM8aOYuXcSR/QghWCD
	r+neAJxzqPOtQSledlxZ3MDa8YaF6rqzAInMqxanmi5+XgNAFnpq7S6s1AsxnivO+cywTL++2nYjZ
	xfywETl2szwsoMntC72uWbpjaq+T/rzwb53z+Px4zrEBROpRtAwXQT6/0hsEutJQbEPgMP9OG93q1
	Rmx/8dGawy6pQXXVqO8NGB5SFBn5ysEOjaI8GGaBoV66EbHtjkvSXKs2nKugduhdZoxRxWAmGs/qx
	fqTB7xX2Xa4Ci8QCOlGwJMRYOz/EZWyt+X8JoOs3oqghRzccNLxsEWJdEFIT9YBvOLxChO2vNx08y
	Jaf4R53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxs0b-00000000PQF-2OTj;
	Wed, 04 Mar 2026 19:35:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxs0Z-00000000PPu-0sNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:35:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Ci2jM1678061
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 19:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cg8b3VUqbaKdYh3k3ySRyeTG
	Ml5pXbzZIMHk7oalclY=; b=DOJlf8bFM8TYi6OThYvb2YpxJNA+K58Yjly+IUEW
	KrQBzOeKex2sPl5vu4eX4RVQh1dFZ+SutH2eQP/cuhUmTqRccE3zRtId/VoRjhsP
	9zrErhdZ4u3H6vT47W18kQJoveg9SkflkJamDykk/Nzwtldm8LV0wTYJ8Psy7TeS
	nS05bVd9MoAJhHcKJpSfN8gGwW/bhL1Bu4M7GF7rFl3w/gMzDc0tni/xgYPY04UJ
	YBT50rjYc8CLxfE4TVSsoD1VSMqWJXZnSd2lNaGpQtgiuDXlqPwrJHLtjiMa84V+
	OapDA6JPicDEvHIXcdfNcIr7RCMLabM8Py8UYx7VMuEBsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hc5ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:35:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so900729885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772652945; x=1773257745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8b3VUqbaKdYh3k3ySRyeTGMl5pXbzZIMHk7oalclY=;
        b=eowemb5HxtdNvHvf5IbWczHVyY+ooQydpH3kDOXZ2PiP1hoj7eGP3eqeESY+MtWUSk
         TPzO7UjBfJKV29XWwt17A45S2YKJrpySx0YqY9XN114wb9OGHaRPEtQPuqMHqS7nK6SX
         w6Xuv9c+pDcwEYX72CSLPX+BhdvE+5B2cZJv94yzP3GgByKs3jm1YK0N9/3c/AmAi0Cd
         ZmmkhB00GzLr2WfYACxEcUZ0I2UMf+S7dG+2qStzYGvnMRY8qODrU8JsWYmJd5RikrFb
         CgEWz/U+UaBISnJhberh8sTFvDsAUQLUzuIViX8rfotT8TAMtHPNIiqVhzzxuzF6wZf8
         qoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652945; x=1773257745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg8b3VUqbaKdYh3k3ySRyeTGMl5pXbzZIMHk7oalclY=;
        b=j48bEWd7HBuCUiG9+pOQXY5EixFT5LPSMKMJ9b7lXBwBh/lY92flIFVxDGad2vuVLh
         v67Gcj3wrSNZ35SkDnxV9Fy2O2iqzWoK3cyJM9jVWaP1lxWSe1G06kk+4s2vPO3jV4mf
         R9RYwGoR85q/TsTcaxqJsXr/EwfVv1t4cfn2cax/bzwqxo7O/2xCqjje2NNkTnRpGp+X
         zOPNHOXpWr1LFC0O/dtRNQeO8FQ5j1XZuD00aTEtoiMqUsIf5x7U6pBAx+W+oWPP47XU
         YkAUNj4h4NsSbo4lFf1J8gJyqkrCBLgg6yLpgy3pDcEeOY9tWv+mPKvi8DsJ0tYsl5pn
         2uFg==
X-Forwarded-Encrypted: i=1; AJvYcCW1WShB1Jxu60SfTERNH1O/X7JDkuh812gZRRv5UD6xApSWtKgzI9OHqOwtErPQLlOetPm9JGEd3+zxz/bgmHWL@lists.infradead.org
X-Gm-Message-State: AOJu0YyWvKoD8DAmOLl92cA8oUooPbx+Xs6se7DUoapnaKc9LlGQtBcZ
	29TxK+xlBA2M4jhNoOpdcI+LxZ6Z2QKgkjBd+2YGyT3c7zQ6/henWqbSbQYiTL0+heXP+dcB1Xu
	3AVjb5RrlNMIbd4sxN0ZAE7htS5aLF9lW/+AbYmPtkiluiIHNrNGO8SH/qqYqgCG+kl8oZ2XaF0
	1VGg==
X-Gm-Gg: ATEYQzyNFdqj0bZaKvv+ZqFg9iEg94m2fxDHRyWZ2TM13/slnouFBwUaukAIL7/cyC8
	a7CEhBQZkv0GNMUqs3OBeuuYk/C4MkkAOS2CD8nLSQ3GiAUiv6FoYCK+Qs9UKRESqc5q0KqaPW8
	+VUbE78AQjgdUZQWG56f5r8Cu9/bBNTDlOJX0SAuBfs7d7/dN3M8i8eeb8i2q0XJCJliroB6J7B
	nCholR8yz0UxJHOKsz3Cygbq32ylr4xqiOz1kEvinW4N78C4SSjR0DPTjjoG5nZtGz1Jdsbbplm
	8n16iGD17ceTgB3HwABm/1w9G8K7HUvT04RZ0cjQQ6518ywJUyjFk73tADikKSk2daUektb5qfb
	jKi/422xp/jBvTCLRss/Ge7pAvbOY
X-Received: by 2002:a05:620a:d8d:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8cd5afaaee4mr381210885a.67.1772652945390;
        Wed, 04 Mar 2026 11:35:45 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c6:abc5:f15e with SMTP id af79cd13be357-8cd5afaaee4mr381207385a.67.1772652944927;
        Wed, 04 Mar 2026 11:35:44 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884225asm71621215e9.6.2026.03.04.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:35:44 -0800 (PST)
Date: Wed, 4 Mar 2026 20:35:42 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, wens@kernel.org,
        jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
        mripard@kernel.org, mans@mansr.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/sun5i: Handle error returns from
 devm_reset_control_get_optional_exclusive()
Message-ID: <aaiJjrtVDJyFrpfw@mai.linaro.org>
References: <20260205084037.3661261-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205084037.3661261-1-nichen@iscas.ac.cn>
X-Proofpoint-GUID: L_u0PQTZZ4jzvBHWlc9yhdmg9p9GafOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2MCBTYWx0ZWRfX9N1MU05Jp7ZF
 Ll/El6sFywe+rP1NdSxN4VSh3xY4vcROIf/iw2MgRTQoJbHWiqEJul1ygUlF0VSapHSHdsZFdQe
 EGT+nSFF2pTPexoJtPLtxQfVRTEcyfWxLLBHLLaFQ5TNToZgkZ89DThse91D6GuEQ0Yw98KsPO/
 4oIzTwAHwug+utBxNyxhXn+64zwtbt7sQ89BvKwOiKefBRxj74TAzi56QF51LyPM4ad7SuGIV6d
 VLXueH7oyHKviCzgiNxYn9gSWfG54uXpQp8px7KglmTPvPkKZrmusRh2o85yiGwzRYnQFRirphP
 OXEIdalr3yzaXXK1UCmxvYKStpvLpjUYh6mdWBoDNTODitrLDB82xkBIUUFg/er9DUk4FSSRO1m
 THrIfdeT752/Ljo6sty/BJ7frBw4AeWn68cTr1KIJYI882UdzytTJQBdi6e/AGeWRN4nOsbnhIv
 TriLhJ438lt2dW8iZ8A==
X-Proofpoint-ORIG-GUID: L_u0PQTZZ4jzvBHWlc9yhdmg9p9GafOf
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a88992 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7EzGa34QA7hzBqsRmqMA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_113547_255607_FC2601FC 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Feb 05, 2026 at 04:40:37PM +0800, Chen Ni wrote:
> The devm_reset_control_get_optional_exclusive() function may return an
> ERR_PTR in case of genuine reset control acquisition errors, not just
> NULL which indicates the legitimate absence of an optional reset.
> 
> Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
> return the error code to ensure proper failure handling rather than
> proceeding with invalid pointers.
> 
> Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Applied, thanks

