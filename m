Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA43C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zUqneyGoRi5zO+Pb+RiK7Bj3mze6rvm5S1Nt9aVy8g=; b=pIcJOKiRj25PUtYVqSitv6v55j
	YGDSwS9wlmg9XZGmZsj1lnIArL+HcEdM3nLRV6UZX9kvJ3lD0/a57tMGvGgiCU8ojyv4AQn6D5BvP
	3rZDPtOMlb04A1HFwSXTSX6uYYVSh3l0HT0RYI4baJzlz+rEJhHj/dyuqXLCfsLz15U7uS4F8TEYs
	OTqWTLJ4R7Juhhn+SiHRG7nak1ywGlV7tYhK6k21qRpe7PNz2kLbJMs5HLYnfvhLfxjN4BCa9MWJG
	l2J8vAPBitxLhgQQCAyH+90oPqWkGbec3WOYwxH2tTH93hhf1bKGM1Oo4c4GfkGVzgPVfitLyrQo1
	Ikp+rwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfp-00000008SDl-3Uaf;
	Fri, 07 Aug 2026 16:43:57 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfm-00000008S6v-1JsX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:55 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6983e9c028dso2866161a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121032; x=1786725832; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zUqneyGoRi5zO+Pb+RiK7Bj3mze6rvm5S1Nt9aVy8g=;
        b=a0f2Ib6Vq3J0bTPA81lGi5t2anRYUndGbcfcip3HjeRAMsOSR3wFE/cSVkIJMvvgVs
         5FC5OKGcoUaw7IIt88H1/+Auw4fHrABc+ALfQ5hEdFnsVzCkNPum7RVkWr4NQyKdU9Gt
         IayvmeUhRN7do00fDGWlilStbBsO/eI4aTH5E8IHhOL4UIJhPLh4mw4R0DpKwxT/+iSb
         S/tptJJArWwkoX2rygxv4temmQa3KxtGaLp9yWnznjd7FUuyRqq9YG+0QwXa3X2wCLbP
         VOYJwsRu1tUwE0FpajQKgeo+CU0bBSS+uwpcmbXEedyFFiEEZpgMtw4xlr9aMvTBSwlk
         mWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121032; x=1786725832;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zUqneyGoRi5zO+Pb+RiK7Bj3mze6rvm5S1Nt9aVy8g=;
        b=XEx+Nqwpl6+R29XgA1Zq9dDvOFBQikMDKDZqimOwm/qcp6yZwbmc9U3SRReqto7XTg
         adX5KPrBSBD9iEBg+8m2s3QFDFwCM2QJKpReLr13pG6/gDmIri1KgFS2RTRZ9HWIY/P5
         Qx+NRbnpnI8gbT/KV32YQ4WlnlPqPVaC6M2oAKiVnU2Odck3VuWOVdhPApAtd4FqxvyJ
         ITcAngJciMb7ZDwQh8+/YX2RSfbYwUtsjeg69mYiZVnMMAEorXPbQjhEFPrkIFpK60KP
         MwoiNJ6EUnPO/bkdlQL16/z6adUeisxDW2NNk8+rZLrpKkVOHDl2+S36g0ckN8oQkEOU
         peOA==
X-Forwarded-Encrypted: i=1; AHgh+RowSYn27ndqT8qJ/HGmH/ejIxOmh7x9hd7w9yjiBxEN4NjZKRWcyTnAWrJcZQ3ynuLUz/+ure+Xd7nfbHaLuSR+@lists.infradead.org
X-Gm-Message-State: AOJu0YybYV2mLJxp2J+m8vd69OaZ2MxUe9rzV+3fmXJz2/iwUJuu9XLE
	nPv4L3Y1VXzTniMr6bkpfoTUfUFvDxGUH4qgal9zbaXKSBKAKTLSMbfA8JZ6vxcQC1cCwJFKtsO
	v2q0VrHD02hT2HMbNBBsyR266raWrZQ==
X-Received: from edbfj6.prod.google.com ([2002:a05:6402:2b86:b0:697:8356:d9d6])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2394:b0:6a1:7718:ad44 with SMTP id 4fb4d7f45d1cf-6a17718af13mr8635625a12.21.1786121031567;
 Fri, 07 Aug 2026 09:43:51 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:19 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-11-sebastianene@google.com>
Subject: [PATCH v2 09/13] KVM: arm64: Trap & emulate the ITS MAPC command
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094354_369036_CFA49CE9 
X-CRM114-Status: GOOD (  10.78  )
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

Parse the MAPC command and verify if we need to do any updates to the
shadow collection table.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 071a08d3602d..5629e2a070df 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -332,6 +332,13 @@ static int process_its_mapd(struct its_priv_state *its, struct its_cmd_block *cm
 	return track_pfn(its, device_id, itt_pfn, num_pages, remove);
 }
 
+static int process_its_mapc(struct its_priv_state *its, struct its_cmd_block *cmd, bool rollback)
+{
+	u32 icid = cmd->raw_cmd[2] & GENMASK(15, 0);
+
+	return check_table_update(its, icid, GITS_BASER_TYPE_COLLECTION, rollback);
+}
+
 static int process_cmd(struct its_priv_state *its, struct its_cmd_block *cmd,
 		       bool rollback)
 {
@@ -342,6 +349,10 @@ static int process_cmd(struct its_priv_state *its, struct its_cmd_block *cmd,
 	case GITS_CMD_MAPD:
 		ret = process_its_mapd(its, cmd, rollback);
 		break;
+
+	case GITS_CMD_MAPC:
+		ret = process_its_mapc(its, cmd, rollback);
+		break;
 	default:
 		/* Passthrough everything for now */
 		break;
-- 
2.55.0.654.g21b8a5bc05-goog


