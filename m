Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00542C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRwLB4+6t3H4PDGX6S9Qf/LBF8/KecqQ9VavQZhHs7c=; b=iY+Lqk3wW/sccouSc+l6WWkB1M
	y/TJs7Af++g404otS8sykM0e2VjTGLtpw+7DwlHfBJvLbn4Rkn0m4kRcF8n9SqblPWIe29xEzPh7h
	5rK92mjWaMFUAnJ98y1e1RMlhI4Ucpo/BJ4VTAysyTu4yXpo149fuz7Hxpq03deE6O9B2ZhZj8CRC
	wI9h6wi2tdjg/JSEXgngSDkh+yc4D8MzmQlUX2U96tkpAWwMmYlxK+w7UL9kzN3pGcq+2r/zd0aQW
	SOjGS5eS05QGGVbA8BSgRx6hXcbWyThkwp+uO9kiQ2KG0VokMj/etmaRtSwz/YGeooBVTzSssN7UV
	5tHqB0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqq8L-0000000Gsng-0i0W;
	Mon, 03 Aug 2026 10:43:01 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqq8I-0000000Gsmj-2urk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:42:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1907431f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785753776; x=1786358576; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRwLB4+6t3H4PDGX6S9Qf/LBF8/KecqQ9VavQZhHs7c=;
        b=jVRwTcZR13v976d6kbLA9BIXQh/x44odkBfHZGLrbUvVJT02VYrWOshOiMUPEwhrwd
         vMyCAWxBZBypr8If+HSOHTsIV1/aiQbEGnu3fIdDzExwPbi0oj9ZhIGs6oeqkJCobtCB
         v1BAeClOK7eoBv9GggyQcm4XBj8P+m6tHE0eCrYBbNVp3DiNjB+XC0HueWXLAXXam0ug
         HHk5XTRCmkQkzt2Ml0YgiseVhIzFoaT+nDVdNZh9tu/OKLO32I/JyBvi2+rh6gcjDDFh
         p4uKm6jUWSXq4iRJPWby8hkPKgMrR0LWcFcHD+RGjeICwOF4t6tXb0SWq2cnkbd9ICQu
         bEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753776; x=1786358576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRwLB4+6t3H4PDGX6S9Qf/LBF8/KecqQ9VavQZhHs7c=;
        b=Qf3xm8JHWwCynZ7cUftjZcNEKfs6jvibR2gWlEC/mFkQgXt5vR6abm4KyjfZgixYLP
         v1T2C5HPoU95sH6L5x33KcnrVPxLOwGdM7JUCil+NIC4x0N0j46iJdWKAA+ckrSC0uOb
         Iz44dhppNZIgyaNEctP00iUeLT7TBuH7VSDw1bye6FpIJTyTwr7U/MO5lCxIzLLHek2+
         uzTXlNwDnu5VIUpuMtPEzYRTflqoZNMM0fUxrGgg4YMwpyUjNHcP+A8476rdpwl3+GuH
         C2hC7kQckxGrP9SUSISfTgwufTO/3q5Bp05i8r8sDIsZSdXU6Zuv4c01l2rkLnKiO8YL
         VOhg==
X-Forwarded-Encrypted: i=1; AHgh+RrvgfBYs3QU/hFqzNXv98Ta2RAmfscGG0UrmKh184a0UXfpdeXXSh/RYvgUDQnEXNWf/xIXF0TtHTpkxjbOMXH6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl+5fLuUXgGxe4MgzSJympXdi3MKeQ37rKJ4GFLJ58n254WnBh
	z5METekRhUqP6KUAdNKPO5u6qIWVslhctpmfT/w6mEdWe8BicpencCzwuWUTnydmDw==
X-Gm-Gg: AR+sD10dUmmL3iQTrrHgRfLym8Khj/OI84SDvuGeVIRKfo77xhglk7EokmYAUTt8oKP
	GN79LC96d2X7L3nZXECFmqA/gEvWAAz12Wnb8XqBvIKy4gN+Xhk9N0D5QLFv/LuTbUK9fmOUKVc
	D03E1bHqZUuFuE11/WEr1nWerzRH47C2NbUhE1dtkKfBnmtjxX+GY0Ivnjjp5RF/Ljagejqf/6V
	hNPUQDrrWrAMdor/4GEJymSz54lbJFKS4tdaVLYvlpmDcjZLZU0SqbHNQMrHzWSLKySOi7R4eLw
	j10edyMX8odeLTmFs60PIr9qoc+uxQRXSLrA8UGiKcyAeIzJsdJD9NpaL5l22Ue0LVu/SF4JFDh
	4Dq87Dh/WfktI4Cls6uZZEzuVEYOVuzCdSkXpM2AA5cw/wSFHVvxU6E3R2y18c+Y60JukY0ND3l
	z9jshrkx+ftN2vzygUi5Cwl5KabMR1xpc1qby2bt2GLq5dLWjKrdv+XlIunbKfKto4RZdg7xy0x
	Jjfu47kNeoGoglg3lJxx0mvoY1sa7hZEj6lpK4l11F+Yg2+YIcAvxQ=
X-Received: by 2002:a5d:6586:0:b0:47f:5b52:5579 with SMTP id ffacd0b85a97d-47fd72d4a27mr17326994f8f.18.1785753775925;
        Mon, 03 Aug 2026 03:42:55 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2484sm32978771f8f.11.2026.08.03.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:42:55 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:42:52 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH v1 05/11] KVM: arm64: nVHE: Run the source checker under
 C=2
Message-ID: <anBwrPIILsaYWK_K@google.com>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720161343.1367007-6-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720161343.1367007-6-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_034258_748437_DB7607C3 
X-CRM114-Status: GOOD (  17.64  )
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

On Mon, Jul 20, 2026 at 05:13:37PM +0100, Fuad Tabba wrote:
> The custom %.nvhe.o rule reuses rule_cc_o_c, which hooks the source
> checker only for C=1, and that only when the object is rebuilt. The
> C=2 hook, cmd_force_checksrc, hangs off the standard %.o rule that
> nVHE objects do not use, so "make C=2" silently skips every nVHE
> source file. Call cmd_force_checksrc after the compile rule, as the
> standard rule does.
> 
> Fixes: 7621712918ad4 ("KVM: arm64: Add build rules for separate VHE/nVHE object files")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Nice, I have wanted to fix this annoying issue for a while now!

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index f57450ebcb498..ccc1fe8394094 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -49,6 +49,7 @@ targets += $(hyp-obj) kvm_nvhe.tmp.o kvm_nvhe.rel.o hyp.lds hyp-reloc.S hyp-relo
>  #    avoids file name clashes for files shared with VHE.
>  $(obj)/%.nvhe.o: $(src)/%.c FORCE
>  	$(call if_changed_rule,cc_o_c)
> +	$(call cmd,force_checksrc)
>  $(obj)/%.nvhe.o: $(src)/%.S FORCE
>  	$(call if_changed_rule,as_o_S)
>  
> -- 
> 2.39.5
> 

-- 
Vincent

