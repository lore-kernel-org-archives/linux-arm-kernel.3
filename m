Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3689AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 00:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKGQ4yLyaYIGymUaWOGm4L19nkiVIIVGXA9TVH28E5I=; b=Kr03Q2txHuBkF/HtuTjqFBDI8z
	wYSJllKGWH9iqoJsznY9hyTPG5XH19VkIf/0YSlC50QdcwdBxvE3gCIc6J//I3JRwaeXnnRY3Udk1
	Oa+Pu/lWKaT4FyJGu3bIQ9NY196HW1h9NiYxbf7lCjggABwRjFQ+G6ik1llD5Z6vk3bDyTRlLLHui
	fL1sWvzycqTjc3o256ipvimSZG7ZPqf7o5ohTP1EafWBVPwUMlI+DqZCQjz7wxqpGsXUwjHpjYjI8
	6KNu1vx++2Ae98+VDiztvuYz6A2XwL0Ciw9yV80NccxsZSmuqnV136CwamScuhMphS70nu0JNCMTe
	rIprp9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCqu-00000008wEz-0sJG;
	Thu, 17 Jul 2025 00:52:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucCoR-00000008vkO-0nuR;
	Thu, 17 Jul 2025 00:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 063165C5622;
	Thu, 17 Jul 2025 00:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8056EC4CEE7;
	Thu, 17 Jul 2025 00:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752713365;
	bh=1zat0F1s/18Hl6/2ocHtQ1upOvrSzchh54HCKQD1zsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YQYt3CjoWNF2bDAB44JG5w2JJflDqqQz74m572lHFomyUTVpDmTlrUeL+MWRaX1H8
	 GsaRykzAiCXYLodeAK/Y9DOy4kQg6jRYq0zLZVjsuKv9PFCCaDBnuFL9RaLloL2pT4
	 rqKLHFRH8p8OKLb1L1gbdpnfAWFpD6noelYK0i6/ciViVXEVwFERdj5finzMDpIwJ7
	 BzfM/RuuVYps9E717LmpZZbg4zWklYG7LS7JA5n2PVj9deMQe73gUDZMESo5FURONO
	 bbr97v7aVRzUe9NIgXrZPpALddz4opx7GVFOYQVI40wKvAJ4pyH20sQKair4vMk5/Z
	 g9CigBDtFZzdQ==
Date: Wed, 16 Jul 2025 17:49:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ard Biesheuvel <ardb+git@google.com>
cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    Feng Tang <feng.tang@linux.alibaba.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Sunil V L <sunilvl@ventanamicro.com>, Bibo Mao <maobibo@loongson.cn>, 
    linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
    xen-devel@lists.xenproject.org, x86@kernel.org, 
    linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] efi: Remove support for pointless, unused EFI
 services
In-Reply-To: <20250714060843.4029171-8-ardb+git@google.com>
Message-ID: <alpine.DEB.2.22.394.2507161749090.15546@ubuntu-linux-20-04-desktop>
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-8-ardb+git@google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_174927_321817_E7C30A0E 
X-CRM114-Status: GOOD (  19.36  )
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

On Mon, 14 Jul 2025, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The get/set wakeup time EFI runtime services are often broken, and
> rarely if ever used in practice. But the GetNextHighMonoCount() EFI
> runtime services really takes the cake for most pointless API in the
> history of computing.
> 
> So let's stop exposing them in Linux, hopefully removing the urge some
> folks seem to feel to test these APIs, and send emails around when they
> don't work.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

