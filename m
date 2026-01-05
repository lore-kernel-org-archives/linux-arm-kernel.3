Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701DBC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdyq1H9VC1A=; b=poKXkXwhkeTxoKA1jnR88LdsIO
	adR0SqvWFL/F8kpBteD5wLNbzK87Yi8ahYmBgoGSYuaY7SbmW+Y6O9s9CeaZ5h9MWn0rp3QKs9DLs
	NOcRilsW3PZP5a9svtbVqbOkeSCa86MTyUt9NqlMp1Z8qQ1QnAW38Ep9AzHZSw5ujXY8Pb+PBJ9fB
	TEwM2oCQkqhdnXudwOEVSh58E1fCVBvrK2oxCyjDYhPyaMgEjeL+I9eC0/HQ+JqQUZW+AT1WvLtr5
	1SPJdj9GUclx3WDGQBNhoWc/jqjD/vDqjDaaiG1QeeqoA0QL/pG/yQAQO19/ZwVwSkY6IzQZjYxEH
	Z+Oc1ToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcm98-0000000BaIF-1mcv;
	Mon, 05 Jan 2026 15:05:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcm95-0000000BaHZ-3idJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:05:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059uJuM3541645
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 15:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdy
	q1H9VC1A=; b=HDdRI2aEFWBsVCXxYb7DDF/yRICuvU2f1RuxCRwfI5Ux79Ff1Ls
	TAAc+iOctJFy16bG8MRe775UCe0R2y0gzCJpoSIq8yMX/SMVozMNBoWmRMmKHPMr
	wWGMSJJc0jg6YaPx6DFv+z6S3ioL7TgmXLlmkH/OCIVvXUGERk1SIixoRjuKEOJR
	x+LpUw6izpW2OetRDZs6XB312A5fN33LzD39eCa8lHr9zXR/W8wJlCm0SCat1ngC
	kPUutsKih+ofHY7gWteQeDo3K8blwJ44VzKyX/9o6uUoqRF9k/vkGV549tWfTv7G
	wv9A7eSrA5K1EwyUzp9RHicOe8TEhJY66Dw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shv6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 15:05:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-559597c717dso11317e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767625521; x=1768230321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdyq1H9VC1A=;
        b=JuSRLgivfANpHrpcCDzla/STpV4QAQFCEUjcSVITonB1Nhd1Om4hTduMOjmmM6duBq
         /isYuBKaqgmTwE3H2/kfxBF06SvB4jt+x/555D0OCgmpE93Fd1TCMvtRUHvbfk4vdVbj
         e9iCmoszMz3RkkrcW6yeHX0Xsje4F3GRdUEguPJOfcMq977p0Cawj5GUDqf+SD/wK5ix
         qRfFvoFkZADMDP4qWGsbb4F2qW8xmd+hKEU1He1ZzexQ65jPGuxICFui/cOKOI9bwVy/
         FWfJVTHj05lsRiQJsGCerIMbK5tqbiYg9tsiwokNCHApHzIlUNMlMwdoXRldv6C6R5sP
         QJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625521; x=1768230321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdyq1H9VC1A=;
        b=LZRhNjONgUXtGA2saEl9wllW+kHqrVARKXiRk5pQuL3rdAYeUfZD4cRh12tJJWBmdi
         HfNiWp1Y3dfgtbizl3Du1yM9HREOreu5gPZaZ+6yhk6T9JQ/PhA53LX5i/UVABIJ2f0I
         p8U6Hh6n2UUIU2vF3NWVukdzy3pVXj2bqfoXHGTdQWBcr1YsPIzqSOI42wOjVqJSxSs1
         4urzxYttwl1nNd3hWNwL8dVAqNwNQhoFgQNezXTFIaHHIwnTXxCtn64Kl0JLms/f5oHE
         Lt5tq6LpBfHbc241+0Vw3lV3CLaPqbGIW2CuKsqLwESKH9SPpTJtCn5MGLJn5L3tmAMc
         jz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDZJLsQu+d8JUTToIh71eksNlqxFL2qz8LqabTb4JjyEWhbbLMp4POwLrInTd9Kc3fX0f7mzapGLTMSZtsEtxE@lists.infradead.org
X-Gm-Message-State: AOJu0YzfPfqVC1XED+8hzz0oDvdm+iHxmW7w1+wrT/s97Atqbfqi6Hd7
	S95q/qE8UJ6e4tTdlZOJ8+JyhwVybSRVSTF+hNpM4dYIt3WrTd6SNOum+YXku9YDMv6V6Nm4i+s
	LhzjxFgdWK8hPwQKIHijtmQakOxlMH1q9AoU/+msn4oNR9u8sxOcb5y45Tmo3xzn8Hvu6QbtbIK
	YObQ==
