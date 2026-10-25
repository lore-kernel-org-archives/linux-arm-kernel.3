Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B160A6F59
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1MJ9ek4l;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LWzyWMI6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bj6KPWTo+LHMG++Y0e1ZCHYnbGpBM6MvTOvl5Aw9wpM=; b=1MJ9ek4l/A5XUI
	6EfV+s+B9bITdLyDWTPiT5Ve6aSXpx6mSEM0UczcNmPknZXa+txi99EuPaansYns9PefuQkVdKkrS
	+Xav1X+HYb1aGZMs2410qxKRF8p3vyza7Cyi0T5Mz9hZtRm/CENQemXc3EVr9nGzoUe9zNmB2jlmD
	9C592fgtCKYRdIQjH+O4WJIIvpIL5Y1Yo4SlqyfUmr56a+4nDBNHWUdI0oAHHbhpVX+fdLfjCgDYm
	l3zObqLheS8gzHZqrIy/feSxQ5SXqD1s43Vhhhu9MsRllO5e6Zlb8Ls2jmIu/WEUaMxa8+06ELFbA
	Ox7536AcLkJc8eE6+6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pc-00000001MqV-2z7e;
	Sun, 25 Oct 2026 19:24:36 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3pU-00000001Mis-1obU;
	Sun, 25 Oct 2026 19:24:29 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5If518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:19 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5If518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956260;
	bh=bj6KPWTo+LHMG++Y0e1ZCHYnbGpBM6MvTOvl5Aw9wpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWzyWMI6J5a0mUiatjH6qhN4sQFR2QFkXuJmA8GrsbpCN7uq9KOfNrlHQ8VJDOxnO
	 pTPrV6Wh9HYWAAqImr8CMUoDM0Lb1JWkriB1Yh764aNMSG/RnrgncF/Oa/riO+7/HM
	 DGJjnh06KhGm7aBfvLTkwynH63VzxwBbvyi0qMGw=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 6/7] ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
Date: Sun, 25 Oct 2026 20:24:03 +0100
Message-ID: <20261025192404.209695-7-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122428_809066_33331667 
X-CRM114-Status: GOOD (  11.58  )
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

The S4 widget reuses the SM1 mux, whose enum reads the data selector at
bits 19:18, while the S4 match data writes it at bits 20:19: the S4 lane
selector is three bits wide instead of two, which moves the data
selector up by one bit.

Writes therefore land in the right place but reads come from the wrong
bits: selecting I2S C programs the hardware correctly, yet the control
reports I2S A. alsactl then stores the wrong value and breaks the
routing when it restores it on the next boot.

Give S4 its own enum at the right offset.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 sound/soc/meson/g12a-toacodec.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 204bf8654d2e..db7a4470395f 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,6 +21,8 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_S4_MSB		20
+#define  CTRL0_DAT_SEL_S4_LSB		19
 #define  CTRL0_DAT_SEL_SM1_MSB		19
 #define  CTRL0_DAT_SEL_SM1_LSB		18
 #define  CTRL0_DAT_SEL_MSB		15
@@ -126,6 +128,19 @@ static const struct snd_kcontrol_new sm1_toacodec_mux =
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+/*
+ * The S4 lane selector is one bit wider than the SM1 one, which pushes the
+ * data selector up by one bit as well.
+ */
+static SOC_ENUM_SINGLE_DECL(s4_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_S4_LSB,
+			    g12a_toacodec_mux_texts);
+
+static const struct snd_kcontrol_new s4_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", s4_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -146,7 +161,7 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
 
 static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
 	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
-			 &sm1_toacodec_mux),
+			 &s4_toacodec_mux),
 	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
 			    &g12a_toacodec_out_enable),
 };
-- 
2.56.0


