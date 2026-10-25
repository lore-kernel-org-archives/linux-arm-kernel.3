Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628860A262D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ayOQ/Oy;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=ITNqoDhO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=67zqypIqeW8ZVZEfVBlJG12FCXsLePvvX660ZE95YLc=; b=3ayOQ/Oy0o4ZDF
	BvcoSN1HtwSMDqZ18sYStGHYJ90LDYVWFeABTxCBbV0BbgECCEQsh8kbgB/sed635RfPt6TPtx+mx
	NkjOtGow6hlBdCM91xqYBzMligcY6Gazj31ZWu1kdsvOUo6nz+Ginwsfmjq/bKruITqV9KkEeb/aO
	b9QM9YqKeJt+6itKzz53ywnMcr21d/KQU7vale4pZwMXEov2xweY5ais6FZH5l1vxOmNTWspsPbhI
	bt+AJRam+5/+51fzZmcOTd4o4I2qglBSFo4RunHepDiusy+xYYgcWtZ3F5twql+m8tNNqMhSqyKvZ
	DF5ew9nsmXrzh3dKqsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nt-00000001Lar-3FlL;
	Sun, 25 Oct 2026 19:22:49 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3ng-00000001LJu-104a;
	Sun, 25 Oct 2026 19:22:38 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJMK13517096
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:29 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJMK13517096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956149;
	bh=67zqypIqeW8ZVZEfVBlJG12FCXsLePvvX660ZE95YLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ITNqoDhOUAXftehRFmmWEEKsPEp1AUpYIsRdLzzpVvubibgqbLuLTZs9/q4DrjicR
	 KLCGI5zrd8VOREbmRcQDaiAc2SqsY+gY8nL3zDS3WL/B3D2lkTGQkWawQFmNnzmVBw
	 zsX6rpjfRENOYh824M4G7JeqeYz7YpWAVLuaxSV0=
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
Subject: [PATCH 3/4] firmware: meson: sm: add the CPU speed bin call
Date: Sun, 25 Oct 2026 20:22:18 +0100
Message-ID: <20261025192219.209137-4-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122236_493599_CA6F9C38 
X-CRM114-Status: UNSURE (   9.84  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Amlogic SoCs are binned at manufacturing time and the bin selects the
CPU voltage curve. On S4 it can only be read through the secure monitor
(SMC 0x82000088, argument: cluster id), which returns the bin index.

Add the command so that a cpufreq driver can pick the right curve.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/firmware/meson/meson_sm.c       | 1 +
 include/linux/firmware/meson/meson_sm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 5410386603c7..540773887fe5 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -51,6 +51,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
 		CMD(SM_SET_POWEROFF_FLAG,	0x82000042),
+		CMD(SM_GET_CPU_SPEED_BIN,	0x82000088),
 		{ /* sentinel */ },
 	},
 };
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3f2fa160e32f..9d11832bf638 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -16,6 +16,7 @@ enum {
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
 	SM_SET_POWEROFF_FLAG,
+	SM_GET_CPU_SPEED_BIN,
 };
 
 struct meson_sm_firmware;
-- 
2.56.0


