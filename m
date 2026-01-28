Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589B0D3F08F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=; b=DF4TbA7E89Tj/FRwLVrEydVN6b
	Gi2VEffabHcoDHOl9KYUcoMDr23pDji96cu3wq3h/n1RYRe3RVTR6OmiuZMsxBFYgnVrU2lhqRAvW
	7O5TchJinCUz6RiORv8h5XHqcUmBqhZjdGZvvmXnmwnOhVZnja2njcItabTQrnQ9mZDdUSZrLMPLS
	85KU/pE7msbXUDOLtZuV55HtvXFdVv5q9AvdQ6r/q+IfKOSNasQwOlvFI2B682KcNEZDBE+3CWtaU
	5Xvj6uQ4SrYUncDZfVhotVU6msNGTX1fr/fjQ4gwknVPSB9WWxigIY+smDIvEN+R5v4W5CKiYtyec
	bEpzuTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl84Q-0000000GLVK-2GzG;
	Wed, 28 Jan 2026 16:07:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl84N-0000000GLUd-3O1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:07:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFhx4g3442331
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wT74JYFNoQcS4wI1iniyZim
	QN/JHMCSXvXZOTbFCAs=; b=DbEQJlZUCQ0DWI/iv0RwoFK7HTXK+pjbIfWIdguG
	mQWQTkBX0zYy75o3Le2DjFYlhdXmkn1VgL+MmaIhWeJ13JwylSNZwzATp1ePlewD
	z9neIrgr/RG38y3yvKTTCGospOkypsDkgbLtfHMq/alPqYUYEqWAsRfK6VDLTFIS
	aHxY0CyUt1EqlIHZy1LgXqIwPIWOz4gfD5HhznSy2ydxtsGsFV7TI8TxKl9v5iYI
	SMHLpV2aGr19koOv5ptwhEIAPmjpFnmBG0C5LR0AMvyljm165Vr+N8RDgJvcHgG3
	ZqJBBW+zLOtSoEKi7+/xlRv4Yi2owlLbEkiLXHYRQv/6Gw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanajf0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:07:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56626b89e83so7237215e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769616422; x=1770221222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=fAbMKR4vKn2zqVr/WjEYSaYvU6ovJYLMhMbZxQk8i/5ItGoi3skkLvbes2B2VKiKNy
         x6njo3qKolNo/6Lw3U3lfy3eNznxpC87O+XhVUxA3KRTDsClGafT2fNtEApIyE0JHPWb
         qNOKg3J52/tYlq9ARkwoYY9AUiUvXEU1XD/MTxD+br/jm9dzfFiekmLx0Tauvo2VtCc9
         vdJkrF3EZca8+ehBGbMSRD5KsCtzda8klNMMabXhQCE1LK6yArK6odYTpgWyK0jXX7gB
         SDfebhvueMkSk62GoDtEYgQacJsCVlIrH3rIYabHAnWfXsVA1ecnMuu69p1/givvJnKY
         TtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616422; x=1770221222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wT74JYFNoQcS4wI1iniyZimQN/JHMCSXvXZOTbFCAs=;
        b=rdxQUlnJ2c6diuQSQKQfBiNiXmJSjr540YbTrS4R5fYLmy4R4CphmBaymExsqvnE4b
         CE20wTiRsoiVppqsa5JeevLPcJwuZDgE67GRQPh7NeGQaswC8drvaUnp1dkgzUzAmYAV
         P10Ty5/L0y+lx1vqneIqDbgIellZRKLYVPl+oxF2m5F5L9w9uMtiWFKVjbahAu/T5xU9
         TkL/omy5/p2rMSOOm/MuK4w7HsXi/DwYVg3OyYOkb9zxVyZlbgovjKBf3LhlZf0nTaXK
         cFe8wPsN27yMXqaPWcbm1SaxlcA40gyasefdK8a2Z04EuKQXPXnFTYP0vOtIqHR8Aqeo
         UOQg==
