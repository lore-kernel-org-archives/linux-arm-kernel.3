Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497EC1098784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOWcRclLeg2eJ1Hpe317xk8QQxrfG1XmiCxiWpunLak=; b=WP55rTaKiptrnovNwQJ5MnMXjV
	c3HrMp5o/ZJ77t6RhJkkwp4K6pXI6NFurKpO7EEr+YKTNixyKt4Ma8chrJ30fl7jSAlhWD9aT7xi5
	TYpDG0zQamH9c/pCi1yvSFKnrDkeZBe6ehsc2E+Al05ygreWPFDvNhSfytGftNvzzWXpDF6qc0hDj
	QT9MIGuF88Uoi9kxx4Wf6K37oNS5Xai0YwRt0GoeSwf8HdIyt9JloIIQ4t5fSS4MgYOWXL3y2rC40
	utWcuWelBsV1OGuqj1vuKSuyVB/qLyGOSNhufUTGqg/s7tAa5+vuE1iiEU84YnnBIFMlicAqX/8Gt
	70bYX+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a6E-0000000CrzH-2fkG;
	Fri, 20 Mar 2026 13:41:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3a6C-0000000Cryd-2Qcc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:41:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1439443E1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0B5C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774014071;
	bh=4cQ77l3jUUu/0NTgxuBkklNb6Y2mFPOzQNvBYvPzuUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ww44zBT8YZ32c5W/sr0XJLW1VRxTvZHMiL/3oSaZdEm53jx6FFoIRcyE/YmJSKuhY
	 vUpfMsZpnblONjDHF6wQCNtH7jHTt90/TYH4TOHcTZy6TRCTCXXmMA0XTGN38NRNyi
	 cg8yjzjdr3yrFaHnbJNlH8rLx6ejfEz7mB/MJ/eLuDr156jeE0YJ+NGSj1O7upmW9M
	 KrAvcUh0+Db+QXarBipd8Sn8vTKBkE5lTxgv+EaJ81rY8x5nUnhF2WCiedOKJEGu2f
	 ROw2opoBPCWT9eOuWyJILlE0s5KZWlUnCGsOm4ot1lCFLAYcqqYugTNCHXEGyR6bvg
	 jKNINJOE8MSdQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a2ee65171so5918067b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 06:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrM4LgwgD5cki4difZEjVsApW9iojwo5cXaIlzEIK9f0yO1AweHjkZs0hxu7tNIm12+K47L9uPQwx9jTarFboy@lists.infradead.org
X-Gm-Message-State: AOJu0YzACaWUcFQESS4T2yUUmTLdnAknJDdSBfXEq2y6JpI8TOC7f0Ud
	D8zpAR2X+Qm9nmI6PKWGpnzq6NOgcPwRfrXOCPkbr/AitBQGotH3DpTQ6oZpBkTiGsQKRldt9+g
	XvauBwhAbPfjKijkBePk2lDvKlu/Ks/A=
X-Received: by 2002:a05:690c:4992:b0:79a:9308:956d with SMTP id
 00721157ae682-79a93089ad2mr24134867b3.42.1774014070583; Fri, 20 Mar 2026
 06:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260320104222.1381274-1-ruanjinjie@huawei.com> <20260320104222.1381274-5-ruanjinjie@huawei.com>
In-Reply-To: <20260320104222.1381274-5-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:40:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLnGb261e-OBSM0Cq1WeqreC0_mhwr2Drs=jxTA_BPdZJA@mail.gmail.com>
X-Gm-Features: AaiRm53_RKos6cVTpDm6VjWzuRZcscDfdc9HHkMQundtQ2MYdyZbCDI6tg8vY8E
Message-ID: <CAD++jLnGb261e-OBSM0Cq1WeqreC0_mhwr2Drs=jxTA_BPdZJA@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] selftests: sud_test: Support aarch64
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	oleg@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, arnd@arndb.de, shuah@kernel.org, 
	kevin.brodsky@arm.com, yeoreum.yun@arm.com, anshuman.khandual@arm.com, 
	thuth@redhat.com, ryan.roberts@arm.com, mark.rutland@arm.com, song@kernel.org, 
	ziyao@disroot.org, schuster.simon@siemens-energy.com, jremus@linux.ibm.com, 
	akpm@linux-foundation.org, mathieu.desnoyers@efficios.com, kmal@cock.li, 
	dvyukov@google.com, reddybalavignesh9979@gmail.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_064112_653650_E74DE37E 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 20, 2026 at 11:41=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> From: kemal <kmal@cock.li>
>
> Support aarch64 to test "Syscall User Dispatch" feature with
> sud_test selftest testcase.
>
> On qemu-kvm machine, the sud_benchmark test results are as below:
>
>         # ./sud_benchmark
>         Calibrating test set to last ~5 seconds...
>         test iterations =3D 24500000
>         Avg syscall time 208ns.
>         Enabling syscall trapping.
>         Caught sys_1c2
>         trapped_call_count 1, native_call_count 0.
>         Avg syscall time 213ns.
>         Interception overhead: 2.5% (+5ns).
>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: kemal <kmal@cock.li>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

