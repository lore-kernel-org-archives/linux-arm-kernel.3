Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F089C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp+fsHhsX4lAKb58gXPJ8tba1DU/IH/qxP9n8Ckh7NI=; b=E2crqmEP2prlktf982vicGQEXw
	SR7Y+eS0GqBhzerWtRCOCenFORsQ3OHKSdYrJYbpNTzqr066xBarZCJWajQVkG5BHOYl8wi9oNOGq
	i3G+0pVlkzyeWwTYAuCUZz/h56BNDthpvc6eWtSKK/utj12TjHNRLmomP2Np0UyDXwMbvIFWRdauG
	CJMZuGIFhf20mnFLPhgELkR6efYy96WtJ2Jndt0XvsSt71SpIFJWNtAZAtiESDQZAnf9Jfp2GnT1N
	Rt8Iq8i4xdHct6E72VgJ7TRgkN8GqrVWd1UkrQOp8f9HfzrnDG1pCq3Jqn9wdTVC27P6Hh8JEKT4J
	rqL0o0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEt-00000006eP5-3nw8;
	Fri, 03 Jul 2026 10:35:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbEq-00000006eD8-16wi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:35:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4759b4f0897so211597f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 03:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783074913; x=1783679713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wp+fsHhsX4lAKb58gXPJ8tba1DU/IH/qxP9n8Ckh7NI=;
        b=nwl3hwxLqyaqv8V0szIHo7udrOyBpTuEuIk2c2pEhRNHstFJKLLKecNReYQRNE78WI
         rxV6NPDVYwR7xwknJOPzNxl/bUWVDTubj1V2diMzOXj5wl10EmI/3DAE8ufDm6O7Jk7y
         bjDDOt80l94VMEWQNfE2+8AJ8XAR8QGL20fJPnxmc/tQ8O8cO0kFaxQWg+aZweEoW9TR
         p1S+LeqUOd3sFCQ2293RKBBc8/IbOTxXleA56oNZxoMjKlUAMy4HJO7b5LDw8w9JA79W
         BwgMK1NxCTTxK8ObCtuTqGYQhX6Eo4AMXkQ49+fw+/8ESTWrzIifa0xiszCZXb/1AaBV
         ozWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074913; x=1783679713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wp+fsHhsX4lAKb58gXPJ8tba1DU/IH/qxP9n8Ckh7NI=;
        b=EYEUyYP8fScgGf6sboYRZyA4zClLpbag8o+A60umyLriuS4W5vfYe/g0LA30InixFc
         BSBEknzi8/iQQQNDcSszDAv48DBsBBU+0fj6lPebcXi3h6YjYKOjsQ1nlh8yNwEM77YR
         pN9k7TiqTASJk89dHE9dJuvFm8Ga1Pq32yR5IR9H9FgFojPA90MEgfwhQgz/tfgbJmOa
         crfuMWTuTCAr4sZs1vqK+iYn71dVhoBteIpA0En0HqZQ/7HmNRckxTHX0ej+lvKGOqpB
         HloZb/7qdrPCV4DLB3b84gS0U/xoW8w3XNi6TNqqPOW+c1NJyq9t73IRnOU/v0gaFb/C
         yPoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rryu2qHYOyv4bTbxEkUfgVbFN7TmHcD7GHfQPsh+wh9JEXf4lM6KBMhsGTiodw1EGcVr6qzGig0y/dY/I02nDPr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7MOdq4hL2E3OijFABNIJTWpUcP0R4sshaau3QLK30VE89HxgF
	Q0nvsBhKoiK0NNV1UDuCpGmsputMtMm5G3yxIeWTV/ZEK9XkdYDdKYR5p85utDSkbw==
