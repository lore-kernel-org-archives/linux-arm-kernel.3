Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C8E6816B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+/JvRtAe7W6SXMnT8BD5ObjmKH2oFAc1EBFvqqazsk=; b=VsXSsPNHBT5KG6i/Ia+XcaQ6Wl
	4VuyHSAYO3DDuaWEWv10TklV7MFuOu6lDeLFABPjr9QMnvjLjM6fMC1Xi3APwL8Qb5Dl5W2TpNSAS
	f2oAf6KC8UhtgHQujf5axwXjDTfz39pLl6ed2tXIhfxBSopBxc5CI/RocH01mdr9xmS6yHLoBB4/e
	mTQeJD8oa/+q7x/JGH2nA8qcxIIw6SahEWq1Mvja3r9o4KXTS/sVycQxoHeuhlfOlIFj1o7Z+vGR1
	5ClWvxPddIXsg5uuRYa8vSicQH1L7CYigs6VIahkhMcXsbko94SHmJx5WFBZuuwBgLWqk/91VX0ps
	eN+cNclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIY4-000000082vw-185S;
	Tue, 17 Feb 2026 10:43:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIY1-000000082vZ-0SA0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:43:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H1ldRM1232466
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+/JvRtAe7W6SXMnT8BD5ObjmKH2oFAc1EBFvqqazsk=; b=EE+UoIXh2LMx+AJB
	glmDwFL4ppO8lSmJTteK2V7bWWKkOVkrg+d8AnZhtvO7eXeDcJQlxXjMqSl99NVV
	mj6I+TTUewbk851LVzDdc2E5qdBkoqFrJ5RmO9kA5wn9s9efGSGUNV+9y6EbU9PD
	GRKP6CrAPr2TfCZQ0hdwI7GipWb9UmxvEwyAZ+uPnKtJdWHBpo0WAHyM4hS/wCn/
	FSvbYZQg4vyQtfDXDbls13cy3Fk1bIQnoGs6HPG5JJSx7NI0Hox47aKeCGjqSOwA
	HJ/LRwOq5dIse8iwImMwR5WgLMy71iTrnWq5bjTG1bxq4Dl3tl/eUPIrKeiPm4S0
	P0o2xg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361fyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8f8c81d02so39522275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771324996; x=1771929796; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+/JvRtAe7W6SXMnT8BD5ObjmKH2oFAc1EBFvqqazsk=;
        b=BJi9ffkeDOdZF25hyVJg7s5UKGB0n+skZdweldHzNCK6zyXZABmh41a1wstv72CtSG
         iuy2IV9PQC+WgFem9aWg1w54INR4E7qmLUYsZUO+SKtRJERJdXwDQWlZStpzDLPnvmVY
         FDBURn493d9LDG8QAUpcW4OUB8ZrdGCCzZPV88PUf4HH4RHR00VDyW4ooNLGNJnTHdnK
         giKzTTstKIWHOvVzfFloFUW1J2mBkCiocoMVswzGih04fy8mK6J2TsTdgsvUocM5obqW
         QZG7M4C2grW1wIOfpBZ3yebYNm6BRVbkZS7gh9eZFfYp6HvOG1hEJlrXUDDT7E1bAElM
         RwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324996; x=1771929796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+/JvRtAe7W6SXMnT8BD5ObjmKH2oFAc1EBFvqqazsk=;
        b=Sq0ZPfRRZXDpjm40Cul5NGACw8w1sp9x2gCQvC+1Fiv0Hv6ZPiqzpJ6DvCBlLRfUa1
         b51iSp1gh/4FouklzgP/xPFLnnkZqo+PeBLwlNNj9/j3v+vSVmHGqG+RKSyX2YzJNeZ7
         /JOynOW2q1HTLPtpzK6USKzO2X+2hOnEVuSDRztFlUCLOL04iW4DuT34E7J551qAuQbA
         X5GyUvIYJuE4fzYmhFiOJ+cUBoBxTFxqEBG09aVz/f5bhrXXufhkp+VL7EKlt1hubed/
         gXkJJdO8hE2lUM2DO6zk/KyrHBYa0677xlRBZnBFQa/JYw9Hu9ER/ny9cIzZUxnEx88D
         Y2gw==
X-Forwarded-Encrypted: i=1; AJvYcCWO8yuUkYvycjjCqmsXZUh7bPRXOsrHDx/qLQRJgLIgo1iWEWLnc5519i5umDODI3jVBzVSUBQBj23FcqaQPYAX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5i/QBonqoHeF0xg7HtQ2XTxrYr5PwK+Yv+dXECgdhMoHALOiR
	f3h9DNFdQ38YEauOGf1U3bFli0OUtXYri4i6dvHZfXOH+5v09CFPxRxqZD/0lM/Hkj4WOB1eCqq
	Ezj11sNmKtkDXAw/UpBitEgXtT+OxyAxGntiowmewpukf/L2eSWZ20vMOwGjGxPFKj20ub6+tns
	KxTw==
