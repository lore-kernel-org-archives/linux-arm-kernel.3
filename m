Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA606D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySy25yEF1QePV2PXsDPvovvaxSjHhUOK5RABr0FMdbc=; b=2IRIv6mkioOcd7K0a4nev3kAjg
	HRU6x+IciddvZaBnomPRAUQqiaR7A8d3WLv48O3pBMuFKWetSQwWoAxRGrgBr0+4+fhvz9v3t/RND
	HGndr/qjLd+QegswpyqHRWmKcoz70pkz0MJb7nTCNltJ5q0eN9pUCV3s2B/ejGH8JKLs6FIEuLAOa
	TFaGg1ErsbhPLHp+onD0rSl5bao0hrnq2P88oJWwNNDPTa9uRtsz0n00A2/h/eOGD/dTmHfPl3SyL
	7DeOLgxpXCk41svoGFuYs3f2ku7ZQSZhDlVjJrVcdYfpe4Pb7WDs0eQpS5RzBZCkG5GoDX7KlYAT6
	NGZMjqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q8H-0000000FHpB-2H2Q;
	Tue, 29 Oct 2024 17:35:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oRG-0000000Ezm8-29IU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:47:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E631497;
	Tue, 29 Oct 2024 08:47:51 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D1E93F73B;
	Tue, 29 Oct 2024 08:47:20 -0700 (PDT)
Date: Tue, 29 Oct 2024 15:47:18 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Lower poll interval while waiting
 for fp-stress children
Message-ID: <ZyEDhuX3dDPxJ8a-@J2N7QTR9R3.cambridge.arm.com>
References: <20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org>
 <20241029-arm64-fp-stress-interval-v1-2-db540abf6dd5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029-arm64-fp-stress-interval-v1-2-db540abf6dd5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_084722_913786_38EA0330 
X-CRM114-Status: GOOD (  19.55  )
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

Nit: the title says we lower the poll interval, while we actually raise
it. Maybe that'd be clearer as:

	kselftest/arm64: Raise poll timeout while waiting for fp-stress children

... or:

	kselftest/arm64: Poll less frequently while waiting for fp-stress children

That aside, this looks fine.

Mark.

On Tue, Oct 29, 2024 at 12:10:40AM +0000, Mark Brown wrote:
> While fp-stress is waiting for children to start it doesn't send any
> signals to them so there is no need for it to have as short an epoll()
> timeout as it does when the children are all running. We do still want to
> have some timeout so that we can log diagnostics about missing children but
> this can be relatively large. On emulated platforms the overhead of running
> the supervisor process is quite high, especially during the process of
> execing the test binaries.
> 
> Implement a longer epoll() timeout during the setup phase, using a 5s
> timeout while waiting for children and switching  to the signal raise
> interval when all the children are started and we start sending signals.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/fp-stress.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
> index c986c68fbcacdd295f4db57277075209193cb943..963e2d891ced72fb8d6eff4fdb5c7df0724b14f1 100644
> --- a/tools/testing/selftests/arm64/fp/fp-stress.c
> +++ b/tools/testing/selftests/arm64/fp/fp-stress.c
> @@ -453,6 +453,7 @@ int main(int argc, char **argv)
>  {
>  	int ret;
>  	int timeout = 10 * (1000 / SIGNAL_INTERVAL_MS);
> +	int poll_interval = 5000;
>  	int cpus, i, j, c;
>  	int sve_vl_count, sme_vl_count;
>  	bool all_children_started = false;
> @@ -588,7 +589,7 @@ int main(int argc, char **argv)
>  		 * especially useful in emulation where we will both
>  		 * be slow and likely to have a large set of VLs.
>  		 */
> -		ret = epoll_wait(epoll_fd, evs, tests, SIGNAL_INTERVAL_MS);
> +		ret = epoll_wait(epoll_fd, evs, tests, poll_interval);
>  		if (ret < 0) {
>  			if (errno == EINTR)
>  				continue;
> @@ -626,6 +627,7 @@ int main(int argc, char **argv)
>  			}
>  
>  			all_children_started = true;
> +			poll_interval = SIGNAL_INTERVAL_MS;
>  		}
>  
>  		if ((timeout % LOG_INTERVALS) == 0)
> 
> -- 
> 2.39.2
> 

