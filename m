Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD3E6C5EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 03:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIOFihO5lZulDGiIo9cjka3yr/GB/wNq1xFLe4/g6UQ=; b=zeYOIxgIY6AlLhXuanM46GhfF7
	EnHPmT5/xlhCXW+zYqG/bd9ittdg+AwJ3lt9COx4oXmSg4+bqx8KcsH8zTl9HWj4OeWLioL0koIAD
	B4K1jE+jRUfJSiLWFeF/rdgXcEigSs+BD0cPhKyl97gkBhoQjhvEIOBsW321EqRIZoEntuwokP40c
	RSXVSlw/QKBZSuKKdd6RyitAkJasc4Gj0gTfx6SJ9TMDLwMnfAtIQSZHdygxoRNkNtr7RFVqJ/PLj
	7eBcRjzhsZLxYF4u8x33k0X0nK2yOy5XvHupyi0IWJPLByliZ1n4UG+oUFDP5KXt0CcmLprmoptx/
	Xssp1T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIJQ6-00000008670-3lJI;
	Tue, 03 Dec 2024 03:17:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIJP6-0000000860R-3eX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 03:16:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cf3e36a76so46879095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733195808; x=1733800608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIOFihO5lZulDGiIo9cjka3yr/GB/wNq1xFLe4/g6UQ=;
        b=e1vu/fM6c331YKIKzETJ6yZP1e5sm9fF+lciFWgy38fco7Ebvjz/Y4AxWAQkCTbvN5
         CYJd0cOrVkd1yhUI8xrmi9Ooo0fMMtKg+qX0gpoo4p5WjrytjwAV7phuGe/Wc1E3sTRu
         vvgrylDxmaJznVctDLTUMpg8B5e9f3suumkJUkSv+/QwEtbzqQzRVMX8zXJ4kyQ6G1MP
         MOuhPe/yAvWvIG1Ks8dkwziSUYDP2VmdCKt82CnU4QFPgfRzM0/+qkpwYn9oKO6b5kN0
         r9I/Y6qyiFyvZUvALQgA1chlPw5RcG6Jf7R5yU38qXT0IC5VkYCT/0iHEUIiyAVg7eDE
         0a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733195808; x=1733800608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIOFihO5lZulDGiIo9cjka3yr/GB/wNq1xFLe4/g6UQ=;
        b=bnkvOtPBLmAXZ7uVP6t6vJyanmL+mrXuf5HrDsEMtEMilTz3fTL9EAhCge/v7MrE5M
         QTGPYX/zclWgGIis9F95z3zZWAwze21CMGloJpAQz4idk2g8hkNfkzNqxvhqvcA5cpaH
         uxFv9wwW2Ac8bv3yDcj/BKNDO7RLii45v6fmom1O5Vz2fgtckqfK31pLhfjnlgVZ4Pya
         /XISOzh1yZbBCviyGXOO0AUyMwvB0N8Ro4jqz6rK8FgmMJ7t9ls5WbjeGjWo7fXotqFi
         zRFPagaFWUgsjGSuUMKJ4rv/UoVebhpOQ5sHpl26gr+wzfVe6wu3GSLK3hO/Fwfs8qzo
         TIwg==
X-Forwarded-Encrypted: i=1; AJvYcCXEc/n6I8Lc/1OXym3Rae6wAYX7WjjMVK1IlTVXKg7wsttH+T2Rwhd+ZjQK/idwVaN4cFq22n94X4N/WNAe+j+T@lists.infradead.org
X-Gm-Message-State: AOJu0Yydz4u7aQcCVo1E+qUoVTYvxmSn9ug3JcMg0Zd7rq97HQu4pc2N
	m/Oyi1rDwEEorqV6GgEOhtP9Q9NztorA4CPVwm6XHgoe7HTcYKt4
X-Gm-Gg: ASbGncuoajlKbV7cf16bE+Hx5Z/TjnSKWr9vT8gx+VqWOsUO2VJ6Prs+ogSWv6BLY39
	qBDQy/vWdCdCMO+HnzG2xO9qiFQ93Fp9dD+5QOG2A93R746nI9dKHPVa5SjQCFHUq/iToECQl3Y
	13FV3jfIuyzZKL6jBu1zXQM8NN2HNXxKBMFDYHyXFIVI52A6oJTJSoYczg0tW9yNPgNl6GL1saB
	731g53ZDksAjPePttmF5m4xNJO9VHiaRy1Qjqq7WyA4x9I=
X-Google-Smtp-Source: AGHT+IGkajd+wXbub1dVhniWHfN5HNxSkBjvscahKPLZ0y3K4evPJwTrTBCiH7ySlVKJBh8wV2JAqw==
X-Received: by 2002:a17:903:228a:b0:211:8404:a957 with SMTP id d9443c01a7336-215bd11c778mr13695595ad.41.1733195807686;
        Mon, 02 Dec 2024 19:16:47 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21597c5baacsm24105215ad.96.2024.12.02.19.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 19:16:47 -0800 (PST)
Date: Tue, 3 Dec 2024 11:16:37 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241203111637.000023fe@gmail.com>
In-Reply-To: <20241202183425.4021d14c@kernel.org>
References: <20241021061023.2162701-1-0x1207@gmail.com>
	<d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
	<20241128144501.0000619b@gmail.com>
	<20241202163309.05603e96@kernel.org>
	<20241203100331.00007580@gmail.com>
	<20241202183425.4021d14c@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_191648_911441_719E2FC6 
X-CRM114-Status: GOOD (  13.15  )
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

On Mon, 2 Dec 2024 18:34:25 -0800, Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> > I requested Jon to provide more info about "Tx DMA map failed" in previous
> > reply, and he does not respond yet.  
> 
> What does it mean to provide "more info" about a print statement from
> the driver? Is there a Kconfig which he needs to set to get more info?
> Perhaps you should provide a debug patch he can apply on his tree, that
> will print info about (1) which buffer mapping failed (head or frags);
> (2) what the physical address was of the buffer that couldn't be mapped.

A debug patch to print info about buffer makes no sense here.
Both Tegra186 Jetson TX2(tegra186-p2771-0000) and Tegra194 Jetson AGX Xavier
(tegra194-p2972-0000) enable IOMMU/SMMU for stmmac in its device-tree node,
buffer info should be investigated with detailed IOMMU/SMMU debug info from
drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c together.

I am not an expert in IOMMU, so I cannot help more.

Without the help from Jon, our only choice is revert as you said.

Thanks.

