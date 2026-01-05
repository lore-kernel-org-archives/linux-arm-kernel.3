Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7A0C79F9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=; b=ZibOb9TB+5e6BlBsVZzwLUuECG
	u0SLBEopwyb2zN3STNDvAOk8+BNNV6f6cl8bPs9Zmle6kRYmL2xytanKKej2rC6FfWSaJk8zcAojW
	QVd6G/mI1s9nLA+93g2eEJjPXOwRcHEm5Z7mLolmqUNNiQWnX02lrlVl9dHS0ULPekL1kZEy2UgYt
	sahAzWiYNGXqQAaCzTjfh4cXYuP0m855J8vKvW3EZQorhWpuJEqOciIYxJQ0ybb5/PmYe7LHynLJX
	b4z+EF1j7mo57Gdentg8d0iB9p1mmYTX2mitLiCJMZ0U4movDcPxHopOYQukQzZPbM4sGh/2rPnTG
	p2iVHt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclil-0000000BYQh-2z49;
	Mon, 05 Jan 2026 14:38:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclij-0000000BYQK-2gJJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:38:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059eS8p3542060
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=; b=Sjz5YZFkbaAgPHjf
	Xr9nC2IK8gcOosOfbQR9gmuDiLdzRNN5Gn80x+bjHA2o3r6yQdPWewpxp4r83EiG
	Zv1au6np+62NArsD3ELCAopT/5HYpXUqLYBd57s8/Y2kwb0VU7Pu6Ib2+scoeMjc
	XQ1fybwC1yz7qIJ5t64pYUsPJj/rMVzHYBdCnIMmcihLEuaSzveP3gHrD2aD8AMu
	yaRi2Fi5N/SxdCuFh3uQ8TasAG0N4yuZjqXgZstePbkeYhoU/5Ncw1paanNhNFop
	+0wyqVHuwnX7aqdQz0LZLyqB1xqVKdCyo3Tu/zH0LuE+AgAl8ObPt730ZVAf1a3p
	Hv93GA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shsyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:38:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edad69b4e8so48975641cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623888; x=1768228688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
        b=j8eTsZsGTlWT4CycKgSl89L4FBNJ6GAvSvmnV3xSTH265NLrS0t6lDSm72kg4e9kab
         J/jPnaEdURzqhumBG2FY5v59CTNM9X2mplF9LaWPKJDu7UN8H6TK6wMj8yD7qFknHeCO
         0n1iDPXhdQ8mg5AQ8Pmur0yvqwiLMZLaVPdKC9y2po6k/eqT9gEaDw5UmQguDChQz1DR
         ESgcKwKty8o7nsKAp0+mc6ppQLGe8ecJGWTWB03+kEL2d+rikKyymkNqTMRPLxVTVgdr
         biu4+rlEjNaVM8M3yTp5r0+ZQ020DLgZM+NY356ZS4PDpy/XkoQgag4Bsjh+dPJsigUw
         5WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623888; x=1768228688;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti6doOokkOuf1fU82BjOqYUG2AtLj8E38n45wx271uo=;
        b=DTSi/otZ0qdZY1LK2BHL9Rej2cX4u/EfyEwLP9uQvZXobETAeswiFjdo6+306mQHKE
         kQqHzAL7uFoIT7l/D0yionwFeDLJXI+l6ryE8t1AxM9ncpq3LrdKF96zMIywa9RJItH4
         qc4UXwdEfYs6xQ1SRkgZVrH8XbcXqGbTj4gwz3wrxH3utuHMOcWZO7DkMWMvT/gjCScz
         DsaMWC/kRTev/KEN0blh7yq/nYCggiSeZCRQp0ohEtOh3tFfXwZghNh5378yT3HcCOXU
         UfB2YJ/zUOnKzPCVi+dheWdHlKGr/5vcB/SnGh39yFGTig5I7aoB7CW0cE9zzvEKcxW1
         haGw==
