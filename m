Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7D3CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tI4EhtrIIJ4yBILYloWUudhMj8Fsdk5INKde7w/EIdI=; b=ZJlir/SVQFEd6Q92iKpEdUxHDU
	trzITW2YX7wtgmTVm1PNvYc3/B1f2tjvA4OOGFVM4MlvGGPFzutJHeecieTJow2E/jVKHWHxbwLDK
	49mMz5vz7DAl7YFCQ5YALQCGs0g4ah2Pi05wCeXqsqM65NVsYsJuJ2maKrmoyXeXJuDzvwAM2pCri
	x0Ii+mpQ83jZqbXt+H1AxYYx6Jx1C0z6xo7bYdL8yaD7cCP0XorE1rAkQDyjeVvdKQk+/GsujAvMh
	ojHUKUAJ6fOIap3y+FJmn+ynSyJhS9TO+IrhH2KUI/FyEGe59r+AfPlSKdFQLO9VaOpo7vRaK0Vrq
	hWg6FIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzv-0000000Ft01-36yv;
	Tue, 05 May 2026 10:27:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzt-0000000Fsyv-2puX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:27:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457DJe9366722
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 10:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tI4EhtrIIJ4yBILYloWUudhMj8Fsdk5INKd
	e7w/EIdI=; b=G8KcKBgqaAvseHKyMejCBS2uyEALGXTriGT5iocMVfveVm3GlRF
	O5a/JbyUQG0suw34H3mj9iO6cwOz0WYw0jFdTnwpJDC+zONCvj5QEKyryRgAAiTi
	r5BGzwMu/XY4DdLnMeKkOOx3cSqmcalVBKRfbwZGxDulCRAjfpxO+NOb8rjhujjK
	zlkGMYS9XVdSfSdFcP4yNMO9d8C2qi9OmLk2IqtKQat6WAEU3yOF+Cd/veEtZRZy
	k2vPO+lhfzAkqo/oPHPNSeOxGIClkaFyWS+P339CixefPBrHkz9PEtZ5pjxSasvj
	wUp8+ljbuh5gDUNeqpZxjFl+zMAJjOnnG/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6uy98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:27:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so139922971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976843; x=1778581643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tI4EhtrIIJ4yBILYloWUudhMj8Fsdk5INKde7w/EIdI=;
        b=ZMxh9qZsDJJ34SXR51fA0TwPO/LzppGC5LAdATjd1CdM8U9Z32wkIynpCJ/a+Jyo/C
         /n61kJ3VpLtZNT5/RgEN5Pwu1mVVkemIcYPIqg5sXvWiNfJvy3Ytg/1ZBpYNXaGSu1yK
         MeUMBps6zCsYgTQUmtmdeTSWInvgRwPw2LJJpU8hTkFzKqtKnWmx2b8ltuQlgtG0iyRU
         1mjqd207wJbf1E9ecso3riXCIZUIzMIfzx1AEAPensbx8r2uC3a0EVnFh4j1NaRe8TlQ
         //IgDL0xVib7RAUrTh2Dpfl2h9ZT0hu9Ppdp1EjpWNydq/FFlbEPHNGgbH4o0gcmR2Ym
         Zobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976843; x=1778581643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI4EhtrIIJ4yBILYloWUudhMj8Fsdk5INKde7w/EIdI=;
        b=HkZS0X5dOLl1yPXsacsCuR1RX9HzKFZvwkCilJa34vuPYF/oaP2mE+Wpk5aCPdg9f9
         Jmaox8840fVl7qgr0VqQLNO0fL/jjf713W4HtzVN+3+R67o2Arg8ArYkLYLa5nYIqtgi
         GmBk1StZzCwxUxkqWqZPWT6sL6tuzIpDmvlHqBrbKzY15lO0s0xen+nnU3MNHz+cvb38
         8l+HP9u2jUN+d4lF8frj5G2HEiexdpleOmEbYvWHOjyedBs7dH/wJsW18mqb5kesZ4nu
         zP1puSBrrjqlCNL8PyZhhb1lZk2xHMbzO22/BPzsPXWrf15DJUFsKX/GRNuwLghppErl
         HMAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oCBzY2B40Bt83FkJ9OE4hKyMjcsffkIjNE1wOyB33xkix+dciaPh8MFCYqw9nKBAeVj4ss1BrPNaCuglak0xr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2KguL5ympPj0fDueaHQqtK4vYw1gyRLgxk04Zb7fqPtL2ReAV
	BWWJ5CPx0i8HTzSM2Iu7YY0A/G8psae3ZZGgpfHFsCGPPFohEe6NPRGFWu7MQvBM0NHV5LOPk5C
	Jl8qva0fnW2gzO/AY1zQUgAvFHDxgU9pwR98uMNfv4EN8wQe2ki/6SoPK2UIKE+l0G3MfBs9HIA
	9vKQ==
