Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1C2C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH9FRiynBWmz+TuFtsldRHKl2P9Mf6GV3/ecDf9SulU=; b=1eE/JJ+xz8r+YOeWNywpPcma6f
	5GsCcNv5Yu2Ys+Ngq+eVx+wiwD5ZlJXSAgkzGHlNrYv5tHYDL6E2YbsrlLEfcI/P6Oq4HFyJeHs51
	Q+7bo5h21ZV0nbVLVExm7EaNbISnhT3b0Kgtxveb7hWBm3jDbQ18t9awOokiUeRI4jKbjXinQ4mh4
	tfta+CwUW7pnTeKG2OHMpWw33tJ0OVsP7nx80nUtvblpIflqj2d8ZDOZXQtvPVRRpBA8MGr6zwzyt
	IhOUvYpqs/48FMKLvPhHL/x7nNxifPVkE47UxoywSTvmcVGNo7CXi69hz4eO0DBya3tyU2iOTEyyl
	iJoyDQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhT3l-00000003fIl-205V;
	Thu, 31 Jul 2025 13:11:01 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSsk-00000003doK-2Vxp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:59:40 +0000
Message-ID: <4a807c89-d57b-463a-9166-836301ee9947@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753966774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NH9FRiynBWmz+TuFtsldRHKl2P9Mf6GV3/ecDf9SulU=;
	b=xr+ARsGs90n+e4EJB2/aZZS3nAn0zrVWNbDfG6INi30wDzIw055GiHjsWFEJByRMfgqySw
	da8aMglDu+wCSn2Bv1HgLAb6f70bUY5JjTm/PYR2HWwdzlxONXV81GGWPL0a3LZ7gCM9M9
	AT7dE1spfAR2xHi8+H8xZxDcABzdCOU=
Date: Thu, 31 Jul 2025 20:58:44 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-2-smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <20250717234744.2254371-2-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_055939_488978_6433EFAE 
X-CRM114-Status: UNSURE (   8.69  )
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

Hi Mostafa,
On 2025/7/18 07:47, Mostafa Saleh wrote:

... ....

> +	/* Dump the faulting instruction */
> +	if (!is_protected_kvm_enabled() ||
> +	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
> +		dump_instr(panic_addr + kaslr_offset());
> +
This part seem like unnecessary, cause it'll be remove in patch 2(Only 
the comment left).

>   	/*
>   	 * Hyp has panicked and we're going to handle that by panicking the
>   	 * kernel. The kernel offset will be revealed in the panic so we're
Another confusion is that no similar wording to what you mentioned in 
the cover—specifically "Cannot dump pKVM nVHE stacktrace: 
!CONFIG_PROTECTED_NVHE_STACKTRACE"—has been found in the code.


-- 
Thanks,
        Kunwu Chan.


