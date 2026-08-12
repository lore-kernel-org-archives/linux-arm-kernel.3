Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB7CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoWQNmzdMYFpvKQY9KEgGN7hqNjJGc5YN/IZJKFeWxY=; b=Xc8BGBMsbuFVJ46K6HFIDIwqIE
	rfRHiLysfbY8LXwcDUBtV1HbNlQEhl0ENpcJDPihyjmJNUts0dLQWYqZMvz8gaKqy09fJh7Ugnz/Y
	VKDgFz55N5DnRyZhES8ksDYLPwQyN3I6lIlnK97X9vn1nZqGOY2x2b7+15690PdwjglO/4CwDs4ff
	+vagshSehD6JAfUTmOBUDP9SOj49JvBV3PBUzsxM1myqInm//zE/Uk4htWjttYUVENOTCltNONjSJ
	o9W0SRALDELlc/NpJWQT1VpL+PARTfAmNKEWMMgUCdug6Ifk65u2hMWo8Q3DpfoF3j7gIe3ig/xHM
	h2xSDHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2vC-0000000FY15-169D;
	Wed, 12 Aug 2026 06:58:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2vA-0000000FY0W-0ra1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:58:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62AGq2646657
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eoWQNmzdMYFpvKQY9KEgGN7hqNjJGc5YN/IZJKFeWxY=; b=Q1sNzDbVpF3+KFyl
	58FlpFLdlRjAH/5dYPXCZ1NYG2+F+hekOA7Q7oJylgeN3YUhew3ZA3FVzUiH+5qK
	pa8iXkc19AWujB3IURifJ18KaYuXVZWl5YakTQhSnsp162mxRrtYSnFuBf6Bfe8P
	hXZFijh3ILg17+UPTj8n4RFSwkbEsoYgEDZwxhXYjeSGLL/ISX/Deokzxh8CvPKI
	yQloxhtMOvyfAIpkJvlKuTIVpTprwpEv4p7Ne+0r6sEe1LmAeVotsjyEK8cmXB8l
	Doivkx3wUbRCG9GRXvHf4bugUM5Q+kJlt/sAtIOAzSwkrf+6WdJLX0rcFD3/EqPH
	pHXJ5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049km09k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:58:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1366151a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786517918; x=1787122718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoWQNmzdMYFpvKQY9KEgGN7hqNjJGc5YN/IZJKFeWxY=;
        b=OkouUv7er/UXXjnAAl3OQij7VQQ78PlwlY7tlaPFADemN3bv1ts8F/b6lf6kh6gr0/
         9K2sQPVRqG3QjMZ7+G3MZmdrvedhoHu+HMEb+eOdfYZRViFKSE5VV5Rt7c8bFppl0y7O
         kNd9rYMT2ZFJinSkfsvpjc5PpBYvCqrNBgfUiE5jHPTWe3c8cEKg4m58k1Bt/6KBp6YH
         r+uXsb+tf+tYN/Eqbyb435qe5iYBcQTr02GgTim2ZIFtjib72NFYZqw55N/vS1GJJBAF
         I0wdNS9fFyxP/vK8CE3mX4KIxFAgdK8pbTOeeKyPlNK3Gz4/KbRAKzSZVofMJJLHNTOW
         3RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786517918; x=1787122718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eoWQNmzdMYFpvKQY9KEgGN7hqNjJGc5YN/IZJKFeWxY=;
        b=q9UyuUpDNinMkigKrAzhzigGXwOwtHNmBEmegTXrl0eTaMR4nMfeTwDgvIl42KwX6v
         G3eTF9C4dFpXDiEYzTAsqsgkzmspN8xeze5abDwmcZFEdMmvQ3yqfEHNTs+PMvLh3Ebq
         lsBcH1EDcSgWcoAHfOZMey1gtjkIZal8Qvvv/S8yZZlmX9za553EzTcyQIcHtHWiQSV7
         XGeB4i7+TFYvgW4D8NXCaLabL41Lq2m/8kRGtG8RpVDYfXIqdgU83ysiQfsxPC51ZTZA
         xR1IFyJR3Nx/TANR88WGzfu8tRE7LNDS3pKdFL+S+7MhzLrdi5zB1wKvtwJcRMVSS3BD
         HUFw==
