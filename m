Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE42C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/gwO/ZBSh5wmPvY7qO834jSNpwf/Xm7SGaDdfmoSmQ=; b=26Zc2wKSAeVtlbmUISOJMpB2CS
	iwuiBSnsEeyvgKKDkL4zfcSEaZUJD3A9Vd9hudqJA75rs25jYK5+LB+XHOdTOyskIf+QdWZu2vpSz
	8Py7wli0qgeISE3iwObymJ1gTCxy4RQmT3/rBeyu/TBEtWFkeXErHej452ldsudTqQ4RCC8gyhf1y
	G20oKI1TyoplaVAwTf06PUWBJDKUmTDkfB+a4SHSQMVJJTjoxyaQMyzCoyf4gWuBk+uB0zoK3LL3O
	rZIerMrmgYkIcF5FxwfzK1BotimQ9T72Q0VDOIgqTax1TbJzp6OVoWfJ9IbpjuORBK4r4A/kMz2OO
	XWlPqLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUu-00000005Ogo-2GYp;
	Thu, 06 Aug 2026 09:34:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUk-00000005OQC-3QCj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4955de8797cso12919795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786008872; x=1786613672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/gwO/ZBSh5wmPvY7qO834jSNpwf/Xm7SGaDdfmoSmQ=;
        b=MXH1EOPtgkwnQMVOXjGvCMtL+4r0lvBA2r4R6JnyQee48cBAqLx/cAMURvURFIUd0E
         Rkkx+NNRY7MVSzXGT4tyALkNLxPPxKqCd7D+G8dDmRScawICf3qQOViAkEcuC7p22xHI
         RQtupNk9Y3Lt/M9PH+890aIaAF0TwH7kRBI9OsgZLuP/RSAOOFPliS4jSxG9VGbuPLhI
         hqS9CuHw9lkuO6WsKHnwDWSZE8g42LFXwH2cJCj+CbLMquvjXamh82bDCtIqWoztJv+h
         5kU9ikOW28+0nuc0DE3dlzoX+d0nfzEjXWO9iSYL5jZKh6UhhJG1P1DqXxmB3/6Qvufp
         k8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008872; x=1786613672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/gwO/ZBSh5wmPvY7qO834jSNpwf/Xm7SGaDdfmoSmQ=;
        b=YOhZsS5EBXd2TemJGRi2Vnj6ApAK9AsHt6T3chwtptSJRKu3gMRkSuFSr5tezhzTlz
         6LE+pWWKjJYlTrzcof2yO1GNP5u+haT86QP/Eg20uCctP//CtLk3r5uAF09nhcbDMRAk
         DTtTEjfQFjQIhIdteyNWIW3+S9/mentl+Npqw+TVRTFiBfq8n5Nrgm2qcpHAAb4yS/BG
         inHytyB8u59BtGAXllSVFblv86XCqpJvJOq9E3+ToVRhxOfobejK9PWjprgDxEZGDrRT
         VxDEjK7SznYWVPsp77Nfyto1gjBks0vMF47S8SXoDjqjH/HsbZVBDmQAvBwBxDk/Zglp
         WHCw==
X-Forwarded-Encrypted: i=1; AHgh+RpzTScKSjcGRE4qzo19cQ+ufMt6IFRp4e2/NJb0KuloW5vDMC6Zd4zy5c+kfWtWt9eT6iZ3EONqmdAQtP59o7XQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlEr4bGt+rXvxi6qh4DbyNY7uoGtv2W0uCgN1XP7FFrjSrZnxg
	TjN4MzYhkGu4dwtZ/FQf9BBz9SGnqWWCpfBLZYvqdl+E66cACYgUjYE3NIHFzn8iqPc=
