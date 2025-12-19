Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C371D70E0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16ovI8pMht01ezaAZgV+v2nnSYU+P3k1sfkFnw9Mj3s=; b=EteZvtPiOOUswnCtqrj175Q59r
	OruUF8dGy9uunaWOIg98CnEscgMnbLKslF1uPXTA6RlxM3CunHzFw2lAMUM7r3aIJABs/DE4ZxtOc
	Htn5sH1CZALNetNTBATe1hBreZ0Wt2fMPX0w1daqHu4MphiIqafCQLwBeBi8oIeXZQQyWT93g9qIv
	0FCRR/u0mCwWo+jYgVwaAOyoNlbpfcHx0dA+t0u1Nn5iPwo/YtxDmjGXB3+YD4lE8tjx58lgy35Nc
	Rz4yYBC4chhJh1dlUU1kDuPX58JCpwuXt+nyqhC+E6qK/OFBIYdzUKw1bMc7IAFax4PQj4BGU2Ipl
	PMFLrq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPzg-00000009Tpp-0lG5;
	Fri, 19 Dec 2025 02:13:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPze-00000009TpL-1x6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:13:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BILlUHv3244665
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16ovI8pMht01ezaAZgV+v2nnSYU+P3k1sfkFnw9Mj3s=; b=N3raqkUumOrBOlJc
	vb/WQs97857J12OF/bj9uK5pkZ3gvSke+WQZkK+mh0AtHzR+5kxjAcEaW+PHiLrZ
	ldzPWWYlS34US6qFFLuhupF5EB1qa+bj6a1P+nMLYdh6NzBjd0pACVwUH6oSiJUS
	W749lWVItShft5/J1eldPagOgoF4Tti5WPgDiTBmZPrrskAIp4AkeK/k4ogk8eGz
	NJB/3INZBkgbPU3yUm6ZnNQrBz4UsfOOLd2ZMIi+FUzvWcwNE5AP3R3ngXCpzsiL
	wXCvCuRA2k1ThUipOj7Rhs26MEVQLvXZ4jOhMtwNQ6uXm0Vvy9NbXAnHB0i6EhKO
	Nxkq1Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c0v5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:13:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso2163776b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 18:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766110401; x=1766715201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16ovI8pMht01ezaAZgV+v2nnSYU+P3k1sfkFnw9Mj3s=;
        b=NV4Xub5355pJx2+jNadaiFJqJf4qHK22nch+wdEl6ly2rQjXmY35wF60PiMj7pMZX9
         FZByrqSMzSrl40L1NGp1YM2EJijJGokzcJr8TcIixk3FC3ARoomW4k9ZtC9bafRpX9Bo
         J8fOuGP7Cr6gUEXqyJ1ePiY0bloN0GZe9xUuK3iF3ZCiPC/ZPGPQjTNXfOep6uBXZFSi
         wMTOaYB6F2KVlfmLWR3JEMXqHg24uEe9/Yxawwca/jPF6Qrh/NelQcOcw9qIKL5231sE
         y6U3EmFWWHX8M32dvVlp0iWepBFi3uJ09NqnVPNTZYDZPvQ1oy5ZpcLS8ElZ5KWtJgEt
         YTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766110401; x=1766715201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16ovI8pMht01ezaAZgV+v2nnSYU+P3k1sfkFnw9Mj3s=;
        b=exGQaadgoBV7DSRvXkC/80Wp3SxooGGhkzjrxWwC6fbaqY28NNWFNuh9RvA9x5kZfK
         COz+jFysNKbBpY0t1zKODaAGK2mszURJzL1dTVPs+sttdRVLaVh2ylNG/mRkH3BbWm2x
         vHg+N+DdAQsaI5jy6zt2RSZ2JNz64/oXpu7xDhLlnHdN3uusiUtQeTAV5K5jHGEXk6pR
         dzrFA9FlfEn5rVHVaLo3aMe4r8CF016w7ptPuIOG2VIZrqgxnjCFEJLFhTrasu0YkqI5
         vUWPx5aJIAOfC4Zvi3fKth2fMeuA3wTsSPNUGxPlzRyIUUsZ+F3HM4cPM3JF57MCJy0f
         uiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxu1Mp3FH6wu0gUohyRJjEYIhW/VnYJvt23uH9MLAnZvDCKg93rVKz5+j6Vm+5LgtX5XH3CC5W6ajRar9SMIE3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+C15xTMUCrt58PqUWwEUzgFqtl0EdI/juIg4U6s6ZXmr73ds0
	reYP9GaxqpSS36dgyH7vfWY/DBFg3jDYWbO9Nk2jULHBqfhit+/LmGq0TShz7IMuUbJ8rzsz1JS
	ZbvnEtfIzSVfLXB6GHvvp2xcNh477BV6IZuMTr6fA/z2hqvkeYuqlC+Owa3FRi+HR0547UHxwuQ
	QpAw==
