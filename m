Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37E6D0C856
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmirMqg+0HEne2H7yWGTi4gRFET9ymKDjz1CuwG4xTI=; b=pzGl/JHzfnc8Getx56kUoBoLFj
	JNOelcU851+EhdkU3hHQucozuvo2iT85bHJirOJD5Eln4NIxEwrGgg6i5MViDpYgJI5H8YgbrC87n
	TKtK2wOkP6/HGDjzYzR1LZV7rot4/HOVeu6B4FOsFtC6RVbmL90ppHNjVfgX4gQiCWXeme8Z4YHuM
	lfMuE6apn4wKV0OWSVJcIoUPbMx59eDypqXgLqTQNEUbdUT5PiO6ZMwUcZ8L3QCyyVS52hQVqnJAi
	+SZIty3tM4nASsv/Oe5vIYfncSQGUL3AIlGgwR593uNRi74lsfzPZ3t2mrw5oEkUUXT8Ucs+hg4sh
	D/3GJnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcTt-0000000713K-0XRN;
	Tue, 13 Jan 2026 11:22:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcTq-0000000712S-1kIQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:22:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5Snsv3868705
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmirMqg+0HEne2H7yWGTi4gRFET9ymKDjz1CuwG4xTI=; b=B6gurl8jXBLPQFe/
	ErFJpi3OZPTPApZr08hQ/Lbs/OIDSFrTTNGmFlnUrwvN7kkVjl4DLX/beoIVJXhj
	tTzHN/AwcWnQtWolrXGFJAXd7oa96ZQSywdW0awnvNK5L9y8haZe9uPONuZrG2n/
	CfXmkJCqcFH6d0SgSCz9PBSNScQtTO6MAbSdS+kOCjI08fPYRfYm8oSSimWa8coN
	FTFnu+EtPRr9H7yEqg3hbE23nzwGEjjqZXeoN4PB4Zr6HKHWiaXg4YHDg1ZWbmOt
	eUH4ODiM0jNFyp+2sVI81PGT3T11GrniCwFqNQmoc7cdswQ6UybOe+nDy9L6NGVi
	F2xw7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk92fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:22:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbb6031cfdso244299185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303353; x=1768908153; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmirMqg+0HEne2H7yWGTi4gRFET9ymKDjz1CuwG4xTI=;
        b=McS7rKU9i2MwDNAea5FTCYCfCkmlanLxO957Kaxco+d0oP06JhrBJpf6hpEzyEC9AU
         VK8D8oNVWyIOInv1PnJTkVlOGS3RfatwkVhwhG9FGons1lbojcflZzJMZi2X0H4dEOr5
         lWX3I2KRwoxm4hTeTtyNeywEUR7TraJHysK0VQaTyTBesGfJ7vJ3PLqEL8YrPTvXoOt7
         SJaqrRxf0xGrkhfUvDY2S27sv2axYhaE4cJkzqFuu54xeJmM+2rQOLecCrkNrcLXarLf
         /HRe9DTabF3g/IkNdpL5gNxIhZ1UlklZezYZ0RAeJ7Lg46sjZb5e4sBlLNz+7dKLft2d
         g8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303353; x=1768908153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmirMqg+0HEne2H7yWGTi4gRFET9ymKDjz1CuwG4xTI=;
        b=VF4XwGECUXtZ3SFHormRqoHLv8nXVi7Yj+53jSXjsLKtB2iYpz7rbipSp8CIm4fUiw
         Jn7aH6uqzs9Iz1XY5c1JA+gFLywPLYoUBifB9srQ5VDCWe1OuZDEPVyu6JhI+jMSZV3j
         1fvTnfIW/UkeV+3yqqVX/+Y3A2xOSYV+FdKvFmDeSEIAhQsOjskR9OeyL1UqrfKFbtVU
         Ze2Sjlc1alSP0/uulHFfJElGDyYeFMXWpYAxKBC8rS5o40JyuFOSFV8TM3yIm7KRvXge
         8UvqfXGdOCyC6P+6iUpLhzylqvbBlT03Fi81NNeounMCXCSpbCUwSW4xIaZOAPwQQqR+
         VQzw==
X-Forwarded-Encrypted: i=1; AJvYcCU2nLQBYAC6RVqDPplqNig4moXefSt1rCiILbUgHbuSHAeS2nx+IZmWJuEMJdNch8heC+9csH5WK8u8b4/58IGN@lists.infradead.org
X-Gm-Message-State: AOJu0YxTdLm9ij0VXtlyE5bQBrNPmT2jC8bJ1iYKqKJ0wH0TvLZldyT4
	dT8yiV6zGPaDxof/vLal8Z+kr1P63Vamwi4AOgmofk/nC/ImcS4DrWCA0/R42H1gdDPT275/AMW
	7ToWULiRGYyOMJzh8o5ifAyk8kO7FHjuSmr7mOJ4M21Lhs2rpphwFiN1ZfddSewkR3qwG/VwTtR
	8HTA==
