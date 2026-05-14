Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E19CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=; b=axkUtnjQA3unU1lKOoHcWi6/z+
	6+ztvsAvTQAZa5L1O1wCd7igJv2IGK948PsxtWsSfP1ePVSvxKOaiDqZkGAHFKAvJh7cJI5jWbL3J
	aYKiXkoZNIECY90jKPyu7/veqS02Llb0CcaU7dMojbseMyrewyuhHtqeDTc7tJdYnyiqydb0Kbiln
	kNVgXDOahPCyZI9rgxwbORC+v0cMMR6FchW+VSfEvy3isCpiuBHhDv65APJgXHGFVuojUg2KsO6Is
	ZGXIG7/0JBsQQN8ZNyIouyjJ0xhifsLLqDqTUnUEmJ2vaxSlJSsdCL07SOSbaAHrgWfamzH/lllRO
	QrjJsy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdXH-00000006bC0-3biO;
	Thu, 14 May 2026 21:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdXE-00000006bA1-2uI1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:24:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpPLR1847945
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 21:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=; b=pB1PvYyErK43eAPY
	8GRxW3u7AM7AHohNM0M3cHCMCNo1VwAlgiEmlPBRRhAH3qzvDhBijYNB8Mozuu1t
	A0lh6pes7yXko1c9nG+m9lUnW0Id2COTnlBJXuVbwlwJcKrTpdQyWe3r3T1io7Wj
	SjhPG5n4X8xvsENTS0CdPmtrRTaEQKdFIWa0HxwsCZDv1rMxb4234qxcRW5FPYMB
	6eFs8mtHEJekZQyzkcvtIws/TE/h1OvUe7QYba9+pcSqPKlYR/Ya1dKobZLgN1kS
	yEs0DqhocJ+ok1uVUHzxmQen9ZwP+lp1oWjuC5BaSko7GFzEEpB+JYeXEl2cRUyP
	AHWxDg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t0ehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 21:23:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so7177927eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778793838; x=1779398638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=;
        b=dPiIaavoeyejoLSysqPMftKeKsurQhulyKRAnCOsq7LQoh0zcRW6ngaZaFI1w6uqa9
         MS39WWW6HUmr+poTC4lgHsCw52UiuZRWihiSvSyqQKhbIpcSps2N17wb/IURTSK3hvEm
         i4/72W0pNl1UU5cW0/4PBApOnGk0JzZs72t+Ah+JMuoHGQdt9O9w90gqoKCjXc04mSww
         BoAMkhli7If1uBxLCT4SH/2DY2iOmzYGBnhOxKCZTjnPexJLStJ9/FdWgGbUNLBP1YFQ
         +5Gmd4w2sbuvdRefm1woClKocRlFOMuAFyV6+5ZtViZlBAujEOstogxVurCA50Y1AMi3
         RDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793838; x=1779398638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi9wq6ITuBhZ0//XzAr/F1HphLRzl3ZxiOclMvD0KoE=;
        b=Yu6Lha6qly0ItA8cYVspD+y6/YfBCx6XFr4ljYWytzCWxytjc+1JJU6WFmTzI/eOZc
         JC+1PMKmdLs0wZGOevy/fkTrjtkGaB4stCi/QENebOZ0kXJ0pDzoV+B81PsWIpZNwHjb
         D7Fh4DYyzX7qdUt6tDU5vcfqKcrt/F3sr/LABRu3XxStrt6Nmv869nNltb2ImhTAaUzX
         k0ZXMYGafJacIQktrytJbBicz5h8d043dYWa0FWx0mfNwCDDIeKifyjbr4ExNESPqEJX
         0PB+d+Gmb9UhEMpvNjruBWe9+6BrkNNwM3fokCl4wu9lBICuUblA0h8E1lH/yYmZ5l87
         6SAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eRyasuTVu0wf0EIKhdW7+cIvBTHvTvWdVDQzWYTEdGueEMWqb5WVW3kItwyfSXNy3Xa6z3PSNhbyu3RWjYLq9@lists.infradead.org
X-Gm-Message-State: AOJu0YymJsQ/GuNI3PJe3eXBdCLrX0dGNsienCXE/SJm4w+0CX1QE8km
	2wbUom4OMYUV179qTuGov6wBXNR935NnIKqa+xu3MtVujRAZa17ydJVtU1ukN73s9PEKS4R4zJx
	hSNwqQA+/z8OsHotNNz2Rc4XYL4yOTCFlRyzvpzv+m28crFLdurIP7e3Bt/mbMFrgXPZzuCoM0p
	4fhg==
