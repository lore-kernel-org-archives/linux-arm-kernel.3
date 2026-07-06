Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64809C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=; b=kpFJXcBbXW+NViJrQk9QyoIFTx
	yG/v3s1OhgiGAeObIlxNgtAqJuF2PyzkhyRiDz8JQSzZlnyiZzvep362LX0s6+SipSD4EjeUpCt3L
	CSpOJ6l4nh3WAzrFc30nr1EYmfuMNIKCJuN05IcrX+JOA+KiP0lA+9S6/x9/LMF8OroVA19ePwJYJ
	Wsv31hEBVsthHlcC5vLHbopc//BYNQW6b6PWga/ShlML4t4S6Cr1kVXm5QO0T9XqXE+KIX0anleC6
	PBMsz4v5Bsgd5UgXJP+KgDEwWX2DaHMEeho10s7Kre0kPqLQNdBWql/byWcPL92Rbzs59f6Vb483S
	tPrcsD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnbw-0000000DHPA-0InQ;
	Mon, 06 Jul 2026 18:00:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnbs-0000000DHNu-3ueB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:00:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFGwb809794
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 18:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=; b=HbE4BUF+JP5HvsOH
	TUKHWFnaoawF8heIFUT/IIq4FM8XW/D04DwpDZJwj5bjSQjbXXFDwJ7LavT8ZJ64
	U8Rzn34m07DGevVyriMvuKnFGtjtJ8ytnM+aX/FQctoYhUJObkFbAyrrc42FCQIV
	eb9A3k7/l8GcEKgeWCPlIGV1KupaV9qg7Kc0+qOxXhev9/YswcP6qR+XRMJK3fCf
	EGFERZuJMh0d3lC2LgmXhqpRc1EYiDOY+3KJ9hwrVmfapmJRtTa3Xk/Kbl1Mrs10
	DTx3BqahmdF0LiUQChVgR+di283RP99+su/TkuUjioRnmOUNMLibEvV/fQZQB0sD
	HZF4pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsaq4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 17:59:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e7ee64b25so550332785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360799; x=1783965599; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=;
        b=EnTq6WWltuwrm+kmrF9ssYj/60mzoA6aYXpNbNWbUnozVMy3FK88cf8j8eAOFU0MnU
         dIMy+XNd2oHoBnOPcP/QIVPv1ODQeQKaG1PT5xttMvOO1ZwOQCUwhCIBPoztBtRU4VXX
         TWePRSPUWxDSILa4K6dYt3QnHrqKOcWbGmqk0ROqRVnBwMP85WfC6ivz8NKEUVY5s9y2
         qLYg3d9ynZwT0j+UszajKU/FcYrwYRDqnhxFal8eWYG0t96srykR+J+NSYvjt67juXjw
         rboFgudh93ieV0tIf4zCWr+jsDD0bEWBV6DB3nH2xQNw6IEDQgeQ2AxUaUPIJzMosqbL
         GVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360799; x=1783965599;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5qKxnwNnijL35wBY/5TxND1XW9OZG6uhFE5TtdC5mY=;
        b=YKkA2iBfIQzFdaUTgl3avc8jmXBqb9RpL8KJF6aZ56L2NmjS/m8M7yg+eubzzYXNkM
         1HlqLXvs9jgquE25yw0Xnt8FuXzpJf1QXpUjotBxKpka6Z0hfLxfFW39KICum5pB/u2D
         VTep+D/0on9CtLom+CcA/c2USZiicrdSJ/Uo+8hoD3dRiiK60ObQB6Kuz2xwTdgUpttj
         6j7FjNGFS5qqZ/LMJxYDcq9aH/F0Q/is8vwRoI445xAcmiHfATobtVYHcuCPcNJ82O+7
         q1TDRJWW55vd/iXxkwBEHR4IO51xEOgKgL0mWDPIfp5uYYdjwk86q8yFcRyN2akAdZQd
         05ow==