X-Gm-Gg: AY/fxX7u/ozdJASzxXATlW3wVGdCHhHy9QSwytRYOioyn10OqBuUWBqgAnGgimOgpRW
	ecYq1BSRC6RFaw3YUEkBInGORDjUBPPubjzF8QTXvi2EC28DAUZBgcD9P/GIh98B5XZr2v11VKe
	XrWkF2zWQz+4rF2ax0MIakl3Ik7NqnofJflk19PVf6nr9QNCNOENJH6Ht1/zZ2KXpRYWCNWKlSX
	hWRi3fQBi0vxdn5hDdp2NlOr5HTPziFM1Jy88PWLaoK4MoXq9y9of5UQdgep9bAxAKlUDVhfZNU
	Ayn6MCGVhgqbCDeomqFId8fw28LBTqazVcwnTgFpOPbGviq1EfYyw/cy7jNFiWhXWrmFfg43R3x
	w7Bprue37SrKnn+HpyFDUjm9ExpHMxZ7GXTvqLbg=
X-Received: by 2002:a05:6122:7cd:b0:559:6e78:a434 with SMTP id 71dfb90a1353d-5615bbb613fmr16174855e0c.0.1767625519862;
        Mon, 05 Jan 2026 07:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtVydwCbdWuKMgUh2s3Z2eGw3aJWvq/Nci+QqerT78i3llXQMgvkcfAvCV5pFW4+FSDFw4XQ==
X-Received: by 2002:a05:6122:7cd:b0:559:6e78:a434 with SMTP id 71dfb90a1353d-5615bbb613fmr16174732e0c.0.1767625517957;
        Mon, 05 Jan 2026 07:05:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dd3b:c635:dd06:9574])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c08ef66sm57732685e9.10.2026.01.05.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:05:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
Date: Mon,  5 Jan 2026 16:05:08 +0100
Message-ID: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bd332 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=z2IfzJB68yTmpBagawIA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzMiBTYWx0ZWRfXwA+nx2fINrQ5
 6AU13Rmsw2D8RttT+PtOXG6thpynTANDlA3xLd7aIK79sxv4j6n9iqoxHR7MuI25q/uJW7iYowE
 CtWhcmVd689Dp7Kc/wwplpCWP7I//tPj7V1bfd23WKNaxDqbdJkS5ysed98Gd9MbtJ34omxXxo+
 3fLnjRYq2EFhugEZR/eB3kXAcwzJLEorWWEfSXQ5KhZT7Xq9lvhA7MVTo0vYs+nZqO5DaeU/OgD
 lK66LOIfjMrxXyxLIL1JqDUp6fg910eyUQ+NU9j8ZDfIbKHZdKpBX5SdXLWlbwjgGtuDwQfTg4p
 wbdbsU3+kArthbN/XsofOVzmUEpAH0zZfRGSEYSNgwvmISaSVAs9BHsHotZlDSdJwJ9/9qs5TGj
 7Sflu1PVDX3a03O4G2kAd3I8cTomWCZnvrzd5ZzFNO9ed+I1tOTb0nuiQiRQqnuwY2gNZlUK3Hv
 92aQvZdYOpaCMzo7ztg==
X-Proofpoint-ORIG-GUID: mK3IFgQ7VY3pxyQaFarMqEyL7G9qQIl3
X-Proofpoint-GUID: mK3IFgQ7VY3pxyQaFarMqEyL7G9qQIl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_070523_946544_DEC40ADD 
X-CRM114-Status: GOOD (  16.66  )
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

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization.

This can cause the following lockdep splat with shared GPIOs enabled on
boards which have multiple devices using the same GPIO:

BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
kworker/u25:3
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
irq event stamp: 46379
hardirqs last  enabled at (46379): [<ffff8000813acb24>]
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (46378): [<ffff8000813abf38>]
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (46330): [<ffff8000800c71b4>]
handle_softirqs+0x4c4/0x4dc
softirqs last disabled at (46295): [<ffff800080010674>]
__do_softirq+0x14/0x20
CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
6.19.0-rc4-next-20260105+ #11963 PREEMPT
Tainted: [C]=CRAP
Hardware name: Khadas VIM3 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_set_config+0x40/0xdc
  gpiochip_generic_config+0x28/0x3c
  gpio_do_set_config+0xa8/0x194
  gpiod_set_config+0x34/0xfc
  gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
  gpio_do_set_config+0xa8/0x194
  gpiod_set_transitory+0x4c/0xf0
  gpiod_configure_flags+0xa4/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get+0x18/0x24
  mmc_pwrseq_emmc_probe+0x40/0xb8
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x80/0xdc
  __device_attach+0xa8/0x1b0

Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
Cc: stable@vger.kernel.org
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 18295b15ecd9..4507dc8b5563 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.set = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
-	pc->chip.can_sleep = false;
+	pc->chip.can_sleep = true;
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
-- 
2.47.3


