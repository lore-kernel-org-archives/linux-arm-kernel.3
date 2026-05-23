Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289C3CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 12:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=; b=o9AePiM/fcRCsAam+t4MAmic1T
	OSbANAti6Xy0xKIqBaVtm/WanJtNXFufMesfhIFvRl6i5sB/fZ1AwXdfFXWBzf0eTczCtP0la+kOU
	ZOBp3U0oYEJ3Ol0DAUtxO2UQNvF/wvvW8VMzEFWlLKDO0ihn7WA+uiIvwl+wevYzO2EPLKOk0vstJ
	OKkQFdQ7KlRVyieWLzYymZ93Udp58WOVA3yTq0M0wx2H3v4WqSY8TXt37WsXg9Po9vTwttsZvhoQy
	TRkULwjLKOjNfcwnMEsD51Ggzldq/hMFzTsJQg+u/T7fgplaLPeAioqwBDtbowTPtLjBdDz2mDcTt
	Nn8SffhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGa-0000000DCwk-2iLv;
	Sat, 23 May 2026 12:15:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGY-0000000DCvi-0Ahl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 12:15:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2be1dd4af34so68700825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538541; x=1780143341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=;
        b=RwziMe8e7D2towCSw6xmjNJvYKYAz76lyMamtjkM3gflKt5dOdbFSXl7UoYFbeDgcp
         Nx+nYfXhkGuihjwvbzHaqSdw5+rzs2pw//rL0WUre/QHzvHG/2aWJmO6inWKXBDJRwen
         oo8NyLPhnmHTrOuUXja57KrjQQD3t6TD7g6Q2xMYFlOG380pyKYiN9ZLOoA0KlU4fauu
         YsMLj0HH7e7+uDFhoCiw0GxqKS1lZQBIE0hcBU6K2KQq6sRTCvyEQ3aKGGxpzaAqf7r9
         b8wE8Stkm61qW/GLEsv+fbZQelIznj6XOx/lEas6y0STpNfjhCuOx5yDfXaYdvK1DUqU
         RVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538541; x=1780143341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK7qqqpT4fnZlS3XGu6aIqnYT1MOPYfSV+g6L0GEpFY=;
        b=dj6tyU9xb6uXlatTA2RUQlLu9J3qdW3M12U9dW3Mio+CTVzPWBstXu1mZvzj1Iy0Ea
         8uOyEh3lteb8DdalZyS2aSCJrq8s+ZyLkqRrgnfcJiaEVxn9fSzPOUw1KNlkSJ4zEHMD
         SgFUXwfU24bqZG4KINTha4wYLR7PTDI9IqUS61UqOmQ1wt9xLfAEfvFMtGGGl+SToDYK
         jGp3A9pUvjTXmUrdKyBlhK3OdwRBnw4UH2pX5kvhLv++ZNrWGRRTXCPvfYh1aqP5/c1i
         a+0sjWt7sAvvH3xUv0EuQjSEeChbneaKf6WeLL3Jomjjff82epwYgQLtV4vdzE4LHP5v
         zcHw==
X-Forwarded-Encrypted: i=1; AFNElJ9+EiOajg0/97w9RU+YQckaNo5WBczFBkb5wRW1lnxF5sQWhcM4RVABe3/+uVgrefxnd3sYHdeOiTsd9QvQHUiA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7PaN0/Iq3mDYI1j4UAQ3tVcJfiXQjYKUFyRnEOXh/ezBXDssN
	TuygH631fasmRZ0L1owb2isgEmC6MwzZWtwKsc0dwGWoX0KhfEsX1R4x
X-Gm-Gg: Acq92OHn62vstW43/ejnoa2R+dmqEXRnwqc3SZUloLj068wueB8KxDDVUPVHFYQVzGb
	9wourZHQ/iMet0LpxbBO9lEyuacItmBM6YTVi2UoCWED/ed0HjXZhLqIUUgyhg2Zpo9iTnbWIfk
	jQcd40TpMUvjisJcWfJRTR1eBqnbbmG/nrKUaVh+U+HHChX7GoBQABxWFo4onoyLELWFim9Va7g
	5GM65mSVW4rRBJ4gsp8tR09ZmeFFscWIZvZTFJi3hNDLufHDE8OG5gK87M4imJq2/3N+795d0JR
	5dqkxdWuKNcH38MD7AvMj5kJUnkDAwwZ4/0rQLpaG/8sgSFoFWv0l0y6A7uJSPyHlrMB8Js3BVk
	xAG9B4KNycoZbmwCXVpwa16qhJ1jtT57rZnPqzd9Xf6Q9bdSxxukBDDHPs1Xw2MQr4cfDAFhruB
	4rtVFc/oEbXueYOBT9E4T9z6Mu
