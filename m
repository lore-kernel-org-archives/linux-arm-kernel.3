Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E61CA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yw5onK9ABSjXC7tgDTQ0zX53Fggmc7w4C6cYr6DSCw=; b=zLIs0yL0WO76YFZO+uokFXK7Z/
	MiqueL8vlPKipUz6zy3UCIArqVoxm85V0KM03lFyKw278UyD/1cjZ85EiNh3lFL9JE90Sa48YVCTb
	9vVF3rOVcXoJkomyCD46UkDxLkdF6LYr7z/Ioyh6ztdgvbmMKUqZ/VZlub8bGVSEdkAy9Pv1hIEHR
	KyJGlsn3Jgzva5E0XagoA11sgrBHdf9xZKHc3APnCmkCEeJWNt5J/Qxl65i2RRSgq6LzeBiUDtjoD
	H91mRdDDvGgxuTTFweTr+LDdfhBmY9eM/Ff24iG90c97xucb+0zMWhGFJk0zGpwiegkHByRZboYGY
	oFgrjOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB7-00000002frC-0yA4;
	Wed, 07 Oct 2026 15:03:33 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETB4-00000002fq7-2a9X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:03:31 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so39491305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385408; x=1791990208; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yw5onK9ABSjXC7tgDTQ0zX53Fggmc7w4C6cYr6DSCw=;
        b=Vpg+M0QbFgyeObjrstEq80RufOh8l5zobhE3NlE+4IsCeaoAkdj8B/5g3eElQNsybw
         ujjNplT4sxGDOoymf2TBwzuWl52eDSo3O//dzYhNhRjY4r5TAnEuV7H3Dk7wKcuB7XhW
         yDlNBbY96x9JaeZlMqpX+OEMGn+r1ZX2JmKD+kN4sJ3YtwuScjX618opXVzPiZUUnUhc
         V360Mpw9cnvOelXuscT4/pEQtq3tuwaIncQ10U62XY8wDOegLGKDl3X5rO3KdBQzQq2E
         Hi1+5B5m7FxPZyXsEVdG+fjaWx1cpnOiRZMLcrm6DI5yHOPRsIzwPrNmN6mjLCdNe7wC
         HRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385408; x=1791990208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yw5onK9ABSjXC7tgDTQ0zX53Fggmc7w4C6cYr6DSCw=;
        b=k+eCk8vYN+GOEXfqjGhsSCSLhf053VtKmX9du1eQUoDsd0mkQ2X+kicUVyT0CZk2hM
         3u4uJFpbczieywVqUizuUrppR3qOoLnI3nbknPLnmoq5UhsrAG7min9HvLLgimYj3yAS
         XYag4pS5tSWm9Jaw4xHMEnwNlUp7L+RzkvxYxXgLDQyzUde3Ba4+dO8Eqy4aK+o6xTGe
         JMtj3J6zSn5wCNX6N6JZKKf3mQuAp2q/I9R1Skjsc8+Y8Y3x3OWTpim4Y/6gZfi2Y410
         enLizfMnNKUa8z5w+eXMp9EajlVCGRZHH33NKeNb/VSWS+JYZZdZK722LWyDdWcEB5gf
         ejtw==
X-Forwarded-Encrypted: i=1; AKwUvBxpTsbS9lnfVgiooZe9aA/fZ1tBsiitc1QyUsQLhEKGE2jat1RiABj4bjAYxgRm+uJTxKBV+S+mDoV9+ha+ePNZ@lists.infradead.org
X-Gm-Message-State: AFuF++k/E4F87BFassKHSABFOtxL7TyL/DUh4phPJV0OOsTvrTGPH4Az
	UlUtA6mtyKAvGqUzyJWeBgs1lzXy2zkBQV/KE7FgRflg8l8ae8rXPwERRRZM+bFbQ9bKqZGiHGQ
	qodUAjmw7ufPfNMnOZuqUyA==
X-Received: from wmjk10.prod.google.com ([2002:a7b:c30a:0:b0:4a0:14fa:aba6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0e:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a180648fdbmr40128625e9.19.1791385407774;
 Wed, 07 Oct 2026 08:03:27 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:50 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-1-vdonnefort@google.com>
Subject: [PATCH 0/5] drivers/virt: pkvm: Protected VMs with PAGE_SIZE smaller
 than the hypervisor granule
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_080330_749073_FC777CA4 
X-CRM114-Status: UNSURE (   8.73  )
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

This series allows a protected VM to boot with a hypervisor whose
protection granule is larger than the guest's PAGE_SIZE (e.g. a 4K guest
on a 16K host).

This is best-effort: non-granule-aligned sharing requests are rejected.
In practice this works because only the swiotlb is shared with the host,
which is allocated early and large enough to be aligned with the
granule.

Tested with a 4K protected guest on both upstream and android17-6.18 16K
hosts (with MMIO guard auto-enrollment forced).

Fuad Tabba (1):
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MEM_SHARE

Vincent Donnefort (4):
  drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
  drivers/virt: pkvm: Make pkvm_granule __ro_after_init
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MMIO_GUARD
  drivers/virt: pkvm: Allow granule larger than PAGE_SIZE

 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 102 +++++++++++-------
 1 file changed, 63 insertions(+), 39 deletions(-)


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


