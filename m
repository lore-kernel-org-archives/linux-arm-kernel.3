Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A39ED5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfzDwdLQJZM+QWaZp429a9MEMQ68gzEG7kbM26+AAC8=; b=Fldr8CI3NVNgxZ41nSStpXQXHZ
	OT3VV7IZ/xUcWbZOWqdFbGNvQmi1gmw7osqz7Vb1IJacAhqk4AGBS9nwptPUdAceKOfy5Aanxx1Lj
	P0jFMd9Y1Pvb80gOQtn9BSW087S9SkiyRKIpilojl4TKE8w94xj39yMI2hiE42f7EVrUFXjOK7uRO
	AmUjedKvbmYo4IlC4YVErf136JQrGsJBw1IQk/K5dv3CQ8zbLhm2detkzXXhAVdt2J4I/zVzO1Je8
	cVGGYynKXpCM1x/4b3dF46L01hIxcxRtClh93z8skuJG3e5j8UVnCaBqi9fnNl5PV+xXh5BCEkcpz
	mZnbrwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Oh-00000003mDj-2Tkd;
	Mon, 15 Dec 2025 14:17:59 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Oc-00000003mAU-2rhW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:17:55 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6492e25cd7eso1240525a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808272; x=1766413072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfzDwdLQJZM+QWaZp429a9MEMQ68gzEG7kbM26+AAC8=;
        b=joewXIysfiUPaZGLMBwIoSo6eWU7KjvDgLsfuVRPJ9ZQ1MlXbJQx5fN6O6BvCn/k0W
         49j9v/44JefldRTFGUxTGgxJdwBRszGM13QDyLtBBCR3e3PHTT5Q7z/DWP2GK7utUPmU
         gMJzbJZ+Pv2p5eqrhY+cENHHoqLHCH/rvtddy4pLUI0CAKswPWVn5lDV0vgsvYogW4dt
         mfcKz2hbeJ7Fpbln2tuMweb0QPF2AbDjAys41SMQGkNkUfW5ql5cW5+x2Uw7bNcs7GE3
         wujv8YB0HVqoXHtkTx1e4/jIrLshvNqOTettu8hNYbJDfxuax8oLHbeF6WcEtruqWjX4
         x9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808272; x=1766413072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sfzDwdLQJZM+QWaZp429a9MEMQ68gzEG7kbM26+AAC8=;
        b=v6lGeyugIhjTsQZThGGcUFcPaYJrOjw4SsiUK3XonPqFNFPTk1EixODrMr8wxhieIR
         MvlBo36g84SuBZuAAthKoReIzQDFkCh3l4la2vffUhA/7ejvXgwv3in0wdoLtkMlEVP2
         8mMxuajtv4E8V4ZgrzQxZDjeoDztHi5BD2DGI6HZcl+Ps9d3Tr6Bfm23wi7GS+thAe72
         KyGdY01Xi+JsxvaYgGfcmogDbWLkLSbYyN8Or6pQYDnFLTbcblGx9qiG1zjWSq3zzdfX
         rKEmVDXjQIaLD1KlZHfLhSHIJz0yq/zhJMtVIzsopjMvOa1jDNMAsTktHAs7tcOAwF+Z
         aQiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPpnBksym9uVrq91/bu0lXJpu4Y9UHZEsUj5AGdJTM6iK5QtJlUEqK990yDcUsxKCjTFy3jRc4G/reJn9G0oso@lists.infradead.org
X-Gm-Message-State: AOJu0YxHfRVe3xtesfWTeN+dJFHraYCc2ysXaCTJxpsCn5CgwKBXLBQH
	R37XZfKqIORSLgDkBQNE+oaoQOmZ0ETuVfGVGc8+GYWQttYrgnoITElHNHP+I6243js=
X-Gm-Gg: AY/fxX4BzzMbpmPW6HQeJQD1BbNfqnEP0v6qivCn3i0+3kHX5Y4IAdcKcGf1/I8WZDK
	Q1qXBkJZFgD1ONQnSmcElSSP+IVIus3o2ES5RgES8SGwdh9ypxPEIG5Sls++5YDQ6N53z1vdMap
	aSKnYV5JTafuA7sM2KbtTuZNkZhAEzzD5usm4xXv4aD4/SB0rT2koMIfWYduWJsf359OCpvpqNd
	Ok3VEp0LrA3uIlOfWtPt13Ia7Jf3pe7TC3SJnEYsMdd705XDSgspc2kIVtRolq2lx8Y2H15J52J
	PhSSPozXVp0ZPZBi98Yyjb5m3wluO81vms7Lmyj93iKbAltm2dJFfej4GugEzOJd7MewhrvxxdA
	TfWMjbAMdf1UY0Mr+is6FO6IXHuW0VZjJtOXPXtTB9Zl8g2JUdcu1SjLqsHP0SLoPtU6c7vw7Cu
	8gB7T5xL4UXCyEhUkeDptc9hcDYyUjjoLVzmxAG7b9MJTqIClh5YByu/36l/Zo9wcjeTur
