Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE9DCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KS2SQLRduVfwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=; b=Ogsi8dPpc3/CvMtVg4VpO8+Yda
	i9OzdKHN0dpq/SVSABY9fZerNtuLULLsey5DLO532y0DqRpDMfwKO3y21BDV0kXGCjcat37TKkeL3
	we9lUYZ2Mo24hg8Mt+eHXqoHFDAPs1iR/8aNX4lk3zkvRijQq3GiGEm0Qx3DnRbuywy8TOjg6XGNU
	OTm8wxPv+4mnfhksBD27NcxjmgG9e7Y1/xn7oloBn4so3yZP5htNCsQjn3FfFFvOToVtIDGpa9b+6
	Y3M7vFuF6VullCUojo6WELaG/qAULcYSQjaWk8BlG9aHAM62oiHXt6UhMp0GqRaFDFekjly3sieDw
	gOWq/edg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJZ-0000000Fh7s-2UOI;
	Tue, 05 May 2026 09:43:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJX-0000000Fh60-19WW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:43:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64574Pxo3467704
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 09:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6KS2SQLRduV
	fwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=; b=IHI1EGISjXRgcr2goKmywHG64qA
	WOY1a9Jo1R4VUPIFq4PDJZC6RwiN8CBJI8DYRp1vNOSIvT0sO188clS2U5dk92KX
	pVSCJzQuMeSIk306daJCPVeO2zoBMRlfajRddakne0AUxPbf3Por/CmdGlDEoaBi
	Q5wyIrmaJ6IjUKtesgQ7biqEZQ6DDRmd0MGGE5T3bhohwgoUSgodqcL8R0tPD9Uf
	WsfJ4/dG3TONZaNhRZ+6dYJxGptRMqSnPbcQGdBqiQmWJFoTuUSS+70oqhXr8BQ3
	JiwSuv3TUrj+mBLwbzN9QmAY7XBKYekmGycmby5m8WPqjfktws0Yb8wvtvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjuqjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:43:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso125686391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777974217; x=1778579017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KS2SQLRduVfwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=;
        b=YABK5BczwMbS5uA92YxNk7xS2e79As01yGvBLQrifrtRBFkQl/Uu5+usDq8P6YCAeJ
         6k4h/PmIOoNsYlHcdc/DaQ7pfPLxKOWRRr/8FrWezzpUpyugKuDm6IPpQmdwFCgON1Ya
         pj/mPInP676/1moSeVxbumgW6bWfcK3AZry+SdUWUCbuFFHFw7SLVnAo8AgIUmRN6ReC
         8PiP+NkzZ7L557ofUokV/CDYae3B4yf+FQ1UpLKIEIQnfEU2WPQrzMKbDUKa15pfni8H
         l8Pdn3SdziLoTCztCh+HZOnyisr1dn+fPOpQjGT+IulsTh3KrfTgw+GXsGXhPIdhoqjf
         Zq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974217; x=1778579017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6KS2SQLRduVfwpc3NGf5lfKiSMPz8UqWMH8LhNcjEEs=;
        b=C1C8anzEnAG4Ie+RDED3yfOa53LjZ1Iyyogu7NYHmFJFh8t+0Dgqmd4bRucwTfyCj/
         g1YTozfZHrZUJvYQJYR46uv8rl/tkoSOAF7FVSx5t7V5OP1xQ1NDYgtJyOitcLwuarBw
         Ob+Mbh03WbijOYL2D5QWlj3wosJMIsgAf6kRnFrPYPHZkZUjvyQgMrsLYenx3gINnynS
         8dQGRgFExI0tjlxW+wy3fzoaRLuGP3J1BKg1P3optukwkdm5Ci790cdlEmSK7LgwDTYM
         I27f7S3IG8dfQeJax0uxPtxgqrw4y9I4Jkd7Qz2E7l7H1nYpMoEznrkhbYvQ/Tovumyp
         h7CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+l1vtXK/M0iGqx6wsZr5rMu9hTvCTsJkBZelwVfzpQmBbjf2N/WqI1Iy4YyMaXTt667XoUAhtlpycOiEvL921B@lists.infradead.org
X-Gm-Message-State: AOJu0YwZx5PITRLl0/+6H3HcgVNobkANJvnPdVgjnN0uHWlmfxakxJMG
	vYYGh8zZGzuDi/dDHdzJWh3Rl1BrQ9y0yfrenrLwAex+rTEKWEUciEV9iPeM5nCiKAKLZK1HGfx
	znDRUfTke0g/J4C+tVBFF8a/ouusycrVDjj8fFlUOeyMOEznV/patpzjd78lQ8PLooVFtOpCG25
	Wi1A==
