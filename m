Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCABC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/yuadhswZztFZIXp8O1C3rG4scLLGx4YqdmEAm1GxE=; b=chdn/WIoqxkzlP
	s8jWHA87Ns3q1NmNjhnHJOhx/K8Em0yyYZuc1lL/Oyhv+IDEo5z+U5C/6HzIsMNaBj1VYrARdy+Ya
	eQsX+FxOS3fvezhDn6Ona85d3mLyfPDIOwcOfXIZNAtYfM8F44XxTfhnJllUyn3hO3HXFhw/3o8sP
	LrNX23ug5jkVVb2Td8TZ7DB6vmcEbGUkfxof9xS3+kTqHouAU5UeWfz2LE8Dzu/1Z6Oy1EDHTO3nv
	GWkgwM0zqDfkm9LehLJ+OcR/2KGj2Jhn+mIYrE+qRH0Ne2GoMZGvSFltB5Qld8yHksfpUtHBNrRep
	591F21XSkGW0g7NjsWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nV4-0000000BoMt-0XiD;
	Thu, 24 Sep 2026 17:44:50 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nUr-0000000BoHi-19Vs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:44:40 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6b34face6d0so55781eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271875; x=1790876675; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/yuadhswZztFZIXp8O1C3rG4scLLGx4YqdmEAm1GxE=;
        b=F4zRA+T6MJp1nRyf7aDPI/zMDxQtsw68kDf1RssT/+HleItRWcpZwxyp6QAuxONyyG
         N8Z50qN1cPfdOsAGnSo5LCqSBH7ro8KiW1K3ignbp/rsq0mPDhUe2YNUkkEHXaUvrfpk
         o5jg3h8lHoIxQ86l49SfqyJbnvl0t3WfhhmQJ3pGMKVMTLn4gQFBp8ZsjYKIVEbBEIoF
         ULGzsVAtn2gCNV5OFGDYM1xtiwiyz3h1JWuzzciXwboNFBN35ebgFBbnAglaBYsrPdTj
         2kv9EjgIo8RIWdo5neTk4Bq+SM/T9xTmKzobKUwdLz4j0+NxBP1R95r9TwrGZRls7Efj
         CR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271875; x=1790876675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/yuadhswZztFZIXp8O1C3rG4scLLGx4YqdmEAm1GxE=;
        b=0l6Q+/Fd3m/Ml5vSGxZR+OfRsOv1IGmuu8lY+h0WJKWP3MWYSJtjGNjMuJzU27zqgg
         OZl83dy5104TLI5EauyB9OEZM3skdxojUxT2tmm7ZiBdmVa2PzbwSgLj89J46v1DqiAG
         BpN0Uc8tacrr9rIZb/SnM7Cb2E8g5ojR6jVW5luW1CvS+R/GZfzd0UziV+XsxCQ6l83Y
         Z5cWaVfWH/e1O1n1RDgO+DNMjZV2DglAipGKXhF5XD8KfRDCQt4l+BG8erJS6leYE34b
         BxXSO85VZPeFGI19lm3v8psB48Ne51TYDS3uWPDQRupcnSWnvhPkiyeYERuzUqUjmRMO
         N8fA==
X-Forwarded-Encrypted: i=1; AKwUvByEcRNrOeMR4DP6x8BZmY/saMecVEZTQI6f7dIJLly31qkBuqFDBCKLBEz6twsVWWrU8JLViDreWLvSaUSQbl2V@lists.infradead.org
X-Gm-Message-State: AFuF++lQOSqLxkZXRWX48jNfRCeenfli/oqvbV3L1ipOPnfuoUVr2BSI
	quUPR3ASfeCCZymjpgpv9p+BmoVjxYRV4fpC59T3zAE7mIWk3gs/ytD9
X-Gm-Gg: AYBFou13JXlLE8tQT1ByCUAJ/SGG3yBirqU2uo7yUBYAbrc2N2+LsiTAXR4CwKGKx5T
	h200h+Ja5qC6FucaAzNVYE3qTQ5yJVeRjoZ95C5O4fuem7qyzTmXoSD8bztZAsJJu7nphysR0oR
	qdnzKjNcmS79pDh0fbThIb6jQTKmlW4eNfAi8XKdpnAqQX2G7wgF3yZCXM9WAqEXISWGymIlv6k
	RS4N4QfmlAJUhIRdqVpJht9bdnkNvmvvwjs01POtOgz/stNE6bG+VHghXZT8rOQNdwg5p04aP0z
	CRpztgf8mYdncdiXL4nmk+Ef/fayh+yljsIBRvCHwagemwP5G6vRhfdAkus3f03PtUuIAmcH0a0
	VNnwokDbKFftZxzadg2pcGaHVfY+yh38NCu1yQiDGerPZtFe0aN6BwCfT11EwP86MNU+kLiqcg2
	41loUzsSIi5eFhitrHcMCwwhS1lIGroKwH7+3i3Xm5BYYIH7RTS+/g/dftVgq9JReGSiPfuPv9d
	/WPTkf+g38xX/rzzZScdQO6zPRc31JcBDJC5791gsjfyJhXfMdEqnxzhti8MAe+8x4elZw43ulb
	UEvuLnJ29mhSt0TaC7A8urgQGb8Yyww0H7CzMzqNbO9ENueL/HKKiEhgXeDz0E671LKYod8nyT3
	54TcRy0ZLWM2pmVHCLkrZIcn2ux5OcAfN
