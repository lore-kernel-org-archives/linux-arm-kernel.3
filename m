Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E665AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G3fJTsPM3PHD9oCrIMRqDVoc+TasoPU4gPsLvhxTFY=; b=p6oh51LVUCPCBMsGlc4xezCjvf
	p3US7SFjUWBqSSosbLxeDv8tgs8edO7LKq/UM1olVP2vYseVv+6uKl9mt8XJMcKiVYz0zb6VQ/TnJ
	44d8RBHMDCokx/O5x10U1x8JJfn5/4HoUCTVvovAEz3FO/Qi73PRSjFTIIn25opK2yOU89peoCb4W
	RBACeveEkCLQ3QZhQD5dZ5xYY33NRE4NUo+uoZZLnGwQzdxDaxL2saMn+Hg+/oW8JD+XOFysUWyr9
	KpwFZW9XEaZtUlC2LdZmwn/Lxx6VfAmCKSaFC4pu8WziU+l0V4TtZEZsCOH/2VN21lqjHArJCuES2
	yw1trxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP7J-00000008gPU-3MD2;
	Tue, 18 Feb 2025 15:02:33 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP42-00000008exM-2PfN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:59:11 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ID86i6001000;
	Tue, 18 Feb 2025 14:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8G3fJTsPM3PHD9oCrIMRqDVoc+Taso
	PU4gPsLvhxTFY=; b=DQIJfHhO3QD73+jp3tfon/61fA2d/r5I1fep0BoPRgRBrh
	fgTG7k33O7gqCKVdYSvGhvsPyfxJBhUvfW652t0LZUwumb8W7vcB7aFrWN63bzag
	6EejdN/Xkyy85PHoZRW+h9YrP2n5iSzFr+iXZr+FjGtmwnlygJ/3xlzQ+e/pLMwF
	hq/alZxfLV+BBcaCe0ditIsn6EDNOWgnPqvpfYxcBk2bPrsO25OtBWTib2Gr048X
	wkQvZnBgJcvBsGfXl0XeGf6KH0A30OySYegj9P8XoFSkXXaDRSiZGHxtODNd6+QA
	9yQcMpnfr8PYX66y7AaEwT8XPDcwxB4VKYs/cKcQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vh203848-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:58:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51IEr2qW013259;
	Tue, 18 Feb 2025 14:58:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u7fkkgt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:58:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51IEwbYV39322100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 14:58:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94FF720040;
	Tue, 18 Feb 2025 14:58:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3119A20043;
	Tue, 18 Feb 2025 14:58:37 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Feb 2025 14:58:37 +0000 (GMT)
Date: Tue, 18 Feb 2025 15:58:36 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, bpf <bpf@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Zheng Yejian <zhengyejian1@huawei.com>,
        Martin Kelly <martin.kelly@crowdstrike.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v4 0/6] scripts/sorttable: ftrace: Remove place holders
 for weak functions in available_filter_functions
Message-ID: <20250218145836.7740B3b-hca@linux.ibm.com>
References: <20250217153401.022858448@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217153401.022858448@goodmis.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N6Nd-Kgwrh6LB3tMVi3DOv2CPHs0sU1v
X-Proofpoint-ORIG-GUID: N6Nd-Kgwrh6LB3tMVi3DOv2CPHs0sU1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_07,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=293
 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_065910_722632_9616C7DE 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Steven,

> This series removes the place holder __ftrace_invalid_address___ from
> the available_filter_functions file.
> 
> The rewriting of the sorttable.c code to make it more manageable
> has already been merged:
> 
>   https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89
> 
> Now this is only for getting rid of the ftrace invalid function place holders.

Since you asked me to test this on s390: seems to work with
HAVE_BUILDTIME_MCOUNT_SORT enabled; the ftrace selftests still
work as before.

