Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92D5D2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VbTTWN64JGBAoQywDuAxXApY2+pw8bYawwCoCRHZJYI=; b=u5WzlxdieoMa3qN0lqlzGEMxy1
	f79uE6HpDHdoSVQxTSonTqbqQdoqcp7nqErUndVAOsGDDcTaZgbuILmpB3YtoxBy7Q67FaWrHKYcS
	cE/7ZGV6xusS8Cc3DxgnQ7vZucmkFI/j6rKNRSx7HR4Qc/+n6rLHLBS/9hm1dzVtZwa1j/7Kk7OLD
	kqCPVA6JtS3mF24r3qkudp2qbU7bukdZJAK9rMZxNwm9erhBGj9IOy3u9hRKa9jpe/eIQ9U4TiZBP
	B9SmGYRZiv/1Cf9mmdhoEqbtWUcTVoNFYUKxW0ebWQNUby8wOU3PsWUyKdewdwld63ypOuyC2Qg7r
	tUXGAIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgIz-00000007Mb1-14i7;
	Tue, 13 Jan 2026 15:27:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgIv-00000007MaB-3v3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:27:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so84359705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 07:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768318051; x=1768922851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbTTWN64JGBAoQywDuAxXApY2+pw8bYawwCoCRHZJYI=;
        b=lKExG9iJ3kB3xz0VxGmteLuhQI+K3kIgZg0LnPnHFSasNN8Yf3j98eUPpkAChQqIZC
         xxSp7gO0us/OTS+za4EGR2M8QYRzmZC9z7PHHsWI1KLpOl39nDZViPzVS7mE5H8ZL4ef
         0PHGTN8t4niaSH4+dGDa6d48Gp0zosVuuE0seZdZafoPr53ZlDMxtm/J62guUJM8D8/t
         4s/zGp+2voTqTdLU6eICbEIHnFHOxRqO8FaANqdcfSegm5/NZLspPo2mjak8oxQRx0Fc
         g9o0TCOrhaeU9mYQeUw3AcMEK2Ism39p+CsGa0Oq/nW6G0paVEZeuAWp1Uk39iyewxeW
         eUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318051; x=1768922851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbTTWN64JGBAoQywDuAxXApY2+pw8bYawwCoCRHZJYI=;
        b=vWRrSuKMG3RikCPmfhdteLeBv5iojQJlM3RvHtGKkYyaLw3vadLo/SkJg3CinaXPjg
         CNPyMXNyv3TWh8XcRaU4ENSO6vTFCqxTffOR6Wo2fwCF8kWVFRjq5Ih2MqILlRpUmbtv
         i8Ys7FwE6Veu9GTk1XP0iaowsQqBDrgQsBrgoEjfsWTRXsFF6xn5bFpeU4Z3fcJKwlai
         N1VCzWtenItUHyESs6uOaKxUVmLpS+PFfhhrBbS4r4B3AKStTk4T65eGC1eRT/uZ/pft
         WaXkAJ4iwxvMdGHz9gnzJpUrQO+LkJWzdvu/x4qRYDS7rkuNvyPIGhnwwWK0g/li3Qgy
         adbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVh6hOhnpQjti0NoYzUtR/xy/yTvFzK5TLsIMdDHv8dbM/cYokItWviwzgpwPqU+eD2GRQR3Ju2dEl9Un1XoCm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxez/SLIa6P1xjNvUZi/sYvoK6YyQPsm9wBW8/2Kkt5nYbStDGs
	7fum5Z+XpBp7KkHgn9EOmqdjKXt7BVpPiAzqvh/m8B1XXSd8bRxV12Sq
X-Gm-Gg: AY/fxX6oQakZ47vXC0tPkgZbYCLhd/YOKP012PJH1KpFKBzW6ucF5RF1Tr2baevnz/g
	FG9Bta4Zv+dXEh8HLl8Odw6d3nnfKjSre5pAbByx6BXdWJ8UUb1VJNN1J6pW59Fvia4fflN+laz
	Qjy/D8xVe4Umab1Q69PEG7cmS1i86+0AImreo1eR88HpVZ1ZaMKW9+j6wauh84Ru69LwXyGE8RU
	FOjoQQp+Vd9dKQ3cpf9b8h7lNkZj7I6PQiiE5im5ZIcat4f8xMjSnYqz9beBvNru8ZJy5Q2qPdV
	GIr8qbQpn8jUz901Vc0fcBtE/8HvHSm3bhTrLVH005py2wm05vbADJjKkU177gYHtJiGZU9UveX
	JrXw4AMOA3UNEaOZugS4e95bzrdhs26uDoEzNECLLLtMl79EEp5kUrpj6hpe27754HXIqBSI9wX
	gs2g1KSaORrjHfsw8Ye3ZyEkLZojv/bHU4j9VqLPU12ztBvCu4KQNynyM=
X-Google-Smtp-Source: AGHT+IGxO1vUemwqVC6JKUpSwSlNgSOMLT+M80yAIztyVdNJEhHixQ6jTf/ZgIZ7VfPNTxO2jx4HyQ==
X-Received: by 2002:a05:600c:6096:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47d849ba979mr245697915e9.0.1768318051058;
        Tue, 13 Jan 2026 07:27:31 -0800 (PST)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f4ddsm421025325e9.2.2026.01.13.07.27.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 07:27:30 -0800 (PST)
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
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.com
Subject: [PATCH v4 0/3] KVM ARM64 pre_fault_memory
Date: Tue, 13 Jan 2026 15:26:39 +0000
Message-ID: <20260113152643.18858-1-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072733_989542_9BADB965 
X-CRM114-Status: GOOD (  14.38  )
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

 - The second patch updates the pre_fault_memory_test to support
   arm64.

 - The last patch extends the pre_fault_memory_test to cover
   different vm memory backings.


With regards to the additional parameter to `user_mem_abort`, noted in
the v3 review, would you like this to be fixed in this series or would
a follow-up series be ok? I also found a series from Sean which looks
to address this [2].

=== Changes Since v3 [3] ===

 - Updated to now return -EOPNOTSUPP for pKVM. Previously this was not 
   checked.
 - When running a nested guest, properly resolve the L2 IPA to L1 IPA 
   before pre faulting.
 - Refactoring, page_size is now unsigned and ordered definitions at 
   top of pre_fault function.

Thanks Marc for your review

=== Changes Since v2 [4] ===

 - Update fault info synthesize value. Thanks Suzuki
 - Remove change to selftests for unaligned mmap allocations. Thanks
   Sean

[1]: https://lore.kernel.org/kvm/20240710174031.312055-1-pbonzini@redhat.com
[2]: https://lore.kernel.org/linux-arm-kernel/20250821210042.3451147-1-seanjc@google.com/
[3]: https://lore.kernel.org/linux-arm-kernel/20251119154910.97716-1-jackabt.amazon@gmail.com
[4]: https://lore.kernel.org/linux-arm-kernel/20251013151502.6679-1-jackabt.amazon@gmail.com

Jack Thomson (3):
  KVM: arm64: Add pre_fault_memory implementation
  KVM: selftests: Enable pre_fault_memory_test for arm64
  KVM: selftests: Add option for different backing in pre-fault tests

 Documentation/virt/kvm/api.rst                |   3 +-
 arch/arm64/kvm/Kconfig                        |   1 +
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/mmu.c                          |  79 +++++++++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/pre_fault_memory_test.c     | 115 ++++++++++++++----
 6 files changed, 169 insertions(+), 31 deletions(-)


base-commit: 3611ca7c12b740e250d83f8bbe3554b740c503b0
-- 
2.43.0


