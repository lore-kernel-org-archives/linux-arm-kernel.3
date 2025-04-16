Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6029C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtCepilI5OBYKPwI8IAZ8i1mwTcn2lnNiKdpddQ34xM=; b=k/S2iXEbAb4hPQeZ9QvDioQ4tg
	WrjDavt3MfKAf806oo1siDA/ulwU3N1rzMdpc0JXwpyXU9QAMQtoIZrHvOGLYDwoyqCXc4QyUmUe4
	k5SvOBJc6jw+mms0AC3hbuFej1aM+uFZ+XITWRDXQ1WbtbmmzjHyB4vTwvKisNRiQyeWQsd6s7Clk
	viwucM/ZWMYSK05NhbiTCi57/TOEy1nwZi9u5K4lMOhyMB8T+LvOAjLpFbufx/vIFbPD/1UCD3TrU
	WVSdO2JTNTVZgri+mIOoIUtfeyQqTtvzxBkOp9H835SV7Bf4zn5/JrbBKeUYe/lqNFuK3v7tme6ZY
	8vCOS63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55vt-0000000AJum-2gXs;
	Wed, 16 Apr 2025 16:48:17 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55K3-0000000ABuH-18en
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:12 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso575298466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819749; x=1745424549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RtCepilI5OBYKPwI8IAZ8i1mwTcn2lnNiKdpddQ34xM=;
        b=haCtW7hOIU7373pag3CjdSJfhm6jJVUkFCznQxvFvp2Dm7dxZA6QSlzGqD63gV3m6o
         5AKmOo2DBxBTcuYO4pHJzxrYAxiE3l1KH0JHcQC/9xSZ5ta5fSQv+fQy/bMOMOFQ29S9
         RadzWdcr/YK7Rk3lSu5ciiLkL+JZn7gzdnw2LXKfrR0yH9VAciZdbg3WQVgtpfS6rZsn
         pp/8whhPOgzGSqmyTN/jemUKvmYj/undYmTpt9YU7Sum1v+OoVXGJYiDYwELCCz0ktRO
         Y7uFBIFH+cFzVrKqmi1whoMM3z8iY6VVBPhfGrGlRjmFqB5B16YATIKxzo0cZLRiPNnk
         zdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819749; x=1745424549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtCepilI5OBYKPwI8IAZ8i1mwTcn2lnNiKdpddQ34xM=;
        b=tIBptrFoZpCn+zBYo3mn7f2mS1JKR3HyYv7AqPc8etincDkPVWGN86U+0MKrI/jSCl
         abePiGY/n3I9Ww8rmHai768F/S9lmyYaYgmnMqt0pgFZCKiAylP408ajW6AP+W/LFZMD
         1WYBgH+xr6aMdLeEyxRdhd14cV3I8fWnu8EHb1Quuk3TSVV4oRCA6FD81kcYsEe/IZnY
         dbGKOk1DX/08nKpFGBVcW+1IZcLWyeWuaBJ81VBtFRgcYgfQMCZwsygw2sve/wLAhsOa
         nn+IyTcVnuD6jMalCy2NdSc/uqvCFU426gRNpMLSgqPaGMtc0T9vPw/FAWa2H+2dqPWi
         Ofow==
X-Forwarded-Encrypted: i=1; AJvYcCUlh17Nu9KnPoSxvlRwgwyxv9aIv8zSKSkBNNuEn86m+JDvaJ7Qyn6cFqEWeXf9tLcYV7BihTIzSkSsXzDDLg3U@lists.infradead.org
X-Gm-Message-State: AOJu0YyvbsMKGRnvfv/O7mt6O1ku5I8fQgtqGTr2MVj/fR+So0mDxIJQ
	TyC9DxP8KD3BzPaFOCME3PGT2LLkjks6QsWiSAvdJ1zx7E9HilEdWOO6hNJ3w+tq7FNpaZp8rsd
	aOTWKzg==
X-Google-Smtp-Source: AGHT+IE8dk7jeA22VzWx81hj6NCNcV+aNpnoCWIVeIKMbzFyUD7FL3Q4EHx6osWargcZiCuELO7brSsBTvZK
X-Received: from ejcl9.prod.google.com ([2002:a17:906:789:b0:aca:9c9f:6358])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7203:b0:ac7:82b3:7ad
 with SMTP id a640c23a62f3a-acb42b6bb71mr224251566b.46.1744819747999; Wed, 16
 Apr 2025 09:09:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:08:58 +0000
In-Reply-To: <20250416160900.3078417-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416160900.3078417-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-3-qperret@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: Don't WARN from __pkvm_host_share_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090911_309176_E5D20394 
X-CRM114-Status: GOOD (  10.65  )
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

We currently WARN() if the host attempts to share a page that is not in
an acceptable state with a guest. This isn't strictly necessary and
makes testing much harder, so drop the WARN and make sure to propage the
error code instead.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 709d286999a1..4a0f98943577 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -921,7 +921,6 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		if (page->host_share_guest_count)
 			break;
 		/* Only host to np-guest multi-sharing is tolerated */
-		WARN_ON(1);
 		fallthrough;
 	default:
 		ret = -EPERM;
-- 
2.49.0.604.gff1f9ca942-goog


