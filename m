Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5BCCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=; b=SDpHbAGGDjYa0hWXcF3gcuzu4y
	NzXTjPrCbCEizmy7XwLGl9LtY2jU3e7zE4gkwfCf+HykDfkyKWgZL4l1WGyZbG2aB/AQNIfat+Yuq
	JvxuYg+e1BFWm6my9nX1/83OUelJ5DjhAOZXccR5PM/9ts1avfYRaI1ugXi2sbUXod2oI0MsrxQ8G
	TFNalxwkMjphQLID9WtjkXh3LvhJ3Wbk9XG/OBbDqE8lngmqfow2zgxIyYbTpwgYABVXwEiBFvoPJ
	L4QhuJJTXd3dI5tJ9OjnZhpVsXH3qmHVWVm0cjPzkhzbLOZKW1oW4WKM4SnfXtQsMDaJorGIN2fDd
	N2RNwRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2jC-0000000BDBv-1f5F;
	Mon, 01 Jun 2026 13:30:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2j7-0000000BDBY-1C8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:30:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eHAM1214208
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Jun 2026 13:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=; b=SMm++gvsFKSE5wBA
	g5VS7Jqcx7dcNO2P86vhYJWGVcerVWx0P9ivsVJ/5bPFjCoumIJr0oItSxwxL+Co
	MliHmyCSqwUR1fNrtr6SMp1xY07Xy3ydfng1lpyPXatpimcb7npllGgqe7pQ4aKt
	7h7cwcYwO5gbtd3kLiHku4DB5teQvOdbC8bsG0kEkAYzy/TyHZwXV8Vy2Yj+u3YR
	f3IiuxovmzbWED14m3FJkiUEiKMRcWCID7ajSWFnS/xr+zTZQ0C7ONhgPE+2Of68
	GrGxcFcnBZDVFMsN43OPuf0LQT3/5ffZWftqpJ7hayxl40W0qA4NOM7hFPdjLvFt
	oRJ51A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9955g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 13:30:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0bfcd629eso18134725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320644; x=1780925444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=MviglVpRaJi4s+xmKtDH44Iw4XMH+70qmTNVldp1wPF2pnF2TRUNCgitoU2G0a0Q66
         dquXaXEvScjceZApfxpOVWCDAicUGa8P+Z/tVXi9cWLUw7L8MYZVZ9+n384/Nn91Z2cd
         RPejg5/KWYs12Dn9g4j0hPGLczL3pUYU4etg9pZWQqHuZR0y7xL12tFeyXLbTjMpeDQf
         vPh4j8EPu0y5TccGIPxG7Rhbvji++wb8PFhTMPDpyPPF1Gs+B7oRd9ANvzhIkTfbGhCC
         4XWramshuZ4ubev4TbBY8v09GK1Qu4LkgD9qCT/jgQPN+EkaLneH18ruSgsnhFyma+wF
         BweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320644; x=1780925444;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=Pgps85K5Td/YmtVVf8ZuQNOxsPVvgrzx2jEWKKPcRr2alKFw69FzRfxsYomfvJwb4m
         gc0VjIlXtaSnLBEPZYAejswwHmYxANt7Mgnsq+hnfsWx/8Mi4nVsW+VpFrWSkGuFYLjs
         01r9x89irDoUMkJ8BHAsrjEr1i3kYaHX8tXPDepFZgImODzFYyv6zDNwjhRvZ3cCHW3Q
         OR3fTjo3AUoxDjbNbsM2uuLdLjg36H1eVyyuaU82RUqYCahuB8eq2DdQhWHZfrfNPcCs
         A9qIpEzY3bLpTGClFf8yq67q3bo/sf6OS4n0zoiVy1RuxpjRCWFcQF43d1c3MDVcnjtf
         iuQg==
