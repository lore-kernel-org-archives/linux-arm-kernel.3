Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50633CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=; b=QqMHHqSl81JhanBbMj9TAUvGco
	TmeQrMXJLo0biEi1gobWAedIZXY9Ry69JvYSOEsXY/Ecuvhne6kLwR7qVxTIvE3HsfMnaneEaqSrc
	U54OwbiT7LqbMrfaFV2WZDQnNb7oSy74Vwx95ahBaNfCcDQVqQTVsVWXCMRZdCCXCBl6XZyczVXBp
	sub7Lb6gsS6ed4PDm72cetzxTMujK5sfxCtZYuV4dEBsQHN73tUlCXjTmc6tpopdE4Uj35Yqojtvl
	Qx9J0G22TAvi/3W7i/mh/4VXi/H90RX33YpTVUeqeXqbDwC8n2ZKTquUnu5jrLIUkh7ZwKBmqk62G
	i4sGYT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccd3-00000008fOi-07ZN;
	Thu, 25 Jun 2026 05:27:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcccz-00000008fOL-3WHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:27:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eUVA577890
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 05:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=; b=g5oG5rvee8BQgALl
	vh66gsQhJa+vEZoh8oZa+cPblCRO3VmZU4gjyNWkpiDKAfG9s8g30NoFvtx8wWmx
	sO1CAwSx/hiCW+Rhv+Vlp+IMjE4uZom63OTaxaN8Kv0+2qD9UMOCiO8w29O1O43W
	ezBj4RcfRrfQJMPZji9KnDdwo7zF7B804StRC+eVu1tlpN6bkbTe5S1hqKOyfzwA
	AEGsdF+nnYpyiXH51FK10IKfaVWkVJS+IHV0fQfHdnRgPIYg/+M9YPfoYZ+SQs8Q
	PNOFUEDxbK0R5uwLFx9myM7HoCQ3V9VA6AxqzpIg2QiSyuMzRv0uwywOUxh01C5y
	Y5pjew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudggf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 05:27:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8923722247so2193493a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782365272; x=1782970072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=cTLjgwcQcJspawkDJjcVY1Qx/UNAnLhiO1oDofvyL2GbV2Ebcwo4xmVxgRn/23Jo+c
         EjqEBYIUEvC74nryXF6J7UyziB2E8TXI/+3Hlahn4nUz4Sl5JgcTFNATvrvqx4Bh1kzs
         clMblzNiI41o/bPCCK8XFSdWPcnBAPJXoxc7pEu6k9GMZqez2VNbHQ3SISJSJg8iOGPF
         3+omMea0M3z4HtcBe+PpZY6MQQgPS6rNlk05HVt9A1ejgMxUehjQBVQQjiUwqvJm1VbH
         W2yWqAz8455mI1bTIbsG8SccVvXAc2MfF0aZ6YN9dP2rXbg0HvdrntpzerUidVwIOler
         MT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782365272; x=1782970072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68QmrLLXwE4JrUm3cojVwQjQkH3bZQyo8VxIUTcnh8U=;
        b=goDC/ZwUz4+5qDxmx4+9ir8pyHKlyzg3nkdEsFpZJl1PfBvZfImxN5BFh28AkqS2kh
         QCGTTkf3w8CLW8eMqDCtVD9oay6+YdW1Oy8hpBVgFywzb8uPWLQVAnbV7AFoTVluRBHT
         5vnXDaO4US7WiH+DH+MwIifmKNnE6tGHKhmDRjc1IkOOAGK7xTJd00j5pbHsHomNZ8wy
         7v1NrwwPzFbX8KDY0mIsizC6EExig36p6sZjs0p8P+TGyPX7+C5asOt/I0X+FpofallU
         oU3qIO7tALwG7fzzvAGyx4VwwgFKWRCwu/ffuxW+hmO3BvZt7JUwomZMEDO2sE7KRo8r
         zmsw==
X-Forwarded-Encrypted: i=1; AFNElJ8lKvYLx6QwHvqTac4IQ3WV9kKv7ldiZnmfWuV20QIoLBOcznkChSOQlaXYACDtpBjOT4F5PV50xSsPtWnKThtY@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJt+UJe8pxSprCJWbW3N7KFv0u+Gm80Yuh5+COaGPAdYZtEeJ
	agvan66yfEaKATLYi7yDUt+vPZpTrVfrQQJFn5/QJui1YLMP+hNwZ45g3P1reke5Q1ljC2/e1I1
	6LsB/NmioKLXkbVY7TDCpLgxFUpoRqPu3BrooYmJbrQpOcbuoFtB6xPvBMsFoUIRC9t6RWtSgCh
	r0sQ==
