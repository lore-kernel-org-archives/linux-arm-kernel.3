Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4901760A2603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yMy8Gzg8;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=R12NoYLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Tvh3ER3yLmblvY3yXSbn1ihzEpc/dPSRG3EnZEQ720=; b=yMy8Gzg8+iW3wGBV9FKY5GAJ0k
	KcijPvTKNpOiEm6mDq7dwkP4Xt15XrZf18kWFZzXrnMOPNGO4/MFpPwFVZOmoxUog0eUdV8O/1oAM
	sf/Mgj4ZD78JDne71vNE1AkZJ9rzqCFS7v9lqxgK1RyMltsV2xQF/3ptldq7go6ZoAjVjSPXvqhqf
	Gij2dqsjlwreu8WRVjeqfI/Z8xDDuDphegp94mZ52saMnyX65gqoTH7JxvJzPpiqaV/Ge0CXlSoem
	cQqUw16Y9fDg0wmuJ4IQESFzhOukbaepXt+dflV1pP+mZXMETt7n65DVN4dl3rWNifZ//fykvRFD5
	zIQM3eDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nh-00000001LMG-2eOj;
	Sun, 25 Oct 2026 19:22:37 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3na-00000001LDv-2gom;
	Sun, 25 Oct 2026 19:22:32 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK10517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:23 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK10517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956144;
	bh=4Tvh3ER3yLmblvY3yXSbn1ihzEpc/dPSRG3EnZEQ720=;
	h=From:To:Cc:Subject:Date;
	b=R12NoYLl7dofrZhqAh7l5eB0oPYAZY2oo/Wn/yCUtxkk7LQaz1nieBJa0xdTF1Mgm
	 tSee/yLMwQWK2QXQXWRXrgbrO2neCy6/oZ5vTQ9DIt8IxvV1hNTnNyRejd7B1O/buW
	 Uazurn5UtuEy+Ucq/+XL0KH0wa/IQe+rLFDlgayY=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/4] arm64: amlogic: S4 CPU frequency scaling
Date: Sun, 25 Oct 2026 20:22:15 +0100
Message-ID: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122231_036953_62CDE0FD 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

S4 keeps its CPU clock registers in the secure world and bins its parts
by voltage, so CPU DVFS needs three pieces:

 1-2: the CPU clock in the S4 PLL controller, driven through the two
      BL31 SMC services the firmware exposes (sys_pll and the CPU clock
      tree), modelled as one clock because the firmware calls do not
      map onto separate muxes and dividers;
 3:   the secure monitor call that returns the CPU speed bin;
 4:   a small cpufreq driver that picks the "opp-microvolt-speed<bin>"
      curve and registers cpufreq-dt, like sun50i-cpufreq-nvmem.

This applies on top of "firmware: meson: sm: make power-off work on
S4" (sent separately; the command tables overlap). The patches touch
clk, firmware/meson and cpufreq. Patch 4 depends on patch 3; 1-2 are
independent of 3-4. I am happy to split them if the maintainers prefer
to take them through their trees separately.

Tested on an S905W2 (speed bin 2): 100 MHz to 1.908 GHz with the
vendor voltages, transitions under load for hours, vddcpu follows the
table.

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (4):
  dt-bindings: clock: amlogic,s4-pll-clkc: add the CPU clock
  clk: meson: s4-pll: add the CPU clock
  firmware: meson: sm: add the CPU speed bin call
  cpufreq: add an Amlogic speed-bin driver

 MAINTAINERS                                   |   1 +
 drivers/clk/meson/s4-pll.c                    | 320 ++++++++++++++++++
 drivers/cpufreq/Kconfig.arm                   |  14 +
 drivers/cpufreq/Makefile                      |   1 +
 drivers/cpufreq/amlogic-cpufreq.c             | 184 ++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c          |   2 +
 drivers/firmware/meson/meson_sm.c             |   1 +
 .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   1 +
 include/linux/firmware/meson/meson_sm.h       |   1 +
 9 files changed, 525 insertions(+)
 create mode 100644 drivers/cpufreq/amlogic-cpufreq.c


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
prerequisite-patch-id: f977117cf7f3a613f667c2106e7f4aafc0ace116
prerequisite-patch-id: 1ec4e1bb456bd13cec4f140219f700f44ea19606
-- 
2.56.0


