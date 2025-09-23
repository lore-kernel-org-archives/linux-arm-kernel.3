Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059B2CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 01:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqnAkPOsKwygUdduVzkxqejyVHLb05PYDmmJ4BQXCWI=; b=A140fGl4p8ldNVT1a1P5KglGkO
	S1VcP6IoRMxVFHjoS3sZIoZL0BK1gu1uTodjJBlhma9wiVBGR7/UFagHdpDsBTSsYwpGHSBNawVU0
	VY5fhdRCdP4p5YMBi8zFrnGruUyUlVDDXGcHSvrj2/GDk4Q3X4wzG7y5+RGtYpL7Io1fTwuz6+ByE
	uNduruW0O+yTeFXqhcjGW6zJQ1mxDyqaDXefi+dNbyD3xBP1hEwxHnHx/XMKae2y6/yAsIPsZR3b5
	rA6BUa7l8ofM4KHd/ajCU0CIrsSSL5ssnD7hAfMywUBXh+ydvxX1iqXzZayWNb46xjk8IyJEPFTnM
	UyVhP5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0s9r-0000000C3Pc-4AO2;
	Tue, 23 Sep 2025 01:49:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0s9p-0000000C3Ok-3GYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 01:49:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MH5uHq011598
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 01:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqnAkPOsKwygUdduVzkxqejyVHLb05PYDmmJ4BQXCWI=; b=oFZBk5PhCGGu26qN
	jB2k9lLR0R4dRmagRBpE/GB95zC06oxNDHSlvmplZYSgEFSEUyI8Qp8ZT4pLMioc
	cOVXxGGU3wZ0njV5dfZ6PJU0SMekoI1vL0b5zG3wP10PJPiJF8iaV1h0leQ5ejCH
	PBo14WnigEvA2MSYK3S7eGpydUkrMAK5BUGAd3Mfd0M9hrWGiXyKQd6kZdzxDbPN
	05KxFQi4+Ys+Pm05xQL7k+QNpTk2soKeBnJ6jRRb9t2T/C6M1xcA/97LM8Q1nynS
	HnMl4r9b1GZrXsLcshujddVrp7+mEAPJBQjr80xgCvklp58NUbNZQ2hKCd9kYLPU
	QORiXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhptw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 01:49:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-248d9301475so69421755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 18:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758592167; x=1759196967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqnAkPOsKwygUdduVzkxqejyVHLb05PYDmmJ4BQXCWI=;
        b=K7/GvlCBmrXnW/8Nu6DRkt4YG5TYHb8xcVzsmuLIalsjLMc6bwyOTG8iToe21t8es/
         BDuHhvNXOf2h7m86o9jfohmrjlWhkBPKiMRfs7iEoPFcNF8YfrioKxfStMVL/lkmo3Zw
         Y4rnPb4w7+3KSbTxBzg9sPeHETBu9PLD5CIs3hPoTKVukbSrcUsHNlz1iajFtFcnZ3dg
         4TOQRXpY4EqWL31qr2ToTXVQJYYWlVCNxT4IqiQl2Bxj50Q10WVKRoDXl+mUpSDeaGU4
         MoGM6l+5oa2O2nJUtfbvdWmkYNUcCmhN5gLQRukEfQYBlhTheWbF+z0PjMfrkA4w4A0+
         3Nkw==
X-Forwarded-Encrypted: i=1; AJvYcCW6q64wndLObKJugfpW9swGijit6TID1CtyPHfwVzlPq7fMYjs9sJiz7FmZ6aY2tzwokzIOhePozrrhhaTjxfaY@lists.infradead.org
X-Gm-Message-State: AOJu0YyMTRbzjK/Ar2RSwantlYpShIMEgdELNAO+wbAqsaxDcx7E+QMK
	+jG1LULMnAZ7KZFAD76FzcJkH9dwhGJMS3k3JQnpP5V+zSwQ4/x+09wv5M9UriF2nSZsXdol1Uy
	n17XL+q0jh/z5czxBTSLfwX9W4RoaVKttG8umvWwHX7fRkjBl5uJaERo2XFJv9HTuxsZWapDDgR
	1fsQ==
X-Gm-Gg: ASbGnctcw5I6THxBmiRF3zDyXPuVteN5McR18rgxdQf7c2X8Ym9sGakHngGlwY/Ty7T
	efcoliQzBZLhrhJIEDuiak8kg1YOeyccJvFX00ndG53Azr6WZbgsSq+0mVP2lpqo9ypVyR2xEoE
	yFdv5TF/nTuNBGevDAMZBW/R46nXDhQnl4XCTB2GIYr2HaAX91j/F6fZVI3pRqGLtsbQxotecYb
	z7uLY0MuhRZ27IDE5cdyD+jsDTL8QX3ZS7WsvggsQ48itykWnq3qU+NxrgNVmV/RSVsNTLz4XKL
	R98yA8cG7V2PHaqLI+nylT8vyFIvjRs71/2sHf0Xt7qfPX+dR+oSh70I5kfMJV3be94sKhCf16T
	EkvjCG2FJxok4mUziRCSpLIPiSiLG
