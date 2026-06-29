Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2651C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=; b=P4zDLDmhjFmu4ITEMceVGs6r1i
	SeQP1mRD+wJg3HOlgEToqaCqW8EbURS+mCm5DIo82Q2HrW7CUylZOHHfkKwCE+8cr5VrtWQjjxHyY
	9MhOrlQvVuvpJfbGp4aL7DB8NQokAkWUuDDMFJyBDM/YQXKuwYbWT9HmMlB6WUrVJ32lYel+sqTZ6
	ayisFXnfLC7CXyWII0/dMqgdyt1C+jQzTP0FVKf5k9U0dv8SncS5QtIEcH1jMU1jP/m2L1IwYoWi2
	Wan1kTjIXyHAuUKMVX87d4q3xvQ5MSXVDJ5SqDk/WNCbYj6mRyA6GmgnnE0JRDgnyFbO8tfLAPf+P
	4aoePrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we93e-0000000EK3B-0IW7;
	Mon, 29 Jun 2026 10:17:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we93b-0000000EK2X-2USy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:17:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aTDx2368206
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=; b=Xyu6x5t2IhWN50Rm
	RkIdtnimzBHYBG01Am3OOoDXEpgwZ7M49iHo1y/iRG7fi1+x0+1F2qFf+icKs9PP
	PXXsMqM9n9pXjUEr6L5Ay+qpEdW5mty70Ps5AuRDko6vVGOjGOCRcofRbqT5WKoQ
	0zrKOBjwEsXm+ghQ5TMqeK8R8KuyTQKe+aw4sThcuPkRDrBz6mua32YP/8UdMf2n
	fG+rypcyYIRE61MdsZrhzJKYnl/KUA7kwucVsSUYwLLPxJq1RPZrqmrXwPt6wq9Y
	4SXGdYPirMCeu9bcKt6yL6XLLSzfdzQ3sjwtNxLqPpFkcvMFc18/fMsne9k9WoYb
	+UQbzg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrdeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:17:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eebafso3852324a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728258; x=1783333058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=QbheBCBY2Hbigt1zMUyu00RIQuvrytNy0F++XAXDPDPE41y03D4QOSGfzzZhER8SO8
         2vCDDW5auLkDAZezrJohEHtnI6X823r5AwXbXj2SLArSZ/dvftNKhqYcxQbrr4M360ju
         2runKzSeukr1VjZJtRRt+r42MbWJKEBArZyu+H77SucYdVMH0yJN0q6qt11qs/fp4TnL
         /MuDDyWLQHHop2/BQBMowM+BxNT8orSUo0vfqv73CBaQqZYgt+t4yMhNCRxr7zocCxib
         gfYsDIdiCqdNPL6RkzBmauJR9cmuoiJfzRNhtJvPgtRkyv2TQ42Kyco4c1fUyglfqvXT
         1Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728258; x=1783333058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=BTX6tLgsWdpR0TVfvZd1H4RhiTU088K+1kuYV4txOPZYAMstl9aobC5cUa99NhTqu6
         KSpe1pvw0we7g9/pbIfj0KZfgzTsphb9Cw8oLcSH7/b5jN0nrHl5LOTfEKzqcm0QVlMh
         yuV1vtArbxkOtzj2s14hyxX0Y42IV5fX2ktZFzfIUsbOdoE975Kd0B+TSdDJexeYEafZ
         6p/px3P7HKucS39BJdyL+W476YJMAsbnfpZYTKfz7Hcq1JBbr1imyni6fS8ZP6qJY2Zt
         mBXC3z0EYiqz4cscVXBgGc4UfIhOkPT5Orsw2p8g3Jg2qFZcAj6sX4ELBdsElQfmXtpv
         1UlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4nvzV3J7LCqqEeT4LeOy5kuAt/U2DbdCfK2f12TAjWZ2bsLmPgRqIwb03QL9G6ysqPDlGeU1+hmUa92KFaYXD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7EFGlKlYt0ngUp/xt6mqZijmEB+4Ksw5AZzCzU6CampRFKsCq
	wX4Xaz+2WVt7i18mErH5yTudLtBlgzwkir6JLPGxsjxSe/yie07Us1rmiiIXrn7kvjzyZKQdHW3
	jlVjqcA+KUzYEDEvDNjB6tdCoCnd1Ja7fpIeU7IM2ZDyyafYQgJBb7jJxaf3wQDC5zc+cUTL/Ne
	b2tw==
