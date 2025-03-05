Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC94C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvO8xqIVqtUd4T4sVzrj5VKAAjQMlRAFMZo/DBwxaL4=; b=hLZd0LAYH2phnTW1DajGn5jGj0
	E5RUkJdfAojUQVZdniUK5E+PL6RPwEIxqPpV9kDS1K5ycfYgPY3gfn+N+DzqKN5sQ97rEfHZtLjwG
	tiN1FmisCS0CtRTbRkDThU+hxLrdUQRfITt9AojCUJl8z3BR8eR6pKisTqvQv2XGJM+eabZb20U7A
	6jHURAS/iL923SPo2eO58cbghs2fvE2i9eGztWe6VyXWV0DHaoXK+dCzvq+UOIswZAB+Su6kTj562
	wQnjDwGK3njs/8P2NEwQ8nq+sEIlkWQeLmy0guv3cKW2zrwDLHbv66BMDkalDdFhabUPRKCGa+x1E
	EUFZb5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpogg-00000008At5-1tSF;
	Wed, 05 Mar 2025 13:21:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoO3-000000086aS-3HjU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=AvO8xqIVqtUd4T4sVzrj5VKAAjQMlRAFMZo/DBwxaL4=; b=YSD/h4Zr08KwmWgU9RTBHJoIsz
	yjANnAILhogrAWHFMP53Zg7XwtKlii6HDZmRpChRknyu5P/kX+wKggajN6mA2Oir2letIfyJkH5qg
	oGpBxLSloqQ6Rx1eFmTAwpdqSTZvLbM0TH1o5/pejFBisocMwxKNj7b7BlrgRXSnBkqB7Lego1aVV
	yPFGuJgA4IUzyohpF5MGruuovIQ9MpWNTSCBLvEkY0pTFcKGPUb7R+T0nOrvWZSXJwnfuuWNCuhOL
	O8RoYl1tywFGb7XFVFpIQIYKbkVTHIJuEYjVXCcbKjVWhgPqbdfOAA4VVGyMw8HEWEUPCaiIaLhUf
	LXUmIBbA==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoO0-00000000XEF-1MjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741179729; x=1772715729;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=39PvJib2PeOE5qnsHjLiceVW7xm5HXt73LMZb2qjEM8=;
  b=azrMaSiySLSziAkO7+1bKB7uo5pzm2DmBaUpcmJG5VJvXkM1dPfyPNqa
   LuapXvylb2L2dU+9tDQGg6fgdXCzd+W0biC3O76OS8OrqDglFn/CsxR91
   5b46j8R3Iake/TBclgHf9NqUnb8IU8CFFXmPtBHjPXFUwJBlfzaSquXps
   O4R+8Yq3QSW1bEuTmO+/MYoLWpBkxFQMmuu2xZ60fNnBhMlOFbnCy20g7
   pYDcBOvzD/vKhkPkC1H2+5o8ggU+fmldgRlpkY6wpzO/I/S8ymlIP1G+e
   RQ5R1JTCZqkJbicmTKbaksi71Ob6aLCwdB6gH3TcaMfDAjwtCvrJYUzFK
   A==;
X-CSE-ConnectionGUID: DbRC/LOyTsa6bpSnEC0fFA==
X-CSE-MsgGUID: X6Auus0dREWixyr8MShCVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45795149"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="45795149"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:02:08 -0800
X-CSE-ConnectionGUID: 3nGwylJDTZm5Lp7qLCxNig==
X-CSE-MsgGUID: 6iBPBwpqR8iwZKDA+S9D8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123277170"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2025 05:02:00 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v8 09/11] igc: block setting preemptible traffic class in taprio
Date: Wed,  5 Mar 2025 08:00:24 -0500
Message-Id: <20250305130026.642219-10-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_130209_109543_447B514C 
X-CRM114-Status: UNSURE (   9.43  )
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

Since preemptible tc implementation is not ready yet, block it from being
set in taprio. The existing code already blocks it in mqprio.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index a9f40fffc4fd..6db926bc9d11 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -6407,6 +6407,10 @@ static int igc_save_qbv_schedule(struct igc_adapter *adapter,
 	if (!validate_schedule(adapter, qopt))
 		return -EINVAL;
 
+	/* preemptible isn't supported yet */
+	if (qopt->mqprio.preemptible_tcs)
+		return -EOPNOTSUPP;
+
 	igc_ptp_read(adapter, &now);
 
 	if (igc_tsn_is_taprio_activated_by_user(adapter) &&
-- 
2.34.1


