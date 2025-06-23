Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF7CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=; b=vyT2pL3jqny5Tdo1/ehU2yofp2
	OgarMPG+4If3uy/k8irNbFbhALN1pVlYDErbWohouDCm3k5ZCR1MDNbk52/ovpgZlg5j+O2J+P+7X
	JBI8XsS9mxXmjM0yj9wPdkxW0pGN+mwqRg/+JaGP98qQ9G+oq+xA/q/ZiXNEdm6l8N4fXFhpyJ2dX
	0dIXgtWK9l7Q6VcJ654Yl0sB/6uprM/UfWiz9ySH7p4/wN7cjvBNBsxANmOLeeskBUFZKS22VnfKs
	eMladWas+byZ366GOvJcZvNP4YOustLnwd8Kyolpdw1E25DqEjA7r8EIXyP4qz4l+ZHi8+szftA5l
	cucqJbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbM3-00000001qCf-2axe;
	Mon, 23 Jun 2025 07:12:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbJ0-00000001pvS-0FGJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:09:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450ddb35583so5444985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 00:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750662564; x=1751267364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=N8xTVdwxyiOgRNWsC5VMoZNSJ+liE7wWZp/0mNjgNMcYKo1Al6dTEWIaOHTezBMQdo
         g6hGQae/7HHriqJTfVBCq5zYHyH3M0fagTbzFSjyX1YBSDy7onlwFjyfDPiHFVhle/z3
         xnDLylvq65xxd3AplDApL0FhTldkhngscWhILsgEqddi2RauPw/HUSeNGKIVQ9pII5lN
         CTDqinoVQWJY3vz5LlKkd1A5+J1jwEkBrYkUoVSZoBU8PqHUaMt3fNKezaEYhvLxOCVz
         Vu9wanvzTElXUULBFPPJuc4OojeKoSVqwCBIum8DWnM9frJxOqfuGcYbKJybokhfO1iN
         OjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662564; x=1751267364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=efCWMtIWGZDUyW18/onBOIkdwIrWgSoPrqyw8/rgJKsEzq6adiTacGeE/kt+g/3qrS
         etuOiBf3j2L0o+VCP45aG4cdrhiDEx7jrS8pr9CKZG4kDQazJ7OzOGn2qm9RHkNNbyYF
         VEJ8w/0qoaY6eeVpq8izLUR38KO7UVnJ9ei52TRSLBRwjdRXctJnHFI+bHaWHTXDqDAV
         t0P8m5NNlWJC9w8rGL+fJU5FwHnQhQ6h+jREyUyrUvYPkXijE0f1lIyLefqZ5UuV6CQC
         1l3bANx+y+pb4gewWezrvaEFjBeX3hwY4sZ6jCvYz4Kk2QHMH3Qb9E+9xdVoOZOoHejn
         /K3g==
X-Forwarded-Encrypted: i=1; AJvYcCUYbhF62HxPn0pSdlSZom/GDV+38xbNOpkY7As5n0tedn7GvzSNVuNPvQK2qivIB8Z0wY4JC9j5YQyX7c1N2VAP@lists.infradead.org
X-Gm-Message-State: AOJu0YzQTh4KeIPS16QDs8HquDYplduCp0C9IG5FRE6gDoWhLh8Tfej2
	VOXunSIUE4Dk3OgY/1DNQYaAd0bhN1QMRtm5oh0PbtVc5J6WR6eh3EnZSq0sGXSY47aZylZfdJp
	J9+Oss+iBK368vZwYIBw31ffMd0EuPyXgZa2rkwBHMFwZeG8rnNyJmIfUZXnmfhZFy4MqUw==
X-Gm-Gg: ASbGnctJ3yIqFEM0mpKXUMIuHYRUsXW3rjXdO7+qWGamSqrdMfjWrJ96lbFptbBASOZ
	p2xgX+5xu+8olyDkWXnn4aN7AYspVJbW4KBXyo+Br0ibVYvFWNEUHam0sA2IRcd7kOBeJHvY9pz
	URvJn1IBD631XNeYpkrp+E68BAaeStHH0xTx7uiCbirhBolzf+Ika2lfRMpl8mSf0tKIms8PDEo
	jf21YG9bdMA+eyEgH3CzyIUs+uQS15TMZFldWsh9L7cTDW5LjsfA+e5N+VbCggCAkYOkpe+O1cS
	cQGQikAex+PuvxIcjtHG6b/0nP2fINr540maLs/qYinoZVPGO5HhfTdPOh5AOqWLdgg=
X-Google-Smtp-Source: AGHT+IEI5NpQNUMy1aJAjdYtizFyZ4FhXhpX1D2RY5hWJP9EHsy+nQxupmDpC1IL2ETakmaeoEEB8g==
X-Received: by 2002:a05:6000:210d:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a6d1319d8dmr2308687f8f.12.1750662563989;
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm102070475e9.1.2025.06.23.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
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
Subject: [PATCH] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 09:08:49 +0200
Message-ID: <20250623070901.1733755-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_000926_124708_7F43E183 
X-CRM114-Status: GOOD (  11.27  )
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
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
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

