Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1002C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=; b=fCIiBgDeFEmNU0apOkEScqAcO9
	RGnmCVVEpDX7NHENFxj5M0PN0JnRDYF5gnEtpOuQ6DWZ3HRKhlqVWExIIJ5Va0iH2hN5Y0T1ldExT
	+TyfewstDa8bgmDXoSEQE1UQqIqGDgodUo7dvigIbMMcaXRof//uvpTkrdc5f6qsPpWrrCx7RMmO8
	nn7A0CO/0bu8V53DS9PTmqCCPARV0ykWe3nCKuCBt0/Olx2Zu+2E4qf6rbgH5UCjwXOGj1GDndqL7
	NRwUkId/in1GMZJLw1H7/dtlMJdcPmUZoOOHFVYpsinNOeOFM4kLw1MzazDWuetRMPPl75qMyiiEj
	jaZp2bVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToxL-000000041zZ-3aEP;
	Mon, 23 Jun 2025 21:43:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkjA-00000003WnF-3f11
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:13:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso2001575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750698783; x=1751303583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=V9AJdCjH4Tq1axQtWVTYf7w9BoFqknx76lPWsdssvyE8SavZOhw/iNxCCJWiAbNmoH
         NcpN4MPtlkxYIbrYZid6ptRdVDZ7kHyVMbSSyKqoT4qxQunFHWEGW2sNlykMZGwFDPQ8
         dP8MdwLg+pG0ow5Y6zaxeAKS9QBGm1EVLFZtc5fVQTjcw8ilJ/0nHAk83W4eOwtvqx1+
         yO5Kl0mbnwQXIQYF/0SBHc4w6qjdtpNhenMe/vztd3JXjZ6OwTDp0kh52S1AFQdYH932
         4FTswpcd7Dp5TZ3HNGpS9kitCEl7XRCcItXvG32YDYMypexrVGvDOOq1l7AGItHe+Xwe
         XJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698783; x=1751303583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=NOi4VhACyBlsDe+4L49db0fWORJZ/YXRY2KzPaHm1ZGpT4KaSPLaql0eFrPFEI+UEM
         ap0GwVz3TBenNEfYZLi3vsKcUMcmxIAc4wecEJIC5is3RN80r94R3EPO2UbspzOlAVsN
         YIG0+uoKtXdHq1GMbmDEMSfxVjGd65M9Hvzb9c/3xpDSTqWrdOC8zCleZ7dhWbGij+zu
         Z0mD8YPDgFcM0QQHW5shAjVYMO4Cj+daVfqOdw1vzUdlfzaSnrK/RKHPYB1tU0zoxupw
         Q0Lc2FiJq0oKsoOZ9MJ+3FW2RVmi65asKhgPXGZc/YctY1uTgJMraYmzyW+Ik3ILA2Gj
         E3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXEND0lsRAL4bBMe5RkwRcVT+h8LMf/k88VqA1UmrhTAull24Tfi8b5SuHXsT1Cs1nHuHGGZ3y77F5djTDitk8w@lists.infradead.org
X-Gm-Message-State: AOJu0YwySDLDhF92UQhMtTXaMZgWAqERJvujLxY7t/4AfMmyFNhLBYi8
	GBEiPyV+iFvXDR+gXPQ2IAeGFOKjkxJhN66BjG5oVdc9GHSGTn4LgPqk84gbow1MuLAUWWQ3kqV
	u2ikvR5sxaQ43t56gkCLQv5Bn2iOpjxNxB1VQnp7GUlgE+7Ld96dnQjFPg3rcSmVBA7dK6A==
X-Gm-Gg: ASbGncsCGBnZheY4liClQymMtxVL53Noc5+3d85hj67WsgVFX8JTLH1QsgHVkrR/WK9
	t6mMd3RFw9oDs3QXl+fmLadShZ9QNGIU7DZeXw9qs2Xfws8sovdYssGon+tovLMN13RQTtoReZf
	hJ7B00B9MwzoJnqgMDP+O8OD3N1+QyegoRE67p3CuGEAxyhCKXGUyWGbDbVPMJn29rResaP5WGr
	oTibrLMAYcQdBL0LBaxx7Wwc4iq4ukbDviKFc/expKoOuJMwDo4VFduXn3rzghO/ox+cJt/OR21
	Lgz1+BtoDUUNtYvDDmtHlax2mHVTgo6TKLOv/Q9KZlm1UEDmOI6I908sQEGkN/yZ89Y=
X-Google-Smtp-Source: AGHT+IErer93kOXokwq6+DGSfC4ugUszBo78NJco3EFwM9G1wiRi3El8E+vg0RKm5OXQE67tFwgtNQ==
X-Received: by 2002:a05:600c:5494:b0:453:590b:d392 with SMTP id 5b1f17b1804b1-453657bf79cmr45941935e9.2.1750698783204;
        Mon, 23 Jun 2025 10:13:03 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm118001245e9.1.2025.06.23.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:13:02 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 19:09:55 +0200
Message-ID: <20250623171003.1875027-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_101305_067288_A5D056B0 
X-CRM114-Status: GOOD (  15.08  )
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

The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
extension of the "mac-address" cell from 6 to 8 bytes due to word_size
of 4 bytes.

Thus, the required byte swap for the mac-address of the full buffer length,
caused an trucation of the read mac-address.
From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14

After swapping only the first 6 bytes, the mac-address is correctly passed
to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
v3:
- replace magic number 6 with ETH_ALEN
- Fix misleading indentation and properly group 'mac-address' statements
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 6 +++++-
 drivers/nvmem/imx-ocotp.c     | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..9ef01c91dfa6 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 enum fuse_type {
 	FUSE_FSB =3D BIT(0),
@@ -118,9 +119,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..1343cafc37cc 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
@@ -227,9 +228,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
--=20
2.43.0


--=20


*innosonix GmbH*
Hauptstr. 35
96482 Ahorn
central: +49 9561 7459980
www.innosonix.de <http://www.innosonix.de>

innosonix GmbH
Gesch=C3=A4ftsf=C3=BChrer:=20
Markus B=C3=A4tz, Steffen B=C3=A4tz
USt.-IdNr / VAT-Nr.: DE266020313
EORI-Nr.:=20
DE240121536680271
HRB 5192 Coburg
WEEE-Reg.-Nr. DE88021242

