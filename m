Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D1BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H9v2BaCzqTwwaKihxHneX2NKtRg+AsrUK2wCvz8acXU=; b=DMpPqVhGh+IZer1XFLAey9sGBh
	6QXcjetXPiuKKnVMXmdWm2HpKfyL9scdKKcacHEgaWxNus1SObqqlVlYZdhalR61fXZ2m/B15ZIof
	8C7FjxrduHLa2y8spek23h1kmR+03Qv2daXIusRe4oozGSDcbMD02tFdtDj4rAw+g6IkQbeANpm4T
	SoAvq+w2TWSxERlCIFwHRGb9EgIfjsy4136L3mvnIqyccai+qYryXsul6VzU7gLujpGfp1AsjNgIX
	wzx33UGs7JRr9I6o9R7rrGoudSieI642QGfcD3HfwvFEIU0bRZwK688vZyKe7URWTEBOrdNXd4MKp
	GTI1gAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KGs-0000000Db1W-3GxF;
	Mon, 13 Oct 2025 15:15:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KGp-0000000Db01-2vgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:15:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e47cca387so43587635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760368529; x=1760973329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9v2BaCzqTwwaKihxHneX2NKtRg+AsrUK2wCvz8acXU=;
        b=OHhHpodWSHEmuy0KEpYXLETl+pzoR2Ox67ZSWSYINu+HuzcH5oJaP3eUif6qKf8DCS
         Uz+gLjw1+PuivsrX/tyGiTGPkye2Eu2Bv9weZJnatZZO9qGNE+XzOq8cJZEtZX20Y92X
         fNauU+Rb2SewULWC6GZSbTENcv3XpYNUKir+Tf8743Cw9wFB9QdM/nDDajuo1fO31AIA
         l2lfa6utiIYsKxXzPgRINh/Cb/t89kvFde8IbMyYQRfGzKoFD+cRa22CVGVoX6zrz3ik
         LI4JnBH+AEqrgKSXouQaapeuqLz9Jh8c4fiZT/IuzHfRXF9/JCICJ/wF3WaWq86RONVD
         89pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368529; x=1760973329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9v2BaCzqTwwaKihxHneX2NKtRg+AsrUK2wCvz8acXU=;
        b=Xfk5TuRitkrAUnta4gm9sHCxpllmAwtY5UKKD6gS/IV9/lCaJfPFw2OebeDg3Tj9e1
         oq5Sxm7iqipWQEFHpxZpFR15lA9AwhPe2EnbOS+JF33E4kfAAps3SG26syCmhHlBS9t6
         imKYjm8RhgTf8NbQO2mQYju8pIIhf0y92hGpjf09wTP6JY4ykQxNrpneBl49WrWiN32S
         d4fY+BA8GgrHVOe0LAsUGl7H2eF/BGyzxqDzG5xdo9sFwacvuv3E3eD5/OPAiyEFls9a
         bADLUBpNDtJr3Aznrx8te4PPkQQiFb+ifETwYFXZKkFFzXcviq85hTpFm6unIccpUIat
         1taQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKmyTFJ3OpIHVC5LtZ+QNCYjoAJOcrR1/RGgnZPPM5768GeXbXHTLhXmO96xUV9gOBJ2dK9vYSmE89Zd1SI+HK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/fwI06yRSjMgYWrC+V9zEVZOm5KLGsHVGTVFZCHPUlX6FkkB8
	WnRbwepq0/LexVhEnSc5yQBfkb696RSGN/54XjCYkTbIl07uQm2dfUDB
X-Gm-Gg: ASbGncta5b6ZlLqbGx5/cX9TVQdeMPINkGlLC3RTPYhu748MxDLz9yOH3aG55YVN6Bf
	/x2nwqYL0hyMSDctmW5iKnPBrl6y25lMHcCrEJyi16qbi09rrJtE+pUU+os59bI+uNxmKUAzja1
	iTtLPTt0kipkBT3nX2Q8ZsrxxjKOqg0Eg+LrlJaXy643A8ZR2e7Pjes5lLverhBZXFz6wS3DjD8
	7up9b8H4X2IEIBzLC8W+9jiEXZHRRPm3lhx1jXgjIke3pED3Al0grIpqbck9czcXJN9tT+o8c8Z
	vyjy72eUSXXLALyOHAOw8mDc9JYglKribcjB+RYUny0y1FTtee0Wi9Z3nmlbnB3n30wJ3Yla27v
	hw2mK7E02M1jIM8qM9PcbKoTTvQekjN/wxNuh45TjwiJo3d+08c29HTvf35RyBbxqik7Ze5UaoW
	Rv61k/ajVqVtjbIH4=
X-Google-Smtp-Source: AGHT+IFb9QSIj2pT5DqJHOGWLZeoKzR1HcGUwSCz8TPcIH2zmr4COlYJoCPacXO6TFFsZZUZ1uzZWw==
X-Received: by 2002:a05:600c:1c23:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-46fa9a892d7mr154828545e9.3.1760368529113;
        Mon, 13 Oct 2025 08:15:29 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.3.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab36a773sm135545825e9.0.2025.10.13.08.15.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 08:15:28 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	isaku.yamahata@intel.com,
	roypat@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v2 0/4] KVM ARM64 pre_fault_memory
Date: Mon, 13 Oct 2025 16:14:57 +0100
Message-ID: <20251013151502.6679-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_081531_750207_4803F5C8 
X-CRM114-Status: GOOD (  13.31  )
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

From: Jack Thomson <jackabt@amazon.com>

This patch series adds ARM64 support for the KVM_PRE_FAULT_MEMORY
feature, which was previously only available on x86 [1]. This allows us
to reduce the number of stage-2 faults during execution. This is of
benefit in post-copy migration scenarios, particularly in memory
intensive applications, where we are experiencing high latencies due to
the stage-2 faults.

Patch Overview:

 - The first patch adds support for the KVM_PRE_FAULT_MEMORY ioctl
   on arm64.

 - The second patch fixes an issue with unaligned mmap allocations
   in the selftests.

 - The third patch updates the pre_fault_memory_test to support
   arm64.

 - The last patch extends the pre_fault_memory_test to cover
   different vm memory backings.

=== Changes Since v1 [2] ===

Addressing feedback from Oliver:

 - No pre-fault flag is passed to user_mem_abort() or gmem_abort() now
   aborts are synthesized.
 - Remove retry loop from kvm_arch_vcpu_pre_fault_memory()

[1]: https://lore.kernel.org/kvm/20240710174031.312055-1-pbonzini@redhat.com
[2]: https://lore.kernel.org/all/20250911134648.58945-1-jackabt.amazon@gmail.com

Jack Thomson (4):
  KVM: arm64: Add pre_fault_memory implementation
  KVM: selftests: Fix unaligned mmap allocations
  KVM: selftests: Enable pre_fault_memory_test for arm64
  KVM: selftests: Add option for different backing in pre-fault tests

 Documentation/virt/kvm/api.rst                |   3 +-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/mmu.c                          |  73 +++++++++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../selftests/kvm/pre_fault_memory_test.c     | 110 +++++++++++++-----
 7 files changed, 163 insertions(+), 38 deletions(-)


base-commit: 42188667be387867d2bf763d028654cbad046f7b
-- 
2.43.0


