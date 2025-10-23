Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0812ACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=; b=bsn2UXQ7cqHvKxeSA875xzEbX7
	Hf+hF1YVmO70e0mzMS9OBkcm4DWe+BjfwuPqeitJdTtrW/eiEBuE5MiW6SrZXRwBL4bO7n4RVWO8V
	Fzow4UN0idfinQIgU/PjD1MEvAsLc0uios4ObagXBHcd6Mxnodp+aoMnGBGr86xhacsZC/1yio+28
	dyHkpWWh47gjq2Udygekco+bQLbmnL4wBE581HPJtbltpf6fcDJlI/qlx0ntJq+YjoPesYGpAdEAx
	miGpTCK0uOJiNjhjTMdSpzDmEe/WGqirqjs4BAoFesi9u+143umgpBsfJ+481Uj3sLrNhEPDGx5h2
	fzhlfKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwFX-00000006aD9-1I1T;
	Thu, 23 Oct 2025 14:25:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwFW-00000006aC7-3PCG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 14:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=; b=O8HrgTP3jEOqR7OqEVSxronQwd
	4lFgtuo4E5s5JPMOQYkaQg6uQPIiDDm2koL+INNIZ5RQVg1UsrTM9c1jwX7zCzv9HRu5eKlalxy9K
	efDILwKCQC1zrK7D+4wnmHNin6AXC3i0hGyAivuZRJ+SGp3XpON2Njl9VUnpBOdnp4Ye7cUHv0EN0
	Dq22CUzKNnpSluclUzVkiNXg91VM5R0P+3M6+hlneW64O2yogwCLqExYB76rF9sV0zgy+1wcvY1yC
	q1Xie1sWSRANAl8WMN9g3dM99x1eFndhW76TjpraHfM+3Sl+SNQy5M6C8HRM3ArHKrPPY0M4YuKSY
	R9/0sBwQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvNo-00000001PVe-3XW6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:29:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-33bda2306c5so898730a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229501; x=1761834301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=jr4Dt0ZkkDjOYze9zATZI54O0aHYSbfXQSEeVPM8cgNtHCt71w2A8hlDBJ7bGlEL1y
         okfFxpNx2CQMe4cQhAgcOjpWFRZNbKlx1Edts99qWi3hEBekYTVeEBDgf/OaNEqPysyQ
         2ZKS8Ow0uglqtBpFzPav6SB7LcGbtS/gLJqO6gV6XTbg8ZolNfzK3PzBfXaDy+1NsaDJ
         63oaIH4y7qY3jP0FpO2AyPx+GGuyZ4pGi2nf1hkFtgEXSGwWLjFdCAHIIm+KF6FF4Q5w
         hsb/zef739n8m2jd50DxNKKi86ZhhLH/SJVFnLzPNbZ7taFYWVXnSTdvll4udOyooUFT
         RzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229501; x=1761834301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pf/H8hwwjXHOcfEd9IHK/0BwkuvQECWP59//+xIoOuY=;
        b=C1hKIIU5gpGTgE9NFCwZbkcLcc/p7bC/U5IqBz95bQEXaVInS9aSIKPAzAJzdgeC0b
         RDCUF8X3Tq1dspKh0LRyf5drLyq5JZ2Fxfe1qpjaguLW+ocoVUEwOsVqKXiDMSAHlYc7
         /6Bnsnf+SuKmTg5ka3/e9xIywyOUiy2JJT7PljrpOQ0x3Q63/hQ9BkNMSlsGX1w2T5oT
         xdvAurU5V8qe6CjvEk22uGPBciORTmY6Q7/KayAE0w2IAH5SQSjNtgsAqp9Dk2eTxIiJ
         x0Xhi0P38dbvwRwFqHSJS0k6kWS9q/bFtdalPx6C9tG1fXQWMXQpMQPlHGmlD8NVrNp7
         ebyg==
X-Forwarded-Encrypted: i=1; AJvYcCVW13ifPIpJjMFkGM4BIoBw51al0fqUO9Ssmt1jG5h53iauu4yxmqq6lfmA4w6Z6PkEqhRrDARr4c+aVRv/QpLr@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0xWA8H00kywblpQNx9wiUBBg+wPrJhrxgYO3t+a076KaHS/l
	A5s0+p0J3T49RdgVxQA2ybs4oLpkF2R8KN0q6g2FcmShhBPvZgDjBxSq
X-Gm-Gg: ASbGnctwVwaaPaxv+Qc7BIFx9QyflXvUXKU+Td5IaBlZuYSgZ9Q+JqvQDb33NtbZHYP
	gYDWt9tpafM/wseUgDvHDVievpVekiJroBhWFFpvXSaNr4mj3XYsqVMiZaEOV0MbnBv71iAKD0M
	UDREVh45u9sptZq8npO1KM7Gf2I5fKFNzGFyhu+x7hKhuEuVkytElEygP+3Llczi8Rz8QylXLGT
	LvCEbFqc9r4qwe+IO1qwcJrBnw5uBNYcT+GD7l9J2xfZQbjzGIiEv27bLLIBaBOclsdNPitAIHX
	04RlEwS3U/BdZPA+gYvhkwQtFs/va9keEsu7SEz6nuaAN7NEefzGAogtqi1tjkLrKIwy/FkgfxU
	u2PefS8MVmHR0wL3siBitWnvtjlx/NEq0sHUg44OALNDcih3f/BEX5VUdVaF31JRLVwKgJevKt8
	Ul0sVQh/IY3yFbPpIg3Q==
X-Google-Smtp-Source: AGHT+IGe4BeM9/pmyB243lXYseQKK0oQC2Kow3UQh2Om045EVbmJQKLCQhmwXMTvnHHyQoLOWJ+UeA==
X-Received: by 2002:a17:90b:2d8b:b0:32e:d282:3672 with SMTP id 98e67ed59e1d1-33bcf8e4a07mr30935358a91.23.1761229500703;
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb0191b1dsm2585682a91.18.2025.10.23.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:25:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lkp@intel.com,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	rakuram.e96@gmail.com,
	rex.lu@mediatek.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in mt7996_msdu_page_get_from_cache()
Date: Thu, 23 Oct 2025 19:54:47 +0530
Message-ID: <20251023142449.117936-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: aPoqiioo6kUZ0kbY@lore-desk
References: <aPoqiioo6kUZ0kbY@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_142936_997585_FEFAA1D5 
X-CRM114-Status: GOOD (  15.72  )
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

On Thu, 23 Oct 2025 at 18:45, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > Smatch reported a warning that the NULL check on `p` in
> > `mt7996_msdu_page_get_from_cache()` is redundant:
> >
> >   drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
> >   mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
> >
> > The function first checks `list_empty(&dev->wed_rro.page_cache)` before
> > calling `list_first_entry()`. When the list is not empty,
> > `list_first_entry()` always returns a valid pointer and can never be NULL.
> >
> > Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
> > code.
>
> Hi Rakuram,
>
> this issue has been already fixed here:
> https://patchwork.kernel.org/project/linux-wireless/patch/20251014-mt7996_msdu_page_get_from_cache-remove-null-ptr-check-v1-1-fbeb7881e192@kernel.org/
>
> Regards,
> Lorenzo
>

Hello Lorenzo,

Thank you for the information. I did check both linus-mainline and linux-next
branches before sending the patch. 

From next time, I’ll make sure to also check the subsystem-specific branches as well.

Thanks again for pointing it out.

Best regards,
Rakuram

