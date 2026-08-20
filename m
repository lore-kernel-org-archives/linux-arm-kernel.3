Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946EC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cD1lm9J5LOoc1VctowqA+QcEiYzpDZbKA3NAtqMB+c=; b=JuIFtDfPn8CNVnlGsFeDJS3wRU
	9hDn01A1eJ3z0zfamwDWWgW7iVxUxLnOEPIidb46nfKaZnGXeydL2xqU1y+PZvQgHdFrAp6DMme0p
	qx1C/3qdCoOARDQ72g4F2Q9lzD51GjPFN/xUKUSmzu7wnM0AwsN/bTZisjMsNCxAsUha8e0SHctKf
	VaLleqf3ynHyhbAehsfA3ReBaTpmTXJbMjE2BBMumBvPdhhUaEM5OvValYKLtyVZbJyq1fVQd3Jaj
	6TRc+UNqz/tZglT+wTPL8AIsqL4tbP/3kq5FXf+vCgSmOboHk6WH732vF5hBa1AWESC6iymUQCK90
	GeAt6tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2ln-0000000Bc5L-2aCe;
	Thu, 20 Aug 2026 13:25:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2lk-0000000Bc4o-48y1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:25:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-498012a61f6so58535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787232318; x=1787837118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3cD1lm9J5LOoc1VctowqA+QcEiYzpDZbKA3NAtqMB+c=;
        b=WVMJYgobShDmlepSpQe6U8NwEclN40uPXh0mGt5IeWdygIz92OusMuxrHVeRxK7IwZ
         /f9eLePuzzgqgpruqfw2gx+cugGHUkEAbGMOw9jNV68geL3AWWOFElVMlk571x44QfkD
         ntZJkxzr+TLlGTnHyRoFlJ3wGXNMCcyYFyJUdRlpMtlp/AE9x49gxw8BVobRQmRs5+PW
         sk1ooq7wRUr2nZa6wez86aLAygu4jhTVD3lcq3zvAj3pOx+HjHcjblieY3ij1ts77Tzz
         9/GSBUPk45yPNdiIye2sE2x4GiQiQnAwrn16SdZAtlieBXkw6kODGR6/xt6FzrCgPOzb
         1YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232318; x=1787837118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cD1lm9J5LOoc1VctowqA+QcEiYzpDZbKA3NAtqMB+c=;
        b=B0hJ24RjAo0SE77x+4LgylnPSzqBQCQvnbBvNf7wnXGAGCAXln9XHSQabg/Lm0++Iv
         4zaHc5+GUsdsPT2qAyNa5xO4M2rGwQeACZf5RTDpASq0t2eT1tH1ghOgaBHfwhjFGV5q
         qum1fL5zuYD/xIy9umiThLr30LUpAiJAobMxPw9MR4yvBQjj5P2/pblGZzuQOvY2gRPl
         hoHQgC2ki51fzPH6mZOiIOtewAvaLGPLlDXL/buBwT50zqOH+G8tgHYIlzYmjUrcsVsw
         Da5RD2tlw4qG+nlMVILqUFGAUZWIrGMo5wmS29TlrnL6nmYqzq6hJizUccaG0UGBCGDQ
         AEag==
X-Forwarded-Encrypted: i=1; AHgh+Rq+AqmhHw5XCrXyToMoRvwCLnBCejUS4LT9c5ywGh91lVd6sJGw5ERCnIGyxQ4KS75swMlkglPKE2m05aokA9GM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Q4fFSfiEwxF8hkH9Wsdl6793lb7AYwhH5OOFCMqG4ss0IeZw
	u7D5xlQ5MBO3jR5S2p1Li6OyHhKVMEadqY0KoojOCy9SDQXD4hFjUJ8ARgtp3tuB6Q==
X-Gm-Gg: AR+sD1157UOWoBLBOIZx01eJuZxBVTlrfP28WsncGIv1QqewcaFEuA/8ca3pRlw8x8s
	9DKLnhYpxDnN2bdwpVMSz9KFZK4z15e08gTqYcAZyfhBmHj5by8xBpyJZXUh0rGUbuOQjIqfcNQ
	fZJYayJwkcOCBtCj0usJ9CIhKfLxi0LpBgVgkEgh7r5WyAvlu35oM0WXcUooFS9HMdj1YMJFsHS
	OXy6PcwXX8eIlpSiwzIja+lCeUD8As75ywcaqSQ0/WF9NuoEBQplewfL2K+zUr1l+FfB2lNWZ1k
	gVTBlK2z0sKmedsnXxa0ekf+QjO6Z1vVd1wfYRMrqqppq77YSFvWFQOzZBZAb55TsqgXsAA9P4U
	IjPgRx+cnbScT04vaOynnKCCULH0cC4h+W63fmpg4QA+19Er4/M+Cb7dBvrMnLaxexLBWsmEvWz
	WEnDoEXFRWACkbYLMmXO7gocU8P1KQAHTmMjDx/BdztaBnQn5WoLyAgNi8dn2ULYQFiMeP7BaK6
	tr0vfdiygU4VV0Gr+KVXzxoSf/W/h6F
