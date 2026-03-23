Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A17F483DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vrYgx725Haq61UFRJXQREBllY8BXNI16WOSLFDeY60o=; b=Ko9+qjX59Gko7fuzJEm0Iwy/2A
	P3QPn5wfSNp5hDi4ybiIo/QSHhI866tMhbWtvxNBtl0N+W5Z+pWAp+PS7Nqr5FmYvQKKhfYvdQbBm
	x3XQea8HTqOxIxmO/OKUGwgu2C88xwCWJgIFfchCB8yVMbTze1GZqA1JXDIvSSD/m57IstU4moj/N
	MS1D+PrN+0hqKfIz8raImDqxpgy3EAF2euQvxQsexLz0VbKmpFkFMNoyp7CqQ/4UiSU7zIDGk4pY8
	5NVze9p8AWnZmrbRnRo3HZ2uTmsPHxehjMMZFoBCw+MYciAZNomJdoqaWuGsPSh0W3IxdESs/Ft4X
	z5jBtOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZr-0000000HI6y-1xAI;
	Mon, 23 Mar 2026 18:00:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jZo-0000000HI63-3fUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:00:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fda2a389so25100555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288831; x=1774893631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vrYgx725Haq61UFRJXQREBllY8BXNI16WOSLFDeY60o=;
        b=sgZtqgSRzjTdti15gUEdgvFMfwyKJKak5jkQwEKOqhy3zooulfr8ms1U+n/wqG0AG7
         eRohJjG3e4raYlWA3T6nvxiNFxQOAEMySwF+QSW/fUI6YNTVS7yMutoU6msiVHvkiHgm
         akMe8oeWpcxtaEpiu6ioPZ67bw8SxTPwhAn//B5SWaxnt0uKBKbcAGzIxm1vzNKQ95zK
         mv5wHFTq5zF9H2MkivNUu4gRTTicCN9TPY+YKgZCHXITqEKjqywhl3jFcV0cEv0p/mqy
         fI8J9AGiN/KLXrrreV/0gYtcGUrVVA2NQS+RGQmUEVlS6CY2Obz/Lj6BoOPqWLSpQBvv
         /qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288831; x=1774893631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrYgx725Haq61UFRJXQREBllY8BXNI16WOSLFDeY60o=;
        b=RNaUePSqvc3inrXJ29TaPIlsr7915ZYlLHbBbVvhu3RjdELCG79TQyyVbmO5SF5mVA
         WeNvwVxmYjqh+mlSgdEA402mS5ASEyDfAoaULA30vjs5YALn0N024+b0pXdaK9wARrRI
         JiTPHv3OpqIdLty7W3YkNzCjZZ/AMjimn1VG2CORq0cCQIufw9OdVea0uAm/SPCeCq9D
         6jcG2W56zrh2kBRtn2znSJ29MTSGz3efiMPsJvVq17I7oqXBCOANj5+2SRGJ5tFLDUoA
         xlWglOEEaJiEK6oBGWPEl3M9EcR0kTEl7Fig/mt4uJlgBl8q2ZQas2mGDjgbIhBUJfNC
         ldgQ==
X-Forwarded-Encrypted: i=1; AJvYcCViO7hvBWPgdhx4fO/RJ2f40nniywtk80CxaotOSZ730MAvZRbea9ZPORZMhbLkCAD+yvM1sUepJp91/Ux4gcuz@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6Uvid2g+432rwxGhJcJDjqftMrovVuLMhfgK+bI2d8c6D53B
	/JEKZXq3swoEhQzRVGsXgbSmVuVUvPc6i9G0HJkPfFOLEs2AmDG5W8Uw
X-Gm-Gg: ATEYQzyP3u4daNLwCcGjKuiTt2d4xbbC9C7CiAHu+LI1iXle8itjwaaiAj4TJebmk/y
	6p4T9UKUKIKZbn2LBHUW5agpw1Aj7YXRz77MJ0jLHGiR1S9NmPP8Vows6l3NXsaYKmyrs3tMLEc
	lArwEutNbg9yxeITr8ry4+PByluyZpBmpg01o4obJSlUvaVNZmhL1hiYiNOU6e3/g/W4wVdvDoV
	1qkHg8So3nPndwHirrlG1KajIqOc7vb5G3kctnEfz6T2U1RPZ83y7PoV7rQTatyqZKmoBjQV9S+
	87BL9AeDzknQl5ShENQ/aUL3yWxYmkwcNFV7e4hMEOCbbNmPWtLOMWkoKsCGgA8QYz1X1qKQWT3
	0S+o3QHaXYfM2raJ6nfxvu0IU2oriE/6UnE7BJzPJHwCB4I4IhM+Aupnylobjn1EH6oNkaaOcLq
	zmA8/7UtwFYw3nJkNlHOtKFJA=
X-Received: by 2002:a05:600c:45c7:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-486fede721amr169762575e9.5.1774288830519;
        Mon, 23 Mar 2026 11:00:30 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:29 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 19:59:43 +0200
Message-ID: <20260323175948.302441-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_110032_915309_1DF7034B 
X-CRM114-Status: GOOD (  11.75  )
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

This patch series converts the Technologic Systems TS-4800 Watchdog timer
bindings to DT schema and fixes the active hardware node in the iMX51
device tree.

---
Changes in v2:
- dt-bindings: watchdog: Moved 'allOf' block below 'required'.
- dt-bindings: watchdog: Removed the 'syscon' node from the example.

Eduard Bostina (2):
  dt-bindings: watchdog: Convert TS-4800 to DT schema
  ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

 .../watchdog/technologic,ts4800-wdt.yaml      | 40 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ------------
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 3 files changed, 41 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

-- 
2.53.0


