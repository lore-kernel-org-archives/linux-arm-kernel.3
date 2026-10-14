Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBE1CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/WrZ4/u4jJEQM0ZlZpxNQ2Z1WiaeNhYEi18x7PW/q/M=; b=sLScPqPj4vl0mnKIu2IV6ATL/F
	GIEafWEmqZf/wxria70ykP3ZHObtMysKtnqU7K3VKwYKiYPpWmAnc43lY8cAzukxm6h2lMHmo7agQ
	DEcdLagiQhHKdPZJsS4MN2Nfic9aHJEBnFa6I92R9+T8ZrO1DDv1qqIFdRuaTOpbDOKTotyjYYn/E
	gfd8ZuirCggahDq7XG3gEZ7EC0/tvDqDfSjoflSNsA2M1DhCQvBrInNOweox6SUvGfgtJnjgZNZ00
	qb1WtY83EonqCqKPKWEZxhwI8E13KYfpO2BLhEJIEVl/qg/f3t2MGCu3CDnbnvhHfyMlsT1HPDowO
	24ZQTeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSN-0000000EbSz-1goc;
	Wed, 14 Oct 2026 06:27:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSL-0000000EbSP-2X5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:27:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso4733485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959236; x=1792564036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WrZ4/u4jJEQM0ZlZpxNQ2Z1WiaeNhYEi18x7PW/q/M=;
        b=EBOvM4MRWMfzEDS986M9ObG/bDVOGlpuQLLcY9OSobTEsdXc9xslV4LIE2CbRRaChj
         XlAyrB0Ka7roUEJGz4PzCwjFmPzf639giVTgkPFqFYrJe+OjqulSaFhcI8628Vvp/WY3
         fFYjUf0Ja2z5Iw+D5vzRvD0+r14JYExJ7JIo6SBEnEgqa+btP8C32iCuKfO4/RYWlo3+
         9dWeWRxRT/mZQvy89m12zfiGHjKqxiny2iuEZ2GiW+PydmjX7pAnHnjZjasSWHu+LINV
         xEf0vAyqnxZCwkjUTfviIz8dm1eZw/3aRFFdY5/O2QxBgL+m2IJDeefgKEkfKM++sjSJ
         x6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959236; x=1792564036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WrZ4/u4jJEQM0ZlZpxNQ2Z1WiaeNhYEi18x7PW/q/M=;
        b=judJY9zvJ3VRYzKfZmmr0vjVfW/Efn2/jAXBRoURNppLAHShXhy1YpoTBr5bFE6/Tf
         N3oLf5ta3/QIC/prInGMtTwPPjraWXbdPR2TzKeQlkmyyCNJPIcBFZOpjo1Meuic3HGh
         IIrekxjhLfdF1e7pclowFYvbHTj31BQcz806P64hiGacKBgSSTf0xTZ6PIa3EKFI4gs0
         LwH6n5v3OmwaqsDZpeUTEWUmvsur0D6F5wAhq7ISmdRRwsBEQ0Nn327WhYhxy6TkGM6U
         3Yqp/U0kECsB+Tm481+Tf3gOYIvUwP1pO19t79R5sPGTvwmZUwnNSOKPc5q500Z5CvSb
         nL/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxW8Pjtkz/PCpHmpVNmf2bPfbUnKXb/0l+AHJbqBHOfdiePoqnkyIiy56foA23wqlnRzAJN4RTYz2BRK0PUbPdV@lists.infradead.org
X-Gm-Message-State: AFq9FYJg3PXgo4NYnapctvgiawSTP9/AQwTt3rmcjB6sUyD5rHtw2fff
	0K/LJsaxNCwi8k6qLqKdYzOx08od4CLShcHKjXq1chqsIbkKHmQF03bKIh8IJ8PY
