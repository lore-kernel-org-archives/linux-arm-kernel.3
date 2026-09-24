Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0043C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+SCOGAJarxrIkpGByhDtV4LsMHglOYq74GINs0bv9o=; b=atMtFP5jwLPGm1T15iKJxsCp5V
	LA31cBlhB2OrG4AYInP8KeVE3c7PEXKQOLS6G2zNyuWYThw0KUn5zIz9lG5Aqnkb95p90/pRHp0Ua
	6fg2voNLPgFrifwsOMs6loDlplqxOHt5WrZFPq4nWh5b7oFiNNXTb9y4oPL5I19UuODG1SsEOSKzR
	NifZudQQYyOTlNULkuz8fpcFlx81JvkphrcP7NOv0/NgpbuFz4QDpn3TVgAZBdzyzwC4utZgUebtM
	Fjs2yAJCDvbDW7m2onUQhH9gF8vDE5xug171QMjFdLcVdb638OqujR//pXe+b3oKS1ZM2ZNH4n2Jg
	cU7S0aoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrK-0000000B8Tx-0a2a;
	Thu, 24 Sep 2026 13:51:34 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jrB-0000000B8PP-1BqS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:26 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4885d4825adso1323061f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257883; x=1790862683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+SCOGAJarxrIkpGByhDtV4LsMHglOYq74GINs0bv9o=;
        b=c6Qd6O8Cr0wR4WrwOkjxMiHzApEa1H7Z55O3qHSUx/enExTAuXemo3VtwcpG15CM5t
         xgUT9uQzrtUUtImiX4/vEGhz/SatQq/rPUnRWv6AW0p+QSTEdffEKJgBPQUyq8Bm3mEB
         CV4g/H5MaZOB7xnNJou6alpx4+alwMPjfa57Zre+sJKHRACTlh0EjdfIx/tISqv/srVN
         8ebafEEpvxjeFCx2ECbd/Q4sXV+m7+Nk8R+CB0PzTnh65Ykqw3T9Zs7MLO0JMdOCPAY0
         kcocjoMYyUdx6YH2WpjFaH7mBEFUWpOc3pjaubDw2KZjoD0zriQVKjkmfxglDN2bUDnr
         BqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257883; x=1790862683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+SCOGAJarxrIkpGByhDtV4LsMHglOYq74GINs0bv9o=;
        b=KjD3bcY/mZxLTtl9t23QvTjB7zy/+ibeOYe5bFEoHjJT+hFxPAFgPyTRWK4GTQaIx+
         Ur1BadMv8KKXjbjCxkx1gL7YMkmD3A2Ou4/A58j/oPvuZgtB2O8DhQ1nOFLecNK3y8KP
         PARSaZhgvCdfV/VfZWiosAeYRNulfV0tiXHsHNAPOV/XTcvotgTdcozHjb/k9NQoECe2
         Oq4lcGCAAn2Ta4tLnlbfHN8j8L/7RWwzIsXBZeq29Cvu8PB/aqxAsamJIVmcnWKrRQI5
         bQHrnSI7OxZwUWwu4r9zgKIUckcGErTO0vUCEH6vmEuGcS8R42uLuns+X1mApd2txL7O
         giEw==
X-Forwarded-Encrypted: i=1; AKwUvBw89vE6swC7Y+RLaoG9Zs6Qaqubux1+w4Z3FAlQTNUmksa6OOWx4yx+0kvx3znM8zjlr45iho98UTig4smAmi1o@lists.infradead.org
X-Gm-Message-State: AFuF++km7br3BZvfhGMzO7TYVkMnKQwmiaTVKDCONU4dRoBBIMxlIvVd
	AB2YXY4OI6AimQvnDHoo1kPLfZtRbGtuUn8a9fnf0oOVvGJz0UUoivN0
X-Gm-Gg: AYBFou00nI5RCJnoR9dxo5r2CmiID/vDl5O2T5nHR49frOA3yFTtSxXmBieW0epiu23
	UfzMddipBwPZyfxt9lPIXK8KdozJyj/b/AJRoyOhcfGuQ2JkbFsy2JbD5hitL9uKnucYzvMY12K
	zhkcE8N8aXUsCSyvqAu0OUXPidyHPLRQ6meDaRO0kfFfkPQBwYzbMuS909Rr2lw+kUsbz2byYIa
	GE/Tg6p+JfKIh/Xo08bSMpkGwrCnf/UVor5azscnuc0juiTdL1vTdZ2vPzqitoCjWK/RemeD4Kg
	V5zx5HesUi1isWp6UcVCutm9KNMtn6VWYJTiPy/hEoAJFDnnmOnCMDcoKzm5wXaOomP0efBGsWK
	E4NE+aQuOnX566Kkvbj+rj3NH892hAL3bi9I738sFIQCQNtPdtkhIm9+kq5voRPkOKt5Z8lKt+O
	3zS9mNLuE5woR/ER/6EbLT8CwLEbMxdb7EAsfRNVJDx46B4MyPVDjoQ/ltxBGfTuHfPwL2lgSUg
	cX94/MW7pIx9KYyKlQ2B6xiGKQgqZhbiNjs6ug8
X-Received: by 2002:a05:6000:26d3:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-4887171e3bdmr4247572f8f.23.1790257883291;
        Thu, 24 Sep 2026 06:51:23 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm12060660f8f.33.2026.09.24.06.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:51:22 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	daniel@iogearbox.net,
	andybnac@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v2 1/4] net: axienet: start the TX queue in axienet_open()
Date: Thu, 24 Sep 2026 16:51:13 +0300
Message-ID: <20260924135116.185161-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260924135116.185161-1-maimon.sagi@gmail.com>
References: <20260924135116.185161-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065125_338792_568820C7 
X-CRM114-Status: GOOD (  15.01  )
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

axienet_open() never starts the transmit queue, and nothing else does
either: __dev_open() and dev_activate() leave the driver's queue state
alone.

axienet_start_xmit() stops the queue with netif_stop_queue() when the TX
ring fills, and axienet_tx_poll() wakes it again as completions free
descriptors.  If the interface is brought down while the queue is
stopped, __QUEUE_STATE_DRV_XOFF survives into the next axienet_open().
The ring is reinitialised empty, so no TX completion ever arrives to run
the wake in axienet_tx_poll(), and the interface cannot transmit until
the driver is reloaded.  The resume path is unaffected only because
netif_device_attach() wakes the queues.

Start the queue at the end of a successful axienet_open(), as most
drivers do.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and resumes after each of ten down/up cycles and five module reloads,
all made with traffic running.  A queue left stopped across a down/up
cycle, with the ring full, was not reproduced.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..fb26d2e39fac 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1700,6 +1700,11 @@ static int axienet_open(struct net_device *ndev)
 			goto err_phy;
 	}
 
+	/* Nothing else clears a stop left over from before the last close:
+	 * the ring is empty, so no TX completion will wake the queue.
+	 */
+	netif_start_queue(ndev);
+
 	return 0;
 
 err_free_eth_irq:
-- 
2.47.0