X-Received: by 2002:a17:903:fa5:b0:269:9719:fffd with SMTP id d9443c01a7336-27cc28bbfcdmr10366615ad.1.1758592167315;
        Mon, 22 Sep 2025 18:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT5CdMHBfAlbN0dyDAVUJLxDBheFXKrvsbf1/f0gg+rnfUpig+w4SPjSUuiWXkm4QLYPE32w==
X-Received: by 2002:a17:903:fa5:b0:269:9719:fffd with SMTP id d9443c01a7336-27cc28bbfcdmr10366385ad.1.1758592166875;
        Mon, 22 Sep 2025 18:49:26 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de979sm146799845ad.69.2025.09.22.18.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:49:26 -0700 (PDT)
Message-ID: <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 09:49:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PhfZ5wI8r3yjQLFnlUVPPfuPtbEx0W21
X-Proofpoint-GUID: PhfZ5wI8r3yjQLFnlUVPPfuPtbEx0W21
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d1fca8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=ck2vDrGU2QCsmqff:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=vzhER2c_AAAA:8 a=3561TshI6JjcMm11RPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX20y70oc9WtR5
 /atOm9YYPZXjah6nehdsBqLv6KLhMAOpt9nNeVyx7LKhw4Jkqh/g5iBwB/PSjoxNQirk7L9nbyL
 4Acb+aNYA2X2o9tM/6DZPf2oqleyUp3oSvu4FO7xertApHRXxBsBj9FFiZoXcBVRPDjnLnOZQS4
 SfHPkN7xJzCUNb4EGjXqhVx4kQtssRsmpoy//56TEP+JibgDGNTtYEQHbOp9j4Q68ZeLOjXYVYd
 G/za3qCggdpwvSsquNhM/r2sQ11xaQ5qcpVtmB7BEqqXt+7KR+HcWS7jynYDi1ZP7BJNyjYbkb4
 Ce/It1kbkeCrnqeVnKZhdKKViNNMGeDETuCTLAzak200w1lOoeC8pLxHG/yUBKEejexrHXCb15C
 ij3xCc4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_184929_939679_E612F82E 
X-CRM114-Status: GOOD (  31.14  )
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



On 9/23/2025 1:31 AM, Carl Worth wrote:
> Jie Gan <jie.gan@oss.qualcomm.com> writes:
>> From: Carl Worth <carl@os.amperecomputing.com>
>>
>> The handle is essential for retrieving the AUX_EVENT of each CPU and is
>> required in perf mode. It has been added to the coresight_path so that
>> dependent devices can access it from the path when needed.
> 
> I'd still like to have the original command I used to trigger the bug in
> the commit message. I really like having reproduction steps captured in
> commit messages when I look back at commits in the future. So, that was:
> 
> 	 perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null
> 

Sure, I’ll include your commit message in the formal patch series, I 
think it's V3 since you have submitted two versions, if you're okay with 
me sending it out.

>>   /**
>>    * struct coresight_path - data needed by enable/disable path
>> - * @path_list:              path from source to sink.
>> - * @trace_id:          trace_id of the whole path.
>> + * @path_list:			path from source to sink.
>> + * @trace_id:			trace_id of the whole path.
>> + * struct perf_output_handle:	handle of the aux_event.
>>    */
> 
> Fixing to "@handle" was mentioned in another comment already.
> 
> Something about the above still feels a little off to me. It feels like
> we're throwing new data into a structure just because it happens to be
> conveniently at hand for the code paths we're needing, and not because
> it really _belongs_ there.
> 

The core idea behind coresight_path is that it can hold all the data 
potentially needed by any device along the path.

For example with the path ETM->Link->ETR->CATU:

All the mentioned devices operate by forming a path, for which the 
system constructs a coresight_path. This 'path' is then passed to each 
device along the route, allowing any device to directly access the 
required data from coresight_path instead of receiving it as a separate 
argument.

Imagine a device that requires more than two or three arguments, and you 
want to pass them through coresight_enable_path or similar functions...

For certain coresight_path instances, we may not need the handle or 
other parameters. Since these values are initialized, it's acceptable to 
leave them as NULL or 0.


> Or, maybe it's the right place for it, and the cause of my concern is
> that "path" is an overly-narrow name in struct coresight_path?
> 

It defines the direction of data flow—serving as the path for trace data.

Thanks,
Jie

> But if a renaming of this structure would improve the code, I'd also be
> fine with that happening in a subsequent commit, so I won't try to hold
> up the current series based on that.
> 
> -Carl


