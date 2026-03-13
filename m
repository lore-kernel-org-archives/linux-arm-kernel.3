Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0B2105F787
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5ISSpRb1O8saxC4lfm04hKl/KldjalJtB+bE/BKifY=; b=ZBA3s65MA5qKD21f0xJk5Qi3vV
	gtKX8sKsNlO6Cohk6IQFH5DxZIjPPtKP5kLTnykK7JFanBqaNHqcJkhiISK/Ii28o18kxOGUmvkhT
	bQQutGAo1VCTjkl6q5rnPfhQyL0fAu7oQwIDmmfAG9tkEBmMN1c2Q9rfgnqZ5pIf8gQtt/s+ms0Gr
	AbaxRYm979UkUtx1g1WvyhOoz5dDlAg3pY/CXFae7vtNcqOZHdFRIXw7Kcz3g4+GYnirddj9CxLhU
	JkzsPW0rA23f6i++WuOgJ43qevOeNIwqbRjpc97op/kfmLsvLXpUzonhbPj7+1eJXb0e2Yujqoc20
	0Ynzb1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zTA-0000000HUVQ-3WP8;
	Fri, 13 Mar 2026 10:10:12 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zT9-0000000HUUy-000e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:10:12 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5svNb2279407;
	Fri, 13 Mar 2026 10:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Y5ISSpRb1O8saxC4lfm04hKl/Kldja
	lJtB+bE/BKifY=; b=AqxpL5ELsmxQ0aDfl1yO4WEG3u/OhperAHKLT0hHiSbWaS
	HizG4bY6tySbEuuTwtUx57xttlJSCYFhz9aFX6ewI4eEMj8aM54iMSejwk7/5Rnd
	SqPUwVgrvPlPrNrSiiXhC7cvW69tNVGbfuQQqgKP4fMW/ltb+1g0unoNJwYO2+VL
	Js3whRoMfRdUzUJcz0FBtDS/iLJE7Wp6FIbjl2mzc6HeUKAouyDrKBZGQkQOPovy
	DXQ8uthutDNQpik6FTn2sDQVKbjOQBHFLlUfMpAJdBvt6DJxIClL4RUskur+nF5s
	7V9szbifgGioSfQA7loVBQRWa6vFEoJei8A9Tqug==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cuh91q6e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 10:09:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62D5JuFF020823;
	Fri, 13 Mar 2026 10:09:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cuha9p5hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 10:09:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62DA9OSL42139930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Mar 2026 10:09:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2410B20040;
	Fri, 13 Mar 2026 10:09:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C21A82004D;
	Fri, 13 Mar 2026 10:09:21 +0000 (GMT)
Received: from osiris (unknown [9.111.5.66])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Mar 2026 10:09:21 +0000 (GMT)
Date: Fri, 13 Mar 2026 11:09:20 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v13 10/12] s390: Rename TIF_SINGLE_STEP to TIF_SINGLESTEP
Message-ID: <20260313100920.13729Bf7-hca@linux.ibm.com>
References: <20260313094738.3985794-1-ruanjinjie@huawei.com>
 <20260313094738.3985794-11-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313094738.3985794-11-ruanjinjie@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: H4ELXjqqSrg0HA1e_zdfByUhlL4BUfwg
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=69b3e25a cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=i0EeH86SAAAA:8
 a=VnNF1IyMAAAA:8 a=Faxj65_8-bvmV7BNHo8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3OCBTYWx0ZWRfX2tppFx5LmEx8
 xb+bd+acOJVlwpEccEbR+hI/SKYs14uHyxQMbERTaSgx31HRpHqW5tU3kLWak+fQWKfKPH+AQC9
 QggyfFjyyavLSmSn+j3gUuqcoV65rzSvTXK60cjTshKx42oBtRq4hU9hXXR7G47m57Y9cqb6SJo
 AjFAecRRJdhUBkFU4XKCOap4eI0LozwOewVfIJ8e/xlU7W1iBigGIw4CYlK1Ch6KDWyELSD4Yyq
 Yo8/fc6aj9oVmIl60tij8By1/7pXP4BJDI/mQ4ry4p1IQzKqEvtNBZEnLRiEs49+48CyDBCFP+R
 cjeEptLXGS6KKo2pR0ts2ihWtS9nUsnXkijkB9FJLez7r2VK+esO8wEeE+uu71DY8pvOr+2XNN6
 G37tgjgQa3ZUqf/SvRgYhBU9nRLNrrlT1gSDokptZAjf/CND9ll1tAc+jr5vzMd96nE5ozwzutS
 zfzkP0L1b+CA3dMgd8Q==
X-Proofpoint-ORIG-GUID: o8Yb7OdfJh2No2smJWpH5G6Fb3d4P4-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_031011_043541_AC988BD5 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: mark.rutland@arm.com, schuster.simon@siemens-energy.com, andreas@gaisler.com, kees@kernel.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, hpa@zytor.com, agordeev@linux.ibm.com, shuah@kernel.org, jremus@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, gor@linux.ibm.com, will@kernel.org, deller@gmx.de, x86@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, borntraeger@linux.ibm.com, kmal@cock.li, tglx@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, bp@alien8.de, richard.weiyang@gmail.com, dvyukov@google.com, jgross@suse.com, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, luto@amacapital.net, svens@linux.ibm.com, liqiang01@kylinos.cn, mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 13, 2026 at 05:47:36PM +0800, Jinjie Ruan wrote:
> Rename TIF_SINGLE_STEP to TIF_SINGLESTEP to align with the naming
> convention used by arm64, x86, and other architectures.
> 
> By aligning the name, TIF_SINGLESTEP can be consolidated into the generic
> TIF bits definitions, reducing architectural divergence and simplifying
> cross-architecture entry/exit logic.
> 
> No functional changes intended.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/s390/include/asm/thread_info.h |  4 ++--
>  arch/s390/kernel/process.c          |  2 +-
>  arch/s390/kernel/ptrace.c           | 20 ++++++++++----------
>  arch/s390/kernel/signal.c           |  6 +++---
>  4 files changed, 16 insertions(+), 16 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

