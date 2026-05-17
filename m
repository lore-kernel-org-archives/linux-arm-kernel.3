Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7ECD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD9bxD7ezV7biWpJzqU0P2l0lcof0BAgAkAO11CNJe8=; b=EI6xoK43WZpO3ryPJ6XpJqzc15
	LnFYDuBt403YHAYi+TRBhHgjgRpa4hWe5FiQaHtQ6bzCTGHOkIoucMEaT8/J8sDVDdjYaoIP5Kgce
	rJkBldvEVAaut9S7nZBgpe0dAxOQVCT13ZxnCuOtm6BzHY5CczfZkNKzMveUfb34MN8WjFZqD25zk
	yMQ4rGoHObgI8EMHuyNgZXeUmU97RZ+jcPXasFvlnhJcrBKfJbk5i3jab1CBD1tmoitNJWK9+6gQr
	zEASljuxqoBvpb4K8BsLwqqHhcctdisWV7ESrW2TlDlW61IYk9iochW65S7tgNjfTW4jnIegySDwW
	ZCJnOODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfHe-0000000D6xz-44aZ;
	Sun, 17 May 2026 17:28:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOfHd-0000000D6xj-1Kc3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 17:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA87B60125;
	Sun, 17 May 2026 17:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C82C2BCB0;
	Sun, 17 May 2026 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779038888;
	bh=QtVTlikuQthfSJg9zWb8C/1ODQzEOrDqs3xwjfAexdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx+beQlt8PxTnIQS78qei5pYJvZr5OC+P3DR6IQgBsdjvH96BL6/2tHdWUle3fWUf
	 2diTFnIAFRoiyHFq0GL4dqY2PpoXFr74yuK/tZ+ywBlkbAnKr2Pruzrjeboo1imRcx
	 1OFnn/hSAFOuzLhj5TC26vMnEoQrFtjmA2EHyh5L8cdxcvgTN4FQ1UYN79N1ZuzPjw
	 GHom+Hm066HOHRbauKCDa0uwXJKDKzMOigZS70yV9XUh7GI/U/dkicZ9qVaEgXkIvZ
	 9kfj8lPkLT36FhTnSZbtnAe91tcNvgroq5l4ruwLRgz0CGRFBgHxNgkJ0dzbGXXQnY
	 cE3ys6qHOka/w==
Date: Sun, 17 May 2026 18:28:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260517-cunning-pony-of-happiness-cab79d@sudeepholla>
References: <20260515-quixotic-active-dragon-2ee2c6@sudeepholla>
 <20260515174432.13419-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515174432.13419-1-jamien@nvidia.com>
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

On Fri, May 15, 2026 at 10:44:32AM -0700, Jamie Nguyen wrote:
> __ffa_partition_info_get_regs() walks the response with a hardcoded
> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> read into buf_sz and then thrown away.
> 
> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> strides over half a descriptor at a time and ends up parsing every
> other entry from a slice of two adjacent ones.
> 
> The FF-A spec (v1.2, section 18.5) says that the producer should
> report the descriptor size, and the consumer is supposed to stride by
> that size and ignore any trailing fields it doesn't understand. The
> non-REGS path (__ffa_partition_info_get) does this already, and the
> REGS path should match.
> 
> Use buf_sz for the stride, and bail out with -EINVAL if the SPMC
> reports something we can't safely walk.
> 
> Fixes: ba85c644ac8d ("firmware: arm_ffa: Add support for FFA_PARTITION_INFO_GET_REGS")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
> Changes in v2:
> - Rebase onto linux-next; reuse the
>   FFA_PART_INFO_GET_REGS_{REGS_PER_DESC,MAX_DESC} macros it added instead of
>   introducing new ones.
> - Return -EINVAL instead of -EPROTO to match surrounding checks.
> - Update Fixes: tag to the commit that introduced the hardcoded stride.
> ---
>  drivers/firmware/arm_ffa/driver.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index b9f17fda7243..38ae4476e864 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -374,9 +374,23 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
>  			return -EINVAL;
>  
>  		tag = UUID_INFO_TAG(partition_info.a2);
> +
> +		/*
> +		 * Per FF-A v1.2 section 18.5 the SPMC reports the per-
> +		 * descriptor size and consumers must stride by that size,
> +		 * reading only the fields they understand and ignoring any
> +		 * trailing ones. Reject sizes that cannot hold the v1.1
> +		 * fields parsed below, are not u64-aligned, or whose total
> +		 * payload would walk past the x3..x17 window (e.g. a v1.3
> +		 * 48-byte descriptor with nr_desc > 2).
> +		 */

I am not sure if this above note is necessary.

