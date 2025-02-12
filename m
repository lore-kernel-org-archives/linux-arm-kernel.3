Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA1C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g64+bAu6IO9b+R8khvsANq0+6GQirg6dDpJG7gTDt8=; b=g7bUGdZfeyRT3GBWY+ytFusd4H
	1Yrc85DO8BduJqN3AC64WaMKR3x7pOzzTM1BQOeLORYCpvkVbQRQYD70C3AwgMo3m4AA+9FKUgQMf
	E2538gs7putNgsVwgVqELj/HlRueRexjxai39Xw0z8bX/p/fKd5eazs6qVWHsP0FudOIXfMcSWNXM
	aW1OeSzmC9BPnNUS8mAWBX/VPUOF8izZeOfiL/zB1sW7pHdKxYHrnRtQB03g7tZOyFfjpLgC4l8DP
	lIzEMDGyPfzqvPWXGalIPY3t0BzEl0QcIUlvYm7t019z4HtKb3NkmCK9twOPsb0SePqjB/qoH8V/K
	BOvQfgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0QU-00000005fp6-0sDR;
	Wed, 12 Feb 2025 00:16:26 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0P5-00000005fcN-0vYo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:15:00 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa8ada664fso3769552a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739319298; x=1739924098; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0g64+bAu6IO9b+R8khvsANq0+6GQirg6dDpJG7gTDt8=;
        b=Jp0BxFYbvgrbvlEq0LJRab8e23i5IRDkCCMAhQFxrJqNQ4BwUFYEjse2pXUuf0alH9
         TOsf88W009HRuQiVGVKuhhindG0bGsDSsHFNwwBpdeK1ltNLAihp93UUmp57WLMA8XTO
         ssnUk0dwuQMqAVAy425H4dNsFYNEp8SbPvsAhl1yOeDvMiOkGzoS1iwbYQMh9ieOIdWR
         r648FDXiPVykReg/BCm00T42vAgdjBBYlUAxAEJZvC0CZsjuMPuPdvHzvwKXdcsC0W1p
         XHbksCiDnOFuTvq2ecRu7vecrvDnvIPVb1xaQAQbnxY4gz5nDFo+9hcaKydcubi02w+B
         HlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319298; x=1739924098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0g64+bAu6IO9b+R8khvsANq0+6GQirg6dDpJG7gTDt8=;
        b=Rt0Y95tASKx85T7NiqeyseLwIf+sggGeEyyPVyOFukldWcGgOBa2TZTuOTm6OBLFg3
         TVs0iApbU1rbFulBNHCMp+Mzp487HDWFa+QlTRuy63LyYbR+ouh9OWHwmGQ6vkDwOGY8
         C7AHPyLI1XUmHPECHW22jL/sNcUi3/X8f/8kL2YBb7J7TzupRo/7VH3NyOUJL/QQpylm
         oL6z2onFWY4xM94vKyOvdJ+9Uyno4ZHh9ePUQTXYHqMjq/1U8KFkaiNRDl092o4gLi+c
         51aI6Ho/geNkNxnF47n4tdyXPyZ64VewJUyWuKVduAx5Gw+vpFahcJE5zQx0nd9G7lHa
         yiMg==
X-Forwarded-Encrypted: i=1; AJvYcCU4dfXiJMUW/yBUlZAwTCAemIeVGaNLQ5kiopTwFlU8K/PN3eULYhrIEpItEunUIr1Vnfl/Kddnt/lkJU4pCAM+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp2ZnZw90rZU9mV6RcLv2yQF54TyRhljZhvP28KDoz7kgyEHvj
	8rlrq4u1QpKCBfX3jlKdHqUfuN1LmYwa3CnhN8NcqdbYwKqChjw/
X-Gm-Gg: ASbGncuxynTkecMBDYIwHbndOpUTkRGwc/3rFxM4nV6osev3CudTgzzevHkWO2lvAKz
	GV3oRCCBWmFhVyQOylM8rRpAISXdwFzg+5dlj9R5oUx+SSXAPtedhS70U8On8zfZa3i8wj5zTPz
	mtZy96BGyhyHBa2JOaRLvNPH9bvYANkvzYdquetqUkl0dmABTUEylTboNPQitIVSnjC6exqH5R9
	XuMmMkk11wc6b94OCWe87U95JtMEJWJwFemmQMv1tfaWRYIvTZckwLNW7yL0BkHUZkasfJ0G13h
	WBsBPveDAA5x
X-Google-Smtp-Source: AGHT+IGsXIH+f84KqAToP99Sh3SeIBndc/AQvegIuSnt+d3ClLLtcoD2z4mAFZARz+V06Rh95tBDlw==
X-Received: by 2002:a17:90b:2f0f:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-2fbf5c0d99bmr1935952a91.14.1739319298382;
        Tue, 11 Feb 2025 16:14:58 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b7b20sm176187a91.17.2025.02.11.16.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:14:57 -0800 (PST)
Message-ID: <40cb834c2e034dc991a6b0c8140608dcd2e9e5fb.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 26/26] selftests/bpf: Add tests for
 rqspinlock
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra	
 <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long	
 <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko	
 <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai
 Lau	 <martin.lau@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Tejun Heo	 <tj@kernel.org>, Barret Rhoden <brho@google.com>, Josh Don
 <joshdon@google.com>,  Dohyun Kim <dohyunkim@google.com>,
 linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Date: Tue, 11 Feb 2025 16:14:52 -0800
In-Reply-To: <20250206105435.2159977-27-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
	 <20250206105435.2159977-27-memxor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_161459_251442_DF6AB5FE 
X-CRM114-Status: UNSURE (   9.36  )
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

On Thu, 2025-02-06 at 02:54 -0800, Kumar Kartikeya Dwivedi wrote:

[...]

> +void test_res_spin_lock(void)
> +{
> +	if (test__start_subtest("res_spin_lock_success"))
> +		test_res_spin_lock_success();
> +	if (test__start_subtest("res_spin_lock_failure"))
> +		test_res_spin_lock_failure();
> +}

Such organization makes it impossible to select sub-tests from
res_spin_lock_failure using ./test_progs -t.
I suggest doing something like below:

	@@ -6,7 +6,7 @@
	 #include "res_spin_lock.skel.h"
	 #include "res_spin_lock_fail.skel.h"

	-static void test_res_spin_lock_failure(void)
	+void test_res_spin_lock_failure(void)
	 {
	        RUN_TESTS(res_spin_lock_fail);
	 }
	@@ -30,7 +30,7 @@ static void *spin_lock_thread(void *arg)
	        pthread_exit(arg);
	 }

	-static void test_res_spin_lock_success(void)
	+void test_res_spin_lock_success(void)
	 {
	        LIBBPF_OPTS(bpf_test_run_opts, topts,
	                .data_in =3D &pkt_v4,
	@@ -89,11 +89,3 @@ static void test_res_spin_lock_success(void)
	        res_spin_lock__destroy(skel);
	        return;
	 }
	-
	-void test_res_spin_lock(void)
	-{
	-       if (test__start_subtest("res_spin_lock_success"))
	-               test_res_spin_lock_success();
	-       if (test__start_subtest("res_spin_lock_failure"))
	-               test_res_spin_lock_failure();
	-}

[...]


