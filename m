Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akUZ9dYiYWC1oUDGRGEMMoCmBNHpXpllEedbay7GMFg=; b=PQ6smTMWALnFPehK8XjTm2Gc/5
	+0mR5ujJvuj/L++B9oNdOQOFoAAeWUFWRpGZVt07nqE4f9u2WO6sKymqnXr2ckcIqrLGaaUkGs2k8
	0RRzGRedPzRvDQEmYZvMci+ONI4+QfAp/0NRhtw+3XVu3NFKrmS2HEkI6PEdqNWTIFP3tsG/pyPsP
	24RXSscWWjVgn34OlLuu7GOLR7pJC2RZyyJJY2MMFOIZJohMB6Zt0MrjW/gLxnpR0trSpw5f44lIl
	YxurFcGkn32ZplFcflQn9xX9KR3+zoiLLMxghniNh8xjE62wueYknJC7JO1hjnuWnGb57nQoweqGF
	lOerRdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamc-00000001QKE-40Xi;
	Thu, 13 Aug 2026 19:08:06 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamZ-00000001QJ3-2Ppg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:08:05 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-380f4166f80so159512a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648083; x=1787252883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akUZ9dYiYWC1oUDGRGEMMoCmBNHpXpllEedbay7GMFg=;
        b=nFhbbLiABFHeIBUfoFySlyaVdDtIzIz4iMcZhKw7ti1BdXKfn4Sg8YklwP59bo3fmQ
         4B/uSfHMa60aAPptayjahs/ifxV3mhyWYFERsiMHfMFdgddxrkfnD5Hrm5dgLQSIx/K8
         DQlaKpUHKCACV1dXdZ/x5bNf8wpVojWUZWa1bhwGp42CzGrcH8Do01HUQJ6kEf3vmUrQ
         0k5Bx4mSvbadKekEAp9UR4D98Ru57+g5rXMzhGAsqm0oJ79SzeIhRn+OWUgfHKTQLuyH
         2piKTN4fE4HwSOC7Eiwdf/6hjCqV1GhT303ZbSWo24OFddbqjX1ar0fkBfkIWP4BqViz
         ZExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648083; x=1787252883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akUZ9dYiYWC1oUDGRGEMMoCmBNHpXpllEedbay7GMFg=;
        b=FDrjwZfRpRZKMUX4bkDy2emJ2WVXpFFTAY5r4R/5PJHxXd0eNWlU2ENGH0Byk686ZI
         ySW7D85M4IhDreCabD0VEV/YUAArv7LXhZX8ohbPBrKPJvubryQEM6822YLmbEmlo+v8
         nV2rzpv7gzKczeS0Q1ZGHeEux4l7T14g6B0tnvkqFzIGnuyShH5yfHitL8BeqjnIgA4k
         e8d1cXlT4iCdmDFCsKi/qXtp3Dx1OGJgMZ/NE13JBS9EAZPKr4TZZiTQvYIeL62MsnQX
         q3h7PD7cENxfoBMnzobBpJZQgK/r0gFozxYS+9QwH/DcgS6+fODr/2Ufnf9nXf0iTyyH
         Xwdw==
X-Forwarded-Encrypted: i=1; AHgh+RoxEyf0HPuNlCwAx7PMgiUCo9SB+dKV9MKngHZlZdxr2epWK3XlM0VDZLbunh21NL/BAR52JGs6Lb2Md8CMZyEb@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdhjbFcu9xR1qf3mb2zKyrUhrO74itpZpxSQDo1t/O03/2V1g
	Kl/BDe+08kg+agXW+QYef1DwnqNsWL+xtbHFJvOPYt+Vno9dgi5F436L
X-Gm-Gg: AR+sD101NppEoiWqFOjP4ckH2J8ANnWNSqOe0f9KQ3+JmNnHRwePfFwfvbzAAR/nIy5
	6m3bcisc9Cyev2V37ebHYSW+D9CGROJCjNZATVVYifKi+2YSmklnLGyvgylQ1A9j7L1LBk32myx
	tQOG+7LRrmTMb2m/eV5Z6inxIOhMDhnrXhMBFA5Z7tsKQcSoYLDXzr4SaoA+4L/SnNKNZZO1fot
	IUFUhT0Y3NuCqeARh+K+WkebosdPn+mTIQ3w9aieicIJTv0ArSVEh6FxwiIdzCRIc8mAuSm6hfg
	1SMj4Ya3druTI3XdUueJvpL+hThNKSxk6B5Ee4AzAsFUE+codS7newtW9+fleLQYcgfPEvmSLcq
	sKsVMKh4C4f6GsC01mHO42On/xOfekNb+egIBYjLtImybBfN+uLF/XWl+hy5d8Zgfx50/xSaeVf
	JmHNtfP8icE35TOpjx3oWH9JPNBbhoBLG7Mf4XDeyQSTuzp+GoPwF+iQ==
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3933b8aa611mr183995a91.15.1786648082609;
        Thu, 13 Aug 2026 12:08:02 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933a009f35sm492119a91.15.2026.08.13.12.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:08:02 -0700 (PDT)
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
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v2 1/3] xsk: align TX metadata layout across ABIs
Date: Thu, 13 Aug 2026 12:07:58 -0700
Message-ID: <20260813190800.222527-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813190800.222527-1-sdf@fomichev.me>
References: <20260813190800.222527-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_120803_758244_904E1A0E 
X-CRM114-Status: GOOD (  13.13  )
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

On i386 and m68k, the old native 32-bit layout put launch_time at offset 12
and had a natural size of 20 bytes. Using sizeof(struct xsk_tx_metadata) as
tx_metadata_len was already rejected because the length must be a multiple
of eight, so the straightforward use of the interface was broken on those
ABIs. Userspace could still register a padded length of 24 bytes, though;
mixing the old and new layouts then silently reads launch_time from the
wrong offset and misprograms packet launch times. This intentionally
replaces that incompatible layout while the interface is still new.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
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


