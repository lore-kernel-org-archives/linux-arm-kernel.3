Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AA0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nOU0FRM/CVb4ITNAIwXG/xESH05yUYICHxJJfHCnxk=; b=BFwDBRir/eji427psSjAybvUtE
	xKI6EkcinH43w2xIbHQw0JugREXN8N63ITvo+My+M/QwTz1wikRMcHnC6mpiZWJh2Wsh+F9XAJ3xE
	ARvxmZX3XPq6HwoRHplDSxtF255FrALApafcjF/3oehw5YYd9F0++1taQV6DmDMqO5HNzF+/85joc
	LGhynnZUib/GB6Ca9f0EOpoeD3Cr6ED7TEMwipizdz6vpPjAJedTTSbcYwh3UejTEeHJM7vtFeKg1
	lER4n8ayPotXF7ibOrsg4g26WI2u191T6pHY9Zjx5hsOkNV2rvxxZzMvTekeAdJXseSHzEGWiJHWF
	nEUeVacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8D-0000000HGnS-0Kmj;
	Wed, 08 Jul 2026 14:20:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT84-0000000HGg2-478I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9366765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520400; x=1784125200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nOU0FRM/CVb4ITNAIwXG/xESH05yUYICHxJJfHCnxk=;
        b=XhnCjfgolaEioT1eXqz7XB8JB3+9FTwAn4Gdsn423ZvWdnS0hwmb8IL/kgtpiXCDCM
         D5wr+7sQ840vg4meOdaLsRIDBKujiyZuSwMdpHYlsXTXbWyC65oQmuDnyC+kgsuT9zOT
         1mNjZyHxJY+kXN2rAxBcpC/fTD5AN7tBHEQbLDRv/TYIgC/JJABkILqbZVwmMEc1LUYD
         YNO/CyEzqyzHUE0kHWpAVpOPIYgoTJsjjRKkqmzUV+2AVB7Bk0rd6Lk9PwqDX/JBghTs
         5A5CcFYLm3nCESz+fei7RgiF7NdYA7pTJqPhrru+GFq6bqNiQnSWQHZuLIms4kSje1+r
         qEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520400; x=1784125200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nOU0FRM/CVb4ITNAIwXG/xESH05yUYICHxJJfHCnxk=;
        b=CBBiRWiygCSvAWcHpyh7wq9gZ7baKSAIvWCh2nwgAkX/nZWH/xlcQjczA6thRjW2fT
         34uWdEy4XnWf/QUwc3I6qg8EQaEjq4bKHQdB373JrlEACVjsa9CuMG71BAQ/8diWDkso
         Z0kFqPvUwt/7Jb4vkPwKkWM0lF0eESPA5yvWjdUEfggT+s/VTnTzJY/YqPcogQ+ZIMFC
         FXU2E9o3xQNKPPK6jOvEY1nbiazuoQNRcnLx5egXhvhy+ProAfKFpy7sD/N5mdja1wpf
         jDkIhYG8gdktr3jOdjD4TytpvKjxOZvOe05mrAZuDYtqTo2McbMTGCCOIlMFQYoGpD77
         07vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpds2HGHewblEWWzPJRc55zxQ2VDdxEdLCDVj1dwbSk6IldJOtJj4dfoI+jp5vVeLCqGt2oc7iKoSn8f7FAum1b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FCGj96kYWU7DGtRUEcnzr7iIzl4KsPy/66Bo3tTVZkAI8S7L
	paZu6t+xEzj4LcIblbMLJWr/9Axq+Gg0jw2yjMSAKIDgOp80bKZmMSRo
