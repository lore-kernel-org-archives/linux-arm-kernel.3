Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C4DC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8eGCU7QsDbQICJdJbOzdpd9Veffbk4TEd4ih/oR0Bp4=; b=JOSrMudFp4+YGGx1qgvhUF/AEO
	+lQ2F9qZuNwSKKt7xC3KNSDN2hwwrvAtxKzyGgwin3OtHESuCiKJt+K/NURVxaICUjSwIu6H5zpHf
	MVosVPG4lU+yt5S+oEs3xCcXj30wecTTuUlfUPnnMlnPk6dcoI1gWDpZitTef7tL/TjHUPI1dkfu0
	7CvpfpzsEonKbrI2YlveycV8BVKmS9UyQWUz5S8Qn5Q0BaJ3xviiOGg+zubLh5her6r6MfSlb8n/O
	aRFkbsA2sM3Ihy+6zwU0RHK5B6UtZcHbwnDoxn/P4ma5bvwzd+3mN3pPTCfiTaraIwXHjD/y95SDY
	MfXaWkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJs4-0000000B9Sw-0LWU;
	Mon, 10 Aug 2026 06:52:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJs1-0000000B9Sa-2ADZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:52:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10199805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344744; x=1786949544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eGCU7QsDbQICJdJbOzdpd9Veffbk4TEd4ih/oR0Bp4=;
        b=rPiX2m2p4kP382YEt7j3Pl4KzU9H79l9GzK63CswwA2/bwtUNsNb9Y68LxOcViZJi0
         puwdnTIXQlrNuzgZrG8mcOx+KGUf8zIijeonWvaY9eYchNkp2A5y3oaOhArOgVCHirAx
         SEzAsjT7k7RXFfchAD1clnp/H454fF43VnrCeP5xKuW0Y+RGDCSLb18C4TmBKcI6/+Y2
         W7Wau+4XYImdKmwVvA6CnFhQUQMQlTeh3OOh2INDDkhvtxSXgby+aMzMlpP00trg+T53
         BHEcyZXYpuUX7OG3kU/aS0nDDgeksI3ZuGRqNX14uWHWxb+JccTQNjBG1U37wNSe5mJN
         dK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344744; x=1786949544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eGCU7QsDbQICJdJbOzdpd9Veffbk4TEd4ih/oR0Bp4=;
        b=AH9Jc+yt3BlNB2rW3x0avx3Rh9wbBXxJG7zesScuJkqxGRLn6u7kQb47B49yiC3Fvb
         dTEqnZgW+N+uqE6oSoNViKiSu7LvMi5Qjsfr8cgYQHoWrPiH3iU4B/ZcuerAgz4UkOpC
         T8A9ESl2Z0wpRxnNAKvhDozWqw9hd0jZ2WFu5HLmnqGoe35Y039aD/AwzODEILLDUyHj
         Ba8YN+5W7E9S5c1yNZ2WjLCLmxKQT7/9+LcRK4t1e0UuAuSBc7twiUdM2AMAr55DsimW
         htmNJhPM2kJzZmDSt/XAKds2N511bICcFgEhxiKxAm60srQYyIg9/AO2WBteuWBo6ptV
         TEnA==
X-Forwarded-Encrypted: i=1; AHgh+RrGg8ZjjAUX8ZajCjD7L5v5lEfbkz9TwzpaRqV7/FOF5TNbbEWTgC3wMLmjap0CS6uzMLLtFn5/eQQU2RBD9RuB@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+cWKl3Af3/1MJhAnEOgiZtp9hPpoJYoO6bFgstmTOU8qNtyb
	gMf3Z/1ZYm9ECjhEPq1grUVoPFfJfdx8V517ZnwVGKYS11kNLJfmg0MF
X-Gm-Gg: AR+sD13ZCWDLftMydcdE71su5oSH9AWHFqO76W4KoPY+Q3l0lyiIuDjFWc7b4hvXoDr
	dhKcM/ZjhWnT17YOSPMGmiZJWsEb2WJ6KH2ZVL/tDG4qjAdKAA5BaIgkNVTByVRv7lrbfhuSXq7
	a4UK2JLWJwi6TykSvh4IUfFY9Mv/nKWQQdIltzRB+PBLjsjt6bUS6ONz3P7l1w2H0qkN1NpXmoR
	I4KySUQEsaKHCyrEQvzZ7/8kV5PSpa3Yb7zoyWnyodVv2+PVcHAzQ3myvZAvyrXHzimc1UKhErh
	rJy826gEDAtA051j9mkNajto4IjWkS+oSfP1SW4ymktAODcSztsXDGMQ9OTTJAbAdSx3frmSlWW
	a+nbsI/QSp+QMwZY5399YeBep8qLg5Fnbez/Gq0SkMUApRc7YKbRm6IL0/nKHToYziyyv3Uoacl
	4uGZM+ZjHkKuTbwevJHyAvhSfzFyIglSrpPTOSyNIExmzDVaHkQjhIm5U+kk0MDWXYIll350tTD
	pDlPbPX4xExjCRrGORLiyeGZs6iPPogJXv2OZGc9isV2iX6BhC8nFQS1C9UEOg9xGa6m6AHCG5Z
	GUTia4QH4OuSsvs6nbKPZyj3xelmuTKALjjyCtIEg49Z+fLWip0isChYlkb89CK2eGmbdxSylN+
	wfg==
X-Received: by 2002:a05:600c:4595:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4994e79e377mr389497355e9.8.1786344743398;
        Sun, 09 Aug 2026 23:52:23 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a1e8-7401-78b1-a175-5d13-e92e.310.pool.telefonica.de. [2a02:3100:a1e8:7401:78b1:a175:5d13:e92e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420c68fsm358800705e9.1.2026.08.09.23.52.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 23:52:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 0/2] KVM: arm64: fix VGICv3 redistributor rollback
Date: Mon, 10 Aug 2026 08:52:15 +0200
Message-Id: <cover.1786344511.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_235225_568933_E5D3CCF6 
X-CRM114-Status: UNSURE (   7.83  )
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

A failed REDIST_REGION update can unregister redistributor iodevs
belonging to earlier regions without clearing their cached base
addresses. A corrected retry then succeeds without restoring the missing
iodevs.

Limit rollback to vCPUs assigned to the newly added region. Extend
vgic_init to access an earlier redistributor after a failed update and
retry.

Commits 8542a8f95a67, 59112e9c390b, and 0d92e4a7ffd5 progressively fixed
cleanup after a failed region update. Preserving earlier regions follows
that model.

Built with GCC 15.2.0 and tested under QEMU 10.2.1 TCG with
-machine virt,virtualization=on,gic-version=3 and -cpu max. Both runs
reached the VGICv3 tests. The patched kernel passed; the same selftest
against the unpatched base failed with:

  Unexpected MMIO exit at 0x8050008

Karl Mehltretter (2):
  KVM: arm64: vgic-v3: Roll back failed redistributor region setup
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  42 ++++---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 115 +++++++++++++-----
 2 files changed, 112 insertions(+), 45 deletions(-)


base-commit: b9b3e33b70b71e516930117e21de3ad2a7723747
-- 
2.53.0

