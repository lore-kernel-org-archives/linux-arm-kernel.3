Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F44606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S5fB8qQU;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R7u9Gwbe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=; b=S5fB8qQUHOOqdj
	+GCr5G5+ak98kmNvkM4ebeWFwoKeVnai/c9UnrnMXyMKXm+CKDhNrdixTa968bDXh/9NS5q2lC6Ov
	5fXpnMHSYvenwChd7iO+rfbtSeMRyUh1/4L9+dZBXlh2jodCjB2GZslPcBavhqKiKqOLYxRIn1HKA
	EUV8w+6jShWJw+Db555I081Jvbivca+tp8B7OoEGrJahxvtPFQqkbWboPfWuNx820RA015ROWTP6G
	colueHNQy/GqiIaA4TXHgnVkEkEOaFentrrEY+OYHcMbbiwM47099inMGQ+F2Ab8/VPpsAkbz+RWj
	RUj1aHJ/KtMn5/cQWUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0F-0000000C3Vg-1QnI;
	Fri, 30 Oct 2026 15:58:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0A-0000000C3N2-2MjS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5376015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375924; x=1793980724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=R7u9GwbeCVtx7+c3268AtrRQ1551D/KGEvHs6lKCi7xXfmw8DaB1icSzEBsRpU4jp3
         /fUEo0eusWRZry9kht51kvLJTw04Eza1yMWYowdfH1i3V9oGA0HtFPw1pM/wPOpG2UXu
         Qx7TaOK78MqUiOY3zQirfmYqxJCtCMl0qfgVPSbUqKDvMfxHPPXoXUasZpUYkhxeiomH
         MXd4Mvu2Hxd2utX5MQlnTXtUMsRznF6ZnCFQL+zR6yMMV91s/D1u9dc9bkjbNMEaSyqX
         bM7f6RS1c0IgLFJhyO2mKjRqBcgOEWN9aRATZ+7qK2VIqEU8YNPGYZOU2EmRcUg7H0F1
         ngAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375924; x=1793980724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNgD5dDfgPDT5bFFafHZDdSF81BbBx1RVfIsIKbMhFo=;
        b=R20kIMP2yedJYvP/bvSoOcmHDFuu24a/C1Tag19CLwxfYT0HmBw4tcQoALfYSPZ3b0
         C41Khcjck/oF3kj9cUf9NfD7SQaI5/G9MoBLr87Y8TTPgqLqj8IgGMH0FYZXeiowo4ix
         tt79ytS6rvN0RJfT63YYdLOB6GKTfqlrx1z0+cW/GENO/N4TOSaEszOZpU1gtjfjFLga
         IHvy8v3pel4FNifMbJR3bd0RsEti1PdY4BPFJqhHd6LJJQJR7tf5L7ScCO9WpIzgyZce
         fPvxwulX1GEJU0VtBdNLi1kAtMC4GjlUUOZeMosA46dnKpGXBbaaFi7X1yI7+7Wbz32R
         K06Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/uEkIIIEewHoYNYT/YwnVeofIg0HYsCGtsLSr5dNfR+7Orek/4EQehCjG5L6qvmsl3FwV+S4Quze2zq881uPx@lists.infradead.org
X-Gm-Message-State: AFq9FYKhzXy9d51FUAK1Sa5L1essvKz50/ykhD++uiLz6gRnNUyAM1Zx
	f/Snz10i+hEVxDo42CN5J66oLApva8WckCvt3mbKh/96wIpH/dTdk397VA5db7Q7Ja4=
X-Gm-Gg: AYBFou1g0ACLzQ320/8yCCSEBKAFqS2BkeExWwMJMP0qas/BLZuBmK2CnbyOzHETyLt
	0QqLpjiuuaZLkQfhU7z//10NTGWlrb3J1g3NYQbuxsDlCUwWMDrGxGJRTjvh+j3m02L5Yg80Bh3
	s0NkPHztKVnBRVglCs+21ieOoLQZGUJsMWkDC19Z4dSro8rIdtvjasN6Z9oGkRt/BXgcq65JY6y
	laNiB1rIKorh4YhL3RafdS+dPQlKbfDkMG7R6Rv3fgjvFECaNl82cwswxoqvbdteedBncIjj1RY
	h0T3P+7ehIprDnwYEFZgV/g6sj8dZSjrt7hMhOXSja2tFvDBFULv2LSYEvcsndg1/e/AxWRj3xs
	lhrH8DV2IcZcQlyYRTxMIlsJ3k3m29Eko6MvIyxEWRvDbZRE61NnX5t17TuCwlVs+rRbkpE3jak
	rXJBGVEf0pWX0Qs9XDpgQ3ApQLRAWcObl4EOGSMyRtULaMNRBnJZHZI0MdfAat+nvVHKhr0mTsJ
	YBqISmuAFnIYIyJdCXurOcjrR2HaJXFjbaLu8Vyd2+qq1lfLFik3x/cj+b0GnheRKZl6IzKDFW0
	RgeLMRoeUH0p4w6hlTeg0SQ6/JMg+MdHC26zqRMI5Qjg0tQUhP4=
X-Received: by 2002:a05:600c:1909:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4ac18b7dff9mr59814015e9.21.1793375924225;
        Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm165850995e9.5.2026.10.30.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:41 +0100
Subject: [PATCH 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-10-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085846_625973_0D94E928 
X-CRM114-Status: GOOD (  12.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 7 +++++++
 include/linux/scmi_protocol.h       | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index ba602242754c..27b9a38ede74 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -802,6 +802,12 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph,
+				    u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -867,6 +873,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..736d34968f42 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,8 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
+			   u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.0