X-Gm-Gg: AfdE7cl5UmBk/lNXilV8THQ8ka8N2LKsP3OqWlyJu2OditmOzw1O28vzhxjRtQ33n+C
	jHp++nkDTNJ7DvVIZ/wYjPOiiynowwG6WmQZzcJ8o0XPufTy7qfY6AMcQfh89DPwVscSRlZvsLZ
	TLd5jVeUOyMdksaIPo15zGS9ljIhSpRngzztOCShHpF0mYYOAASCmo+V9QcumU1LhC2MyVAyMwx
	oxNoDKyjfJCQJ15+BZ24VZJyLikXG1qkZjBwDCG7UezJ2R0KwCEXw4AXiJG0lo6IrLdPw6rIkm1
	LhfZLRfAChAo1bWz3BCFOprLxTab7acXRWlH6SZdeWw74mLTvwE9JfUVbqOhu0ak5wjberKhtIT
	Nnx7MNu6pk96Jy+8jX9OPLuKLBP517fdgVzw9ZaspaPO+IYI6+/vC+srVBG9b8rhHQ/CSsOzVVP
	BSNA8jqq0arNfzC0w+wmh7AVu1uE2999ZT
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353213637.31.1782365271674;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3b3:10e1:a87f with SMTP id adf61e73a8af0-3bd4af033a0mr1353170637.31.1782365271237;
        Wed, 24 Jun 2026 22:27:51 -0700 (PDT)
Received: from [10.50.49.21] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c93522747efsm302606a12.22.2026.06.24.22.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 22:27:50 -0700 (PDT)
Message-ID: <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:57:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
 <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfXwi3Wd0A9LMh2
 xms2VAiUsg+O/CGvZqi0E3jW3k/bPDi3ld2/m7XeuSEBaJ/5avmFuxDQaJjBBw1SzVAxk4+P0s/
 t9cGB2n9oUiNOqcIUTkjbpEPjOX7LdE=
X-Proofpoint-ORIG-GUID: 7rRpLPekeWY-6IGYhgNG806erFueot4b
X-Proofpoint-GUID: 7rRpLPekeWY-6IGYhgNG806erFueot4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA0NCBTYWx0ZWRfX9waDANhHmX1n
 uu/zAHKOjgfdbVtD/Wm/OgMn6SXWaHmyDGiFp7fR1iHduoqzvQGoPAdXdo2bWfwf4ARAewpFpl9
 XQ9wlGBpzAkDAhSwiYlFAnMyf3E3SPSbrkPlQoxp6jH2RZMLj626WOQZQuz3ojotfwjBZHNQuJh
 7K4DZoTcMdm3IRerlso1oR16iA0vaYh6mNGcnEbwXZ55ct+19cXcZ7NZc5LWhxvJs7ZO7MqIei4
 pPUDbMAZ5v5Spc3sDa7nIoIX5lpndLbV2iMtEyY0G+Q3n4ypMYrrkl6GqV+Wv1RSuVEYnac1jXM
 ZBk809+tL4bjL3Wr6unJgKlKrjdWeSPZiV2mvDD7q2hp0GgSPvPA05jkCWTsC4p5Ax7O1asz7+s
 ch0dIM5nbS/U+H4cBtQduK9rCGC2sWqiiQ1eZFyvPsvHxGKFoH6uW29PBtTy/IypryUhPcrKvRQ
 amokQKBvx65JmNx2mRw==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3cbc58 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=TXgiicuEePHzAitInHsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_222753_893923_F314855E 
X-CRM114-Status: GOOD (  28.17  )
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



On 23-Jun-26 2:17 PM, Sudeep Holla wrote:
> On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
>>
>> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
>>
>>> Not sure if it was discussed in the previous versions or not, it would be
>>> good if you can capture why some of bus scaling doesn't work with the existing
>>> SCMI performance protocol and the monitors don't fit the MPAM mode.
>>>
>>> Please capture them in 1/9 as a motivation for this vendor protocol. It will
>>> then help to understand it better as I am still struggling to. Sorry for that.
>>
>> Thanks for the input!
>>
>> SCMI perf protocol exports perf domains to kernel where kernel can set
>> the frequency but here the scaling governor runs on the SCP while kernel
>> just observes frequency changes made by remote governor.
> 
> OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
> work to consume the change done by the SCMI platform.
> 
> And why do you have set operations in the vendor protocol being proposed then.
> It all looks like something just cooked up to make things work. I need
> detailed reasoning as why the existing perf protocol can't work considering
> all the existing notifications in place.

Please do take another look at the documentation and driver changes to see
how it all comes together, since it's apparent that we use SET operation for
a ton of things. Taking another stab at explaining how the MEMLAT uses all
the ops exposed by the vendor protocol.

We use the SET operation to pass on various tuneables (IPM CEIL, stall floors,
write-back filter, freq-scale params, adaptive low/high freq, sample ms),
the core-freq -> mem-freq map, and min/max clamps) required to run the
MEMLAT algorithm on the SCP. You might ask why can't we have these values
stored somewhere on the SCP itself? We would like to but all of these are
tuneable values, that can change for various boards for the same SoC.

The START/STOP operations are meant to start/stop the algorithm, in this case
the bus scaling algorithm.

We use the GET operation to get the current frequency of memory that we
are trying to scale. It can be also used to read back all the parameters
that we are trying to set. Another thing to note is that exposing the current
frequency to the userspace was something that the community wanted.

With all of ^^ in mind, re-using the perf protocol becomes impossible.

https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/
https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/

We'll add more call flow diagrams as part of the documentation for the next
re-spin to make reviews a bit more easier.

-Pragnesh

> 
>> While MPAM is not enabled/supported on all hardware (Hamoa).
> 
> Fair enough but I still don't fully understand to rule that out yet.
> 