For drivers/xen/efi.c:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/x86/platform/efi/efi_64.c          | 22 -------
>  drivers/firmware/efi/runtime-wrappers.c | 68 --------------------
>  drivers/xen/efi.c                       | 56 ----------------
>  include/linux/efi.h                     |  6 --
>  4 files changed, 152 deletions(-)
> 
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index e7e8f77f77f8..0207937ab39d 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -540,19 +540,6 @@ static efi_status_t efi_thunk_set_time(efi_time_t *tm)
>  	return EFI_UNSUPPORTED;
>  }
>  
> -static efi_status_t
> -efi_thunk_get_wakeup_time(efi_bool_t *enabled, efi_bool_t *pending,
> -			  efi_time_t *tm)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
> -static efi_status_t
> -efi_thunk_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
>  static unsigned long efi_name_size(efi_char16_t *name)
>  {
>  	return ucs2_strsize(name, EFI_VAR_NAME_LEN) + 1;
> @@ -681,12 +668,6 @@ efi_thunk_get_next_variable(unsigned long *name_size,
>  	return status;
>  }
>  
> -static efi_status_t
> -efi_thunk_get_next_high_mono_count(u32 *count)
> -{
> -	return EFI_UNSUPPORTED;
> -}
> -
>  static void
>  efi_thunk_reset_system(int reset_type, efi_status_t status,
>  		       unsigned long data_size, efi_char16_t *data)
> @@ -788,13 +769,10 @@ void __init efi_thunk_runtime_setup(void)
>  
>  	efi.get_time = efi_thunk_get_time;
>  	efi.set_time = efi_thunk_set_time;
> -	efi.get_wakeup_time = efi_thunk_get_wakeup_time;
> -	efi.set_wakeup_time = efi_thunk_set_wakeup_time;
>  	efi.get_variable = efi_thunk_get_variable;
>  	efi.get_next_variable = efi_thunk_get_next_variable;
>  	efi.set_variable = efi_thunk_set_variable;
>  	efi.set_variable_nonblocking = efi_thunk_set_variable_nonblocking;
> -	efi.get_next_high_mono_count = efi_thunk_get_next_high_mono_count;
>  	efi.reset_system = efi_thunk_reset_system;
>  	efi.query_variable_info = efi_thunk_query_variable_info;
>  	efi.query_variable_info_nonblocking = efi_thunk_query_variable_info_nonblocking;
> diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
> index 708b777857d3..2b66efb5ffef 100644
> --- a/drivers/firmware/efi/runtime-wrappers.c
> +++ b/drivers/firmware/efi/runtime-wrappers.c
> @@ -52,17 +52,6 @@ union efi_rts_args {
>  		efi_time_t	*time;
>  	} SET_TIME;
>  
> -	struct {
> -		efi_bool_t	*enabled;
> -		efi_bool_t	*pending;
> -		efi_time_t	*time;
> -	} GET_WAKEUP_TIME;
> -
> -	struct {
> -		efi_bool_t	enable;
> -		efi_time_t	*time;
> -	} SET_WAKEUP_TIME;
> -
>  	struct {
>  		efi_char16_t	*name;
>  		efi_guid_t	*vendor;
> @@ -92,10 +81,6 @@ union efi_rts_args {
>  		u64		*max_variable_size;
>  	} QUERY_VARIABLE_INFO;
>  
> -	struct {
> -		u32		*high_count;
> -	} GET_NEXT_HIGH_MONO_COUNT;
> -
>  	struct {
>  		efi_capsule_header_t **capsules;
>  		unsigned long	count;
> @@ -232,17 +217,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
>  		status = efi_call_virt(set_time,
>  				       args->SET_TIME.time);
>  		break;
> -	case EFI_GET_WAKEUP_TIME:
> -		status = efi_call_virt(get_wakeup_time,
> -				       args->GET_WAKEUP_TIME.enabled,
> -				       args->GET_WAKEUP_TIME.pending,
> -				       args->GET_WAKEUP_TIME.time);
> -		break;
> -	case EFI_SET_WAKEUP_TIME:
> -		status = efi_call_virt(set_wakeup_time,
> -				       args->SET_WAKEUP_TIME.enable,
> -				       args->SET_WAKEUP_TIME.time);
> -		break;
>  	case EFI_GET_VARIABLE:
>  		status = efi_call_virt(get_variable,
>  				       args->GET_VARIABLE.name,
> @@ -272,10 +246,6 @@ static void __nocfi efi_call_rts(struct work_struct *work)
>  				       args->QUERY_VARIABLE_INFO.remaining_space,
>  				       args->QUERY_VARIABLE_INFO.max_variable_size);
>  		break;
> -	case EFI_GET_NEXT_HIGH_MONO_COUNT:
> -		status = efi_call_virt(get_next_high_mono_count,
> -				       args->GET_NEXT_HIGH_MONO_COUNT.high_count);
> -		break;
>  	case EFI_UPDATE_CAPSULE:
>  		status = efi_call_virt(update_capsule,
>  				       args->UPDATE_CAPSULE.capsules,
> @@ -366,30 +336,6 @@ static efi_status_t virt_efi_set_time(efi_time_t *tm)
>  	return status;
>  }
>  
> -static efi_status_t virt_efi_get_wakeup_time(efi_bool_t *enabled,
> -					     efi_bool_t *pending,
> -					     efi_time_t *tm)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(GET_WAKEUP_TIME, enabled, pending, tm);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
> -static efi_status_t virt_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(SET_WAKEUP_TIME, enabled, tm);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
>  static efi_status_t virt_efi_get_variable(efi_char16_t *name,
>  					  efi_guid_t *vendor,
>  					  u32 *attr,
> @@ -488,17 +434,6 @@ virt_efi_query_variable_info_nb(u32 attr, u64 *storage_space,
>  	return status;
>  }
>  
> -static efi_status_t virt_efi_get_next_high_mono_count(u32 *count)
> -{
> -	efi_status_t status;
> -
> -	if (down_interruptible(&efi_runtime_lock))
> -		return EFI_ABORTED;
> -	status = efi_queue_work(GET_NEXT_HIGH_MONO_COUNT, count);
> -	up(&efi_runtime_lock);
> -	return status;
> -}
> -
>  static void __nocfi
>  virt_efi_reset_system(int reset_type, efi_status_t status,
>  		      unsigned long data_size, efi_char16_t *data)
> @@ -556,13 +491,10 @@ void __init efi_native_runtime_setup(void)
>  {
>  	efi.get_time			    = virt_efi_get_time;
>  	efi.set_time			    = virt_efi_set_time;
> -	efi.get_wakeup_time		    = virt_efi_get_wakeup_time;
> -	efi.set_wakeup_time		    = virt_efi_set_wakeup_time;
>  	efi.get_variable		    = virt_efi_get_variable;
>  	efi.get_next_variable		    = virt_efi_get_next_variable;
>  	efi.set_variable		    = virt_efi_set_variable;
>  	efi.set_variable_nonblocking	    = virt_efi_set_variable_nb;
> -	efi.get_next_high_mono_count	    = virt_efi_get_next_high_mono_count;
>  	efi.reset_system 		    = virt_efi_reset_system;
>  	efi.query_variable_info		    = virt_efi_query_variable_info;
>  	efi.query_variable_info_nonblocking = virt_efi_query_variable_info_nb;
> diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> index fb321cd6415a..baccf2d90af0 100644
> --- a/drivers/xen/efi.c
> +++ b/drivers/xen/efi.c
> @@ -76,47 +76,6 @@ static efi_status_t xen_efi_set_time(efi_time_t *tm)
>  	return efi_data(op).status;
>  }
>  
> -static efi_status_t xen_efi_get_wakeup_time(efi_bool_t *enabled,
> -					    efi_bool_t *pending,
> -					    efi_time_t *tm)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(get_wakeup_time);
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	if (tm) {
> -		BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.get_wakeup_time));
> -		memcpy(tm, &efi_data(op).u.get_wakeup_time, sizeof(*tm));
> -	}
> -
> -	if (enabled)
> -		*enabled = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_ENABLED);
> -
> -	if (pending)
> -		*pending = !!(efi_data(op).misc & XEN_EFI_GET_WAKEUP_TIME_PENDING);
> -
> -	return efi_data(op).status;
> -}
> -
> -static efi_status_t xen_efi_set_wakeup_time(efi_bool_t enabled, efi_time_t *tm)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(set_wakeup_time);
> -
> -	BUILD_BUG_ON(sizeof(*tm) != sizeof(efi_data(op).u.set_wakeup_time));
> -	if (enabled)
> -		efi_data(op).misc = XEN_EFI_SET_WAKEUP_TIME_ENABLE;
> -	if (tm)
> -		memcpy(&efi_data(op).u.set_wakeup_time, tm, sizeof(*tm));
> -	else
> -		efi_data(op).misc |= XEN_EFI_SET_WAKEUP_TIME_ENABLE_ONLY;
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	return efi_data(op).status;
> -}
> -
>  static efi_status_t xen_efi_get_variable(efi_char16_t *name, efi_guid_t *vendor,
>  					 u32 *attr, unsigned long *data_size,
>  					 void *data)
> @@ -204,18 +163,6 @@ static efi_status_t xen_efi_query_variable_info(u32 attr, u64 *storage_space,
>  	return efi_data(op).status;
>  }
>  
> -static efi_status_t xen_efi_get_next_high_mono_count(u32 *count)
> -{
> -	struct xen_platform_op op = INIT_EFI_OP(get_next_high_monotonic_count);
> -
> -	if (HYPERVISOR_platform_op(&op) < 0)
> -		return EFI_UNSUPPORTED;
> -
> -	*count = efi_data(op).misc;
> -
> -	return efi_data(op).status;
> -}
> -
>  static efi_status_t xen_efi_update_capsule(efi_capsule_header_t **capsules,
>  				unsigned long count, unsigned long sg_list)
>  {
> @@ -280,8 +227,6 @@ void __init xen_efi_runtime_setup(void)
>  {
>  	efi.get_time			= xen_efi_get_time;
>  	efi.set_time			= xen_efi_set_time;
> -	efi.get_wakeup_time		= xen_efi_get_wakeup_time;
> -	efi.set_wakeup_time		= xen_efi_set_wakeup_time;
>  	efi.get_variable		= xen_efi_get_variable;
>  	efi.get_next_variable		= xen_efi_get_next_variable;
>  	efi.set_variable		= xen_efi_set_variable;
> @@ -290,7 +235,6 @@ void __init xen_efi_runtime_setup(void)
>  	efi.query_variable_info_nonblocking = xen_efi_query_variable_info;
>  	efi.update_capsule		= xen_efi_update_capsule;
>  	efi.query_capsule_caps		= xen_efi_query_capsule_caps;
> -	efi.get_next_high_mono_count	= xen_efi_get_next_high_mono_count;
>  	efi.reset_system		= xen_efi_reset_system;
>  }
>  
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index 50db7df0efab..516afdc8a49d 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -650,8 +650,6 @@ extern struct efi {
>  
>  	efi_get_time_t			*get_time;
>  	efi_set_time_t			*set_time;
> -	efi_get_wakeup_time_t		*get_wakeup_time;
> -	efi_set_wakeup_time_t		*set_wakeup_time;
>  	efi_get_variable_t		*get_variable;
>  	efi_get_next_variable_t		*get_next_variable;
>  	efi_set_variable_t		*set_variable;
> @@ -660,7 +658,6 @@ extern struct efi {
>  	efi_query_variable_info_t	*query_variable_info_nonblocking;
>  	efi_update_capsule_t		*update_capsule;
>  	efi_query_capsule_caps_t	*query_capsule_caps;
> -	efi_get_next_high_mono_count_t	*get_next_high_mono_count;
>  	efi_reset_system_t		*reset_system;
>  
>  	struct efi_memory_map		memmap;
> @@ -1235,13 +1232,10 @@ enum efi_rts_ids {
>  	EFI_NONE,
>  	EFI_GET_TIME,
>  	EFI_SET_TIME,
> -	EFI_GET_WAKEUP_TIME,
> -	EFI_SET_WAKEUP_TIME,
>  	EFI_GET_VARIABLE,
>  	EFI_GET_NEXT_VARIABLE,
>  	EFI_SET_VARIABLE,
>  	EFI_QUERY_VARIABLE_INFO,
> -	EFI_GET_NEXT_HIGH_MONO_COUNT,
>  	EFI_RESET_SYSTEM,
>  	EFI_UPDATE_CAPSULE,
>  	EFI_QUERY_CAPSULE_CAPS,
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 

