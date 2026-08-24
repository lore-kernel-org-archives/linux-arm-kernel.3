Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C1BC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=; b=bfXDtIeYvB4kYMG7E5URlZ+sGl
	rlBSYQI+vNT/hY0WsMkEkGuu7XHVbEEAc+rMkDH9cmYxCVe9GyF4b16NPYSJwgz6u2AvMrIif4f9+
	dpjfKar6Rlf2MXPSB1pH6HNpVP2JFHfHn6bvuC2eel4kITFyGseN4oNqLpTIzleMrDBoOv2id/F2J
	2t9Hnss5El93AS6LO7owJe05oh/G4Q1DrA75+IPgg4iPt7O03Ibnywhmao2AIK2TR++SO8Ua/qyM8
	fUHZgTHtzijjypbvYj9ZKTHCbG3mJrCkHZjNpyIaJCND+oduyVyxmc21RkeARVTRIUN2Fj1ndB2tc
	YrNBSNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY20-0000000H67H-2Lea;
	Mon, 24 Aug 2026 17:00:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY1x-0000000H66X-3At9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:00:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFnFn43329816
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=; b=Kp235+Tr10HCOUDw
	TcQJpm1Tm12Y3qg9XiTawDjjb/6V7gBSvJ6UZHw8dgfn3ilBN7GOlgPz5++Vnchj
	7O30j4rG/bKc6Ti1B1JQmj8jK0xGEu/slqrkQx+Z/LTCRREvNeQa6vpptO3SjKA8
	34kja9iGtGfyxcOhOaOK+2ceUC/aIpoGU8iUxHa9b/ejAmlx5gy76BNzXSYrKnL1
	02iPddG9v4jqBqmx9XZEJFu7peR7RHSdT4kI2MpWYBik6dG5sQqS1sh/Xrq8U5k5
	BHxuaJ/gSL6HtrRmU1VNjwcjfW+kH48Z5P5g7CDhRlMoPWQRe7gCt8i7/LNe8rGS
	6SjJeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r27xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:00:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so6043835a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787590816; x=1788195616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=RBmq80fBdG0LKmOwQtqA6ZTkvR1v+mT4c/hEUxOwfYatxabTIj9Y3vnRB1ZUKiz6Fb
         Ot6QCjCeMUaO32qe89hZ+FT+0IhreMGuLMLf6QIQ+ZCSHqEn6dl4L+tL6SyuCkqseza8
         ABjR06S5OmWKRtIzDFlYEcWRIMhxyxycXa4WKi6+52JtFgzu8GFKe4hin0HxA3Ltz25C
         8OfR+tsF1x60e1qnb/3rDfeVJu23CC9MeIY3nZgJ/TPCVGZJuXIf2Ok0i8ppZg+eRJ53
         dMU/tEGx45JXheImGzVKAERKuOVF43+QvfUoI2ObMcL7LgLexOirUVg8/ZTzr/fsunP6
         zvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787590816; x=1788195616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PFBQEZw27Yxkqm/8BheVqymzKB2ikrlKjRCFFjz/i4=;
        b=SOhI5gs8zESX1En8g2VSmv95WKKxWAWn5dcgLbmRURaDOR0Z1pxZvcCyIzFXk6Q36E
         KA3DXU7tsB26nVrQuEHcec2Q+gxr/j2KobCOo4nBM2kq4fR/Ohs//s6Udb0B+mHdJz/C
         EpmVD1TraUq0r3wIL9x0CNG4ScV7bcK3Wjp885RF67Wj9NlgdEnFhLof+qxTXlW4fTBT
         GKSOv5FzJgkRwQo38MARBxJjQykoZrd+CyLdukQEAHFzJbDM2elSV0qhP+GkG4xr8/oh
         N/7wMYDAoMYGPMzGPlF4acP9FLvKBT9RAFTwPq9rd/XQjF9QPUshaHsjX2ha/83/84I0
         Xepw==
X-Forwarded-Encrypted: i=1; AHgh+RqnVAdK0pPOOovU54o0d0eHypmdDNKcPxvb8uROucpecd/EsyNF6TSe29mI5ME/xzBy5ymkyIb4uHelzvNddZov@lists.infradead.org
X-Gm-Message-State: AFuF++knymGMFo6VgDKH1WKlkZMqW2Hr1UK5NzPbBE6FuztcbEqRK2Te
	q7mZJAzA8eUZgBrK0/AWPOW0T1VCqHKHdttomv146ycRi5b+6MDToegU07EMtDo9TbtXCvXgqaw
	2drd2JPIpo/UwYEq0KRwUdubGr+hD2ZH8/kU/EHmqn9Upo3XJwrrLyIw8vlHkEpmK2NUMbFvFnN
	xJ0A==
