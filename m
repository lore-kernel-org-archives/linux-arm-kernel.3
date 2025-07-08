Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gmX1zBN33lB4gzLUkNPqUBTAn0Dd9jMDbw1KtlNeu0A=; b=RlzYQo/CZ9VkvnN3BceXc+ChB9
	4M+mzpJ/3jC3RRhC2Bb8VXiw5oDw0sHjVrJdvKMo5y1ZWMLPFVEU0bhiMAYre9+KvnJYn1BwuTs/V
	5Jj5CiRAO4Iupv4WHn7LB4+1nihXanixOyUlFAiEvQAZwe3uO4LeNxSyHs8Qe+0bcsJp+FLeT8r1G
	fPKHC3I/6C8gcS6eM/32Pf7Ajo3AL0NznIi+A1TxzvtJYIkjZIJnjBIRPWx8rWHQ4zHcXOue7r3ln
	8BL5os5iCC5G+DWbPT+KzwvdCbvSf9GuQmSBKV/qBRfU3/c5MrWYB6i0EolvTfto+hdwHkQl1YN6B
	V77VCwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5es-000000054yA-0kn3;
	Tue, 08 Jul 2025 10:34:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5JW-000000052Ix-38Ls
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:12:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso607418f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1751969557; x=1752574357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmX1zBN33lB4gzLUkNPqUBTAn0Dd9jMDbw1KtlNeu0A=;
        b=EYgEbF8rFWURiZu4dVlsy22fOhayxsPp0arIF9MombO6v5K6IfX2WiDx6gvWUip8+U
         qPvrEdJq4UxHMCOp1xbpgrnPXsOBUnf5K2jcJEt3Rz3MxdV4AUqp9T0guNjCgR0NapkL
         QN2m8nZIIRSL9etbFce7XrzUVcvIzx9YkyJfbQBWZULi0arH6by5rtPEgrXF0/2sZF76
         BeQoRQKm/tMlM8GH6+j7NdQSntPggJ96Cw2I6kdOEYsUeSyjn2noNoCt9Rq7PJCUorr6
         p4MgojDMZmsb70SUddMHHjo0rogfFKccAiIcrk6kG5ucmODCDb8/MBQlK53nhcRB29//
         HNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969557; x=1752574357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmX1zBN33lB4gzLUkNPqUBTAn0Dd9jMDbw1KtlNeu0A=;
        b=o7Tx9DG3Pov/GY3ZG4Ms4nmfnMKdsL81XfzYAenCVFRUb9fG8Pe5BN2UQE9nYq/WnA
         MV1gKQqhU8uBTR4tmO8BZ/LSnInSMOI4HgOAJwE64xT9EtyQpbMCsNzIRQKVGdHTaa7u
         Nessg/0bxIt9j+oHydZrQFjcSRdfLpQkCox9E6jB9j8U5slchT1M8Nb1d4dJe7lOnV+I
         V6OWznydmjnE3xGTfZlX+E1aJ+f8rKywLBI9UDb22CqAyrekh5GOhxSGlb7NklmI+dQO
         v7E9hk4WH40uFwPL4ayu5rG/u9xhftZ721R6K75rbUkWibwXu8+W0nh8BAk4wx1kqaw5
         qHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUk+Eq5JE57vYTXfqxPrCMn/LyOB944niQmiyhqVuHfgX4+9/vt+jvhqTKrywRnS029JAhkvtlNWKVsNWMWZwp1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3NFcO5GT/rWiF5AekLbFRQFSyH1g1ugr9yyskmDLtoHrays8V
	m+WU9PmUz9Td8jc2cpqT7k9llvNxyq1GsOGgfwFHXcPR6N7Bi0fwN/e/MhgFbAjLvxQu7Z9QglO
	E+00UJjCMVWS8z00uqvUkCRiTRhGF+DE37axgiOaJFStYt2Gsf5NmFIL1jPpZ374qm4BsVQ==
X-Gm-Gg: ASbGncuX+GgEyemat8sidR/PweCrZkWukH7HGOPdieyyhty01mS31uvCSAUDauAyMhb
	H0XlaGmFQPfHiAmb0zLYL4TKEdl7qLg0qoyPR1QYwJs5oSMzsE2fyxbUG3Bem9i6gKUgZovhjt9
	LfxesJ/xQD4J6rxTgvAoibQo3VreSqwWf33tHbQQgVR+UIgljHULtzT+2Alz7r8uVratahiTcuR
	xFhXqehN+n+ve3NuKOkp9ZcgP/GzV1WR9PKtsrveFAXfvZf24xaiTG39fntJbTCVQuQ11XFfrwX
	x9tvq+XS1UqqB3afuOicDUOAEwW9JUJWhcUVbFYCJAUNEiya6AVafU5uXwfI+AZsjF5Av8F0UYF
	0jGZK+1N6V3+CHBgjlDtTwg==
X-Google-Smtp-Source: AGHT+IED26y+n9j+5pBqdocpELjkLG6eOq39ZrvJ+qRhatVN4TQ5wRzgtBzDH16tDXGPwRZX5wMJRA==
X-Received: by 2002:a05:6000:310a:b0:3a6:d30e:6fd3 with SMTP id ffacd0b85a97d-3b4965ffca6mr4118923f8f.10.1751969556510;
        Tue, 08 Jul 2025 03:12:36 -0700 (PDT)
Received: from steffen-linux.. (p57b79c3d.dip0.t-ipconnect.de. [87.183.156.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2e8sm12558121f8f.75.2025.07.08.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:12:35 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	stable@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
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
Subject: [PATCH v4] nvmem: imx-ocotp: fix MAC address byte length
Date: Tue,  8 Jul 2025 12:12:00 +0200
Message-ID: <20250708101206.70793-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_031238_854714_41C907F9 
X-CRM114-Status: GOOD (  17.74  )
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
of 4 bytes. This led to a required byte swap of the full buffer length,
which caused truncation of the mac-address when read.

Previously, the mac-address was incorrectly truncated from=20
70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14.

Fix the issue by swapping only the first 6 bytes to correctly pass the
mac-address to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
v4:
- Adopted the commit message wording recommended by=20
Frank.li@nxp.com to improve clarity.
- Simplified byte count determination by using min() instead of an=20
explicit conditional statement.
- Kept the Tested-by tag from the previous patch as the change=20
remains trivial but tested.
v3:
- replace magic number 6 with ETH_ALEN
- Fix misleading indentation and properly group 'mac-address' statements
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 5 ++++-
 drivers/nvmem/imx-ocotp.c     | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..7807ec0e2d18 100644
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
@@ -118,9 +119,11 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		bytes =3D min(bytes, ETH_ALEN);
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..7bf7656d4f96 100644
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
@@ -227,9 +228,11 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		bytes =3D min(bytes, ETH_ALEN);
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

