Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38617E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPAjUvdTLpQn88tQRHJPwHKkSXJWt8P3KcsIg2Us7Ug=; b=Z0gDaTuF7eb1OO/y3xlihBXCz3
	znONjqMbufAmapcK1LGmAQFJLK7l8PjUP9LInVsZnI/nMsmiOwjyKXpcoaD9SG+AbGfBYuzfwr8kr
	wAeTdTVxXpzgEIm56Gcf1CZPRJL84hHaOUFKFG1/LhdydcbU1tVt2XBs+mVW9iqPrUgEeqGPdU/EJ
	9I/coSrRfWG7T3fInLEepRLmPOkD0rhVWy8pBXcHpajl+Cx4pEBQnZXLudlZ5l7FaJvRlFubsIuB/
	lli+aUOD7+DiZOjzVwTX/0IX3X/yv825kP6R+0ZRwblnQxs7DoF+jkxmIzEEmJJeY67e7PW/o1nd8
	Q4l30eBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnc7-00000001Tkc-1au2;
	Mon, 06 Jan 2025 13:57:51 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnaK-00000001THX-1Tnv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 13:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736171761; x=1767707761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fe/o7Mk5+uc0GHrVMRFeiFpbIufBfq1Z8jHhoCn17v8=;
  b=AxYL+f/r6EGUwEMVdBbLmLI3xhkLJ1GrhDRMs1P8bMr3RLqrQi9y7RhA
   pbK3BKno6L6xAKMYFjTPEeGI2Hi+2eHEBM5qUsrlz2tMLInKX/kcnqZQC
   fKkcP54YFaYTA6/iFlQ+WIW/J7fehxZDiltja3jVn8sdUKI3Ot0FW8wSj
   ihHL6KZhBItBgIoGFwrqly8bvk07+z/cgUaPfYdtjBrSJ91BDHypGrs5l
   JUDX4zMVXPdL2ItXEFrBo8UAQBidAl1b1OR7JxCNi6nhhsofV7/IvyRVW
   3WXyURJypi4rrmkqSZeF41q/VM+zV0P+2lkPV6EREeaXYBpy580czCa7I
   g==;
X-CSE-ConnectionGUID: IqWWFXCsRe+9wvb7NljIiA==
X-CSE-MsgGUID: quz3e41qSQGPn6Ve4TbZ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36473736"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36473736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:55:59 -0800
X-CSE-ConnectionGUID: A4LxAHlWSWC9cCNEMxi8Kw==
X-CSE-MsgGUID: QReHGKT/TvOdkEroFunAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107407969"
Received: from unknown (HELO P12ILL20yoongsia.png.intel.com) ([10.88.227.38])
  by orviesa004.jf.intel.com with ESMTP; 06 Jan 2025 05:55:48 -0800
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
	Amritha Nambiar <amritha.nambiar@intel.com>,
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
Subject: [PATCH bpf-next v4 0/4] xsk: TX metadata Launch Time support
Date: Mon,  6 Jan 2025 21:55:06 +0800
Message-Id: <20250106135506.9687-1-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_055600_430577_D5C36B69 
X-CRM114-Status: GOOD (  17.74  )
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

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-yoong.siang.song@intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20231201062421.1074768-1-yoong.siang.song@intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20231203165129.1740512-1-yoong.siang.song@intel.com/

Song Yoong Siang (4):
  xsk: Add launch time hardware offload support to XDP Tx metadata
  selftests/bpf: Add Launch Time request to xdp_hw_metadata
  net: stmmac: Add launch time support to XDP ZC
  igc: Add launch time support to XDP ZC

 Documentation/netlink/specs/netdev.yaml       |  4 +
 Documentation/networking/xsk-tx-metadata.rst  | 64 +++++++++++++++
 drivers/net/ethernet/intel/igc/igc_main.c     | 78 +++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 13 ++++
 include/net/xdp_sock.h                        | 10 +++
 include/net/xdp_sock_drv.h                    |  1 +
 include/uapi/linux/if_xdp.h                   | 10 +++
 include/uapi/linux/netdev.h                   |  3 +
 net/core/netdev-genl.c                        |  2 +
 net/xdp/xsk.c                                 |  3 +
 tools/include/uapi/linux/if_xdp.h             | 10 +++
 tools/include/uapi/linux/netdev.h             |  3 +
 tools/testing/selftests/bpf/xdp_hw_metadata.c | 30 ++++++-
 14 files changed, 208 insertions(+), 25 deletions(-)

-- 
2.34.1


