Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3D6E74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=PZ/oemuLU+106NV4FartOyHxbz
	wGlYt4Ksy6xuEpHmAO1Nf/z4Z2u6TXsujM2xHUjzhfqVIBPUtv2Hw+qa87xrGsNQrsCE8k7n/MNUT
	jWakxLKPcH4aJyihv7likJucEarNl8IDdMsRAb9sVAMECBnKLf8x71QPRHqyKLNsHHWOCx1FIkU/t
	OsHzw8bYvisOfFk9z8wju+LEDoRkwferRIF+F63LOPP4cipGN4EiuGUTqZ166Ct7hX0OZg3mIoBGN
	rNwsU5a2BlXZSYxdXGEYejkEY/qrw3iv/NILTxQTZ5cfDZTczwen56KFxbPTSOyvcKX0SblD76ssJ
	tmbLh7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNGA-0000000GkqK-3oh2;
	Wed, 24 Dec 2025 11:42:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNG3-0000000Gknx-0ag9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:42:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9P7sE700440
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+XKdSXfu3p
	NvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=iHcgvZa7IeCwHNcgLOGpIEo43M8
	DlnyRERBvyv6e5iqbd4LVkpoqv6HzMC7vWVG3WbVSaDAu9MXWT1FFwikv14/BFQb
	YpVtsqQqpZiiqYdRKDF6EVi5CpedZ0SoGgtJCuZ/DVcg52UcnWIgX9k+AoW5ccYj
	gum7esJ7Kl5bxgl/biVE0tTYrLnnPp72REC4T9FnupAygldeP/ol7rwxCym/4t0a
	Ef4us7Os4NvDNosjARl3na7COgorKzNErejOQiADvJ5a0XtNaaom7M9HPEqHKjXv
	QT8fjVXFnf5TvL5zmA/XdCN8Y1pftMFhF1AQ69NxqYK4j5kVUmGpAkoA7oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jukn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so145086391cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576542; x=1767181342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=PLlNLwXlF5pwNFNrFS7DAFtNXRxt1DMhSlh4m0Y4Dk8k3+wzb1b5nReGM6mbiFkWzz
         lr2lWKZ83kfi+T/NbH9BA+v8J3d0mae9vCIWPcXbH5O4rdauCfl7SvKt3JoZBKs9hC73
         a9bfvcy4O91prWuzQqfdzIq0syyCesjXxGUtWAg5dY0YJ0dwRHxkVlQLEGyjPLzMb1yy
         +RAyfgDIZ2RDjkvedQnIa/MT5lF2Ixp84KtrG5d3XnxZU5n3jC1+oEifPL/Q7iGEPgmS
         vGP4/17PbhQqhprTr3lqnvnSD/kDqxJnqYXg+WyYqN212T/7oEqYfsY3xEtqDAzpcMnV
         iyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576542; x=1767181342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=u5eVRfxR/Vt1rIdslv3Mz9YjXzhjLa7KMCHGyRNBCjHbKRnA+cJ9815/aZyXobxXGp
         1X45AlqNaGwXbnjJqLSvcBKxSSmm/U1xNrz9sK3m7bXDmNJEyBthQuMXwCGZnndD0pqv
         RHlRD30A3uEg0106Ki5bjASj4Yb8ki9Slzvzqb8+tnMtEL5a9Oj3eyNNKGi5G5lOvV80
         Wy0SJZXm4BIgAPivtC1GD5kqWTFZFW1JqBc7Mv3pMj/4nuv/9ABFKh7LQEp3BbXQiITb
         UhSrIdKSyU2py03SqQQhfvPRkbAq9ndTxu3h+BsaYfLbD2K6VjdNUmRb9agolm1PDKAZ
         6TPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+itfeZKzBflrx10yiPlA+BXJPn9WEVuFw2Nr6aqIf5zVA3evPUByHl5fFtFP9rW40gyJ3f37ppIvnBd3CSFXj@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3TJOugR8k/XiKJKsg+k3utIjdXYYzSDC6+LqVp3gGeGfnRCRM
	F+bRxgiqFgsMeEgQU5qHKCUDiZuC2Su8/kWTVmPNs3V0RgT6OBk4TpZCNoiK9NR8jT51hB0SX7x
	53/oayM9VLwo/LuRX2xUIYAxKPRd0sFwgDo/V1JwXF9slULCO+nvXwbdYmefcZiky1kD4EmJABj
	koFQ==
X-Gm-Gg: AY/fxX65Vmz5URTahLYTVBthN44EjlA+b3VyesyzNaFDkzKlwTOEnDn6TTDbp2a01eZ
	GlzckaKgjUMygXPuTeW8Co6Me4fvGCilgG7SR5MKoyRwTjMysfnGdcFYitvmYxfDNX/zFBvbNmO
	zDVBaj2s2e8OO2NGO3h9QES9+xVW8YZVa8yf3aKQa4bRHVs4v4v11i8Yvk9OgVio6hFVUfimwbY
	RScFjtkvWc6tdSODVyUC1l2Z+GabUzz+ej8J4l8QPcBjORMMuIlxBfZ1iub/R9eP+acRX7PyaMl
	DGpJg4DJ+7Kn9syRRrPZetvlIwwBvOhRREzrdwnoK3qlZa89fGdCyMcG4VdqyfQVgLxaibWQwxw
	GqqGQeRkVQdKLrOR21SpBxjokggzcAPUG0F3N2wtGQFGw9lb4yPS7HpHYBYG5n3K4UAXCcA==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr291500381cf.79.1766576541703;
        Wed, 24 Dec 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw4zojM9zDR/ZTMRZKigmTqQPwRjtyXiwWPmyJTbj61ZBOWXiujUre4QxPIpO0iM4Dld3FqQ==
