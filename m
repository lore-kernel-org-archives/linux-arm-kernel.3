Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BF8CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncZwz3sNo308KUWItJhOltAt4oaQ+Dyfb6WfEv6tuTQ=; b=DgWFNvpYVHLsCRaabGOHZCoz7q
	C+BRyteEdaIUeBAOwL3enbHxZRkRhTUB+m02KQ1Mgda7oUy+5MiG4VGGPlk5g1Gwv62xetVkTIp/8
	NYoGrv5olhAs4GF+r7TD6Po7HHPwt/0JagFdMsra7PIvdar49wdHYgpXtQCapGexCToFZB1ZmgZRo
	ErT1ywIiW3UIXgqIvkxneQ9T8S5PgcYAAHt5AveB2/IbxqwQDeOZmQFqaWRK8yezE6RFV8nlKP77G
	mkYV6GOZBqad/mkn/cwb+6tDifWcwDIXaRumsN1ggRJ4FoHO9AqhQfPNZ6wilzot+Uyq2whRSqhU/
	KH+nQh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy3n-0000000Aeru-420b;
	Fri, 12 Jun 2026 09:20:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy3k-0000000Aeqz-0Qki
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:20:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23BF14E42E58;
	Fri, 12 Jun 2026 09:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E708560012;
	Fri, 12 Jun 2026 09:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78C43106C8615;
	Fri, 12 Jun 2026 11:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781256009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ncZwz3sNo308KUWItJhOltAt4oaQ+Dyfb6WfEv6tuTQ=;
	b=NPUVXd/IqoKsy6s7A+fdPRQy6EEOpjPaH8ih3ujTyougrpDUztW7Anv/xDTuCzxcIY/9RD
	imNRzYSlcydkukZ0CZtMQSJjh4uOKTT9VQwQ+p0uRTBmwDnthntHxlHl32ILPKKGwZkk3r
	ETMuGlhnGDZZO/FZwNOc6o5+ckd2bOShZZE6IlcVO6d6tX+ExlAMFHwMYUQQs97g4ojmLi
	Eysj++XJxX6NCM+sF4JDtVWGx2eUxr0jBqhuI4TektmgXGBmvOBt/ipTfE5qC6kdqTkWHL
	FZUzNclbZSDOKLOZI+pgkKWxBXEYysKXgQTpCZfu222VDf81u81G8Gvwaapd3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 11:19:58 +0200
Message-Id: <DJ6YJX01138K.SRJQQJFBY73J@bootlin.com>
Subject: Re: [PATCH bpf-next v2 8/8] selftests/bpf: add tests to validate
 KASAN on JIT programs
Cc: <ebpf@linuxfoundation.org>, <bastien.curutchet@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <martin.lau@kernel.org>,
 <clm@meta.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <bot+bpf-ci@kernel.org>, <alexis.lothore@bootlin.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <john.fastabend@gmail.com>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
In-Reply-To: <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_022016_273582_36CBE0E1 
X-CRM114-Status: UNSURE (   9.74  )
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

On Thu Jun 4, 2026 at 11:45 PM CEST, bot+bpf-ci wrote:

[...]

> The Sashiko AI review on the RFC v1 8/8 posting raised a concern here tha=
t
> does not seem to have been addressed in v2:
>
>   https://lore.kernel.org/bpf/20260425065049.BEC63C2BCB0@smtp.kernel.org
>
> The original question was:
>
>   KASAN operates in single-shot mode by default. After the first subtest
>   triggers a report, will subsequent reports be suppressed, causing the
>   remaining subtests to fail? Also, since BPF CI runs with panic_on_warn=
=3D1,
>   will the first KASAN splat invoke check_panic_on_warn() and immediately
>   panic the CI runner?
>
> KASAN runs in single-shot mode by default. mm/kasan/report.c suppresses
> reports after the first one unless kasan_multi_shot is set.
>
> This loop runs roughly 50 subtests, and each one expects a fresh KASAN
> report emitted via the JIT-inserted __asan_load/__asan_store calls that g=
o
> through kasan_report().
>
> Under default single-shot KASAN, would the subtests after the first one s=
ee
> no report and fail the positive assertions?
>
> Separately, BPF CI runs with panic_on_warn=3D1 (config.ppc64el still sets
> panic_on_warn=3D1). Would the first KASAN splat reach check_panic_on_warn=
()
> and panic the runner?
>
> Nothing in v2 appears to enable kasan_multi_shot or guard against
> panic_on_warn. Was this intended to be handled somewhere?

Hoping to silence this one on the next revision: CI has been updated
separately to enable kasan_multi_shot, and so all subtests in v2
properly triggered the reports individually. The commit is lacking
documentation about this need though.

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


