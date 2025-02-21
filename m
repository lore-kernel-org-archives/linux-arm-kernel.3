Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0C4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSgcvvVvljqSxVfALXNZPgVnf+ekr0yvWovzwjgyAQY=; b=t09B71KhfEujAnZcYwAQcmtoWj
	jDdT0wB6XnkaCUwA2yRExTaqPC+BhRE5gB56g9xE1g09qSTxmttgKQ04zNoeRYyUW/SH08EgBcAAz
	cKN4mAcSWZKK9qt+y92IHfGCuWK4tb9cgkz8S4uIrYzBsl+PDw3s0IiEdlDQE01dPAmK31428R5ld
	dcHw9uwL/zHi+m+bCxoSXSL+wvmHRBmCn9svFGx5GxKGMhoLH8raKZ4nnoIVpdaNoHG/p9hjuQOEI
	QXkKBphz3+lzpr5J3P39HNUHE4GmBe34jkgRnwO2IijGeiKg/RftcIOSeBJcuRzY4LKHJcj7J8uBj
	NfRFwWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPsE-000000053ik-0Me2;
	Fri, 21 Feb 2025 10:03:10 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPZ7-00000004zJ2-3CFm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:43:26 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMnaxs030909;
	Fri, 21 Feb 2025 09:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=eSgcvvVvljqSxVfALXNZPgVnf+ekr0
	yvWovzwjgyAQY=; b=FmAcTuMDCjB9l2mNpsq2poBs5NzxzsYF37pc07/D5T8AnZ
	I9oLWcGgbV+mforSMtc9BzPuGW7rsbVBw8ocEp4+OMfUgdQchG/mL//ROvt19Mr+
	hv9OAUhurdGmzghLf+nHktskCdeHa0A3ntfywZKFkOuxjvJEGRiOT71Zv6Kn++6X
	io4V6DTIXJZGPPb+UTNU6yitlZNjuZan5gQ7e3ulNY9LZxZm5oRaSRPA4nD53PQW
	WwUq6PNwu8GLPLO+8ERRN6Mhpa6W0hir3piaSu2A7NcS6i7iB3dJWyiCINixBaar
	i/+c/ENwdRIr6cDRBTTBtVJwB/xq0Isc0V02cZ5w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44xdhatg6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:42:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51L8rGu9005844;
	Fri, 21 Feb 2025 09:42:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xq3p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:42:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51L9grHC40829232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 09:42:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3C7F2014F;
	Fri, 21 Feb 2025 09:42:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8610C2014E;
	Fri, 21 Feb 2025 09:42:52 +0000 (GMT)
Received: from osiris (unknown [9.179.14.8])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 21 Feb 2025 09:42:52 +0000 (GMT)
Date: Fri, 21 Feb 2025 10:42:51 +0100
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
Message-ID: <20250221094251.11661Ada-hca@linux.ibm.com>
References: <20250217153401.022858448@goodmis.org>
 <20250218145836.7740B3b-hca@linux.ibm.com>
 <20250219102220.3b79ec5e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219102220.3b79ec5e@gandalf.local.home>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tGeBz98IMu-thKTTl-sTAJQe3BEtZNKR
X-Proofpoint-ORIG-GUID: tGeBz98IMu-thKTTl-sTAJQe3BEtZNKR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=347 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014325_798838_C5259384 
X-CRM114-Status: GOOD (  25.81  )
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

On Wed, Feb 19, 2025 at 10:22:20AM -0500, Steven Rostedt wrote:
> On Tue, 18 Feb 2025 15:58:36 +0100
> Heiko Carstens <hca@linux.ibm.com> wrote:
> > > This series removes the place holder __ftrace_invalid_address___ from
> > > the available_filter_functions file.
> > > 
> > > The rewriting of the sorttable.c code to make it more manageable
> > > has already been merged:
> > > 
> > >   https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89
> > > 
> > > Now this is only for getting rid of the ftrace invalid function place holders.  
> > 
> > Since you asked me to test this on s390: seems to work with
> > HAVE_BUILDTIME_MCOUNT_SORT enabled; the ftrace selftests still
> > work as before.
> 
> Great!
> 
> I'm guessing by just adding the support in s390 with what is upstream as
> well as what is in my for-next would work?

Yes, both variants work.

> You can just add that for the next merge window then.

It is already in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fa1518875286c94111bdaf1c7bae188c9c426c6b

Thanks for making aware of this!