X-Received: by 2002:ac8:5d02:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4f4abdebbabmr291500091cf.79.1766576541354;
        Wed, 24 Dec 2025 03:42:21 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] clk: zynqmp: ipi-mailbox: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:42:13 +0100
Message-ID: <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9hdDvjId8Te0bYmkEOvuaWPWD7t2fGMNgkoufbUfEGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GUF8GSyL5k4F6Bj9PNY4tu09n9wJYX/aQaM
 p3d4vF4+JOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRlAAKCRDBN2bmhouD
 17TRD/9qUE5aGnyhDDV8uZvawbVBhgYcMC9iOW9O1hvJdzwo77W89yYiPfLm4+MHBwO1J45tQPq
 SDbZxSC7uPkuBWzfoohiQlj+zkHyVrb7j/Tg1k1YUbhKTUP3lDFy2vfDLEOuLEknNW6ohCyXD7d
 RwlUeiy3jLBc8MlgUv8ZpTVAoLYNY6rtjBtkK7qGzEpTU+a05jmVu8+gFqsBoXBoRxSIVVA/uWa
 FEMrIt0XU9C3pecLH0H+OIQ/mB88HU1WbXdzf4fqw7l2gSWLu/7nDDHaMz4E7wHXql63DEOyoxC
 ZPmW2uLZvS8Jy+8082eiJFb9K4rdbRgI8PHlyin117NfLZK6fFDUmSjbi03/nB16ZK2lElNFO1D
 1cEUqQmWNd7LzwDY3+5K5LVrHB4x50hz+YTzqoXiquP3s/of6o26ysBXxH6oWu0ka/u5irdjjwe
 CPsN5rMPhjkZpd3tCMEyA5WhIFZj5kQ1BHM/mr7rILbldSBZPEqNf0vHu6sxgIOf0yG7PZ8L1S0
 3JxINXZbiqOyjItOnzRmIhJUMSKJFaTgz/cKmedM70LW+nciCmLaGEmOtF37mqBLQo+Su5JCuLE
 EfuvhYm1g8Tv5VtodA//0qluXNc1aVFHaSymtBjSYQNeccHPymo345/zxYPgtcnbPCeYfPNWvoY VAvyghAIzZGygfg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX7NkFGpEpb6aY
 lGnbwbMs/ww4zv3EJlDyQz5r18vJsReXtPkrs+8nWFxUMThJd1cG6MmYb4lXGJ9bCGIvlLdYI7W
 UUeniR5JnAKjTM31hrmY2qxl7fw/w4ykLnCvm31a+bkxOxWAH2qjLalyg+DUdRr3UZqiZMRW7Tt
 dPwdutFpuzNIDU9oh/oEJxBCl7qEk0D0niFH4McTZEupZ785M4VeCvb54W5Gv8+uGmQPsYrOlJ5
 npjxCj8UCP7dOnKswjWTplDeAmXBs8lTEv2GXh23956fCtUPOklSt/OmES1p4piraN8VvgIgKg6
 EvfzN8FoZcb1MyI7JDHAyQnTpjP/HYnl3J3wmVxCd+C08MpYWBUi1uxmJlJDSjPvT1ZRrGSIQJM
 Ovd5UOpRaa6yTYAYW1yoNQN5FZMJjf0XjCrs2avEBA35ur7R5Flyuyhf+DBAMmTHtXTMP3+Y0Xx
 qnH5MWr21QZtjnuyq3g==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bd19e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zQe2su8OYnrQ7J9-Y2IA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: mFjHaQP3U--av7jJCB9HstKK5KPFoNaa
X-Proofpoint-ORIG-GUID: mFjHaQP3U--av7jJCB9HstKK5KPFoNaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034223_294141_F6ED6666 
X-CRM114-Status: GOOD (  15.78  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 967967b2b8a9..42d2583e44ca 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 static int zynqmp_ipi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *nc, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct zynqmp_ipi_pdata *pdata;
 	struct of_phandle_args out_irq;
 	struct zynqmp_ipi_mbox *mbox;
@@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 	pdata->num_mboxes = num_mboxes;
 
 	mbox = pdata->ipi_mboxes;
-	for_each_available_child_of_node(np, nc) {
+	for_each_available_child_of_node_scoped(np, nc) {
 		mbox->pdata = pdata;
 		mbox->setup_ipi_fn = ipi_fn;
 
 		ret = zynqmp_ipi_mbox_probe(mbox, nc);
 		if (ret) {
-			of_node_put(nc);
 			dev_err(dev, "failed to probe subdev.\n");
 			ret = -EINVAL;
 			goto free_mbox_dev;
-- 
2.51.0


