Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 05:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wVOti50J;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nOzYcQ4q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bUXd6wCGkdy3sUL1jP3fBL2bNrVaPeuZ1kav6MQ03xQ=; b=wVOti50JKK5udsZUTpEBmTGd0n
	wpZ3aVveVXzzg0O0DQBM6EWuagTv5uSgXnogK4FXhML9C2tjTr4f+AZf8RbSq4VXpyfUwAD8e+EE6
	aUuTfe9WT8vTgdjmggNZC9nEmz+DLeqh80tjdI0M4bIXw/ELYVwbATsCw87eYB6vNJGW9qtihjDjH
	sDqa9GCWqOwI+LUdZnAnQGDN/Dfj522IDSo1ZuD6eM+2c6K8+wvoPET0NP5SHTcAtR+pRZh6Dfe4v
	8JYtifaDkJDiEt7xylvwZ8SxEuAiV+IgWx4u/eVCaStyAS73IIeFaXiWWien7e+vBi03IEfOdTkGN
	iEKW9OMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvs1-00000006L8X-1MFp;
	Wed, 28 Oct 2026 05:06:41 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvry-00000006L87-0UNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 05:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bU
	Xd6wCGkdy3sUL1jP3fBL2bNrVaPeuZ1kav6MQ03xQ=; b=nOzYcQ4qMVtVeZi2Pt
	cReMe+ncj9l3Cnb8pfwXcxRBscn3+ASfglv3RjT9Y4wDGCp80brrZn44/1DTuEdn
	VPxlee0+VnZ0DFi1S3L3RLUaX8mVRav2mfcgDWGdsP8OozxxHdVtMh2PfuP4UZKN
	Sc05LEkm2MJ9x/MoM5J9xCdq8=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnt9XTguFq0hNpDQ--.19760S2;
	Wed, 28 Oct 2026 13:06:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Ban Tao <fengzheng923@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Joao Schim <joao@schimsalabim.eu>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: resume device for control access
Date: Wed, 28 Oct 2026 13:06:26 +0800
Message-Id: <20261028050626.133421-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnt9XTguFq0hNpDQ--.19760S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF43ur13Kr1DWF4DGF18AFb_yoWrGF45pF
	1fJF43tFs5Jw4F93ZFyr48Xr13CrZ3KF4kA3yIy3y7Cr1xGw1IgF9Fv34rCFZ0krZ0kFsr
	Ar1jv34Sg3Zaka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8AwsUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xToI2rhgtTr5QAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220638_551521_53CDDD5E 
X-CRM114-Status: GOOD (  10.81  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The capture volume controls use regmap directly while runtime PM may
have suspended the DMIC and disabled its clocks. Since the regmap has no
cache, reading or writing a control while suspended accesses unpowered
hardware.

Use control callbacks which resume the device around the regmap access
and release the runtime PM reference afterwards.

Fixes: 9a8cadddd930 ("ASoC: sunxi: DMIC: Add controls for adjusting the mic gains")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 59 +++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 5c784b1f6846..a5f70db856b9 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -286,22 +286,55 @@ MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);
 
-static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
+static int sun50i_dmic_get_volsw(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
 
-        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
-                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
-                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
-                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
-        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
-                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
-                       0xFF, 0, sun50i_dmic_vol_scale),
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0)
+		return ret;
 
+	ret = snd_soc_get_volsw(kcontrol, ucontrol);
+	pm_runtime_put(component->dev);
 
+	return ret;
+}
+
+static int sun50i_dmic_put_volsw(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	pm_runtime_put(component->dev);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
+			   SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
+			   SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
+			   SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
+	SOC_DOUBLE_EXT_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
+			   SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
+			   0xFF, 0, sun50i_dmic_get_volsw, sun50i_dmic_put_volsw,
+			   sun50i_dmic_vol_scale),
 };
 
 static const struct snd_soc_component_driver sun50i_dmic_component = {
-- 
2.34.1


