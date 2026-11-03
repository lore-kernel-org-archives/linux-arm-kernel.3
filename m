Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E932606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zpwqJMvk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/4FEwyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2iPUQpArd++dAugymdCYR9QxCbrAkyiSI3kkgK73EZ4=; b=zpwqJMvk7Unif4
	IfaXxP8igzH9A7UIz7T3BqTQUBbRaj+SefRXqEjSKtosqO3pLMteDVbGI8nepnSLISKfLetLHMlNw
	OwN9BLNvJLXyeEgugItkzZj3h0MjoktxM3zQHOyY5LGMjvuspKbM8+reuRAjuJdwKjgHhcQ1C76WS
	PQZ/6qK3cMUea8VHc3lCRQi0Z/ZVdckfh2IABl7owGr+Z5+Y/0ZOgke+b8kDkdhhqdINdfeHLm9kt
	OZyHN+j8lF5SoiWLLru2Lce/nKJDeKvj2ek3DQGGVzxqjtzPbw5ltJjf4c6AFVy8aTK9vIj8voEaa
	eotlGZcGvBvAvJq1XzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5s-00000003hlo-1wxx;
	Tue, 03 Nov 2026 21:31:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM5r-00000003hlP-2pq1;
	Tue, 03 Nov 2026 21:30:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E79E41913;
	Tue,  3 Nov 2026 21:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8076D1F000C1;
	Tue,  3 Nov 2026 21:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741459;
	bh=2iPUQpArd++dAugymdCYR9QxCbrAkyiSI3kkgK73EZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E/4FEwyROxGxiyBu8w0XrcG89uXdv+/puOwytwSgG8SZb7kIc53yF8d4xNVamS/u1
	 ewWSmhdeOv4jBvaeLyt/fxk5VmVBG4yfnAyG7vF9yOWiqIXAgWSnXDLx198oNe2hZ2
	 VD4biYvQK+Fsv2ltDmRW0FedH+/nTCP+UixjiBrb5qRbp89Bu6C9gWQTu9A6FaVAia
	 /EPcaDCg3UM7Z6R2ep/280347rxn9C63ZTy8Y2rwIX8aFQIfy2epofN8WOjCJYRZk3
	 +NSi6afi/H7sN3YeGMEUfVGlphztpgM6FWSLj4hdjM42qdfeMDJxnNyZ1uHiAQFPsp
	 m0T791mx9lLew==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	James Tai <james.tai@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Linus Walleij <linusw@kernel.org>,
	Tzuyi Chang <tychang@realtek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields to NA in config macros
Date: Tue,  3 Nov 2026 21:29:12 +0000
Message-ID: <20261103213002.1673560-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Realtek pinctrl driver uses NA (0xffffffff) as the sentinel for
unsupported pin configuration features.  However, RTK_PIN_CONFIG omits
input_volt_offset, slew_rate_offset, and hvil_offset, and
RTK_PIN_CONFIG_V2 omits slew_rate_offset and hvil_offset.  Because C99
designated initialisers zero-initialise omitted members, those fields
default to 0 instead of NA, causing rtd_pconf_parse_conf() to treat
unsupported features as valid at bit offset base_bit + 0 and corrupt
adjacent register bits.

Explicitly initialise the omitted offset fields to NA in RTK_PIN_CONFIG
and RTK_PIN_CONFIG_V2.

Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input voltage and high VIL")
Fixes: e309dbd523b8 ("pinctrl: realtek: add rtd1625 pinctrl driver")
Closes: https://sashiko.dev/#/bug/linux-fbd0bf54-6dba-4652-9418-270b11fb6d8b
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/realtek/pinctrl-rtd.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index 77c30ea76443..86db54ea3ce8 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -96,6 +96,9 @@ struct rtd_pin_reg_list {
 		.smt_offset = _smt_off, \
 		.power_offset = _pow_off, \
 		.curr_type = _curr_type, \
+		.input_volt_offset = NA, \
+		.slew_rate_offset = NA, \
+		.hvil_offset = NA, \
 	}
 
 #define RTK_PIN_CONFIG_V2(_name, _reg_off, _base_bit, _pud_en_off, \
@@ -112,6 +115,8 @@ struct rtd_pin_reg_list {
 		.power_offset = _pow_off, \
 		.input_volt_offset = _input_volt_off, \
 		.curr_type = _curr_type, \
+		.slew_rate_offset = NA, \
+		.hvil_offset = NA, \
 	}
 
 #define RTK_PIN_CONFIG_I2C(_name, _reg_off, _base_bit, _pud_en_off, \
-- 
2.56.0.385.gac671c819a-goog


