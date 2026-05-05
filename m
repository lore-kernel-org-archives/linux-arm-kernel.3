Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A90FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=; b=VV7CofgOzM/lZObTf0o/W2akbM
	vL1wsp2Ele85y0mMOt9Elkp6yvUwyHJHXlNU+Cv4PMq4xNBC2SUm9fJ8ScecpQBDTHUu6SVrZGQl6
	dfHBQSwzMZOBPgDdvRpRszijzU/7Y+6vNdLYQEtx0FpYWyHZAsc4vjJVKBCZXgBTMJ6DRRp+CLb6D
	Udq9sD0GvOx5Rlq1e3uQ/bxhPPz1gLheMTJkxs1/rWA41i2W/xgP+iFa4ZvI4QzpJVZZ+uT4aZM+W
	31CuXZHvHxCD6ddiv6UDvLSB/oMlDo7g/2OsBzDpFtC7/7OjVud2gi9XYlmyE4luh8sbzoSnDHnUW
	bAkuRofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD1Y-0000000FtTr-1SsH;
	Tue, 05 May 2026 10:29:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD1V-0000000FtTG-3YSI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:29:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VSd72859195
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 10:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HNlj60pJs02U5K85HJFOtq
	Zd7kl+At2FS1ldDOM8a5U=; b=E+WBRSuHgX8tuxSzKI1QFKFVkIjX265Hi2b9Rk
	qt2ZUpzOxrqWTxNzjWrWv5od9PCeXOFmgSOcyevZ+NDTeysIICCkOxDrmaxwRpkT
	q0KIdSvZ2c68X1ap6eCnC+8YVfvjp0ay4Nc9r85Hvwp5rY7EoE1XeCK4JWuUWRxp
	773SCZVke0K280g13Ok02Qu2zN625zq4NYUqfg8SqmGtq5gxLMpwTeGqN6lzu4ca
	TZhdhJkB4keP1btznh9QYLxyLVhxRN6RvSKn0j7HG0WEyL2zhA9eSbuIB9BijW//
	mJIxj9+kqo7T0mEXVWW52rFcU4AdY/IJWk8laI4k0++DF56g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ag869-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:29:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fae95c82cso20477951cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976944; x=1778581744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=iXxfyYzGQKywdxOyvB9cgYS/r+F8OUGay7T7xQaejBZPvcojAcWvRHuA6ztG6JS7qE
         6f4QpBHHNTm5+QBhrJF780aLOt6No+ijNQaBlgQuI0yHgogV6t1CIYq/iUHSo9Fca9eT
         Xm6DwFQvMNq1hdcPcZOGN/gOSebefhQcD3p6ywdAFsQh3FWDk8qJ4XyjSAKV/igq4Bjt
         LiDSWCEqKvGvntvb1svogDzc7rO+RzrrOg/J3ikGKdnoxL/Rvxc3JXd1HzWzvmDw433y
         TZpTkvu1UU7F4mXuDg6SZwPsFX1XyvfGfAk2xhsrmKHDeVnSzhTjtW1yEU/fC8uLI/kt
         k+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976944; x=1778581744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNlj60pJs02U5K85HJFOtqZd7kl+At2FS1ldDOM8a5U=;
        b=me8BHfk6+K8iwc/YByN7VwMhqTfEL1GC0rN2bp0YtDqYFZcx98Go1sbfyIiuXTWXsA
         ALg/gERB7BnjDoHj8Yvqn4SWWZLfHmbpOqbgmC0NfoJU7XYHUMpq1e/hODX74a3IUrxN
         9TNONbINgancyp3FmqV3M8+Ri7QuALDmKpzEyySUs2iVbqU39s8uQsMncMMLco4dUbet
         XiJg/GmxQyHeDqfuTzA3OrGaEUkAIyGKDzbABAOct7OW4Ije1jXKFG2VEmiwvpfAqnhf
         v9IsHAlGs79R1as+VpnkcDSuhsfNVJRrrpq0nlYVc504Ya9Mc2ca5yPly2bBkLjZoQv5
         BvfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Uzd9e+ZknJG5wcvW6Z4NodE5A5gW+qFexNNFuJbL8mvl/IFysUyONw8HGei70oUWFN5xR08wR7xhpjAlPtxOT@lists.infradead.org
X-Gm-Message-State: AOJu0YxrZgdLwiYLHIdAafTckNqtas6/tpqSldGhB7o2Ol17PHpgeSdI
	dBjory9R6R5OgKAnWNBtwvKIVGbBkmDV+NodU3HNsM19L6ypy57q2VRoogFqBqUc0HinkiTGGFM
	MWlIFlXGiVOo3e5Qp6ACx7QxCxUu/qdh12BvCYeAYNtQw09Dh99FiAyh8PI+T6SepX4Ks6yakU2
	Ll1g==
X-Gm-Gg: AeBDieuWNhkZNcL8QvyWaxKSU+kIYWOTPuVirF5g0MGYm4bAVi1vui3Q5MgilgBlY2o
	HpE4fzfc46IGale5uT9TMIcVew2TviCaNNBGxXIPwDUnquZ+c7hdPHF4NKZ8IKajEUd6qHg78YP
	q0PbBs2nJ6LUwa7p85p91PpHteM0mXbOZLilFFBNHLF5Jncw19fxB7ci6GSaNTroaY2awByIcrI
	KfnYCJOuGzrKyfn02kqbR1LIfYbkcAgq2/1hCfa5LF0RG2nMuWedNMdpwt3OIQuO0k3h1h6fxg3
	I8bkXGfDzwfqZjL1sU2ayVxXlYzr5JfFhgjkg0Zy612aOPkGSQXVTbvuNA5qXBz6v9wWYsI8GFE
	vABfb4Rg34TO70Yg6ob62HDzzwB69DsgxBvoa8te0z59tkic=
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35473261cf.32.1777976932967;
        Tue, 05 May 2026 03:28:52 -0700 (PDT)