X-Forwarded-Encrypted: i=1; AHgh+RrzDw3GS2W2BUbbHcJ39QHG5Vuz9O0Nk5fFDKdtnVfjVugR/EzCAm2POKB6awa4Y095WnlYKoebFds9+oYOOAnz@lists.infradead.org
X-Gm-Message-State: AOJu0YzkuR5rd5pAWm6HHBeb0FP6HBLfWKfgs8HH3pNDL4n6hvrbDmFf
	rf+dCUrM/jrHybpDfZrm0YGTTvobl6aU5dQVZHdwWf8qdcvX2rRYOeB+KitqVx8SeR41lS/F/MD
	Jwo8Ibsxz4HhhjxzS/fDbLtvQc5gwLMBV8/u36vYbv8e8b1oGwOaTElpOOEjIpgI7R+HHFwLe6c
	JtEg==
X-Gm-Gg: AfdE7cmTkcTKSnCQ2RW1D4MqO23g2+Legv+w0pIF4InkphXnMhwzxwH0XY2fkXeJKqz
	RRkMwdjuk9b4+q6PKma7ELQZ/kvufWfYaQVeg3qyXuWjqaQlFPsvhHPIDDMT0jnsgQ49ZtmiAXO
	ML/N2TWxHKDyhZ5/hfc3v7s6CkTrB2qkk3G0VK7O7FaprWD/gQLnwkS9UwF4z/HAuHSqrBvN3Q2
	gZsM8kr0oGaFhshqQQ5d1a4gH9aFAagVz87ctb5G/k/PwrBz+nKukHl+VC+4ZYvwumJnpOYdb4S
	qoMhc67nujiymZYAT/IktjNylfAAhAVa7Vi/pvq0R6GEec9E9DCUaVyn6pEcWjMRcD7vILmECah
	7WDNPXpSEXZsGJcAL6SEPVUw3C0FOfst08Pl1KA9j
X-Received: by 2002:a05:620a:4041:b0:915:cb40:f774 with SMTP id af79cd13be357-92ebb57f369mr219619485a.31.1783360799426;
        Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:915:cb40:f774 with SMTP id af79cd13be357-92ebb57f369mr219616885a.31.1783360799052;
        Mon, 06 Jul 2026 10:59:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00d2sm842545e9.6.2026.07.06.10.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:59:58 -0700 (PDT)
Message-ID: <148bc671-6d3d-41a1-bbff-538deb1ee022@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 19:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ARM: dts: marvell: kirkwood: Correct indentation
To: Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706101859.341467-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706101859.341467-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T0cWlhroFkDjWwxXQk_HVHdtvcjNczE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX7Wky82CR5yMw
 HKv5lf5OtY8Qm3KMgBM2IYorTje5F1IxsJs+g5JyeLu4bd2a3kWoKA7Oa2NqkSnj9DeIV1JXv6g
 /h6ewG9j38GgYOBTrHRhWD4v7hWkPXMydj0xEW+VYGmx3PlY5RD4ZcxEHMk8S4D2d07sT92O9CL
 KW4/3WODX0GNYrXCTliv5HE+Ef3jdY0VVWgwAb/zj0Me/n1nSUkWOmf+V4RaHdtznehL5Yf5nka
 /GJwE8oluKtrpO3RD7T/jrce2LFSuNfBVvuUhi2WtrsyZm3ZhLOzN/2niYzUI9m7oAsdg6Vfems
 qZQyRDNZTtKo4m8ruAI7G27liSbpc8m/jEoq4i4Cw2TDQdWnWAYm0mc1PY2UJ8yCrSLy07gVfGN
 BIgz4eTGUdDMO4m7E3REiSyXLQV4s3UQxFR79KOZJOGBb++fRyOXqmtOBEPNtmDj31Q1+t5uOEw
 EJ8AdEDZnxg3xMenizA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MSBTYWx0ZWRfX9M+dQFU3cSF4
 P+Hkt2aTqYQs9L5vFV7WYOMZzMTEv3yLb7ufAP3wVtF9SgfDmtBdJLG+pdFvn+eFg2pUDL/1jPv
 qfC3nA4631vRAhbfm7PLW7OrMKOZZoM=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bed1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mqQ9Yrk4-jIDK0wGc0AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: T0cWlhroFkDjWwxXQk_HVHdtvcjNczE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_110002_498809_1387F481 
X-CRM114-Status: GOOD (  10.04  )
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

On 06/07/2026 12:19, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---

There will be v2 of this.

Best regards,
Krzysztof

