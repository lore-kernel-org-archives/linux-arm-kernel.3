Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A9BD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6fsgzWvi3sSol9zv39CnVVSOO0xtUX3H0IOMdGV9U0=; b=f1k/nS/hv8OQHOnsdlclPV3HXm
	u/kuB/IqYraSToTOyGQKigdmFS79odfScpsM/GTcxfkO2qSrN1yJgntWZWGQ7ORmCmsKD518+dG9x
	bAEPWM1P90ve4tSC8BJxJlvOzHSIz094MDMCY1UyD56ws0YjW8tM8XSvOQRbV+syhWr8YDiPt/qbo
	6GRF15XrtSs1suaVrWkj6HpZeV4iVwmy7TcIECoH/qVHjFRuXJy0XWbiGr5mkmlonf/COSrfzQGQV
	rz7spm/OfraTU++geI8ysI6XTXMhaa//hlkjE94nHQ9f9ZfKfq33TBzLAgTDN2SZzyhQzQioPJWcF
	iUK62OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfHJ-0000000DOYD-3eOo;
	Mon, 08 Dec 2025 17:44:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfHH-0000000DOXj-3Z2R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 17:44:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8E5HIU1419122
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Dec 2025 17:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q6fsgzWvi3sSol9zv39CnVVS
	OO0xtUX3H0IOMdGV9U0=; b=eFKXqrShGzYLgUxfn43zZmkBUyxv1RTpPUnqG2Gp
	OOgEG7OmQJFJft00MGUVjziDZDs3J9Tdh9zPf4OQ4sLJwyT3bVHqte46+QrovYw7
	IaCtXqw/c0sZiAehvOVeHFKNZrJ0PKaFigDOkJJBj1bVGld73f1BMS+b8TBny4dV
	RqvmCF+UQu8hn1byEukik8MD4N23eCz6ioZmpgsRvTk057nn0gzmRUB6eXk7CxCm
	C2FGXODZ2XrNJHHYWvCkd743zlTB2g4oV5erMrwCff4omOp61uMmwSS9ribQhgbG
	ZQ88NE6VujtnS7CuTQFZLnpcPXPhwrwlPkuv5W77kd3GZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax04ngpkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 17:43:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-882376d91beso135663866d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 09:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765215839; x=1765820639; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6fsgzWvi3sSol9zv39CnVVSOO0xtUX3H0IOMdGV9U0=;
        b=APZaCIpzR9L824JXIoVhZryvJ5MWAIDaUn8F6PgWi3nb84Ui6kaV1XMfj0oDj28ZKW
         8A2msRLn9tZZdsZaVDYEqm3nrpAVAoU5F9YQ1VhMOPcqaGgmkxNm84XBse4qJ5HKNxYJ
         t9pEcwILMJiZLiexKJjMGvpNLjIya9odK9zxRv+EuQBBpfJb8CJkg3Mtjrm1rMIfaZc1
         f0g9SMqhDsQWyG9hB825FbotwQHT/hpwZDav7jIN5o/MbqF+zxXBmKTxULs9meAW5+61
         XUpZP5TAi5/HC9H5uCZllLostp3RqzT/rQe3UZPjife+NptxizQxdgMrle2zXnhGtcS1
         8PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765215839; x=1765820639;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q6fsgzWvi3sSol9zv39CnVVSOO0xtUX3H0IOMdGV9U0=;
        b=VuFoypmOv7NvHyRtXGUlk/VEgAkYpc6cC2jV4wIiNnuL4XCq2uEhPyGWG6xJ5dW+O3
         ottQRloipwBtaI7WqEeHRWQ30RuXMKuz77pDX6MCJKqhFwyPL66kDkGbF/m7lR95mR8v
         tw4zfMrEpdH1ScoP6GPJMkKe3xtsQJGwpRjdg+GhcJ7PsnHiLGf+ctjr6NOzSyRyFc7l
         BCCqB/FpM5ktej2A42WDyxBYOsyCM08zugxFKAj//e4/2OG+HE/AMSmhVKlHPp2N35hb
         fH7v5KCUR4l3ByrArXRu0qdK9XL1AeGfyDetNgasbWm5n/8EXHlVDTtdnFjNicCwE3Cd
         b/xg==
