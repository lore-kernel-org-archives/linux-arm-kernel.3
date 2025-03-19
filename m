Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3075C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFySf0HhRvNF0ewPNWuQXwlI+s04FaegDm9OcGnJL7s=; b=Dm1uif2o5AD5wf04R4wwk3k9NA
	ETvvMz0dAFIfrcNxLDlMxjxWj2nPIt4MbCdK5kMJ32omGPJ/0+u7yVHBIHt58pFfL/o1Nkj34ruoc
	owcf3tzKW0o5f67dwZZk2AIBB60xrJ9khTczriQgKutiKo9LXZi/xrTskwdrmpX7D2to7MzDQAg8h
	9S/DWi1YSUv1eKdwTIHeUCq2vpJsRVezVkINuBZmeNB7OuVwTHBcUZHbB6mQhzknTjGSTSQ63dBmd
	se49HWhcUFeWXsl/ocVs4fUeyyJNuVsk4iBNU3XuBjqtd9CbNcYCnLsBUYVvb8AuT5F0peWgNBeOJ
	t0uD3lTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupOU-00000008QxF-280t;
	Wed, 19 Mar 2025 09:07:22 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupMn-00000008Qdy-2MKP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:05:38 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKa6hE014607;
	Wed, 19 Mar 2025 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LFySf0
	HhRvNF0ewPNWuQXwlI+s04FaegDm9OcGnJL7s=; b=RZ10bVdE+UZDqoGsOqlTW0
	M0u42b4qBlzQbt9D8orzJfpj/nwJxjgYomzHvycYpNIZZfCrHt65UeiOhVMoAaIK
	fcVhRM/Bi7wz5SNn6UirUHalXC5Gwv8Fo7mOs853O0+HAr1OAuDMa5amRP78bnw1
	kho2Umuor9uf+So/R1LLpgu1uY8w9S72uhRxo4pLPQEc5lHMbH8/shrpR8MWDJbQ
	tFvhp8N8ainfzg/IxohKbedGePisyIQid2F3+PnM327/NUdCcA5Vfx3eJgNPEMdk
	ztX9/aeYvq5f9SiNC5QCJFpQSKGMyiv5lJ4m3t+4CHRgsId5dr57BII6lT48fWmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg0ptmts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:05:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J8nnhJ016573;
	Wed, 19 Mar 2025 09:05:09 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg0ptmtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:05:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52J81H3Y031987;
	Wed, 19 Mar 2025 09:05:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvtgwrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 09:05:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52J9568a52822366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 09:05:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B34A72004D;
	Wed, 19 Mar 2025 09:05:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CC1D2004B;
	Wed, 19 Mar 2025 09:05:06 +0000 (GMT)
Received: from [9.152.212.229] (unknown [9.152.212.229])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Mar 2025 09:05:06 +0000 (GMT)
Message-ID: <a27a9066-b0e3-4d8f-bbb3-2dfd080800ef@linux.ibm.com>
Date: Wed, 19 Mar 2025 10:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] perf cpumap: Increment reference count for online
 cpumap
To: Ian Rogers <irogers@google.com>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Howard Chu <howardchu95@gmail.com>, Levi Yun <yeoreum.yun@arm.com>,
        "Dr. David Alan Gilbert"
 <linux@treblig.org>,
        Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250318171914.145616-1-irogers@google.com>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <20250318171914.145616-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I80r1T9QvDC91OyiXWvXHk-cjb3UygOb
X-Proofpoint-ORIG-GUID: n86a4sX69i71m97s0QBGGG_SNPb0hsmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_020537_718244_02F49CE6 
X-CRM114-Status: GOOD (  14.74  )
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

On 3/18/25 18:19, Ian Rogers wrote:
> Thomas Richter <tmricht@linux.ibm.com> reported a double put on the
> cpumap for the placeholder core PMU:
> https://lore.kernel.org/lkml/20250318095132.1502654-3-tmricht@linux.ibm.com/
> Requiring the caller to get the cpumap is not how these things are
> usually done, switch cpu_map__online to do the get and then fix up any
> use cases where a put is needed.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Ian,

thanks for fixing this. Here are the results on s390 z/VM:

# ./perf bench internals pmu-scan
# Running 'internals/pmu-scan' benchmark:
Computing performance of sysfs PMU event scan for 100 times
  Average core PMU scanning took: 6.340 usec (+- 0.050 usec)
  Average PMU scanning took: 93.785 usec (+- 6.210 usec)
# 

Tested-by: Thomas Richter <tmricht@linux.ibm.com>

-- 
Thomas Richter, Dept 3303, IBM s390 Linux Development, Boeblingen, Germany
--
IBM Deutschland Research & Development GmbH

Vorsitzender des Aufsichtsrats: Wolfgang Wendt

Geschäftsführung: David Faller

Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294

