Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E776AFCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=; b=f7F6HG3fc5OFy4wKsgQKliSTOu
	jvjsM4fGTmR6E7u/cOzLkYMMxQV0pxiiBsZUg8887Kc5s+zZEFM2hS6VhIE2TYJqQtJuVi2/jc3Yc
	ov7LvZCnc18RPTb8Ty5KZY9iggCKzdJ0m9cwIc6G0jHpJAbSo0K2yCoB9P4fZnHEF3orHdZKIaJHf
	nBPN1DVvuVQhfZSMPYfViX8UV8MuDJ2ZFSD9W5vSSUXx8gdFzjbHCqGsaR9+xPSUEXfuPReNw+7tY
	xZehSUi8ht8zIvq2MplbrYYRLEHwCBRqTc92l2ysEHOL/DrCXz6S7eEfaQ39bnX9V8Bg/zl872NW9
	owP/eS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaRB-00000004Mg6-3CtM;
	Fri, 06 Mar 2026 19:02:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaR8-00000004MdQ-3hOu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 19:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=; b=Xq+ug9b3T4xkLT3yqTfoDGyCdT
	A0V6jCt/aThLVkJXhcgYjd9XC9yo577qawsbRq8jUUtNmCuDgXuMGQaGtkr2wp3Nycgnyu6E/CxxH
	9646KuXXhlIXOg6YIb4Owfhh1shWozynsFRjj9loubmGw5rRntvjb35VN1np/Ff9xnYJ0xrEH97YT
	QW9qc0seT3+0mj6tJnYGv9bKgdFNATfc9z76/a1zD0K553wbSrc0gZM/c2yTRpWhiJvzsvKziNw6L
	c1q56L83FyUyxzzocrYz/WJdpfLeR65+nXoXA7cmClaBpBVrFhEBjlZoVdNaVvO9t8q+awv1xPyiw
	uCDcuOkQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaR6-00000009UuM-0P2R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:02:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439ce3605ecso1668660f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772823725; x=1773428525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=;
        b=Vk/eEDeqcoJXhlS54MNqam8nDr2mOOK6R9qKg8UEN9s7MOpX5Z0cy8VJq1xPxQrHXG
         sxiEk85vHHRNKEo8hYXOmn4Ev4LevOGXUU1mM1qzFzio2x0cCY8N5XE8NUkcOqrwTkTG
         kWDWEa/hXQE0BuqDC5mg3pq1XAYThGS19tPaTI1rVYyAVjsDtEPtRC0zToBB1CfgDFfU
         0UTiNvmnzy5J4I43Q/miUj80/YPumlwSk1c6RHmZk01BPawEttLyxkdoTQZcCf2VPx32
         mqPrvqvE8pU6dKFuwnj2FSrgUeP0rm6XUahsuiZdZg6bHgsEKNa9mjp4AP2B10yEAP/0
         hj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823725; x=1773428525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uq+Zu8LykB2khmPRxrzoypE2Ot8bOB1NxKiqjP0T/vQ=;
        b=NbVhXy44M6pd2/U4faRVdW8w7AgK95225dzLbWZILtNcMBz2P0RS5Lt5ViRdOj/VJ4
         1I0FJZmQmcu0U0SE0CSEiIHfQEUMvq9ecJfJY/35umRNlytIsSFYCMlbpqgpRXtXsYRJ
         vY6l4zqTFtEBdl3K4RdIuJDbAF+/KrYzxLsCYoSoLWpAiiSBFm4YEaisxmrh/O/dcmed
         blaYXO86XQGvaqTI3xyLnY4ig8jUP+OBBkti66jcPxnoa5oTNnKuo1mt4m0qgzHOhA4Q
         2lrpbYr6yX4Vnv3oGvZ7J9vJcehCEglrDM4lXpU28YA2ZdSTayNeZB531/wOiE7AX1u8
         gwEA==
X-Forwarded-Encrypted: i=1; AJvYcCUGpOiJQAJLq+qZYDjPMhKUB0rHNQ4Zn2oyX1AVVZJIzAmGzJx542e9sINjQPdD0h7aKi2yf45hB1x0RgJci2t+@lists.infradead.org
X-Gm-Message-State: AOJu0YyfT+Qf9BwghrPpIl9H9ifTgSJSJIHdRX+CW/hTklxNZZk5/hLh
	pR17wstpwvUNo4zBvTaPrs73neKs6AMJnubCHGaR7tB8PgG4jpjtJ0Ty
X-Gm-Gg: ATEYQzy4OUcp31yvENqinp0/XkBqv+e0s1A5QUjXZZGF63G5ggpxpROxWhjAjLLWQzp
	qgsSRFP3P0tUX1BsHHlbFcaWoyU9O6X/Xk7L2sgkEV5eZfKJjzLwLMRIOJFfLwverFVeYyJSHXf
	ch9cudGC2ReN2FUz2Hpd2+PkTUyynl7pfF0knTBoO8v+L2Pd+7GqZ0djhurMvl0DOgfjd83ZtFa
	0GjfqEjcK7mCjPVXPBTKE6HWsVl81k7Q66ltJRWLlfsSeW16qHRZjP3bJuugtH1vZS9UBRdoYvd
	WQIs4PlzA4PRBsSPgeV7MevywHhQmGI3t1ocpI/ENYRgJs8ci3/m9NWrO2+H+fZ2a5zi1yXWQ1M
	/uo+7+D0mMmWpMvhkoVSfIdv99Z4sSnFosqaQ7/R5n4WsnfwLaIKZKkceqHVaKdpkesf4CLy2z6
	LAXSz7C+iwbZHY9FWd7y6F0XekQfiD/hQKqb6TFUq8iUN4cVi0V+u3C2I=
X-Received: by 2002:a05:6000:4313:b0:439:a95b:3c43 with SMTP id ffacd0b85a97d-439da65e31amr5770839f8f.21.1772823724684;
        Fri, 06 Mar 2026 11:02:04 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439dae2ba66sm4743436f8f.20.2026.03.06.11.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:02:04 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/4] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Fri,  6 Mar 2026 20:01:50 +0100
Message-ID: <20260306190156.22297-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306190156.22297-1-ansuelsmth@gmail.com>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_190208_224239_8AF55D47 
X-CRM114-Status: GOOD (  12.78  )
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

The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
purpose. For example the Serdes for the USB1 port can be both
used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
used for USB 3.0 operation or for PCIe.

The PCIe Serdes can be both used for PCIe operation or for Ethernet.

Add bindings to permit correct reference of the different ports in DT,
mostly to differentiate the different supported modes internally to the
drivers.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..a14cef465dad
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		0
+#define AIROHA_SCU_SERDES_USB2		1
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.51.0


