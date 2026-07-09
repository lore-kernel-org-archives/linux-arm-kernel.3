Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=; b=POvmwWGu+j+Lcml+keEQd+p5db
	+pXRxjsIoJXO+zBhXlEOUkdhcD9hU/8W2k68mZKkbA65g/T6u8fLVRd+v1VJKwohK38qwRH0wWDzJ
	1itOziJHbcD6YsxNVxkj+EXWyTQ76sqEjAgw5Fx0YCFuNlERtQoWnWyDssPrEPDp4U9wKZ9M+d2E8
	IzOeGFoG6lIQ1xBm3l/AHWoael6ay1Q4Wg0DV0vxdQfDmDsno0AsCw1Y9OBFoEQi/LQVzsML1DfAj
	vFRuGO2XDx4/mGck56HUS3w8t6EyhgNmJa3F2PVHor8HcQXtB0J7t6KnjjGapx2BxXu9mQpUjnqcN
	xu/j77qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMm-00000002UM7-1zi5;
	Thu, 09 Jul 2026 13:00:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoMk-00000002ULa-25G4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:00:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN1OD1656983
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 13:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=; b=MBwA3+2xGaMFQIK6
	toISElGCjPxK6UgWx32m1txDEwr4XmT9we+dUbKAYmJyc4GpEG8LyIFR1yXywR27
	C2Yb2pZM+tpB1r3uiQEmmdsdBincSlHAnNAveR3TLbZl6yfEHql9Lw4OuA9TlXkX
	qwx3Dmuv3SY58JJ0qCqN7yx2PadrQD6xrX5SmMbFs4kN/Qu5+oWpVLQQUOfpq3cU
	VfHofYaawGCqbNa151hNxLg5nz5xcrD63BUvHeS3hsH00LA/oAWTa+AhteAVHVOZ
	CZYbzgRRYuP3l6wQqe7J3Wk4Fn1mIOZq8GP1QKv0jWjd1N1LEbD/pEUQ8y0aaIIu
	sSwWog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3sp2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 13:00:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so9922606d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602033; x=1784206833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=;
        b=IvY2cl+8Ajrt2dAtjj+++ujs/+1HF/rU6768aFHXzOzxVQygxfYziXlNGtl25iPpBQ
         lcO2niySse7nI1r+N6vO9p8Omfi3q9zxt3+Wgn6o4oppW9+m4nDdLYrfLegArAN+7Tvd
         HVU3hA/aBRD/7i1xdtu5f0Eefmo7AWs5cjTLiDqWyUyChLtbyPWoDGsyn1NZaY2sQcTF
         97ltr/2widxbrqD8hEZy/5m3JvyrFhDC0nbDuYudXCGFlJZr1LVJT9hR9cSS5aWdPEsk
         Mivy5OPE5EmAI/xMVXF8YGQW6HYi4KVgOQ22W5XzmJT2NH4LYR5/rMvbWTLeAy22j6YN
         ciOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602033; x=1784206833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=;
        b=rI6+r8ZqCYoP68te4zn6ukvBB6aIRMhGu4jQrRJiAXia9SCR4NHR65HiMh3ay9iwqr
         oVjbZ/kRcu+6rBLzdf8TfBc5xYcHVtGAvhOrlP7xWOnqIJtTVJWEdXmuF9NyYNzIOMIB
         GjCrT/I4GlPGOlibHSzoV/TVGAObpwlTj2f/KoBrovI7M8hud2smce1npicHPsmO+JBy
         kIFdTDLDQCESmKd2XqiDiQK+Cc1tWcgl+uU8Q0TDlZtG843y/QaljRxtEZsz4bmRP6V/
         bxeUnS6r7KWnlAVfNio2Mze3T2LLAtIDLdZaXRK8G0hm+ZDrKhP/OiWfboBJ/yXFcWpL
         nJPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoL/rJ8Bt0QoNXaqL4OFw9f6W9IrFiCuctNY25nyShesGn5Fw0qGDPckTxYfMSfs6t4dZNBufhtteHLRB9H/IbF@lists.infradead.org
X-Gm-Message-State: AOJu0YwMusMTKzUY2k/3UBKksUB35MET7yzDCmDmpsguEsFHx4ek2//o
	J8VuAc4eCNEIhXKEdyE3f3sW/5bXqLRSI2TG/T3poL6HM643Jh239qj8QIu8otTTto6/D2DXFe7
	/Fhjvb57v3nR0y+zG9kCgt8XBgqDjd8a7W7g+B7FCjMHCn0bkqcESG25Nzh03xejYb83YeeErVr
	isoQ==
