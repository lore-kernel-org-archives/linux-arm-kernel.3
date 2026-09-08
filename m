Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F6FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=okLYyER6/N2GBwBRyBPpmzsC1jZeKyrc1yuodvLQ8ts=; b=nvDR1RN7/EFL6Qr/UZCW3biiUy
	ANO0a1TRSVitIsCxPYsguGNoRI8Hpd65R6Se+jUmREO84vCWgg02mjykwa7ofSNPtpMnt1HF+oHzL
	XuHWNhp5u6ZXlEUU5Gp2DOqxoCqDQa7d5B2gWhf93Mxw/Oo8Sw7EMJGt6eprSqfMvwrKH5mjG7Vzg
	yzmTW/RmTYBCJIrhsBEqsyKoSxyVMpwtnz9XHWwUG4ocJMyYXgGWAMBxvHlj4K1PiapAl7x5EQ4PS
	sBSsc7Ia4uj8cZQa/sJnABhUwifzqEsy0QnjaE7C/ZWyUlQhSuzj8EWMFkVM6zUUxL1OG7gWUrlfJ
	QnYOuvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLa-000000083Yn-1wJ6;
	Tue, 08 Sep 2026 05:26:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLW-000000083YP-3yD0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3651353a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845173; x=1789449973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okLYyER6/N2GBwBRyBPpmzsC1jZeKyrc1yuodvLQ8ts=;
        b=QxKnHsvrXIhoQ1n6670nN0sFXjnOnsXhVMaoFCuOHbyLyqCE+YOzdqzWn+g3kxUrD3
         IgoF8wcI0CJGuV2b+ioteRs9iIlxsQVGxjshi2RfKGmCxnWaHHyfKxParJNm/WtBHnUF
         10pcN1cMtnYROMu/zXAl+wWud2aph6088LlQmLJ1VLKpVjCVtMi7W7Se4pVA8P4f+NDT
         5rw9zE/FILvQejSP+HpdwmAGb5aKYpNPurg0BwyWTtL1Ze1GHpeaRe90DtsXlz2BBMvE
         COs45FBaio/taEQS0simaht+nZ96j3tSX71j/1V+ejcaVL8bLoh79usVCG/ReJPXMBKO
         hnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845173; x=1789449973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okLYyER6/N2GBwBRyBPpmzsC1jZeKyrc1yuodvLQ8ts=;
        b=cEqNZvbALNJ8qNKyYhuaGMJzxou89H4jFzanyJ7CqgmQAzM5pylp1SWacSxTtOY7OL
         SeMDbAi2kgIfiXKZ9VXcJ6VmbzGNLwl0S2IdYwlB/6vfGImuGxZFho/suwBZKGHdNsPY
         BB5qCMIYfZesOO3jOnuOaoSns2PcC3qG/eubIA2/RL57uH2xcNOaxWvBe6WSLKslMV4S
         R0vUPM5CuE2uFrGDi05SGMGfraXpr9XZKSkVwOIBO03R4q3betafFJ5/JKkCSjXlzuxC
         y59JO4qRFqYpy4GDplOb+nrue3Wut6IjVkYv+V0WkKkw/7rkHnbHhR9srBxDGMwBSz2G
         3cHQ==
X-Gm-Message-State: AFuF++lKuB0MGLKWlaGemLMhd/CZnVvOOQI0fjQ/WmP1DItePcYkQ/Nb
	VLt1GSQddHvoIUEHrjWZLitiPPZPHT9cd7OhmWsbnSVv4E7MABVTRDv8
X-Gm-Gg: AYBFou3YkioGwJjUDtyaBvlgayj7BOnOW+Z1AeQyB3lz/PfwxBzDkTAKNph41EhXLaM
	SA4KClLbE8cSu6sz+ydue2uqltu7+GmbpVwDfARn1j4uXG8mqnTsEK7jrq7U4cnEUvIN6FGc6sT
	d9BUs6Zco/x2VFp1zuXVJ2Ql9U5g97krxaTIDhQp+L/z7qn5fVrHL6sxTzIMFxpeBNDzMzfMwtk
	7ezg89Uza3ly1dJBIXl4PEPC++kyTH1gu8/gsLLsbxA5T+Kxc/hzXTCwgVAgrJ+43+OUpMnhjZQ
	s+zJNUC3AgNOe+KP0yoCgAydXI6+fgEYB83KT2jgILN4Eq5BmfJXGlXIpN7Kw3Lne+XsoIUn7di
	OXrWnBNq/Vc7bMhYqIrtEw8thkUHkrvhu6UoWiJNYq2urjkpB1+2qUOt26MowKyEF3EMaP2o37j
	6Ua5oDc2vyBp0i4+MY3zLRSLrylN49kH8ZDovOI9oj5tLs+4UsACSWI0XCT1eyA6LtuzYlJn8Jv
	ina80BfGrxwVw==
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr39316555a91.23.1788845173328;
        Mon, 07 Sep 2026 22:26:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 00/10] net: fix typos and repeated words in comments