X-Gm-Gg: AeBDiesss5GwNUm61kxoYAYONRMkABIk0+CtZt7bxrm898rhrvxomvmN5O3TAMYzSgA
	D+4JYQghnBZAOvE8YG4j28IZzykO7r0UYhZBQzFRcW5Fav/J50HQ7JUj1auImIB7iW6BJl9VQv9
	0pxpIKgT62Ry3+xRSI47yQBue25HZ/Ms5mjdPmUNKKOKg2ZLZf5PQZkYb3VPb0fVDUVr1aWJMCC
	614gxj0W0ysKpqWYg14qk0Fuby8UNPOfekvlgzyY/38ghIYhEJxJjuxJsi9UDObsbqwuZRsI48R
	/BtjOfm4xGJEsD/vl5rbAtbFqsdsWwhyAAvmYaMIILoywXI1OsgEVE0zcbijiZxKOuqW0fBSx2n
	Q/++Ms4o8Y6G8+Rv8am0nufnuT+1i1sEDiE3mZkOgzlhAXks=
X-Received: by 2002:a05:622a:4892:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51306a06ea3mr31211731cf.24.1777974217593;
        Tue, 05 May 2026 02:43:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4892:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51306a06ea3mr31211441cf.24.1777974217169;
        Tue, 05 May 2026 02:43:37 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603858135e9.1.2026.05.05.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:43:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 11:43:18 +0200
Message-ID: <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V+HB4nqsZW8oIMtgAz9ozlJPzMJo4aEb1PAAhjZ/erA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+bu6tKfCRTw00N7V6Ex6xmKEBORVM/gT90aMY
 QaFkiqT5LWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafm7ugAKCRDBN2bmhouD
 1xVXD/4qT2/aF1eWFpGlNTG1434igw4HqiB6LG9AXy9rrBTK6sy96WeHheBxdWG/z6V3qxXt77Y
 zyjqfRLpyiDO1CTaCaZk7XglihreTE8wc9mk+2ZCtEy6fVZ4ReNhkrDZPRP73gPAaP4IbzNlloc
 ph2bElfkfgUAX32ePl6LgSPsXXHqvxpagB8Sz6MK4KROH3N+/WhoWGtuVXLR8OSieKhsG6eldRL
 rD1umZ0lLdEeSAujIXmKzKbZV5cQB6cFLq2mQ7qNiQ3HAKnzMo9BmNajU7ILGapKpxlEvbsIyBw
 iedzMp3sWyDa5MmZKY7Gy22rOQny3ZIm7fFXuxrOQDG0/NI75WxQC1BNTS2+iFOfKv1a1j0kdib
 2ncKuKDa5vmYUQPAtFOuiik1O/5eHDf0BQIwB1TEGR8VBaen+8GViofu5Oy/Tbhi/I87OdLvGZ9
 fuMV+UAtSUAUfJVxke76/2MCqhUZO/uD8sUK6Lr2s+Cb5WAS12NqGJ6uh0YD0ijBSJreUZ5j41W
 F7DS9DTDPbfsBE51PqSeWa4xBPma8V1/g1zC3jS3/1sy+OJ4R2KUJ67LKEgHYHKkeyJ4JyzuNh5
 WXpwdY0ozPx9GingdlHErbqeAOLc/WnEmoISWlea7G7n8r/OGTok/X2nFFr9vo4RGUfBK/y6cXU yKxNTyNfjiPfnPw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kWfNkTiw7j5S-9KrBmji664K5qtwqNDx
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f9bbca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BzP98TPolLMEYMmIy-QA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MCBTYWx0ZWRfX8P+aEuIeHVwk
 5olAQuFj6Q2LdLYLAaHDG8PhPJYz/7PPTniQFY+HRq/bek+AmEblol42XKq3w1c/EhyF3yM3MuO
 MueZDaQrtkyiaEoxZJ3jJJ1AM5C8sXkFwwhm8oKIKBVIlXsuFEW642q2xtPCYrQEIG8Ja1YmFkI
 i7rSVBfcv4idtFm5ImsxBhlx04ZFOWt76dcWWKUh+9W50rv9jlh0rfiBznLwrX9dualKjoVwgKa
 Nv7rKgFPPVXjKQhOqz8LPD8hTPrNbw51yl4CuHt3gLY/ew9p0PUCfrBozRpqnwLGecMX4zyInXe
 PU90OG2MbRsuM2d3Bh31H1SDQ74OoW4FmgmYByRD66ve+ZkpxvtvtKjP5HB7DRGsBMy9zyl/cO1
 3Z1Iak9Ev7sCvn8gnqVi64+4Cv4Y/WQHkDoGGwzptZ4P/7axd3Q5EHNtquD2RhbKcjotosZxWXF
 12DjMZt/OK9dxQJcLcQ==
X-Proofpoint-ORIG-GUID: kWfNkTiw7j5S-9KrBmji664K5qtwqNDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_024339_321498_FDCF99FF 
X-CRM114-Status: GOOD (  16.75  )
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

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the pin controller drivers already have this correctly placed,
so adjust the other drivers.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2f14c7f9c95a..7e0fcd45fd26 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -5303,6 +5303,7 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3588_pin_ctrl },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
 
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
@@ -5329,4 +5330,3 @@ module_exit(rockchip_pinctrl_drv_unregister);
 MODULE_DESCRIPTION("ROCKCHIP Pin Controller Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:pinctrl-rockchip");
-MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
2.51.0