X-Gm-Gg: AY/fxX63oNxHSThcP3kxFrdKjmZWYgwBySEi6mgmcq1+DRMv/Cvbjbr/4f8vnkp2rd1
	m02UCLL0gdEWY7vgc5wLVg9btxnYtg427DbhFwydUQ3NAKY+UWA8ExKTF82G/zs5mdHJgE59cwC
	ASWbuMj8VY6bmL5NFiHU0xNC1oyEpO1oVVzXnXTmC/24sBFW+SME1XedKmsudGQHp7lzIypi184
	uSAI2tWf+Ln5XDkh504ej0cbwQpodQwpMNmaqhKUH8Nh0RPutd8OsxDEud3ysanq5xI85HAvjcM
	L+c/DS1vOyCSwLVwnvoUew0MHgXgDzqFyHZFruzu4YFZXSKPuYxwvkcZO4E34sCNhjJ6l6b0aUT
	kCCjVeN+W4+DVAcxIH+66nksIRUqibTbhDAkKrvZcmPV7QJpwbMA5BLbZSKRxnPjqHDNmsuplta
	k91XCQdkD0
X-Received: by 2002:a05:6a00:1d19:b0:7e8:4471:ae6a with SMTP id d2e1a72fcca58-7ff679667e9mr1077682b3a.54.1766110400975;
        Thu, 18 Dec 2025 18:13:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHj4prRSbH160/aJGzDoFo6VmuuN2fLZoLpUaumhyOLK22Xm1CdCkuX3d0mKzGcORsKkZMfQ==
X-Received: by 2002:a05:6a00:1d19:b0:7e8:4471:ae6a with SMTP id d2e1a72fcca58-7ff679667e9mr1077661b3a.54.1766110400490;
        Thu, 18 Dec 2025 18:13:20 -0800 (PST)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2b537sm623722b3a.20.2025.12.18.18.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 18:13:20 -0800 (PST)
Message-ID: <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:13:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAxNiBTYWx0ZWRfXwaL+ZCGDz0s4
 9/X7lts7L1UAtZeDrdC243zmOktyyXMqV5eAXbG8/otR1k/iZEXq0BBZBM7au8RAK6DzKKOepA/
 6ljnuOGjkdQMLaHPprpjyCe+4DeCjPhzIfWMNmJaCH9xfdgfcR5qnmFSC69RYR6eXhkaoDl5MXi
 8YBvSRzdNEIWMrIXE5Qyld7BIb5c9DrzjAtYMSWmnITdb21G5B6Am7ar+6lkyVcvV3swBkKJnK7
 5D0qcmIi8bOh0qG0IPONbTCM7csJ4ifVaV9znLUCskaqHZfXPpjMUZcgeZbCwS3u5sw5nDY4dUI
 zSrRk5oGDWy/vVLHCTXMLUHJfntK3SKAwdhUwt5LIcuMdMKsddb1kxNmGYcxookCgJWumniZcA9
 AsGiclaQvHv8YTIDT6kKSH6dWzhMSYIlJV8lBKFlTgW4Voj8WN5OW/O6pli7awNhpvwVpeakrI/
 m9sd0jdh21bY6Pu8seQ==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6944b4c1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CT3mT5stn3mpJVhV_EcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: I0KXiZKJbbFcD0toNvZj_WKPB4FmnJOA
X-Proofpoint-GUID: I0KXiZKJbbFcD0toNvZj_WKPB4FmnJOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_181322_510071_5BA7DA7C 
X-CRM114-Status: GOOD (  22.99  )
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



On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>> This patch series adds support for CoreSight components local to CPU clusters,
>> including funnel, replicator, and TMC, which reside within CPU cluster power
>> domains. These components require special handling due to power domain
>> constraints.
>>
> 
> Could you clarify why PSCI-based power domains associated with clusters in
> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
> OSI mode was originally intended to support them? My understanding of this
> patch series is that OSI mode is unable to do so, which, if accurate, appears
> to be a flaw that should be corrected.

It is due to the particular characteristics of the CPU cluster power domain.Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
cluster.
It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
the upstream Kernel.

> 
>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>> power domain. When the cluster enters low-power mode (LPM), their registers
>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>> out of LPM, making standard register access unreliable.
>>
> 
> Are these devices the only ones on the system that are uniquely bound to
> cluster-level power domains? If not, what additional devices share this
> dependency so that we can understand how they are managed in comparison?
> 

Yes, devices like ETM and TRBE also share this power domain and access constraint.
Their drivers naturally handle enablement/disablement on the specific CPU they
belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
>> To address this, the series introduces:
>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>   device tree property.
> 
> Really, no please.
> 

Our objective is to determine which CoreSight components are physically locate
within the CPU cluster power domain. 
Would it be acceptable to derive this relationship from the existing power-domains binding?
For example, if a Funnel or Replicator node is linked to a power-domains entry that specifies a cpumask,
the driver could recognize this shared dependency and automatically apply the appropriate cluster-aware behavior.

thanks,
yuanfang.

