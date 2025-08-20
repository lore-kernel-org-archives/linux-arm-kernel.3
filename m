Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2906CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ustOhKVzFc9dJ91V/sEnM0YkbPClLnQMZt2GL+3Cqw=; b=ZuvbcV0BY68FQ+cygfxtAKuAcr
	EOf5bPoblnq477I/4ow9PtdWc1MEzWw69PT5C6XOqg9P/Ql1feJtCM3DLWd/HM9LBfRW3FKKLAJta
	4IHnwPaRMuXK3ZP95QSeOHh2dqsB2A3JnoKaEsS8jpn4gZe6rbVXXx1Ea3iv7PpJdivPcQMfa7hP7
	f1bLo3wBPpe9OQ3CRmp6mxfruahg9DpyGgS0OFTh2KYUJqQoI2/jY+SgOm8k6Q2Fk+eOAq05wLvFT
	wKP8ElwTFG/AiIFruzwJ710Qm9QLxavkRAzZKDC/t3DJI8BEk7wv8TSbrlMPOSAUPgvfa8qfE5gAH
	gh2x/IcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXaz-0000000C5GS-2Tyz;
	Wed, 20 Aug 2025 01:26:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXLK-0000000C32i-0QTY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F1185C5BAD;
	Wed, 20 Aug 2025 01:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8026CC19424;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652212;
	bh=eOm/bvOMAexpdJ33PwPohvn+1KUMlAe/pR+UbnvP4KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DC/OswqecYxkgXwl77+Ov+1rRro07KfOJwmeHWSHpYBZ10oJI4WQZgYIS4IjNf3Zy
	 bOladLIGr+Jo2FF+nPVz/HwNlhyniE7gyPPvpNWcLMz55Y83BwADvMDK9Yar/DPu1j
	 YO37H08npbK17SBQi9zghAaYyPrxhgu9gXvKj7wPCG3x1NTFU4eVtTFJ0pg1QejFrv
	 leTQMTnh+PRrD+DD4MLNXpnGaKQQA9siJl18gZZiwL9kPs0Cfkgx3zHX1SCkIsGor5
	 Jy7gUDAXwMiXP49UKFaoRLnwCdz1reAiMhW6iJoXwshOcaoNsFO59lUBuh1rqVAYdS
	 BLy2qBsNfCN8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768CCA0EFA;
	Wed, 20 Aug 2025 01:10:12 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Wed, 20 Aug 2025 01:10:08 +0000
Subject: [PATCH v11 4/6] KVM: arm64: Mark optional FF-A 1.2 interfaces as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-virtio-msg-ffa-v11-4-497ef43550a3@google.com>
References: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
In-Reply-To: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
 arve@android.com, ayrton@google.com, qperret@google.com, 
 sebastianene@google.com, qwandor@google.com, 
 Per Larsen <perlarsen@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755652211; l=1035;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=axvv1e3eXiB/+xexcDgx6JaWgpv5+SkVFL8SUFw7cGw=;
 b=GUSQIldlrNo8coOkbJ1NoBMsenhoCI9wnCj0kif4wX+McoVmMUpRsHZm9TM6nJaF+KYEu9Qo+
 7KbJ9pgZlrUAG4or8PmT8Uz4LOrxJ/vDXPQgVSx+hzLMihsRyY7tq5i
X-Developer-Key: i=perlarsen@google.com; a=ed25519;
 pk=jjc/Ta4VmrLRmMoahP6d1mBcKzvWU+nsmdtYe2oS2kQ=
X-Endpoint-Received: by B4 Relay for perlarsen@google.com/20250508 with
 auth_id=402
X-Original-From: Per Larsen <perlarsen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_181022_186069_7A1213A9 
X-CRM114-Status: UNSURE (   8.05  )
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
Reply-To: perlarsen@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Per Larsen <perlarsen@google.com>

Mark FF-A 1.2 interfaces as unsupported lest they get proxied.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 40a785b6ed063f9de31f51f1e82ebd9c70b13de9..96109aa99c48741e45a2b85d8e7bf26440597398 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -678,6 +678,11 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
+	/* Optional interfaces added in FF-A 1.2 */
+	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
+	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
+	case FFA_CONSOLE_LOG:			/* Optional per 13.1: not in Table 13.1 */
+	case FFA_PARTITION_INFO_GET_REGS:	/* Optional for virtual instances per 13.1 */
 		return false;
 	}
 

-- 
2.51.0.rc1.167.g924127e9c0-goog