X-Gm-Gg: AfdE7cmynz9kTq3Y8FIkR89rYLbHoXgxNau/gxo3z2S5IsQNxEG8BiI/874Rei7CSGC
	Yjbr98fob0eKqgQfbu8KwSAOhd1kkWv/3ge5oeM3gMJLTKPeYRzKZdxwVkWL5Adq9yf2PF5RYZn
	8h2DNRp1VyFvH53PsdD6fkzKDCEDF3ximiXK0YLj95Ymqj1OMx2S/PxkTO/3xFKR+8cFck+Q80P
	d+UNqY9MlxlHGOOuyGaQW4G9pe1lSRibSb9GiTu0I07+Y2SMNfnbGAJvjsjhUTpOt3T9pdd0Tso
	jBCSUC1SD/d2F7vjCaDPow05EZ9v1I4zZ5JEoLSFt3gyFuZv5MnyUHF5i3HZhwi5cUwCsgiezTl
	Gp31w+Iio4lCRFTW+1Nd0EmoafIeDvBmQBc3YYFSr7Ys1ANfEzUx9/0pyaE/ffuDe6czQrbnLGR
	jODTy8Cc0=
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173881b3a.13.1782728257460;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173852b3a.13.1782728257017;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845cdfac944sm5773852b3a.12.2026.06.29.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:17:36 -0700 (PDT)
Message-ID: <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 18:17:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2026062959-distaste-launder-e253@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QrN1iFxqVxU_l1clhw-sReO3ikZlzi2a
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a424642 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Svlu2gy5LF0AZrWEB8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX751ugaoPQiB6
 W+7YpHxuY8lelUh8jTeuGf9hdpvGZvwSvVVHvqdxsLB9ulctk+/n4FQgUe0nd8yxD+92r0mi1RW
 58NHAronioZAk1aB9QFU8GBtcu6YohM=
X-Proofpoint-GUID: QrN1iFxqVxU_l1clhw-sReO3ikZlzi2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX8CCkLHQ5iCRP
 kPgxv4B/uJGeQnzUzqUvjIVngaiV+TXf0iEPPX5/CDip9rXrtchyymnhleY+P4ENlZ9brQILx+6
 DBjEXN2zM/TibMd2uE1GeEO/IppKZWXQnmNKA4+QyBhMhnLD6h/1Awaw8Uj3VhFKPeNRLt77Yew
 NzthlOMCEpulNSR2zfYsn/teeGbbBlEA1HlOtC2woPuUKi4TB+k3vOPxfSumvT4gOx+juCTPvJI
 bcIDYY+yITv1Lr5SrPw2r2mRqHeI4cZDJlcZRp9rWMrBb7Be+Ghu8IO9/opoOPE1r93DbL6h9V+
 ihpIFOE5PL7LG8nxqHsMPAKvOVZ4cJlZECY3+pCIqMhc419FVU/c39lC50KLJE+59NTz7aGoONs
 DnalLfAjW6X5bbOCmsSKk9/cvgU8mS/dXfWYrvzcaZboLavFguZHkHRI7HpxJ3Zgdol+DvyixEb
 L3ctnXVYjAYyiPwlfug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_031739_744918_1C1C7FC1 
X-CRM114-Status: GOOD (  15.58  )
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


On 6/29/2026 12:22 PM, Greg KH wrote:
> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>> Hi Greg & Alexander,
>>
>> Apologies for interrupting again.
>>
>> As the TGU hardware plays an important role in Qualcomm tracing design, I
>> would greatly appreciate it if you could kindly take some time to review
>> this at your earliest convenience.
> The merge window _just_ closed, please give us a chance to catch up.
>
> Also, why us?  Surely you have other reviewers for this code, right?

Hi Greg,

Understood, thanks for letting us know.

Regarding your question: since this introduces a new 
drivers/hwtracing/qcom directory, there is no existing maintainer for it.
Given your scope (and Alexander's), we believe you are the most relevant 
reviewers.

The reason for creating the qcom directory is as follows:

/We previously tried to upstream this driver under 
drivers/hwtracing/coresight,/
/but it was not accepted as it is considered Qualcomm-specific and not 
tightly/
/coupled with the CoreSight subsystem. Based on this feedback, we are 
exploring/
/a dedicated drivers/hwtracing/qcom directory, similar to intel_th, to 
better/
/support this and future Qualcomm hwtracing drivers./

More details can be found in “[PATCH v14 0/7] -- Why we are proposing this”.

Thanks,
Songwei

>
> thanks,
>
> greg k-h