X-Forwarded-Encrypted: i=1; AFNElJ/mP8dJl0BDNVCKDqQR1gZWGWntGsijxaxe6iWF9i1QBsDGihkAIV9V39blLiUCFmq1NphG3hp4tRYBu8e0jamB@lists.infradead.org
X-Gm-Message-State: AOJu0YyaIJ+QExmT/u0OxHje41d7AR988lqypBQW5DmObmSmY93VbUHQ
	xRDZSWcwi6FDheN7xk7ZxKyUfgR5pCZFUObyu39ZEaLhexG2aaJnx/qDkfun2H8jGghglFjbaBm
	0qCLrQok9zEDUBuWJRqragGT3PnfEcGOEZoXNZics8tBmkdmLGEvJuSTu4rwe3M0mfjP2uDIx4g
	vTyA==
X-Gm-Gg: Acq92OHzUaktDwdTI60n6FPRNqiFIeOBlkhWTiELnuCjfZqt24/7IV3Pmw/tRFyoo2T
	iLRQaQt93vakiBLwsIbuCPIUMFuUJEBSLgrcEsEi1jkXcUiesmSuAfQS6ExWLsoidb31XJWtmeW
	02BPR7k0ulPM1pDLzscsIOTCdxBrpCJNgpJWcZ14+IjEBoObTFRPF9WtS/Ll4DCCeGVrmAKL+iZ
	xBzcIVE2v50aC1sDSYfoxRsRhLQKZN0OyZGTBKlSxxgiuWv0ciknmsMk5ImkN6JQ54lHwOeAT0m
	cUM9D2aU3qo4/riCjZfWiT8BN0z+3df3qMo9Jz5Bv4pfXqf5tEhT5jGjATQUCA4qhVar4JPl93W
	mhGqfuGxX5Tu4+Fum/fz8mPDEl/+/Udrjt4DEQUiNhU4dfCsfbeJYs/nAyxcMXw==
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123080655ad.29.1780320642780;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123079815ad.29.1780320642277;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm143718315ad.7.2026.06.01.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:30:41 -0700 (PDT)
Message-ID: <c1d1a8db-9cd2-462c-ab6b-d14eb97c644c@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:00:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WKcZoKS85ojzK-D-V1bJRrRz3E6oyID-
X-Proofpoint-GUID: WKcZoKS85ojzK-D-V1bJRrRz3E6oyID-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNSBTYWx0ZWRfXxvR1DxIcYf1Y
 xpjEsopT0Fn1wX7KoQVDl7tYEdLvoxDzu9b/EF1FqzDqxHkVQFcr9sA6CSixh0RVAkL5B1C+cWE
 H4pZFV9z8mcTqNk0bBIlrdpCTutX80E7iIwrOlF92Ggtj9TCEVG20UKeZADbqg4lHrkn5GO53AJ
 MkP3q3KzTtRE4sqDM1I9A7ILqwh1Cv15ZQ8xqofk5m30mo3VCHKXoyD4DUF/hu3p1gSQlE+DyY1
 txnf3jnByIQ8lcTGDPEMR+HacL8SaRyzzloxEhRZO7vP8ypaEXNpRBHwcqEbYn1u8WmM467L8fC
 snqYByNbTxhejIAg4aSNVQX0RgFyCg7Xz0PeBjIW8yoYsuM8RxdAW0wrM1uugxsD3VoWA8vUOZk
 ip9qOXuDezRZx1J7ztCIHpNb5m3M9KtkHNJFpPmDvBd5ef9XLInyjwReWveV7/S7wpUnPAv79YS
 +SKcrKqakefKXIs63zA==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d8984 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=FPLoCuxg6rETm2Q1RYYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_063047_019358_55AD20F9 
X-CRM114-Status: GOOD (  14.09  )
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



On 29-05-2026 03:43, bod@kernel.org wrote:
> NAK - what is the point of this identifier ? It literally just adds a new
> define and a new string.
> 
> Unless there is an actual difference with 2290 which thus far we haven't
> see, this new type is not required.
Understood.

As mentioned by Vikram, Shikra will use a new compatible string with 
fallback to qcm2290, similar to CCI approach. 
The CAMSS_2390 identifier and the driver changes will be dropped in v2.

--
Regards,
Nihal Kumar Gupta

