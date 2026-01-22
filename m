Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27378D3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXPPA+2hVnuz9+lpDAGfbv/AXvnSUFySkKsxMNbKNAk=; b=0nWjxAJmLGv50VjSZlPqAmSqpQ
	jbm0JwnEyV3WY1VPm9Agrm2o8T9pMmRYAb5fXpQ4EbHYM/5jHHu4NHRDt0WydOQBKJq5yL5R7mTPK
	brB8Itn0ANwBqLLsn9AD+97oyM19RvYfej8qANZdFFG6Lt+e6oZIyGF/M1jxt9b1gOHMuSLpfaumi
	k610Vqk/sIPHA50ZjyKOeBXAS2qKCldHJDF1B7IdNTwuqgOKtC9ZRG31LATY8plxCuU41YZt/RaEu
	jQIydh5h5vr7GEoHQ5D+0W1lr/SHgRHqtO+mrepyWmSjenVwcgZDE9FCWapbWs62EZ3U4/EKqMz5B
	nOYBNc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixNJ-00000007PBn-1vsH;
	Thu, 22 Jan 2026 16:17:37 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixNG-00000007PAN-34Zl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:17:36 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-37fd6e91990so11868711fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098651; x=1769703451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXPPA+2hVnuz9+lpDAGfbv/AXvnSUFySkKsxMNbKNAk=;
        b=LZhuxaBmmUEw/Ti9Xmsfnxg6vWzuHM5OtdTQpKUStAu+amrnmjuFAdXTHKjKcmgJob
         x6TI0eapT3mELw0vNR6I8wS/l9kygi/QDMskbeLZxNwTk+Jpy95OkDqAL9R9bsovc+e9
         8PFByh3uXNf0RvVOs7l898enPCmLbqVmFnl18R2kcOgOOH6BK+mfbi5HMhFsZldCEVzm
         TwsgnKw8Dgecw17dCFPdJRH8jhrWFJGE+dvlUkrnRGsE51bWagoysfJ5PrleNwZHvWfk
         xqYh8iFuJnH/3D4GioBdBvk1TCldGya0T8t5t60nkou7qdWJ8ZWkSjKwA02VvFB9rkxL
         1XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098651; x=1769703451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXPPA+2hVnuz9+lpDAGfbv/AXvnSUFySkKsxMNbKNAk=;
        b=dfyxBiL3VJ9mTZbFQD1lrHMfvb//3KRAO0gdkEEw8lzJT/BzM1W8HqsQ/+f47lfhUQ
         YEHy+psJdD7JPHonKb7D2U0mX9oOaXI0oTiCWEmz802EXnZhqcaVfLRELXYMOLNX6nTP
         1+g5BFb1SwHMf4etDXSBapzVDRdv37aqpRkcc4mzMHJn/ijX1zmVqLLiXUD6NaOmVD8M
         2FNbBqnnwAPy0AeUh7g5foh5HIHZ3xtytVyuhn8mo4cW42OG4t3Te5X07JV6qPkdVb4W
         ylfcxz13Kkx2AHD7OLTlmZZVrm2EM26cXqSTsenRDG49Sp8WFR0tNFiQ0NoGCmXk7KZP
         CYWA==
X-Forwarded-Encrypted: i=1; AJvYcCVE5yG0aV4kJx6Wjtn+WgZK8YtVw5CKbMTubP1e1Q3yj5OCSzaZqufPNSuD87kTSUzstRAog3Vajz5EZOC2F7QF@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwStE2IBvO0HT/EI7AykGIhyLfW5IXK+4vmuf1T2bJ7ibhCft
	SSaEycyWiRmA3aWc2sMrLKiyDPxYAz1OznTwCBhM+G4ZnBdOg7FelRQD
X-Gm-Gg: AZuq6aKbc1MWn5WyHnGmGKEMIkuN4gqlJXXMbSnhU+9oluCpE4eotqtAvtUjpb8q+Ad
	5Hpn4mBZD6VwFs8AnVjr5wNDmiDipt2ncbHYbldhwEXVKQ2Cmqnd7Y1D0Wio9BFyitW3oqlsTdo
	wQMBsX9RtXpVRY9eix8HNytHpzJa63c4pXpJ7mi51PBkETCl7FMVXMLHDZPd7WsB8KNueqH9iNM
	PVmpTbCGteNLa9TIIwGyJy+QFBoZlIK+ix8aWO+/9Awu38kUqtLPRY4l7Sn/lmOyPSO6S4bDAb5
	tligbCg3IAErGKEkzRQr4yAsLsQhF4SDZoEjDI730eebsp/MB7CCMwn6SmhTYGh2ETN8+KUtBM6
	NSN1f6NmU/qW+ao3BXzxiy2KeW6mFuo4qd8ilbuiT8+o1xpv0YGczD2UiQZ/g3flY1egLOP6jNl
	xjvURDxcEk2RTEvULOZwl4jda9G329eg==
X-Received: by 2002:a05:651c:31c6:b0:37a:84e5:a1cc with SMTP id 38308e7fff4ca-38386a37928mr72388961fa.22.1769098650866;
        Thu, 22 Jan 2026 08:17:30 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.148])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb94f6sm56092161fa.49.2026.01.22.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:17:30 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
