Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6471AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7rQxNaXNWqb2c9lwuccfrB1MuTuQX8j+1HrCiB3XiE=; b=vwAckdcjWpWFa9q/3LrSflNhW/
	IC0NdIMgYIqJ8QzDB2UqI94Z8fklTQ1c6OSqMTLzNeFpKAruEsNTdZx7uJtmT38DPxYa6HbHDgQtI
	ZAAavYmIa+MH0GlIUtKQY3qhbqWMYYUnDtkKpgode+fuVxyc8ikEKp2YeWAo5abeEFDGYguoHoa5B
	Yde8rlnLfviTns5enguaRQIjwbqqpbEH6Yw3aPZPcCnR9dc0TxP4EiErgGHy0FcjGmUmQyACoVTZu
	7pF4Y8diqDyZlwHjP2O+jebd8VFCoSh/2ageQbKeWb6i6CHWLs5nsWWeHDEuBrAI6NX2IeIjqjHl7
	4F4nlfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwinq-0000000A8z6-2PHk;
	Wed, 19 Aug 2026 16:06:10 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwinM-0000000A8vW-06tD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:06:09 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-38fd9408220so402292a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787155539; x=1787760339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7rQxNaXNWqb2c9lwuccfrB1MuTuQX8j+1HrCiB3XiE=;
        b=nRn32z5spotE3pJ1AUuaYj8KdA5ZuHBrs43T48useaXECch2d8lIuO3P1PT7vIGWLC
         DTI4SG1k6oOcrN4cVWZo2NvPIroX2NodUdQNgudV1qbCT6iOtmPb9mdOzGXzUEMwTAY3
         Zh9eLVnzYca59P6EaRLo3CpD3gO0O8fCLb58MzwYZG2pBKKaaGb2PIqSQioI9zC7wn1r
         k8Y/nF2ENMfo0NBWCP0ITsa8NkIvp/c48b+QJSkKVzgl4K1nkjJ4xTMY+jE2EeR6JTer
         cp5FneDoOurEL8bhrQ2uSGDk0vBcXfyzY4N+MgbWrAsnlIHkz0ZE8vUWo3bNenzl5v5s
         /F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155539; x=1787760339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7rQxNaXNWqb2c9lwuccfrB1MuTuQX8j+1HrCiB3XiE=;
        b=P/L+FQJgdhj5d2Pw80q8fwcDSc8DXDlGFsJR+D0bDhsnlJeaS5638QWAbkdZS6yq+O
         TTdFsc8K8RK2Db9A9HSheUSXXFEwFhu79TiyCSNY3JTgyJHZQm+V5dUWSXG1TrsJz6xh
         rNCdajh9Gko2PpGMporaqIXiDDxrrfnx9MRU6Ler9QoAXVBZZqcnKgLHD++MbCLR4wQ+
         YkYdErQSDgrBmvLQzgs48gqTJHEAVmt+ojnLdLIu+ydnbZFnxAZh4d71jDp7f8mF3GqN
         U2iBwVBhk2L0Z4t7JSvFoheOVwal88eJTKgLPyIh3CHgZLVLTLE1h1ROdRdZbtelw04P
         kXig==
X-Forwarded-Encrypted: i=1; AHgh+RrvXzRxvTbcSG3cYC437y6Hlk8Y2pEgZYZbMboXjAQ9o4Tjh+A+9Ub8vW7+yyJBWKSew06lBW7in9T22mOHG/cd@lists.infradead.org
X-Gm-Message-State: AFuF++kH/59WHca7v8gFkGupFVIna1WHSaXjtBOnBohD4FOSrbgyrUpx
	evd7vwqmLRtphhom1L8BdIYs9NARcfzyLboMWbjXSpUt8ML5qpyZhRZ7
