Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018F0C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=; b=vDyDKrECW0S+YfcYlIo4iMk5h2
	khx/G5ErbXkGslBEnhFXY2zLHMb33boQaKS1tgMOShXtjVK5Wu4SaOm1rtT1wtvT1+vUWyBYCEzmZ
	4soGO8FrNOX3RAQV1WmMmd8C0pRsiD9f1eX2VRkEjiUUkPIXt8cLGRqSW7O6EuJbU041NJPw9wlc9
	ax/F8iWN4r6F8Qr4RidXhZMVCEhp+kLe1wcglLxCHyYNg7j+6JVYJYrqeV29MMv9MWuVgLzalEEeI
	hEJtZh3ldJDpMSlXVhDxSFyQwm8CTpnnknd0Ok/g7amMu+nVDxqNoEy02bffylkHZWpitjbwQn1E0
	01MTGLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd5g-000000026GP-2fvv;
	Mon, 23 Jun 2025 09:03:48 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcms-000000022Xz-12eQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 08:44:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so736920f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750668261; x=1751273061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=TlQb84xVf8lv7u4lPDvD/E83oCQJ9f5SjGrIxvQ195rqtHMsqTErtCPrV4MTlQmCFR
         YyADcO5ajSVAZeAsXd7RYwCETp1ZSd4y8WRbMZ183fr6urcgekuQBMVqVvh2nXkpWxXy
         sW+0vSHcbPE9s16ygJq27UTUD1y5dMl0aFRuR8AiLhhJRKvl4i3eHR6SUjybd+5k2iP5
         tB1TYTNPtnwCDnu6BiZOfRdizee/FIRi2Vdg8tUE3T4C0Gi8hotumZaALP358oCHhNg0
         n3Ps1sx0qzOURKzpaJV/2u3IRf2zWBxkNN88ef/x5t4BugDpkZNDamHja+T7hjKSDSaN
         qfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668261; x=1751273061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=IFHnU2xhY56g1VHUcrd8If/Js4A2kLUuQ9HkTsflmcCIFneBVLeJYPYAh8ZAxsmltL
         pOVVv4/XZhWNwSx7FQWe6/HoG7L5SK+BXslXE1CIuHpq09zU/txHZl9FQ8z1rvSzd5tV
         vpj75uLp4i9QAsveb5AZC5uITQ6C0HoVgTK2ccRuBOb8fhTmF3en6+JV/2LH9rwnuc8u
         JSRl9iy2hQc2PsJbAi6yL42l0KHdYSXmDxi43TxaeCu9aOs/OVERKemaORi2MwPA0bFU
         Ax894y1WdR6axwoy93lDRb3SUDm5rkF0xXDi6RRQRxISJj7gFCUvLI4dST88PO09iAeS
         rolw==
X-Forwarded-Encrypted: i=1; AJvYcCXIPUibGpF8f8JHw5/sRdWZDh1r2C9UjsSyaRfiGpGkU6o7W5c3vIblFuMBJ7pEGHaCscFp0JQ4r2YENUi9T/ng@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpwc4y2PIZi5gmRFtVgVaOULiGnOTPksLGfwe1WovJGDplCCL8
	WqSzSNTJy9hv2lmo6WNZKaEcUHIEmoetvS8gvU1kd1dbiSRHA1Se5Kes30y6v5JzqTDHgWscmuw
	lIeVfkSAPq8kpg/DBFBt1ldbM8BKSc4FfqzXxeGQNyfOOPbeVt04NxjvIQkeY+awf2q0ukA==
X-Gm-Gg: ASbGnct8yt1VGS0q9eWFXcWgHCoE6EmbFQQtec1JtRgWAVpZ5pob8MeHyMZFUeu+0wd
	tqwVkJD3fYoKw8BSk66mI52icGOGur4SE/pPOCg3BVf4XvO5/7vxYVhbHBS1VmjC6S7+WiE5w6j
	HWoT9FtZVfVHDeQrzK/veVqhTKJT54kjy1+5JwH4fUA0Jz6LbntzHriKWaMOvLvZ+pn29/5eEU9
	0CnmbaofeIraZTuVVzPi1FlZ7gB7vbLKyUyOi8M7sSLuNSBclrE9htnzf1YHbytgdqn0l6ude2E
	++nfEsnDVuZGAO1Nau3lDCLQ/2GCIbRLGCXqZcCl5lE+CDt/52j/5td5a1tLJkPJM6+8xSauecW
	jSbjGakiBzFZuseptqhk4nQ==
X-Google-Smtp-Source: AGHT+IEWhvT9kJ4u3LtaSyEodBMjwnY5987G/5eQkLBt7VVzz2bNjSEBbmFEI7Y+I6ci+DYcirb26g==
X-Received: by 2002:a05:6000:220e:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a6d112f3a6mr3539913f8f.0.1750668260596;
        Mon, 23 Jun 2025 01:44:20 -0700 (PDT)
Received: from steffen-linux.. (p57b79c3d.dip0.t-ipconnect.de. [87.183.156.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1057esm8987316f8f.10.2025.06.23.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:44:19 -0700 (PDT)
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
Subject: [PATCH v2] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 10:43:45 +0200
Message-ID: <20250623084351.1734037-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014422_290613_FADCE364 
X-CRM114-Status: GOOD (  11.41  )
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
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 2 ++
 drivers/nvmem/imx-ocotp.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..3af7968f5a34 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..63e9974d9618 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
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

