Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30019C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRpGpu4L7njGKrZAm4LPVjfYmC7MPX8emmTGwksOl+Y=; b=L6BkOEWQJlthhrKf4xSqSa7mlV
	7ujxxVMzniTIA0UAZ6ayOTLpLYvDK8Gfj+9I/PEREeFtwKR1xL3DqV5RtepOpiPIahi7Q8NABoBlX
	7ZWl9YxktHqT4I3Z44nwL7xOffWJoccrGr2EvJGr+wfk9Q5/gqPaXVQzk+WYOcVXkL64ccb2HWyf2
	HUyNWsAGbCV/EbW7gSPjdQzqedZCFD0QFzwhK9jelMAturC/kFr9kAIoxJtyiA3q2tnzcPSumTEAF
	ZS342XHbbLpbCiFo88GrsfnAic3SM2e4mo3hXx2hzxYdc6etR9lhjEsjWIUGoLCF43BLBtw0ogpeT
	yQHIpfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySWu-0000000GSNi-2M2k;
	Mon, 24 Aug 2026 11:07:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySWp-0000000GSMf-3mIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:07:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O993CG1377990
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRpGpu4L7njGKrZAm4LPVjfYmC7MPX8emmTGwksOl+Y=; b=ojum985CHaucqlo3
	csKOLbyg3UklvxJSS2AUhhWHKKTk5umUiaArXncU5E6Wd5hyUg88tL+lWSoj8Eyn
	KcqqBo8LpnUOqOmCWH3sBqvhX0zNZhR/Oum1DDFtstGKJWoD+UiluJzPf/jjB0PP
	BvTNqvFhGBhK2xszeFaqu/hJcplAyVt3VqRNKNE/xR6OfL0+ogwFjGretAJVRvOW
	wrf6sNoQxW2tF467JKk+uR/y7ArtojnURrqSigiDroxhv2eQNjATjdyC3YlJ3OX6
	/WFrN99pfWYB6NL9JOLHfHhWtc6xrZTcd0qtc6DtkiczJuBb/z363+ITm13aIhq+
	nNROAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf0vak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:07:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484ba00601so3800561b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787569665; x=1788174465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRpGpu4L7njGKrZAm4LPVjfYmC7MPX8emmTGwksOl+Y=;
        b=NnP5980azFoToUtl0JUvEr2XxfUF53AJCtMPAE2v4jemavYde9WL687y+V85ihvgyr
         K4fTL4FQYGxpTVFK039jwkJ7PHxNl40UfB16n33opwDl+S+WGw1FKbrmEDGEwo7uAQt+
         XmNuJg0BG2KH59bvRAphNDpuvgH3/Qelaf8jTsjOq3M06sO8vVxxx/YIdHCrH8itWzRx
         p0y5j/RCedRGuMAWX0eh2tWe6qjNm4blvNnQzT9YCEU60W9IIHC2gPZRHB8sZS6lCoPP
         wwiulGyVeoZJvTmO/sOEfBKj4rrwKd4J6b3J1OId5s36Elw0Bi04YIEJmUGPI3mWKBd8
         FCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569665; x=1788174465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRpGpu4L7njGKrZAm4LPVjfYmC7MPX8emmTGwksOl+Y=;
        b=QZ8YP9hHs1xTqbPVAmoa+Zn5N1a3lQfSdCNfy+msHFaidMUzC3w4XF1XUfPf+Dngnc
         RpAmv0Q+fnVBnYvLxyQUIpnL8OtiI3/3NO0oBr/9v3hgWW5tqSOl5CIwqImpppTDV16o
         6EPAqZfhPA45/8YaBEWI5Z55YsKK1iOFEHiFS0+/DQgonoOmoUo121PLdPbftm8mA9J1
         GimsQthYRKZ3jGcqGDFwmekAwjLHi5EBeCUmEyRVq/KialZXJTIM2w/6zErpALyvlsah
         Z+ZdeI7oVMolvS81sznMksLENgGYtaGPvZg37/47aR2pqO8k8OKJat1b6kZWVLiiRw/n
         3DLw==
