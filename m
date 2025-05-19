Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536D1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEChRQ3cYw3UCjbb1oqD8moO8IE8jgsVGQLNpG14ups=; b=jGh3DUpBbearY/4ky5sV/a9K5a
	fBEKK+Ew3S1d+jpb8cBGXFsFiPP4kcCt57FyGJm5sjRD+LnF2kmXmmxV+qN414byE2QZb3ZglX0gA
	01qA0SeJP47ARPFmgRg+4PMhU2UVPUfzapVHupGxDZ5cHOlenx0puUa813h+TeZiqh4wNvfKn0Zbq
	TD88CixGncsl805t0plxb54b3IrxXLUnaDVXX4c7K1BYBLqacWcQkwVqvycHk3uK/Jl0V8RFU3d7h
	QFI+tvW4qYR2kHSA1UsaZCDsjjKvnpIr/C//oE7+M2D/sHPffsQBcHEkWKjwKLcYp0YRtj6tk5Krs
	vI9Vw0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuWv-00000008ANB-1NE5;
	Mon, 19 May 2025 07:03:22 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuUl-00000008A3n-37JR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:01:12 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IJeeaL016000;
	Mon, 19 May 2025 06:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AEChRQ
	3cYw3UCjbb1oqD8moO8IE8jgsVGQLNpG14ups=; b=aKQdyONKXhvLaSdtRuI+hW
	3aICkAwbfw7NGqKY/BEuL00JwX6dds14qEM+U0P+pXnahdbG5gn90+8v4/ejCL+Y
	CKBwzMRSv4uC+wiULVKiuwd9s2u7oJ1PTv7PlzJhTs4+rmfyauTf4rRpDSZ0Cvxi
	E2FGGKacYI8jj4Kug9fn5JyNzD3QwQgsNQLCoM+tceAayafdVj6+efy/pOUGmss1
	YK65md+G/RuvZlUg/2YcjNTPJJlBRGzkPMdy/cuvao1LhY+W4u3hiXgDrMlM0X15
	v7SQW06S0clVvIy8YSkQE8liUVeZVZxDsfNO1R/BCqm4p4PGH4RsQ/My+zEm6b0w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46qn68j3xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 06:59:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54J6xsuX006177;
	Mon, 19 May 2025 06:59:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46qn68j3xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 06:59:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54J5GrXj014262;
	Mon, 19 May 2025 06:59:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q4st5kxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 06:59:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54J6xnjx56295862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 06:59:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02A6A20147;
	Mon, 19 May 2025 06:59:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11A6F2012F;
	Mon, 19 May 2025 06:59:42 +0000 (GMT)
Received: from [9.78.106.42] (unknown [9.78.106.42])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 May 2025 06:59:41 +0000 (GMT)
Message-ID: <6dde4d2e-b249-4fb8-a8f6-359cb7c8b0fe@linux.ibm.com>
Date: Mon, 19 May 2025 12:29:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 06/11] bpf, arm64, powerpc: Change nospec to
 include v1 barrier
From: Hari Bathini <hbathini@linux.ibm.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Puranjay Mohan <puranjay@kernel.org>,
        Xu Kuohai <xukuohai@huaweicloud.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>,
        Shuah Khan <shuah@kernel.org>,
        Henriette Herzog <henriette.herzog@rub.de>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Cupertino Miranda <cupertino.miranda@oracle.com>,
        Jiayuan Chen <mrpre@163.com>, Matan Shachnai <m.shachnai@gmail.com>,
        Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
        Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>,
        bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org
Cc: Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
References: <20250421091802.3234859-1-luis.gerhorst@fau.de>
 <20250421091802.3234859-7-luis.gerhorst@fau.de>
 <d351c0ba-04fa-4764-a3a2-c4a8727aa582@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <d351c0ba-04fa-4764-a3a2-c4a8727aa582@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GMw36QXQwyRthu_VuAnZZSFrlc5efPI5
X-Proofpoint-GUID: zh71TRuKhrMTzlDgqFOcRXTquRP3iToP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA2MSBTYWx0ZWRfX7qotaP9KBzNW IUL/DbUBW33FBjqSdwgPTeWvtZTtI0/q2QhlZMADKwz+DiSMh5oZkgFiIrBC576tk3ZilTQ/2No w+Ly+CJltLUwVzFyAaU1ZIDC+qfFyMTzoOVXD2mSNMgpdqrWAiHY7NpKjr/UJoV+JCRpedwDzLZ
 MIwatIryHVrrN/7WhqGYsmSy2K4ZLzxuyVD4+DkIWYjuIw3otUdZqkYSc6vRJ97OjYJY8zz3aD+ blVaTRECvfIh5UUZLVnFSi7V44N5wIV3vBs880uZEvhm5H5LfiL+Ff3mgsiGc6O+7/8SkMKTw62 wPfL7OlrG64cmsi+FaVdwEa8vqKFwrD5YY1r4Nahw3OC7ttXFKKViUitng+Mxl353W20OJnY7u7
 kPcYUe/M1+db99i9pJr3t71w9xExnHnXQvfZrPjGxr00PWVWsSoCwPB+PqVFO+N15ImPXIVX
X-Authority-Analysis: v=2.4 cv=CN4qXQrD c=1 sm=1 tr=0 ts=682ad6eb cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=KxtnHP_eebYsle0CoksA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=886 priorityscore=1501 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_000108_136988_E28B8DA3 
X-CRM114-Status: GOOD (  17.45  )
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



On 18/05/25 4:11 pm, Hari Bathini wrote:
> 
> 
> On 21/04/25 2:47 pm, Luis Gerhorst wrote:
>> This changes the semantics of BPF_NOSPEC (previously a v4-only barrier)
>> to always emit a speculation barrier that works against both Spectre v1
>> AND v4. If mitigation is not needed on an architecture, the backend
>> should set bpf_jit_bypass_spec_v4/v1().
>>
>> As of now, this commit only has the user-visible implication that unpriv
>> BPF's performance on PowerPC is reduced. This is the case because we
>> have to emit additional v1 barrier instructions for BPF_NOSPEC now.
>>
>> This commit is required for a future commit to allow us to rely on
>> BPF_NOSPEC for Spectre v1 mitigation. As of this commit, the feature
>> that nospec acts as a v1 barrier is unused.
>>
>> Commit f5e81d111750 ("bpf: Introduce BPF nospec instruction for
>> mitigating Spectre v4") noted that mitigation instructions for v1 and v4
>> might be different on some archs. While this would potentially offer
>> improved performance on PowerPC, it was dismissed after the following
>> considerations:
>>
>> * Only having one barrier simplifies the verifier and allows us to
>>    easily rely on v4-induced barriers for reducing the complexity of
>>    v1-induced speculative path verification.
> 
> Fair enough.
> 
>>
>> * For the architectures that implemented BPF_NOSPEC, only PowerPC has
>>    distinct instructions for v1 and v4. Even there, some insns may be
>>    shared between the barriers for v1 and v4 (e.g., 'ori 31,31,0' and
>>    'sync'). If this is still found to impact performance in an
>>    unacceptable way, BPF_NOSPEC can be split into BPF_NOSPEC_V1 and
>>    BPF_NOSPEC_V4 later. As an optimization, we can already skip v1/v4
>>    insns from being emitted for PowerPC with this setup if
>>    bypass_spec_v1/v4 is set.
>>
> 
> Agreed.
> 
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Applies to v3 too :)
Let me send for v3..

- Hari

