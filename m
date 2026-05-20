Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B898CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmdRx/OdrSP1/4dyRKCY69ICjkv+Bj8XRKzIDVfemGg=; b=r+bj9/89YADy1oRVP1T47kAyXP
	bXqJ7j3SNHqzOnLVN/KEYtG3ITrGjVdq7vVr87u3w/nR85y6h7bW7pCIUWLdZfgfS9FxStAWe8bHP
	E2Eiyxwhw+B+zvtiqGssud1kAcNZ/nam85BnFxK2fdArHK4KeRnq8aaGg3hv09Ns3F9N6RcRYcxwC
	iDifevXK0Tb0kkvZ10mY05IljFWbrTMFg14Wh2+rZS9wzOcXUtMmW3Ee5sMwenlNcFbtpkzx4IZV1
	8vc5zGB+ETX5d2fHuyNs/hKak03vg+btKnWlE8QAJxPmrt7sG8wkCCxB3f01p/TgE1u2eKy1ubIAc
	Nr/4hEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfUc-00000004UPj-3rdw;
	Wed, 20 May 2026 11:53:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfUX-00000004UO6-0yF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:53:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9983660121;
	Wed, 20 May 2026 11:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41A41F00893;
	Wed, 20 May 2026 11:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278016;
	bh=UmdRx/OdrSP1/4dyRKCY69ICjkv+Bj8XRKzIDVfemGg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=idZM0bE/7jeP+u7JHgjwOgmxfkB4wUoX7W//ziKz42bvT7Nrpd57hJfG7jV2AkVtc
	 ntHxYjunwe6sK9F/VXw+e2DcE0aK29qNs6dxuJdNUC0SQMee25BoGkTD++kwd/pjlT
	 D0e+bHGokGLTw/+u7pQ4agLn/0rPFlq+sdaeqqm4UW4y2r1FUEh5XcLDYqFK37mTj4
	 g2fm1MjLKDSs1jJ5HtAsXeYZ0MT0zEoZ9q/g+J0H3h3H5OFMN9GkNzpI3xlQ/gkhez
	 yiZigo0A6qrN/vDGddrYPt3bUYn7bxx5yQcG51HcI0iFLOieT5RXU5fAh7IeGYAe3/
	 aBoKdRfY56Iww==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/7] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
From: Mike Rapoport <rppt@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
 urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
 dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
 anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
 Wen Jiang <jiangwen6@xiaomi.com>
In-Reply-To: <20260514094108.2016201-6-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-6-jiangwen6@xiaomi.com>
Date: Wed, 20 May 2026 14:53:16 +0300
Message-Id: <177927799626.3551615.13339231881249812474.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=540; i=rppt@kernel.org;
 h=from:subject:message-id; bh=bLYkbD2AcHPKVqpNELHBVm4UX2ClXw9oXOGt8n5E6Yw=;
 b=kA0DAAoBOQOGJssO/ZEByyZiAGoNoLSjfl2bUlyBf32591rxxL4PnRAQCLMN4ZCiDoV+N6WkI
 okBMwQAAQoAHRYhBHjlWFWlmS+fdNGv6TkDhibLDv2RBQJqDaC0AAoJEDkDhibLDv2RZF4H/1AS
 Irra0SwiZ690MYluiEqMdTFz8pq4s4d4caaWf5YL0fuyEUZJrmKaWVz24kXscZL7yRNYrks+9fL
 Gc2UOa/HWUj4DoVbTae7PdfggIki328ofVlz9KiJyyPt/3JlrQzc/6jOTkXHMAC/IXilk+KeZw2
 9z0vDoywOS/Jo31fqDj4jOSl3iH753qG2CSkNmMWYlxAvwuJsOOrRbIPGbsoKn5/IFHPMkegaAJ
 gF+AbdJgTi3vvNc7Id7LNHcoTXkDHOR2lcFgxTGEgPrJQo5HYX4y7bjMeovGyJ8Gjbsf8bOKL3C
 fgYuyU0EuoDkkz6uhIswXbAMuJDzIFbSiWZZFGc=
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
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

On Thu, 14 May 2026 17:41:06 +0800, Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 516d406507e9..c30a7673e0ac 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3520,6 +3520,77 @@ void vunmap(const void *addr)
> [ ... skip 25 lines ... ]
> +
> +	return order;
> +}
> +
> +static int __vmap_huge(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)

This won't necessaryly create huge mappings, maybe vmap_batched?

-- 
Sincerely yours,
Mike.


