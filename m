Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF5FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 02:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Njbz1ZCRdxWo32AbPbTjAtv4EdlkoZ9UGiPpbN/Wgqw=; b=XKRPa2LFkxc0RDKAzad3WWmAj/
	6WX1PvsPRQK5nvyNc9Ep//yLLHLgqkqRjv3dSCNeFdMu4IBi7uz9wn9Rwpwl4SQdePu9BQxtIRgZw
	Rvxv0UsAo5afjwF36BmStmvk0LmWtvN0unig2Gm9NuDk7xrEZ059TvQHQbX8UZgP7JlaJ/DHj2W3w
	7yrXqDIDYeSGCN3uM7JkVkALvVOyaacla0EwBehPRDxdVbrXvplJho9t8enTKAwi2vKSz3gk4/0HX
	1J52pBtttbACw8gIpQpcMPcHuxy8S3Rx5FSEE9qm3S6ld8P5YGPV9F8coZ5oSpS46eurfh2prBIP/
	/pEJumWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePbx-00000003sZZ-1SdV;
	Wed, 23 Jul 2025 02:53:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePZR-00000003sPH-2Ets
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 02:51:09 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-748d982e97cso5550155b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753239065; x=1753843865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Njbz1ZCRdxWo32AbPbTjAtv4EdlkoZ9UGiPpbN/Wgqw=;
        b=MgXfR+XmC3TlNZiEROxo1pETkDodVFbjGVTzmJ4TmvSi6scvWXDl+GP1Du1O1QEPgh
         BKXSJlnAROLNVGkZ8vDiyg/+2QMPBpxoDANNwCNvwfjZl1FpHx95d5Hlv0iG+pYwcCR6
         imDonZR8Zmxx1Ep0LbjhB9E51xCAhRDTcTYFeWkUNHOY2MeJgcZTzZ6XnipL63/SJFHC
         dk2qEDN48lC201tAI0ed3BDju+M7ndTHaHX4KuFJRJhBW7GTCJTncXvvPI3SHAO+K+ZG
         jBMcwnPcOSBWfX8h5OZkS0B1XavA1JjbJc7kykpI5Tmyoe0mTE6NUE77wJ8gTTDN28rn
         fB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753239065; x=1753843865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njbz1ZCRdxWo32AbPbTjAtv4EdlkoZ9UGiPpbN/Wgqw=;
        b=EHrNUWl/m73LwatZpiIrz5XOgeokuUv/UWGdTjK4La4WACQSzfOO4doS+zLrR54s2B
         XKP+4x/SW6k6SZWJ3exGqUHIfmF13DxoZSupHCB1yQz/mYlOM5v5gY0f8H/nldkSqz5J
         CUAfM95iKSkXKXtxLnNdRttZrSuGOpm47uoi0oCdy7YU9RYFklPggrEs6pUiUjEnuRUz
         nS88LmMeHIBKqQRUn+PjI3Nq1tS7llR7TMTnOqjAIiYy3HkPczdvjXvE/N0FpFDD/czQ
         jifNep1yEx8+eFYfxseVuPx2evUBp31iuOKqxs3ZLeKcB8YD8GmRZCCMe5eUgJUszP0/
         tmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSkpetCrY5YzywOLs7COhcdXm3BCiEb8hnBVhfrR5bs+z4qRiV7syl3niGeSDIvPF658ZxFonBE+PJfg3LhMKE@lists.infradead.org
X-Gm-Message-State: AOJu0YxHuuhpS0VqAp0//s/dZEDQmc0hhIaW2clzLaJqjzX7xl6S+WC6
	MYQkVVoi0u02qnqom/FVPBIs94Os5p/TgcjSuZCDri2yQ8T7TAXZ5FDrJAH+2T3kI4M=
