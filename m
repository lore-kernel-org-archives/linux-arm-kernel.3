Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BJzlneM+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Li7rfahO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+0OsAHylFzDUlbd5p5ZlaNpNPdERBBYFM+tKrSywm2M=; b=BJzlneM+PCStuCiR6dIH77fWDx
	d41t860+xcLDntQw/KZWeY1RPHr/eEXmqXYb2dlnTNYQTopX4MIc22RUdWJ8w6XATCYxvK4jsPk+u
	+JQWhiqEMW7Qv0JysL9J0XjYqqZeiWpQ+NVfa/FkgEN2EJGnSBhI+EMMJ7yYXbXbydO5auhDpn4Gu
	1qbmeP6YnQXdkFesPNABC1xfFn5umkUVXAmoLcwWsXuD50lzCFrcqvwW0hNOIm2nVKIEf4tUOE4+X
	1EgtPX5BnHPMk0DWWuibix3p17x2irQN1X+QqIHuB8QzQkWqua9LXQ+DyBYPaDTYpbnTAq7p8pPl4
	xh0cJS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWnh-0000000AJvd-1MXQ;
	Thu, 29 Oct 2026 20:32:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMWnd-0000000AJvD-4AxO;
	Thu, 29 Oct 2026 20:32:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88DDC15A1;
	Thu, 29 Oct 2026 13:32:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2213F673;
	Thu, 29 Oct 2026 13:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793305955; bh=2WuktTPKKDQ3u4/hHWpfo2hpVmbUd7vtqE9LCZohGME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Li7rfahOEUIhxJmzoArHCiIA1dylePw/t0GV2JJyyUzIad+MbSCPSWUdetPKIJBPc
	 qlTbPHjL1rAg02sPWWBZ636MuKumFSBDG4q6ghmrDGFmpUtg6deKyAnazMxC1Rhow6
	 ActmiJn2WiK3ZZlsN5n5RLb1Ho/RsilrbfagWnSM=
Date: Thu, 29 Oct 2026 20:32:30 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Message-ID: <auOtXvGD1RHsU-dy@arm.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
 <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_133238_287260_786E0DB0 
X-CRM114-Status: GOOD (  12.00  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:43:12PM -0300, Iván Ezequiel Rodriguez wrote:
> copy_thread() can map a CLONE_VM GCS and still return 0. A later
> copy_process() failure calls exit_thread(), but arm64 did not
> implement it, so the VMA stayed in the parent's mm. Wire
> HAVE_EXIT_THREAD to gcs_free().
> 
> x86 already does this via exit_thread() -> shstk_free(). The separate
> x86 TLS leak is different: copy_thread() itself fails after the
> alloc, so copy_process() skips exit_thread().

Is the x86 TLS leak relevant to arm64?

[...]

> @@ -503,6 +517,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  
>  		p->thread.cpu_context.x19 = (unsigned long)args->fn;
>  		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
> +		/* No user GCS alloc here; drop inherited tracking for CLONE_VM. */
> +		gcs_reset_thread(p);

My LLM run noticed that this fixes another problem, unrelated to the
failed fork: io_uring and vhost workers are created with args->fn and
CLONE_VM and they inherit gcs_base/gcs_size from the creating task
through arch_dup_task_struct(). Without this reset, a worker exiting
normally unmaps the parent task's GCS.

I was wondering whether to have a separate one-line commit for the
worker thread case but I think I'll just add a comment in the commit
log, keep things simple.

-- 
Catalin

