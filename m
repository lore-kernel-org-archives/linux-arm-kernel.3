Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19610F9D0E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkgEunIybz/uxHtgdoi9HPYkRW3cWxQhmhXZ60Km/OQ=; b=3hNj5bkSesNG3BcGpg8j0zoG+t
	9dTN3o4uLuWjdRSGevFmbRDTTi4zA3S1mOYd/65BvTzZoe6zao2grh/YI2JjwXl1JYt07axg5d199
	jDGS6NDz7yAfE+QBWSMGAHcGxY4gcFHP3SO0aW4JamCrZoUNjlF/Z6AGeR5m11yqtL1/r9DsOX/Lp
	ldja3zdigU/hlz7Nyt2tn072slUdGFQcyTxvupJ9sPzSI+sPZalfUxh/qf4AmODE6d8QaUQkZ/wVF
	uxUR30KQPWbMyDSn0cdaz65OhZG7YPcFwHpchu834zLVyO+XVN7xisnGRx3AnnOaF7MXBTOy4qF8P
	Fx8qYTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgM1-0000000HaeT-3bfS;
	Tue, 14 Apr 2026 16:11:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgLz-0000000Hae7-3o1W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:11:09 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EEWv2J1842742;
	Tue, 14 Apr 2026 16:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xkgEun
	Iybz/uxHtgdoi9HPYkRW3cWxQhmhXZ60Km/OQ=; b=Bjbrj4PgenYyjPDRGsg/QU
	E9NsAXuNeQgMPWF4A/IxLAvYI5uxJgbwojOYm0uXg5U4HSl+FxBmapfp7GMOuFRD
	pyS/J2CUeC9t/Z0mUtmnI/FMXd13Q8EQbhclpT81uM9f1ArzTM5k+W9cv+6ZyNEU
	cHsBTJ4PTArou4bHbAXK06b9LtO2ZeEMv2HnECe+sixrNIg5scEDxs/fwvlSM5BH
	3oE9wObWRX0e1FP+LcIkLRO9CZ5oVC/6KbvTOaX/luzqaQXwvJCGS8rXfwFK1O/E
	vM8mR0CuDEfC/dk4Yb4kAQ41Kebh2gEaS4yZ1pemdnX9DuCPjOl1LSww/zLwEZOA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89mkppf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 16:10:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63EEweMq026284;
	Tue, 14 Apr 2026 16:10:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2ujj4h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 16:10:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63EGAYGD29032930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 16:10:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 324232004B;
	Tue, 14 Apr 2026 16:10:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D055420040;
	Tue, 14 Apr 2026 16:10:33 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Apr 2026 16:10:33 +0000 (GMT)
Message-ID: <c1d306dc-c6da-4ae6-8cc7-6133e253334b@linux.ibm.com>
Date: Tue, 14 Apr 2026 18:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] unwind, arm64: add sframe unwinder for kernel
To: Dylan Hatch <dylanbhatch@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <indu.bhagat@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260406185000.1378082-1-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0OCBTYWx0ZWRfX7eqnRXSdZg4v
 glBjYWKYGKBs4G24BhjG6Utm6E8Yw+TfyJxD9Si0jZPY/67mJDI7pUaiJOQBIlnNYup+XBRaqUs
 PEzSBdVyU7Y3Tir/sJZjOdFTqghkyQP7N+Y4Tavg+7hQpAM/TYBu3h1Vk4867xqPqZUmYbVhL7j
 YzDx691+QzSrwr3UndTlgJ/oioBpvo2DXnHToPR1lUHpWwaTF01hVEoCvR0oHgksjOmyNP6y+aF
 FOWtifBFnzD6A627BzbKr66+Si2NQSCTIfPtF6T1+/kw6y2LCY2SSTJTU/b3+x5HFnIKiqZL4p4
 jcHi43Y9kJuaS/mEXEz6k6M+rQsoliJuQDTiV1RQfcDxJMFcl2DZ7r0fXqrijQyohqJAIoLXxVM
 WMEEenyXrDGQFRAFF0uv2t7LIede3fJ00fQBK/3DUjvv7nF9q6GYleeA91/hYAFPyfrIqnuyJ7z
 +w2Ujw/v1oh/wnZQcCg==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=69de66fd cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=Zg_fgM-7fzLk7_7bOdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 3m3_VBFCWvmOrIMnl-0WlOdsMwD0_RKw
X-Proofpoint-ORIG-GUID: CH-2a-nuGZI5u_Lb2b4gbgN4-GM4wBNM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_091107_953908_FB968EC8 
X-CRM114-Status: GOOD (  10.33  )
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

On 4/6/2026 8:49 PM, Dylan Hatch wrote:

> Dylan Hatch (7):
>   sframe: Allow kernelspace sframe sections.
>   arm64, unwind: build kernel with sframe V3 info
>   sframe: Provide PC lookup for vmlinux .sframe section.
>   sframe: Allow unsorted FDEs.
>   arm64/module, sframe: Add sframe support for modules.
>   sframe: Introduce in-kernel SFRAME_VALIDATION.
>   unwind: arm64: Use sframe to unwind interrupt frames.

Nit: Trailing dot in commit subjects seems unusual.  Remove?

> Weinan Liu (1):
>   arm64: entry: add unwind info for various kernel entries
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