X-Received: by 2002:a05:622a:a12:b0:50e:5b04:810b with SMTP id d75a77b69052e-51306a53f21mr35472161cf.32.1777976930638;
        Tue, 05 May 2026 03:28:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba865fsm307039245e9.10.2026.05.05.03.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:45 +0200
Message-ID: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kILhQAgY3kLM16GxFMfnMK5G+NAgnlyKR3dgRK8YfZk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cZe19spmhey6vI4b/7yFmBq15pM1VGw4Lnc/
 0yugqzzGR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGXgAKCRDBN2bmhouD
 1+IREACFnSRy7ju4VscC9G9J/FnjAyyotS+ISKZWGydzAX1MOB9PooZ37Sf5UDalokelUZojWyx
 +WlYegVlUgcHuj/owKI0xzKKlWPvAiZvZBJF8xpz7fB//0+gOLZTmASdI7KAc5m5baDtLHlCRU3
 yff/QwPa9U7qxINvtbwkiehLmw5d3kX2DBty0i0w1HsYcwsKuy3dEMamsQOyuugpFVUGg0vVnCv
 ElCuozk6ISPxKfqvd45OW/Tkc97bsYI5CcMMwcjJLxX4iQcJ6fKfVWC6rPEgiNlWYwflU8chPGz
 ZmbMxsaWTHZFcs1jiuui6sdmWSzjErhXteLFfaMg2NasVX4D6tnOpzF/Kl365cs1RBwryLXuvob
 WH40NocFZJsHEUelaeXcj6Ac10I2mP3CL8tet14HSRM/8SZEIhwsgvdTA2bTMEmHngqHIGhwvJZ
 nxnMOGPyFkORQDTKppoyrEwt4QCdexA3JMjD5q2kQSQocvIZtO5w9c2tmp0E7VOo8UneY5k16pM
 Iiwuc8ycvpIFz1YByD45DRaYhWEnUGX8Hy+I17MvaP5mTrutYXVLlUGo4r0LyahbdA1HnfIvrfU
 B0/GdY76K0MGfugaaFX6+dWIvth2w1djgET7sYBihXCBz2OC3o7iZ7PkwdhD7iIqMxppz9GjGf/ YrfAMNmEyXD8bVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX9BUsJwVYPyuH
 QHqr4CzSYA1hc8VPNPNTQSwS9Pdx29ymjd5McFUGOPTjnhnu1kp4l8J2VNIfN78Ns6LV//6YpDm
 P6Wr4WnX0eJ35ok8bgOT854GlC2bb2Nj8mgfzm4KDWQtSALsfpz+q97uwzgCUbIzZJ3WkSBnB98
 juE/0Y4OrrjAIvjVuwaJ9fUlUCTNEN09+9CayD4iFziTqg69qVDq83iaM/5KLb+QCVpuaMsXwwv
 mn6THw6yBy0oipZORF+OxYtvif1Nof1M3Bpobi24C1uo+vP59PN+4oosRp5JN/GdN/J/u/68wd8
 B2zD/BZtR8a5L5FjFpjq1TTvJpS+oLu2TWceoXT5a85lTRqDQXH+Y9VnZc/yhDh7aInQ/vTxhyp
 ijk8yASYzPxfp96BnaXP0mOY5GqTKZw+o6ZKyG/NyqSJf77KGJbWQWHYLuZgK+dvddOtdfCkEV/
 r/Evx8n+lxsF4MdBmPg==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69f9c670 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VTue-mJiAAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=S9YjYK_EKPFYWS37g-LV:22
X-Proofpoint-GUID: tj1dfH6zJOrJvBiwYoHibItVwBdJjtrZ
X-Proofpoint-ORIG-GUID: tj1dfH6zJOrJvBiwYoHibItVwBdJjtrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_032906_006418_2E38122D 
X-CRM114-Status: GOOD (  17.77  )
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
 drivers/leds/blink/leds-bcm63138.c | 2 +-
 drivers/leds/leds-cros_ec.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index ef2e511438cc..45c0662df933 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -296,6 +296,7 @@ static const struct of_device_id bcm63138_leds_of_match_table[] = {
 	{ .compatible = "brcm,bcm63138-leds", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
 
 static struct platform_driver bcm63138_leds_driver = {
 	.probe = bcm63138_leds_probe,
@@ -310,4 +311,3 @@ module_platform_driver(bcm63138_leds_driver);
 MODULE_AUTHOR("Rafał Miłecki");
 MODULE_DESCRIPTION("Broadcom BCM63138 SoC LED driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, bcm63138_leds_of_match_table);
diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index bea3cc3fbfd2..6592ceee866a 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -249,6 +249,7 @@ static const struct platform_device_id cros_ec_led_id[] = {
 	{ "cros-ec-led", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 
 static struct platform_driver cros_ec_led_driver = {
 	.driver.name	= "cros-ec-led",
@@ -257,7 +258,6 @@ static struct platform_driver cros_ec_led_driver = {
 };
 module_platform_driver(cros_ec_led_driver);
 
-MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 MODULE_DESCRIPTION("ChromeOS EC LED Driver");
 MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net");
 MODULE_LICENSE("GPL");
-- 
2.51.0


