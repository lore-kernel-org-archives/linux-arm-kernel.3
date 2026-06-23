Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68AFCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=; b=ytYbH12dEQK+jE6i2J5SKEaizm
	MS8QudAo5KyYx5APlA1yYtSlACqRV3xrIssuXtzlYbwohg2rBc7T6vcZo++WspeOObq2s34mU1fhE
	AHbLuSelGwpB9MuO7vSoCqs1cZgj+evaUgWoAs8YpvX6iHQ2CU1UIplZB7qThrzn6Zy+YsUqxfzWK
	9+IROfv/9d3j6LGdDKz4rUaXASVVr/gRxeRth7mZEjNfmdkssKcGj+WU1y5UV3eOz8eg97v156qi4
	TCgXmzdpF7l/j9+QDGseGGYlrfdhm7nK0qAk6wQlXBcPsBklexY7FaNtmQhHPXJGuhAAgRn2Tgttr
	ZCTq//0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw1x-00000005rq8-0iH8;
	Tue, 23 Jun 2026 07:58:49 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw1k-00000005rpD-3yug
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:58:38 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-845369f60faso3163327b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782201516; x=1782806316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=ZRG/pbBJpEzZf4PYI8Ibmujh+75dZt7XqAt9GUsvboy4pPRiENPHISNmiOYQ7e6X0s
         VOFsCc9uYcfYdDb0UsIbg58IOpv6EaEjP+pWgVTL7yZp/fp/Jf41D/Qx+ZLI8qzYmvcV
         kv0yjCoBmcwnUyUFxodKuz4/lJQmZgOgmBaPbtEb4sXTBkxYRUR1nvGXlFlwSUASQ+gf
         l5tauq5GMhYtNmhbQds/QfDBhR2jIGzma4ZXww1eWPIdbsci01uBw1GgOAaFlzuqZZJn
         nFd16Fe7JK4QCzAM0PohTCUbdxbFUyJqfVBmi4zYeMdqZs3A5BZMUGeFohpDA21I7glt
         UaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782201516; x=1782806316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ek6r0TkIKR0tiCQ28suwzM5bkNpctpIQyqr76NBcjWs=;
        b=CfuCHf6IdyyXhHNiICJIV99mNEyc9SH5aUC4ydL/UtjfUkrOBRYDDjGjiyWwLaGgL4
         /dSTl3mo3t3ZlL21ckmsrYEZlyj///wWh8U4K4sdZuMKfpt67aKSLqq5vGYC6GsSnhxO
         rk3IgcddyJfM+qJ3Ppig2RPteJZTbxMCp57oj46covhp+Zw1K1cwsZE0BECDfKHrdFe/
         LJyG+an4jL8yPX1GVBx6MxadIX5K88HzRuHXFOvFneg/P1/o8RNy3QX2suUjpNY1kqEN
         mPt0Mjsuwo2MGQMhPM3gy+a32gJEPazL3htlZR70Q/cmgpaStPP5COX2EBv2RfDJLtYd
         en6A==
X-Forwarded-Encrypted: i=1; AHgh+RprLVrcma2fWwFeW2XN0px/eRUjXWk8qd0XhKCbRUdO+qR8VHr7ZMzOA5zXrZIYjEWse+CX8OQ1a6uxEJgt4nJw@lists.infradead.org
X-Gm-Message-State: AOJu0YxpUqwyMynr8atsJe0r8/+5c8WKazwsmedk+xwgckgThBwH9/Ho
	NKOTNczCkM1neeHFedfh4MLC4KzpCqiDBaWbt3a+UEPrqLQMdRsyr+u/
X-Gm-Gg: AfdE7cllk5IYhFlToDbVSN+Z5L+eRpGKLoFGj2wICPXhfS85YTz+R25HU97bNi8+y0j
	CmJKIMwjZGcDqsT1wba+r4dJe7SXDYyfjIBStddeDtXIh083pXaDRI8mnf4YQVk6pJgC9nvpru+
	QnpTX9LFLfXIqyEkd5BlMFTIkp+hGGeOIB2+vEagNnbMGVjBkEW7ScfdadYqJOCr8OAo9dpbFDu
	iYrv2acGN/dY6saPdDNaYoMu6+NoBtwIlM/kEtnFj8fdcQq2JQRCTt620XH15ohqfA1zb6m+m+5
	ygyoWUDrhGzzypkwZgool0G7XjrrH4xci5ySdLbOpthmfDVVUTPR+08HK1jlleoaLt+w2Bkz0Of
	fb+rMQH296MNMk+7VADcCMbaNHKkohnbApBlryzRi1UzeiLIGTwPdnQ/FpJ+4X+wrR0Wt8KTFgq
	ffv6gt47fWl1FNurPUsCLzMjysiIQvXqdYIbGXCx/G