X-Received: by 2002:a17:903:388c:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2beb06292f1mr83238405ad.31.1779538540585;
        Sat, 23 May 2026 05:15:40 -0700 (PDT)
Received: from mincom1 ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce4easm41746305ad.30.2026.05.23.05.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:15:40 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH 0/3] Add packet-mode ESP offload for Airoha/EIP93
Date: Sat, 23 May 2026 21:15:19 +0900
Message-ID: <20260523121522.3023992-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_051542_085416_578D7138 
X-CRM114-Status: GOOD (  14.87  )
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

This series adds the missing plumbing for ESP offload engines that
operate on whole ESP packets instead of only exposing AES/HMAC through
the crypto API AEAD interface.

The normal ESP software path can already call into accelerated AEAD
algorithms, but packet-mode engines such as EIP93 can also generate and
consume ESP packet framing: padding, pad length, next header and ICV.
That needs a slightly different XFRM offload contract so the netdev
driver can hand the skb to a packet backend rather than trying to make
hardware fit the software trailer layout.

Patch 1 extends the ESP offload infrastructure for packet engines while
preserving the existing behavior for drivers that do not opt in.
Patch 2 exposes an EIP93 ESP packet backend for encapsulation and
decapsulation.
Patch 3 wires Airoha Ethernet GDM netdevs and DSA user ports to that
backend through xfrmdev_ops. ESP GSO and ESP TX checksum offload remain
disabled.

Runtime testing was done on a Gemtek W1700K2 running OpenWrt with the
same changes applied on top of a 6.18.31-based kernel.

Test parameters:

  - Static IPv4 transport-mode XFRM SAs between the AP and host.
  - ESP transform: auth hmac(sha1), enc cbc(aes) with a 128-bit AES key.
  - iperf3 TCP test, AP as client and host as server:
        iperf3 -c <host_ip> -P 4 -t 10
  - The host always used normal Linux XFRM software processing.
  - With AP ESP offload disabled, the AP also used the Linux XFRM
    software path; in this setup, EIP93-backed AEAD crypto was still
    available to that path.

Network-relevant test setup:

  - AP: Gemtek W1700K2, Airoha AN7581/EN7581, 4x Arm Cortex-A53 at
    1.4 GHz, 2 GiB RAM, airoha_eth wan (GDM2) netdev, 10Gb/s full-duplex,
    MTU 9200, EIP93 crypto and IPsec packet engine present.
  - Host: AMD Ryzen 9 9950X3D, 16 cores/32 threads, Open vSwitch,
    MTU 9978, backed by a ConnectX-6 Dx 10Gb/s full-duplex link.

AP to host iperf3 result:

  AP offload      Sender          Receiver        Retransmits
  on              918.2 Mbit/s    913.6 Mbit/s    0
  off             782.4 Mbit/s    778.6 Mbit/s    3569

This is a 17.3% receiver-side throughput improvement for the AP TX ESP
path in this setup, with retransmits eliminated in the offloaded run.

Jihong Min (3):
  xfrm: extend ESP offload infrastructure for packet engines
  crypto: inside-secure: add EIP93 ESP packet backend
  net: airoha: add EIP93-backed ESP XFRM offload

 MAINTAINERS                                   |    1 +
 drivers/crypto/inside-secure/eip93/Kconfig    |   10 +
 drivers/crypto/inside-secure/eip93/Makefile   |    1 +
 .../crypto/inside-secure/eip93/eip93-ipsec.c  | 1413 ++++++++++++++++
 .../crypto/inside-secure/eip93/eip93-main.c   |   69 +-
 .../crypto/inside-secure/eip93/eip93-main.h   |   38 +-
 drivers/net/ethernet/airoha/Kconfig           |   11 +
 drivers/net/ethernet/airoha/Makefile          |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |   51 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |   69 +
 drivers/net/ethernet/airoha/airoha_xfrm.c     | 1474 +++++++++++++++++
 include/crypto/eip93-ipsec.h                  |  132 ++
 include/linux/netdevice.h                     |    3 +
 include/net/xfrm.h                            |    8 +-
 net/ipv4/esp4.c                               |    6 +-
 net/ipv4/esp4_offload.c                       |   29 +-
 net/ipv6/esp6.c                               |    6 +-
 net/ipv6/esp6_offload.c                       |   29 +-
 18 files changed, 3324 insertions(+), 27 deletions(-)
 create mode 100644 drivers/crypto/inside-secure/eip93/eip93-ipsec.c
 create mode 100644 drivers/net/ethernet/airoha/airoha_xfrm.c
 create mode 100644 include/crypto/eip93-ipsec.h

-- 
2.53.0

