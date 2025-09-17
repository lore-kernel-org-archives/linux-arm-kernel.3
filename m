Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813CCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 03:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIG1bOtImKnLmFSkvvJht6cuFZCgJS/l0Y73y0ey89k=; b=KnngKxPD0RnhB7tJrE6NqKTfCx
	7Gy7GmliuHbJHDn6p0WiM66+yISDxuON4pUzT86tjjGL+GuLCjx8FbCSJSwuN1a3yKt45+ZPjtg48
	LEOi48/l7ReMJCRchU1n27JT7pr9doHyUYVTDS1ZOh5T2ZzG+o6JIdunp4rD7vnvdomXDwY9n+ruv
	fqZGaxNK1sk7iPLy5vAAZTEuS282uje1JRp0f0YNk+UYigIESU3mg7CRPmUMrIG+pgOU01130lGsa
	3BrJRoEHl7LCtnmTmwHhX7gBsfCmbVVkA9drmYQ67DNYnlx/gbzGBouymMsMFrjF3VRGxj3TdOHp7
	epmrqeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiad-0000000A2ZA-2ZXp;
	Wed, 17 Sep 2025 03:12:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiab-0000000A2Yg-35Fj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 03:12:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLZtvt010412
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIG1bOtImKnLmFSkvvJht6cuFZCgJS/l0Y73y0ey89k=; b=oGwtjH0Exgc4HJZ6
	4LNgPy8k8wroe0yLplggfurthr8oAqn+Q5FKJ4OOs3YhWK5oqUa2JBku4nkVvU0i
	cJMyidg0zNEdY520cjzriTQbt0TqdqNqr2WAP8bZUEDvUBlYXfjL3DcpsPpd40c4
	/+W8LN8RH+Xzek48UJ3TraPDYOYWtbLh4GgwV/2uXEB9PeAZs/jFr6C3FhkehRXy
	2mN2Qh+ObGJCWPmJJqTBCL43ZV2On770JPd+twZYZ3JTWixuyCgojwRbFPx3IQ2N
	plMVPYcgdC2iGVnDL3c7BA2nmSolMByIediv0ySurzfJZ3DgERht8OkFvJheT90e
	pepmUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxw8q2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:12:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-267ac96f558so26802565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 20:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758078731; x=1758683531;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIG1bOtImKnLmFSkvvJht6cuFZCgJS/l0Y73y0ey89k=;
        b=n+rEox3gxKDDW9LcFjPVKyPOgkRYZFBuB3GdaiEwcv8lqaMjvdMHnVEmCs+h5zIeN3
         TjZVTo3YwnucpDHw3M7Dq1+VAXM9LMUAuHJL7mTZI1myMjzgWrP6UdRPI3t9J1/IEx6v
         /zHvJj9YaxV2F61m6aGMSYGabhWtavVISHusHW3y0IQiCYbsRcKr1DCP+1wVwM7zby3r
         sAehGTRWsIL0LjLfFjzw2ruLL/dqPAyxMRE8TH22U8cGGyi+1IjqmqumXDWC1BiJhrSs
         1TgmTBccZ5Fop1GGBuR4HzzucWge9/pqQy33ffueO3qPwILSjaUBTN9QWC/IlbLnM5PZ
         CihA==
X-Forwarded-Encrypted: i=1; AJvYcCXZT5Zp18f460jWGVuZA6aiTi1jZ5+trWVP4hlmgx5LNeGUoiXPU92J63bONQ8NPYjF7hKY8levP1wwkb72Kfkb@lists.infradead.org
X-Gm-Message-State: AOJu0YxhojnGGJPi+wL2nHatXOMJeOfcHZugl2uED5bFCsmPS3DSBU1R
	6iDKdRjTXj0EWX7F0nuEWDCg5ci/qVk6Djjl4z6ztCeAfESM1B7S7cSUPSKpJ8xdbI0wCTwDEKQ
	zsM7r+Ib+CBEDba3t4Q4jGt/CtrDO3HYqprn30dbleHHqputqbASdSXlnENl9v7MhLB751fWB3k
	xg1A==
