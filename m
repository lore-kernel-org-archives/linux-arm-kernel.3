Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14197C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kVABmX+BtOiePTH3OXz4BhV4vXGTNHgUqsYtS3wkQ18=; b=Hecudj9FJeF5ym5nXyU4mhIJ/Q
	yA8MnJudR9YfMtDOJLIfcNFxG4M5YHgEfEwZ1t0DQo7xU8P9wnAcbGM1egdY0Wyc5EQ0OlSKsnKX6
	fd6fVCnL9PhkmgFC2pJvPN8Sqpi8MAVopMJFAffKtYQK9+lPyXkjuqdVI6eKR70+w8iYWfR6O0R4o
	2BLrOjtoy32S5ypiU+D/26fmvnvg+aBWhNPt1xC5u7tI7eiA++iLAbKwWsXmrj9JoWujwcpZtkwc2
	LxTv4H7FGaE3q5tY4vZIp0E3lbkUT2n8h2X9+DzgVNasok1II29LxiwtYVjtHCVUAiRF05C1kLUV1
	oTWSYOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpre-0000000HY1n-0ij9;
	Tue, 29 Jul 2025 19:19:54 +0000
Received: from smtp-82.smtpout.orange.fr ([80.12.242.82] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpnK-0000000HXfK-3RZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:15:31 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id gpnEuKAvXhl7agpnEuFs9u; Tue, 29 Jul 2025 21:15:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753816521;
	bh=kVABmX+BtOiePTH3OXz4BhV4vXGTNHgUqsYtS3wkQ18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=onGhTKcOrJSWSwIPnznS3eEO+AmSUkC00oTjkU9zlOJwTqBTu8A7UKjcH5mM5pe3P
	 sOG8fwX7Lkmaz+lKnCxrL+VSdnbEu9XP7QWduWI8tZZCnZ3/SC1UqIWOm6rxlJuDT+
	 P+PzzWwWBe8UXHqcXp6cyz/bBQzoqitK1jC8thaRQxvIohwg36LEbL1RRCU/BaNGgg
	 kF0WgYU+NKHAunp+YiUANnfGH6VcPromr0iBUL2aVJ3RNABFniCvrsgPiDb6Y7QHlZ
	 pyi/EM85uDmDTDRPnSS/1VaXLVFkzUceeehEs7lIsprgrbPdlxYqN8E72cDnAPMmYv
	 s1AS/CDYMvGCA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Jul 2025 21:15:21 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] firmware: arm_scmi: Constify struct scmi_voltage_proto_ops
Date: Tue, 29 Jul 2025 21:15:03 +0200
Message-ID: <2091660c072dd2d5599897243a5d69e89d46ed4d.1753816459.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_121528_065982_867A20CA 
X-CRM114-Status: GOOD (  11.24  )
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

'struct scmi_voltage_proto_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  13142	   1808	      0	  14950	   3a66	drivers/firmware/arm_scmi/voltage.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  13238	   1712	      0	  14950	   3a66	drivers/firmware/arm_scmi/voltage.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/firmware/arm_scmi/voltage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index fda6a1573609..17127880e10a 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -393,7 +393,7 @@ static int scmi_voltage_domains_num_get(const struct scmi_protocol_handle *ph)
 	return vinfo->num_domains;
 }
 
-static struct scmi_voltage_proto_ops voltage_proto_ops = {
+static const struct scmi_voltage_proto_ops voltage_proto_ops = {
 	.num_domains_get = scmi_voltage_domains_num_get,
 	.info_get = scmi_voltage_info_get,
 	.config_set = scmi_voltage_config_set,
-- 
2.50.1