X-Gm-Gg: AeBDiesgMRAPz9cLt3URibbi+a/sfop84pFVgsv8E1Yj2yTaRvukoqis5TnaKUD5ibe
	THPUfGUAvuIDlD/gQw5VC9azND8+rTSIbB1omzendSDlR8VhJzqXjY6hGGDm3l3mRqKGRQ+p1wW
	OEAHVtvrpEA9gIKhAH6r6tQQdLv/vT7RmOVxqk/7w/NJCk+YqZz++qwvnpF64S10FtzrUP8T/6f
	7QeR0/pnPB6yiCcfKaOWTr2fInzCFifUAMP+1MJ/5vi88Ti/twe8G3Im8yBkl3nziIaOouk7wdb
	SDla4n/6ZjrmbI9xF+5hXisYxOFYsdQnfwqmpqrrawZRuj/g+5C3qpySjw8TDViNPWlzJkmR6W1
	o+/WMGOp+tTtAbqGu6J9WIpLKpIBFtljVFI7D54OMRBq5vlGIhTQtAqjFbg==
X-Received: by 2002:ac8:7f10:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-51306af4f95mr34935491cf.48.1777976843555;
        Tue, 05 May 2026 03:27:23 -0700 (PDT)
X-Received: by 2002:ac8:7f10:0:b0:509:26f4:64f5 with SMTP id d75a77b69052e-51306af4f95mr34935221cf.48.1777976843092;
        Tue, 05 May 2026 03:27:23 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149eafafsm25183865e9.2.2026.05.05.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:27:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soc: aspeed: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:26:36 +0200
Message-ID: <20260505102635.160772-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=she5NLA4wtMK/gnAkAPi/il4IWhAxmj63xr3hxAWtc8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cXb/8VJI/Au5pK578tTNs6qT4zWQfmKp2fZQ
 ZdLifnJ6BOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnF2wAKCRDBN2bmhouD
 16zID/4okvRPbaU4lDgl45+1AVBLI/o8TEe60g2SUHubWWdFQMIeas1fcmh5BSXaLWmWLsW2mqx
 9vtrSXh7VCj/wFZ3l0MGw1io36hubwtdrvPlH0MnlHbc8f/enOPWQ6EYo+jD2ZVWGhkaiauojfh
 nwDT5oV0bkfelVUa/FCvBgdgqLujwfQgPBbPgMY4qhvD/YSzEw8gYKvJ4vSGXDzTuzwldRECMS8
 UUgQm9GqRi2lDluWMlQs2H+604K+xQ9Cd69jSfNMr7WI6T8Deotvu2+lUeZeuqD3rYJDMJev+Qc
 GwxMKucH+DQQg26W57bhTzCJMtwwNBdK3iLaNEwXuIqGV6vsjZwofFkXsKqk5pabOkNZOUrGD/F
 S5dqXimFiCHrCO1ksst2bdrisMaY+dmhHE2Sq9zC1u9X66womTHySNe4j439T1KMgJYZtntePxW
 AdLjDgDbobTpa6BDDOxsytoWquwtUrOYE70EHA7C6NUK4UH1FR4tg5JA1X/lBvFAdCfCkc1KLqK
 ROR47SJyAbdTkIDcDXjT/BkDVij90tZTAGjwCV6zMLDnpcU9rmXIQwlLb50maclkIYCOsAQpEgX
 wpE0cCHFsknNW35VJQ42btEtsMbtTlvK1ADwKvonbYToL++jzXKT/fPz+pCFnXpawx94oVqcc0v d9Z7A+k+l+SeTYA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wV4VHjgodpVfdIj7cR0MIIp5_yANwUop
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f9c60c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=awhO3CD32pMT8nx_-7YA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wV4VHjgodpVfdIj7cR0MIIp5_yANwUop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX91lGvDziZm6q
 dXWUhNp0MnZPOq0FqNufy/DcgP1NTFRTYTJ9WFivP8lvbnLT0uW4wry+Nsqg5JA/FDK3dKY+lYh
 WqJrJqCApWxMU6watMblG9OLIfrm+nj7vrl3MPHWFsgEVOEE3UXijOrYsBUYYDJSCyTnSI8YcbF
 cAMtlx4i3C64lUJWQU9RfHdA8VGIw9bDIp3gOYWg9nYBzQzBwXK8/T0VTablAqdraZgU/LSMcMB
 MOVFtuK5PhsrZKcwUUPc+mGvXFPB8aCr7hyXUsS3tV2Tqh8qazI4lAdy2VFqXVLENfDb+ArG+dk
 XfnlBgo9szt9lG/MKpLP9mWjMk+UqBTUGyqn9vANONZaiPzuiOAahkttDIG8RBk/Knc1iagjDrs
 eixTBNY4DrN2or1G7XUL1fO+m0lF5WXQuO4aZjCyRpH9RAaolo1wHCOLZ/rq5QsV+esMMZz/BA/
 K9v46nYSVpZEikT6evg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_032725_840778_92FD91C8 
