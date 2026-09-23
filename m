Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D40C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=FN/fRLfjLtHsNM2FyTP18L13nc
	YFB+p7YDjGj+VUMqTKjjkSNrkhyRkwFZbDrmpKiFSo3ArB72mrn6p6CqVCTmUfdIGr3Q3+4tDg3LN
	MN6fsmKtU7CifLkpm3ctteeRt8BivCiA79bNHDn0B6Zcdm5n1fxdmjVxWvCAhNyqE5EQHBHucLavq
	PTOX5UozAHAThVi89JY8csTkEBmwV6GOvAUD5scTZZmPlBMYnN7ru+hYvyl7Lj0vgJul7xrNkA8K5
	bGWMj5sOF1wlqeQv0KNwoicHvNaY+Hyd1n/W0y397GTMWdfuL/3lyFHJCyOZqhzM6sgt1zbnRo/98
	QzTLi/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OKA-00000008age-2nv5;
	Wed, 23 Sep 2026 14:51:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OK7-00000008af4-1YRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:51:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSlD2443264
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=YDPluFm0OahNv9wZ
	cGvj+KSuUHVh95uSwMdsn3P3kJhzwjTDpi43NkpI/2SoCSI3jul35+60XSfNXhW2
	DzV4vf0pvvgcKlCUDELPwYzEuKHTJUDAgYnveKZy01SSwovXfd4dcd7ms1k+G0Q1
	DR544JEiBRHK5KLhHhHmydrvQ4mAx8IUEG2OSl/q1jOdNUBZrV7yzIvJJYIFO7Hn
	hNlyLG/AFRFUoIuH5dHrj50WnXxxxrN8G7TM50Rg+kYg9zpFKAMvfLYSGHWTOZwN
	+JuCpav51YiRfNXP8SN7C9RDlzxtfrlLvwFyC2iiFGL6nmABaZXj253uamIf9KuC
	98et3w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hd85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:51:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so2377814137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175109; x=1790779909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=kA57M6+glfXo2u4ZHxkpUOZ3ayK5NTHgH9cQ5NUTAV8CSI7alT+UUbU9W8g/qSw5hN
         B2KvAmTsx8HVK7P4yBK4tRcaieOYLn8YhoY2OY2SEjSoWmFvFNpxmVMo6TdNj+h0q2WA
         FGigCM1IFBR34GGr3NEDwNSrdr/5BUWOaoA0ibdY7JcD+/jjD/E1MGGEsv78OLQFGN+4
         0YT1o0IgUCBoYes22zVsHCG2M5A1H/bb23zh3bHIqton26UFb6qJ5OJOaVrDPFpmJKPU
         E2+A0fDYlBrwerHxr02HLsK1owXtE6up7pLPXhmDMN88ddmNzKoImZoHGJp/aJDWfkhr
         BMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175109; x=1790779909;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=bMLEzwRHS+8wA2+2EctLdtUioxGfkS2xcD5yWlrTIhvC1WCOQlyQ0ACiEeisbQZ70e
         YT234ftOl8wdH9tAIr2xxCapnYwnWTg392nbP+AbLFCdA0KGvnqZ6NZj616OUNk8qd17
         jqnTQfu0NZSBeFHfLjaoFIcsq9vWiHQdzfBXjNzAMgbsz9hMTh6fONRo3TkcYFFx+D0X
         N/+oLvp9GNb1NoEmpaS0GBGhSuqQoogi2yEFQ5No/Lg/WSginuxRdIMYKQKbjSZ7fK1i
         gKf9Ai0gFNqHT1HiKmFV3QkwbRQnPeVrPHqKRSMVQTnvMNgHiVnvMt7RUxZqtCDeeDw7
         fncg==
