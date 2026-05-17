Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 19:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWVGuqfYQwMVXFSzwidkMo+of2vCBqFs7cgqtUJvLOc=; b=pFQrWjbfhkiqYGnxDdjukiVdVi
	TK9Ho0dssT5nrImCNLPAGnFOXLqJaKkf5l4Uxd+YVXEvZ9XjbuDDk7tJ5XKfnxaM33cZ+CeVB7tSp
	UPMUPWdDFd3J/4UawrC1Q7Z5xX7w9ClaQ7Yz3RDr/LU8SzL+6NfMDYNP+024MfBUvHcmyrdzZYwG/
	U6JiaCalBzXQJn2s+p6njswKCXobHS/o0x0lOGF7z6254YEpk/4j70KcQLdg/SSXF86+dTOj6JSGr
	EtckbuIgkXcq7qx1fxgplC9Q8jQuUF2ycw9TzCS2pJXIIfb3cSTg9NdVhiVlu1e3eUhddJHAl/47F
	MkOWuLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmn-0000000DI53-1fx7;
	Sun, 17 May 2026 19:04:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmk-0000000DI32-0OsJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 19:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A92564451B;
	Sun, 17 May 2026 19:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DAFC2BCC6;
	Sun, 17 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044661;
	bh=BagPRorJW0mo6+WpFTl1DFwi/7L5mgLhGiL9DVliUXs=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=YLlgiVpTDR9dcJW1vjOzjHVtiy+FWXqRrSWsZOpbf94OoDar2aJzhzXyst88zz+Jw
	 YHhgiC0iapbFxhzsZHn1cQYVzEtRvTkFqC6rEhAVeg88LntoSeFfh0mAPELovuP3NZ
	 1Rsak1NdL50VBHLG30WwRanffpXch4JGmZq3nwi08IR1awVTeg1BAqjemPtmlGhFN3
	 Vqeq+TsqplFTXeo/++7q+syiI4s+fo7Dh+FckxfLKwVTSm47aXMFEtmn9uTU4mYkcL
	 +1ADfCqggl31JxhW3GDcmMS2e5TCN9rxHhyPkKQ6IG17ACPTYMXNsEFnfJI9jYcE7l
	 RtAlfesAQuBFQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:42 +0100
Subject: [PATCH 3/4] firmware: arm_scmi: Validate SENSOR_UPDATE payload
 size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-3-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_120422_185250_4E226CDF 
X-CRM114-Status: GOOD (  13.00  )
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

SENSOR_UPDATE carries one or more sensor readings after the fixed
notification header. The parser derives the expected reading count
from the sensor description, but it did not verify that the received
payload contains those entries before parsing them.

Reject truncated update notifications before reading the variable
array.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/sensors.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 836c294a9f42..b14bb1146356 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -1072,12 +1072,15 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
 	case SCMI_EVENT_SENSOR_UPDATE:
 	{
 		int i;
+		size_t expected_sz;
 		struct scmi_sensor_info *s;
 		const struct scmi_sensor_update_notify_payld *p = payld;
 		struct scmi_sensor_update_report *r = report;
 		struct sensors_info *sinfo = ph->get_priv(ph);
 
-		/* payld_sz is variable for this event */
+		if (payld_sz < sizeof(*p))
+			break;
+
 		r->sensor_id = le32_to_cpu(p->sensor_id);
 		if (r->sensor_id >= sinfo->num_sensors)
 			break;
@@ -1091,6 +1094,11 @@ scmi_sensor_fill_custom_report(const struct scmi_protocol_handle *ph,
 		 * readings defined for this sensor or 1 for scalar sensors.
 		 */
 		r->readings_count = s->num_axis ?: 1;
+		expected_sz = sizeof(*p) + r->readings_count *
+			      sizeof(p->readings[0]);
+		if (payld_sz < expected_sz)
+			break;
+
 		for (i = 0; i < r->readings_count; i++)
 			scmi_parse_sensor_readings(&r->readings[i],
 						   &p->readings[i]);

-- 
2.43.0


