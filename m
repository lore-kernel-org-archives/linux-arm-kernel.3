Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E9CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 19:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnsCfLf/6VYWzXEUrqeYNYtT7W1UnpSeS+mVYOGuhfw=; b=lz7RbPNVj+ajQuqcfmJGCg+5xB
	vMmNLb8a+UMN7E/Vlj3fkx3cH7772kzlt0Evgh3VGbrfxIi07MqsUVZ7NtDfNDzFNDJi2xwf5OW/i
	+vbLg2VDv3pIRPtphgJdIkdU/cL6RECn+oL6pBoFXZdin13aHt5YZuKtdbDNUuYp1zw7qMoy00i85
	wWaREhR1/gJbEYMUFy8ll4qr6Z5SVqlC+nx+sKYJjY+SyA9LeChG7RTgQKokYB4MyLAmQtn1swAEB
	W6KocSZmBuO+1NoKPdxQWp0JHF+u+yWXzgjCWsVhlMr8gSCkkFr7zyb1R3LDievj4EyHfXrrTPiob
	vjZkcxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmn-0000000DI5M-2J3v;
	Sun, 17 May 2026 19:04:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgml-0000000DI3k-09nB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 19:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C17B3429ED;
	Sun, 17 May 2026 19:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA906C2BCB8;
	Sun, 17 May 2026 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044662;
	bh=gtNkyVAon17B6gxTPIRNAOKMV3QFrdAKPrTMiYF+a7k=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=tm7Yz7a/EneKn2wWKF+FaPb8gpjUK6985BUD27pqIHRiqd+fMY7ryP17oMJkJk74v
	 qgmYj/rCXWH/rEy0KnZWWbT3bifGrPgCnIwcP+/WyMSh+XER/AX1OdzT2E6ShVA3w2
	 8IAUmNKnfW8JjtMANma/fb9BMH3Yp/OLHagOq2upAWaDfaKXd/NhK/ui7pwNAHRboJ
	 /1RgWHJlmIcDFW7lZUh+9C+K3HDdO86OCbdXbx4iUiLobBW4mFxPpVUA8WipsMlZF1
	 NEwmWmrDrrisO+NvD4ZJfr4lTdpTCbfscoUJ+WzZc5EJvUTi3+LWahxz+jfpl2IUUn
	 NHDVbBGR4XDmw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 17 May 2026 20:02:43 +0100
Subject: [PATCH 4/4] firmware: arm_scmi: Validate Powercap domains before
 state access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-scmi_fixes-v1-4-d86daec4defd@kernel.org>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
In-Reply-To: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_120423_116763_C86803EB 
X-CRM114-Status: GOOD (  12.85  )
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

Powercap protocol v2 keeps local enable and last-cap state per
domain. Some public operations indexed that state before checking that
the supplied domain id was valid, and cap_enable_get() updated it even
when cap_get() failed.

Validate the domain before touching the per-domain state and only
refresh cached enable state after a successful cap_get().

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index ab9733f4458b..eb5c35cad026 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -453,10 +453,14 @@ static int scmi_powercap_cap_set(const struct scmi_protocol_handle *ph,
 		return -EINVAL;
 
 	/* Just log the last set request if acting on a disabled domain */
-	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2 &&
-	    !pi->states[domain_id].enabled) {
-		pi->states[domain_id].last_pcap = power_cap;
-		return 0;
+	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x2) {
+		if (!scmi_powercap_dom_info_get(ph, domain_id))
+			return -EINVAL;
+
+		if (!pi->states[domain_id].enabled) {
+			pi->states[domain_id].last_pcap = power_cap;
+			return 0;
+		}
 	}
 
 	return __scmi_powercap_cap_set(ph, pi, domain_id,
@@ -637,6 +641,9 @@ static int scmi_powercap_cap_enable_set(const struct scmi_protocol_handle *ph,
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return -EINVAL;
 
+	if (!scmi_powercap_dom_info_get(ph, domain_id))
+		return -EINVAL;
+
 	if (enable == pi->states[domain_id].enabled)
 		return 0;
 
@@ -678,16 +685,20 @@ static int scmi_powercap_cap_enable_get(const struct scmi_protocol_handle *ph,
 	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
 		return 0;
 
+	if (!scmi_powercap_dom_info_get(ph, domain_id))
+		return -EINVAL;
+
 	/*
 	 * Report always real platform state; platform could have ignored
 	 * a previous disable request. Default true on any error.
 	 */
 	ret = scmi_powercap_cap_get(ph, domain_id, &power_cap);
-	if (!ret)
+	if (!ret) {
 		*enable = !!power_cap;
 
-	/* Update internal state with current real platform state */
-	pi->states[domain_id].enabled = *enable;
+		/* Update internal state with current real platform state */
+		pi->states[domain_id].enabled = *enable;
+	}
 
 	return 0;
 }

-- 
2.43.0