X-Forwarded-Encrypted: i=1; AKwUvBzbQSBbt/WiLJpq5eWnpmiAbb+jT6cZqpEIwAeuznQ3DXnepv9oBHV5KGisyoVEMh+wVa3CPOhmY6K9AYnnVE5s@lists.infradead.org
X-Gm-Message-State: AFuF++kg5o8cd8IWVFwWXA3r241+BEqax7vWLyPcPwMonr5HmTEYg5AP
	RP0Dy9AAn0+45EbhrsEs4pwigoNwRpSnpPL8MZuMRwQQH9mwybAe0/l7cDPb4rGIh1OZI41Tikb
	MFVwfRSJHn6HYQJRNWVaWGFJSf8dmbWlKc2e2u/7QG3JFMjTypx5KtTmEPwacNZuLDApCtRP22z
	4BMQ==
X-Gm-Gg: AYBFou0vI4e0bXg9K42AciXvLM1Ye8Trc2KD35ildl2t6ccqVb6yV+fqnlulO/dbYV8
	ot9Xm7428fHk9eKPP4csu3HN607ILSJ3R/WThyIIE6tv3OZ3h0lzxVMCG6kKcrPsREmlz5SsS57
	Ysc9BzjLpSSaiHAI0MSzkHdTXotHcBMP3DBEvwGrVe1m+bpcvo6d7oLkL5wZWEoE/WjivcVJT6A
	cJIdXHKc9DhaxBsslKLqG4qZkK19hj066+VC5wdfz7v6jqCbvGpw6f5ioOJYrns3XEKN73fk1sm
	dNsCNyheQJ08reYedlL346OT1xBZRy0X9p/hQOUVBSME6yFkNl22jq9YP1lgEQ3kFxi0GGcrk9K
	HcvUKEPU8kbdLc3HiBEXAS/WvHKaCuCZdq8EPE+ptorOSGcsuwixfSh+xXy+c30Iw0eU1TXura2
	cixPWvWmqWhJOAjVJqO2DvDHSXVxSNswVHHec6SwCVWMmIg6OIlj594gBTaDf2dSs5ejA=
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196574137.16.1790175109608;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196561137.16.1790175109223;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60a04csm143005866b.23.2026.09.23.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:51:48 -0700 (PDT)
Message-ID: <50b27e3b-729b-428d-a903-b118a5bfa249@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ESlU-WrOT5-ILFGyrY3jr6dGgz1TOYg-
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3e786 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX2JjuVf3SsfTv
 0gGvFlN71B2EfhUQOdl9KKxbHKDT3i3S6pmfCs/MY3k+1MOydoknWUfdaBrZ7Dc+nyYmPbeDfzi
 FBBr+N+i8lxgKyEkpCLCmmxY8rLBjr//RIzlGUi+BZPkA0jPlWCNNtK1OQdvm7svXa+bPlcse4D
 Ct1siQt3vot7u6tyIVD6d/u61KXChuOhg1J2eESLdROxZoCDTi4v2cq/iA0vZRjT7BWvZNs3wzB
 aDr0AZoaNBJJBsuOqbL2VuqBBPwrqb5nlV0wwo7WZPqDT5p6z/ec5VBccnHpeEKpXdWjSRWsCJv
 k40tUNJ959Wu9zVfenQxvxqR38T23vp0U+uxfg81eX8DTHYCwZxlP9X63ig5cJ4SuuQ03aJARp2
 rk73fyhUzOU0hqd3L3XW4/O8w/Z2q5bo6oYmTADQZRfaz9lcqx8nHZ9tBPA8wLiY0wg19GtRZPu
 biIHmT3P7n5W0mPVDhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXyFDQ+T1rf8nm
 hyZYS56LcR7EuoU9cyUZpNFxssUieS0QDhgn2luZE7pPnijyA0IgaApvCE/PXapd3FEOMRFyY1E
 /tvt1jgSaINmTdCQ/NgkReTwfi3t+KY=
X-Proofpoint-GUID: ESlU-WrOT5-ILFGyrY3jr6dGgz1TOYg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075151_475057_D927DEB0 
X-CRM114-Status: GOOD (  17.79  )
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

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

Thank you, the fixed up commit looks good to me. I'll try to also give
this new version a test spin soon-ish.

Regards,

Hans




