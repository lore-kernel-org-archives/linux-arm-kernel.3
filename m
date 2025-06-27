Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D70C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG4dYx7QJxfgMduBL3omeAzzbFvCN7A/t3Yx1jj+xyg=; b=5B59y6ZPd0XglgfB0JthK7Iw+B
	FAcDXaHhQDgnrMpm5I3B2qOA+/ylmwvVhUA6e0BQdMruFCRbHS/YZ2mcvgW8hjA/mvUR3fUQttkwf
	eDjFTT+UBWIS1Z/XgwywUrJiTZzPQE/a60zn/StvDb94IL6bmWPW6EVlE7SfEXIDEgmYtAt2i4i+k
	4lEtzyIiVYe1jUWzExYyWAIo+NSkTQVv7qheLI+QJYa8tXwO65gCYbMHU+4t+j46kacfdbQIW5d4F
	uZN9UHOulqoy9tA/OYYIJDVXkP1BDwdxy6SC3tJxHmsCGi5O3PoYwxAljUCSWRZ1EX6CWVTNs/gdK
	J1qcKHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEde-0000000Fccf-0Bp1;
	Fri, 27 Jun 2025 19:21:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDKS-0000000FSiy-35oW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 951701655;
	Fri, 27 Jun 2025 10:57:18 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10163F58B;
	Fri, 27 Jun 2025 10:57:33 -0700 (PDT)
Message-ID: <39117e6a-ebb6-4c92-a19c-2033c4e590cd@arm.com>
Date: Fri, 27 Jun 2025 18:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: reduce stack usage in arm_cmn_probe()
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20250620115149.132845-1-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250620115149.132845-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_105736_817762_996A6D19 
X-CRM114-Status: GOOD (  25.82  )
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

On 20/06/2025 12:51 pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This function has a rather large stack usage, which triggers the
> warning limit with clang if I reduce the default to 1280 bytes:
> 
> drivers/perf/arm-cmn.c:2541:12: error: stack frame size (1312) exceeds limit (1280) in 'arm_cmn_probe' [-Werror,-Wframe-larger-than]
> 
> This is a combination of two problems:
> 
>   - The arm_cmn_discover() function has some large local variables and
>     gets inlined here by clang (but not gcc)
> 
>   - The (struct pmu) assignment adds an extra copy of the pmu structure
>     on the stack and does a memcpy() from that
> 
> Address the first one here by marking arm_cmn_discover() as noinline_for_stack,
> making clang behave more like gcc here. This gets it under the warning
> limit, though the total stack usage does not actually get reduced.

At that point, though, it seems like we may as well just disable the 
warning :/

Fortunately it's not actually that hard to improve matters here, so I've 
just sent that patch:

https://lore.kernel.org/r/e7dd41bf0f1b098e2e4b01ef91318a4b272abff8.1751046159.git.robin.murphy@arm.com/T/#u

> It would be nice to also change the way struct pmu is initialized, but I
> see that this is done consistently for all pmu drivers. Ideally the function
> pointers should be moved into a 'static const' structure per driver as this
> is done in most other subsystems.

Beware that perf_pmu_register() does some further dynamic assignment of 
callbacks based on what the driver provided, so it's not necessarily 
straightforward to change in struct pmu itself. However, FWIW I have 
recently been playing with some ideas for reducing the amount of PMU 
registration boilerplate, and indeed one of them is to have a 
driver-level static template passed to a registration helper, which 
would at least make it easy to avoid the full by-value copies everywhere.

Thanks,
Robin.

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/perf/arm-cmn.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 031d45d0fe3d..430c89760391 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2243,7 +2243,8 @@ static enum cmn_node_type arm_cmn_subtype(enum cmn_node_type type)
>   	}
>   }
>   
> -static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
> +static noinline_for_stack int arm_cmn_discover(struct arm_cmn *cmn,
> +					       unsigned int rgn_offset)
>   {
>   	void __iomem *cfg_region;
>   	struct arm_cmn_node cfg, *dn;