X-Gm-Gg: ASbGnctHAGicvlADukGt7qF+qdLYg/3TM93h4S6pnOXFQ4g+CU8yYrPBXNT2aWpt8N+
	4UVEj/2k7GBjJkFRAKWqfQFPyB1y2KhfNN5/WsHvSfN/SsiNhQ7JTGqINCx67GQpexs856rLNhB
	0g7PgqOmGnPAAhqN9W6ey4ParwmxEQEtfr1j0+Nmu10n9xsI8yRINhDS6xh7QzXxcA1akO2gGR0
	fJiLnruUsM6p+gD4PSX1vcacZteGdA8Tp5RKGnMcsk5zPxNyBUsrZRGb4ojsGaUTG1Ww6ZJut5K
	34yMa+W76aZLd2bqmHmYYJNOc84jgQaf5V8MLMBsTZq02I1UZWw+jSUQVtvE+gaIxBRuEooKHcn
	uxF+TwYHUUXUnxvT1ZeMJbY6xJHPVOLPqYZnOBGM=
X-Received: by 2002:a17:903:b0b:b0:264:a34c:c6d with SMTP id d9443c01a7336-268137f2232mr5877145ad.37.1758078730938;
        Tue, 16 Sep 2025 20:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBCLcKRApHcGH30xII8GXUVK5/XOxilDiSXJooBQ2zL0Io8pE34P9hJiDzte0TVak6qxwcsA==
X-Received: by 2002:a17:903:b0b:b0:264:a34c:c6d with SMTP id d9443c01a7336-268137f2232mr5876785ad.37.1758078730453;
        Tue, 16 Sep 2025 20:12:10 -0700 (PDT)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6abcsm176125835ad.16.2025.09.16.20.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:12:10 -0700 (PDT)
Message-ID: <634a38d3-0a20-471d-bc39-44a822df00dd@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 11:12:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight-tnoc: Add support for Interconnect TNOC
To: Mike Leach <mike.leach@linaro.org>
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
 <f9d3b3ec-dcf1-42ce-b925-70e5543771ed@oss.qualcomm.com>
 <CAJ9a7Vivhrx2zss_8Ti+QS1dzakp+4CrAsDj00RKojUaL_t7Sg@mail.gmail.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, coresight@lists.linaro.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@arm.com>
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <CAJ9a7Vivhrx2zss_8Ti+QS1dzakp+4CrAsDj00RKojUaL_t7Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68ca270c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=WTqQPv3OPy9EuyCnVQMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/LHgxF+fcyXz
 /EKdYAbQrLsO6LhNUpanzf4SkETvwzxxdC80GThxogMIGU13FxS/AqZkrXGMVFI3Vk7dnYc4M+t
 4d/Y57i96d9OVUKzcMz8Dn81QedQHw/tgRjR6MRY5x426ElL12MgSMssJNeKN9D+Xyl1OwicgV1
 M/Iq8Qr0ValyFwGb20GExCR7r3Ce5h9RyLEZb8kePZApp69UZaEYy6r2wTNU8hxWGejv+Te8bJL
 XyPzgMb1XUo/SDjYxvZ6fxCJLThyD2KVkPzLwzvPQLD0DGeM9+pjCQwBiBzy2QRPJdHIygH8kpk
 ifG1FmwpRcpeFJffGrVVjwlanRpx/iErfRQy1zkVIpmE0nQ4kqbWyvymymMJy7E/sD9Gtyx2osy
 IfyHQTpZ
X-Proofpoint-GUID: 7I5cYvReSnyDZU_juFADtab9_Q9qLgbY
X-Proofpoint-ORIG-GUID: 7I5cYvReSnyDZU_juFADtab9_Q9qLgbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_201213_784327_3B0DEF62 
X-CRM114-Status: GOOD (  31.79  )
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



On 9/16/2025 9:00 PM, Mike Leach wrote:
> Hi,
> 
> I'm a little confused as to precisely what this component is.
> 
> From the description in the DT - it appears to be very much like a
> static trace funnel - multiple inputs, and a single output.
> The DT describes the inputs as "Coresight Trace". What is meant here?
> - if this is ATB trace then this component is identical to the
> coresight trace funnel in functionality so should probably use the
> normal CS static funnel driver.
> 
> However - if it does not appear on the AMBA bus - how are the
> coresight management registers read - these are a mandatory
> requirement in the CoreSight specification for any coresight
> compatible component?
> 
> Thanks
> 
> Mike
> 

Hi Mike,

