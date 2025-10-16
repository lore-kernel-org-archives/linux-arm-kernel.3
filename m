Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D85ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JwRWzhFhoMTJD9RViw5wkkq5bFQY8j5C4sl/FaUuA0=; b=XJAanxTUT5xZAOnlpcZJKReEn7
	lQa9bEgaSfB9G+xPHb5erNwkoJAC0SPy0VGXdD6IvGTq+fR9prhFQPEk850OwFUDUcTYaKwaQBHVh
	tgfecOUrMesea8uPbAMOQfsuMO/8DHwLIE4sd1VfhViryDOFju0oGmbwrRXpVlT8DMuuUdSlbqK3r
	4djviYxDKWAxfnatsd6NuMYN82OxbRLNa757c26hof5MbpphjtU46TXvsv5wgr4cbI1nwfmD3rwpP
	ssWj1SVDiadZrC+r/23NESqFz6PCBwwQwfBVs/y9JWOiqVHabaxZc+7VNvrGFPkyPd1q8+kq0FhLW
	EVrVJlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NRB-00000004mgp-43t6;
	Thu, 16 Oct 2025 12:50:35 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NR8-00000004mgP-3cOW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:50:32 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CC355601B357B;
	Thu, 16 Oct 2025 14:47:52 +0200 (CEST)
Message-ID: <906dd11d-26db-4570-840a-e4797748c05c@molgen.mpg.de>
Date: Thu, 16 Oct 2025 14:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][v4] hung_task: Panic when there are more than N hung
 tasks at the same time
To: Li RongQing <lirongqing@baidu.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>, Florian Wesphal <fw@strlen.de>,
 Jakub Kacinski <kuba@kernel.org>, "Jason A . Donenfeld" <jason@zx2c4.com>,
 Joel Granados <joel.granados@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Phil Auld <pauld@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>
References: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251015063615.2632-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_055031_203931_051846BD 
X-CRM114-Status: GOOD (  33.57  )
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

Dear RongQing,


Thank you for the patch. One minor comment regarding the Kconfig 
description.

Am 15.10.25 um 08:36 schrieb lirongqing:
> From: Li RongQing <lirongqing@baidu.com>
> 
> Currently, when 'hung_task_panic' is enabled, the kernel panics
> immediately upon detecting the first hung task. However, some hung
> tasks are transient and allow system recovery, while persistent hangs
> should trigger a panic when accumulating beyond a threshold.
> 
> Extend the 'hung_task_panic' sysctl to accept a threshold value
> specifying the number of hung tasks that must be detected before
> triggering a kernel panic. This provides finer control for environments
> where transient hangs may occur but persistent hangs should be fatal.
> 
> The sysctl now accepts:
> - 0: don't panic (maintains original behavior)
> - 1: panic on first hung task (maintains original behavior)
> - N > 1: panic after N hung tasks are detected in a single scan
> 
> This maintains backward compatibility while providing flexibility for
> different hang scenarios.
> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Florian Wesphal <fw@strlen.de>
> Cc: Jakub Kacinski <kuba@kernel.org>
> Cc: Jason A. Donenfeld <jason@zx2c4.com>
> Cc: Joel Granados <joel.granados@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Liam Howlett <liam.howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
> Cc: "Paul E . McKenney" <paulmck@kernel.org>
> Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> ---
> diff with v3: comments modification, suggested by Lance, Masami, Randy and Petr
> diff with v2: do not add a new sysctl, extend hung_task_panic, suggested by Kees Cook
> 
>   Documentation/admin-guide/kernel-parameters.txt      | 20 +++++++++++++-------
>   Documentation/admin-guide/sysctl/kernel.rst          |  9 +++++----
>   arch/arm/configs/aspeed_g5_defconfig                 |  2 +-
>   kernel/configs/debug.config                          |  2 +-
>   kernel/hung_task.c                                   | 15 ++++++++++-----
>   lib/Kconfig.debug                                    |  9 +++++----
>   tools/testing/selftests/wireguard/qemu/kernel.config |  2 +-
>   7 files changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a51ab46..492f0bc 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1992,14 +1992,20 @@
>   			the added memory block itself do not be affected.
>   
>   	hung_task_panic=
> -			[KNL] Should the hung task detector generate panics.
> -			Format: 0 | 1
> +			[KNL] Number of hung tasks to trigger kernel panic.
> +			Format: <int>
> +
> +			When set to a non-zero value, a kernel panic will be triggered if
> +			the number of detected hung tasks reaches this value.
> +
> +			0: don't panic
> +			1: panic immediately on first hung task
> +			N: panic after N hung tasks are detected in a single scan
>   
> -			A value of 1 instructs the kernel to panic when a
> -			hung task is detected. The default value is controlled
> -			by the CONFIG_BOOTPARAM_HUNG_TASK_PANIC build-time
> -			option. The value selected by this boot parameter can
> -			be changed later by the kernel.hung_task_panic sysctl.
> +			The default value is controlled by the
> +			CONFIG_BOOTPARAM_HUNG_TASK_PANIC build-time option. The value
> +			selected by this boot parameter can be changed later by the
> +			kernel.hung_task_panic sysctl.
>   
>   	hvc_iucv=	[S390]	Number of z/VM IUCV hypervisor console (HVC)
>   				terminal devices. Valid values: 0..8
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index f3ee807..0065a55 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -397,13 +397,14 @@ a hung task is detected.
>   hung_task_panic
>   ===============
>   
> -Controls the kernel's behavior when a hung task is detected.
> +When set to a non-zero value, a kernel panic will be triggered if the
> +number of hung tasks found during a single scan reaches this value.
>   This file shows up if ``CONFIG_DETECT_HUNG_TASK`` is enabled.
>   
> -= =================================================
> += =======================================================
>   0 Continue operation. This is the default behavior.
> -1 Panic immediately.
> -= =================================================
> +N Panic when N hung tasks are found during a single scan.
> += =======================================================
>   
>   
>   hung_task_check_count

[…]

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294..3976c90 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1258,12 +1258,13 @@ config DEFAULT_HUNG_TASK_TIMEOUT
>   	  Keeping the default should be fine in most cases.
>   
>   config BOOTPARAM_HUNG_TASK_PANIC
> -	bool "Panic (Reboot) On Hung Tasks"
> +	int "Number of hung tasks to trigger kernel panic"
>   	depends on DETECT_HUNG_TASK
> +	default 0
>   	help
> -	  Say Y here to enable the kernel to panic on "hung tasks",
> -	  which are bugs that cause the kernel to leave a task stuck
> -	  in uninterruptible "D" state.
> +	  When set to a non-zero value, a kernel panic will be triggered
> +	  if the number of hung tasks found during a single scan reaches
> +	  this value.
>   
>   	  The panic can be used in combination with panic_timeout,
>   	  to cause the system to reboot automatically after a
Why not leave the sentence about the uninterruptible "D" state in there?

Also, it sounds like, some are actually using this in production. Maybe 
it should be moved out of `Kconfig.debug` too?


Kind regards,

Paul

