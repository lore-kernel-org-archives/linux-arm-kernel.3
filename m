Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1364D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iee/K3gF;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=tA4kVeKE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Dqs4z2NY1rb7FbmpNSV5YxzKzMNh1uksqRMZQL4TgK8=; b=iee/K3gFTMehijF7u/CRvjMqGG
	xkIbQVST2JfSM75a+cz/WspZV/Ti4nPdWK/XhjYPI8LzqsikGuiD2RLgBIbjZJGbcXkiShciyWJFV
	P66xhAerJ5kui4eakRfCYANV4fq+kXIUbghOJcEaoExWsewBMwBfXd0Zb7kXPiY5Kyf8/L1NiofR3
	xWyH8mj1sa/5JDDLXsZB6YFz92rU4JqftZ/A5pu0sg6HvjpeMl++ZRlGacEMNauPH5vY3aNymkWAu
	Wd5TDqhHCU3zI5xYTPvZHjmxJA2J8R/uhXSNvk9TiHSbqpf3rI2M2VugwtK4HpiWx0A4Dr3+Kop6l
	n3YHYrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kl-00000001JzW-1sP5;
	Sun, 25 Oct 2026 19:19:35 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3kh-00000001Jyh-3sDA;
	Sun, 25 Oct 2026 19:19:33 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJJ1eT514480
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:19:04 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJJ1eT514480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792955945;
	bh=Dqs4z2NY1rb7FbmpNSV5YxzKzMNh1uksqRMZQL4TgK8=;
	h=From:To:Cc:Subject:Date;
	b=tA4kVeKENgDnCqlEJ4/6yeAWjQe5GPl9K8OgiL9OoWKSllIreQ9QS+7hgJIIE1sI1
	 pwhNYsgj5KbD4nNXXPpaJhuN9xkgr6XWQ0toQo/CC5+j1pfAWjpT5Yvg3hWqpTRnfQ
	 2nlmye3svoCEB8XtpL+QrxHI5cMN5OtfdetVsQEo=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, yu.tu@amlogic.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] clk: meson: s4: two peripheral clock fixes
Date: Sun, 25 Oct 2026 20:18:50 +0100
Message-ID: <20261025191852.208226-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_121932_185317_128DE0B9 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Two fixes for the S4 peripheral clock controller found while bringing
up an S905W2 TV box:

 - the PWM muxes may pick vid_pll, which is reprogrammed on every HDMI
   mode set and so changes the period of any PWM that runs from it. On
   this board that corrupted the PWM CPU regulator (first cpufreq
   transition hung the SoC) and the 32.768 kHz clock of the SDIO wifi
   chip;
 - the CEC 32k selectors lack CLK_SET_RATE_PARENT, so AO-CEC cannot set
   its 32768 Hz rate and fails to probe.

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

Christian Stefan Kövér-Draxl (2):
  clk: meson: s4: keep the PWM clocks off vid_pll
  clk: meson: s4: propagate rate requests through the CEC 32k muxes

 drivers/clk/meson/s4-peripherals.c | 40 +++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