X-Received: by 2002:a05:6820:162a:b0:6b1:9b72:213c with SMTP id 006d021491bc7-6d43eedd850mr2506187eaf.3.1790271875445;
        Thu, 24 Sep 2026 10:44:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net v3 00/10] net: stmmac: preserve datapath state across
 MTU and resume failures
Date: Thu, 24 Sep 2026 11:44:30 -0600
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ6CMAwG4FchPTuzFQLMk+9hPIxRZcaB2eaiI
 by7Y164adJL2z9fO4MnZ8jDoZjBUTTeTGNqyl0BelDjlZjpUw/IseYSBfPPzprAfLBWaebIU2A
 X8yLPomCNlm0nsUepJCTi4SjvknCCkQKcv8OE3EiHFV5jg/Fhcu/8RBQ5/N+9VJy1jaqoKgUR5
 8erVea+15PNpyJuMfyBYcJ6iZSyHUlZb7FlWT6VZXt+LAEAAA==
X-Change-ID: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_104438_055639_A1F6AA3E 
X-CRM114-Status: GOOD (  19.26  )
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

Keep the stmmac datapath coherent after failed MTU changes or hardware
resume without changing the interface's administrative state. Retain the
working MTU configuration for rollback, and allow ordinary down/up recovery
when hardware cannot be restored.

The ten patches separate ownership and recovery fixes from the MTU
transaction:

  1. Correct the WoL/safety IRQ unwind order after failed IRQ registration.
  2. Allow phylink_stop() to finish a suspended instance, restoring PHY
     advertisement reduced by suspend without restarting the failed MAC.
  3. Track datapath ownership separately from administrative and hardware
     sleep state. Close and PM perform only the work still outstanding.
  4. Leave normal-size MTU changes running, including supported AF_XDP MTUs.
  5. Make partial DMA allocation unwind complete and leave freed queues empty.
  6. Keep DMA configurations at stable addresses, use persistent IRQ
     contexts, and drain timer producers before the final cancellation.
  7. Track live XDP release/reopen and propagate program-attach failures.
  8. Use that tracked restart for AF_XDP pool changes, handling failures
     without leaving NAPI active over missing buffers or unmapping live pools.
  9. Retain PHY and runtime-PM ownership during ethtool ring/channel reopening.
 10. Retain rings and IRQ registrations across jumbo MTU replacement,
     restoring the old MTU and rings if hardware setup fails.

The ownership states remain distinct: DOWN has no datapath allocations;
RUNNING has active queues; SUSPENDED retains rings and IRQs; HALTED retains
rings but has released IRQs after failed MTU rollback. Collapsing the last
two states would make close free IRQs which it no longer owns.

Jumbo rollback allocates no new buffers or IRQ registrations. RX holes are
filled before reset without changing the old descriptors; descriptors are
rebuilt or retired only after reset succeeds. If rollback also fails, the
interface remains detached until down/up recovery. This cannot guarantee
recovery from indefinitely failing hardware.

Failed interfaces still receive hardware/PHY sleep handling. A failed
datapath with MAC WoL configured rejects suspend with -EBUSY because its
wake path is unusable; PHY-only WoL is not rejected. Timestamp filters and
PHC registration survive an MTU change, but continuous PHC time across the
hardware reset is not preserved.

Live XDP and ethtool failures leave the administratively-up interface
detached for ordinary down/up recovery. Program attachment failures return
an error without consuming the proposed program. BPF-link and XSK-pool
removal still complete if their datapath restart fails, so teardown can
release the program or pool safely. AF_XDP pool reconfiguration now pauses
all queues and link resolution while rebuilding the rings; this trades
reconfiguration latency for one consistent ownership and failure path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Snapshot debugfs queue counts under RTNL with the descriptor ownership
  check, so a reader blocked behind channel shrink uses the new topology.
- Complete pending core sleep state during close and retry restoration on
  open after runtime-PM acquisition. Use the installed wake state rather
  than mutable WoL settings, and retain the pending marker if restoration
  fails.
- Put the independent IRQ unwind fix first, ahead of the ownership changes.
- Correct the WoL/safety IRQ unwind order, fixing a repeated safety IRQ
  free and a leaked WoL handler.
- Account for live XDP release/reopen in datapath ownership. Stop DMA on
  late IRQ failure, propagate program-attach errors without losing program
  references, and allow BPF-link removal to complete after restart failure.