X-CRM114-Status: GOOD (  16.32  )
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

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
index b7dbb12bd095..4d8574cac703 100644
--- a/drivers/soc/aspeed/aspeed-lpc-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
@@ -338,6 +338,7 @@ static const struct of_device_id aspeed_lpc_ctrl_match[] = {
 	{ .compatible = "aspeed,ast2600-lpc-ctrl" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, aspeed_lpc_ctrl_match);
 
 static struct platform_driver aspeed_lpc_ctrl_driver = {
 	.driver = {
@@ -350,7 +351,6 @@ static struct platform_driver aspeed_lpc_ctrl_driver = {
 
 module_platform_driver(aspeed_lpc_ctrl_driver);
 
-MODULE_DEVICE_TABLE(of, aspeed_lpc_ctrl_match);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
 MODULE_DESCRIPTION("Control for ASPEED LPC HOST to BMC mappings");
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index b03310c0830d..28e491fffc7d 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -366,6 +366,7 @@ static const struct of_device_id aspeed_lpc_snoop_match[] = {
 	  .data = &ast2500_model_data },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, aspeed_lpc_snoop_match);
 
 static struct platform_driver aspeed_lpc_snoop_driver = {
 	.driver = {
@@ -378,7 +379,6 @@ static struct platform_driver aspeed_lpc_snoop_driver = {
 
 module_platform_driver(aspeed_lpc_snoop_driver);
 
-MODULE_DEVICE_TABLE(of, aspeed_lpc_snoop_match);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Robert Lippert <rlippert@google.com>");
 MODULE_DESCRIPTION("Linux driver to control Aspeed LPC snoop functionality");
diff --git a/drivers/soc/aspeed/aspeed-p2a-ctrl.c b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
index d88abc5f195b..b6b7b80f842a 100644
--- a/drivers/soc/aspeed/aspeed-p2a-ctrl.c
+++ b/drivers/soc/aspeed/aspeed-p2a-ctrl.c
@@ -416,6 +416,7 @@ static const struct of_device_id aspeed_p2a_ctrl_match[] = {
 	  .data = &ast2500_model_data },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, aspeed_p2a_ctrl_match);
 
 static struct platform_driver aspeed_p2a_ctrl_driver = {
 	.driver = {
@@ -428,7 +429,6 @@ static struct platform_driver aspeed_p2a_ctrl_driver = {
 
 module_platform_driver(aspeed_p2a_ctrl_driver);
 
-MODULE_DEVICE_TABLE(of, aspeed_p2a_ctrl_match);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Patrick Venture <venture@google.com>");
 MODULE_DESCRIPTION("Control for aspeed 2400/2500 P2A VGA HOST to BMC mappings");
-- 
2.51.0