X-Gm-Gg: AR+sD10LRerlAif/QivMP+yXaqUxTGghVxZz/ssTpqXyNkyH7U0rW+2VDSKIs51s6XU
	WpMBN/qrX9dnJ8BlPD2H625UiJ84lQJ9j0ouaSuMT7mxCszAznrRcfPu8k50vzgt5BwVDuxCv5f
	ZscVd91GEmSTfSaTERHIbd2J9SODgQw7rgGIT4TORHyDdzdtnv/laTQl7immugeKiGtSLcbpjn4
	MapS/lwaKY3jnVzuohWTUrAeEEwIoHkti5Jp0j+OF1ZKx6wQ6i06/FiFjw582S2k9pIm3WvNv1Z
	v3NvlQRgIcRoCr+J+ZqEpCcMLY+ehK4mzAhcZTgHJvFDHSZyqyEIYNtSqed6eLQf3nmDcAkPPha
	HyPSBHsgZPf3F9od8qhAlU3rJZkSBOQ==
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510436a91.1.1787590815372;
        Mon, 24 Aug 2026 10:00:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr510221a91.1.1787590814598;
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm41584554c88.8.2026.08.24.10.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 10:00:14 -0700 (PDT)
Message-ID: <52ed6e1d-57a3-49e2-91df-0886b416282b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 22:30:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] soc: qcom: geni-se: Add helper to set SE clock rate
 via OPP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-3-61171ab1cdce@oss.qualcomm.com>
 <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5d2504be-0691-4174-9d98-7759205718cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX9dYQ9apYDYwV
 lkO3+Gsb9S4k1ftL6laLhTb4QyaVSH8mamd+3tv8r7qn5M2Acn5xMJAY3JRQWuM3bDbPpBGyzh5
 7sMaPhQ1E4MFqxZBTbj/o666We/uljvLcnZvvFYbXCo+QLcGOCjqvwHkKl8occ2hZ91OEKUNt7n
 DM8T06vtFh6Aadk1m3ZJtejetIsfTWUnQSSS2J1cSOt1IQNp4iElL9KYjuizS67UA9rOpEiOpLa
 lsd/A819naDUgWNNxA9m0cd12tW4SGSn0hPpZMKSjdGelBqi65SxoGseNx3CjPo/FMXFvsYKtnh
 Bq6a0lBcyamCju6qhiKbs9QrneD9DErX8QtE9RGYeiMTHSXx/rUZmGVzVSUyJcAPSVddPQD9EUF
 7yDDId/OrRZghVvRZ/yKRN+p/SgT2LzmJ51Lrwls/Q/2XfFkBQVfnqZGiq23Kt+RfL5nMIx2hlW
 Yen2rwrshSh3TIe+BPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE0MyBTYWx0ZWRfX5cd+DKHVAiSU
 Yo6NhO21EzjnCMKxOWS14idX5G2UKW7csIYo8PPZEjjngXrunXERly/2iVbQK6tuk/ksjmk/ZUA
 0JPYH50LFbqJq0mxCchsoJ0me2xWpXw=
X-Proofpoint-GUID: Hpadu5G6FX3gUuF5SW_Inn_LDfddMG20
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c78a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=k7YlSEv--4VGoxf32YcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Hpadu5G6FX3gUuF5SW_Inn_LDfddMG20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_100017_917695_B86C76FA 
X-CRM114-Status: GOOD (  17.74  )
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


On 24-08-2026 20:28, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> GENI protocol drivers need a common way to scale the SE source clock
>> through the OPP framework. However, the device that owns the OPP table
>> differs depending on how the SE resources are managed. For Linux clock
>> managed platforms, the OPP table is associated with the SE device,
>> whereas on firmware-managed platforms it is associated with the
>> performance power-domain device. This requires protocol drivers to be
>> aware of the underlying resource management model when requesting
>> frequency changes.
> [...]
>
>> +/**
>> + * geni_se_set_rate() - Set the SE source clock rate via the OPP framework.
>> + * @se: Pointer to the struct geni_se instance.
>> + * @freq: The source clock frequency to set.
>> + *
>> + * Applies the given frequency through dev_pm_opp_set_rate(), targeting the
>> + * perf domain device when the SE has power domains attached (firmware
>> + * managed path), or se->dev otherwise (Linux clock managed path).
>> + *
>> + * Return: 0 on success, or a negative error code on failure.
>> + */
>> +int geni_se_set_rate(struct geni_se *se, unsigned long freq)
>> +{
>> +	struct device *perf_dev = se->dev;
>> +
>> +	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> The latter will always be true if the former is

Sure. I'll simplify the condition to just check se->pd_list.

Thanks,

Praveen Talari

>
> Konrad
>
>> +		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>> +
>> +	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;