Date: Thu, 22 Jan 2026 19:17:27 +0300
Message-ID: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081734_813168_1C7A15DF 
X-CRM114-Status: GOOD (  17.54  )
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

Refactor the voltage protocol implementation by moving repeated domain
ID boundary checks into dedicated inline functions. This reduces code
duplication and improves maintainability.

The new helpers are scmi_voltage_domain_validate_id() which validates
a domain ID and returns an error code, and scmi_voltage_domain_lookup()
which returns a pointer to the domain structure or an error pointer.
These are used consistently across the voltage operations.
No functional changes are introduced - the validation logic remains
identical to the original inline checks.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hello maintainers and reviewers,

Continuing the refactoring work from the previous one [1], this patch
extracts repeated domain ID boundary checks in the voltage protocol into
dedicated helper functions. This improves code maintainability by reducing
duplication and centralizing the validation logic.

The patch introduces two inline helpers:
* scmi_voltage_domain_validate_id(): validates domain ID and returns an
error code
* scmi_voltage_domain_lookup(): returns pointer to domain struct or error

Thank you!

[1] https://lore.kernel.org/all/20251103161044.2269377-1-a.shimko.dev@gmail.com/T/#u
--
Regards,
artem

 drivers/firmware/arm_scmi/voltage.c | 59 ++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index 17127880e10a..62010df24053 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -262,15 +262,37 @@ static int scmi_voltage_descriptors_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static inline int
+scmi_voltage_domain_validate_id(const struct scmi_protocol_handle *ph, u32 domain_id)
+{
+	struct voltage_info *vinfo = ph->get_priv(ph);
+
+	if (domain_id >= vinfo->num_domains)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline struct scmi_voltage_info *
+scmi_voltage_domain_lookup(const struct scmi_protocol_handle *ph, u32 domain_id)
+{
+	struct voltage_info *vinfo = ph->get_priv(ph);
+
+	if (domain_id >= vinfo->num_domains)
+		return ERR_PTR(-EINVAL);
+
+	return vinfo->domains + domain_id;
+}
+
 static int __scmi_voltage_get_u32(const struct scmi_protocol_handle *ph,
 				  u8 cmd_id, u32 domain_id, u32 *value)
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	ret = scmi_voltage_domain_validate_id(ph, domain_id);
+	if (ret)
+		return ret;
 
 	ret = ph->xops->xfer_get_init(ph, cmd_id, sizeof(__le32), 0, &t);
 	if (ret)
@@ -290,11 +312,11 @@ static int scmi_voltage_config_set(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 	struct scmi_msg_cmd_config_set *cmd;
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	ret = scmi_voltage_domain_validate_id(ph, domain_id);
+	if (ret)
+		return ret;
 
 	ret = ph->xops->xfer_get_init(ph, VOLTAGE_CONFIG_SET,
 				     sizeof(*cmd), 0, &t);
@@ -325,25 +347,23 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 {
 	int ret;
 	struct scmi_xfer *t;
-	struct voltage_info *vinfo = ph->get_priv(ph);
 	struct scmi_msg_cmd_level_set *cmd;
-	struct scmi_voltage_info *v;
+	struct scmi_voltage_info *vi;
 
-	if (domain_id >= vinfo->num_domains)
-		return -EINVAL;
+	vi = scmi_voltage_domain_lookup(ph, domain_id);
+	if (IS_ERR(vi))
+		return PTR_ERR(vi);
 
 	ret = ph->xops->xfer_get_init(ph, VOLTAGE_LEVEL_SET,
 				      sizeof(*cmd), 0, &t);
 	if (ret)
 		return ret;
 
-	v = vinfo->domains + domain_id;
-
 	cmd = t->tx.buf;
 	cmd->domain_id = cpu_to_le32(domain_id);
 	cmd->voltage_level = cpu_to_le32(volt_uV);
 
-	if (!v->async_level_set || mode != SCMI_VOLTAGE_LEVEL_SET_AUTO) {
+	if (!vi->async_level_set || mode != SCMI_VOLTAGE_LEVEL_SET_AUTO) {
 		cmd->flags = cpu_to_le32(0x0);
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
@@ -356,7 +376,7 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 			if (le32_to_cpu(resp->domain_id) == domain_id)
 				dev_dbg(ph->dev,
 					"Voltage domain %d set async to %d\n",
-					v->id,
+					vi->id,
 					le32_to_cpu(resp->voltage_level));
 			else
 				ret = -EPROTO;
@@ -377,13 +397,16 @@ static int scmi_voltage_level_get(const struct scmi_protocol_handle *ph,
 static const struct scmi_voltage_info * __must_check
 scmi_voltage_info_get(const struct scmi_protocol_handle *ph, u32 domain_id)
 {
-	struct voltage_info *vinfo = ph->get_priv(ph);
+	struct scmi_voltage_info *vi;
 
-	if (domain_id >= vinfo->num_domains ||
-	    !vinfo->domains[domain_id].num_levels)
+	vi = scmi_voltage_domain_lookup(ph, domain_id);
+	if (IS_ERR(vi))
 		return NULL;
 
-	return vinfo->domains + domain_id;
+	if (!vi->num_levels)
+		return NULL;
+
+	return vi;
 }
 
 static int scmi_voltage_domains_num_get(const struct scmi_protocol_handle *ph)
-- 
2.43.0


