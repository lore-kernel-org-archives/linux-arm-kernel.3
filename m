Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F983FD2D71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMGGQ3IiwT5PMH1OcoXP65zz2QzMpSJC2ga0AgyGkCg=; b=ofUur5/NDCzNB0hjIkVmNtny4N
	uCc0Hi4cP7nFP6Gq+VcvWA0WOLdBvTz65BqgXz2Bp3mEuhLHMhHm7xmlpmKCUqrrDfqssfq4XfBYQ
	p6h3464IKhBXElyp4wo8esd3maOUGByTEH1J0UiQDD46tEBPy/jGa1Dcw79LqoZIf8eafvIPDgq5B
	D67+abG09D9xDR11z8kYzwoK/1Czas6ihwmISiw+zygNDAa1pCiDR2fo5IvXpI90xxxXXGxmhKOo2
	rKQXidZANib6tsohZdIdig4XX3pJ2ckqPEyicYgcfIPirnAV6IEm1+9aHkt6wOZV7/33gr2qOJxhZ
	Y7LZU1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwXD-00000009WHX-1rrG;
	Tue, 10 Mar 2026 12:50:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwX5-00000009W7D-0crh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:56 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso148686025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146993; x=1773751793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMGGQ3IiwT5PMH1OcoXP65zz2QzMpSJC2ga0AgyGkCg=;
        b=1BKg99e+/YyOmQgSeA9k2d7ziNAc/WedFkaTt6ohEPYFLDjm+krUZ72tb9BEjZJzoi
         lmGZnOie/1dd0aVEF3iDp+eeR8dprdC7gNH0lxR+I+ty/FK1IpWV2Fe5pakkS4mDMlvO
         Xd77h3tfFlnHmVzmBlPITU5EfrMW5c7lj5+YzNJ/jAFjzT8d6eNniclxO9USSUmC6+i0
         Kf+FSzVLB0X+QIkKzaarRf4EGs4kvxbGngMEV+ab3gznJ72E/4weWoJX1U1S1i57IQ75
         OtB8VdGECBzOpKtQLgaP1qgHvU/0K2M7vKYqmtkiEdFNhUaKXVu5Edmqo/olnkBp09n9
         ncyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146993; x=1773751793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMGGQ3IiwT5PMH1OcoXP65zz2QzMpSJC2ga0AgyGkCg=;
        b=T8b8bdvypyvlsZLNopcYzKfnSBLMyVU0lr4PRtLDmWzoTfW+uw9NhqP8RCdSYYbfVx
         5Hv8IrfYBaw1iUckdnzsdhYbZ4ZJ9eNGNJreIZjOH8uXlRcpVCEy7EBpnJiPmjlnIqFv
         rYw2k0ZQE6Ocqx8F4rhir5wYzAvWNnXrSp2QSGKVFZ3+w/dptthtyib6cKovWe4TC+2q
         1a2SfbQYvd7nOXAxVSHWXhqyksmgGh/8h6vGNd1LVtm+kJqCn6HVKmeRAM3hiNqJTCbx
         LyCY9t0ZxntGRSR8wYrwwKATGoLVCC5wYV/Y/k88KrgxUsbh/SjD+28UmKUfb0ObwFdG
         Qe4g==
X-Forwarded-Encrypted: i=1; AJvYcCXqzcwzCW3zCU+YVSRYXL3vmksvRx8meVNXuAnSbNPZz9G50LcHjCMvg22KCwnQS3hYYdgJsxWHc8eBUDxjepwj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Ka67XVae388wlfNgj7Uepzc/CDUiHUQV/cjn3c/52tW0972X
	UnW6nckrSnaD6XcNTLQcMMZnc6mYw5DFWOG0+MRFx5SRrLDxTSyQAUrCrR228z9qhDXKa/7lMDI
	sR2L9lIcqWdHWBwrVQWTJ6jWMO9mB1A==
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:485:4553:1a97])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6383:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-4854526fc21mr24095095e9.11.1773146992719;
 Tue, 10 Mar 2026 05:49:52 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:28 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-10-sebastianene@google.com>
Subject: [PATCH 09/14] KVM: arm64: Trap & emulate the ITS VMAPP command
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054955_228055_90E59D54 
X-CRM114-Status: GOOD (  13.39  )
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

Parse the VMAPP command and extract the virtual pending
table address and the size of the table. When the command
has the valid bit set, share the memory that holds this
table with the hypervisor and track it in an array.
Unshare this from the hypervisor when the valid bit
is cleared.
Check if we need to do any shadow table updates
in case the vPE table is configured with an
indirect layout.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 722fe80dc2e5..7049d307a236 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -178,6 +178,26 @@ static int process_its_mapd(struct its_priv_state *its, struct its_cmd_block *cm
 	return track_pfn(its, base_pfn, num_pages, remove);
 }
 
+static int process_its_vmapp(struct its_priv_state *its, struct its_cmd_block *cmd)
+{
+	bool remove = !(cmd->raw_cmd[2] & BIT(63));
+	phys_addr_t vpt_addr = cmd->raw_cmd[3] & GENMASK(51, 16);
+	u8 vpt_size = cmd->raw_cmd[3] & GENMASK(4, 0);
+	u32 vpe_id = (cmd->raw_cmd[1] & GENMASK(47, 32)) >> 32;
+	int num_pages;
+	u64 base_pfn;
+	int ret;
+
+	base_pfn = hyp_phys_to_pfn(vpt_addr);
+	num_pages = ALIGN(BIT((vpt_size + 1) >> 3), SZ_64K);
+
+	ret = check_table_update(its, vpe_id, GITS_BASER_TYPE_VCPU);
+	if (ret)
+		return ret;
+
+	return track_pfn(its, base_pfn, num_pages, remove);
+}
+
 static int parse_its_cmdq(struct its_priv_state *its, int offset, ssize_t len)
 {
 	struct its_cmd_block *cmd = its->cmd_hyp_base + offset;
@@ -191,6 +211,10 @@ static int parse_its_cmdq(struct its_priv_state *its, int offset, ssize_t len)
 		case GITS_CMD_MAPD:
 			ret = process_its_mapd(its, cmd);
 			break;
+
+		case GITS_CMD_VMAPP:
+			ret = process_its_vmapp(its, cmd);
+			break;
 		}
 
 		cmd++;
-- 
2.53.0.473.g4a7958ca14-goog


