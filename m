Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96624C5B569
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/Ax58T4Q8crjfyLzO+c1sFhNTHsEbLvFPcefzRdh9g=; b=KmmHkotQ6BVa6/U6/M0fVTcuuI
	WHtUdRTAz3l4acTDADQG15GnzNhJ3e7r5U0y5PA0znZKTqB6fC0vEX/+43jRi34wL8c5op3FPANoq
	HD5Dvw7wVvNjZ1RX67la0+0d9hMWIPkVOBg/BFr6aQOn872zBJBRG1lwkHqZLfCZtc08oi/JYEJ1a
	QIEh299O+QiimRxClj++zeW8QoFSuGpiSkvONzNt8+2t/gtv8qRgXiDqeNgdrBwmlQgUEzpitMuP6
	V1E9rx6iNXMyuvsNVJFpMP8ymdpQRdlVpCNd4RJMmhVDq0Bw5k8Dr19Q3Jml1yV0UDi4gWcLR9TjI
	AZg1N58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2W-0000000Cf9N-167Z;
	Mon, 10 Aug 2026 18:48:00 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV2S-0000000Cf71-1Gjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:47:57 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso801051a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387675; x=1786992475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/Ax58T4Q8crjfyLzO+c1sFhNTHsEbLvFPcefzRdh9g=;
        b=C1CfFozuPO36cebBNR91XFMw2ZesRq73jg2XnDOX/A7uUtpVkxoLlFHAaZK8V3L9hJ
         V1O7TVICJ7LFYIqEOtBzTDB0GDEboVMj3jYdsCMX87/HTaMj0J4cHxUdx3pkomC7YcTT
         EkM7UeyVKpynJBs+5LTLWFj3uat54uTNddbmFE0I8fLo14reOtH23ZYfsWC6eMPXgORr
         ukxTS4Wt1bKrRADzZKFdF2qdZ0Pnwoqh4ejdMtr6vwebbrp33TZrZHsDtcGg+bvgC1v2
         55+A2b2x+kZXo9t67ceag+U1isXoS8J2Kar37ZkoTQs+64vCDHhi9UsIDgRtbnLBlo9t
         kOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387675; x=1786992475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/Ax58T4Q8crjfyLzO+c1sFhNTHsEbLvFPcefzRdh9g=;
        b=ZiU2xpYmTtbYckxyM1yj3EqxTuJFXHrGUVahovTI79sNuTGsLe4D9kXeY2ZAP7Wm4r
         dFrRNs2m95ge4/I/kiGatNdZ1CM5CN8zikwqP7Tl28XBum5T046qDHtqVOuahlGbM1ij
         l2L0DUSYJQNwjSRPco3+NaQFkXbARjw6EISyHIRYfCySi8VQFoklNRH+tfJ8FuhtCJNv
         ctbhjC9AKnRe8niOYolDlLBFfUTjYLsj5fNxrs+tZUuxHjLEcP0+8fC7tS4Q+7y5BaLJ
         5NgkVloQ/MUjCS5jguM8LJe8hB1OfYjJiUJSYWMxEhPqT8bN5ELqZFcXpemjGrcbMnsQ
         JzLw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3U/7gjT8aNF6fSUu+KtdMok4VLhGME4DbBQlO8skz/+lJ83s3CrYx8I04q3NoLJhocVlaaMpZDwvXvneKi54b@lists.infradead.org
X-Gm-Message-State: AOJu0YyM78vYnwswxIO/XFrZWtXNG711h0bjhZqVLq1JQj45RgmqmPAb
	Q40U4yTaIOGyb6/D5t3a6H5SD3DRcXMb5KIUh160436peIkHsSfAikVR
X-Gm-Gg: AR+sD12LTjOGDJ1qXKLXSLOpEbIFUk9uWK4oajkc0uZbYldx+1LSGSL1/WH86tv8HJi
	duA9RG8bHpp8kRBekLIV+ju8MouuSTglqRDNi7B77C8u+iszJuvi0fMiCz3Ouc01RkiOB5rcgfE
	5Cj8EMoToBmg4OD1WZ3y81geo25qfM720eXVQSssMg2zuj3G+VSSVqPluExL+7PPNDgCS2RUMk2
	MhWplLNyui0xIpzbtMaxBVu1QCx6Ak+si2D+BCEcWJ4Ja9Gr9bBMcOMBoTbBKrRiyC+Ee7P28tN
	mevpWNXDQR0kz4i/ub4QLMrF62G0qa7Ud5R+D3MkNBHQ2aJ2faDEjMvVd4Dq8oW4okMd3HcAVrS
	0NvyUzn1y2rCGPMWKH4RX0j9pFMuVaiGkOVuXkLYJ2k6GrG2mydqmGIUyUXsYn9A7G+M6I4lWfn
	XZDQn9Y1mCFvtQZPIQFqWllrxxc9ABHqILKj3P3XuSGSNwCl/Y7KwQFddGGuw0mD0H
X-Received: by 2002:a17:90b:1807:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-39281b1b0c8mr20842462a91.0.1786387675358;
        Mon, 10 Aug 2026 11:47:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5226b40sm611653a91.13.2026.08.10.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:47:55 -0700 (PDT)
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
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
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
Subject: [PATCH net-next 1/3] xsk: align TX metadata layout across ABIs
Date: Mon, 10 Aug 2026 11:47:51 -0700
Message-ID: <20260810184753.135756-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810184753.135756-1-sdf@fomichev.me>
References: <20260810184753.135756-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_114756_345292_BC98E014 
X-CRM114-Status: GOOD (  11.95  )
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
layout on 32-bit and 64-bit systems. This intentionally replaces the
incompatible 32-bit launch-time layout while the interface is still new.

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