X-Forwarded-Encrypted: i=1; AJvYcCVNwQSjAeXbWahWYC7I9M7lrQephJmEYOfqeK6CFDEFoJ48i65dcX900WOPeYGJHfZzYjlJWSIGmUPV5YYnqPzV@lists.infradead.org
X-Gm-Message-State: AOJu0YxEEELj5tETnAopPxb/PNeIW+VOWKLhYune3VzLDL45o8eHVFOf
	UQewdQli9WGvqV9SRGh1k6fDTi8z2IgXmJ5WL3xVNqs+lycZbjIjr0hp61uwsQvbaxV8pVteF6S
	6zDY3qC48sOl1lyKJlvqQR1FE4W67Fg3Lsy0jeXPK7OWAhekb368feYKiNMRJ2pvbtQlRoL6ggi
	K74g==
X-Gm-Gg: ASbGncvDugy76TNrSu9fjqG1Pefde2BqTDBxCI+fFJwtyVQYFzJTaM7aCxX/flkPZf9
	HuOXUPJU8TI3shoupNuvFFGitQ8aQFjHozB/L8F+CC1247CKMhGP3mkff8/AKAN47lr8I9y49i4
	WDAApeMwa8vE9KlWjrT2ZwAAjmVGaMfVGPr2IVV5908Z6sCB0zT9R+2fKV3IfMzvUYWzQ/AYzhb
	Z7OGUgJVGeb7dI0RloKb1bk8Ez0sm95o7whb3clvOE6lRfseh1+7UF7rB+8fvOB4Fo7dWweR+hR
	RIZ4EuvizpMTfZNXBUouYkMD/rPVENM8I7QKmZe5vOn0BK6E1T8K32cxVIFr6YVw8enqtM7VSYr
	cRvKiikYkafTZeQylUWRPPBC7
X-Received: by 2002:ac8:7f07:0:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f03fed422cmr138185441cf.40.1765215839321;
        Mon, 08 Dec 2025 09:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9OyOAi9BuO9c+IMpTeXVDBTWFpo10m/j3UtPXRgq17iETikhHSoyjng2VKoKeziJ3cERLXA==