X-Gm-Gg: AY/fxX7eIRHwQivvYmf+VTe/5ZW0SYxckOXIF9n9TFdzH+Z4cL+ncrNIkvVY7kDnlXO
	hrBEJZiOc8fc7n9FgwrdyNajDc8RV4BAWGUy8q0D5coFy9XdMSgw6fid9ccAFkfSesYEbmV12yy
	/ah7ppQ+D5U+2CrBSbzDArVfcxj3l1EY5pf0JUDDM9P9HjJrAJGSNlgbQ4Va8HoUl1r1mP/ucYn
	aNkvQr6nCR6Q72dhvpnUUYrmwbmmIxPtRqaKuboK4vScUHpraOk3HEqep2kl1ZSu2k6BOh4y6Lp
	oIUYsISAfo77aQfhn3r6wPSapsaG8PA7sx6Qkl8szHVSsOyw3vrCxY04xUOzonp1Z7vGF2MjJUp
	tUe2VsCRietdF/yOCH7LKhyI/aGlOWEOi9cOrTRhUOW+d47hmMx9dJNDeCVzAYjj5xlI=
X-Received: by 2002:a05:620a:2996:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8c3891c4ba1mr2197372485a.0.1768303352762;
        Tue, 13 Jan 2026 03:22:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuiQ117OrzAO52ZictdOqeJUsMS8JFdl8InkhlOQRIxCaa04oXjbcibShpfVZ8Nof3acUY4w==
X-Received: by 2002:a05:620a:2996:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8c3891c4ba1mr2197369885a.0.1768303352208;
        Tue, 13 Jan 2026 03:22:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm1750147966b.15.2026.01.13.03.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:22:31 -0800 (PST)
Message-ID: <7dd40fb6-38a7-4e29-823b-5c0b2c66e3df@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/7] qcom-tgu: Add reset node to initialize
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EK7RzgPvOWtTBACqvygmkrqy03QXv-Mq
X-Proofpoint-GUID: EK7RzgPvOWtTBACqvygmkrqy03QXv-Mq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NiBTYWx0ZWRfX4T+2JaqMsIT1
 pBhZSMdKpft364fo7Pjsgg2w/8dXE6aoLVWWqh3gFu4i5esZQClWuxWgyuJ/TUuWLA/ZBwDlyVn
 EjP+eILb8WKqiKdG/ahyU5R/eBevBhsUUgGkpkvvFdci2GfcS3if9FS0cGqHFWB+Le4lCzyppVV
 oHFqfeXgwKMymTtiOPg+N3NBlJkm0bF4+0KRUAGffEbg2WpxhOHMVVlM/leeXItB3k1S7dEQxd9
 YLD4pC+Wde/VPF9+pir7qgxEL1Aq/dKSk2qjB63akOAavonaCCuF7XHdLhT8PXEq8JffyVX7NUW
 OAZTpQ5Xakv8T0OIpUnTqDDBo9BNzJZ8ldLBWavBUF4+N5CBrfKcHpS6t6SwwwuzDmnid2nK/h4
 8oh2wtI/kYBeAsHoyOdLhXPyjr8+lKQmQz0jFub/bdHypNyQEXpk4PG2F+wqCNiQt/vJO3mb7uH
 Zrbn4HCoHe6g73hrGOQ==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69662af9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBwiB7GLNlbp3mpgxAkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_032234_574973_03413D9A 
X-CRM114-Status: GOOD (  20.53  )
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

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t size)
> +{
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	unsigned long value;
> +	int i, j, ret;
> +
> +	if (kstrtoul(buf, 0, &value) || value == 0)
> +		return -EINVAL;

Your documentation blurb promises that only 1 is accepted, but this is not
the case. I think the previous additions had a similar flaw

> +
> +	if (!drvdata->enable) {

I think this check needs to be made under a lock, otherwise something else
may pull the plug inbetween

> +		ret = pm_runtime_get_sync(drvdata->dev);
> +		if (ret < 0) {
> +			pm_runtime_put(drvdata->dev);
> +			return ret;
> +		}
> +	}
> +
> +	guard(spinlock)(&drvdata->lock);
> +	TGU_UNLOCK(drvdata->base);
> +
> +	writel(0, drvdata->base + TGU_CONTROL);
> +
> +	TGU_LOCK(drvdata->base);

This is tgu_disable()

> +
> +	if (drvdata->value_table->priority)
> +		memset(drvdata->value_table->priority, 0,
> +			    MAX_PRIORITY * drvdata->max_step *
> +				drvdata->max_reg * sizeof(unsigned int));
> +
> +	if (drvdata->value_table->condition_decode)
> +		memset(drvdata->value_table->condition_decode, 0,
> +			    drvdata->max_condition_decode * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +		/* Initialize all condition registers to NOT(value=0x1000000) */

One \t too much

> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < drvdata->max_condition_decode; j++) {
> +			drvdata->value_table
> +			->condition_decode[calculate_array_location(
> +			drvdata, i, TGU_CONDITION_DECODE, j)] =
> +			0x1000000;

This is unreadable, take a pointer to condition_decode[]

> +		}
> +	}
> +
> +	if (drvdata->value_table->condition_select)
> +		memset(drvdata->value_table->condition_select, 0,
> +				drvdata->max_condition_select * drvdata->max_step *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->timer)
> +		memset(drvdata->value_table->timer, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_timer) *
> +				sizeof(unsigned int));
> +
> +	if (drvdata->value_table->counter)
> +		memset(drvdata->value_table->counter, 0,
> +			    (drvdata->max_step) *
> +				(drvdata->max_counter) *
> +				sizeof(unsigned int));

This is similarly difficult to read with almost random indentation

Konrad