>  		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
> -		if (buf_sz > sizeof(*buffer))
> -			buf_sz = sizeof(*buffer);
> +		if (buf_sz < FFA_PART_INFO_GET_REGS_REGS_PER_DESC * sizeof(u64) ||
> +		    buf_sz % sizeof(u64) ||
> +		    nr_desc * (buf_sz / sizeof(u64)) >
> +		    FFA_PART_INFO_GET_REGS_MAX_DESC *
> +		    FFA_PART_INFO_GET_REGS_REGS_PER_DESC)
> +			return -EINVAL;
>

The logic above is correct but bit hard to read, I am thinking of splitting
this

>  		regs = (void *)&partition_info.a3;
>  		for (idx = 0; idx < nr_desc; idx++, buf++) {
> @@ -395,7 +409,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
>  			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
>  			buf->properties = PART_INFO_PROPERTIES(val);
>  			uuid_copy(&buf->uuid, &uuid_regs.uuid);
> -			regs += 3;
> +			regs += buf_sz / sizeof(u64);
>  		}
>  		start_idx = cur_idx + 1;

Is it OK if I adjust something like below patch ?

Regards,
Sudeep

-->8

diff --git c/drivers/firmware/arm_ffa/driver.c w/drivers/firmware/arm_ffa/driver.c
index fb97b01c282a..54984e1b9741 100644
--- c/drivers/firmware/arm_ffa/driver.c
+++ w/drivers/firmware/arm_ffa/driver.c
@@ -329,11 +329,9 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define PART_INFO_EXEC_CXT_MASK        GENMASK(31, 16)
 #define PART_INFO_PROPS_MASK   GENMASK(63, 32)
 #define FFA_PART_INFO_GET_REGS_FIRST_REG       3
-#define FFA_PART_INFO_GET_REGS_REGS_PER_DESC   3
-#define FFA_PART_INFO_GET_REGS_MAX_DESC \
-       (((sizeof(ffa_value_t) / sizeof_field(ffa_value_t, a0)) - \
-         FFA_PART_INFO_GET_REGS_FIRST_REG) / \
-        FFA_PART_INFO_GET_REGS_REGS_PER_DESC)
+#define FFA_PART_INFO_GET_REGS_MIN_REGS_PER_DESC       3
+#define FFA_PART_INFO_GET_REGS_NUM_REGS \
+       (sizeof(ffa_value_t) / sizeof_field(ffa_value_t, a0))
 #define PART_INFO_ID(x)                ((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
 #define PART_INFO_EXEC_CXT(x)  ((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
 #define PART_INFO_PROPERTIES(x)        ((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
@@ -347,7 +345,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,

        do {
                __le64 *regs;
-               int idx, nr_desc, buf_idx;
+               int idx, nr_desc, buf_idx, regs_per_desc, max_desc;

                invoke_ffa_fn((ffa_value_t){
                              .a0 = FFA_PARTITION_INFO_GET_REGS,
@@ -370,8 +368,18 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
                if (cur_idx < start_idx || cur_idx >= count)
                        return -EINVAL;

+               buf_sz = PARTITION_INFO_SZ(partition_info.a2);
+               if (buf_sz % sizeof(*regs))
+                       return -EINVAL;
+
+               regs_per_desc = buf_sz / sizeof(*regs);
+               if (regs_per_desc < FFA_PART_INFO_GET_REGS_MIN_REGS_PER_DESC)
+                       return -EINVAL;
+
                nr_desc = cur_idx - start_idx + 1;
-               if (nr_desc > FFA_PART_INFO_GET_REGS_MAX_DESC)
+               max_desc = (FFA_PART_INFO_GET_REGS_NUM_REGS -
+                           FFA_PART_INFO_GET_REGS_FIRST_REG) / regs_per_desc;
+               if (nr_desc > max_desc)
                        return -EINVAL;

                buf_idx = buf - buffer;
@@ -379,9 +387,6 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
                        return -EINVAL;

                tag = UUID_INFO_TAG(partition_info.a2);
-               buf_sz = PARTITION_INFO_SZ(partition_info.a2);
-               if (buf_sz > sizeof(*buffer))
-                       buf_sz = sizeof(*buffer);

                regs = (void *)&partition_info.a3;
                for (idx = 0; idx < nr_desc; idx++, buf++) {
@@ -400,7 +405,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
                        buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
                        buf->properties = PART_INFO_PROPERTIES(val);
                        uuid_copy(&buf->uuid, &uuid_regs.uuid);
-                       regs += 3;
+                       regs += regs_per_desc;
                }
                start_idx = cur_idx + 1;



