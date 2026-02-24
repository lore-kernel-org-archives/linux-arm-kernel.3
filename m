Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB66E9B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO64/dkjbW/dvFC/vqTXMyNPJLKJF7tJot1AAAqsBp4=; b=xkLIuxAXDeQRwL+2gKLXWYK5KP
	jU1J2UZ2aQZ/qxphrbLMfspF5Og007zjVo5yNSODg0W6VaklOI26qJ4Aa3sX/NrRezRKvjJ7CJfky
	yWW6Ilt4TJ3bFrd+Atp3l6nyHQlc5xjk+1zJm3BY46acs7Ttf50hEUaZ72sgGsSYgdfuAVQ9uNsEE
	j8mgrMc0gVxdmjRf6kvRnDxy5I3Q3vDLglSAYAzUl+y6zU8xOkUXTmfNE2ZPCBRPqFuU5bJvIiEWQ
	NJrGoGedT4tGqAl8IljQTGv/4D4vbHMmc48OVbkfbv/Nj/oaLzULwa2I3QykZ6GkNfW6PvUraMuNj
	jHknp2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vus6J-000000026ME-0vPQ;
	Tue, 24 Feb 2026 13:05:19 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vus6G-000000026Lm-3BxU;
	Tue, 24 Feb 2026 13:05:17 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O83maL2345992;
	Tue, 24 Feb 2026 13:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=wO64/dkjbW/dvFC/vqTXMyNPJLKJF7
	tJot1AAAqsBp4=; b=OVtLzw386cqqEN37RlRH6SOPVS0YfpM6+NNCREe1cEwYeg
	O7FA3I9ee7WboClZR71kA5J+WFSubxzJC+nE+aJypc3bjKqXgQCeDf/4qTy5SKhr
	ZhTaoJIPi9HIcvAtdUN8Ks8KIcJ6aB5ipwyzjSA7QQXQvsUl7hEtmuy7qpjD9ftr
	fR7lnjFAJTuRe3c0ZX+kDTM29i9GtoqMqLZWyI6Po6asx10ZCZTh6RU0HlnLZqjZ
	7z7LU2cq15D5/dVqRXUbKSvcly+RBU2lFfFWN9v4v/snifEbXfNrG+9nKnyuQnJP
	ubiYhIbCCpi66j+0hwlJSYXTRljAozQhlnGyLidA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ch858h0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 13:05:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OCQq3G013438;
	Tue, 24 Feb 2026 13:05:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdy118h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 13:05:03 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OD4xLB57475566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 13:04:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63BDE2004B;
	Tue, 24 Feb 2026 13:04:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCBA820043;
	Tue, 24 Feb 2026 13:04:58 +0000 (GMT)
Received: from localhost (unknown [9.111.88.84])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Feb 2026 13:04:58 +0000 (GMT)
Date: Tue, 24 Feb 2026 14:04:57 +0100
From: Vasily Gorbik <gor@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Pasha Tatashin <pasha.tatashin@soleen.com>, linux-s390@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Subject: Re: [PATCH 1/4] mm/page_table_check: Pass mm_struct to
 pxx_user_accessible_page()
Message-ID: <your-ad-here.call-01771938297-ext-2808@work.hours>
References: <cover.1771845678.git.agordeev@linux.ibm.com>
 <68c2f6df2955033cbf1ccbd2b5c2816e72ac345c.1771845678.git.agordeev@linux.ibm.com>
 <20260223101335.aa3696d86341260e03989ac0@linux-foundation.org>
 <cfdc9b3d-06fd-4cc1-b946-076ff1479c66-agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cfdc9b3d-06fd-4cc1-b946-076ff1479c66-agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwMyBTYWx0ZWRfX82K/iej59Gbi
 jcOJ4LV65vjd++THoXAxHcOdHzl9vxwXul+tKmMciocrWFcM4MzDCiFMma5wnoQRFwQzwk2EUBo
 owgONljOlgoxYQ/sphxEac8MzWSTdSTmmJ1euVadS2kLw2mK651rPT6pc4Y8JUKpz9+kA0i3Qdr
 0NjLoQ/uXZ4ylbetYJiJi3eLDnxuBmvkISzhb5p3iHvDssAio/iJP3IhtlhLBtIntIKgtZ9jvQY
 N9UvSFPPSWb+D7jqlrvouPooEObPd0Ls/OaMZsv0oPQpzoQWIDGhIC9pPsqz8KYKLAxWPGkOYqe
 xvgEJpXH9jQLtd4G6OrmHss4/N8DuG3FasVJOptPVsjLFxrmQpgI9vS48WGLo4GGfHF/pUL//u+
 dzDB3AI8mMgPzjh+Uue9Gm/engWga5K7G9IVgo/bX9fukaUzzkeWhv/HczqOxdZfsFvXjrwQOyl
 SfanzqqZBDLrB1sjlbg==
X-Proofpoint-GUID: -kGng4CI3unx1jXZ8zqVfjNMiflOOOSx
X-Authority-Analysis: v=2.4 cv=S4HUAYsP c=1 sm=1 tr=0 ts=699da200 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Z4Rwk6OoAAAA:8
 a=8RkruKr-LY4rosFeA0QA:9 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: -kGng4CI3unx1jXZ8zqVfjNMiflOOOSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602240103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_050516_805981_1346403A 
X-CRM114-Status: GOOD (  14.75  )
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

On Tue, Feb 24, 2026 at 07:06:28AM +0100, Alexander Gordeev wrote:
> On Mon, Feb 23, 2026 at 10:13:35AM -0800, Andrew Morton wrote:
> > >  arch/arm64/include/asm/pgtable.h |  6 +++---
> > >  arch/riscv/include/asm/pgtable.h |  6 +++---
> > >  arch/x86/include/asm/pgtable.h   |  6 +++---
> > >  mm/page_table_check.c            | 15 ++++++---------
> > >  4 files changed, 15 insertions(+), 18 deletions(-)
> > 
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Thank you, Andrew!
> 
> > I assume this can go into the s390 tree?
> 
> I think so.
> @Vasily?

I've picked it up, thank you!

