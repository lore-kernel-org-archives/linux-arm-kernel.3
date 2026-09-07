Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B69C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieAuNZcZYYBHRZ196owNjlAruJ8erVXUUQKh5uVkow4=; b=aPvWMSUdfCO1yVYRGRMWhd50vv
	546Gdl8q1C2WdVsAya/0dwlNYnx23q5ak2FaYVdNNJB0f0oksqiQ3wHwXx/gU2WU0FsT2bmsrDHe5
	DnCr0InXeIL9b6pcWLl6kV5DoXjLuzMAw7Iwf4CmG0hMLgejkZ5/LSHSAK+l2XUXqHKM0MdGdr0sU
	7ouuEDObyWm7OlmxlpKUQP2eFBxgGOP7nohsiPxH3pruGqwhDZvv6nYLj4rb4TNxkAc4fFhGIgUNz
	aOB+JzELfbaewTZ1QMDMopsgQQEuo5RTmoSaF0cfHysBrKAtxU/oubFmIfHJalAsfQhUtJfVqjkLi
	/TzJc77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RDx-00000005rrR-1bCE;
	Mon, 07 Sep 2026 04:44:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RDt-00000005rqA-2bsT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:44:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d71ae3455aso45251265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756289; x=1789361089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieAuNZcZYYBHRZ196owNjlAruJ8erVXUUQKh5uVkow4=;
        b=Obn8+j4+7uJZ+8DR5ZqxrQL2CNQ1aCxDjTYMchDLmSOB5gtxN5AgSl3EASMra5aVf6
         I9UNN95Y5T3NhW5ivJaIkn6Y4o6uirQU0O5q4OSAc4k7aY4Hvq8vMSR9Sb1EWRJfDUTE
         8/dGxHnmFEcC7obvYHCIv4isxb2NRXw4ymQP1nQCUbKdUgtuR1NeoIMaP6GiTyI/2B1B
         RgvzckOOaRt+DjUmJhdoHyBDPGpziTZGTFTiHwxg7Xo+qNAbxslcyxnHsaCcli2d/V1i
         DDPH+8eSIWmEI6WttwpB4xLsmE5Cov0d/D0ckl52xbgXVAyOF6zxdTKbd47aPbX/c4kb
         fFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756289; x=1789361089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieAuNZcZYYBHRZ196owNjlAruJ8erVXUUQKh5uVkow4=;
        b=l5HE2ltLXvXmYHKCBvBQ+dCvZ/EEluQsRxakF+gK3Dhde4+gxoqov2Monu2mtz0eeU
         JHDvIGq8dntO/cOjgEUEc2NmnNzZRnbG+6Uy+jyHlJvOxV+RsNq1FX68kAx/ybiz1EvS
         d4REGw5dS37BjxoJ8fF/CeOEoxUdVWpYhxfnyJNa1FsUn/ezDRbdnhEX3KyUsLKl2zzg
         Y0pYyVJOWC1JHjnV5072AZz9NbIBoxq1CjpHstZKzg5TVOx63le/G9OqZsTAualKKV4N
         ErkoGGEwcrlfoAbJITl64wAkUCNho/z/KSZzcmkYcgu1z/Cg/pVebou4jV60TFZAPT/7
         kCKQ==
X-Gm-Message-State: AFuF++maKctZPzng9Kq1H3sK64FodqH2gnZ5XC+8GejWr8b5DOkWqRf5
	gbp3W3kfnEwzGI99r/zMygY2i023Qcnz+sTdYhe4gj96dxlN9j0VisYl
X-Gm-Gg: AYBFou3MpjZFNjoafM8I+J8wily601L7/Y3eHJcZuPJ83jUwrqgLy/cX18Xr6Xn/mnV
	l3mOsiZWqqsYZgs5V3nO/gWTWhAMNR+E33CXFS7kAicNQ93QbA81PBLf7Sc5kFoywKGjjFxGXSp
	DE2x2KsFchai5GZnXz6Eo1ATcDCwVlopqEJsnIptk6pkc/0kBa/EF9YjuMTNpLkW2xu5YE0IULf
	CtlzQMPkhPVaajokX1VtntqP+AdDxPO6dH5JOLyn8/I1wpVCuHSPs6IsWU60X2MYxOPJjHZaqMb
	VfKDAS/qhUkU/otEL0i2congoGrWdk5WhVPg11kYxDnYjrceKBz05+9Fhri8eoFhrz3Ci/BcFmN
	msNXrEHOJOf4aBbQ+AzvwemwscRgBuH5GY8d9QCjXGfjeOTVV5a8F9Ixc8vsSrTMZDaVXD41pyL
	V7vFDZYilTcBenf2SNz+WXBkBwJS2r3QtgRlhMzbgUY51B6SbY2NrOE5NxZubEPH02fTb4upgE4
	GE6gSKvuEvc3ss62Xiw+Dg1
X-Received: by 2002:a17:903:40c6:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2db1286ae13mr285166485ad.17.1788756288604;
        Sun, 06 Sep 2026 21:44:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: kvm: fix typo "synchonized" in comment
Date: Mon,  7 Sep 2026 10:14:32 +0530
Message-ID: <20260907044434.4682-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214451_359033_9B89BD1C 
X-CRM114-Status: GOOD (  11.51  )
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

Correct "synchonized" to "synchronized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/hyp/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 308100ed25de..9709905f21b5 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -46,7 +46,7 @@ alternative_else_nop_endif
 
 	// Ensure that __guest_enter() always provides a context
 	// synchronization event so that callers don't need ISBs for anything
-	// that would usually be synchonized by the ERET.
+	// that would usually be synchronized by the ERET.
 	isb
 	mov	x0, #ARM_EXCEPTION_IRQ
 	ret

