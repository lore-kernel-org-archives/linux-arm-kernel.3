Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA51CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxXXH7kpELvfYY5/wXkAikODv5sI+30bpti3onSO2Ug=; b=s8lspdL1DrNQHufO1qoNx+jcOx
	wdlVro5t7APLGLhh2oot7upYfJrOZV8RljegKgDw/u4GtHoo6yLxLy6opoksNRcQ3Spa/SctuiWHp
	LnmgPLuMQ851ggA9BnSGrAAk0gGivva7V8xtvYrcrSLYVuIR11vUIZ/SVfYmYHJKtYZzV5MIkcGXI
	BWuVdHhNq185KYXDutztCsNIqPMYT6xRoeCJdyM/uE8++KghvRuADNCyOpVD8Ue+U1j7n0TfQ3Cl6
	8RCvnpnvUjQDJ9uiP8sP+IdWhHjEEffOn3352kuUxn1+to93U6A6YC8Y0lKx35P4+jjy4Q6aEOJWl
	rLnzQEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZUC-00000004x5z-0R2F;
	Thu, 25 Sep 2025 00:05:24 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZU9-00000004x2N-0Dqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 00:05:22 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEAE63EEF9;
	Thu, 25 Sep 2025 00:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758758717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PxXXH7kpELvfYY5/wXkAikODv5sI+30bpti3onSO2Ug=;
	b=wtFEaTBOpvWYZy4Uj8iIlwMrWupwmE6VZ4Hk8+c7n2CAlPOA+xPrE3B3eNtII45tbgA7F4
	8hfIHUZmuW1tuX/T4a7Nlw7Aezz3MzWKHQES+2e8l12VILurYdNBsR/yRYtXiOH6p5dXm8
	vacXTmbcJvXEZQY1uiswPDJqhuIFsZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758758717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PxXXH7kpELvfYY5/wXkAikODv5sI+30bpti3onSO2Ug=;
	b=MSzhA+pQDu7DzMYmVCTVhdZXPGnzQSBRXCuPhYcmZ8CVYEdwBK0zJrsGGv168J461D462G
	CCWL2TTI9tGNgECw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758758717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PxXXH7kpELvfYY5/wXkAikODv5sI+30bpti3onSO2Ug=;
	b=wtFEaTBOpvWYZy4Uj8iIlwMrWupwmE6VZ4Hk8+c7n2CAlPOA+xPrE3B3eNtII45tbgA7F4
	8hfIHUZmuW1tuX/T4a7Nlw7Aezz3MzWKHQES+2e8l12VILurYdNBsR/yRYtXiOH6p5dXm8
	vacXTmbcJvXEZQY1uiswPDJqhuIFsZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758758717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PxXXH7kpELvfYY5/wXkAikODv5sI+30bpti3onSO2Ug=;
	b=MSzhA+pQDu7DzMYmVCTVhdZXPGnzQSBRXCuPhYcmZ8CVYEdwBK0zJrsGGv168J461D462G
	CCWL2TTI9tGNgECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC9D61386E;
	Thu, 25 Sep 2025 00:05:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wls7LzyH1GgdNQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 25 Sep 2025 00:05:16 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 0/4] Add Raspberry Pi's RP1 ADC
Date: Thu, 25 Sep 2025 03:04:12 +0300
Message-ID: <20250925000416.2408457-1-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_CC(0.00)[suse.com,roeck-us.net,kernel.org,broadcom.com,lunn.ch,gmx.net,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_170521_234513_1B9FC087 
X-CRM114-Status: GOOD (  10.83  )
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

Hello,

The following patch-set is adding support for RP1 ADC driver,
and enable it for RPi5.

Comments are welcome!

regards,
~Stan

Stanimir Varbanov (4):
  dt-bindings: Add Raspberry Pi's RP1 ADC
  hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
  arm64: dts: rp1: Add Raspberry Pi's RP1 ADC DT node
  arm64: dts: broadcom: Enable RP1 ADC for RPi5

 .../bindings/hwmon/raspberrypi,rp1-adc.yaml   |  46 +++
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |   8 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |   5 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/rp1-adc.c                       | 301 ++++++++++++++++++
 7 files changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
 create mode 100644 drivers/hwmon/rp1-adc.c

-- 
2.47.0


