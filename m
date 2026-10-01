Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEE2CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZ8YozvA1aqK0+uWNxtjqeaSWQiq07BXRM1asp+BzcA=; b=JWGAFoyMB+O62TiUdnrUE2uR/h
	xaIRP4QOUx7UeiVx0rnZd4v9RXEi8lT+xYRfQv9a54X9vGNPvWs0wu9J9oshaFBehc414nNTIAW2t
	FaRax5qVkzKn92DNng1Fr9fog/9/p1vBiOXH/epim/PdkNtv9UgNN9FB7v1aRmmP8pO3tTAodLE6c
	iUBKkku7YVjl/NPUI+Ru5r7fx9l7SyYHcqBhV/I/DSZ4hWzHhpxftiwpAd8sfQoxNVnV3MUfsoyxq
	XiFGZo1mn3w1FR+4p8+68it3qHHclHO4P6USykzjO4AZMxX4tKW1uy0xox0lQc5QodIrykKeYYDj/
	YOwxolOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCf0-00000008IOw-1cul;
	Thu, 01 Oct 2026 09:01:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCex-00000008INp-3eN8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:01:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7310497;
	Thu,  1 Oct 2026 02:00:55 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.77.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFE413F85F;
	Thu,  1 Oct 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790845259; bh=KpFLlIbgFKmtwym5+idRmX6jfxg0rnNaBCB2tjQsIU0=;
	h=From:To:Cc:Subject:Date:From;
	b=GJhVN5vM/OElXdPKTUMu/gwzOf/WZY9CLVYrjyjQRbxmYyJqfDvbcYQ6uYy5b6MJr
	 Dhau8RyM4IeTF7B8bPhMJUHzF/8iAkHJAOt9iIOI271aowTWPnUMQH8gvwAGsbBrD7
	 8YPuihgLShhiJzC2slcyRbzZIEZwsJzHRFzNYQXk=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Thu,  1 Oct 2026 11:00:30 +0200
Message-ID: <20261001090050.3849551-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_020059_947026_28B57CF8 
X-CRM114-Status: UNSURE (   7.36  )
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

This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
counter workaround into a generic broken AMU constant-counter capability,
then wires Cortex-A725 erratum 3821522 into the same handling.

---
v4:
- use midr range instead of multi cap list
- reword comment to be more generic

v3:
- splitted the commit and droped changes for cpucap_is_possible
---

Beata Michalska (2):
  arm64: errata: Factor out broken AMU const counter cap
  arm64: errata: Add Cortex-A725 erratum 3821522 workaround

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 24 ++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 16 ++++++-----
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 61 insertions(+), 15 deletions(-)

-- 
2.43.0


