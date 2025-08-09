Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0CC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 02:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvGcQimbgMG7ZN8lhHb0OsgumTV3Re2zlzCqE7JBKZc=; b=pWUFvkzaam55lS8TBvVQzj5DVn
	HC5cOXzHvdfLu4QnXjDT61YzCQKvxxUDHS8LcJchjg1mssZr2TgUt8h0vi71lGKOfGL+R/UqM/bSQ
	fGchKLqQZUtlwSalOIDaPw++vcwrPkdVu8avzLRBg09WuhwHsDDzvE9KPXlh2bvp+ZXdFT1kStEmY
	QQ/Zc0blbzRcXwjkxEy4bNzV/NnNWz5LcOJCY/q6RdXD9EVE/XCQJ5XhKvSq/IhqPsCDWAi8DVv0q
	cAemeQrYPJsSRcZcEk08DGbZ5g7hlfYaGtReSf71qCfuiEYMk98MfSDe0bfXoVBpjQpawvmCf/aeH
	oAHK4ikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukZRK-000000040cu-0DNs;
	Sat, 09 Aug 2025 02:36:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukZOo-000000040LT-3ynL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 02:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 794CB601E8;
	Sat,  9 Aug 2025 02:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF801C4CEF4;
	Sat,  9 Aug 2025 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754706812;
	bh=QZCqGr01nfVX2SQxGUdgMSnfcT4DdbvyxpzPQtbLiIU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n9PegTXfcjQ3AvuL2id9OSI1F2KgacPZcQ4maKkFJUgiEbkhtRNvnWIg5ZqJjFm2Q
	 0fcCezgBNS+dMLm6eAO2pAoLTZwPbHuopeLmF8mqAUScOIqdvK+5ORK03aQBY+VoxO
	 eVfNRUFe7jplzVUb7nTVBNtF2p/OIhuI+5LbDLwPPpy39L71NroFkk5eOArVpAcGy2
	 T11dx3XlDXmJo0Es563qKA3byRTqE4FcyXLhbzc2kclvpO3mYYJgi8hpbdc0dMNdRx
	 K0cdlLDd0LlZof1l25TLaeZHHLh6RTdclOFzd2ZFK2MCiWLq1gjnPYM4RQSUTmAuUq
	 7ZscgmXTeG6Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C2BC87FDA;
	Sat,  9 Aug 2025 02:33:32 +0000 (UTC)
From: Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org>
Date: Sat, 09 Aug 2025 02:33:21 +0000
Subject: [PATCH v10 3/6] KVM: arm64: Mark FFA_NOTIFICATION_* calls as
 unsupported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-virtio-msg-ffa-v10-3-189eeecf8ae8@google.com>
References: <20250809-virtio-msg-ffa-v10-0-189eeecf8ae8@google.com>
In-Reply-To: <20250809-virtio-msg-ffa-v10-0-189eeecf8ae8@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754706811; l=1012;
 i=perlarsen@google.com; s=20250508; h=from:subject:message-id;
 bh=bwnE4nGlxomBFpOzY2EGPC8YmhMC+Sz1wV7rnPIYoKM=;
 b=k5S5fXzXxfzl/wDoZKbRNcByrY2bIHzKltHWYl3R0Skwox+05E9XPMJK9jiYJjWPkcX1TTbsc
 fG7JPGNCDt9Cito5wfknm6VV/IGr4g3XmaPavz38RNTlot1AVCceDQ6
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

From: Per Larsen <perlarsen@google.com>

Prevent FFA_NOTIFICATION_* interfaces from being passed through to TZ.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Per Larsen <perlarsen@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 19239f133a1cfb86db1b85251035709481cdef5b..9311268ad77f50fc596ebae77f451ea144418359 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -665,6 +665,14 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_RXTX_MAP:
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
+       /* Optional notification interfaces added in FF-A 1.1 */
+	case FFA_NOTIFICATION_BITMAP_CREATE:
+	case FFA_NOTIFICATION_BITMAP_DESTROY:
+	case FFA_NOTIFICATION_BIND:
+	case FFA_NOTIFICATION_UNBIND:
+	case FFA_NOTIFICATION_SET:
+	case FFA_NOTIFICATION_GET:
+	case FFA_NOTIFICATION_INFO_GET:
 		return false;
 	}
 

-- 
2.51.0.rc0.155.g4a0f42376b-goog