X-Gm-Gg: AZuq6aJTB6Mk/v5iBrmelTYIDXUKAxyK70HDFkCF6TmdMYsNHKMmxRif5KUoN9Nb8ho
	Lh6nB3cXCo3Stl6G1zSWWUzmAwZoQTRuvpSa8Kx+uKdKiz4EmqjI4b2IFVuVLjeU3oPOxI5xovi
	/YyBsdAxX9JeWaO+cBrl7xb6BSZAIykNqCdv9kqvejIUHCyXLyV7JqfNBEg2fPoi9or6ki0UTCe
	vOGOdguHMLvrUNiYEH2c8Ti3StKWyls0vJdYoVT+S5nIQsvqrYo9wa8t19ysvIUaiNW1A3kIoKJ
	o10SJLREKutPVBoCXxq5IQ/UB9YeqWzR1LVmKcCcwuAwpJObuEqdNRGiUbm3PT+/d5XQWlE1HL5
	glsme090lPaWvcHFLZ5AP3yaKifinMxzn1r3/7nw01rOGsm9RmU8TksVT7cM9VQe00frrZulrcv
	i1TEz29yLmH42p4gasC4LCxjKxKWXYR7AtJUWVe1emoQ==
X-Received: by 2002:a17:903:3d0b:b0:2a7:a9e4:babc with SMTP id d9443c01a7336-2ab50647207mr149474895ad.61.1771324995782;
        Tue, 17 Feb 2026 02:43:15 -0800 (PST)
X-Received: by 2002:a17:903:3d0b:b0:2a7:a9e4:babc with SMTP id d9443c01a7336-2ab50647207mr149474455ad.61.1771324995265;
        Tue, 17 Feb 2026 02:43:15 -0800 (PST)
Received: from [10.79.196.238] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa21dsm94508805ad.12.2026.02.17.02.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:43:14 -0800 (PST)
Message-ID: <237a1d5c-46a3-4459-b0d5-21fe2cb57a83@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 16:13:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/35] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Fuad Tabba <tabba@google.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Quentin Perret <qperret@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Mostafa Saleh <smostafa@google.com>
References: <20260119124629.2563-1-will@kernel.org>
 <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
 <d2303150-5692-479e-9a56-11a52ba58c2b@oss.qualcomm.com>
 <CA+EHjTycHq7WkOfD7d+1-9A7HOAkGzBTmEm-6DB8Y0TNq-Aftg@mail.gmail.com>
Content-Language: en-US
From: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
In-Reply-To: <CA+EHjTycHq7WkOfD7d+1-9A7HOAkGzBTmEm-6DB8Y0TNq-Aftg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4OSBTYWx0ZWRfX2YmThE5odxkQ
 s3BpHquECq+Kg9Ou1lUeX7pfiRnn6HkSfAWHQmLqfLtC8/IHMode8AC7DaE1BebYo3HqEsea/Np
 3q+AdibZZlKRxHYlSznPOHojYRzAJoiEcB61q0wiWePG+XGNyGQK0gU/EnORuYLhVKh/9I9EXlp
 +SJXUzFoym70kkzcFODkAH5Fg5HIwaSjwbYCoA8MPTxbCyg1gQFNIFzt0B5wGwXlJ49H06rykQn
 Krb2v82EOB7tYzg0Uz1m4EuKzZPkz5PGEpcFV959M02ykGq5o3YhR4ijnrG3v1nt377rI/vyJsy
 Ck4jfx2POBRTnqBL9Xcb3uvS2lQBAjJvl9xS3ZeOCfSndi+p0EbWN4bKNE6+BCn1kPIVTvyYnTJ
 dcc5/IcrcnpnAiRdcOoW+L/l74edGRmbyysrSL33I60Uh/fUZ3bluEcpfG1sQKmV3Co2Lr3f4NR
 T4TxlnDU+xuCIVUvs8A==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69944644 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jh8-4IubPDD_rd732qoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: F336pzpNJdr-xoD__9dsJovg-aUs6ACy
X-Proofpoint-ORIG-GUID: F336pzpNJdr-xoD__9dsJovg-aUs6ACy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_024317_160138_1E593908 
X-CRM114-Status: GOOD (  20.08  )
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

Thanks Faud, it worked.

On 2/16/2026 4:30 PM, Fuad Tabba wrote:
> Hi Venkata,
> 
> On Mon, 16 Feb 2026 at 10:58, Venkata Rao Kakani
> <venkata.kakani@oss.qualcomm.com> wrote:
>>
>> HI Faud/will,
>>
>> Can you please share tip of your commits to apply the patch series cleanly?
>>
>> I could not apply on tip of master branch.
> 
> The link Will provided in the cover letter above didn't work for you?
> 
>> As before, patches are based on v6.19-rc4 and are also available at:
> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=kvm/protected-memory
> 
> I just tested it, and it seems to be fine, based on Linux 6.19-rc4.
> 
> Cheers,
> /fuad
> 
>> Thanks - Venkat
>>
>>
>>
>> On 2/11/2026 12:28 AM, Trilok Soni wrote:
>>> On 1/19/2026 4:45 AM, Will Deacon wrote:
>>>> Hi folks,
>>>>
>>>> It's back and it's even bigger than before!
>>>>
>>>> Although the first patch has been picked up as a fix (thanks, Oliver),
>>>> review feedback has resulted in some additional patches being included
>>>> in the series. If you'd like to see the first version, it's available
>>>> here:
>>>
>>> Is it possible to test this patch series w/ the QEMU or it will require
>>> real SOC platform?
>>>
>>> ---Trilok Soni
>>>
>>


