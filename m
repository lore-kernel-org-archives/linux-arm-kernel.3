Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B480C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYHODzHOPHEJM9bHrQH4mOnRN8s24HVmJ416cR8kp8Y=; b=k5zk7N9/kriV60lKtVN98EvfLV
	9jQz39YlukHVc/wwvEVPf/HcpWw5efeaVGx1GhW3Iafk915xnMG0+V6++inzhF8+on6AzuXjyAL+p
	rgJ87CvW91egHo1P0K8p6brJ1uAVwip/dpC76xbDCS1zYi+1gjeIypHEVpcTAIrk5Ucj1b1EtRx9U
	iotAvTcejFZ27+yrcKNQNdf11T7xaXJL9VsUMgA/q/3J++r5e0XFsMxob4eIw9AbLSEGbqnWyE3FV
	W15DR1Gp2Z3i50O9xVOGc8/1X4sBlU2KX3K1O3QROrGgnHJFceFQn+pRY/pAiOvH30tlR8xpdhCEN
	Jos3xq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIXe-0000000BEg4-2zpH;
	Thu, 03 Jul 2025 11:55:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHLb-0000000B1tS-0htc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:39:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48CFEA537D9;
	Thu,  3 Jul 2025 10:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7234BC4CEF1;
	Thu,  3 Jul 2025 10:39:16 +0000 (UTC)
Date: Thu, 3 Jul 2025 11:39:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Brauner <brauner@kernel.org>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] kselftest/arm64: Add a test for vfork() with GCS
Message-ID: <aGZd0vdu8PpLKfX1@arm.com>
References: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
 <20250610-arm64-gcs-vfork-exit-v2-3-929443dfcf82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-arm64-gcs-vfork-exit-v2-3-929443dfcf82@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_033919_287533_29893441 
X-CRM114-Status: GOOD (  26.46  )
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

On Tue, Jun 10, 2025 at 01:29:46PM +0100, Mark Brown wrote:
> diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
> index 3fb9742342a3..96ea51cf7163 100644
> --- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
> +++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
> @@ -298,6 +298,68 @@ static bool test_fork(void)
>  	return pass;
>  }
>  
> +/* A vfork()ed process can run and exit */
> +static bool test_vfork(void)
> +{
> +	unsigned long child_mode;
> +	int ret, status;
> +	pid_t pid;
> +	bool pass = true;
> +
> +	pid = vfork();
> +	if (pid == -1) {
> +		ksft_print_msg("vfork() failed: %d\n", errno);
> +		pass = false;
> +		goto out;
> +	}
> +	if (pid == 0) {
> +		/* In child, make sure we can call a function, read
> +		 * the GCS pointer and status and then exit */

Nit: coding style for multi-line comment. I guess we follow the kernel
style.

> +		valid_gcs_function();
> +		get_gcspr();
> +
> +		ret = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS,
> +				  &child_mode, 0, 0, 0);
> +		if (ret == 0 && !(child_mode & PR_SHADOW_STACK_ENABLE)) {
> +			ksft_print_msg("GCS not enabled in child\n");
> +			ret = -EINVAL;

Does it make sense in user-space to pass negative values to exit()? I
thought it should be between 0 and 255.

> +		}
> +
> +		exit(ret);

Should this be _exit() instead? IIRC exit() does some clean-ups which
are not safe in the vfork'ed child.

> +	}
> +
> +	/*
> +	 * In parent, check we can still do function calls then block
> +	 * for the child.
> +	 */

The comment "block for the child" doesn't make sense in this context.
vfork() already blocks the parent until exec() or _exit(). But I can see
why you wanted waitpid() to retrieve the return status.

> +	valid_gcs_function();
> +
> +	ksft_print_msg("Waiting for child %d\n", pid);
> +
> +	ret = waitpid(pid, &status, 0);
> +	if (ret == -1) {
> +		ksft_print_msg("Failed to wait for child: %d\n",
> +			       errno);
> +		return false;
> +	}
> +
> +	if (!WIFEXITED(status)) {
> +		ksft_print_msg("Child exited due to signal %d\n",
> +			       WTERMSIG(status));
> +		pass = false;
> +	} else {
> +		if (WEXITSTATUS(status)) {

Nit: } else if {

> +			ksft_print_msg("Child exited with status %d\n",
> +				       WEXITSTATUS(status));
> +			pass = false;
> +		}
> +	}
> +
> +out:
> +
> +	return pass;
> +}
> +
>  typedef bool (*gcs_test)(void);
>  
>  static struct {
> @@ -314,6 +376,7 @@ static struct {
>  	{ "enable_invalid", enable_invalid, true },
>  	{ "map_guarded_stack", map_guarded_stack },
>  	{ "fork", test_fork },
> +	{ "vfork", test_vfork },
>  };
>  
>  int main(void)

Other than the above, feel free add

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thomas, do you want to merge this via your tree? Thanks.

-- 
Catalin