X-Received: by 2002:a05:6a00:1707:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-84550900333mr19117203b3a.41.1782201515623;
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e745besm9355930b3a.28.2026.06.23.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:58:35 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 15:58:05 +0800
Message-ID: <20260623075805.466317-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
References: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_005836_995182_5C5C4F82 
X-CRM114-Status: GOOD (  15.94  )
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

> On 5/20/26 23:15, Matthew Wilcox wrote:=0D
> > On Thu, May 21, 2026 at 05:14:20AM +0800, Barry Song wrote:=0D
> >> My understanding is that we should not blame applications here. This i=
s 2026:=0D
> >> there are basically only two kinds of applications =E2=80=94 single-th=
readed and=0D
> >> multi-threaded =E2=80=94 and single-threaded applications are nearly e=
xtinct.=0D
> > =0D
> > all of the applications i run are either single threaded or don't fork.=
=0D
> > what multithreaded applications call fork?=0D
>=0D
> Traditionally the problem was random libraries using fork+execve to launc=
h other=0D
> programs ... instead of using alternatives like posix_spwan (some use cas=
es=0D
> require more work done before execve and cannot yet switch to that). I'd =
hope=0D
> that that is less of a problem on Android.=0D
>=0D
> I assume Android zygote might be multi threaded? Maybe sshd as well? Syst=
emd?=0D
> But I'd be surprised if there are really performance implications.=0D
>=0D
> Not sure about webbroswers .... I think most of them switched to fork ser=
vers,=0D
> where I would assume fork servers would be single-threaded.=0D
>=0D
> So, yeah, getting a clear understanding how this ends up being a problem =
on=0D
> Android would be great.=0D
=0D
Barry asked me to share observations on fork() usage across Android=0D
applications.=0D
=0D
I wrote a BPF-based tracing tool (kprobe on copy_process, checking=0D
CLONE_VM to distinguish process creation from thread creation) and ran=0D
it against the top 200 Android applications in the China market during=0D
normal usage scenarios.=0D
=0D
Results:=0D
- 82 out of 200 apps (41%) call fork() during normal operation=0D
- Among these, some call fork() from multiple threads=0D
=0D
These are not zygote forks =E2=80=94 they are fork() calls initiated by app=
=0D
threads at runtime. Examples by category:=0D
=0D
  Browsers:     com.quark.browser, com.UCMobile, com.xunlei.browser=0D
  Shopping:     com.taobao.taobao, com.tmall.wireless, com.achievo.vipshop=
=0D
  Video:        com.youku.phone, com.qiyi.video, com.hunantv.imgo.activity=
=0D
  Social/IM:    com.alibaba.android.rimet, com.ss.android.lark=0D
  News:         com.ss.android.article.news, com.ss.android.article.lite=0D
  Navigation:   com.autonavi.minimap, com.sdu.didi.psnger=0D
  Finance:      com.eg.android.AlipayGphone, com.chinamworld.main=0D
=0D
This confirms that fork() is widely used in real-world multi-threaded=0D
Android applications. Since dup_mmap() needs to acquire=0D
vma_start_write() for every VMA, holding the VMA lock across I/O=0D
would risk blocking fork() for unpredictable durations in these 82=0D
applications.=0D
=0D
Tracing tool (two equivalent implementations):=0D
  bpftrace:         https://gist.github.com/zhr250/bf4384202d598bb4cda71cb9=
902f15ab=0D
  libbpf-bootstrap: https://gist.github.com/zhr250/76189bdf51bdc8818500e4c8=
917c6493=0D
=0D
Analysis results (top 200 apps):=0D
  https://gist.github.com/zhr250/06f51092c84a49c602a55ac3d186e9ce=0D
=0D
Hongru=0D
=0D