X-Google-Smtp-Source: AGHT+IFOJgC5Ya2iL64i8Tv4dTF8QQYDLC4+J0wActxyot5OM2vMJCd/KcUe/O38HWI5lnvavkRPtA==
X-Received: by 2002:a05:6402:345b:b0:640:abb1:5eff with SMTP id 4fb4d7f45d1cf-6498745b430mr10332378a12.8.1765808272372;
        Mon, 15 Dec 2025 06:17:52 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64981fa5514sm13619843a12.0.2025.12.15.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:52 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/17] firmware: arm_scmi: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:41 +0100
Message-ID: <859339714ce238c34fdc4832fa23d6d6abec6ba1.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4A/9VAHmTaZWnv8JgiT7H1qCJuRsg+ML7SSaVfNtUv0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhkwHiXSzA2c6kuc0awa3zu+SCZ668nFKvHWuQ19u+6RrV +fOP2TSyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBELnWw/7OWWaMvsKvlGqeJ z1e9vfb6bD16p1Yo+j3aH1+h4WE+cR+rYGip+ZscsVOCdsvEzzEe/2OuPX1C0dzONVfenBSXdO6 e1BtrkaJnFXTX9qFbVku81gGHfJl9i7dtXOw37fxuLncN9+t2MjZ9TFN03JkW/zSd8+Hcdrf3Yu pCDWLba9+rzpdm/bDznlWxX63nqrDMdlVjC6bdwWea7PgbbQsaD3usDXjRmnko2+n6OT7dn1PuK vutPc98QFulL1RplW5+csjilybqX3IPKcRm3Xw5LW/Jft5d9ns+zE+5xtCrPjX07ZFLfxQsBcSi Jt3TWi4c4RbgyGilb3ldI3iztf2EVXo9Fy6eZON4E9APAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061754_770302_F86CAE47 
X-CRM114-Status: GOOD (  15.51  )
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

The tee bus got dedicated callbacks for probe and remove.
Make use of these. This fixes a runtime warning about the driver needing
to be converted to the bus methods. Note that the return value of .remove()
was already ignored before, so there is no problem introduced by dropping
the error returns.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 8fdb80d3fabd..07ae18d5279d 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -529,8 +529,9 @@ static const struct of_device_id scmi_of_match[] = {
 DEFINE_SCMI_TRANSPORT_DRIVER(scmi_optee, scmi_optee_driver, scmi_optee_desc,
 			     scmi_of_match, core);
 
-static int scmi_optee_service_probe(struct device *dev)
+static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 {
+	struct device *dev = &scmi_pta->dev;
 	struct scmi_optee_agent *agent;
 	struct tee_context *tee_ctx;
 	int ret;
@@ -578,24 +579,22 @@ static int scmi_optee_service_probe(struct device *dev)
 	return ret;
 }
 
-static int scmi_optee_service_remove(struct device *dev)
+static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 {
 	struct scmi_optee_agent *agent = scmi_optee_private;
 
 	if (!scmi_optee_private)
-		return -EINVAL;
+		return;
 
 	platform_driver_unregister(&scmi_optee_driver);
 
 	if (!list_empty(&scmi_optee_private->channel_list))
-		return -EBUSY;
+		return;
 
 	/* Ensure cleared reference is visible before resources are released */
 	smp_store_mb(scmi_optee_private, NULL);
 
 	tee_client_close_context(agent->tee_ctx);
-
-	return 0;
 }
 
 static const struct tee_client_device_id scmi_optee_service_id[] = {
@@ -609,11 +608,11 @@ static const struct tee_client_device_id scmi_optee_service_id[] = {
 MODULE_DEVICE_TABLE(tee, scmi_optee_service_id);
 
 static struct tee_client_driver scmi_optee_service_driver = {
-	.id_table	= scmi_optee_service_id,
-	.driver		= {
+	.probe = scmi_optee_service_probe,
+	.remove = scmi_optee_service_remove,
+	.id_table = scmi_optee_service_id,
+	.driver = {
 		.name = "scmi-optee",
-		.probe = scmi_optee_service_probe,
-		.remove = scmi_optee_service_remove,
 	},
 };
 
-- 
2.47.3