- Replace the void AF_XDP queue-enable helpers with the tracked XDP restart.
  Unmap a removed pool only after freeing its rings, undo failed pool
  attachment, and preserve TBS configuration while rebuilding the channels.
- Keep PHY/PM ownership across ethtool ring/channel changes, restoring the
  old configuration after failed reopening and leaving the interface
  detached for down/up recovery without a second runtime-PM put.
  Explicitly disable the MAC during release even when link resolution has
  not reached mac_link_up().
- Split the MTU work into normal-size MTU handling, allocation unwind,
  stable DMA/IRQ ownership (including timer lifetime), and the retained-ring
  transaction. Keep the ownership change and its open/error-path adaptations
  in the same patch.
- Restore the PHY advertisement reduced by phylink_suspend() when stopping
  a suspended instance, without restarting or reconfiguring the MAC, in
  response to Andrew Lunn.
- Keep suspend-owned PHY speed control separate from explicit driver
  speed-down requests, so close-time power saving does not overwrite the
  original advertisement and remains effective until the matching speed-up.
- Suspend a stopped PHY powered back up by phylink_prepare_resume() when
  stopping after a failed MAC resume, without repeating phy_stop().
- Add a separate MTU transaction patch retaining old DMA resources and IRQ
  registrations until replacement succeeds, following Andrew Lunn's request
  to keep the old setup for failure recovery.
- Keep DMA configuration objects at stable addresses and use persistent
  channel objects for per-queue interrupt contexts.
- Drain transmitters and post-completion NAPI poll tails before cancelling
  TX timers.
- Avoid resetting normal-size MTU changes, including all supported AF_XDP
  MTUs, and stop rebinding live pools through temporary RXQ objects.
- Program the new MAC receive limit before activation and restore the old
  MTU on failure; refill old RX buffer holes before reset so rollback does
  not require allocation.
- Preserve coalescing, TBS state, PHC registration and timestamp filters;
  leave a failed rollback detached with old rings retained for close.
- Harden partial-allocation unwind.
- Separate core sleep completion from datapath ownership so failed MTU and
  resume paths still receive hardware PM handling, without disabling NAPI
  twice or restarting released queues. Address the skipped-suspend issue
  reported by Sashiko; reject an unusable MAC WoL path with -EBUSY.
- Balance platform noirq PTP clock handling against resources still owned
  after detached XDP cleanup.
- Link to v2: https://patch.msgid.link/20260922-submit-stmmac-reset-fixes-v1-v2-0-d92e609be996@gmail.com

Changes in v2:
- Drop forced netif_close() and retain the interface's administrative state,
  as requested by Maxime Chevallier.
- Separate queue quiescence from resource release and use explicit datapath
  state instead of a napi_disabled argument to the release helper.
- Handle repeated suspend/resume after failure, preserve PHY/PM ownership
  until ordinary close, and allow a fresh down/up recovery.
- Check XDP/AF_XDP cleanup, descriptor readback and asynchronous reset work
  while the netdev is administratively up but unavailable.
- Explain the generic phylink suspend-to-stop transition and why restarting
  phylink after a failed MAC resume is not a valid substitute, in response
  to Andrew Lunn.
- Combine the two stmmac error-path fixes so every user of the new state
  has consistent resource and NAPI lifetime handling in one patch.
- Link to v1: https://patch.msgid.link/20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com

To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Serge Semin <fancer.lancer@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: Russell King <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexei Starovoitov <ast@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
To: Jesper Dangaard Brouer <hawk@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>
To: Stanislav Fomichev <sdf@fomichev.me>
To: Richard Cochran <richardcochran@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
To: Joao Pinto <Joao.Pinto@synopsys.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
To: Voon Weifeng <weifeng.voon@intel.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: bpf@vger.kernel.org

---
James Hilliard (10):
      net: stmmac: unwind the WoL IRQ after a safety IRQ request failure
      net: phylink: allow stopping a suspended instance
      net: stmmac: keep datapath state coherent after reinitialization failure
      net: stmmac: leave the datapath running for normal-size MTU changes
      net: stmmac: unwind partially allocated DMA configurations
      net: stmmac: keep DMA configurations at stable addresses
      net: stmmac: account for failed live XDP reopening
      net: stmmac: use the tracked datapath restart for XSK pool changes
      net: stmmac: retain PHY and PM ownership during ethtool reopening
      net: stmmac: retain DMA resources across MTU changes

 drivers/net/ethernet/stmicro/stmmac/chain_mode.c   |    6 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c    |    4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   21 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |    4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 1036 +++++++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   19 +-
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |    8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |    6 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c   |   83 +-
 drivers/net/phy/phylink.c                          |   51 +-
 10 files changed, 815 insertions(+), 423 deletions(-)
---
base-commit: 8e1937fed6738460554ec123c64839e2445e7d53
change-id: 20260921-submit-stmmac-reset-fixes-v1-7c98b92d29a9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


