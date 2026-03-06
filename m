Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05610F33A92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dueXMGXpxv0xbCVmzWXvE/Ffw9BJfJL0ZtVGlTEf6/0=; b=YRuh2sb+4+5vLd+1bvRfmP4xJr
	9ZzyUFOyj3YBpuQCpv8z96kTYDK5P9G/Fp3VgCWSpwBOf77I7RX9EJurpxtibM4dwASe0YHoDsMDY
	hFuw97y0RCf7LNtLNH4DREwYhnOHeOT4CCrIWbgKMWGi4XQQEqsjtg60BqxVDfA/y71rYi3CCByL4
	dTwP6tHCNfSsQxvTatDRBirBEQ2RKnzD8/bELhKM7GMnOaAUXyRQcUBHEQw67eOAu6WAcSJRrkfzJ
	YLyfvDmxIirBu6ZbHnvKy2njLPwTBr7IkWlBS7qtdLtGa0aRXPpsEOr9t2uJaoHYxUIsDcJ8AeDX3
	5HVWzjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW54-00000003u1B-3ex6;
	Fri, 06 Mar 2026 14:23:06 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW52-00000003tzr-3Ddy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:23:05 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-5ffa277c156so763244137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772806983; x=1773411783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dueXMGXpxv0xbCVmzWXvE/Ffw9BJfJL0ZtVGlTEf6/0=;
        b=RbDckSNcOxBQpGjY7JgCYJr5V6Qn/mY4f2Ykqq/qSBlXpHoQaqfqd8tLVNmQwDDzDI
         guJ4liocggJRKlkS7pYvynqrQAeXK2WGL4xCAHBgH9U1YWXjx4g7Xg0ykuEN9/snogtk
         tpmaWAJcGTQfLNmG8NKEDKFV0NmIAbAePPothKiY5m6p7uUKlC76nDsuda4/JZuQv7oM
         M7kXkiYozC5SysbQJ0oLDoiVtar9Gv4kv1FlAr5uddoS7cHDT9LML0x2a6q9I4mfK2W9
         nvSQZkwPdmN73g86KH60/lz5O4XobwoJjw4vkPTbT3c2wkLq7xzHg/8TS6AJWE1bzSJX
         ciGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806983; x=1773411783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dueXMGXpxv0xbCVmzWXvE/Ffw9BJfJL0ZtVGlTEf6/0=;
        b=wHU3kRD6swJATofEGP2rQrNz4SQTngFVz9mcJqF8QP2MFGXCYqkHhUyCuKhSZqwmzd
         RH1c01TkNHAZQiE79YpLB4QglisXIIu5qxlR1YEzVYZmW9bvPaTGuPgZHOQPSi2H7QcE
         Qqb6hIo+4R0JBRKyBNUd4H3s4ndXThOlVy3oszkv+7lYucV0KApxKk72ULuldv8Y+Mke
         BMfwylX75Urw471rTlf2NSGn0jA2YXEIcN4JKsytIUWEKFIcy5Ec9wGvq/frhmFR8cFO
         7/cs3If5ndE+uQZourqve3vUmxnkfzXEj4amqHe2Wqb/WxFCKMHm6uvq8dCTpidMNY8h
         wDOw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGVZknS/PHp2VcdfxXy02FsbcYgSXZlG0wfmmSptccevZS4xPob3sAr0fuVDioPioWqAMH/WcENmr/FDvqnMi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy+eA5A1GYIH8kNVIGw/vZn5byVsP4duy1MWHHfG88UhNQXHrl
	pieRqLk5BEw3otb7kcSE/LjDzcwiUTi0vb9qPFIX8UHb7MWM5jHq8KYC
X-Gm-Gg: ATEYQzyjHZs3DEycXvjQApzGIR+ZM9V9PRB3ZLhOgtCRJBwf00EM2Vbrg8G21R7dAao
	P+eeJxihf9gfHqO7X3KnQK+hC1wiSE+qQlCXfhSIphlPfGLAs2vQyhABZLpGiJ9P4RFzvNjg5H8
	uMa4aqq7H+QOL1uqwSIWUo9X4pL7/W+kKV0nMHwbpf28UuaJs+IAQgu3Fe4+WvedO3Hcs9kQ88j
	o4KDWx2riDtp1wq64cyF+gA0BEWNoLdwPAPkF7597kNFO0pK9W8IGVgO5us+GLcLOEu9zcLDQSz
	SW6wc+FR/ocaJ/Iw0+uaDQSu982deu/8CkcK75ZjTNlPe/Uey5ceKDurUQ6op9DQ362pWKdwYjV
	4WnTxfKhkZHnzJHfky4ySiqEuKTPP+OHBWSl8T+QuvFN5UHHo31l3kk3PdfEbu2sd8QsG0dDiQM
	bghMvk+MU6GNj+/00K89HZjK4wACNo1w81nLtvsGhmtxaeBgsQ4B9UhpGv0rcoVojnW4kYympsE
	5qbqXY=
X-Received: by 2002:a05:6102:1613:b0:5ff:22f5:e37e with SMTP id ada2fe7eead31-5ffe5f5af8bmr731824137.10.1772806983101;
        Fri, 06 Mar 2026 06:23:03 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:ddd6:ede8:90d6:abeb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b36d64bsm1540781241.6.2026.03.06.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:23:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: srini@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Eggers <ceggers@arri.de>,
	stable@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] nvmem: imx: assign nvmem_cell_info::raw_len
Date: Fri,  6 Mar 2026 11:22:35 -0300
Message-Id: <20260306142235.1401319-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_062304_813060_8EA7D356 
X-CRM114-Status: GOOD (  10.52  )
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

From: Christian Eggers <ceggers@arri.de>

Avoid getting error messages at startup like the following on i.MX6ULL:

nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4

This shouldn't cause any functional change as this alignment would
otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().

Cc: stable@vger.kernel.org
Fixes: 4327479e559c ("nvmem: core: verify cell's raw_len")
Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/nvmem/imx-ocotp-ele.c | 1 +
 drivers/nvmem/imx-ocotp.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 7807ec0e2d18..4585da51f7f4 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -131,6 +131,7 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
 static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
+	cell->raw_len = round_up(cell->bytes, 4);
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 7bf7656d4f96..108d78d7f6cb 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -589,6 +589,7 @@ MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
 static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 					 struct nvmem_cell_info *cell)
 {
+	cell->raw_len = round_up(cell->bytes, 4);
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
-- 
2.34.1


