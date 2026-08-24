Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FBCC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB8sPRDGnPoHZz7yCyo7IhuzIfOUg/WXFNjdVypaMnM=; b=xHBMwKovLkexn2s26ee6/cYNUL
	hqRUUhUM55mdAdviCDm+hRMrF26ybG9e26RAg2qFKdxsGocjJoE/aZzaScwfmxSHeB+zV3blamauO
	1S6m9ZOMLXO6E7HgIcc8Kh6dd+MP6XkV9BD2lm8sxBVDpHrx9VVXrSK9SB8rRXVNWxJfGC7aoYYj/
	17bUwfhKh3IvbOqRf5IvY0AKu74R14/jnsYVdzUmTaWTMGUjrUZ6TgbjMRwQchFlAbY9Gmd7U4Hxj
	wxqjPKw6OOJ+V86Iwe9V5IX02sY8nmJ+N9Ck3EdsrfEg1xrRZIhcVmsfLr3UHcjI9CpW6rc36xTz3
	tkwjc+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW62-0000000GqHL-14i1;
	Mon, 24 Aug 2026 14:56:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyW5z-0000000GqGM-1TVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:56:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvGxQ2579570
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zB8sPRDGnPoHZz7yCyo7IhuzIfOUg/WXFNjdVypaMnM=; b=dnCitTg/XZbxEIip
	uHNJVoY8tzwTRbq7219tT5RUx/ZSWmZ7aQulFVNSjhhZDgpIBNRQh7fOuUq6O6Sm
	DfJxIj2yMsPe4xN+JkWsc1SrFkHQ0EGrizm8Q6G5XMgfdOPh6sFH1OZkZ3RQx/1Q
	On+NSPuTyYAp4cSmsMN5rpEgy/pv6dwXleV3usQ1H3xKystIJ54Q45sgib2zJ1S9
	rnnsggjnQlDwd2OI8U+kD2fqpUyEB3c1uFvr1i1h1vo2tEJuIy2au2Cideq5LMvV
	Zr42Sa8TigKvdMmOoaKHD3JrrXKi8LGaAloBzX1n93/X/r5/1OU8tlAB023FZXO/
	kDskzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsj85u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 14:56:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d7ef17031so6031551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583378; x=1788188178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB8sPRDGnPoHZz7yCyo7IhuzIfOUg/WXFNjdVypaMnM=;
        b=gcReTpgKj3Xa3HRPD+Z4cOFKBy/lWy87Ij0zCH/kS2zckibL3HQaD1wxJZUsqVVpq5
         5XQ8lFxwYNQ/i7ioeVid2E/PWja/ITTds9672Oroq+0Wr28fLnLWvKNoZU1o3wqtJmr1
         QBZWHUQj3lH/jToppDEfUMt3DFnhDvGF/KpcHJH4i9m0s2t67fddOfc1Y6l11xrbJ4M7
         KbHR/b9m0TZr2vDFrc3+TNimQr9QpFu6egxumwFhGlEJbpkC7e1v+yNnh59wdSXa4amn
         gtbgXpKbjKpmxsNvTqReq22iuoITpu1uR2UZkk77TrTUwTyXQL3126RwUXcQBOHAaQk+
         GpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583378; x=1788188178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB8sPRDGnPoHZz7yCyo7IhuzIfOUg/WXFNjdVypaMnM=;
        b=rGeruwfpjmZ9ANcRcJbXNj8SbFpOxXpPbPlTwYkk6AGKf4zUhUpuIWokMv4N+9FJD8
         214EfOwllj2PcdTdYRtMk8nyvRpC34QbDk1eILfxAO1BItmeSg7ALMMbUJGD0OYHehej
         zDf9lSFLxCLNrEoEedFAmBPSlCFqy9GIN7ye933vo6jZ2tK9OGh0giwBpwBVyeOOmqBr
         DnCuA6ZMJWgjRaf6vyjHHO/OYhYXzxwZwM44zFvT4MZEgXn7BEq56puFnUjWBL6ZV8jm
         j9iWq2vXsTEjwrC8PGWIPOcc41cv3s0tQ9OPz7SrBJzFYpWpPm0OZVysrtLnFAhzteoz
         SOLw==
X-Forwarded-Encrypted: i=1; AHgh+RqkYt6E67juYnt0OInX3rbLZy3uFz0Kf+quMAsfqWE66s7INGd3dOldv3eGLL3fz4o9Zl/+IyWieORV2n3XT0LD@lists.infradead.org
X-Gm-Message-State: AFuF++mEQX9WN8GcgOhVTCOrJzU9zlfIvgtblqryy7jg4hrbu9zAJxHm
	l3tKE/hKETMOuLURI4PnAt8kz6j9Jjwur6/aj3z84qq9KO7t4cmh8Esr4+oKiwHwqzULsY36RK3
	mWcNLIUSJ32PvQFB1vVzMsbHZBNbaqBRZes9A3+fXKZSuYQVv9hNRBz7HLgRyBiehgGSdj0DrLd
	s3jA==
