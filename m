Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1697C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU0lDOj4fnV4lbhScWiQUVCcAJe+tLfpYFaq2c/Ynhc=; b=eunQI5ZYUUEgdPOZulknJ/qm1O
	RH/yH0Cl39AwlPAdIF2IYwhENqEhyxxu5DX+DqPOahEuDaCfcaAKkiIlJQi1Jj1/4KQtNCWDCOPSU
	Zatm2wVdvPKveykW7vuo+IQ1dmqYFpV+u3c3TjRGFhz0VrlqfxM/wZdfuA5OqMRONu0prAzCfCWTm
	SmJpzBTAT+WlqEALIr35m+/pDN+dMr2p2sF2phIaxY1zMFYIT4czsf12LZl2jtI259O75WtOwrys4
	qCyuJ/hJkjVDtL0X5ANIF3f/ctYidH6PPeBh60zrMb06BQxmyF//SvzBv9a0fI4s/j/d6AWBi6Xnz
	t7+XSm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7Do-0000000H32j-3hmC;
	Fri, 13 Jun 2025 16:25:40 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5xd-0000000Goag-2XO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:04:55 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAlkP2027642;
	Fri, 13 Jun 2025 15:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=nU0lDOj4fnV4lbhScWiQUVCcAJe+tL
	fpYFaq2c/Ynhc=; b=gczvSCYaCYtxBqY7tij7LaHV95ZM5dT9KLXs2772CDrHWW
	4yBPAT+J2rxpmf73BuVUNVHKrAHJUMB8/ABj0LeJvtFU8CrKcntWTl3ThKh1g7wB
	nkHxJ8jdR3B1PYvIr5BOWLZNQXwYf3ZXrFU2bURgBqi0MdWOIXXsDfYGj+SceDzw
	hq5AWeXyucV/jlhWM9GEAGrKUEpdZ6AdGJIyhLoqNhqYBDUmPja7rnf8lbJKJw8Q
	dD6vNP2scvumPjKrEUZGTSO3Dcsj6ZeDAYfZr0+IZc5jZEVC7PFdQKFZqoGKMUwv
	qCAEoNccYSw9n9Nhrm0/0aJlH7YxJEHfb17niA2Q==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4mpu58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 15:04:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDje1p022352;
	Fri, 13 Jun 2025 15:04:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 475050anv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 15:04:39 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DF4b5b37224918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 15:04:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8664920043;
	Fri, 13 Jun 2025 15:04:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0612C20040;
	Fri, 13 Jun 2025 15:04:37 +0000 (GMT)
Received: from osiris (unknown [9.111.92.109])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 13 Jun 2025 15:04:36 +0000 (GMT)
Date: Fri, 13 Jun 2025 17:04:35 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Will Deacon <will@kernel.org>
Cc: Tengda Wu <wutengda@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David A . Long" <dave.long@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
Message-ID: <20250613150435.26153B5d-hca@linux.ibm.com>
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
 <20250612163331.GA13384@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612163331.GA13384@willie-the-truck>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=684c3e08 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=7XB3cJai-94OTXmGs3EA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: uwSIkbTXw9knD9U00yLIga3sZ76sILCJ
X-Proofpoint-ORIG-GUID: uwSIkbTXw9knD9U00yLIga3sZ76sILCJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfX0DEYwy1xF1tK rzsFKtB1UXWYoQiamn4W1/RqmeNO/QlD1ORGeZrZkvEbSfUSte1MlAfQF1LqTVA5xYkT77hj3lA 3tRQGtTE5tTuD37x8Hjuc99UK+WdaDtuiIAeuWEMUGiiV4YAdpKh9lco/vDrRaV6q1jXRop5CKK
 y2FGB1xY+e+FspHfHxamopWFIr6IptP4az/RLd0iMgHM+bOo1dX6bFIhmZMZHi9c56JEBnG6tJo lVLqkk1ab+Ur53kfYOr68IGWWODpktWs1obcRzQ0N7NcW1tWj8hPuyU2cqzoHlwcHOphAQ7aG9+ 9YfQlh9+Lqj1jvngXRGdqRtGHm3kwYHjsS9belae3ToB3vE5dCBTh3hx1LSc2gBaEMuZj11smIv
 zFrySB6YupbRZLLAmxIswv0N0sxM3VetXZoEEUfGhI39hvnQM1YIc5SjqEj+vz49WpytVgnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=603 spamscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080454_119742_9DD466CA 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Jun 12, 2025 at 05:33:32PM +0100, Will Deacon wrote:
> On Wed, Jun 04, 2025 at 12:55:33AM +0000, Tengda Wu wrote:
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f79b0d5f71ac..fe3f7e554d14 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
> >  
> >  	addr += n;
> >  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
> > -		return *addr;
> > +		return READ_ONCE_NOCHECK(addr);
> 
> I think this should be '*addr', but that makes me wonder wtf s390 is
> doing...

That's obviously a brown paper bag bug in our code... will be fixed.

