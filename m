Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F6CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 01:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Foo3ySYo6EFjJPBK6U7dkab2RZtqehrfT72uvB5IuYY=; b=KwZ//HA+oZvNP9gjDcQyp+Grqu
	ijVx2K4BQGnXDJtjZzeO5V2H2KEpCQ5lHtPfHdMlUIfpSyLdEs6GPVsGvctdJe3MXUHTdyWTR0kxS
	FRiTtd1OlY+7NaobC3xYKhCqiBsBKS8YofjcXvjqGBUlfpIc9ivuMc5qqOZo5mQBOp3/2g1Nhokk4
	L5bkrNpsSJT4o0ACbUh7A4/l/zXCyDc2NwACNGU31/JvzB+4DGui/5Fb3dTvMzlzzy/IAKLNppQ+L
	2Zb0oWmwMGCqrtFIz1J5UBDBzB5TmTizQrNvBcocBOuzdOyrvCeM7ADOQ2YydWKIz4PWjBsruFVNk
	yTgHG53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPoC-00000001aT3-3mnE;
	Fri, 19 Sep 2025 01:21:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzPo9-00000001aSY-3aOW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 01:21:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIHW3D021414
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Foo3ySYo6EFjJPBK6U7dkab2RZtqehrfT72uvB5IuYY=; b=g5fWk5s788taeLoq
	KLEjbHyp0IJogJaIwIh/OegyxSBw5pQyI3XLFNn6w0T+l8tWChmvtSk70Qncdns9
	hNyGJ2Ch1mrJPLZUJoSBP5AOVCf5YRa1mjiqXWzy75tKgUVrQPF+/x8XVRG2RG4l
	Js60roBPVI9OkTuHnjfpIp3cgNkJ2mJLOZlCr+crAgDnPQQo3rwsZq+/L2CXao5i
	36hIZiHU/fZc7lWuwPPoxdWlcPmEnq3rve+I9mDnDgUtNRT9XgG9BKW2DkeErIQC
	0EOWZ9gmDwH/kyn9NW73ogpAX7ROJWSL9Txo/GRtT1ru5HDcHWq2kse7Z06yRklk
	Uv5CHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5gmn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:21:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77241858ec1so1606164b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 18:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758244862; x=1758849662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Foo3ySYo6EFjJPBK6U7dkab2RZtqehrfT72uvB5IuYY=;
        b=RpTxj61h3puJQojoI4TIXHkd5HsxyzFKEwpaSCSwsKvbdkihcu71RtHMK++cxbNi8M
         Q6/ynF0mjYgy8EYFjEEglslhTYrrd0Ob5FBXuMrIKfayV0SIWKvlvlnUgukTXWHhwbff
         rjqMcprXf2dkEtxuOWpb8Mpv9jz6VuY9zhRm+lB9yUWDpqJNd6j0tE1JGhOG5X5yaJyp
         mgq+UQDDXmGKR8d59axrngAceIG71Z3/C5rZxwH4+AMrQNyJoTC3/kW9brOpHD+R9P0L
         AtaVJPChGkm5+uUuy8ibNNnqOVDAE9ASwLUBu1im7X/aPtc4Rcv/Umzn/O+V6CVgb+Yf
         xItw==
X-Forwarded-Encrypted: i=1; AJvYcCVKR8FzJ+hNrdMkiOAzG05SW3biMZBus/sOI9Y2Yyzj+S01pqsSw1GXw0ZnvMrBE4fd/fyDrZfxeOpA4YmR3QxU@lists.infradead.org
X-Gm-Message-State: AOJu0YyCDTFVXlsiSSW9VDSzA68fV+PWHZ4EVgDal65sDpWJC608dB9t
	8KfngSAIUokJTnqEbg0nNMwQVI2B21gvJQLU5DgZtj8QHIYN+f+lRRosO2iezmwpcwzLdQho6Sx
	pzgmFUSCQIfM10nJd5BvZv+iMd1VoLNrLDQ0mc6n0K59peT5uSqdWmrdntUnjru/zbIULjUfJyS
	SBOg==
