Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA9FE7BD8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bun9iwrIx5XvoYhhYEOAtScOimlPaUih2JHFachiVsc=; b=Vb800MT7uD+yAO/FkUMvFQAfMv
	qAgotclYBjgJBLzJ8qFRGf1KT+5i60WzDuJx+WoZPto0epCv2+XkHgOmB1B3xXL+X3VFjld/k5Qt3
	sIaXBu5LD/MvjWs9UrUwdXQCqX1ENVm+lceGuHUWLcmc0rwGcnxyf+mE7En9RjjKYjHeyrlvTJO8H
	FUXofGZuzl+UYnw4U1EzYN9wc/cCtYK+lunIEpJxFMj/kxe+SoWioHjNyn2Eofe2nyFG518yakq9b
	4J1082o12XItnBpUbRifuOqys3KxyPP8aZqS1OMhvvVAJzar9QPXkMkXI2ATGrcsr7sW+PqdTp/O9
	b7FoFrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwJO-00000006OUa-1hFX;
	Mon, 16 Feb 2026 10:58:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwJL-00000006OTp-2kW4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:58:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAjc171728549
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bun9iwrIx5XvoYhhYEOAtScOimlPaUih2JHFachiVsc=; b=orPkYUKmZPIM3dxv
	wE0Y8kQ2zBrodFy2o193HqDKTHkI23WqNTtuZlI+XXl3w8UE8Ak9DpSkMUX6xq48
	5v6yNlYiO2XeRlnie1HIhLjzrFXTVrSw5+kow8mHJxwdYKAaiGsaGJZ/LWSP389M
	nVdmW30fQt1auD4KnE7C+05hbNfBcFr2SpgdUajJ83Pa4k7T6ouptYFDeKQInfUG
	7c98GX4vIHlaKWRWtPmUZ36LPwIIaXVtA/z1MqheR6DpC//MHKJDUzAC4bOXBlDd
	8+GfyIIRuNuPsRlQUJI94h0ioYftJuVFJHQaougzsc49SccPJW2FKEpvzAMp2D/2
	iGi2dQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9hcuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:58:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so3560310a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239517; x=1771844317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bun9iwrIx5XvoYhhYEOAtScOimlPaUih2JHFachiVsc=;
        b=iAhlRNy0flakwxNOg7YDqUOCMMxY6TPlOBp4Jtcq0Xv8dAjZKqN0zuGvm9cyo9E9OG
         2FphA0SHNIXg5/jX274lob7HNZV6ItQ1t/KEgicQYxxSNxgWpjIB12y63a54mzmnRkdc
         1bNSCCnzsoY3kb1nV6y6yXFjh1mHF0FnWP6zGKlZSKeAYc8+SSGBLoD2VbbXsKQF6w6i
         8YZPr2dcGJVp+hEsCVaQWX3WjR419xUQHHz00yr6EywsRD5vsHgMirdbcogm2OxfHXhP
         nf8xN+Fp0hEZngQjfunMrOGHFQ8mCOqYiofsYiP9nyoBgEZ8G26/I1TVh/nk+SgpkC1v
         xYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239517; x=1771844317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bun9iwrIx5XvoYhhYEOAtScOimlPaUih2JHFachiVsc=;
        b=P3A/8pIrAMPnCB4FO3g3jRjWtuod7We5Wb7zx0Z2wj30wDtnG4/aqAZLCS4qMkYDXi
         2XOpQBAqceRus+RKQ/0MV+fTuAWPA8d/Eo22skRslTegep5uS3qD7MSulO7DnsbDkxn+
         7PFQbAF+Vf39DNph2vFYvzUmIB+NkWzsuGZDuNwCGo4W7l0y1ZpoX+DC3NsaPyhnUcR1
         OK0W5ZTXlHPlgjr3L8xRLPs20Vjf/Vxf4uO4cxF05r+6bOuHUQPMpuge608Wfx/arx/+
         1SVQukFNbcPVCfE7hsPwxR6TlzRPZJ/e7OJP2EhSu1Nvog6BF/HSNxxN+sTI2DFSazK+
         5nlA==
X-Gm-Message-State: AOJu0YyceqERMLYdT3e5Bf5yX7SVo+/4KU29Zjn7ZJkwBtv+wOtv4p/q
	5XIhBZnEBh3OQjHXDO0Q3bnNEcGarH3beMdOhZtMvCLM1b9Xq5UiU6QgB3iAoY0A1LhagWlTdgL
	dhRibwo6EEQk4lY1GjgeqhcT8kmd1lDEeAzuVnzjLvXiI3s7KXN4HDoXTtmYHHrR55yEYWwbF/e
	mrdQ==
