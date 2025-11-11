Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5696CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEt7DDSrIcyf6uGGtztza2SB7uVw9iQvg1tytm9ezW8=; b=LCOQgBM/DTFxy9/0tCu4RSyYBj
	IDwWIeZV8ttgvJgb4ueUk+dwwguVhEd574z1bjAUDzGyP77WymdefYs2ff02/6YXpOBecYdu6hlAQ
	vNVIUc9CHX8y13MuNyOiM08++9VrQT5MHjvPxUe3aWe+BnEOImGcbbxigVlCPGGNhqC7Svhki0gF1
	DYrWt1jToCTnFBptrg97pdVWUYJLzhXFdEONYF3eyAKENF7fkyjKblH15FoaKHgRTD7RLfUfwm2dQ
	VMESntKUVnuQIS1VOaKnPh9AFIaOrdDfCNVNSkobvO7A5c6YB5eh7T7nLcZjEDM1GK4viHFKkmyy/
	8q/N5buA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvQ1-00000007lel-1QVp;
	Tue, 11 Nov 2025 20:56:49 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvPu-00000007le6-0fY5;
	Tue, 11 Nov 2025 20:56:47 +0000
Received: from [192.168.2.104] (213.87.136.181) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 11 Nov
 2025 23:56:21 +0300
Message-ID: <40da59f8-10e9-49b0-9f25-1474067625f6@omp.ru>
Date: Tue, 11 Nov 2025 23:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-rockchip@lists.infradead.org>
CC: Mark Yao <markyao0591@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	Karina Yankevich <k.yankevich@omp.ru>, <lvc-project@linuxtesting.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH RFT] drm/rockchip: vop: fix simple case of window scaling
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.136.181]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/11/2025 20:42:12
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 197978 [Nov 11 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 75 0.3.75
 aab2175a55dcbd410b25b8694e49bbee3c09cdde
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.136.181
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/11/2025 20:44:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/11/2025 7:32:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_125642_210780_88332461 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

In scl_cal_scale2(), if the dst parameter equals to 1, then division by
0 will happen. Actually, the whole {src,dst} - 1 thing is caused by what
seems to be an error in the Rockchip manuals which say that the window's
width/height fields of the VOP_WIN<n>_{ACT,DSP}_INFO registers should be
used for the division verbatim -- and those are actually 1 less than the
window's real width/height; so scl_cal_scale2() returns expected result
(0x1000) only when src equals dst...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 1194fffbb102 ("drm/rockchip: vop: spilt scale regsters")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
on gitlab.freedesktop.org.

Note that scl_cal_scale() does look buggy as well, but I can't figure out
(even having the RK3288 manual) how to properly fix that (it's only clear
that -1 should be removed; perhaps Mark Yao can help there...

 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
===================================================================
--- kernel.orig/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -360,7 +360,7 @@ static inline uint16_t scl_cal_scale(int
 
 static inline uint16_t scl_cal_scale2(int src, int dst)
 {
-	return ((src - 1) << 12) / (dst - 1);
+	return (src << 12) / dst;
 }
 
 #define GET_SCL_FT_BILI_DN(src, dst)	scl_cal_scale(src, dst, 12)

