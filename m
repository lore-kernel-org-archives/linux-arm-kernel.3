Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6908FC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pz5XMLJlH/ksqI/ieLps3ISvdTbA9aZ9LqHyagA1F+o=; b=avrwLcfrVum1E4Fmr6DKc3t3vR
	ybAXgjN1pSo6CVe/exAJy3+2BjR2Ain+Aew/4KvpMb4WLK2Iod+lFduf9OsCTRWYo5hKLPb5ec5T1
	92BTyVKtKlJGHrG34LfMgAGpGhlrRYC2hgncAZsdCH6dd+JcsEOPuNlCC95PkgxHVutREFgRCC+kI
	MuvzEZ0bFcdBDvdtErBhXaUjNEZJog+5NUf7abMV2vPTLJdju4+r7+9j2A1sYfsJAlSVXKJbB7Wk1
	TIo43iBYLZXPYDUt60jhrJ/+TnHsbNcqfoxmHEx3qAPoEy4NYVMR2TLt8305YS029mGXyqi1DsP5J
	E3gjBrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yUc-000000059kF-3B6W;
	Tue, 22 Sep 2026 11:16:58 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yUa-000000059jb-44Rp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:16:58 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49953abe51fso25109175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075814; x=1790680614; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz5XMLJlH/ksqI/ieLps3ISvdTbA9aZ9LqHyagA1F+o=;
        b=cbKGr4vWsHvklW8HbD/vC1SwrYeWigJcQQBIHaijrjiddZ/JBE1u4Pn47cGE4IXFW3
         Jd5I5CE6A7d0f/9Pdf780yZs8gdec4vHjmmFud62NgBoSSEub4jDJ7z8UXWvrvXgZF+r
         TO52hy8Hcea5evbPkbI5dJ8OMGTTV6XdGJOzyN5aSe0+iNNgUCctBIjxta/Sq+vCnE3f
         r9YglTRCgsBcOPQvjszvi+nILsnDbOs9ffVCs4X+MNlbPcjkE2aj1t/S9f0wsRlN/tfI
         EtLVvIwy6fZm7ihCkOEdP147I00/r7tp+EfC4ocwkrQ8/6ayXS2CTaDd9xa9NjE69fWJ
         E/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075814; x=1790680614;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pz5XMLJlH/ksqI/ieLps3ISvdTbA9aZ9LqHyagA1F+o=;
        b=ncmRFeyrdrBBywooKEpxGx39p4HG/lf8JKrdArz1LbV0vQKLoPebCWcGhDZ3D+4xRp
         H2xzMVOAw4ZRbbXX8emstF1KPUmb3/5N8vXLFCh1ggG5Pf22UTCOlwKO9HxMvAbVuODF
         evF9N5UFil64cFnmRB9ORPDfSuyv9rnYMFJJi5TgPUeXu6lA2VJLx3xBwhrXKB/Gsw5c
         RHmWuvvR6TiA4yUcaYTBqPcNmWWsXmfhtxpbz8oO85jXebN7wRkSqbtQTiZCos1/6qTh
         RPf8wZIUbdInqBMFDl6d/+hEfg/1PIAl8VygRcWvopiJ+KVlif6dtCDNQ7SqNeaJOW83
         smzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/NLTcSkOBnz7dxVoXMJCkdnAfsdvUMpyN47GKbGhDFb029A0OKcFTQRy3Z/kQQhOXtL0Uzkve8r5nNXhDGAV8@lists.infradead.org
X-Gm-Message-State: AFuF++k+47NZ5khPJOA0HNwLLpdYg6zV2KElZY/IkqYJ+6I5/moxkJN1
	ZjweiprEu5D3emEhNadEimHD03z9tO1rBRjZoObX00jBglq318CYzwOYubJ9UYLyYIQabp3HtJp
	2uw37GhND8+DtU/FyYYWJtEbtuw==
X-Received: from wmdp20.prod.google.com ([2002:a05:600c:5d4:b0:49e:8337:332])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr246286785e9.8.1790075813829;
 Tue, 22 Sep 2026 04:16:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:16:52 +0000
In-Reply-To: <20260921165841.93EE21F000FF@smtp.kernel.org>
Mime-Version: 1.0
References: <20260921165841.93EE21F000FF@smtp.kernel.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922111652.1024606-1-snehalreddy@google.com>
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Vincent Donnefort <vdonnefort@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_041657_038591_00560B47 
X-CRM114-Status: GOOD (  12.30  )
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

On Mon, Sep 21, 2026 at 04:58:41PM +0000, sashiko-bot wrote:
> [Severity: Low]
> Does the missing 32-bit counterpart for FFA_FN64_MEM_RECLAIM2 break
> FFA_FN_NATIVE() compatibility on 32-bit architectures?
> 
> Every other FFA_FN64_ prefix in the header has a 32-bit counterpart. If
> FFA_FN_NATIVE(MEM_RECLAIM2) is ever used on a 32-bit build, it will evaluate
> to FFA_MEM_RECLAIM2 due to the architecture-conditional logic, which does
> not exist here, and would cause a compilation failure.
> 
> For 64-bit exclusive ABIs like FFA_MSG_SEND_DIRECT_REQ2, the convention
> is to omit the FN64_ prefix entirely.

Ack, I will rename this to FFA_MEM_RECLAIM2 in v2 to follow the existing
convention for 64-bit-only ABIs in arm_ffa.h.

Thanks,
Snehal

