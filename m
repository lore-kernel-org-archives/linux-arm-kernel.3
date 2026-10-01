Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5E1CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OuQ+OGdko092Sls5gQ6DySh0BUOL7VR+MN7b9cMN+9g=; b=l6XUR2yZYyWDi3
	lTy+z1mT5iWRjy/QbKz0MgyowavtZdjkLxZXTEfqzzQQVkh6Lq7Flygol6KtsEwFSgCYxhTYv93HV
	MFXbtIoJ+cQvJ9h5Ep0soDIwyDsiRMcW02Hzo7zGeNqQPz5tfor819fS03rpdicKOByyhuETgarxN
	/cPJLlO+CtGcxztnvs2S8WaJqfdCt44qGO/otTjJ+16clG58ILGUs+vLtpKMdoMz/UZgcgQttsdeP
	C6WjjB8fYkytYeZh6wCi7yqN+S55OcpULx75gx7O/ByqKmK3uTzTn255nxsTrEjY/UNak7alTDSZN
	gnqovzN2OiPCGKEt56qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AH-00000007i01-1lnV;
	Thu, 01 Oct 2026 04:13:01 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AE-00000007hz5-2VTW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:12:59 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-81ad35a4608so1883396a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790827976; x=1791432776; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OuQ+OGdko092Sls5gQ6DySh0BUOL7VR+MN7b9cMN+9g=;
        b=JsSLObIGwrckXLZEUE2NsNukpwxzupL8gZBT9Il3GYH2YCkd4RZDFXmSj2/krCz/o6
         voXazYPPLUxgFBbNXlqlpxB3cSpJSnE6VsfcGizeuRWPDMBK0LM4hzrbC6Mm4xvL9gkm
         DfsnTN+DsbMj+eAo2NjvKaKtnTrZZplwXsfN5e/mmAL3Tif1q1RI9RXvymswKnKll/51
         ECmvV3q0PC7gWsA3MOKtp+iGJrC8A9z7ZVbwLxydufFglKs3o9szsA664C0V+oaQdr+Z
         IpG8Z6wO34dGBsjwhUSFEzUApDdI/vOp5exUgGRv+8CC7JY9XLSCwrs76sYUZOrjkYWE
         Joww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790827976; x=1791432776;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuQ+OGdko092Sls5gQ6DySh0BUOL7VR+MN7b9cMN+9g=;
        b=viikcLJyS+Lk1yfElzX8WV0XjZQuDShA3m/LbJKruWGHi1KNNOZSMrKgB+PzdLQCcz
         C5LK9shm8y6UHwihvER0sSJStS6zx19uykebSLm6uBAf92F8yCJcvheoQsDhS463KSdJ
         Zyi9Z/JwKcfeAUA3EAN3GAU2QDDKHiFGkNA62CPoVXUBXydHoTBswqpg0oBw84+UpY9z
         B+GV60/k9zc+ZNz6UEnF8+wJCcvF0Tu8IUJedjV4Vw6GY3c444ARy9wO9miyj2oUshDJ
         H0F/GGf9vaEMT31HniQcuxDT6o+/UioWPhAPhoZO0tdKgX9pKaoxhFcDFpTYiIDx1rk9
         IIHw==
X-Forwarded-Encrypted: i=1; AKwUvBxAEN6JxXo/qXTBva2cA8xQKlTX8yDfDbig9qI7vaoezBSEaZAo507BKDZUFfYkNrbp3xnmBrTAkmriQrEBN6Hm@lists.infradead.org
X-Gm-Message-State: AFuF++mfhAC2BvE4j/j53jaZTJtgrKyZukJGii0QkjTLTqis6ZH2nlkD
	DI1E2frFd9SnJD1TW8LkEiY47hp6HuOTabObnPJQjUfrCF+yC/W3cHoS
