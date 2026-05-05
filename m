Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D1BCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SGD/HFe4mTKpac5JeH1c3n7+8zeZTKcLWhIAx/Ud8FE=; b=iVdPEo+AG9S2r8wK586hFydEsP
	JOP08NzpHeGwaH1y+sHFE4xLrc1SH93uAzhE6NQtTiJABL0rBWX91p4kxAVfE5K8rdsKAvYsuRpQR
	sV0ykv+Vj3g/I7flbcirBHS3NHtkbIe/uys1IieyI2SUYf2MrUudJq0qbxj/SgKeYarBl1QTt3LC8
	4+SlZ6UdnehSSSrzMayq0IjmIIDfCA5vbj8mq71YhM40sZN5SRDaiNGHI078ojxulmm0ylT67Aqz4
	YLAGXNGJ532GzHwephElHspWEH0IDWLDgCbw/S8MK/DJoR7SRx7NnCAfBTHk7xHUS3fJ3cV9UHYPo
	rkVB6i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJY-0000000Fh6Z-0HJc;
	Tue, 05 May 2026 09:43:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJU-0000000Fh5K-1q4g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:43:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457e4Qk1186849
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 09:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SGD/HFe4mTKpac5JeH1c3n
	7+8zeZTKcLWhIAx/Ud8FE=; b=DFS576FXC3eYrl3DkypTZ87BSmW1W8nkSxGZiJ
	xoRfIKP8xQdULtctbkE/zWeSzQP5JnmrHagBE0/FKUt56cnN6xlURe3Um7FAARxJ
	1okDm7zZYa0dIlD0B/DPovsvEldeMMt/EMsyvSdUc1UQQ91yzhhFShFDpMrOZ6Ay
	oHEZ5dM++KftWBoSA95em8DsbXv7N/pIB2/rbJiSSif0sUNsFn0WpxP7jHVSZ1yK
	pzUerXWDav88/qtW9IBzcIPyDuR40vNoWRMCPutg+FLXZlUN05AVyoggSLdVrS1u
	FFTD9fLZgt5T8Y5SVz5d6jfuejjxTeywKD8RNvAEiTqca+ow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbpa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:43:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5102a9671c8so118196031cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777974215; x=1778579015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGD/HFe4mTKpac5JeH1c3n7+8zeZTKcLWhIAx/Ud8FE=;
        b=VFqkavYBRFEApaJd1hlzFPpZQGislDhkdxODGgzhn5C9LafaP/fAHAIxZvpUwi1uL/
         orpOqqX/bEtuO6gXSlTRI2o+VOyyq1AJbUp9whNHaP0Xss5IbnOqrLtt5Tg73VgYMhSa
         9dnpSVKNxoBFG9a/QJMJme6x9M5ZuqazlYmTQ3QMBT7Kj4swGo/zPlpJBrYNCWHSrh/4
         bByKgarXQ8SQ5RRPZwO6TC9zDaBJdx0Q7QGjnczDjWCKwQOVnITkp7/hS/GcTLKJK6DK
         x+Rjmcj7rgOioThABlIFQgr1N+N4Kd/oIAsAmNAuAGIBXiK0co4kFEfM7GRj7cgNHxPC
         wbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974215; x=1778579015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGD/HFe4mTKpac5JeH1c3n7+8zeZTKcLWhIAx/Ud8FE=;
        b=m9D2EFFEC3jAbuV4dUXuEqaiKELGoYgR7o7KRAHOf8QlrMaJMn0ixtG6M//8IFKnf/
         JkAkIeVpzRwC0qVtAIDYXdcDwsUqOByG+vpfEY7TagYTH58IPynMBx9eeN8Wo8WZ9G+D
         KTSWOVURfnmuEL6sfAsww/bSw75NEO3EXWlHdI+uEgzx/agw0uGTni3WYlyk+ULWodgB
         tokqnLKl/O8s7eQnt1I+jmHPPJ9GmFuehGM38lGqZj6Zfe+HtAhY0WX5yIvpJD2ErbLV
         OqFsrrTJfw6p1Ldg+hUWrlOimBF8JUTSK833br0qUqoOf31v0RLZT1elJoIl+fqlJ7Jm
         P6jg==
X-Forwarded-Encrypted: i=1; AFNElJ9BBo1Fvdx9qNSKNyGam/61je3N6w3BXZ+A1cBx6QV8B/qiliaBMYg5NlJ62uW5x34jm8edymjBBABviz6qWnsj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn3fcIcsAKakeGi9+b1G5COcntQbQDg22J/zSLHGYThLu58SEd
	g/xyxv5Ibs4nxMHRjh6K8jrP3AhdlWkdqUN2Y0F/pirSLdIXNk0ydaPnRU1LeLWy/z/JS8Ot27p
	EvMmF/L6leEudg/gbkuGXO6g9lewDh2zcWlu2jxK8d8QW0yYDnR1gyyQqNH6r6Rj8wJwv4UNzBV
	ohyw==
X-Gm-Gg: AeBDieuh4O0vc1Sf3D+cjHBzJhn1z7P8xzKD38LAmHeZQh1wGIj2OnXTufYBc8zUTzf
	RwZVrsiz2JXfyJi5pNPtCtBrlqB7DVTSls6fxk8mwZF/wAQ2vwsKPS5j9Z1aPhaYBykC/dFmwJ/
	UOakgNxRxV4COM9Cu7tv09NcuIGQiWvwOhYu2CVp9NFInmGODmK4DmQOoxe6vhyraol3ZMtHAOD
	Y77iiaHJb+6a5VSe1o3/6MGssVw/YHvAVeQsNbyPkI7D4WFgjE9zcs2S72N2pG2Mmjub3hdCJE7
	NYYGOPjZZjP7KDxOylxJdWQ2pji+Hcs15R2DfLb8tfVSMgHkJbJVxbJbr2EjRT6ZsQNL2sV++Hl
	Dc5/dedAIbTVXGlInAF8mnI+NvEJL8jhH1UezUC/86n8nWaM=
