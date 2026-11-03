Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD74606B26B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q7B8j0Ep;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=GPAvbxyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3kh7cB3NHbVZeYBD16GLVXEHt7xKsgZXCvb8wD4xq6U=; b=Q7B8j0EpHSE1nq
	dXOFVj3lfrxLuIMhUW8MzMIiNBpY83p9EErLpEkEYxiZI/VqRGcjZU36Zf4dJbL5F36UIh2GtwsPf
	FfkqvKEW/y6VqsLOFxY46B9LXvi6uGKfWHiWBk1ze487Xga39J4Cz8BAD+qK02tfPMdWtRpsSWb5X
	rGjMuS//D972E3VLVP5JS59dnNkcodZe6wWW+nA3NwXjuDqvW5jIND9KF6UqQ83qqGRibc2J8npar
	ckHCfVqVQaNZUpJ1BPhcQr1MVlcaJb+kCpVI8jJLnb5bpXoRoNYi6te1rb+GXSvaCcsgD3RSd8rfl
	y9vaaMtLQ35EcZzJtWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGI8-00000002vi8-2i2V;
	Tue, 03 Nov 2026 15:19:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHs-00000002vME-3IVt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:19:03 +0000
Received: from [192.168.1.10] (unknown [52.172.102.219])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3AAFA20B716A;
	Tue,  3 Nov 2026 07:18:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3AAFA20B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793719125;
	bh=3kh7cB3NHbVZeYBD16GLVXEHt7xKsgZXCvb8wD4xq6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GPAvbxyRx5KMdL21dUAPyjAMQvakEHkEWbhIhNMkfJ+t9n4u+njR1F1n+oCwMdES6
	 Szy9TTXdtMVKUR9lFhw+6zPlOlWdihIgVGnKH76VNsQDHB9e3Gh+mIpwdrMsU7LPMp
	 o2YjC25D42bAt4zZIgAALlWagf53QtziL+T8UFg4=
Message-ID: <192a8868-d73a-4f05-9207-b8cea8eaa7fc@linux.microsoft.com>
Date: Tue, 3 Nov 2026 20:48:55 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
To: Jay Buddhabhatti <jbuddhab@amd.com>
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, michal.simek@amd.com, srivatsa@csail.mit.edu,
 ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com
References: <20261103063515.679043-1-ptsm@linux.microsoft.com>
 <8986493a-cc47-4ad2-a142-764d4069c146@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <8986493a-cc47-4ad2-a142-764d4069c146@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071902_244188_E833EF2A 
X-CRM114-Status: GOOD (  15.60  )
X-Spam-Score: -2.1 (--)
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

Hi Jay,

On 03-11-2026 17:56, Jay Buddhabhatti wrote:
> Hi Prasanna,
> 
> On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
>  > On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
>  > CPU hotplug state instead of the its actual state. This can leave the
>  > event manager callbacks dangling. Use the actual CPU hotplug state
>  > during driver removal.
>  >
>  > Hotplug registration failures are also ignored, allowing probe to
>  > succeed without the callbacks needed to enable event interrupts on
>  > CPUs brought online later.
>  >
>  > Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event 
> management driver")
>  > Signed-off-by: Prasanna Kumar T S M ptsm@linux.microsoft.com
> 
> This looks good to me.
> 
> A couple of small nits:
> 
> - "instead of the its actual state" -> "instead of its actual state"

Thanks for catching this.

> - Minor alignment on the cpuhp_setup_state() continuation lines;
>    checkpatch --strict complains.
>      CHECK: Alignment should match open parenthesis
>      #49: FILE: drivers/soc/xilinx/xlnx_event_manager.c:663:
>      +       hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>      +                       "soc/event:starting", xlnx_event_cpuhp_start,
> 
>      total: 0 errors, 0 warnings, 1 checks, 44 lines checked

I missed this.

I think the issues are minor. Is it possible to fix this while merging 
the patch?

> 
> Worth Cc: stable@vger.kernel.org as well, given the Fixes tag.

Do I need to send v2 to address this?

> 
> Reviewed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> 
> Thanks,
> Jay

Thanks,
Prasanna Kumar