X-Gm-Gg: AR+sD11SdQbduAtB5qDo7uhpcgKcUZGNCVn9JxmnI8Hz1I5ZyMnQ03NNT3l30XPJ+AR
	OX/Bp5/1qgYZ84emoSmb/2alaRR+SDpilNQrTORqEjv6kgYVFZ95a1vdzaHS7CDmAe/N+t+bv/B
	9eTZYW0y/I+C7GhXBJLylaOqHByNzKC3JqMTx5KI3Bz7DcGxjXiIbPVjR1loYMUi/5Gjorj+bzd
	uKA/Zv9uqtXxhEw3iEykpoCo/YWuX26neuJduD7as/9kwaoAPWr5Dcn3LfHYeD/+7vVDYYVSupw
	TuxyoKMUrflPo0w3j9m4X9xsI6cJW62Q/TO+DK5UOqh6S6dUq8E5j9OiQ2ucPFo6NgHSAaS6JaH
	PJqklA6MxW59FU3bapBRDXWBq
X-Received: by 2002:a05:622a:181e:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52df59cf0abmr198355141cf.3.1787583377793;
        Mon, 24 Aug 2026 07:56:17 -0700 (PDT)
X-Received: by 2002:a05:622a:181e:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52df59cf0abmr198354441cf.3.1787583377271;
        Mon, 24 Aug 2026 07:56:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm1147107166b.57.2026.08.24.07.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:56:16 -0700 (PDT)
Message-ID: <d81d61fd-79d1-4bea-b93c-0afe44f9aab4@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-2-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fPLkyFvPHP6h2NCdDHYOusryht2u42xU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNSBTYWx0ZWRfX7OlmeoJYtdTy
 LMl/rybPYtqATInqBtweTAb54G7oIiTimyPxxHr2QevyxLmMcwsvZHxZtpLfcMSTRYjUXODzRQU
 XNIryQGXdt1WQjm2b3TPzIdDtZ0A6wxyMFS0HKu6ESyQlyRzhCkw78fZ/BrOHPG3/aeaOFhRIjm
 Mk+dMFzEgAZrhbjxvxbSdbUyxio21/+USVSQ5xs3NXGfApa43Y1LD4GQ6flU3vEhXbXXCbcS6qa
 JgJNbYv+JZgHrLGipSoLpSF8UbXQsUNTjLtuaJIs7nbQWRlZW16248CmvYNc7TR3j4woJ2N4ANv
 yRrdoaUcB8y7tCzY8qE1mny+gT6NunWhRyeTwojUuR/+euMpnm0uQVcb0eHN7WIquQ91gcXn5+p
 bVTLr70Fk/CrNgldXsf4jWa+t5Y2rN1umKwGzIz+IXN8qAokz0Wj/igE3l9AGaqK7/JDaVJVHFm
 k1maBsU6WfCQzurzyMg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c5b92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=U6xjVzI5DKoLzCUfakQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: fPLkyFvPHP6h2NCdDHYOusryht2u42xU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNSBTYWx0ZWRfXy2q9bj/5lUja
 9/WCbrt/I5lJJhL1H2Cmddy7S7Rl2G1s2hy4nJLikul1YGAIbzVC/iwZ0Y8AhsKdPEaabrKX1xs
 vIy0qAGiIf9PKx4ZtjDJFqfhBJMPYSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_075619_515758_A96A0791 
X-CRM114-Status: GOOD (  15.18  )
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

On 8/4/26 9:57 PM, Praveen Talari wrote:
> Currently, on the SA8255P platform, protocol drivers attached via
> geni_se_domain_attach() treat each OPP on the perf domain as directly
> corresponding to a protocol value such as a baudrate or requested
> frequency, and simply request that OPP via

[...]

> @@ -1175,6 +1181,29 @@ int geni_se_domain_attach(struct geni_se *se)
>  	else if (ret < 0)
>  		return ret;
>  
> +	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	num_opps = dev_pm_opp_get_opp_count(perf_dev);
> +	if (num_opps <= 0)
> +		return num_opps < 0 ? num_opps : -ENODEV;

if (num_opps < 0)
	return num_opps;
if (num_opps == 0)
	return -ENODEV;

> +
> +	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
> +					sizeof(*se->clk_perf_tbl),
> +					GFP_KERNEL);
> +	if (!se->clk_perf_tbl)
> +		return -ENOMEM;
> +
> +	for (i = 0, level = 0; i < num_opps; i++, level++) {

One iterator is sufficient here

Konrad