X-Forwarded-Encrypted: i=1; AJvYcCU/aayFe7XO7+PxsXgR7TPdySsx0xGImHtDbumzHveJDV96/iwWaDu/iIs+3IXB/hR4Eqz5HeOSNJDLf1b1wzzI@lists.infradead.org
X-Gm-Message-State: AOJu0YzC5wrCHEXfx0BOwtLabj7OsmzxfVtGAxIGF+ebh/FFFyxtA7Mj
	H+Ccf6t6iVFmeYP6dRIEzC+Uu5G6gQlqdoy74Vc975a6BcavMVgO9Y/bn9Y/Vrr9GwxtcrqD+Yj
	MBmXwU1ou0pPSeDr7EH8icIU9qByNpUgXyROTm3AEBFKJdA0pH82e1+E2JbHlHuyPmrxmWkO+yC
	sQ5w==
X-Gm-Gg: AZuq6aJ67NYIVulfCp9Md+ayfM06XrFmAdzGtwppuIU9L1Xtked1xOr/b5WgFoKGN5x
	szAOYumw+JM/qegUjGWQELS2bliHsfCXAqIYfIj1EV45iO7XHkn1t9ocOBbeNh6Zla+lLS0zH0j
	8kvKONjq+xxpNuFQgd4E367EZQRvWyITnGQdJ4YsKZrFBYO0iIk05JkbH+MP1JIReuF81Iohl83
	oyBl/N3Tqa87ntkh9I64ScOH9i09PeFLGGVFoLoGr6x22cSOLz2mEm/iIqsc6NllzfGNECo8ilp
	dsSy/YOW/qTo+hoM85oVcdPcus9U4x8TelsjK4vuWQoTjOUmM+7Ieb/pQIi/eISlyFWi74HeZrq
	qwbLH8qnHhcqpqXDcdgiNGoPWY5Vb+xnRHVaGg7+S+l/4hDf3L1nAYhv8BqIZlL127kGRF5Xvqf
	UaVub0wMUxQpjY09cjl+DHqok=
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437741e0c.14.1769616422296;
        Wed, 28 Jan 2026 08:07:02 -0800 (PST)
X-Received: by 2002:a05:6122:7c7:b0:563:5070:ab4b with SMTP id 71dfb90a1353d-566795c542cmr1437707e0c.14.1769616421853;
        Wed, 28 Jan 2026 08:07:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38627876ab6sm3997671fa.49.2026.01.28.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 08:07:00 -0800 (PST)
Date: Wed, 28 Jan 2026 18:06:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750
 camcc
Message-ID: <mpb5lca5n63vyp725nfvhzcyckjzfw3qxhjrwrhsxvbaykkcta@lhq6t2guwm7y>
References: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 4rDjxDeENDhqe3fYuI761XEVqDYXwQ1A
X-Proofpoint-ORIG-GUID: 4rDjxDeENDhqe3fYuI761XEVqDYXwQ1A
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=697a3427 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LBVU2G7aICa-vlctToYA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMiBTYWx0ZWRfX93yRk6IoQoQH
 Vmd0c7ojYPiobsUoOmCIW08NHf3rGIKFKvoMEhCKhW/tjUcT8qZ7tCrtf8r8JR2/oqeagnARTn9
 4yoqphswiQpuygXXONHVsqP4T+7UG1plhIJnWsHfkNesKnSLOgLDD1IOdKluQgMN26j43vRixDl
 Vy3VXpW+LSeNnzmZSkS7BKEg0CBpYxnZzGZaVDrycdYLKmcXJTNwesiDjfYiiiA7VTNoCl4XYD4
 K7J+LA3Jw3+G7RKIt1k73mB2J7xybAboZYz1P+OTcx5l2ldCX8xCrXPs5T34zgCWTBsio6iy7i2
 0MmVNKdrmn0xcdVhHincLQmtoHLbVyzrFZ25q62UMBFkAcXxP+EB/8uD/S50oCK8O4LsGZFeg6d
 AeQhm/8opOt8kpYVWUxbGckntYQo0Xl4lbxIc+hf+BX4mDtv7ih6efcaw7SZWPnIIvMe0aDEsps
 ti/5FQ/Ga915j45koEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_080703_845746_1C54B7C8 
X-CRM114-Status: GOOD (  15.53  )
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

On Wed, Jan 28, 2026 at 04:43:07PM +0100, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
>  drivers/clk/qcom/camcc-sm8750.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