"Coresight Trace" means ATB trace, the Video TNOC in the following example is an interconnect TNOC.
It is used to replace TPDA and Funnel. Compared to Funnel, it is easier to configure and only
requires enabling once, without the need to enable each inport separately.

it has "reg" parameter on DT, can use memory-map to read management registers.

  +------------------------+                +-------------------------+
  | Video Subsystem        |                |Video Subsystem          |
  |       +-------------+  |                |       +------------+    |
  |       | Video TPDM  |  |                |       | Video TPDM |    |
  |       +-------------+  |                |       +------------+    |
  |            |           |                |              |          |
  |            v           |                |              v          |
  |   +---------------+    |                |        +-----------+    |
  |   | Video funnel  |    |                |        |Video TNOC |    |
  |   +---------------+    |                |        +-----------+    |
  +------------|-----------+                +------------|------------+
               |                                         |
               v-----+                                   |
+--------------------|---------+                         |
|  Multimedia        v         |                         |
|  Subsystem   +--------+      |                         |
|              |  TPDA  |      |                         v
|              +----|---+      |              +---------------------+
|                   |          |              |   Aggregator  TNOC  |
|                   |          |              +----------|----------+
|                   +--        |                         |
|                     |        |                         |
|                     |        |                         |
|              +------v-----+  |                         |
|              |  Funnel    |  |                         |
|              +------------+  |                         |
+----------------|-------------+                         |
                 |                                       |
                 v                                       v
      +--------------------+                    +------------------+
      |   Coresight Sink   |                    |  Coresight Sink  |
      +--------------------+                    +------------------+

       Current Configuration                            TNOC

This example is from the trace noce patch below:
https://lore.kernel.org/all/20250710-trace-noc-v11-0-f849075c40b8@quicinc.com/

> On Tue, 16 Sept 2025 at 03:35, yuanfang zhang
> <yuanfang.zhang@oss.qualcomm.com> wrote:
>>
>> Hi Suzuki,
>>
>> Could this patch series be applied? Is there anything I need to update?
>>
>> thanks,
>> yuanfang.
>>
>> On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
>>> This patch series adds support for the Qualcomm CoreSight Interconnect TNOC
>>> (Trace Network On Chip) block, which acts as a CoreSight graph link forwarding
>>> trace data from subsystems to the Aggregator TNOC. Unlike the Aggregator TNOC,
>>> this block does not support aggregation or ATID assignment.
>>>
>>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>> ---
>>> Changes in v4:
>>> - Fix unintended blank line removals in trace_noc_enable_hw.
>>> - Link to v3: https://lore.kernel.org/r/20250828-itnoc-v3-0-f1b55dea7a27@oss.qualcomm.com
>>>
>>> Changes in v3:
>>> - Add detail for changes in V2.
>>> - Remove '#address-cells' and '#size-cells' properties from in-ports field.
>>> - Fix comment indentation for packet description.
>>> - Link to v2: https://lore.kernel.org/r/20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com
>>>
>>> Changes in v2:
>>> - Removed the trailing '|' after the description in qcom,coresight-itnoc.yaml.
>>> - Dropped the 'select' section from the YAML file.
>>> - Updated node name to use a more generic naming convention.
>>> - Removed the 'items' property from the compatible field.
>>> - Deleted the description for the reg property.
>>> - Dropped clock-names and adjusted the order of clock-names and clocks.
>>> - Moved additionalProperties to follow the $ref of out-ports.
>>> - Change "atid" type from u32 to int, set it as "-EOPNOTSUPP" for non-AMBA device.
>>> - Link to v1: https://lore.kernel.org/r/20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com
>>>
>>> ---
>>> Yuanfang Zhang (3):
>>>       dt-bindings: arm: qcom: Add Coresight Interconnect TNOC
>>>       coresight-tnoc: add platform driver to support Interconnect TNOC
>>>       coresight-tnoc: Add runtime PM support for Interconnect TNOC
>>>
>>>  .../bindings/arm/qcom,coresight-itnoc.yaml         |  90 ++++++++++++++
>>>  drivers/hwtracing/coresight/coresight-tnoc.c       | 136 +++++++++++++++++++--
>>>  2 files changed, 215 insertions(+), 11 deletions(-)
>>> ---
>>> base-commit: 2b52cf338d39d684a1c6af298e8204902c026aca
>>> change-id: 20250815-itnoc-460273d1b80c
>>>
>>> Best regards,
>>
> 
> 




