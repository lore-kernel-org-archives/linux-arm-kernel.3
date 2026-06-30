Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=; b=EQSTOZ2mv4AW7fdNVMAwktDYNX
	wUyAJsFkxE8fWAES14NyJG5Jj4dS52LxyGkgJpal3i4VtpQlQ3EOeOz9zPXdYJ5stvE9lY7WWbVoL
	qz3YWBBLntxDm5yIra7qdypcVMF+w1H7OQXfBQF1gjiTZ2uSbZF4TsnnQVKyJ6MhJ2EJOjerpYSPP
	Zp1UAq+Jby8fVkkXThHwuE61BaZFCvX0yKuEjSDKwJL2D6pXLSB7ClfW/qnYYR6OxTDtB1lVhdhAZ
	mrMu/If7Lt+42W4JBm7z0ZaPsP3kzTvh+Qg5++36CyxCYAZ2fkgdsfCP0QmqeGyYKSUZEFCFwxqx2
	cfikRyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ7-0000000G2zD-2HRj;
	Tue, 30 Jun 2026 06:58:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ0-0000000G2tz-1xMu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1613340f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802683; x=1783407483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=rDv67gfTy6y5mz1fu3ughc8DTwSxwU42RBaLVy+IF4ZRxtJIO3Zvz7fOvDOFtVPSaE
         68qZK+zVGvwDSW90V0T3VisNmxfiqu8LAvvSDWgN7K7BI9adIls0sUlIV1uESJVLeOSk
         uvYyPL6AOlaslklQWH3OBgvEvcl1JkSh5WNYAxIOkP55gOHIZ9KCoS3VK9UcptV5vl7e
         /aKNvfsiSgrunXA3cosrNzxU5Mw8gDlsFlVvw9AtU7OMMNJ6ctakECmvQ1be+RtJpw+w
         jvC+A7sTzFoX5Z35cqEu0bHams/M8ZrafVCUa/MqtdYVPPjXdUxnPJybQIWrlEgLN/eT
         Qc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802683; x=1783407483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=hbtn6jInVQisgR9h8MaruKJP76lCCkgDIGGnPm4nNem9dFwMT4YUl6ycuy6ukTsXKK
         k62ChLwutcbTRuY3p0EY2JjlhSyTdvWj7IlAKiZTQrf7O5YlGCNHjBrSgLMP8NPHomCo
         uV2R0BS6NtParlOkaAjyLAk/cvpHlPBZtTRLBAXLcQ4vL81ySRuOo4BCSxunrqHlWkhy
         HjHvigTujuQIXNdWjTOWoHnlbEqDfj3k3IQMHOr9WEkNBkbfBo3lREfMdUYZQDYjhyy0
         McFsv2u/78m9qqCxNzRajZtGSliQsGJXUq2VfHP4Afns+i+jC/rFGoPfB2DVLSn0BCsj
         2v4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkYPb6I9MRu1sovL31k7OFtxKetLabUPahrBccmR4Mjz47EbyCp0spUHRQC7kjxe2Gs4choWHK1LJ6JGpbY7Cf@lists.infradead.org
X-Gm-Message-State: AOJu0YwbKvlOY/S71WsQ2hZF+4krhUyhwR2x+jZjoJn/WR7DbOYbZMIZ
	KY6qiR+XfYckFDpI3J68Rf0/N+qP49XX7MEJC9ZTMhPPnMoBeaiCeMf4
X-Gm-Gg: AfdE7cmuszGZ+g4HKyhwC0iO4lvSApUbltbQimv2Uid3SwHCdvZTIKqS/UPaHAXf5wk
	C7KjMLWu45DO24CsNSnTiGrqkD95NUp0gfEkQmFzXKk6dxCrnpPrqovXeyMKoPYG3QzR0DigSgG
	xcb97i2+mtXfd/7PJHzBbkmZ/gO8ccQrj6nZPjyQs7vnz95AECLBvMcN0On3DteU1OYk1HdL5Iy
	wXWK5nZYlAmKj31jtVEYVdsh2K8IxGIO+9RdDGf/LamQIRnvVW47B9DQfPIQdotfI2FERuKDdtV
	KZ5QEDZTDVwZQDyiwj+ztYqdTzEhDiMJ/ak6z1uZPpWpvAg0LtqcIMIAuLmQ13+XLG9Bson792k
	J4gJcg4nvNd3+vfjkn68jEsFVrDxaSAWlkr6snJUXpV1Zl3MhnG5QWZKpp2at9RYGEVTPboZ635
	mRpGeRxcQ=
X-Received: by 2002:a05:6000:2c03:b0:476:135a:1349 with SMTP id ffacd0b85a97d-476135a1477mr139610f8f.6.1782802682657;
        Mon, 29 Jun 2026 23:58:02 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:58:02 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 4/5] netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
Date: Tue, 30 Jun 2026 08:57:34 +0200
Message-ID: <20260630065735.3341614-5-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235804_514040_F678B0E2 
X-CRM114-Status: GOOD (  11.99  )
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

From: Ryan Chen <rchen14b@gmail.com>

Without this change, nft_dev_path_info() hits the default -ENOENT path
for WiFi bridge offload via WDMA on MT7996. When a bridged flow goes
through the MT7996 WiFi device, the DEV_PATH_MTK_WDMA step does not set
h_source, causing the PPE entry to receive a zero source MAC and packets
to stall in both software fastpath and hardware path.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6c470854127f..580aa1db3cb4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -219,6 +219,10 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			}
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
+		case DEV_PATH_MTK_WDMA:
+			if (is_zero_ether_addr(info->h_source))
+				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
+			break;
 		default:
 			return -1;
 		}
-- 
2.54.0