X-Gm-Gg: AR+sD13tIJXL+OJG1ge6RgSS6qADyIk+DKoyTx2Ucy8NQd/ihIiDiEb25qNL1S6T4Gj
	f2/S1aUphfD05mv+bEbQxlUjeVuj+1Y2KDfwlEAS6rnyQgxw5wxfJ54hxtLLRNZuK+CC2H2Ub0L
	oCmfwkmpG9LJyDG/FAuAHYk8ZN4XrAizeodO+3SgSLqVbFvgR5YCIxmyJCpT3RPODyZV0WCTU6P
	CNlCQ/LqLhd27dsuM0NrT/CpnTCmRmtnRDhheFTo82xylYZqC73rIFET72+XBBcte8RPQ/4mHGV
	SwnmRyHnJkvX3Y54gdb8quliAsSEU7gReJ6d+GQSwTPLKYBN282i6CnAQ/AkID0b+4UGef36wx/
	oiwnqB/sRpKNEl+fjEH2F2pBWAn7sfYXQFmrKUsqlrYJ9mHeIkQDIOwwpaxbh9q4ny3/tIV8AIB
	j6vRvI4jUAvYop6DHJLqZrQKhWS4GeahRh6K0dJj8ACCGWOGayM7uuJohAoaFL6l2l3nsRSCl06
	b0IX1a1qngpUUcboxyF+vPaew==
X-Received: by 2002:a05:600c:c4aa:b0:498:261:dd93 with SMTP id 5b1f17b1804b1-4994e7daa7fmr128489865e9.18.1786008872144;
        Thu, 06 Aug 2026 02:34:32 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm11415265e9.6.2026.08.06.02.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:34:31 -0700 (PDT)
Message-ID: <bdb486c9-71c3-4bde-8216-83de021c6d79@suse.com>
Date: Thu, 6 Aug 2026 11:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: module.lds: fix unwind metadata for merged .text
 sections
To: Egg12138 <egg12138@foxmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023434_922366_82B3BA9C 
X-CRM114-Status: GOOD (  22.36  )
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

On 5/30/26 5:46 PM, Egg12138 wrote:
> From: Xiao Junzhe <egg12138@foxmail.com>
> 
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN,
> and related macros") made scripts/module.lds.S merge module input
> .text.* sections into the output .text section.
> 
> On ARM, the paired unwind input sections keep their original names.  A
> module can therefore contain .ARM.exidx.text.unlikely with sh_link
> pointing at .text, while .text.unlikely no longer exists.
> 
> This is a valid ELF relationship, but ARM module_finalize() does not use
> sh_link when registering module unwind tables.  It derives the target
> text section from the exidx section name instead:
> 
>   .ARM.exidx.text.unlikely -> .text.unlikely
> 
> The lookup fails and the unwind table is not registered for the actual
> .text range.  This can make module stack unwinding fail with:
> 
>   unwind: Index not found
> 
> Keep the ARM module unwind output names in sync with the text sections
> that scripts/module.lds.S now produces.  Coalesce the .ARM.exidx/.ARM.extab
> section associated with .text.*, into the
> stable output names expected by the existing ARM module unwind code.
> 
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
> Signed-off-by: Xiao Junzhe <egg12138@foxmail.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

As mentioned previously, please don't forget to put the fix in Russell's
patch tracker [1].

[1] https://www.arm.linux.org.uk/developer/patches/

-- 
Thanks,
Petr

> ---
> Changes in v3:
>   - Apply the ARM unwind section coalescing under CONFIG_ARM_UNWIND.
>   - Remove quotes around linker-script wildcard patterns so GNU ld expands
>     them correctly.
>   - Use conventional linker-script wildcard syntax, i.e. *(...) without a
>     space after the wildcard.
> 
>  arch/arm/include/asm/module.lds.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
> index 0e7cb4e314b4..1d56c0375c18 100644
> --- a/arch/arm/include/asm/module.lds.h
> +++ b/arch/arm/include/asm/module.lds.h
> @@ -1,4 +1,16 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifdef CONFIG_ARM_UNWIND
> +SECTIONS {
> +	.ARM.extab		0 : {
> +		*(.ARM.extab .ARM.extab.text .ARM.extab.text.[0-9a-zA-Z_]*)
> +	}
> +	.ARM.exidx		0 : {
> +		*(.ARM.exidx .ARM.exidx.text .ARM.exidx.text.[0-9a-zA-Z_]*)
> +	}
> +}
> +#endif
> +
>  #ifdef CONFIG_ARM_MODULE_PLTS
>  SECTIONS {
>  	.plt : { BYTE(0) }

