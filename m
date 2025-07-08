Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=nxi9FUa8VQqwnbVv1pIpLupBwI
	AzFcHdTz3sYw1/nG/BuMzaqFxZ7GfRU3GxFYacwtqZwkrBvVHrTdz5bzgNMz6AvmDf4WpflCwl2/t
	R6UaqqAr0S41LIjdKb1Hb9J7Mnk8ELi2Xjg8vsb/4UlbTl9pylm3DIzB6rOjSeLB3wv/AZB0rfWXl
	C9M2yTclIrk2Rra5Y/LUN4QPHPnP6wNiGiGMa04FJgZqeN0Ha9Z3IW3AmOiM+mTJl17wf9oWTSzQU
	7bvaLYLwOtVnCJjO/1xmeWm8apTv/q7sFcfJ2z2szJPbnwrZahL6WjhaoAfazDVmanMTWLLwGTRWc
	vqeiYViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8FX-00000005PIT-1beM;
	Tue, 08 Jul 2025 13:20:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ85P-00000005NVU-1NYI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:10:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAEPq032719
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Jul 2025 13:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=CCpbj28qOrmF3wr+
	ylO4OFXys2TQmkJ2Dmul5uQ3ibyYnDGD2l0rIL4VZTVNuw8+wmsDZu3FFUJvqWIO
	cuXSxQSHSNviD7IHV6qCMxAVfKjH8zVK+5igRyJeKLPbPof6oh0ONw2W4ozKgEI8
	9y0n5wQyvwQIO76VfJD3Rr9DFa2uw483kad2luphG4QLnlQMa0eKAs6JlEWZe8Jy
	qtmkRS1kgi0oS/hxsQ7biMretS3BroonJXIFUxbf+edCiduWrqE3DtFLh6O5iAig
	frEXKZkN1FvwgHY+yIz4yJp9C/kg605PTA4wJFSWG68kYhP8hJd5VHPXmhes35rU
	Btq1hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrknfju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 13:09:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso43312185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980197; x=1752584997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=f5d4mfrJg8wOspz0n6/RQXLuoDIm0ujRThxWlf2JrCfojSRKVOE8YaIFyQM1ICyGDa
         kYYtcJV6wLynW3Joy0kzidBzVletveNBypLBvpfxWDjydz40N+C5IRk5YeeuN0IajvLH
         MErM7EfuNLGfQ30N45zq8erpjAtRYXh1OtOmsIv+Q40rev8sLMUN82U0Ge+ttiMLXthS
         IvSm6PX/FgpeIhsdNAcnbxSCF0QPCnCvEW6XVSJvmuLPwp5PWyc38QLtWpvjLIw2dYkY
         u8nJ9/v++lDqiZ0uQA1yqk3TixV8DW1B8sKRlkj0u+3rqA0dSNNLhw0Zsr8me/v4Uejz
         M4yg==
X-Forwarded-Encrypted: i=1; AJvYcCUSdEoWv8s5gle6HVWtyqiWz61DfvKPS6J4jvfnnR29yjoq4Z+7tGq2NFJ2lmUgaypIkeqk1iD188vUi1Zjgunk@lists.infradead.org
X-Gm-Message-State: AOJu0YzHnes9R1021HjsSDBQuMc3OhmxSKFJdLlwyZ+r+0axUzkSx4dm
	crxt0cAj4Ln6aK6w+t/p9WGvP5QuMSrR/YGXFwiQyUcI12w3gNIUvrQcal3Rgxo14tZQvihjDiC
	NksHOs3eHUs/x57590JF4Ef5L+VDkQtNW0anfynvW7LlmSBPczA1okYWgdFDnWGZK7K0VSv0X+S
	cKjQ==
X-Gm-Gg: ASbGncubUe5126cZSzW+GdEfMseoB3urEJqcrqODJh1OaT4Dv2ePwRStVsI4v/h0OUk
	CIMYHp0AalXwfSPXDZDYXwRbp1QTyOKAUg7+tx3CDz6229PtyBDK72mjaSfkNHPznwDXo/klkOR
	SNP10ewwhnVozwPOsgPpjjIz47JnXg9I8lDp2n+OTsheQ6jkuzt82LheHIPuVXUfX0FpwlsKh29
	99FB/Cql/N8c4L3tgOGbJeXW0gxqG7xQoOxCnowSYdf0tvCWL0vqY5LiqmpVJM9GnQllVn/DAZm
	8exIbEoXZ+SJh4AYvfBM125lsPLpOcrB1zfPxc3F0N7W4T8H+14DfTZXPQZB1heP5Px8l5OHMHl
	YNQU=
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978558585a.1.1751980196559;
        Tue, 08 Jul 2025 06:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2dYjcZuaIWrO6O8xk1UgLVaTuTICWlO228fFZW+hQppHyMeiJyzzbcXYRDvSDFCu/Asg4pA==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr978555085a.1.1751980195907;
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb2f890esm7151467a12.61.2025.07.08.06.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:09:55 -0700 (PDT)
Message-ID: <52dfe364-9831-4425-a2bd-0541286b4f74@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: qcom: spmi-pmic-div: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-6-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4-O32FtFpXC61aR_9T4Tbel8j0vCSecU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfXwahHRpBt0vJf
 +DGYmrA5XbUoxJfA5PFzq7KEaNIjVjpRRehnGKcFnWCcEmT4jlflP45DTkbgnd8I/g+P44wEOYQ
 iuSHSwBzBO9pCp8nReVDILvv0f9qKNT8WU17S4ZUxMf2aEooQXJ6fNjWIytVfcRe0h+VAKxSkUR
 /vUsi4qf0xC64HwiK/CvvPFNZGQkUJdeO5rIaWJmNgqtfSkXy8exjxoU0qsHmnzIrTcFoAnGrK2
 uVd94IOX4iNz5URIahiGswcMo+FuV88wXy4WwP7+ubbPmyStso2gdv1O4vzYelKCjx6eI22OG/l
 cM9mq6Bc1ZDgylraucvpgRQvql2sk8Vini8JLnQRbFy7mbM+MIdu0mHjSfAW5ojIwvGTFqTFfHE
 F2ve8wqRVFZL+fNPMXaFzLDpvlffvs0KTA0r0LvS14jRId6x4f+4oSTLpebrTLYESCZAPuKa
X-Proofpoint-GUID: 4-O32FtFpXC61aR_9T4Tbel8j0vCSecU
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686d18a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=849 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_061015_367898_97394E31 
X-CRM114-Status: GOOD (  12.59  )
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

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