X-Gm-Gg: ASbGncv9Zu9wRDwClTuDuPDByoAvTTbG8TjjioHoPV1q1cu3WOnQ5p6nMJlk+8XK55o
	vrmF6+wpiyM53EMtTtwTOh9LMixLnLxlOHO9en0HBKxrvQS+2EdoL5warOcUj0nZm0rjmCyqjHc
	ExA+lqiDvSXoDf/NE9lUWl2sG+nlm30qFp4hS98V5ZItNebeP4IVUvlOSvlcIYwCfa4Tz5ycnhQ
	TX0xMFsTLgjs28q/+WTEbIijy/kfTn0Mz2eGvYe1sE9jNV5mT7Q3UbMJEbKMmPKpNIA+tHAKUej
	2DcpTSJF6OpCMtG03JIYv3MnoSuChA5KHqYhBWoequCqVDaAtIeu4/Vb5k7XALNFxC7DqI4YNrR
	F0Ed3t126lV7Hmaaw+S37zk/iKzqZAe9UgPwnAgKy
X-Google-Smtp-Source: AGHT+IHpuYhVl5YmWu5fXh0L3TBrW12X/BLK3whPpjge727ynUybGgha6/nx5iPQ68Qb526e4QMHUQ==
X-Received: by 2002:a05:6a00:139c:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-76034a014ddmr1950124b3a.10.1753239064659;
        Tue, 22 Jul 2025 19:51:04 -0700 (PDT)
Received: from localhost ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb1546a6sm8575236b3a.92.2025.07.22.19.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 19:51:04 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:50:55 +0800
From: Weikang Guo <guoweikang.kernel@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Ensure phys_to_ttbr on pgdir for
 idmap_cpu_replace_ttbr1
Message-ID: <20250723024923.GA1884099@ubuntu-virtual-machine>
References: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
 <aH-mlN88NrTzahfM@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH-mlN88NrTzahfM@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_195105_577326_716B1632 
X-CRM114-Status: GOOD (  27.55  )
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

On Tue, Jul 22, 2025 at 03:56:20PM +0100, Mark Rutland wrote:
> On Tue, Jul 22, 2025 at 04:21:13PM +0800, Weikang Guo wrote:
> > Commit 5ffdfaedfa0a ("arm64: mm: Support Common Not Private translations")
> > changed the contract of idmap_cpu_replace_ttbr1, requiring that the TTBR
> > argument passed in should already be processed by phys_to_ttbr (i.e., in
> > TTBR format, not just a raw physical address).
> > 
> > However, the current map_kernel implementation does not always convert the
> > pgdir/ttbr argument via phys_to_ttbr before calling
> > idmap_cpu_replace_ttbr1. This can lead to issues on systems with
> > CONFIG_ARM64_PA_BITS_52 enabled, as the TTBR would not be properly folded
> > per the ARMv8.2+ requirements.
> 
> For the cases below I don't believe that this is actually a problem.
> Since commit:
> 
>   453dfcee70c5c344 ("arm64: booting: Require placement within 48-bit addressable memory")
> 
> ... we require that the kernel Image (including any trailing unallocated
> bytes accounted for in image_size) are below the 48-bit address limit,
> and so there should be no difference between the PA and TTBR format.
> 
> We could probably test and enforce that in the early boot code somehow,
> if we're not doing that already.
> 
> If we were going to change things to avoid accidents in future, I think
> it would be better to enforce this with the type system. e.g. we could
> have a ttbr_val type that's distinct from phys_addr_t. Even then, for
> the idmap code I think it's better to avoid the phys_to_ttbr() dance,
> since that has runtime patching.
> 
> Mark.
>

Thank you for your detailed explanation.

As you mentioned, if we can guarantee that the kernel image is always within
the 48-bit PA range,then there is indeed no real difference between the PA
and TTBR formats in this context.
In that case, does it mean that the conversion of `reserved_pg_dir`here is
also redundant? (There may be other similar cases.)

If we already ensure the kernel is always mapped below 48 bits, it does
seem safe to remove `phys_to_ttbr`here as well.

.macro  __idmap_cpu_set_reserved_ttbr1, tmp1, tmp2
    adrp    \tmp1, reserved_pg_dir
    phys_to_ttbr \tmp2, \tmp1    // This might not be needed either?
    offset_ttbr1 \tmp2, \tmp1
    msr ttbr1_el1, \tmp2
    isb
    tlbi    vmalle1
    dsb nsh
    isb
.endm

Thanks again for the clarification!

WeiKang

