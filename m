Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9BAC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lamgAqJW8bHAS7ve4sXgeba+bpIMnPSaxGNvQjJ1zdc=; b=oLvkGId7iwAqHVDUbYaEbVZJhX
	+bCGCsb78xCGDhB3558lPD2JIrYXguJy7nZOXIjjln/ZmeN3wDC+XOkUVoJuKZ6XGw8I16Jlg23oO
	IqjEPm53UhVvjrrcNAfwvGff1vn3phJ9aHDZV0SBmZJgRmwadJtpIpZkDGTHq9ZkXZjnT+mop+wzS
	h0rqVwjhXn3qolvBqcjTJQ28A6+p43BpAE2nT8abmZaxCC4RlgwTdT3J2GaFixwXFX6+nowrsxRyZ
	HOD0cZISmpcMU8R6qIVCK1EU6LaqWxatUTknDamWKXxeatPsTLXGMtrHT/S8a/2oKUjv/I3TuBd0T
	m4tQqtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSE9-0000000FPKU-3IHL;
	Thu, 16 Jan 2025 15:56:13 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYSCs-0000000FOyW-28AX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737042894; x=1768578894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f5RR73mwhg0k7ezLHsdj8LT17ejfMGoBLLZZHGt5FF8=;
  b=HrB2uRDhUf+CxljiuHEfrzT23V0oBu9k/vrpdE6pPIc2oyGjh6g1Ed1Y
   ZYceJl5TrXJr4/80YdH6RMwb/TKx53480i2UQyKN6bYQ4fwLFtq+hFqhm
   SqmfvxIwm4jr/HhWDiPYh7+FiH4oAkaxCdMlmVo3ort7b6ASZsI+Utwpe
   8vOW4JG/k9bszt7L6y2Aw5qKrzC5PthcyZn+yNX+O3BvcHr9pMGbRmfAv
   TRs9kASISqie0svVx1z77RkoP10RN7PKyd1gQLx0hyW4gM+zfHTdJ0hl8
   v3kbBQihXepjfVMF9ywe/SDid2JN48IalHwFKh6HEU1lsAtIA6LxjIt1G
   A==;
X-CSE-ConnectionGUID: ysD1IxaJTy2Tf9yNJFrwug==
X-CSE-MsgGUID: ZkRFAObuQp6byuFrR3Uakw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36715567"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36715567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:54:12 -0800
X-CSE-ConnectionGUID: V2Ia/zAKRYKtB7XDaRq/JA==
X-CSE-MsgGUID: p4JL923qR62lJLCUoqsJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106113808"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.38])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2025 07:54:02 -0800
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	xdp-hints@xdp-project.net
Subject: [PATCH bpf-next v6 0/4] xsk: TX metadata Launch Time support
Date: Thu, 16 Jan 2025 23:53:46 +0800
Message-Id: <20250116155350.555374-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_075454_622245_5AA8DA76 
X-CRM114-Status: GOOD (  17.91  )
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

This series expands the XDP TX metadata framework to allow user
applications to pass per packet 64-bit launch time directly to the kernel
driver, requesting launch time hardware offload support. The XDP TX
metadata framework will not perform any clock conversion or packet
reordering.

Please note that the role of Tx metadata is just to pass the launch time,
not to enable the offload feature. Users will need to enable the launch
time hardware offload feature of the device by using the respective
command, such as the tc-etf command.

Although some devices use the tc-etf command to enable their launch time
hardware offload feature, xsk packets will not go through the etf qdisc.
Therefore, in my opinion, the launch time should always be based on the PTP
Hardware Clock (PHC). Thus, i did not include a clock ID to indicate the
clock source.

To simplify the test steps, I modified the xdp_hw_metadata bpf self-test
tool in such a way that it will set the launch time based on the offset
provided by the user and the value of the Receive Hardware Timestamp, which
is against the PHC. This will eliminate the need to discipline System Clock
with the PHC and then use clock_gettime() to get the time.

Please note that AF_XDP lacks a feedback mechanism to inform the
application if the requested launch time is invalid. So, users are expected
to familiar with the horizon of the launch time of the device they use and
not request a launch time that is beyond the horizon. Otherwise, the driver
might interpret the launch time incorrectly and react wrongly. For stmmac
and igc, where modulo computation is used, a launch time larger than the
horizon will cause the device to transmit the packet earlier that the
requested launch time.

Although there is no feedback mechanism for the launch time request
for now, user still can check whether the requested launch time is
working or not, by requesting the Transmit Completion Hardware Timestamp.

Changes since v1:
- renamed to use Earliest TxTime First (Willem)
- renamed to use txtime (Willem)

Changes since v2:
- renamed to use launch time (Jesper & Willem)
- changed the default launch time in xdp_hw_metadata apps from 1s to 0.1s
  because some NICs do not support such a large future time.

Changes since v3:
- added XDP launch time support to the igc driver (Jesper & Florian)
- added per-driver launch time limitation on xsk-tx-metadata.rst (Jesper)
- added explanation on FIFO behavior on xsk-tx-metadata.rst (Jakub)
- added step to enable launch time in the commit message (Jesper & Willem)
- explicitly documented the type of launch_time and which clock source
  it is against (Willem)

Changes since v4:
- change netdev feature name from tx-launch-time to tx-launch-time-fifo
  to explicitly state the FIFO behaviour (Stanislav)
- improve the looping of xdp_hw_metadata app to wait for packet tx
  completion to be more readable by using clock_gettime() (Stanislav)
- add launch time setup steps into xdp_hw_metadata app (Stanislav)

Changes since v5:
- fix selftest build errors by using asprintf() and  realloc() instead of
  managing the buffer sizes manually (Daniel, Stanislav)

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-yoong.siang.song@intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20231201062421.1074768-1-yoong.siang.song@intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20231203165129.1740512-1-yoong.siang.song@intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20250106135506.9687-1-yoong.siang.song@intel.com/
v5: https://patchwork.kernel.org/project/netdevbpf/cover/20250114152718.120588-1-yoong.siang.song@intel.com/

Song Yoong Siang (4):
  xsk: Add launch time hardware offload support to XDP Tx metadata
  selftests/bpf: Add launch time request to xdp_hw_metadata
  net: stmmac: Add launch time support to XDP ZC
  igc: Add launch time support to XDP ZC

 Documentation/netlink/specs/netdev.yaml       |   4 +
 Documentation/networking/xsk-tx-metadata.rst  |  62 +++++++
 drivers/net/ethernet/intel/igc/igc_main.c     |  78 +++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 ++
 include/net/xdp_sock.h                        |  10 ++
 include/net/xdp_sock_drv.h                    |   1 +
 include/uapi/linux/if_xdp.h                   |  10 ++
 include/uapi/linux/netdev.h                   |   3 +
 net/core/netdev-genl.c                        |   2 +
 net/xdp/xsk.c                                 |   3 +
 tools/include/uapi/linux/if_xdp.h             |  10 ++
 tools/include/uapi/linux/netdev.h             |   3 +
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 168 +++++++++++++++++-
 14 files changed, 342 insertions(+), 27 deletions(-)

-- 
2.34.1