X-Gm-Gg: AfdE7clNvYEP0WzlrP0U7MbaEurZMYLM52Nvul0E78qWzOReuz2tQ7jnNEJAwoCHb7w
	g+b/+EWgVesMkYvY/wbZkgjoRPiCTNhi30wR25UtvGIQvViotzTBpQtdFUlgJQqMvK0iiPQQ+G3
	EqzPtLKP6x/BaN/HufwIKST09OOqjTY57Jw6rcV6Unnt139zQs5VYERB2CoKXyf0PwaJIvYWAyg
	19NcRfnjd259pNcgzaaKKIocH+TFrxLSDC3kU72+Sl09kx+uP7/08/13HlMsSEGlyudIU7YkRAI
	NA/Ak7ALckTx/5tSTn0kqe7jdIrbe4Od2PChvBDfKFDIvwR8qvUvH7Phb2DNFADn6skUtaEfzGF
	wZojn478pOEYxxvo3qK4k9e8A0B2+/c11lGdzAMFBJgfDpr7kakGXrgZRgL12LNWbSd5kvZ2jAo
	2IqWpFCwf6CoJzVqojp/QPXC5BNdbvlgN7IoUpMy2VHDs7rGK3pFJV4A2xi85Brg==
X-Received: by 2002:adf:e106:0:b0:46d:d693:88cc with SMTP id ffacd0b85a97d-477b5489f5cmr8754455f8f.47.1783074912560;
        Fri, 03 Jul 2026 03:35:12 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd46asm18021822f8f.36.2026.07.03.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:35:11 -0700 (PDT)
Date: Fri, 3 Jul 2026 11:35:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v9 4/6] KVM: arm64: Validate the offset to the mem access
 descriptor
Message-ID: <akeQXIY_7Z0v9ouR@google.com>
References: <20260702103848.1647249-1-sebastianene@google.com>
 <20260702103848.1647249-5-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702103848.1647249-5-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033516_332767_85F40912 
X-CRM114-Status: GOOD (  20.96  )
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

On Thu, Jul 02, 2026 at 10:38:41AM +0000, Sebastian Ene wrote:
> Prevent the pKVM hypervisor from making assumptions that the
> endpoint memory access descriptor (EMAD) comes right after the
> FF-A memory region header.
> Prior to FF-A version 1.1 the header of the memory region
> didn't contain an offset to the endpoint memory access descriptor.
> The layout of a memory transaction looks like this from 1.1 onward:
> Type | Field name | Offset
> [ Header | ffa_mem_region  | 0
>   EMAD 1 | ffa_mem_region_attributes) | ffa_mem_region.ep_mem_offset
> ]
> Verify that the offset to the first endpoint memory access descriptor
> is within the mailbox buffer bounds.
> 
> Also, fix one hardcoded sizeof(struct ffa_mem_region_attributes) that
> should be replaced ffa_emad_size_get() for compatibility with FFA v1.0.
> 
> Fixes: 42fb33dde42b ("KVM: arm64: Use FF-A 1.1 with pKVM")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 27 +++++++++++++++++++--------
>  include/linux/arm_ffa.h       |  7 +++++++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
[...]

> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 033c630b271b..e71d83ee0aef 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -421,6 +421,13 @@ struct ffa_mem_region {
>  #define FFA_EMAD_HAS_IMPDEF_FIELD(version)	((version) >= FFA_VERSION_1_2)
>  #define FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version) ((version) > FFA_VERSION_1_0)
>  
> +/* The layout changed from FFA_VERSION_1_0 and the region includes an
> + * ep_mem_offset.
> + */

nit: Coding-style.

> +#define FFA_MEM_REGION_SZ(version)		(!FFA_MEM_REGION_HAS_EP_MEM_OFFSET((version)) ?\
> +						 offsetof(struct ffa_mem_region, ep_mem_offset) :\
> +						 sizeof(struct ffa_mem_region))

nit: Could avoid the ! by just swapping the two expressions.

> +
>  static inline u32 ffa_emad_size_get(u32 ffa_version)
>  {
>  	u32 sz;
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

