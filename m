Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D187CCD182
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VsntBoZ2UX1thgOJTBqIcQGNGyw+Zp/ZR+M9plVUyY=; b=wdVMUlhdEuiH5q7O6RTYuaIpOi
	PDU0/XGiE4wSONzkU1ieQ/pd+mzmZxgweSUtUdP6eQ5hQWgeR+YZeiX4YuAvrZp45kdSSCDjkkt1q
	nAJzMlU8wXo7oM3eIS6J/qiPDKjCA4CrX5Pfrt7cF+ZabaqkWL83lReXKOSF2DjbVUftdISJKOteq
	b2yFIkAG3u0Ih3mraqJfCNYneO0PyZ/0zsNjtghaSRKjs4RmW5LW5BMnxZCD3NmLn9IHfp35KhIao
	t0gIu8HdZqfXyif+1bb2MNVtKB6MvbKQ7nNUJ7S3mMLbt3jEKivtWK6ea0+8lyME7XCXk8x+fDozn
	zDWlYVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0Z-0000000CQwb-45Bk;
	Fri, 03 Oct 2025 13:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0H-0000000CQTM-391n
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Oct 2025 13:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1VsntBoZ2UX1thgOJTBqIcQGNGyw+Zp/ZR+M9plVUyY=; b=V3Il7amfhFIeT6KKGbcwOlziHM
	Akb5WCcFRmWgxkEVlYy1/4jmU8nmMmwRUNSh0VIqZ18fzdHluUDIdiE+Hon3CX2qjeb6S20rbwPSG
	sZh2gCK0EMKKRnjt2iSeLAO2+o+wT1rjCoje/uouk2OmcU74zD6n3lHs5dNh3eoW8meKzO5mc/cWo
	I9UErSC5+N40f9arLWXkz3Ivu1jJUIHlvX5oSXZ9BHRL7upPLFXe04/5iUdkwFwIbc3pVvbBly19j
	l+PCMPMw3AdVoeWxNr8pYTSUdKGh127ckiMY+OquxiHof9aUi9lxxQxQiXWw6vLhSykgd5qojm8DL
	Rn/x2m3A==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0D-0000000Exlv-3x2H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:19 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso12174335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498755; x=1760103555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VsntBoZ2UX1thgOJTBqIcQGNGyw+Zp/ZR+M9plVUyY=;
        b=N6aecMEi6AgDMe6WmLaDgvOP8iqzicLdV2KH42ucZ3yXLn4DdqQ0EXQ1XTuFTE9KD4
         nJbMYXjpRpiKgbqy1ptLgyFk8RY4V/nl7moDQkqxdfN3hdqSUbS2uBU/vc9wpJKQMiwy
         7vAeDncBaxABeHgKYNFjqLeGHIbTQioanQxLu81vrVLXMSbTq+kYqh+cMZdOwbamXTBW
         4+VQNFQK6vXbOer4FQu7N4e3SVm9fuKGlTTLNZCv5rqr6mDe71alQI7GpPcPXtbxW9Zy
         cqSQK7OYfmFNIUlvuTCHj9zcDcDwlJyQvGILGifS+gWcw9j411AsWdSQCmA3qv9EO5AC
         UlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498755; x=1760103555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VsntBoZ2UX1thgOJTBqIcQGNGyw+Zp/ZR+M9plVUyY=;
        b=AOP7u6m/AmDjoKfcPiEWyx0By2CYgVBvlPubuRMkpBgPXzVqUA0eqUSnYGoIYMccmi
         wjPA4rCW9vPLD1LrXBhznWdn8hQ0wWwuAeH00sZgTPLmXfG8fxo39Mr75sy/PnQkObYN
         uxy7zCMM7PeVyWlh+fxAL6vYk+wGhFb9Ehho1gWS6QBKhFk7cKKR9jmIp7bNKx/2fv7A
         BOSBtzyneTGBv7nP0aa3vDtOXCPII9LnUQtjqTGOPdBYaWGXplJi5uFQcPa1hh0uGms9
         RL4qTkwBlguV0FhF38au6zWEZulOF3gM13YT9b1CgaJz1E6Ok+AAYPCLBCKEocdKSEme
         jyew==
X-Forwarded-Encrypted: i=1; AJvYcCXXC+Xd0YNcppbUlMpIbdAebpqM6015dmgJNOZUvrkLw4BgHbKKyNdl+ZnJ2gLTSPvK58byg6ELodTcKkJdeFhA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0x5jRkBrWRwwC2k0Qx3+eEFrO0WOQcTXmQakfDn0FEHqNXuV
	5LNZEztGz7ifTrfCHIkUWxSqS83w1G2rnmiFWQQ7z/S4Fe1FIsfIUvSdrp92mmxpnuI02NCKtHO
	oD8IxinZvaKNbG5awoTlHIA==
X-Google-Smtp-Source: AGHT+IFsYzxWE1q+iyfd/CPcAE+BH9Qt6DCpr8RRj96mk+HtmlAuCb4ka3fjLLxAs1Crrs+qBq6aGz3zEY320EBD
X-Received: from wmbdn6.prod.google.com ([2002:a05:600c:6546:b0:46e:6605:3ac2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83ca:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-46e70c5cef4mr26594895e9.8.1759498754928;
 Fri, 03 Oct 2025 06:39:14 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:16 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-20-vdonnefort@google.com>
Subject: [PATCH v7 19/28] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_143918_128835_C933DFD5 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..75014dc7d82e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -239,7 +239,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 void *hyp_fixmap_map(phys_addr_t phys)
-- 
2.51.0.618.g983fd99d29-goog