X-Forwarded-Encrypted: i=1; AHgh+RqzKjwMuGwQxeA7+lsKcefOFJrzZaX9bkB1pyA2j0sorGbFUqg4TZdn8R/3ZQQ0xbfDZJYTQCSWEAyIW3ESS1Sj@lists.infradead.org
X-Gm-Message-State: AOJu0YxQOCy2jP5FbLYi5AemMECFtGBalQC0NuumAMsxa9EB8q6sZEcA
	s1qFmbhEkhppF6XrKgmQt8WdtxoXVNbK27m6IW9RTqVUqiU7i4qgnHwOOfm0VErwUotBtNA9GHL
	14uxkZc3ZClrJG1RR0k/Dqy5RsjvlqVzwviRl6XR4xMFxzuNMMn3ZCfhADeRes5yR9zrVaMd6PG
	xOCw==
X-Gm-Gg: AR+sD12u/b0hvd1/e/IpWNOuezIr0ES+lo+ouy7TbNQfHmBuxu6tpfrg2+/+LNa7OQK
	MNiQOVgzKR+XZCxVnwKY+MKb+snJg/Agxu1QZt6XduGGcNuTgMIR1r12Zy4M1jlTQCXx6wVB4zU
	8W0Ed3kWAujgEKLNylhNduA4VHiHcNba3ttA07oaNDwcXbYwAYYIR18yE2PHP1Cet/UoPa6UmrB
	cWluoIYKXewcQu6vrRW7a3AExjWShj7E2TfXGI7OVtsgzqYp7fKFL9tq+lGjBVJrWqrP/KFxVgm
	cM0TxO4LLRrAEfE2QAboeYhok2USXR/or6ohDXA8Rb+aYYKiRV3iHFZ/Gyb7WbrNkB9+Rs05/30
	qF25lI5Ls1mnaqDNJ56ziJKYzHAsebI1ilg==
X-Received: by 2002:a17:90b:28cf:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-393012af827mr3137289a91.8.1786517918073;
        Tue, 11 Aug 2026 23:58:38 -0700 (PDT)
X-Received: by 2002:a17:90b:28cf:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-393012af827mr3137220a91.8.1786517917524;
        Tue, 11 Aug 2026 23:58:37 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30b9sm2391336a91.13.2026.08.11.23.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 23:58:37 -0700 (PDT)
Message-ID: <61eb40e1-1eae-45a3-af65-62eaaf27edc4@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 12:28:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MdXtCakd2h2IZ0k3SIEKG9KPTttPyevl
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c199e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dS1doENrTls30Ym8nGUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX9r2dMlsVRVEs
 M/EJo+R2JXQADScw1cTVpmvuxNH51jDiPJiK1bg0OmjupUEQbr9cIlkImenQXB4EgimLA1LwS8E
 zqTubO0MtMfabtEV2YvJEucqguQl4qA8MSDFpkze0Ln48Ih2Zu6M27/KBZB5XN9AWIRp8NkjN2r
 uuooil+K2tCZXccM4ONmPkLTTFUKSU1Bv1Lcq9GjZWFNwP7RK36xXzQhsCFfaa7xzcWJhhS/cQr
 YVS/bnWrR02H2cUKguECLqUGrENjupGJ9C/6crDbsuAEHPfwyYPD0BHqax4K/sQZ6MQdon6N+ic
 YWGth57MrMvbBI6FqXYC1PwTq2Q5v7AEfgmuuRhV1x1m9A96T6Cjs0Ssu9ySae3gsxbxL67/z22
 p/sPafMJai+VNyOKV8yHsnlDeNSXqDmDjHu4VBHgVOpeFE43oILc7tN6Bh/KRrQc4VQGktgRcZD
 uA8H+GYCCKTi+gHpwpw==
X-Proofpoint-GUID: MdXtCakd2h2IZ0k3SIEKG9KPTttPyevl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NCBTYWx0ZWRfX3b5TPzS0zpfD
 S+Xw9/IFpO6ZrOtTFBogBZcMdNdxaftGHAY2q7VjoIiyvOALQwBcinyRPGWsjdgd2GrrApMzbHt
 D2Xmc5eB/FiG+YoehPdBEJ353sSoVxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_235840_329312_F5D5D02C 
X-CRM114-Status: GOOD (  12.98  )
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
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
> 
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
> 
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Acked-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

