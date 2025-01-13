Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A3C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yjgJEm+zsHpgnh6MvvlrOCLzGs3HMBzj7m6xU9nO/zQ=; b=JCUtjIkY2JYG+xGaVIvfnB5XVa
	pvUWNawwFDyxgZeg6gTd3edHhGKeR02Ktm6Itp937epa15OB2EJzAsa5redzMWR6SfQ9ze9a6CBzS
	vG5qnNRIJqL/3K08fW/R1RJpak2hba4W5VXcrmOTst+TFaOWRsI7RfOxlwiLoRAzqLmEWIdGlsKyd
	Kklnuwoz2BGbRtKLCTtofzp2VxGcafZGygfZFXS/Pj4P77ncHRb+C1+jJn5eEOk0MUWZo07I7xXoV
	HsYoZHiA8fvuVtxnFBmEWGOMr9B7mmm5K/Lu9qqgrTWWTZ1WMvLwMK1gUAqbYPsKNjvFBApq+JQsb
	PRr7GciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLKT-00000005O4u-1Ys5;
	Mon, 13 Jan 2025 14:22:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLJE-00000005Noe-1y6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:20:53 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166f1e589cso90653275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736778051; x=1737382851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjgJEm+zsHpgnh6MvvlrOCLzGs3HMBzj7m6xU9nO/zQ=;
        b=QGhTKGJRMt5QIIK0oput4gvmFKl1ttHTgwRaB1dh1Chqp/2F1AKZBNGYxKjDDfDWY2
         K7yjB0POQdqSD1gO80zAqgbTHnyYE+anNPc2RtyDpQIu5vnRkdXGCetXpKRa3dBxAaAe
         ZUlHnlFZ7iAlIB7OA/lQovT21KJX8Ly0yvGnWJS1dcplt8S71q5uD1FLHE4nsZXHe5w/
         QbG4B2GFw0P2KKaKH5c+KhVux2vBZM12q9V4Z2qkSvPVWFdAbwS+akcE9seIHTeXPfxG
         5od3nJPMF/ReFD5UlBCuJvw2TN+O3bh7Ay6iQ9nck8XHQS561ya8HURKkniNs5hmYlKY
         MmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778051; x=1737382851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjgJEm+zsHpgnh6MvvlrOCLzGs3HMBzj7m6xU9nO/zQ=;
        b=vb3CZe4kwLkxxyuXdpx2ifUdMdd/L2P3AM7rs6ADWgcC317i2LReNq4KLYmVDdjM/8
         6b4kO372E01HwEq0TtGYGBerh68sIWOnkCRiY3/phznBo+KdpqO0YhGejXF7BtjNiNY4
         DblxEd1IUzNEn1CT2RsxB1KpqlczMRHi0/vqQ+lUgFA+qIsLbxRYDnN1gyf98YLdJRdj
         bpUl/Sn/2cLEVHy7jeK2sZwWqjXfOA1ypp86d5HVIYBHR9t++d+SQFxg+RxaqxVhtMMO
         dWVsffdl+RjS7eZJYbmJKXv4NlVHd6uCDzK5CYEF/VQ2cCHna2TQ8RdmCQlzPJCjOELP
         aJNA==
X-Forwarded-Encrypted: i=1; AJvYcCXOqrjjfq1GICyh9+dS/GlnmspqU5C0uTBXwPwW+Sf2ZI10Ellz8zaXMOEXwWh4ma/5tv3pOvx/4tMjNwfficyX@lists.infradead.org
X-Gm-Message-State: AOJu0YzqSEZt4XUZNiZVVY5VGEoGeOuBO9XgjH6e9wuTFNiGR8+Zs8Xb
	x5i0v5bTptD6WR5z/Xf/r2RvLoRo+yUB/SM2pQnKjoFzRfy/F7tA
X-Gm-Gg: ASbGncvdzhImPE0b/Jwu7+SeiP7d40a7+I0jq3DrtGeQw//+CvYVmE7ul8UvGjLSopd
	ruj8lIM+DHgbfLVdUKXSgIRJ9QFn9qJ+Eemszk85GXbPkW8GWYzKGigqz8WXX8c+C+iG/hUlM2A
	q9Sh55ezSnN6z7An8Fx/ARRv5UUABLI40Dso0TK2dbaYu4f9lIJPgx/h8e67d5IrLSFbCKvuV8z
	DooNbMKXztJSAJpqyIgEHnvCh48EpiAFVDLlVrHoVQA31KhLdW1c52cmBWXcwXZd4j+3g==
X-Google-Smtp-Source: AGHT+IGOgpQygxHN474HH35BO8I0IxWuOevbbQ53X03NN01ieJAvLtEHwfIjUcmb+msVKrMaDxXj3A==
X-Received: by 2002:a05:6a00:3c83:b0:71e:4296:2e with SMTP id d2e1a72fcca58-72d21f4bc9emr28805500b3a.11.1736778051319;
        Mon, 13 Jan 2025 06:20:51 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:20:50 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v2 0/3] net: stmmac: RX performance improvement
Date: Mon, 13 Jan 2025 22:20:28 +0800
Message-Id: <cover.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062052_510357_AF3A2D84 
X-CRM114-Status: UNSURE (   8.85  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series improves RX performance a lot, ~34% TCP RX throughput boost
has been observed with DWXGMAC CORE 3.20a running on Cortex-A65 CPUs:
from 2.18 Gbits/sec increased to 2.92 Gbits/sec.

---
Changes in v2:
  1. No cache prefetch for frags (Alexander Lobakin)
  2. Fix code style warning reported by netdev CI on Patchwork

  v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=924103&state=%2A&archive=both
---

Furong Xu (3):
  net: stmmac: Switch to zero-copy in non-XDP RX path
  net: stmmac: Set page_pool_params.max_len to a precise size
  net: stmmac: Optimize cache prefetch in RX path

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  1 -
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.34.1