X-Received: by 2002:a05:600c:5ca:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-499b1ee3dacmr656705e9.7.1787232317330;
        Thu, 20 Aug 2026 06:25:17 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aca21c63sm160099225e9.0.2026.08.20.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:25:16 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:25:12 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Kim Mankyum <mankyum.kim@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Andrew Walbran <qwandor@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Allow smaller FF-A RX/TX buffers
Message-ID: <aocAODVhayfmy26M@google.com>
References: <20260820-master-v1-1-ea602b6d3860@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-master-v1-1-ea602b6d3860@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_062521_085932_532F9F99 
X-CRM114-Status: GOOD (  34.20  )
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

On Thu, Aug 20, 2026 at 02:42:31PM +0900, Kim Mankyum wrote:

Hello Kim,

> pKVM currently requires the host to map PAGE_SIZE worth of RX/TX
> buffers, as do_ffa_rxtx_map() requires the FF-A page count to match
> the capacity of the hypervisor RX/TX buffers.
> 
> This is unnecessarily restrictive when the kernel page size is larger
> than the minimum RX/TX buffer size advertised by the SPMC. For
> example, with a 16K kernel and an SPMC advertising a minimum RX/TX
> buffer size of 4K, a host request with a page count of one is rejected
> by pKVM.
> 

That is because we should trap and report the minimum number of pages
from pKVM and not from SPMC. The host doesn't end up mapping directly in
the SPMC.

Something like this should do the trick:

```
diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 48cf502ce1e7..95156d409f79 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -1355,7 +1355,7 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
                            struct kvm_cpu_context *ctxt)
 {
        DECLARE_REG(u32, id, ctxt, 1);
-       u64 prop = 0;
+       u64 prop = 0, buff_sz;
        int ret = 0;
 
        if (!ffa_call_supported(id)) {
@@ -1364,6 +1364,18 @@ static bool do_ffa_features(struct arm_smccc_1_2_regs *res,
        }
 
        switch (id) {
+       case FFA_RXTX_MAP:
+       case FFA_FN64_RXTX_MAP:
+               buff_sz = KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE;
+               if (buff_sz == SZ_4K)
+                       prop = FFA_FEAT_RXTX_MIN_SZ_4K;
+               else if (buff_sz == SZ_64K)
+                       prop = FFA_FEAT_RXTX_MIN_SZ_64K;
+               else if (buff_sz == SZ_16K)
+                       prop = FFA_FEAT_RXTX_MIN_SZ_16K;
+               else
+                       ret = FFA_RET_NOT_SUPPORTED;
+               goto out_handled;
        case FFA_MEM_SHARE:
        case FFA_FN64_MEM_SHARE:
        case FFA_MEM_LEND:
```

> hyp_ffa_post_init() already allows an SPMC whose minimum RX/TX buffer
> size is smaller than PAGE_SIZE, and the page count supplied by the host
> is forwarded unchanged when mapping the hypervisor buffers into the
> SPMC.
> 
> Allow RX/TX buffers smaller than the capacity of the hypervisor buffers
> while continuing to reject requests which exceed it.
> 

I don't think you should change that, it will probably brake things because the hyp knows that
it is using KVM_FFA_MBOX_NR_PAGES but you only mapped npages in SPMC. 

I have some android patch where I am also trying to remove the limitation that the hypervisor has
only one page per mailbox buffer (set in stone that KVM_FFA_MBOX_NR_PAGES is 1) :
https://android-review.googlesource.com/c/kernel/common/+/4238522

This should probably put you in a better position for a patch ?


> Fixes: 9d0c6a9af9e3 ("KVM: arm64: Handle FFA_RXTX_MAP and FFA_RXTX_UNMAP calls from the host")
> Signed-off-by: Kim Mankyum <mankyum.kim@samsung.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index a327c2bbb6b6..594d1112b5f9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -239,7 +239,8 @@ static void do_ffa_rxtx_map(struct arm_smccc_1_2_regs *res,
>  	int ret = 0;
>  	void *rx_virt, *tx_virt;
>  
> -	if (npages != (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
> +	if (!npages ||
> +	    npages > (KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) / FFA_PAGE_SIZE) {
>  		ret = FFA_RET_INVALID_PARAMETERS;
>  		goto out;
>  	}
> 
> ---
> base-commit: cb8a75eec0877810b50aa1c5a833f929525cd2ee
> change-id: 20260820-master-572418a358ab
> 
> Best regards,
> --  
> Kim Mankyum <mankyum.kim@samsung.com>
>

Thanks,
Sebastian 

