Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D476C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kW6C1+4rNhE+0PMn+ucH4K3CUSEGpMH1odrzmczVGFM=; b=XLJdRfMEH3RJ5ESlR4m+YnlC0t
	DgukZr9dNBHD/6YsgnSSEE4VHAL540ZxkxHyaAL7w1nQp7xRa3wPO6UK3paWvoBQjE4u41JtjdhCm
	1ztyy6zgAsgtfrr2MaFysrwWZbpK3Inb9ksnazrVsg105Y6ZW23ix6OY11IT5V5wJIKOxNuFafBl2
	Win24LG1zqdN5UslEGLJNSZsUoFYZK8xgpDqbPUY0WL1r31dKSPH37eIn8i3WqcknODbo1VR+VrxA
	OTxZjT92292U1CQX/gu+DqBR+thSlwqdlYFKdVMHoWFhnXieAE628z198P7GreskuXPoKJLb4B9ga
	V4br8YlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpyz-0000000Gre5-36fe;
	Mon, 03 Aug 2026 10:33:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpyx-0000000Grd1-29tQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:33:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so19647315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785753196; x=1786357996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kW6C1+4rNhE+0PMn+ucH4K3CUSEGpMH1odrzmczVGFM=;
        b=j63dAgu4Exeu5mxnhncX3Px2kxUPgP1RzfMMsvBhL+1cMtowwDxmK139xRtbtay++x
         i7nExUiEWYC4MjNtZTF/UOq52/LkKxoGCJwExoQr/aZ6us+9kZo8FDY10ZABr2PnAx3W
         Kob8NJJwfeB1WbZTFDanWaozpmQ8M51BWjDbAMa3mOoTBGFKU872sdVGrqdfkRnSSDSV
         nGM6hAR/T/GKneKrKt5w4KL/NAqytZF5Ju7M39WItDjOBrb9+xJgXbceojco/Tw9FKvT
         IStgvT21YUG88ucas/LQwpq9n8KIugHIwAhSZN8DLlJ3J7E9HdgU2WBqUjxShJX8burN
         LSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753196; x=1786357996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kW6C1+4rNhE+0PMn+ucH4K3CUSEGpMH1odrzmczVGFM=;
        b=Sb3+giGi1Jkwj1PIENdB6y0qZ762vvXwnVjPQpEuROkJmLRRDyGci6sXC46yWOHjqz
         45AUKOWLwIRwCGNj5MCQq7MLMp42IWr/79Glqs4wNQKyXnELEQQ+JFGSFLxILThQZrdm
         TpMxGccE/f6blBdM0hDbGHsNduFPhS3nW8Gv2p2y6PElTIoUhGAkgWD4YrRZwjG+3RbG
         SoaYtNyu7mOH+xsG+cc3IhfbUSuuSLvrq4gpyNrOHFwEM7zcl3vH79fbeDSudpgDzSGQ
         UUlnFiumnj+xZe+77eQQxnGrIpLLBpYvKGKUc5rq2BXXkQzYWrs+BuQcyIpKIKIIqLTK
         hSDA==
X-Forwarded-Encrypted: i=1; AHgh+RoiwmqZL2KAmJjkg14BgbFw8PmBhsuE8CfK1hq5ofVzmL3mM7L6ekIwtcmwly03nP20uVaZpqHiF9zlueOYT+hi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9RQNbNGQLn9BJMISJ+95mN3Qqp9yeI1kdAS/LoxDchU8IXBw5
	1RM8nmXMllHooN/VAQfet6oWdo9lG0Y1b3eEXQ819WFuMlqch8L/jdYNw5IgeZKKAQ==
X-Gm-Gg: AR+sD112Qitlvj8oAnzK57LGqDDoyGZUdjWcTNMivbIiBytS/+Rs0E/RpWcplwkYY7Z
	UL77H7VqfF5IiVJakd51d8QQEE87T0+8Ca0JtuKylQNZGy3Yqy9gmZTvZWVF/nRXgQ5jHEaF08q
	ukA2nzotvglK3rgpva6aZ6oUKxPdDV7KhPgv+s/oU5qMKju3NGynkajMVIlJg27i6qD9OgFk1lo
	XU7tjtS1zH6ytca69aZ6c8Kf3yRvas3w2u9JnUFv9VKryGUlopGvlq2by0Bqjh7rD7H+4B8h4Da
	WAHDi0BfJhMhVY2+S33YHahSGbRam8+NF3gx1kyBjOrZQMKaKxVJOJzHffFdyBUfQ7cyd995DzQ
	2RNXF07fZmSVSqQgDuHFrRaF8T66XgyatpvMSLgFHNrzTIGUDYQu2M7YzqoXwmbo72Q4B/ir3l/
	udbZpxOQzzHwx31DltvPghwPO62GUl17p/YsfNZ7s2Clr/5OZ2cV6DqlsW+W2tXwP5OjzfHvgV4
	VhRxY28ANy27XMuYEUNzhs99GVo/nyHHhBkvhnJtpb2
X-Received: by 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4980c652515mr253557695e9.11.1785753195960;
        Mon, 03 Aug 2026 03:33:15 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f007sm209718545e9.6.2026.08.03.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:33:15 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:33:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH v1 03/11] KVM: arm64: nVHE: Declare the hyp event IDs
 before defining them
Message-ID: <anBuZwkjDQKRKVlr@google.com>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720161343.1367007-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720161343.1367007-4-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_033319_586959_7A545F65 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, Jul 20, 2026 at 05:13:35PM +0100, Fuad Tabba wrote:
> The defining expansion of HYP_EVENT() in events.c is the first time
> its translation unit meets hyp_event_id_<name>, so sparse suggests
> making the symbols static. Include kvm_hypevents.h ahead of
> define_events.h so the extern declarations come first, as with the
> tracepoint headers.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/events.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/events.c b/arch/arm64/kvm/hyp/nvhe/events.c
> index add9383aadb5a..b845be0acd117 100644
> --- a/arch/arm64/kvm/hyp/nvhe/events.c
> +++ b/arch/arm64/kvm/hyp/nvhe/events.c
> @@ -7,6 +7,8 @@
>  #include <nvhe/mm.h>
>  #include <nvhe/trace.h>
>  
> +#include <asm/kvm_hypevents.h>
> +
>  #include <nvhe/define_events.h>
>  
>  int __tracing_enable_event(unsigned short id, bool enable)
> -- 
> 2.39.5
> 

-- 
Vincent

