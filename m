Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BDCC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 05:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2at7qqhU5esJ06sT8kotxmCJGy7Nu/9DF9wojUpF83c=; b=uBj3IqDmoblDSNJ1Y1BlnoVz1C
	e4Bsf6v0OcYbSweRYAxAj3vFOwwH6UxpLNEHFV+2YFIiTGhMo+7qpDrdiMZGs4rNFOAfQXfQzV4wx
	PuFcsg5DyJyYsO41llADTPMWUhcMBRDgm2o7OtaLxglRwhXEnd9YZy+NJqhAiROTzfhxUZXUYkqXl
	IrM2XeiXlP5Bh6J2DvM7WJpBH3LlIcEsQSYQLrDjgLOT8AAML+WeCIn/sUylKdg6gWDpjEy3PE6AQ
	LPbX8+AUlGXquMOL8YMe/kJBJ4dzTxQ0HP/eG1yhsTtam714LKxtcve4eMDKODXLo8EdxJHGLSnRP
	VDBpdk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELia-00000008Q0b-00wC;
	Mon, 12 May 2025 05:28:48 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELga-00000008Pq3-2eYi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 05:26:46 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMhEAT023729;
	Mon, 12 May 2025 05:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2at7qq
	hU5esJ06sT8kotxmCJGy7Nu/9DF9wojUpF83c=; b=pz/SPIB/Q1bE/pt0RmGEo/
	D0ljHvI+AKzNroeeljQvGdNz7Os7MTsKtV7kfjG14KdVDCWfIJGUMe2JAA1aS+/q
	s3GmwI3YY/LGdHbHHiQUGtcUOxurDgae/2MA8kkrHdte4KQXjx+FT47FrAkNxosg
	7wkZnSROMmBmcD111r00ELtWj/x+zByS1yohOrr+mmqxfw6ZCoq9MP+jI2EjStuG
	RIa/6NqAa6YgwIaY0FySYKLkm62yttlDt8Pm9kZrc8AMMi9dXnxGAIvQTAPN8a2/
	yPpc8GXkxSMEbW25V7mAw/yJAgOzgarvl4/9cV/dSIugDhd5Hs06tzilCyjUkAdg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42t3wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:26:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54C5QA5f010031;
	Mon, 12 May 2025 05:26:10 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jw42t3w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:26:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C0sLZi003815;
	Mon, 12 May 2025 05:26:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jkbkc8mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:26:09 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C5Q6md42664284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 05:26:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEF5920049;
	Mon, 12 May 2025 05:26:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE62D20040;
	Mon, 12 May 2025 05:26:01 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.219.153])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 May 2025 05:26:01 +0000 (GMT)
Date: Mon, 12 May 2025 10:55:59 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Mykola Lysenko <mykolal@fb.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Greg KH <greg@kroah.com>
Subject: Re: [PATCH] selftests/bpf: Fix bpf selftest build error
Message-ID: <aCGGZ9gApo+QwSMD@linux.ibm.com>
References: <20250509122348.649064-1-skb99@linux.ibm.com>
 <CAADnVQKBQqur68RdwbDVpRuAZE=8Y=_JaTFo-36d_4vr2DNVyw@mail.gmail.com>
 <20250510110455.10c72257@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250510110455.10c72257@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA1MiBTYWx0ZWRfX6PAao8iRodZj UUE+qgT+lDeH8UKRJ35gSDPgj8cT2qCVR0zMG3vXzFs7wbOWXfqo1KcXalLFUHkeeHgzeajIpOu GebwXRqG7xujIrvOsOdZuC/SNUkF6ymr9oYVfV/PYoix3CbHQKbJsH6daJ34BBqMUZnis3x5wRL
 1oZJC2MQD0QnREdB0sCv7PCYqGtAhjNlAzComfyrWzswh9/hUs8xeAtTCIWGFDHh5WKy53utmU0 dDsXXw8SMAioBER2vKDp2ieY77YP7ZQkdU8IuhctfCaMrjqtp06uf0igeX3Gos8dgQwNrLWgbqy Tn6THDeNT2RYjwbu7x2/unKBz4xQH3DwOSOrmTZBhnJOH48ePR6VxAcrEHufqj38yw38XI6GzlW
 g63Psx+CoHdKaktaGTTFq7NvBIkpUJUDGnF8pAfOcIzDbpCRe8MYirZ0Cb0VrqQTVSpYQ+sg
X-Proofpoint-ORIG-GUID: L7wPwis5KOaSpF8fo9uroFggy_iUJ9Cx
X-Authority-Analysis: v=2.4 cv=UqJjN/wB c=1 sm=1 tr=0 ts=68218673 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=jz50gl9ZvO4mUITzFMAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5_qWnCPjlKW_qZJuRAUWEa0sM8S7BpV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_222644_796558_C33D46FD 
X-CRM114-Status: GOOD (  28.03  )
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

On Sat, May 10, 2025 at 11:04:55AM +1000, Stephen Rothwell wrote:
> Hi Alexei,
> 
> On Fri, 9 May 2025 10:04:18 -0700 Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> >
> > On Fri, May 9, 2025 at 5:24 AM Saket Kumar Bhaskar <skb99@linux.ibm.com> wrote:
> > >
> > > On linux-next, build for bpf selftest displays an error due to
> > > mismatch in the expected function signature of bpf_testmod_test_read
> > > and bpf_testmod_test_write.
> > >
> > > Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attribute::read/write()")
> > > changed the required type for struct bin_attribute to const struct bin_attribute.
> > >
> > > To resolve the error, update corresponding signature for the callback.
> > >
> > > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > > Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f6@linux.ibm.com/
> > > Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> > > ---
> > >  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > index 2e54b95ad898..194c442580ee 100644
> > > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > > @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
> > >
> > >  noinline ssize_t
> > >  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> > > -                     struct bin_attribute *bin_attr,
> > > +                     const struct bin_attribute *bin_attr,
> > >                       char *buf, loff_t off, size_t len)  
> > 
> > You didn't even compile it :(
> > 
> > Instead of fixing the build, it breaks the build.
> > 
> > pw-bot: cr
> 
> This patch is only needed in linux-next.  It should be applied to the
> driver-core tree - since that includes commit 97d06802d10a.  It should
> also have a Fixes tag referencing commit 97d06802d10a.
> -- 
> Cheers,
> Stephen Rothwell
Hi Stephen,

Apologies for missing the Fixes tag. Would you like me to resend the patch with the 
Fixes tag included?

Thanks,
Saket