X-Gm-Gg: AYBFou2eCWHjFVheKOgK0bdN0v9bWb056+shZlRSA7hNiqmflmjN+2Jow9L7iIX1y/d
	1IxaJLq/o9JFkVuxdAc7E/Kg+riIBGz2oZpx/BpI2ExcOdXdN6B7UVq5Cfl61G299EgQHSVdB9F
	3a/sj8nnMvVyWmqmhDx6n4Ceuc/+hnxRRjrVGSuQywsmwcMskaMfmJTY9AiH4ExOFjiIA6LX/WF
	v8E6gXdPOAZmpbiA0ii/3dooZjv8KFzAcHP8pbWzlRptaBlu09vSnH4nxuvqf+VMyjSQRRhLRVe
	xPOmez4NO+dH/ZKo/+ikJ5+pgFb7AB4JzLm5A4hV7+nhsdZygNJQqDAbgwmGOtaJZ3dZLq2NdfO
	h/qrWsrXFdfGLHgzhWftv7/Sp8UBxO0CUTuV34rwAI85Xzqon7ivTK4Z+dzg/+ROINHAZcWQdRc
	JLba+m2SVAlXAgVuOHugr68OQ/vFgvm28p8UZzbn22npKEnH704MwIb68lu1CASj62rDebHHMaj
	Ypcc4CVQ0QA0yW0exK26EhKpnaCd4BNEWJjTuqQDP6FOLq9PWOfKRwhi8rFslhv8VpL3r6jDTcc
	kO0J8SZ3pgu5Pr/CjWvIiwfId64AsF6KWVIcrsaNiDWNDVh33qjxyJbgSBeig5HazBBFzFdBljp
	3l5wrHUR8sPwdqzCJuaAn
X-Received: by 2002:a9d:664c:0:b0:81d:bac9:e5ac with SMTP id 46e09a7af769-8211fe51d49mr1338514a34.33.1790827976385;
        Wed, 30 Sep 2026 21:12:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212af3c1ecsm1708657a34.21.2026.09.30.21.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:12:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
Date: Wed, 30 Sep 2026 22:12:48 -0600
Message-Id: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/63RzWrDMAwH8FcpPk/FduLY6WnvMXZQbHk1NB+13
 dBS8u7zskJ32MhlF4EQ/PQXurNEMVBih92dRZpDCuNQmvplx+wRhw+C4ErPJJcNN7KGlPseLVD
 KEAmn6XQD9JkijBMNIIxwmqNQ1DWsGFMkH66r/8YGyjDQNbP370mk86UszI9xh4nAjn0f8mEnm
 qpILZLSzpK0yhuDTmpTcc2laSqDpqtdu1rHkPIYb+sRs1ixR161kXcWIMB5NFxXikrw1zGl/fm
 Cp68g+1LWBbP8ibZbqCyoImVtJ4yiVv6BVk+05XILrYADaYmN8wo1+V/Qpag+jj3kYxGef/sXf
 Vk+AaU9xMwtAgAA
X-Change-ID: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Rayagond Kokatanur <rayagond@vayavyalabs.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_211258_679757_8DD8FC1F 
X-CRM114-Status: GOOD (  12.43  )
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

Continue Lorenzo Bianconi's EST replay series with v4 of the unmerged work:
https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com

The PTP initialization fix from that series is already in the base.
Carry the remaining embedded-state and explicit-enable preparations,
and restore the installed schedule after open and resume reset.

Build TAPRIO replacements separately so rejected updates cannot
corrupt the installed schedule. Rebase the previous schedule against
the current PHC when rolling back a failed hardware update, and keep
DMA stopped until replay succeeds. These changes do not depend on
the later datapath recovery series.

Changes in v4:
- Omit the merged PTP initialization patch and adapt the remaining
  changes to probe-time PTP locking and current TAPRIO error handling.
- Separate schedule validation/rollback from open and resume replay.
- Reuse the base-time helper for replacement, PHC adjustment and
  rollback; propagate errors while preserving the installed cache.
- Start DMA only after the installed schedule has been restored.
- Link to v3: https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e72a6df5a7ef@oss.qualcomm.com

Changes in v3:
- Guard priv->est.enable update using est_lock mutex.
- Embed stmmac_est in stmmac_priv struct.
- Rework locking in tc_taprio_configure().
- Fix possible divided by zero crash in tc_taprio_configure().
- Add missing reconfiguration during stmmac_resume().
- Honor ptp error code in __stmmac_open() and stmmac_resume().
- Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after-open-v2-1-5e5ccb185e92@oss.qualcomm.com

Changes in v2:
- Rename stmmac_est_reconfigure() in stmmac_setup_est().
- Rely on stmmac_setup_est() in tc_taprio_configure().
- Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (1):
      net: stmmac: preserve the installed EST schedule on errors

Lorenzo Bianconi (3):
      net: stmmac: embed struct stmmac_est in stmmac_priv struct
      net: stmmac: pass the desired EST enable state to est_configure()
      net: stmmac: restore EST before starting DMA on open and resume

 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  47 ++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  59 ++++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 142 +++++++++++-----------
 7 files changed, 176 insertions(+), 127 deletions(-)
---
base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