X-Gm-Gg: AR+sD12qLIJzWIkzMXcY9aZfemieTfb6FzGC2Fx9wljx8T3mfTmYuHS6DE+m1cdymKY
	y6Qij6juGb5N+zrxGelbFJ+41xQYpmfgDNCCYEzo1lZwvsTtBGgyI9BwX5jP2KisffGfJKNWKYV
	JzeNsrlIVoK0/UBQDgSnxjt/Qe2Ye9QPRHZAUXCv3JFeHjfV0i4wseHQsxuSUOl298WTzJgWtnZ
	cRSpGssamqWWF1GX750UdM4LmxvwoFdFTKozUNxzTv9MsRE3tXcUqEwbMgzcf2ypVJTza0OlDij
	X+9sTjN8r5a6CgD4i5xxx+F1SolHTgKGpiIFSBdIsQ884+qrYFmTXryB1mvroQZj7Q1OXihTZsj
	uYCs0jO+mKgTm4HrMHCX6P5QIcQ6FQ3YW0c6b+U+J8QSfJ7+3muUHJ5zOX5TnnRhhm87DN5ya+1
	1aqUBFXZNfY+8b+xd0u9/Y2BqV3idH/XrHJHP+hqiUh/1C38hUyz3Mew==
X-Received: by 2002:a17:90b:4d0b:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3958127d8bdmr9857765a91.15.1787155538709;
        Wed, 19 Aug 2026 09:05:38 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf6849sm3011405a91.10.2026.08.19.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:05:38 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	guoren@kernel.org,
	dtatulea@nvidia.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-csky@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v3 1/3] xsk: align TX metadata layout across ABIs
Date: Wed, 19 Aug 2026 09:05:33 -0700
Message-ID: <20260819160535.1472459-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819160535.1472459-1-sdf@fomichev.me>
References: <20260819160535.1472459-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090540_070228_4532EA07 
X-CRM114-Status: GOOD (  13.18  )
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

Add explicit padding before launch_time so xsk_tx_metadata has the same
layout on 32-bit and 64-bit systems.

On several architectures (csky, i386, nios2, m65k, openrisc, sh), the old
native 32-bit layout put launch_time at offset 12 and had a natural size of
20 bytes. Using sizeof(struct xsk_tx_metadata) as tx_metadata_len was already
rejected because the length must be a multiple of eight, so the
straightforward use of the interface was broken on those ABIs. Userspace
could still register a padded length of 24 bytes, though; mixing the old and
new layouts then silently reads launch_time from the wrong offset and
misprograms packet launch times. This intentionally replaces that
incompatible layout because the affected architectures are unlikely to
have any notable users. (x86_64 and arm64 have the most users and are _not_
affected)

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/uapi/linux/if_xdp.h       | 1 +
 tools/include/uapi/linux/if_xdp.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/linux/if_xdp.h b/include/uapi/linux/if_xdp.h
index 23a062781468..50d67df78911 100644
--- a/include/uapi/linux/if_xdp.h
+++ b/include/uapi/linux/if_xdp.h
@@ -149,6 +149,7 @@ struct xsk_tx_metadata {
 			__u16 csum_start;
 			/* Offset from csum_start where checksum should be stored. */
 			__u16 csum_offset;
+			__u32 reserved;
 
 			/* XDP_TXMD_FLAGS_LAUNCH_TIME */
 			/* Launch time in nanosecond against the PTP HW Clock */
diff --git a/tools/include/uapi/linux/if_xdp.h b/tools/include/uapi/linux/if_xdp.h
index 23a062781468..50d67df78911 100644
--- a/tools/include/uapi/linux/if_xdp.h
+++ b/tools/include/uapi/linux/if_xdp.h
@@ -149,6 +149,7 @@ struct xsk_tx_metadata {
 			__u16 csum_start;
 			/* Offset from csum_start where checksum should be stored. */
 			__u16 csum_offset;
+			__u32 reserved;
 
 			/* XDP_TXMD_FLAGS_LAUNCH_TIME */
 			/* Launch time in nanosecond against the PTP HW Clock */
-- 
2.53.0-Meta


