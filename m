Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E5AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=YybK6QdW367TbE3AvP15hr/gct
	Iltk7A3ku5pBAd/sLgyuoMrZMoISftAbSiLm8onPaYqHh8Hn/tGlxBR2/efTP7TID+JoJwRJUpTR0
	UmeRoBvX1HLI+29wuFlC/fhWgZ4sYMSbxUaPwVU3MX+GYQds5XXIANSmiNxwpkE9RYEfI/RJ40wiY
	1DtvG5ERwbJlDX5E55sC8VI6xm3eeUW1io1wo9kyfDN1H6uO042pyvadr5LjIaTM8+cVwkEUXlkxd
	4TA2tjHViC/QWXuzraHbyZRm5oxKLdS9qdhIvnZh7jlkFC8gFIQlGJwptV7GHQhWyoOT8X6TkaDi5
	3q0Rk3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ86E-00000005NeR-1fhX;
	Tue, 08 Jul 2025 13:11:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ83u-00000005NDu-1ZJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:08:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AASd2025427
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Jul 2025 13:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=UJkmmfuHN0Jr6kLA
	ld5/JgheNu5sbMNgZkiwYUgO4GjvZ0BhglW00c59meaADsYhrZJWYQqmA1gc/OUc
	DUrnK/NvCvH5C3ONM0GjvGKFSW0GsKNdezqCPza8ZE4tevjkJ9e1npZeNjJmh0a+
	INZ4fgtIBBYO0j6f6etpT389hYl24vuIu2PlUOUPRwGL81B4dcop5sZWnBHRiFtS
	shOo7dNQC/vBBtAFgTDT/48Rt3FZKyaSlMLbcUDvTnThA0dRBC3CHwWIE5u6O4Qv
	lz8B4EKeQFe+0hY6nqY73fapqXHeHNzj+ARgwUPzAaWQ1qY+sXoEn7n7SuSC6Xxx
	t7bbIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wdcxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 13:08:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso42181385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980120; x=1752584920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=H08p06lzhVM+aiCcDcYB28s+C1+WPbVZr1b4QvrL/BoYtoMxqjypeEuRueg69PY803
         oNW7eA46NpExB6rriAEdWUP/pQ8jh5Ckgh7kvWNJvLGimmNi5CkkgIfmNr/1gdwuIiix
         DIlTGEWJE4LURV51MpMxG2q+j3Ks50n4HNh9H0so33uF3aC2CnAA4qF/Zr2ZuE9G6ZjA
         35PXZ99XH1NtBd7u835OfyeTWdobaQbusb2SEIjcAdgOb4gLuWYI3dQZSDeuUeigfEZP
         hfmRmiOyrm+CA+LYr0/pEbhTDSpCyNs6/WXwBET8hPc7er4kZtMzy02d7AhFmuhQjKPV
         /5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWKRpoc4Vi6YoFbcGkwjNhChbOMqirlGwbj52zof1Vse/6CDfGLfQ5VbqFsXa8IHIls1qmgbIZG1rcG9BR6cZq8@lists.infradead.org
X-Gm-Message-State: AOJu0YyYqklV+vh5BdiFkc2l5s+np8MSeeLKJF9Y69AD/IfVqFFVWLnX
	BuqQn/jgH0vgZCtEw8dw9cqGTFgh/aBOuXMBc3Oh4qCYBxOlX8TNSMCHARUFXQC0dtCqpK1H5At
	Hkg+hUgoMdWzfbtvronMDSdaJGZeirkyeNWmsDDCavNht3Xj0OV5CLCzjLjPcuSSqyIFo+Sr9jS
	WgUQ==
X-Gm-Gg: ASbGncs3zcpAaAf2ovMcGaht3acFh1kM16dRJkB6aXSabXCoK3IdDFzd23CbA9GTXr4
	R4q+lSRxaHOZPmi4JTWPwgUvjHMlW+D0d/YgLGmpjnYLGYjZ6rLyQBJfMcuNpWbf4iRv/DzQgIG
	CcntzUVb/o3oXlg8jGXeYj5ZNFuQl9lnosHcSC1leI6nFPLtmXpoHPMsQ5RudWxAeInyGpUVODB
	yCIkX5280RXvofFOUQX3yKqDgBputxhHb8cTeYwnFHJnr9gBq/4yoQVfbteuAXUgmzw+QV+Y0Vx
	UXGKBHKvfRbS1P0wRN/E7OdEWO2K2kZ45LHddDSpQ89BbsMUz0n6R8D844KVHzokwU/SscJKtBp
	n1+8=
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784814685a.9.1751980119807;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMkzcx+Tq4TsX9kndjZh7wHfMuEQIojKWDO/yYN17QbawLmZlZmFuRE1iLw+w/7zUU6OuFw==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784811485a.9.1751980119240;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:38 -0700 (PDT)
Message-ID: <fd367b55-fd20-4601-ab03-b398dcb326e7@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
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
 <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JKYXayckufAAjSyenoJp3z_uRDhq15UL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfX3aeI8tdf9AUe
 WX/EnHsI/FFLyq+uoM5ZCH6x11JjFEzD2maCWhJLaBSpgRE9SitAUKKw+nX7XrfrAlm+VYSoP3H
 Zl9CL+vmmA36QbmLK5jme2KIGWhi4O1H3XpvhoxsPOWXBEG7sg+p14uZh09xX20TgPN7NrwX3K1
 3JAPXrN0k5ciD0qTpl/ZRr7g9M4iNSN6HJIy7lyQdkIJLkAn6ldKv56SJ5sO0HbAzhbrlZaqqE6
 HpS/B+xQZ4jCqc5OHKItXyLpOYBCs/UeiyYB1+cR1YQTnO7EM2+GOqYpONkDPGgi8/C7xAMuour
 W6gIv8JRlpwi9cf6YSM5oUtqDDO/VWpHTCjh0GG4AOM22P+kX75igwKKrM75AtCnqJparfoWFAA
 E3vXK9YApYPiFQ4dONUo53tDoRyvgbPY/8Duva+2/UYZMuYcBzGo6bwg8VNETVzTPFesdNCn
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d1859 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JKYXayckufAAjSyenoJp3z_uRDhq15UL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=849 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_060842_419573_B5F5344E 
X-CRM114-Status: GOOD (  12.48  )
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