X-Gm-Gg: Acq92OHgWHqBtiM+wVwQ4C31a4HWojX/TZ+KGIxh6yLqFOgrl0yS9ireduKpCBaZaho
	pvKBrUox3Eb4WKHVqyEUVGTBHrPlUy7i+XJ8RGSBM94dKi23FSyo3HnA+fKLN4oS6mBGibn1Ezj
	SasoADxLExbzi9NpF3Kl9V42KinLFqYPjhKYC+4PejlHE8JGYY18xUABjCCU+ZuN7EGj8LI40Z0
	lQO6+fCf13v1eE3+21+GFasbnyrXWcppABxR80P+O1e9+UYru4mmTQqqUbJD7oaY4SNxTWQeFO3
	oq1GJWN4O3ZjqzHrJL6+8O9U120Ol6vvosYKtRHHURQHl5k/YuXaj4XI0bLM8sjIVaWXwt10Xoo
	sNUMiCrO/XYO+rqVY/wfo0UwQxGo/6ziaK3iX98hdRlzX/hp10SUXU/ucnxyZWnN+8R/l7yIuSj
	ut
X-Received: by 2002:a05:7300:724f:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-30398189fa8mr789548eec.15.1778793838380;
        Thu, 14 May 2026 14:23:58 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-30398189fa8mr789513eec.15.1778793837795;
        Thu, 14 May 2026 14:23:57 -0700 (PDT)
Received: from [10.73.236.148] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302946f2149sm4468333eec.11.2026.05.14.14.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 14:23:57 -0700 (PDT)
Message-ID: <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:23:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jyoti Bhayana <jbhayana@google.com>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260514164422.0eba9a61@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a063d6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yQWfTViADuQTjb5oKp4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDIxMSBTYWx0ZWRfX9XHT8u7RORCR
 Zs3zrYlftH6UVhf9gtJrvg3yUkLZTfYKXrkhXEAUuaOyWjcR7y0+YZwSMETp1NI8hn/H+eJFOqL
 mUivIxsLY8VjE6lAtEDDLkClkNFk+Dny6w7SzL2GMnP/j1MV+VjiGIcpSWqMTB+32z6yISQCxeL
 FRU4/r1xSyPADpe66WMrQluoCnloblMiMf+qJXV/fobomuGvNp+sbxYyRh7sQ/BnrqgO8+qt8gI
 TD0r1CcCq/Wqk4Fz5cD7hpv9LD/od2YZcCITAc7xX0zjxZVHyEr0U1Gbguadh/iI1rgioy1UgfN
 nka6CmGryMISsMYExao4RsrfniWL37kfaWWPqBPBkeYapztU2bQSo9Cg42JoCSpSotSjAd6JxPE
 YMXUrSTYNhQtJ0CSFKV/MJoby3+VwCO1m8MIJmb7JsdV6eAe0P7gFiAuqr733RLsv/O7LtEoBCP
 DjYagYVaOII/9SZQTXQ==
X-Proofpoint-ORIG-GUID: VsQNqkGdMi8kjfso8CKswuKmx_I2iZHk
X-Proofpoint-GUID: VsQNqkGdMi8kjfso8CKswuKmx_I2iZHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605140211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_142400_855650_C3615E3C 
X-CRM114-Status: GOOD (  17.83  )
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

On 5/14/2026 8:44 AM, Jonathan Cameron wrote:

> On Wed, 13 May 2026 10:16:53 -0700
> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
>
>> SCMI client drivers do not consistently log the number of supported
>> entities discovered from firmware. This information is useful during
>> debugging because it shows which domains or resources were exposed by
>> firmware during probe.
>>
>> Add logging of the number of supported entities to the SCMI cpufreq,
>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>> probe. This aligns these drivers with the existing logging in the SCMI
>> power and performance domain drivers.
>>
>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> Hi Alex,
>
> Just curious but why +CC linux-iio and IIO folk?
>
> May be you had a false suggestion to add them from get maintainers.
> If so be sure to check it's suggestions make sense!
>
> Not to worry - we can all hit the delete button ;)
>
> Jonathan
Hi Jonathan,

Originally, there was another patch in this series to add the same functionality to scmi_iio probe but it was dropped. Apparently running b4 prep --auto-to-cc does not prune stale entries from the cover letter. Will manually remove all entries and rerun the command in the future.

Alex