X-Gm-Gg: AZuq6aLHOdjFmTLKV/jK3rl2Cb9tuQeJNEPH6TAQeOzN9c3jfozWkpDaZMj211H2GoR
	+NqKq4PRsiPOp3WviozKdHEXuRG2gCFtVz/1c/c2v4MEX01fzFe9hAD9vDzcu9zzy9/giESJyx0
	Ndx0VluAF4t0AEt3jTCgtn5q/Ctxeq3s6j7Ewr5WCH4NN1/AeV3qzlhPa6b+KEBIvERapQjVb4q
	YoajC3a0mrSZlGElL0ZaE2UUOHp6AIBDRZPDRwlzJ2aW6vJwUc3yR3SB+1kMkCe7ARAHP5VAhQY
	xOpCpK/r42xUxwdVCv/6+grTa/jNVavWDaIYT3IH55Sb+asnMtySZjY7GbwkiDFDgsHlx8gF0t1
	hOAWROc+DMf4BOPVMjElJZv9msmag6h3IxHjP1zfRtlRipNTdz8bu85CuJJK/nXVt+kjaH33E2X
	zvs0APNN/mPWzNDxrSPEoic1Hd89qUeZ+38KrL1MlJ2w==
X-Received: by 2002:a17:90b:5810:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-356aaa76375mr9674733a91.8.1771239516747;
        Mon, 16 Feb 2026 02:58:36 -0800 (PST)
X-Received: by 2002:a17:90b:5810:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-356aaa76375mr9674712a91.8.1771239516272;
        Mon, 16 Feb 2026 02:58:36 -0800 (PST)
Received: from [10.79.192.219] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a87f47f1sm5470424a91.8.2026.02.16.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:58:35 -0800 (PST)
Message-ID: <d2303150-5692-479e-9a56-11a52ba58c2b@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 16:28:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/35] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Mostafa Saleh <smostafa@google.com>
References: <20260119124629.2563-1-will@kernel.org>
 <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
Content-Language: en-US
From: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
In-Reply-To: <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C7sy5i4zhynG9lVkyT_cQ6uQfgzlUsqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MiBTYWx0ZWRfX1LrpwgOwpRIu
 hVagjU9m7quawkk/Gz7+ouUGIyd/F1KBzxIXk6lQSbjDONdW+ywJOM3rhDpIfmOvvn4GWoQcLOE
 n75P35SYpvM5C/pJLCOS2FEsbbkHoW3W8q+00XfRlsmLlBYGOSHZFUDPmIf4quhmM4TRaQTgM7d
 Ss0YacE1L61JCqgMhkTvlC+hH03OsmIVqBQIGfgsWMWxW9/5V9q4lJCHoA4oEjECcpw7pVlwl+N
 P4L25qFo7sTU0WOA9lqNpulH01lGTBlSHj9DK0jRHtr1JIY3AJ6rmQQ8vh8+/WvlDC8PuXUzESK
 mYm/A7eGL6YRWpQVRE+6fysbxeqpyB1kXtt5X0ICh7zmDfKioRPkloclEsqCzTOI3GBeCvjgR3O
 xguCXSNlpJkjuuJ2g295gvQKYfHEG/aF934KOpJC9PnN8hcrGMC/hRSf7fVjj7OkUERMUr1n068
 niBky54ZKVjlfdJwhQw==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992f85d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=vdI5acRGcxMedrPici8A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: C7sy5i4zhynG9lVkyT_cQ6uQfgzlUsqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_025839_841098_56C4AAC4 
X-CRM114-Status: GOOD (  15.85  )
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

HI Faud/will,

Can you please share tip of your commits to apply the patch series cleanly?

I could not apply on tip of master branch.

Thanks - Venkat



On 2/11/2026 12:28 AM, Trilok Soni wrote:
> On 1/19/2026 4:45 AM, Will Deacon wrote:
>> Hi folks,
>>
>> It's back and it's even bigger than before!
>>
>> Although the first patch has been picked up as a fix (thanks, Oliver),
>> review feedback has resulted in some additional patches being included
>> in the series. If you'd like to see the first version, it's available
>> here:
> 
> Is it possible to test this patch series w/ the QEMU or it will require
> real SOC platform?
> 
> ---Trilok Soni
> 