X-Received: by 2002:ac8:7f07:0:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f03fed422cmr138185161cf.40.1765215838909;
        Mon, 08 Dec 2025 09:43:58 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479308cd87csm269816035e9.0.2025.12.08.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:43:58 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
        <baolin.wang@linux.alibaba.com>, <bobo.shaobowang@huawei.com>,
        <carl@os.amperecomputing.com>, <catalin.marinas@arm.com>,
        <dakr@kernel.org>, <dave.martin@arm.com>, <david@redhat.com>,
        <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
        <gregkh@linuxfoundation.org>, <gshan@redhat.com>,
        <guohanjun@huawei.com>, <jeremy.linton@arm.com>,
        <jonathan.cameron@huawei.com>, <kobak@nvidia.com>,
        <lcherian@marvell.com>, <lenb@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <lpieralisi@kernel.org>,
        <peternewman@google.com>, <quic_jiles@quicinc.com>,
        <rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
        <scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
        <sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
        <xhao@linux.alibaba.com>
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
In-Reply-To: <5261337c-337d-44ca-aff1-0a927b81e593@intel.com> (Reinette
	Chatre's message of "Fri, 5 Dec 2025 11:11:34 -0800")
References: <20251119122305.302149-1-ben.horgan@arm.com>
	<877bvfa23i.fsf@stealth>
	<a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com>
	<87sedrlsjk.fsf@stealth>
	<642767c9-f926-490a-83a1-160978c37553@arm.com>
	<871pl9krdz.fsf@stealth>
	<5261337c-337d-44ca-aff1-0a927b81e593@intel.com>
Date: Mon, 08 Dec 2025 17:43:57 +0000
Message-ID: <87tsy0kgwy.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE1MCBTYWx0ZWRfX/6lOK61rO0iZ
 N64eN1YJ6hpqPQwgZ8JyyESziaoymEVFa0rl6PJ5U6pq9hgfnC7GysJ8weOWT+SHXyy6KBhwpYd
 2PJGDX66TJ/n2dYyrOlCDghEdvCQm1JQoJgByvlwE9qjUXfOQUcfYBET5zE/Sg97Uk7jnNZrzIc
 LTp1UXpFYxay8o0XBRSAtFvTfmLqBXc1B8iS8gBhJKwjIDGLd4ysQ4fdtF5OtmEhu7/0RoXcxbD
 gSv8ckuPXrkJ/toULnZQxcjQhfkIYsJwy1qjUpHSo/9LbDoBMX6HsPTzyMAHjiapuNvW5eZ+7H6
 py52fHqZw0GOvl9vXYLmXyFcOo4/DJqcOW1eHHnWAwGkOpb+dMZXOo54AgrEtEt2jktB7oj9RWt
 uDWzZPAgaJ+e3wYvDLef6bHdjZUNQg==
X-Proofpoint-ORIG-GUID: OhzjzMDB5eKGx7lPN5LwmWXbDbDnbzTB
X-Proofpoint-GUID: OhzjzMDB5eKGx7lPN5LwmWXbDbDnbzTB
X-Authority-Analysis: v=2.4 cv=CKUnnBrD c=1 sm=1 tr=0 ts=69370e60 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=QyXUC8HyAAAA:8 a=SgM2RwbWsAO8Gts_S_MA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_094404_025121_99BBD568 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Reinette,

Reinette Chatre <reinette.chatre@intel.com> writes:

> Hi Punit,
>
> On 12/5/25 5:08 AM, Punit Agrawal wrote:
>> James Morse <james.morse@arm.com> writes:
>>> On 03/12/2025 11:21, Punit Agrawal wrote:
>>>> Ben Horgan <ben.horgan@arm.com> writes:
>>>>> On 11/24/25 15:21, Punit Agrawal wrote:
>
>>>>>> The platform has MSCs attached
>>>>>> to shared L2 caches which are being skipped during later stages of
>>>>>> initialisation. IIUC, the L2 MSCs' limitations stems from the
>>>>>> assumptions in the resctrl interface.
>>>>>
>>>>> What in particualar is being skipped?
>>>
>>>> The registration of the discovered MSCs with resctrl and subsequent
>>>> exposing it to the user.
>>>
>>> resctrl's 'L2' support is limited to the CPOR bitmap.
>>> If you have controls, there is no resctrl 'event' that can exposed them.
>>> (the problem being they all have 'L3' in the name!)
>> 
>>>>>> I was wondering if there are any patches available to relax these
>>>>>> limitations?
>> 
>>> Knowing which property it is will help - but some of these things are checked
>>> to match resctrl's ABI. They can't necessarily be relaxed without breaking
>>> user-space.
>> 
>> This platform has portion, capacity and priority partitioning, as well
>> as memory bandwidth and cache storage monitoring. The MPAM code seems to
>> correctly parse the properties.
>> 
>> But as you point out, the resctrl 'L2' support doesn't have anything
>> other than CPOR bitmap yet. Have you looked at what's needed to extend
>> resctrl to support some of the others?
>
> Please see [1] for a summary of ideas on how resctrl can support multiple
> controls. Nothing is final, please do add your ideas and requirements.
>
> There are a couple of opens not included in the summary. If interested
> [2] is where a lot of discussion happened that prompted the need for
> a summary.

Thanks a lot for the pointers.

Let me catch up with what's already discussed and raise any points that
are not clear / need refining.

>
> Reinette
>
> [1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
> [2] https://lore.kernel.org/lkml/aNFliMZTTUiXyZzd@e133380.arm.com/

