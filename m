Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8C9CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5tVRnzC7/u+9J2k/n3TM+qJYjKV4r4MGpsSjnXhUFQ=; b=Y3FYPVDRK7rGxPk9iZldi3xAX4
	lwqSnSSO8THS6lPNhRErgqEhD/niO+gh2DT0inkAG0YeQOfJU/7IlpRz/3aac9OROWnVYLBXFXbq3
	MAYMJWrnLE3SZ2ek8+mUAhMU52O4ANKJ+GpDf0uavq4NZDWN/qU/Gqn50sddQorkFAJhGOl3St9gy
	GwXnr44Y365KrjK4Se5QrU+y5iFDHoGDLVuVWwcIxs7ufbYPVA5lsXU17TKNNwYTIC/D21bzjxDbp
	6lrR5BJFGfnmDxN5RSujgAgrE9HFXhl2NF2LZ3Vxn22oe+criJcWvRNRzmCD/YkXWP2kBexXherkd
	zCdV8jtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFS-0000000Bsfu-2eWa;
	Tue, 13 Oct 2026 03:32:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGTFP-0000000BsfE-1PuM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 03:32:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1809369a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862334; x=1792467134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5tVRnzC7/u+9J2k/n3TM+qJYjKV4r4MGpsSjnXhUFQ=;
        b=YQsP/PhafOGhIVjy3HrBDgnWb4GZVv8TCSauFlPxUNc+FMR90Ys4sgbPBrbZ+ycNjq
         0sOBcBBX89cbwEhYWTQFq3BssPBc8baaEsE0lFMj3q6TeDfNVRXEaytcPUBb5a/5liRR
         TMUcN7Tnc8uiRkRZbKXk6ST4aSDq4UiNb8JHhwcy6NJcuvnjvIWGNkaq0bG3c2WqCag7
         A75sBB2JG//y4vU3VLsVye0x26ScUPhg1eaNpoE1jjObDa2Sjgx69IB91pcQ38QyTAeu
         rzRbE67I3gpv/L1TiqDqKyUZy7FW6g6bFsOPw0/B1PW8M4P9RGfuhHUMzGDnURGdTm65
         lRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862334; x=1792467134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5tVRnzC7/u+9J2k/n3TM+qJYjKV4r4MGpsSjnXhUFQ=;
        b=oNgaHu6WeFhT8dY5RCTTCwmds+v33GO2VVnAlEiOhwZZjOk/gz23D/4MBKm0cVVMSV
         3lGR+1utGybhkiENkTpCXcp1uTgCBTqyjkctOx/iLTJKfEfdwk3WtMwVoJDZlWc8aSfr
         7ZGopKFnpKdd8RKt3dUKgfPf92oqUglYdqznjm458IwR66MWZTm/frsj5CyWHNsiX7NU
         L97DH1go10cwwRbUdmp8vxGTg/U1o8j/GxBVgKiNXe5WGQmPfYstTgg1a68FhVwzhXMy
         Nj9x8YqIXTkwmOUJ9Y/wQiYmDJn8BiWZ7kEavEeDTQuoaFvYyoL+yhbRr+636WFuRiyX
         HObQ==
X-Forwarded-Encrypted: i=1; AKwUvByCOYuMc7lEaJT0cgDikwjIvOV/NBwL/AFWyKJsvldKjuWHVwqRbXXV3emm1BdhNynPnEqEuKsek7QHuC0Zj4ht@lists.infradead.org
X-Gm-Message-State: AFq9FYKI/WFMP97Ea6dFrkvhxcJRFRPyCM2zYXcZFGKWnFZQRTP9aD2Q
	PG5Q00V2LmvdZJc876nLygJ83y0EV4LyxcElO/2oXo0FiVsSgQbae0Qt
X-Gm-Gg: AYBFou0mwhXN+pqPsFoCm3VYOawEQ2wE8mxaO+dXSrynVm/AIksVCX7FWAtjbQU5ycv
	LdR+ERAo3hU/KlVWG07GELfywgotasPE3tTEwm49jeFf7f0fme2zQGoE/VVev01p7m+VL3jvLNH
	SAUMP2jKBUGsN7jCQOlu++T+7pfKMJB4XehjMNdn2dpeaucixm6uekIaC0XjilhmNKJbJQC6yUN
	WlEvQI4yQXs9ANGlVrKML8Kr2NFhKrD7lo6Kv+/5nuGgEZ75JoxlV+P2dAidrE4zbA1oemF7RI4
	RE7pH230bF4x1uUKdKowi+D7mQ9Zmi2kkHnySedngKPr+q24gA5MviakSvFJdoH80IIA/RhXwTJ
	jcrRLb8QJKUrL6nmvdxc1zJEthRtcHVbOJjbvAN56rPi3i6T6++Y8wXiELvVqcthotadBsLrgsO
	+mHiolhvxsx2Zc80Oyf5htfgq02IhqHf0g3EzEt8bNDiBil8EogoFYJH78AYwusjzUhi6RhIMHf
	8/O/T9W
X-Received: by 2002:a17:90b:3143:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3ab3ac718f2mr10568795a91.50.1791862333896;
        Mon, 12 Oct 2026 20:32:13 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm19541303a91.12.2026.10.12.20.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:32:13 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Tue, 13 Oct 2026 11:32:04 +0800
Message-Id: <20261013033207.1684328-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_203215_377516_C3C612E3 
X-CRM114-Status: GOOD (  11.62  )
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

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the FIFO clear to
complete, and holds aux_ts_lock across the whole trigger/poll/drain
sequence so a concurrent EXTTS request cannot flush the snapshot FIFO
mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero channel
mask: ilog2() is applied to the mask without a zero check, and
ilog2(0) yields an out-of-range event index that ptp_clock_event()
feeds to test_bit() unchecked from hard IRQ context.

Patch 3 adds a dedicated DWXGMAC2 timestamp interrupt handler.  The
XGMAC hwif entries used the generic ops, whose callback read the wrong
register and whose enable mask omitted the timestamp interrupt, so the
clock advertised the aux snapshot channels but no event was ever
delivered.  XGMAC_TSIE is not enabled by default; it is armed on demand
from the EXTTS enable/disable path through a new callback, and the
handler only touches the FIFO while the interrupt is armed and while no
cross-timestamp owns it.  The interrupt is disarmed on suspend and
unregister and re-armed on resume.

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/
v7: https://lore.kernel.org/netdev/20261004120526.2728564-1-zxyan0222@gmail.com/

v8:
- Gate the handler's FIFO drain on XGMAC_TSIE being armed; the handler
  runs for every MAC interrupt and must not touch the FIFO while the
  timestamp interrupt is disarmed.
- Hold aux_ts_lock across the whole EXTTS enable, including the FIFO
  clear poll, so the re-arm cannot interleave with a suspend.
- Drain an in-flight handler with stmmac_sync_timestamp_irq() when the
  FIFO is handed to the cross-timestamp and on the EXTTS disable path.
- Roll a failed EXTTS enable back in hardware and software on the
  FIFO-clear timeout, and drop the EXTTS state when the resume re-arm
  cannot restore the channel.
- Disarm XGMAC_TSIE on suspend and unregister; re-arm it on resume.
- Initialise aux_ts_lock in probe and destroy it in remove, so it is
  valid for the whole device lifetime.
- Only clear the software state in the resume-failure teardown, since
  the auxiliary snapshot register differs on DWMAC_CORE_MAC100/GMAC.

-- 
2.43.0