X-Gm-Gg: ASbGncuXWwg6HlCzvVTsGHcBUujhuYAG2L4jelOGVs/uxPdFJiBqIrakVOgc7ZZ+HmM
	KKZd7+5n7eU/+lmUrVWM3lbzdaN5840MlFwWgmdSxsJmAVEFM8VNfvfmVeeucwnHOMmxVeGlcjI
	vTLjjDBsgGnNF+qt5u5Yq+nKbPn/rXVsEKW8SNNbM6z/pc0KDuB+4aV5BihauUMORSRQP8llevW
	NOiTwfZDnDVIXMkbtD6eaPOk8xu4hLjHutguHpLD9zOdjdnfturHcjiCz1w7xd58ul3U3XHfNHJ
	C5vzU7wH5EMZ5b4gQBpHII6LH2HglnkrH1RJHwqsT3f4quQSwqJxgj1irsxQjQ04L00chSV5nix
	pPEMuwMGNKMZ5/pNSRAxlQ2xNLxLh
X-Received: by 2002:a05:6a00:3e0a:b0:777:8ba9:d200 with SMTP id d2e1a72fcca58-77e4d70fc5amr1411190b3a.10.1758244861638;
        Thu, 18 Sep 2025 18:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeT8sKUNUHwVzOX/zQmHzWTxKFmgwaOXcBYgKmhEiz68/Qtj1ou1dKF/mr96j126elpztJPg==
X-Received: by 2002:a05:6a00:3e0a:b0:777:8ba9:d200 with SMTP id d2e1a72fcca58-77e4d70fc5amr1411157b3a.10.1758244861129;
        Thu, 18 Sep 2025 18:21:01 -0700 (PDT)
Received: from [10.133.33.50] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3f84fsm3578203b3a.79.2025.09.18.18.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 18:21:00 -0700 (PDT)
Message-ID: <e1a2ee99-07bc-40f3-8742-a0cb1c273350@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 09:20:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix data argument to coresight_enable_helpers
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Sabrina Dubroca <sd@queasysnail.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250916224441.3008824-1-carl@os.amperecomputing.com>
 <a331eceb-ec49-4396-a61d-78a75789b090@oss.qualcomm.com>
 <87frcj8kw7.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <87frcj8kw7.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ADS3-e4K1-VuXB-6BLbtpG9pgL5VN1j_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2rUPEmKe/u3x
 RjVV1m+5F+tqWutYbFeZ/DaQzDqNsaiq0uPh+fGJ0IWC+pDbndFXJxoeURPOXgPLOCzMCYlIrYX
 fbw5rriLPtvp/38XNKk7+McXM87q8bTSoYnf85gmsHyVMpuNGqoIrp8UCXh3O7ft3hXuB7+LaV7
 sLKeUwDmSKueVb3cnftAsG4bLvlYw/5azQJYhS1FFN3iIpFajCnbN1cWOT/2b/qRCUgcdEG3t1a
 fudsxWtYkkGGYsDBfrQBSZ7g0jqAeuMStPjJ3ttoZQE8eS4nKHRDXYkqvYLNl5fnNzBprdKil71
 o4G1sicwopvrKiwGNw9ndt7XOuaJxjVMDXP9UQcJ7YIbgsqBezQyr3bm5g7v0Y39D2OO6RZAuyh
 xaXiyE4N
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68ccafff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YdNVS5wT9Qrk6_kBnO4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ADS3-e4K1-VuXB-6BLbtpG9pgL5VN1j_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_182106_025778_C3B38D8B 
X-CRM114-Status: GOOD (  19.67  )
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



On 9/19/2025 6:18 AM, Carl Worth wrote:
> Jie Gan <jie.gan@oss.qualcomm.com> writes:
>> I dont think we can change back to sink_data since we introduced
>> coresight_path to wrap 'data' which is needed by the path.
>>
>> I suggest you to add the struct perf_output_handle to the
>> coresight_path, then retrieving it with data->perf_handle in
>> tmc_etr_get_buffer.
> ...
>> We can assign the perf_output_handle to the coresight_path after we
>> constructed the coresight_path in perf mode.
> 
> Thanks. That much makes sense to me, and I'll put together a patch along
> those lines.
> 
> But, further: with core coresight code assembling into the path all the
> data that is necessary, is there any reason to be using void* in these
> enable/disable functions?

In my opinion, yes, we can change void * to coresight_path * for 
helper's enable/disable functions since we have everything in path so 
the cast is not necessary now.

> 
> Could we also change these functions to accept a coresight_path* and
> actually get some compiler help at finding mistakes like the one we're
> fixing here?

That's the only benefit in my mind so far.

Thanks,
Jie

> 
> -Carl


