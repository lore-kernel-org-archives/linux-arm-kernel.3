Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A2BCA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqJrClj0hpukmPSuCU63rfNFKhgNi2ltu4qiTIVaqY4=; b=qa5KcS1vEsxCmmgw9Svf/B8JTv
	fcOh8xB9lIP+IXQbYFVe6bwerBx8NfujiA7ho8nSbFcrCBXjbczs9+bybB6wjb8OI3ATYNG2DSKYY
	1qp5A9oKG7P2euCZJqS+fOhXRjPLyqk6ldj5Jo7+XkmhdQZiFsQ9xd8FNF+o+MUPLXLztRnhBCbg6
	1DaKZ2gWMI8Jxb8mkEsXqUVt09jiNWNREk/5/8ThlahTJMQcemhKWeYCPcIMFkzcjjzNkALQY0glv
	2Cfy/lXlLVbO9JiUGd1X5/OctdTYd7fEae6QEf28L7hb8uwvqYh76RrwXvg2EcC2mtuxQ7CGKL774
	PFWjFtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF19T-00000005LYD-1HMN;
	Fri, 09 Oct 2026 03:20:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF19R-00000005LWW-0cZk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 03:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OqJrClj0hpukmPSuCU63rfNFKhgNi2ltu4qiTIVaqY4=; b=m+V/QuhHAhvEfqO900o5/nOhCP
	KorgyQTiaMEYL24FBYgKwW/vmEJU+hf0iP9wi00xb24yOVk5VOVFXyUPBOZ479/1IOjVz3OPYd60Y
	JWhmBdYux6Tuz4Z7QsbyohbCLHGpm3I0chWVnen/wL7e26qEppE+BuLt2T/t/PWtCxPxHM2wlXCtg
	FvJkrD6obALUnx4oOyxL4LXd4LGydrEwBORU3DqNcxWG5rVen7hhvmSUvfGl7FhEwtjSKoKrso/mR
	syui7D6W0ky6XNRcEBK+mCUNUO5/EUynEqYLt4HW1zX0nak+LRc5eXi+jPV+mZNX6ILHquJwd1KdX
	HV0R5/WQ==;
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF19N-0000000Aqxo-0Ph6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:20:03 +0000
X-QQ-mid: zesmtpip2t1791515878t01bec5eb
X-QQ-Originating-IP: W901LGDAxK9FnKMrdb8jn/PLHEBs5fLGm4GCmdLNebs=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 851849396968121917
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:06 +0800
Subject: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=sophon@radxa.com;
 h=from:subject:message-id; bh=jV+NKP5wd7+th5uGz3VcadTxsByLPMZY731XOUUipHg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlbpHZU9IvZcT795xa3Kji/MLyYxMl7neyeTkrZ3L
 79b09vZHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACay/hMjw45PuU5zvq2qe/Uy
 79bKKwVlradCpi3j2NL0V0V6usbydZGMDEd95NKXPMoySZn3YPKKhcWTQlqvh3LdWTvffudd62c
 Xc1gA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mw5V7KuSxHjfmVuDyOKwQHoOfPQkN//6kwHMrj5hWFN27j/nbAldC6I+
	MLbIyMTY6+UH1Fxl748tOpaoDDreD4MAEe1ADtiIuajDXW1OhXtYEg6TQfnIlGesWcTGgGn
	GPOWk/z348Wx0zd5gqs2kbOoZM9vIvVZ2r4EpgTVFn1UhedqdZTATKvjKtoXcAwXDwzW7El
	tb4MN76BcujjT2uF6lVJvGZ3Y9xgTQES+J86+j3N9unJRIB7GqXKJDCWr6pqRvlNdQoHJMv
	unNtkPBtO9UJF0bzibbG1m5JHznrHkmlhNHM9ysrEjasrOkAbxmQ6w6QmkVPdMjgT36T6l5
	d/1ToOU5zQBUFUwUXbLlSYoihWQt2vhsciseSQYIxSlTpadzEZG0RYbK5R9XInsFs0u/b/8
	hc37ZayLLYQ2uxwFdL49sMIYJGZgYgFvyB9gwGhIumIuatx1nuyp1OLuj+dAXs/4BQZ70hH
	1ox4DHtm9f+VD30D0E4i63w8LQNpPplk2lt1amzf+WcjjACHjWlnws8MdS/GzThe6MgXXpN
	VPcvKSg3nW0I4YhqlpvKOKFeDACBHHpLLkPFuHcSQowWik9aIKSBLd8bFRLTN9HVZo5eWtm
	4denaBvgA51pSJcPLf/8HH4yEs5lK9VLOm/6rHxLTD4Q+m51lm3gJE604im4myDXxjDGszN
	/BtPAygrjLCXdsyupsOkERFh12rES/QkshbFawfUPh8B/w90TDaQhJqyFjd60I9k6Rc2U7b
	oYjtyv9G53IyEHgZ82i0XnHcb8DGRwXS3bggNZLgohCU75Xx1dc4QmjE522myLEPZvLRk/H
	lM/MaDRHHoA4eOGnELv1zlKyisDqgfkcjVQYFkBa/oLBb5b/hK7nSaJTPzub99CLIueQMno
	g+Vlcdvd3O6icdbXlUEXK+BN9ZEAQCWwqj+ICJFE/V4PVL3iZY3kC/5rCFhq7+Cg2PKF5Y0
	SsyWXt11i3iWiHELVPRbmn9OomyBNleShnBYCQOSY5fIjS1glbooDa/AhhNT2/VnDbMn6KS
	g7+okWtQDEr7Z1Fbmz9LeN4bIOwtdlYXVUuxYG8Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_042002_236032_1B8C8F89 
X-CRM114-Status: GOOD (  11.59  )
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

The MISC0 update clears the bit-depth field but only ORs in the new
colorimetry value. Bits from the previous stream can therefore survive
when the new value clears them.

Clear the colorimetry field together with the bit-depth field before
programming the new stream.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 791bb3af2cad..783cafb22374 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
-	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
+		      GENMASK(4, 1));
 	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
 	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
 	/* Configure clock to synchronous mode */

-- 
2.56.0