X-Forwarded-Encrypted: i=1; AJvYcCWq+zBBzUjcKwYuw5oHC/C9e1Om4oVt84RFuny4dL2Wxy3+yLS98doJfPSUJ19ugm+DxKxuiKMF2IlwvegrB7lo@lists.infradead.org
X-Gm-Message-State: AOJu0YzxOhyCKLKJ/edgkFeHLCd5Uu+n90AKC7l3L8J9eZ0JHPejOVxU
	aebloRLifg0tp4uDhQHSSg1CMgcYvmFUP2zJ7iHrsozVdLnZvsp0aYRtgnG0huVXwf2DxYVN1Bh
	kgLnP6uAV5HDsu0Mv0wgk/zxouQtgki9M2nK3107rDHQFoz257IoM8sXAPgqc93LfflWhWT6rcf
	1coA==
X-Gm-Gg: AY/fxX4fy/z4wdn9f7X0VzK9Zmb2Qm4k0LkGYXIjFp/FkzZNTQNlMiHyzZb0e7vaODN
	5f2XHD3WHdeIcTBbFtR7lmw8rlCVgp03xPeQ2Y7LZ4Sq6gLtN3PufT0cYd9cmtTrCJtb6PLsdAY
	EpqDFrf+EJDtpsri2x1cHoydmFt4bMUq6dbsxlwRufhLBbfsXX91MWaTPy0g/KopPgl58kNz+PX
	gbCcW/toF38iNlEpM8tat3I5DuZpHT8heLxz4Ixnd0DKYSAGiCBtKR08luBTNRs2b2QnCD/GPDp
	tf0a50IzfD4ff6SQnokSt5F0tzPMlQmTXcZ0PuGUKzgk1Srehun5tF3UNBo2PM8Q/iFHIjKdOds
	2P/ehNVWhhaaZFv5FUPQW2HBCvmEVcxwhncVRKQ==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id d75a77b69052e-4ff4508b502mr108113121cf.2.1767623888145;
        Mon, 05 Jan 2026 06:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgicMyDjA5PM/+eqsrIBwMK144H65yoEKhRKChcbGfAHLmAZEHZwjzOBn9OnYAC/WqGr9WyQ==
X-Received: by 2002:a05:622a:1188:b0:4f1:bd8a:9fdb with SMTP id d75a77b69052e-4ff4508b502mr108112691cf.2.1767623887721;
        Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267a5063sm3411466b.69.2026.01.05.06.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 06:38:07 -0800 (PST)
Message-ID: <715cb873-6bf9-4902-b586-f02ebf5a611a@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 15:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] bus: qcom-ebi2: Simplify with scoped for each OF
 child loop
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bccd1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pJbpxMvPcy3AeZgjqcEA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX7gKLhf7TGm16
 zCXy37K7pCEepd8DNsO3VC+QyfoYGB+9InHOXz8WSROxLmD+GcOkJ/Fs+yNs3qleE/9Epos6oDz
 AX9lqx1QeoCS0Ph+8krXiSRF/ddjiuIZpLvyjnkooAax8lmYlGo+GgRxv0VEWl85H5pw7uMkF9L
 5AZ3cZHfECFatzMj6aOC6FEyULx40qh9b7dzvbbuJhHrU3FzanhQDPbDWr6EvXRLiMLJV4xdfcZ
 /yqWI8dpBxwnPYKZwFe/ynPmsQ/JNwVzbnNA9QrOd2mWOW6koeJiJNkebwjvXozV+wpz+X1kmQl
 0w1Jv7eGOc3Vr5tTXS8I1zu02jMNVgvFJcIJQqbSStSd4Djtd8MDg+u3IcYMzAwzc8LVK9694pz
 wVfSiSHr9x08k+UHHuG4PY/phoFBdjxDoq6uYTNqdx/7Q1eATzPpqZYjzCsN4Eq01R3/nNvDa0a
 GYPMY8iCIBts2uaUXpQ==
X-Proofpoint-ORIG-GUID: yJgA7i2qlTQYxX0mLgNgzg9AMH-jcbl1
X-Proofpoint-GUID: yJgA7i2qlTQYxX0mLgNgzg9AMH-jcbl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_063809_689362_E620202C 
X-CRM114-Status: GOOD (  11.93  )
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

On 05/01/2026 15:36, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add Rb tag
> ---

Please ignore this one patch #1. I am sorry, this was already applied.

Best regards,
Krzysztof

