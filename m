Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjI/1pLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3AEKuRmRMD5kYKRL/svuIaLfmBr+e4xHMBURLY4w1FE=; b=jjI/1pLRVvQcYk
	FvMPqRING5IZ5dW80mFM00f6YOKcrjoM/9qkMnd2ApJMiiU522+oPXj3/kua6to4z0MV8FJB0erNd
	hlwVXFzu3G1RZD2bXWRT53b4l+FDVJ28wrxepTsgPSey4hIswcqj5H5ZJuM6u6I7Vmc/FlP341Yxe
	coLdNadOfKKcyN+2FpzL05si6ggkH/V7M1IwA2pWOgz6IRzmTk/a1C4v2yLElo544ukNK+R/erXEM
	Vvd6ThP+EQImohCC1XlN7iopxrWt485Yijwj2eEhkTBPtEsBrFEbuOGgYNGnsH6207kPT7ovYw7ms
	XyVOwUjRPDgEmxg0DFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqh1-00000005vkp-2IiR;
	Tue, 27 Oct 2026 23:34:59 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqgz-00000005vkZ-1ZBb;
	Tue, 27 Oct 2026 23:34:57 +0000
Message-ID: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
Date: Tue, 27 Oct 2026 16:34:56 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
To: Chris Down <chris@chrisdown.name>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
 Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <cover.1793082868.git.chris@chrisdown.name>
 <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 11:36 PM, Chris Down wrote:
> +static int __init setup_sched_stack_end_check(char *str)
> +{
> +	bool enable;
> +
> +	if (kstrtobool(str, &enable)) {
> +		pr_warn("Unable to parse sched_stack_end_check=\n");
> +		return 0;
> +	}

This error branch should return 1 since it handled the command
line parameter -- it just didn't like the "value."

Returning 0 causes the option string to be added to init's
environment, which is not wanted in this case.

-- 
~Randy


