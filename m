Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1EACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+D8anVFuGoYzgZb/9BM5CA5vDzeQQvLAvu+Dom128Io=; b=PukqVtxCrsle45xYPkcqaPT3xB
	XlfTK7HRdaV4dM50/O5XDml0ilGvFEwVMF1mSX35kHjwJjD272QUeBx+niN9Qt1SmT0vZfeGG842X
	iM2ZjKB2ji7O9FCEdTzUEOSkCxfkcCHRIvfMQ5oAwYCtLMadu1swY/QiyKazq2Hx84jhULabB5E8t
	ksnZIbh+7PC78BqKf7BtYx23I7AoeTA5YdPJ7sZwYfUJ0TVL0T9SPpkNgArxeawOm4eK3B5psr6I1
	8OyYVz5EDJMETnomLN4KUXliC4nyn2kma3sfNgr0ie0cXc0UUv5pot6EqQ7S7BCKm93et+nkU48pU
	YO9B3zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUtz-00000004PmT-3ELE;
	Thu, 30 Oct 2025 15:49:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUty-00000004Pm6-2Yzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ADA9611CB;
	Thu, 30 Oct 2025 15:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5E67C4CEF8;
	Thu, 30 Oct 2025 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839365;
	bh=8s1gw4zxVz4gFDdlU/JyqSmtBI+GywyPiSCpoHCeD+A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rItTgC//OUg6UGbkjCfoDruFY6dB92CLVOIbktYOV5ydZMLmIH3uwEO1mRcm8ooUY
	 bEqlVIKZHHigKgnZ0NfBj465wditDbSJG7IpivPF8P3QElGYnZAcxG9AoHeoyq8j5v
	 NgPAb7h5OzZVEgk0kx8NxkwMfjQtACPR6tnGnFib1GGLcDrtMLf9vOoLm8YDHNLuVR
	 S1KJPH5D9V3Ern4vkc1I5MNgbMgjcj4y9HFific729i3yJ1zpAWufq1QneN/EeWwm4
	 CQMeMjRgzn5m6vAQcOr2+Y0rfJscKmD/nl/HvoVXX7owgoMludpJALMfGLQay7a/8s
	 q3BJKDeqT75lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98697CCF9F8;
	Thu, 30 Oct 2025 15:49:25 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Subject: [PATCH v2 0/2] KVM: arm64: Support FF-A direct messaging
 interfaces
Date: Thu, 30 Oct 2025 15:49:15 +0000
Message-Id: <20251030-host-direct-messages-v2-0-9f27cef36730@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPuIA2kC/22NQQ6CMBBFr0Jm7Zi2WEFX3sOwwHYokwglHUI0h
 LtbiUuX7yX//RWEEpPAtVgh0cLCccxgDgW4vh0DIfvMYJSxWpkL9lFm9JzIzTiQSBtI0BqlfdV
 Z2z485OmUqOPXnr03mXuWOab3/rLor/0FS/U/uGhUeDqXZKu60q7ubiHG8KSjiwM027Z9AFX+C
 wa5AAAA
X-Change-ID: 20251029-host-direct-messages-5201d7f55abd
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Armelle Laine <armellel@google.com>, 
 Sebastien Ene <sebastianene@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761839364; l=1188;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=8s1gw4zxVz4gFDdlU/JyqSmtBI+GywyPiSCpoHCeD+A=;
 b=9LSJoD3lZA0ogsX7LA0xU+vNMbRxY6n7pTFWh3e/JFxXdDlXTr4KtfUhi61CMD8w5FrWi1l4E
 vmPTjkBVwR0B0wYyH1/mV+O0LauiIy68LWToplSP+/9mmOsGl6fa4Jk
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.

The second patch was part of a previous patch set [0] but was dropped
since the use case was unclear. A clear use case has now appeared [1].

Tested by booting Android under QEMU.

Best Regards,
Per

[0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
[1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
 

Signed-off-by: Per Larsen <perlarsen@google.com>
---
Changes in v2:
- 1/2: Drop support for FFA_ID_GET interface in host handler.
- Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com

---
Per Larsen (1):
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler

Sebastian Ene (1):
      KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
---
base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
change-id: 20251029-host-direct-messages-5201d7f55abd

Best regards,
-- 
Per Larsen <perlarsen@google.com>



