Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWPNAIgOiUaqeYRzBZnoWTnufMu8O3aad3DcxE2TisE=; b=Do7IKMxcyZ0bd7KytFjksvfZsp
	A0AglaMXJTgR/TFDDqHvnBh7NzRrwa+mUVHjwhCqakT2HlctHhwJE8qizunaM+i/86NPbueIDMnpS
	W3mLREYPtiD9KiTA2SyPXHVq3LRqqb2Ev0/kV2gG28hVwGGnnPFd+9xYyrVpaPrlpa+vD6f07Zs+o
	3dBAGXw/lxFZiCHtUvL41wWVkSUo3S0QYiZC7lkQRB9PnriUgj0eIyqFOg30CLCw2K6hyurUfFuoV
	uOYmViDVO4vwMGyhTiPdnJIcJOQg5dCcRC8FC9wIAws1Q0xb9mF/TzddQYIbduQwjcwLKQ2pWQc0M
	426gVsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZhP-0000000BDXc-21P2;
	Thu, 13 Feb 2025 13:56:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYiY-0000000B3dG-1Jwu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 12:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eWPNAIgOiUaqeYRzBZnoWTnufMu8O3aad3DcxE2TisE=; b=mQOm+/7AOyn3Cka4vgnWQFQUZr
	F/es2aEEgBZRal1jLARQno4ewmPdQzDWiZI8F1PcmAOTjtb+lQCcHs/ESY3of+57412ckzdCrLZGg
	auAEGMFuf91rvL00hKfZkGCQhGt3teNJHi71FXABKwuI/XXQ+HxYubTeJZ5Wm/hp6AKu/RM2+9XvX
	C2FdopUvFTNStlyFwSjvqVn4LrWkM0tGmYaZZR8As1kwR/QFFHPrbsxE62NlV+k4BNpSOLcrCID/P
	ymwAwethzJQY6OD+hoztS5JIC8XgywlQYNH0PseJAEnhePvwlniVzKfbNHaurEU6+m55TBoPRL8iX
	iqiPHL+g==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYiU-00000000zUe-3xM7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:53:21 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DCmkYW012578;
	Thu, 13 Feb 2025 12:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=eWPNAIgOiUaqeYRzBZnoWTnufMu8O3
	aad3DcxE2TisE=; b=mkv988nVqKFI+Q6OrBWS2ipxPqBTWh94TEwCx5ur0CW5tE
	gFbmuMsKaNXIBWlbpy9XXzuqt8Q0SYtWLu5xw5dicWbmtK4cnhHK/N/mmO32y0Kt
	GpxgaLbUIE+WtPwE5YYqiBZ+byC9GxDxMuwNYQn050np1UxVh3j/D4JLRuKI7MKx
	qnE39AotUl1IWNJO8+Ftlv1OKxIIJ/IXGkgDbdH3t9eDuti41obAiU46MnGoLJHZ
	BBkoakKAE6C0M/vRvP7cbEBdY4a8uahULG/ptd//n6izD71nSjIDUuS/h4zdd0Kd
	0X3cjD9wjHovI3bb6RqoeEn9YfZJq2oiDEDhxYWA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44s7k0tsn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 12:53:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51DBlMZ1001051;
	Thu, 13 Feb 2025 12:53:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjkne8ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 12:53:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51DCr4JY22675828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 12:53:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2997620043;
	Thu, 13 Feb 2025 12:53:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F256620040;
	Thu, 13 Feb 2025 12:53:03 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 13 Feb 2025 12:53:03 +0000 (GMT)
Date: Thu, 13 Feb 2025 13:53:02 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH] arm64: scripts/sorttable: Implement sorting mcount_loc
 at boot for arm64
Message-ID: <20250213125302.12012-A-hca@linux.ibm.com>
References: <20250210142647.083ff456@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210142647.083ff456@gandalf.local.home>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ric8tIwk28XGa8a184QYg1kdT_6Gbzhn
X-Proofpoint-GUID: ric8tIwk28XGa8a184QYg1kdT_6Gbzhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=878
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_125319_310805_B6A0624F 
X-CRM114-Status: GOOD (  19.36  )
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

On Mon, Feb 10, 2025 at 02:26:47PM -0500, Steven Rostedt wrote:
> For the s390 folks. I cross compiled a s390 and looked at the mcount_loc
> section, and I have no idea how to implement this for that. I wrote a elf
> parser to dump sections based symbols:
> 
>   https://rostedt.org/code/dump_elf_sym.c
> 
> And ran it on the s390 vmlinux:
> 
>  $ ./dump_elf_sym vmlinux __start_mcount_loc __stop_mcount_loc
>  1801620: .. .. .. .. .. .. .. ..   00 00 00 00 00 11 70 20  ......... .....p 
>  1801630: 00 00 00 00 00 11 70 90   00 00 00 00 00 11 70 a0  ......p.. .....p.
>  1801640: 00 00 00 00 00 11 71 10   00 00 00 00 00 11 71 20  ......q.. .....q 
>  1801650: 00 00 00 00 00 11 71 90   00 00 00 00 01 7c 70 00  ......q.. ....|p.
>  1801660: 00 00 00 00 01 7c 70 20   00 00 00 00 01 7c 70 40  .....|p . ....|p@
>  1801670: 00 00 00 00 01 7c 70 60   00 00 00 00 01 7c 70 70  .....|p`. ....|pp
>  1801680: 00 00 00 00 01 7c 70 98   00 00 00 00 01 7c 70 c0  .....|p.. ....|p.
>  1801690: 00 00 00 00 01 7c 70 d0   00 00 00 00 01 7c 71 68  .....|p.. ....|qh
> [..]
> 
> It looks like addresses in that section...

Those are the addresses of the mcount locations. After looking at
sorttable.c it really looks like that for s390 we can simply select
HAVE_BUILDTIME_MCOUNT_SORT without any further changes.

I just tested it with different compiler options (fentry vs hotpatch),
including selecting FTRACE_SORT_STARTUP_TEST, and as expected everything
works.

I'm going to give it some more testing in our CI - but if nothing breaks a
patch which selects HAVE_BUILDTIME_MCOUNT_SORT for s390 will go upstream
with the next merge window.