X-Received: by 2002:ac8:7d01:0:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5104bf6d329mr191358271cf.50.1777974214776;
        Tue, 05 May 2026 02:43:34 -0700 (PDT)
X-Received: by 2002:ac8:7d01:0:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5104bf6d329mr191358021cf.50.1777974214330;
        Tue, 05 May 2026 02:43:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603858135e9.1.2026.05.05.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:43:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 11:43:17 +0200
Message-ID: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kTPdwnhKuNvHpmfP9POcSBXwBjHDEIhQtQKaGHQH30k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+bu5fs2LviISk/bfFVysKywPwafP6tJYWzBkA
 vRImsN8bsSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafm7uQAKCRDBN2bmhouD
 15wAD/9JHy/+Uo95Bt46jXbX3rueLq4cQYwnEWLU/koZn4xZ/CU2IFQhvbZ9jpeiTpB4vCoHzyC
 PeTgGi7nL2mX6YXaHqPriK1iMl0kxvF4QxCToTXPKcgShyKm/rC/ySSMh5ANl5iL5+4g61o0ew/
 /ZVk4EIigHjBaPmcLtlR+mvnuH/fEvumaN9dWrQGtADGjtxQ8TfVj3oGS9pZ/T3HcXUSQmc9AmP
 84zMrR9ooc2LPLFG62kwfx27anwp863O5cXPXpMs88rnGTHwvvcxdayckZJCPBJnmrioCLBsSKC
 NrjEapO83TwLJF45MYHjLvJz2E4u9fjwAYhq9T2Aw7dlnNpk7GflhePGju273tCSzgQv739O8vd
 6WoJumVyOg1PwRe83m2+htLjo8L829UZYkv8IuSxMheVVKeh8V6Bf6cJBsHr9wZtDsGbt/myOZj
 ocGLW3gQZ3ZV0GOkU3UabNW0wYwWX0jYHaMZYYJl3Npik09MNkAPYUPdGnbUnm3oDd5J79cjdO2
 Tj/gNCPr9kW5nA4n0HjEl4ag68o5p6JFLPKRkuPSWO2kYCMgPXK8AvRWzPQCT9mMTFCFixPTMF/
 a2xYuPBi1E5z+7usWvMqhlexiGWdoBt65MZndTjG8uPzWAYbr2BKpa1TD0J6elRyPfYQXg44b5O pm0peE90HU+IomA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qe4h2A7CS-aSZbN8-2td4fl5qX59H3RK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5MCBTYWx0ZWRfX0wf8NXnNoRxp
 jydAhRKoGhVOX5iA1BdcwdJiXU4p2k41tqDnTI+tsNUwhGTWS/fx7xo6au7M7UMy8njIs6HGejt
 v/RpcwrVNWdZCawDwsYtlslhlfnV91Z5wrJr/DMlW8wBi+O8GU3cXyKQ07psAO02NXQwk7HPt7h
 SBNIpgUVlEkXNLyYYoklSxh+1ygBMi/rFsET4qP0khe7KgJxVvODwnCL9/N96d/69TsmXI9YHeF
 FGOZLQjV3NKs/ikkwyvkZnRUWGIll5DZLgfn1GLQv1/zQ0KrAkWRLizAJKm4bghbEwD1nPxWxzx
 GEIB6Yvl2M7qg/XUsOl0DxovhrNV8L/Z5llVve79jGwKun0EigP3QVOO3Bd8M4z7UjybkUg+b7g
 jcZaC5I+lzvlG0naK9x9YB/1tGBxfyntYRypKWDA/wBLn5pX15zk6edFhEVgYM9N1dMF3MKIszW
 V+iIsTNehLDfo2GhBcg==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9bbc7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qe4h2A7CS-aSZbN8-2td4fl5qX59H3RK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_024336_653487_42708740 
X-CRM114-Status: GOOD (  18.91  )
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

Apologies for sending it immediately after previous Qualcomm patch
without grouping as patchset. Initially I fixed only Qualcomm but then
figure out that poor patterns like to spread and I can also investigate
other files.
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index 12f7a253ea4d..57969cdbc635 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -466,6 +466,7 @@ static const struct of_device_id bcm4908_pinctrl_of_match_table[] = {
 	{ .compatible = "brcm,bcm4908-pinctrl", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
 
 static int bcm4908_pinctrl_probe(struct platform_device *pdev)
 {
@@ -561,4 +562,3 @@ module_platform_driver(bcm4908_pinctrl_driver);
 MODULE_AUTHOR("Rafał Miłecki");
 MODULE_DESCRIPTION("Broadcom BCM4908 pinmux driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 03bd01b4a945..e134c9c73450 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -204,6 +204,7 @@ static const struct of_device_id ns_pinctrl_of_match_table[] = {
 	{ .compatible = "brcm,bcm53012-pinmux", .data = (void *)FLAG_BCM53012, },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, ns_pinctrl_of_match_table);
 
 static int ns_pinctrl_probe(struct platform_device *pdev)
 {
@@ -295,4 +296,3 @@ static struct platform_driver ns_pinctrl_driver = {
 module_platform_driver(ns_pinctrl_driver);
 
 MODULE_AUTHOR("Rafał Miłecki");
-MODULE_DEVICE_TABLE(of, ns_pinctrl_of_match_table);
-- 
2.51.0