X-Gm-Gg: AYBFou2/dWONjxLKHpRwyo7t4PHnCyHLL+uoyeAu4FKFFlENSSydYEnD8Jgr0qGxAOh
	dgJxbM/ArhOQ/sk3jWtB/ZGplQ3qdpYKNaaAk8s5XUW9jZhwJqnwu7zdwL0g/OAkouw4I1lUTBo
	BlNt0Qz7LnNa+vlEeWdincbE4GZK85JwwQ1S/h+81PMiFkfMo2aqqjJm9ql0voEbSBHbnqAA3mf
	SJtVn2kF0YVuPexBG7MM2CUV6msBWvcUYXOhm+a7wH8DJ8zx9lk/a5cBVDAJWUc82gve4VK6PWi
	DSUZIxg2CspuCBdHESU5Db+LKQen9Sxsuuztox5WeN0f/DWdlyTiXfkuSqrsVFhs7j1J8iUMCKA
	0aXLgUbM5ldEH4jA/3H4GI0e2comG57iygvtwb8c60NtAgh4/+9LnpB+q4Naj1NZ4fuOFcwXa4H
	RxM4fzGW1mUwcnqQ/GNK39ZH0CI5O41Y2C8zGtKFwvk3V097I97zAuZ5bXuFqAUOStOwWUs/ads
	GnCb85nFUMQmk0bf6VyujNUpKs6Bf+GVYLJpXvt8BBHvB3/30BpriTJhKjBiYpKg7hBcKPJZPO3
	MxsbOuanrt26K1Gxlb8tAE6F0j8KYNGokIN2NrMvONPpcuj4KuEUmV82yXjGK5D1Lv21axuL+qO
	3dTZ7G5XqhfF2
X-Received: by 2002:a05:600c:19ca:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a18e4487b5mr298737055e9.1.1791959235651;
        Tue, 13 Oct 2026 23:27:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/3] net: stmmac: fix DMA allocation and IRQ failure cleanup
Date: Wed, 14 Oct 2026 08:26:58 +0200
Message-Id: <cover.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_232717_660651_AEF4C749 
X-CRM114-Status: GOOD (  11.78  )
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

A DMA error-path review for the BeagleV Ahead found three bugs in the
common STMMAC code. Partial allocation can call buffer cleanup without
the metadata it indexes. A later TX allocation failure leaks the RX
resources allocated first. IRQ registration failure can release
descriptors and packet buffers while DMA remains active.

Patches 1 and 2 fix allocation cleanup. Patch 3 fixes the IRQ failure
unwind independently.

Testing:

- BeagleV Ahead, TH1520 DWMAC 3.70a: guarded baseline/fixed boots for RX
  and TX allocation failures and normal-open IRQ failure. Baseline runs
  reached the guarded unsafe boundaries. Fixed runs cleared the tracked
  resources and stopped DMA before cleanup.
- A matched follow-up applied the same RTL8211F-VD resume repair to all
  baseline and fixed kernels. At both 100 and 1000 Mbit/s, each variant
  passed eight close/open cycles (32 total), delay-register checks,
  pings and bidirectional 1 MiB SHA-256 transfers with no RX CRC or
  DMA-API errors.
- Native-XDP IRQ failure was exercised on the same board. The baseline
  reached IRQ unwind with DMA active and required a test-only rescue;
  the fixed kernel stopped DMA before unwind. Both reached descriptor
  cleanup with DMA inactive and no DMA-API errors.
- The physical native-XDP pair used CONFIG_BPF_JIT=n in both variants
  to bypass an independent RISC-V execmem Oops after the STMMAC unwind.
  The default configuration's XDP-open path remains covered by the QEMU
  fault-injection matrix.
- The exact combined code passed 24 of 24 checked 64 MiB transfers on
  fresh BeagleV Ahead boots with no DMA-API errors.
- QEMU orangepi-pc/dwmac-sun8i: 36 of 36 cold boots passed across the
  allocation and IRQ matrices, including XDP-open IRQ failure.
- The exact combined code cross-built the STMMAC objects and BeagleV
  Ahead DTB with a RISC-V defconfig and DWMAC_THEAD enabled.

The guards and fault-injection hooks are test-only and are not in this
series. The RTL8211F-VD repair is being submitted separately.

Based on 24a19b953e2a (Linux 7.3-rc7).

Karl Mehltretter (3):
  net: stmmac: handle partially allocated DMA queues
  net: stmmac: free RX resources when TX allocation fails
  net: stmmac: stop DMA when IRQ registration fails

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)


