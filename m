Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0746F557E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtAQ5nespRadwMvnwiXY7YJQC/MnrHSYrYxhN6nze7I=; b=f1b8CEcxtHttW31e0G2qvaU7N3
	hfjfVxOZFcfZvqAUjZy7uxl6pJFrlDa8MxfzoEN20g/yTyo7YH5mvxR+JlwUTTtiDPt4v4NfU0RDr
	b38rENU02FsH3pRB5p6c9qAOtSt6mX/AosgVG6fdYaw6uWGQs0ERr1rHmTET4tGIlf2ePTo63nnl+
	MWvl1n2N0JoVwqN0iXzBPWzcHRcmsF8O/htDaBRVbuMlDN2gS2m8GPgyG5+CT27//Pj8GpwzqP/6D
	b1dksKTfCdUysWDYlF/3K0mgoqPbpAZt+DqS9JOIeDMy242dIC7+WeC57917xarjTcEte06a+u4cu
	LvrRMGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkDt-00000006bvo-36Lt;
	Mon, 20 Apr 2026 08:43:17 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkDr-00000006bv6-28UM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:43:16 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JKbMQw3328104;
	Mon, 20 Apr 2026 08:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WtAQ5n
	espRadwMvnwiXY7YJQC/MnrHSYrYxhN6nze7I=; b=lpDofpztFtDwXoeQcJzIj0
	8rABpaVRS5+5/Tjo+jRIUM4Okxk8XH3ZnMYUmbhMuhlHJYIQ2p+nyT0lYWMn4v8z
	0X1ul1e4Q3S01AYfQy8r7gASICC4nQ55z8nOlE0bj8PcXur3su2pkolWkaQIzDrm
	h9doLym4ROVuI1/fOVPamVlrAlJNwunaTO8rJSIPmCtWwPU0rTiSIrTLAedBULoC
	vhBRp95mFBJloqc8uu6iWrV0gFIVEAIFc8bzkUo9s7iUHU8GtdClkHdX/U5jN37w
	klCehLWiXhDBwyFCJrWFLLe5HcFujmwylj9fT9bvUP/erRAct9GNzjjPkpdOfsCA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dm2nexyp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 08:42:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63K8ZUqx030654;
	Mon, 20 Apr 2026 08:42:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dmpyxussy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 08:42:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63K8gbeh49611118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Apr 2026 08:42:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAA7A20043;
	Mon, 20 Apr 2026 08:42:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B4042004D;
	Mon, 20 Apr 2026 08:42:36 +0000 (GMT)
Received: from [9.111.165.155] (unknown [9.111.165.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Apr 2026 08:42:36 +0000 (GMT)
Message-ID: <fa27b683-d291-4f1d-b11d-3e178e5f578e@linux.ibm.com>
Date: Mon, 20 Apr 2026 10:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] unwind: arm64: Use sframe to unwind interrupt
 frames.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>,
        Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <indu.bhagat@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Heiko Carstens <hca@linux.ibm.com>
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-9-dylanbhatch@google.com>
 <95f9d11a-dd92-433e-a8db-cbebe94e1611@linux.ibm.com>
 <CADBMgpwjDf44p0ApR1=XVStCyN-0Q6tuywJ4ixLcbaLZOSjjBg@mail.gmail.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <CADBMgpwjDf44p0ApR1=XVStCyN-0Q6tuywJ4ixLcbaLZOSjjBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: fzGFf5xC6qPPmew3PdEDoQXPPZnPkVLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3OSBTYWx0ZWRfX7FawYZQxbNSN
 Qf5nZEkKh5Inn5raHnrzNTbahFHEVKRATu8Vr10un/rsioaw+UfOa6+S9HrzIR2YimZa4u/0EHP
 Z0cZ53uOyCagH8e2kH+5W+N27cHW2MAyOv49ljYXugp7DwH9Rerew3HH6SCkY3FAlv+nzSZDlpN
 PiYrOHugV1Y9HA7VB0xNK//Rb0AkmxMbUnPChazKpF53z4RJ45MAaGVyEZOJOpmWKoTqfCGaHVY
 q24MMy7NYx6Qv/qyXiQqG8T2X6gN7eCffVL5nfc3Cw1P+cP49eLe7x0Jy09HW9/C1kn/yBPnhaB
 H/+GxEPPS3TJAXK8y4eG5xq6THUBBtvo66hmn+OTGa/kH8rabmOWlw+sVG+R65tweGkrWANy+6o
 zSrstjn30GnUwt7Beu1pFRSSbhV+1Fh0XTUEbtHVbFpMb07BOspeMyttj7CbMBFUaqYCeNiCvPN
 oC90dkkIC7MIpXo11gw==
X-Proofpoint-GUID: lKZ91ibTxh7IZta9vbAZRx6-JC85qujN
X-Authority-Analysis: v=2.4 cv=B7iJFutM c=1 sm=1 tr=0 ts=69e5e701 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=Szxg4tLUPHRwUYXFK54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014315_561090_0A257359 
X-CRM114-Status: GOOD (  22.47  )
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

On 4/20/2026 7:56 AM, Dylan Hatch wrote:
> On Fri, Apr 17, 2026 at 8:45 AM Jens Remus <jremus@linux.ibm.com> wrote:

>>> +     case UNWIND_CFA_RULE_REG_OFFSET:
>>> +     case UNWIND_CFA_RULE_REG_OFFSET_DEREF:
>>> +             if (!regs)
>>
>>                 if (!regs || frame.cfa.regnum > 30)
>>
>>> +                     return -EINVAL;
>>> +             cfa = regs->regs[frame.cfa.regnum];
>>
>> In unwind user this is guarded by a topmost frame check, as arbitrary
>> registers are otherwise not available.  Isn't this necessary in the
>> kernel case?
> 
> It is necessary, though as you point out the way I wrote the check is
> not as obvious as it probably should be.
> 
> The saved state->regs is set when the current frame is recovered from
> the saved PC of a struct pt_regs, and then immediately set back to
> NULL after the next frame has been recovered. In other words, the
> state->regs is only ever set when it is relevant to the current frame,
> which occurs when state->source == KUNWIND_SOURCE_REGS_PC. This only
> happens when the topmost frame is recovered from a pt_regs, or when a
> pt_regs is recovered from the stack due to an interrupt.
> 
> I can make this more readable by adding an explicit check for
> KUNWIND_SOURCE_REGS_PC in addition to state->regs != NULL.

Thanks for the explanation!  Maybe just add an explanation to the commit
message and a short comment above the (!regs) test?

/* regs only available in topmost frame */

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


