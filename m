Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FEC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZiixOEWYaq9wXDNP/eyMuN3kYA78c0bj/N2a/BCkL0=; b=d5s4+hlt5uWDVjaCYxvx2plPnx
	WTvEEFrM1Xl3tlsV9xFeaKkV5cIiP1vzShqyBzsoyj+DOtSarLRIaqqovlcxbuB3Nab7KElXeRjQZ
	LYG6db5yjN03OAbc5gY8CdoStLm/yRKpnRGjfSVWNQRYTmCh+OV+F0PEPaz5QfaMh0iYD28fLv5G4
	EblC+lyv8KQsOurytuslgtIqaZ2zMiTZhvTcOyrQhe9oz+a+Qe6cmgqz/REV+SJYbJsPEoOcM4/eH
	ofZlUpZuZWL4CA8DGz+yS7gHWCr3eTFV7IqnnW2jQKniowCa1m/w1MdNvsTOZ45iAqxO7ifRQyIcl
	t/DpUgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxik-0000000AccZ-005P;
	Fri, 28 Feb 2025 10:35:54 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxYw-0000000AaRh-0ksM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:25:47 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4393e89e910so10939635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738344; x=1741343144; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yZiixOEWYaq9wXDNP/eyMuN3kYA78c0bj/N2a/BCkL0=;
        b=AWqEGY5nr8GDiOMwNiH3UaImX8vW/vjsQWrIHeH91l35hbudq+RH34i6rJFb3UPQqS
         ZU3hZHMpSTD5+Mn5gnerIepuxJ5MrCq+XgCz6rxwSZ0lx17jxWBhlis9boMtpploEyiV
         3H6YIah6BKjXKJNnDjeX7uf7U53ZfV80I+mE579G0Bu7xWaqyrC2uBnLFYweJwkOyRpN
         W1CB9vBnEbetsmDG31frWlOtrkITIUfFvSX6d13TM93T2y4UrM1Vs97sAabgOcCt2P3n
         4nqo/2MDVnfIL74KLjab7OE0H4Bv6R5dfakVpzlWF48c4OnWkQd1pVsEtjxPfkYV8KZz
         3Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738344; x=1741343144;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZiixOEWYaq9wXDNP/eyMuN3kYA78c0bj/N2a/BCkL0=;
        b=F7NvDWm7cFaY78Y9M/Wgwx27TxbiOR1wI1WvzoX/wxR/MBwFHcyUJsBru+yu0BeY1q
         H5pqE0ba3SENP0ljl/4yHkZPbLUJBHnFVL8kq5xVu7r98nQUIFTz2bR/VVCRZ4DpUF/A
         aSzAnUsfkQmkY+QHfqnCeMUtjgtcYxy7f//Ydx4VP/R9/SGq0nSjLMDtgq7vBc7Wo4sS
         aP8XJkPNr5Z0Mo0s6ro1NBSg+oFdZoqhQK/YbpNMT8ptPW1j7VJFtS4Pmm+WKuln/jkG
         i5RJ2tOInGrewNrexr56bqgu8K7dGt5V81M26YK+x5CnSiKQ2qY9D09bZhBxqZ60U15A
         E3lg==
X-Forwarded-Encrypted: i=1; AJvYcCVyN3XFaJKLjxuRAjzKR74+70FHJ9ne9j5DwwduGyfccdkOYwNRq4RpDML0WiCNuFxLnZigVnEr0SslE5dgwh1S@lists.infradead.org
X-Gm-Message-State: AOJu0YwuKEiQEhVx40D8wYgklOvI99P1Ja0s4j3x+xfYp8fYN6XeCjBZ
	t22Qt1oAZTYylBpzpxfD24vPVjDd6eCdpHaIVKV7+01UZ8erB1TdlHVuyMPVreqCuxyIL4+xVEg
	tGE2C2xSzNhSFlwpMUQ==
X-Google-Smtp-Source: AGHT+IHep39Sd5eGh94BVx9flL1lcXtt9eAIYrt+u2ImlSXt8vPoiGgYIDF5HPduTl3nT7mvrQjfLoUwEOlBu9qB
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:439:804a:4a89])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1551:b0:439:9f12:1809 with SMTP id 5b1f17b1804b1-43ba6766c16mr20538485e9.20.1740738344390;
 Fri, 28 Feb 2025 02:25:44 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-1-vdonnefort@google.com>
Subject: [PATCH 0/9] Stage-2 huge mappings for pKVM np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022546_215512_11019F80 
X-CRM114-Status: GOOD (  10.37  )
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

Hi all,

This series adds support for stage-2 huge mappings (PMD_SIZE) to pKVM
np-guests, that is installing PMD-level mappings in the stage-2,
whenever the stage-1 is backed by either Hugetlbfs or THPs.

The last patch of that series is an optimization for CMOs using a shared
PMD_SIZE fixmap.

--
Vincent

Quentin Perret (2):
  KVM: arm64: Convert pkvm_mappings to interval tree
  KVM: arm64: Add a range to pkvm_mappings

Vincent Donnefort (7):
  KVM: arm64: Handle huge mappings for np-guest CMOs
  KVM: arm64: Add a range to __pkvm_host_share_guest()
  KVM: arm64: Add a range to __pkvm_host_unshare_guest()
  KVM: arm64: Add a range to __pkvm_host_wrprotect_guest()
  KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
  KVM: arm64: Stage-2 huge mappings for np-guests
  KVM: arm64: np-guest CMOs with PMD_SIZE fixmap

 arch/arm64/include/asm/kvm_pgtable.h          |   7 +-
 arch/arm64/include/asm/kvm_pkvm.h             |   2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   8 +-
 arch/arm64/kvm/hyp/include/nvhe/mm.h          |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  16 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 218 +++++++++++++-----
 arch/arm64/kvm/hyp/nvhe/mm.c                  |  86 ++++++-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   2 +-
 arch/arm64/kvm/hyp/pgtable.c                  |   6 -
 arch/arm64/kvm/mmu.c                          |   5 +-
 arch/arm64/kvm/pkvm.c                         | 129 +++++------
 11 files changed, 326 insertions(+), 157 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1.711.g2feabab25a-goog


