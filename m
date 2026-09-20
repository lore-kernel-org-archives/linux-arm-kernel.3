Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82064C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=; b=ZkePxIynGWBjSqRSkbJHnJ0Mp4
	uluhYlkGRHc4eFCBIg5OmmZkQ0FuCsgZpXCcAiNssYC2v7t6vYLXI9DM9h25NqJbViSA1EPNH7nO4
	yT5RY3ye4P7DXRR1Rd5YGZr4UDV/gx/a/Ei1ZGdphh8e1EUBs/mIDw7L2mWJPCVo3hdu1X0h6NRM8
	pBYnURjayfxWUAyuVnb2HFtbWWf02B41m4MI5fqlDZ3arxs+OV2u4bIGG0C9uOghCO5qA2dW/2rzO
	qhCtn0ZJIZtG20oQoXDw97VSCDAOU1WfcUoCd3CaK1mzuESGRQ5msdBROEuJp8ktgPUvB5pOoP539
	uwjvsysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ar-0000000GsHK-0tTz;
	Sun, 20 Sep 2026 04:56:01 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89am-0000000GsDI-11Ww
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:55:58 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df38376150so1165725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880155; x=1790484955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=bl3TqjHlnWHxK2pFcMqN+IG9EA0kZM4sG4fSsP5SoGw0VOxPAEC5cSjr5kSPjCBknU
         +JDcbJVtfa9IjC9J3EXu+OJDH2RACfxs1SUutr0S55XZRX22GtDXk1fSoO9tIX0VkdZ+
         BYR7xQ01sarK+2FGg8rVcOUAtpVHZu5RSScNXe7SuYQscuMLbBwwa5chBcIqDvocfAzt
         mm7EsuICpAOa4QZSl+lfYGjNJqqMJYR4eTJ5Rmpb033nZBUbLbhTHJUg0zr4/5H9ZHyU
         Ks6fNNNHkYo9TpfGFuo6OdE23fvLmRAnm5Rw0AWbNkHlxH95iFcHMPnjncr24Wpxj1Nm
         WTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880155; x=1790484955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=jDtEPW8PEOHijhoCILoZsCgR5+Mof21WDJBDZb+A1Gn2OxNbv65nHXvOMFZfAo58Sk
         wAaJfthdR6t9tZNKkaOCgMPKPlur0JfW7Fx/kx3a+VZdGNHqFof263mMpypI6oR72bom
         BB1MZktdnlJq4tnWxQGDbyGSa8ulMOpsz4IEX26fpSTSZ/ChBu7VTLJnfKE0IEHmlOjw
         HMjdvfWAMSEdPbV3+700v3UDT6YemmylTO5U4VTS0SEeJsvAUC/JmiaKvv5SQ24JI3W4
         dpXiYkzHIoEHB5RcryzSfDCva2qaI4atR0vBtcIyxIQXgQrRwKJRmT3KdubKzHtedqIO
         L8qg==
X-Forwarded-Encrypted: i=1; AKwUvBzqG8+NpR1hKShdbm1UM5+pDyT+y9E4oS35rnLLQgAd664FAxep9MstIAqvHnCPJThHyKHa4oHpd1Ig298K7TXV@lists.infradead.org
X-Gm-Message-State: AFuF++mCedG2OB/B4RWWmxUKmiWZEc3a79ToXSVDs1fZZiyLbwHTY9zA
	DkCzM7NGiRhEzXpCrUQrVoDq/GSFVrQ3wU52/AjVFBlKmnC2HZyBFS4p
X-Gm-Gg: AYBFou09O4gnN2FgP2SUcZoGV18u3u9UZqrHMUW9951Uqd5PWYsxI0vwAYiSR295t5T
	5krjcunDM3nab1U/OcJ75o3y3ShGQp2C3RysnA0ssrHx+aLNvldXnlKZUtHPW60V/2P0ta+VKvr
	AHzO1a95BjAlfZXQARDs1GDP5V4UTMF5uhJhKoftW02ADuqiXKdnpmZVcCuxChBaOFXEaGGT/bW
	DKDxHPvnRJR/vwNlV7EOLbUmK9QTdv9PHcW3hsh1PoUIkfZqKrbfNTUEw/ai0qEWm7Bv0g1INHl
	zQDeyjr/gVRvGqGPMcBpRXlD0GrlkwAobkdzxfEEDJfqPhDNnYEHgVrGG1lraqAPUrqiOHwYalN
	zc3F27XH3PFrdMFLoVjhxt0/IN6Op5hFNtsomWpTqyK7HM1U3hnTKYWLnxA6IJc1kLfyy7VzGuK
	27P4ay2J4Mc90upKmmEk17f8/bH4sf381G+9ISHd+CFlxXbNbgVRQJPls6WSzjIaw3CGYOHUjPz
	3zwx+vlMlnRa6aBeRqjewiP0zckzADANZtpzGLP+7Lp8BUOrh4r8RIdv83iaMayESXssCvnFdjM
	iKeWo/JqzB8r8U9nKCh+cw0IOvv5ugj27RbQaeC3fcN7xjY=
X-Received: by 2002:a17:902:d2d2:b0:2dd:ad73:5b5a with SMTP id d9443c01a7336-2ddb224f33bmr80978895ad.21.1789880155541;
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:44 +1000
Subject: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sB9amKGCujymCV5dzhnXLQgtXCZDFSeONKc8RiAMJk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UN5p3NCRDcX2rwtCeY+U1o1BqxOV9aeCT2Pg2+s
 cW76L9px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojPRn+adW6m8+Zu2WmcdojE37fL2mVgR13MvV2nf3JeWLWmeYpRxj+mShcjNp
 sw+Q7MyPW1PitzbHnSd8+notYbJv1bMt81fmGPAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215556_297123_D3D9A322 
X-CRM114-Status: GOOD (  13.19  )
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

From: Hector Martin <marcan@marcan.st>

Fixes warning:

[    8.502802] ------------[ cut here ]------------
[    8.503445] cpu_latency_qos_remove_request called for unknown object
[    8.504269] WARNING: CPU: 5 PID: 2790 at kernel/power/qos.c:322 cpu_latency_qos_remove_request+0x48/0x98
[    8.505499] CPU: 5 PID: 2790 Comm: wireplumber Tainted: G        W          6.5.0-asahi-00708-gb9b88240f7ae #2291
[    8.506777] Hardware name: Apple MacBook Air (13-inch, M2, 2022) (DT)
<snip regs>
[    8.519099] Call trace:
[    8.519402]  cpu_latency_qos_remove_request+0x48/0x98
[    8.520027]  snd_pcm_ioctl+0x86c/0x182c
[    8.520519]  __arm64_sys_ioctl+0xf8/0xbd0
[    8.521020]  invoke_syscall.constprop.0+0x78/0xc8
[    8.521604]  do_el0_svc+0x58/0x154
[    8.522026]  el0_svc+0x34/0xe4
[    8.522409]  el0t_64_sync_handler+0x120/0x12c
[    8.522951]  el0t_64_sync+0x190/0x194
[    8.523408] ---[ end trace 0000000000000000 ]---

Fixes: 5371a79be97c ("sound: Call cpu_latency_qos_*() instead of pm_qos_*()")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_native.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6d32c12fb79b..88c83e5fd6cf 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -971,8 +971,9 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		goto unlock;
 	result = do_hw_free(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
-	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
- unlock:
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+unlock:
 	snd_pcm_buffer_access_unlock(runtime);
 	return result;
 }

-- 
2.55.0