X-Gm-Gg: AfdE7ckiZaIwPGYtjt4Lugb4Fm+0vhl9WsJ2QD1B0OtwCpIdVWYqRP7Q9Lub+bGyduX
	CjBU/NeAipzaKSmtDH1I3INLn0/K1agI/9Gcw9bQI4xtRkV2jSuZhWr4zwwk1QdXNT2yW7qZ9oP
	eYY0XulQjhoTdLkMaQ+MZSa27FPdbh69cr7BqAblaVrBfc3LGp9RyWKpA3wxAHQHhaxDaFn0ItY
	s90nHpiVVMGGvz3Kf2Q7wnYYunrVZfgOKdPsbVVsvhEqoaIE0juOFm2xuDh7HSXWaiIcuoNgXxW
	P01mG9Jc4mjZRj5183T9v9KSnoCf+uRQGz5V2MjD/NzXY5Ndh9okH4kZjmqTK3IoNBr570XTAD6
	jdoKX72WDvTNdu2ILQygHstsUecKfS44ii5/G50wB0RZqV0hiWGjYdyML76LxOJk5Ovwg9F04Wu
	KI8eQ2MEO8bEom2bMHnNRDsmfcTLIzox9QVrbOS70uJsR17+o=
X-Received: by 2002:a17:902:e751:b0:2cc:eb5d:2b1 with SMTP id d9443c01a7336-2cceb5d02fcmr24409945ad.15.1783520400090;
        Wed, 08 Jul 2026 07:20:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/27] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:14 +0700
Message-ID: <20260708141734.578926-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072001_036547_67038FC4 
X-CRM114-Status: GOOD (  18.67  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/hdac_hdmi.c | 117 +++++++++++++++++------------------
 1 file changed, 57 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3220f9226e0b..387fa22438a0 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -10,6 +10,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -537,10 +538,11 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+									    port->pin,
+									    port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +642,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm) {
-		mutex_lock(&pcm->lock);
-		pcm->chmap_set = false;
-		memset(pcm->chmap, 0, sizeof(pcm->chmap));
-		pcm->channels = 0;
-		mutex_unlock(&pcm->lock);
+		scoped_guard(mutex, &pcm->lock) {
+			pcm->chmap_set = false;
+			memset(pcm->chmap, 0, sizeof(pcm->chmap));
+			pcm->channels = 0;
+		}
 	}
 
 	if (dai_map->port)
@@ -922,7 +924,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +947,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
 				hdac_hdmi_jack_report_sync(pcm, port, true);
-				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
 		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	return ret;
 }
@@ -1274,67 +1274,65 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	 * In case of non MST pin, get_eld info API expectes port
 	 * to be -1.
 	 */
-	mutex_lock(&hdmi->pin_mutex);
-	port->eld.monitor_present = false;
+	scoped_guard(mutex, &hdmi->pin_mutex) {
+		port->eld.monitor_present = false;
 
-	if (pin->mst_capable)
-		port_id = port->id;
+		if (pin->mst_capable)
+			port_id = port->id;
 
-	size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
-				&port->eld.monitor_present,
-				port->eld.eld_buffer,
-				ELD_MAX_SIZE);
+		size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
+					      &port->eld.monitor_present,
+					      port->eld.eld_buffer,
+					      ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
-
-	eld_valid = port->eld.eld_valid;
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		eld_valid = port->eld.eld_valid;
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
-		mutex_unlock(&hdmi->pin_mutex);
-		return;
-	}
+			/*
+			 * PCMs are not registered during device probe, so don't
+			 * report jack here. It will be done in usermode mux
+			 * control select.
+			 */
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, false);
+				schedule_work(&port->dapm_work);
+			}
 
-	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, true);
-			schedule_work(&port->dapm_work);
+			return;
 		}
 
-		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
-			  port->eld.eld_buffer, port->eld.eld_size, false);
+		if (port->eld.monitor_present && port->eld.eld_valid) {
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, true);
+				schedule_work(&port->dapm_work);
+			}
 
+			print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
+					     port->eld.eld_buffer, port->eld.eld_size, false);
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1793,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
 	if (list_empty(&pcm->port_list))
 		return;
 
-	mutex_lock(&pcm->lock);
+	guard(mutex)(&pcm->lock);
 	pcm->chmap_set = true;
 	memcpy(pcm->chmap, chmap, ARRAY_SIZE(pcm->chmap));
 	list_for_each_entry(port, &pcm->port_list, head)
 		if (prepared)
 			hdac_hdmi_setup_audio_infoframe(hdev, pcm, port);
-	mutex_unlock(&pcm->lock);
 }
 
 static bool is_hdac_hdmi_pcm_attached(struct hdac_device *hdev, int pcm_idx)
-- 
2.43.0