X-Forwarded-Encrypted: i=1; AHgh+RrDMI6UTpyx6Me1ykywS9YVGxhVyM/FeGKO2C3Aza7wNwEsBmXvemOi2ibrMe6jJLK5xRLdjxPNb26Lp3+O0Seo@lists.infradead.org
X-Gm-Message-State: AFuF++n+BLrwt8KXKRknc+YbmwA2mYFBO8M2euQqSDsDoJcIX38vQTZl
	rmwmyk4kozHCnJwJtat1lSuS1ajOWBBC5PVHXWgKSYPo4y6zQp570N8TsPgnh0M43LduCYdGCXS
	dy/3+d6jvV8jM7CKa1mf+UVudAvyiENEZt7hxtq2jcK3DgtC+r+K0Xebwn/G1Wq2RK6jkn0m4qq
	Rr5Q==
X-Gm-Gg: AR+sD13L7wj+rfLdP3PLPlP1BAyBk51K6CAHwHjbIggqtTaB6QYN3EJFoRSR+fSZO+9
	+g/NLdbM2fwrVVOUlBUOCsBn5wTFgmRCmPb6eAJ9hGzOD/IHxJCsn7NNiWXjrt/Xb/cbAMYcltE
	zEclqnjB16WnDWv2RU4c1NDAUt+WXNI7GDC1rR0/n0BPh3GYAqms0JNTn2zHRUM2guKlRvEtecu
	LefTDPspGALKKH1Q/yNW1CI7hS3bmG0spWalaWmIEwLTZP33tAtI5lQ76r+YCwVjwR8ea0ePw+d
	+9BXc2lD2guAkS4Yoq501Rst8SbITBrU2caS5QaZ+VSrSSezfb5NhCOF7R5N8O+zNwDP1owyyge
	GwvqqigDPKnco7T8bop8uWaAzfr6MZo5aPuU=
X-Received: by 2002:a05:6a00:4145:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-851f9a9f0bamr43921516b3a.6.1787569665302;
        Mon, 24 Aug 2026 04:07:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4145:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-851f9a9f0bamr43921428b3a.6.1787569664916;
        Mon, 24 Aug 2026 04:07:44 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eed88f8sm1864508b3a.10.2026.08.24.04.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 04:07:44 -0700 (PDT)
Message-ID: <a165c890-16d6-4d64-ba59-fe14435e0a7e@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:37:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MyBTYWx0ZWRfX8PUXUwZ2hj/P
 a/P9iNftbkOTLRLbHnapKEiH2XXOvwLIIRb/H6R/DLEqNIOw8QPtOEXymq5lm9yUskabckN8bYf
 e9f4OibztfglZMIeWpeqIhvNMNFFKWQ=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c2602 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: GjJfA4MYL7U9U-VrVnpj0J9u83-t3Ksc
X-Proofpoint-GUID: GjJfA4MYL7U9U-VrVnpj0J9u83-t3Ksc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MyBTYWx0ZWRfX2BXM+fyv2KAr
 AmzKuOo6jMEMazBcYwsg9BihiGM7wpLJzNTYzm7kpl/n63dHaOaIRC+98PsQwqqQv3j5nAIdrxo
 g/PBa2O5a5x28BjabvM8okQqV1A3wEd2jJKNg56GiXxDCgDupz+KQjEkk6vqYMCQR3canPBVHUz
 o2MpFa+0lyl6VX/6ru2QkZWwlOktU7Td5WNmQCuX02rxWeVe6h7cED5q0wO4arWfxAe41og9nSP
 89Zg+E2mPi6M8Ay2BN6iyY9L+9YP/WNLlIfRQTEqXcUCL2NZfyBwN/u4Jy0WHrDTJLfnldew6Xy
 5vaDU4KeJ2vcZauWth2nI/T3ZUXudF7uISQZ5+sZrCGobX1AuZI229sDO501bFkLhMPRTghViKQ
 0vkx9pOegH/yC4SsN+XXkd7NkJSDbuEivbL/nLOyHrYh60blhtS56gT+VKQC4xsKL62i7uFJc0j
 npHPBtiLF4uyI0v34Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_040748_061305_BF0A754B 
X-CRM114-Status: GOOD (  14.24  )
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



On 8/5/2026 1:27 AM, Praveen Talari wrote:
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.
> 
> Introduce geni_se_set_rate(), a common helper that abstracts this
> difference and applies the requested frequency through the appropriate
> device. The helper automatically selects the performance-domain device
> when power domains are attached and falls back to the SE device
> otherwise.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