Date: Tue,  8 Sep 2026 10:55:52 +0530
Message-ID: <20260908052602.27497-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222614_999166_31D66E7C 
X-CRM114-Status: GOOD (  19.70  )
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

Fix misspellings and repeated words in comments across the networking
code, found with scripts/checkpatch.pl using the misspelling list in
scripts/spelling.txt.  Comments only, no code changes.

Changes since v2:
 - v2 put 184 changes in a single patch.  Andrew Lunn asked for it to be
   split by vendor, which comes to 54 patches, so this is the first
   batch.  maintainer-netdev.rst asks for no more than 15 patches
   outstanding against a tree at a time and I have five in flight
   already, so this batch is 10.  The rest will follow as these are
   applied.
 - patches 1 and 2 are unchanged from v2 and carry Andrew's
   Reviewed-by.  They are resent because the v2 series was marked
   superseded, so they would otherwise be dropped on the floor.
 - dropped the sfc mcdi_pcol.h patch (v2 4/6) even though Andrew had
   reviewed it.  Edward Cree pointed out that header and the Siena copy
   are generated from the firmware definitions, so an edit here would be
   overwritten the next time they are regenerated; he has forwarded the
   typos to the firmware team instead.  The sfc changes outside pcol are
   unaffected and will come in a later batch.
 - dropped the 8390 patch, the driver is Orphan / Obsolete in
   MAINTAINERS.
 - dropped one octeontx2 hunk, in otx2_pf.c, because the comment holding
   the typo has since been rewritten upstream.  The remaining octeontx2
   typos are still fixed in the marvell patch.
 - dropped an "amount of times" to "number of times" change in qed_dev.c.
   That is a wording fix rather than a misspelling, so it does not belong
   in this series.
 - v2 6/6 (net: usb, "Medium Mode mode") is not in this batch.  Andrew
   asked me to check the data sheet for that one, and I will answer on
   that thread before resending it.
 - rebased onto net-next.

Jijie Shao's Reviewed-by is carried on the hisilicon patch only, since he
scoped it to the hns and hns3 parts.

Hemanth Selam (10):
  net: llc: fix repeated word 'all' in comment
  selftests: net: fix repeated word 'use' in comment
  net: broadcom: fix typos in comments
  net: cavium: fix typos in comments
  net: qlogic: fix typos in comments
  net: fddi: fix typos in comments
  net: marvell: fix typos in comments
  net: hisilicon: fix typos in comments
  net: atheros: fix typos in comments
  net: dec: fix typos in comments

 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h             | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h                | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c             | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c           | 2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c                  | 2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c                  | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c              | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h              | 2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h                | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h               | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c           | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h           | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h      | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c          | 8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c          | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h           | 4 ++--
 drivers/net/ethernet/cavium/liquidio/cn66xx_device.c      | 2 +-
 drivers/net/ethernet/cavium/liquidio/lio_core.c           | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_config.h      | 4 ++--
 drivers/net/ethernet/cavium/liquidio/octeon_iq.h          | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_main.h        | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_nic.h         | 2 +-
 drivers/net/ethernet/cavium/liquidio/request_manager.c    | 2 +-
 drivers/net/ethernet/cavium/thunder/nic.h                 | 2 +-
 drivers/net/ethernet/cavium/thunder/nic_main.c            | 2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c                  | 2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c                | 4 ++--
 drivers/net/ethernet/dec/tulip/media.c                    | 2 +-
 drivers/net/ethernet/dec/tulip/tulip.h                    | 4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c              | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c        | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c         | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c             | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c     | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h                | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c            | 8 ++++----
 drivers/net/ethernet/marvell/octeontx2/af/npc.h           | 4 ++--
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c       | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c        | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c   | 2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c                 | 4 ++--
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c       | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c                 | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h                 | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h               | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c     | 4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c           | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c          | 4 ++--
 drivers/net/fddi/skfp/cfm.c                               | 2 +-
 drivers/net/fddi/skfp/ecm.c                               | 2 +-
 drivers/net/fddi/skfp/fplustm.c                           | 4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h                           | 2 +-
 drivers/net/fddi/skfp/h/sba.h                             | 2 +-
 drivers/net/fddi/skfp/pcmplc.c                            | 2 +-
 drivers/net/fddi/skfp/rmt.c                               | 2 +-
 net/llc/llc_conn.c                                        | 2 +-
 tools/testing/selftests/net/xfrm_policy.sh                | 2 +-
 59 files changed, 77 insertions(+), 77 deletions(-)

-- 
2.48.1