X-Gm-Gg: AfdE7ckJfKsrb81opQh8DHxX0jYJ+L2mQR8UsoQnhxDrjrk28yorAudDB06LwMmqvSk
	86LMbn2q37GcAuEPyEV1Bn+wpGrILzceQEEYN+kzQXKr5NBVHB3A8CAtWTmcL9Qpg+/TZRcXdyB
	7DQnvbm/B/9OrXtO5/lyueRYCdbkd9s1Y/WFwOIswgYfh4RHIdPJxAL/eICpr4QpVkqaorKKbM8
	NIyMzKnOiLhbgzPSc5xtdDDU672bYCAcdE7El7Ww+tgWIRoJEI4BhEx/Vggb0rbroOohZJ/nlol
	/B2V7OsH27BM4Z+Q7wmmuEAucDMOiJ1UxPshVeVCXHCdtclDNJ5zd4bELyASyVDoJLgrmgIuHrY
	Ds4YjPB5k0Lv45wKQ7K+Exv8c8Vk84EVAFsV3Z1djKinHJ+CFSXXnWgNSRkGKLzirDgx8y1rQrg
	==
X-Received: by 2002:ac8:5f0b:0:b0:51a:8c97:937b with SMTP id d75a77b69052e-51c8b3f56a9mr74714191cf.67.1783602031828;
        Thu, 09 Jul 2026 06:00:31 -0700 (PDT)
X-Received: by 2002:ac8:5f0b:0:b0:51a:8c97:937b with SMTP id d75a77b69052e-51c8b3f56a9mr74703841cf.67.1783602025383;
        Thu, 09 Jul 2026 06:00:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8e86:6bca:4a7e:8b62? ([2a05:6e02:1041:c10:8e86:6bca:4a7e:8b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ea082sm62035225e9.11.2026.07.09.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:00:24 -0700 (PDT)
Message-ID: <6585df3f-2d4e-43b0-81cc-72195a5ceac7@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
 <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A4yDPVeDy6mQ75s7S9Ofqo8Wo4p3mwMl
X-Proofpoint-GUID: A4yDPVeDy6mQ75s7S9Ofqo8Wo4p3mwMl
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f9b71 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OGcXQ3cJPyzbm-w1UIMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfXzR0s9WMvvo61
 FB18RalGR0XCFY+pat8+FIf+Y8rLxjb+mVy8Uz+01PDgNjzvt38NEao5r+zbs9K1p/EoNHyGz65
 h/hmnWghOw/7xHqNzIRBBLluA2p0eyg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX1uWQCFAOIsyd
 2EOGrTsa5NyhXc16ItoH9GnYtfYCYJx2fSodwFugW+DB3NEeVyVrSg5Ylj3re1wbzr+sTpX3bhv
 jR929pTsY3C3D0795xNFYZNraRk7deazV19xah/n+EuTCgPBXr/YRX5ztzXrhV7j6KGn3216+nD
 dbjDianKNRrtekX/JbdnAiOFPIBywT5I6xQITp9HpDisIa0r2PHWnb+piCFl8MMNowokSzff0CI
 523mNi0PSM5hyO8tFyJ0rQZ9CSW+DD/fKC9CAKJtCdfQ1NjR2TArn2SWvH1TmRkwb4g4kFsy0N8
 qbYNSBxX4e8RNO7mzsDginsjFDD8D+y6pNzTlqehWPDP+6fmNVfadsSlpgojboOU8qznjswz91H
 5EXMoyq9ChHtoozwzbXgETfYZJcX+8O/O5GHHw7dL3s2+pjaR1EqvcWvQFG1lLwqBv3e3Kf3O/H
 sWmoxKtz5+Ri1mgb+TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_060034_537436_6BB656FE 
X-CRM114-Status: GOOD (  16.13  )
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


[ Cc'ed Maulik ]


On 7/6/26 11:16, Sudeep Holla wrote:
> On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
>>
>> Hi Sudeep,
>>
>> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
>>> (It is always good to cc all PSCI maintainer for any ARM64 CPU
>>> hotpug/suspend related changes)
>>>
>>> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>>>> retained. The hardware design on these SoCs forces a constraint to suspend
>>>> and resume the system on boot CPU / CPU0.
>>>>
>>> And you fail to explain why they have that constraint.
>>>
> 
> I still need the above to understand the issue/constraint better.

Ok, I think Maulik can give some details here.

>>> Is it because some secure context is not allowed to migrate ?
>>>
>>> We already have a mechanism for that in place and this hack is not at all
>>> required.
>> Do you mean a mechanism for the secure context or for preventing CPU0 ?
>>
> 
> I meant constraint based on secure context.
> 


