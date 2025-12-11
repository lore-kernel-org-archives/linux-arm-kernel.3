Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46649D41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJvuh2zJXk/iXDELpMIpnq6ZsR0QR0lcnSQ7RpEarGA=; b=E2kGHv7wirxkqHz52kMmTpJD4R
	BaXg9zQPvw5YXvdVJfDNxSFzZ9mbMEZqaevZC/dQ9WELFBmtaa2xPSHrhnqTOGt9cVUqxf2wq/d5g
	NZhnvJCaIRuGjxEyzn8Qc8O5t3AoNrfzNXww5UKcCHaOKUbXICKelKJ4WHWI6xzcKc8L26sAqurlP
	H8AZI29qQL++jMIEpCnZVGUj/dWApXtBGQyPCUsc/ACH0XoT6/iHLvzFNNYcr6OyG4mnw3ERte2Uw
	jhK7gfE0EX86qKjwa3CfK5Gz7iZU91dXNavpPOusb7wEaY6mw1mKC1/JxfW3sTrA82JBa7SBSLJ7N
	UT0Id5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGz-0000000H1FM-1plL;
	Thu, 11 Dec 2025 17:16:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGt-0000000H1Av-34xW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:16:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso4850675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473366; x=1766078166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJvuh2zJXk/iXDELpMIpnq6ZsR0QR0lcnSQ7RpEarGA=;
        b=o94Tfpf/HRM/zbcoNsUHmdFSPKDkh1U95li2gBEF+KLk9hkScgSVzpIBDfpSeI8sY9
         CxjG34yIfyPJSNU3iVJahNb51oc4NZjfSdEWrfEO7H0cu4xNxuBf0elNoV9jtKZ2jzD9
         nxQNIakO3HQzjkihvkI82qZQlDnpSWk9cIgKkwYkPBmWkJySLonfi6TnXJytdYdplwIf
         AY0X+FWWd7gSsea0v9uQEObHvE7n3RkY1AE2H5SQ3jlxdGu/JS7epRSbFPkazgTWAD7a
         f6kEux8hZ2T9DGzS5c3zsqNWKQogJpaaAXXJ9fBoMkdJo034Zd/Fkrs8hM97XU1lmCcM
         ghrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473366; x=1766078166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJvuh2zJXk/iXDELpMIpnq6ZsR0QR0lcnSQ7RpEarGA=;
        b=gRR1vrBkhjqQfNv1qYGFpZeAerlthcioRVH35cQmuB46bnqotyxJkrjjY6ITf5+PUs
         +wNT9eO5Ocahl5hTMPSTadzz2U1jXkU2jAnaVUq/ANGfD1QUOI1mGoNm8rpBM2Kdy3F4
         jhwRlXaZZy1+5w4YQRGEcUUt0NmKfd4r+DcMFK0BH0VqGLjMDqjyeps76ENvxaGfCbe/
         sm8two7TlEzPwvegtKyGssXvsltkysALnGm2AQ5xIBZx1BhL2kQ+QrlY6/xfZgdb0Jh8
         K8JbUS5RSGorKoF8IeNEgh6VsQB5TyUfhJTuCqeHKE44Dzwkeg8BvmSQR/sbzqbLoDTV
         sY9g==
X-Forwarded-Encrypted: i=1; AJvYcCUBO2ptSDiLyQ+A2Wh9N54LWnF4GgzmZL+dw6n7/tQKOZYpyGW17/O8sPOjeDj5iOOrhz42klFxFckzaabYkNcN@lists.infradead.org
X-Gm-Message-State: AOJu0YzFq0PgkdnV40C5PWwIpTCUoPMOW3dCm17s78+3QXuXdba1C4ae
	D1XKcifqOvOC6tKbUQXL59WXcVj/cFTA6AOMYg8LSrOLp/vTkqS220rFsIWTbv02rR8=
X-Gm-Gg: AY/fxX4x28nvyeXcNMxlMq+E7IENybaAUc2fsMJT3mTO/wDnTFMD2y3EAG7xLMQfzT5
	pXdiXSiX+HmypVuq1jqozAayWvHK6vH9x0fjvgLqBgX5UfR7X64wIBfS8XClUDnzQEsPlnxI4wk
	EiEUmq4sE1lTDJZMupYujNIHXV7cyZ9nz1cnDNgLMM9GSkIg0WSJgSfxpd9dUMS3MNspegY2UJL
	Z/xmaN/V7Xlt6H+aM4DL62FQCkfixRgdPJmkTClvzDGLnGpplTq+kPF0LrzMCs833O4cQjOABvq
	NDQaXBsv15oy6ttp9ORGAvS+QK5UV1RSLgYcElRrNmZ2z3J8AuTfst4uPJghbaKrwWUD4G03zP5
	pqYIaX8RrW9h5ArOw9SY7KIKJmPwkUc3W/VXcl1IioAfFgJ82JxYXmPatCuj6FJTT1SYzfjqo0k
	c3nTU17MOE27WkdDnTrRjsP+FNk/sDml8tA/Ep4youU+UzG3mDKU8YiVGCjAAkxqncbfCp0yZZ7
	Qg=
X-Google-Smtp-Source: AGHT+IEGmS+1LhS4ZsJsEwUzoNuTKqPZKX6sWYZNnchoA1D32F7TBe8hMOH8GOYwpwExY7BjQ6puZw==
X-Received: by 2002:a05:600c:470a:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47a8384bb93mr65103155e9.22.1765473365857;
        Thu, 11 Dec 2025 09:16:05 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a89ed6813sm18027445e9.6.2025.12.11.09.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:16:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/17] firmware: arm_scmi: Make use of tee bus methods
Date: Thu, 11 Dec 2025 18:15:05 +0100
Message-ID: <46dae3cada663b3a5ae1989881d9e74ef40acce5.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CThuCWJi4dOQENcO7QkBfz1Ye/Pbs4UbUDXRANvmB2A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvww5Fdhu+aWz2MP7psFnJDaCqSIMI0L6LHTN epd1RJ6lh6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8MAAKCRCPgPtYfRL+ TmkNB/0YKwt4sdh/V0tvwCmGZWV8z4k4PtU5uKfNbIzaUiD6HqBwjSazrEryMHtANr/UGgSXKIY g6wAfPHQ7BBgbU8Vh2aGoY76LpexA4nfFlq68n8Suxao5uRi6oduzNpX8YoMvSsFQKZLFPonVdU tLx7XPSKIBhVdbMadabM2MGwZmSfYe6lCQY5zuKRxzk2CXnwk1Ip8rZMZYq7qqY15E6ysSl1y6a tLiFhXD7hUsGffmgeMlBtuHsXOKqk9k7Os37VByPrcKt1yqVayq6gSWhgzGIFo7P2NiyqakZgf6 l6t7cZBtlhYHU4BluapUDhLu26g/LOWvt+tVlchYsiKw2ESz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091607_801679_27C34C06 
X-CRM114-Status: GOOD (  15.31  )
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


