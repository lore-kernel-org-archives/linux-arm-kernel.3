Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0541F94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln8CSZ8Zjp4CpkydhHUfH+wLZviy2qiJkheYqbMUKrY=; b=GvK0bZtYXZToa0lBnWY0CUoBFI
	JBkeJufuv4CrtFDey8QueKPnkhk8jW0I1acGBKgNJyvHjlYSMc01uTB24aCet0uv4zgM9FcTwMbbM
	p6GcPBw+teolsnnKLZ8MFMklQ0n6OGJIW+ByG95IgNajNU3qJ1842G1tolwQQdYW8UdgO4FQ5Onub
	ZvPL180nWxoAtJVq7S9LjEYosMRQqO2XCjBnYIAHMHXrDVUqU/a6//mOdfKFLFh90JgROH/8zSMrs
	QZCa1LkM6HwmeXLbLySxndbYTXfazXfylIXF1jbDxS9n7ak/2wYFks7Z+pbN61GhCe3NrB/nlu8Sr
	ZpgSGiRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHe2-000000097yY-1p22;
	Tue, 21 Apr 2026 20:24:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHe0-000000097vy-0X9D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so33945485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803066; x=1777407866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ln8CSZ8Zjp4CpkydhHUfH+wLZviy2qiJkheYqbMUKrY=;
        b=ZaU0I841KDdk7gcwkA/FYvo05gdw/Mmy4wClLpKH3+VHhiVeD7ZUPUXdDz4sUynm26
         aLMQPrW2VldZO2MEOxvB3ofxsW0ymwMP+0XrvFPRA4BAiC/nHvtUUvUvk8B0VviZ46/j
         RO6aHdd4qIDe4SDobCbMkW50Xob6mMJoKrKKgXW7WQGM/YroOQDCxOl42Yb9h1Fd9O1w
         mEB42ZSgsQSFVRN1UAp30ELxUUbve3oZiiCZ+LxQ/cXG3EnU+l55Fu9M01srEFAsOf1S
         IbKmgwFQlXa4YurVn8Tdk3Dh9xDDkLRCDG+RT2XVcjbJaB5r32Mv9yV67a01h2v7lHVf
         w6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803066; x=1777407866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ln8CSZ8Zjp4CpkydhHUfH+wLZviy2qiJkheYqbMUKrY=;
        b=AfZGQczUzwqjrTmRtnvUGMpzX6CrF7D1nVrqbqEgK23Njh8Rhhiph1ptfVIChCVaBt
         tGVPHJKG1J0aAraUeGOL1LPx/S9l5pN6ezp/ELS0kPtY4bxTLadsygmZC1+IISUErEp0
         FsFfcEiY0Gm3qKGPoVZ1O5U0JQZpq5hr8VkFa2QNt8O/1kNfUNG5eC8mBuZgpeEk4K2d
         frkrwmLwwmpAVEI6NST52s9q61Cue6nA7z7jRB6389fpn8uK40u8S3WMX5k24k//sFAH
         SLiVAxW5o5KIfT8RNCQhcPjZXwFaiWhW3Lff43JHjqrmyxfcuzo5TNmUulHO+VarG/vo
         bYzA==
X-Forwarded-Encrypted: i=1; AFNElJ9zuMxEJlkfeWv+P8Xv3wbPErjS0gOSwWLX3QRmvoiz5V45x7N/OPpBYC1t5iqssTJa341zhvBQ1g618aYbhgpD@lists.infradead.org
X-Gm-Message-State: AOJu0YzrDWqwvgJFVjnHLDTDTlkA+Q7GLbmbCvr7O4F/OG4BZ8DO1CWx
	LLJlVF1kd3KtaI9TDDMTItP+Pqv/UQIh8IBer5EQQr8VdlKYcZJ5HTA+8vm69kCzvA4=
X-Gm-Gg: AeBDieucqXWtf29VA/Rj24n++MaUTUqtTCl4GgQ8ac1H59NuYDCM1sx0CGRAshOfPlp
	mzvIhscXFho3hVLxHQFYdqKoHRb6T0T5ro4hGg+QvT00mbLIWYXiPXMn1cziSDWYTPDbymW5Ie9
	PpveRvMkwKwFVWUo/7ICCzpoz7fTD7iePXpsQBIxM4KEgrX8hasSf5WGOodrJWr4IAULKPc5ENI
	tHdG6BIWVhdWqMd+HeIotVNHoReE/vmhszyebfvRlgeswah9sOBSjUgS0JZOoRf/3la0fr+wWWA
	WGQJLJBwKdmQlEppLZdSz71S0lH1bkWfB0AIj7WVpXHdvjDj59CbLNwrTsFwVGy8TqzhiLdb0z2
	NrzgOlWdMxmkGV4FR7qfSxbHr2rvRDM6IaQ5h0JwQS3QRZhTLRVHOkViR2OPfXkPzQppRDs6FoP
	MuROMsi8GWqNfymZBjud7uRErQbbq6kKfFfwBDUXoJw+fMowmul8m3u5c=
X-Received: by 2002:a05:600c:1554:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488fb77810bmr289995225e9.14.1776803066229;
        Tue, 21 Apr 2026 13:24:26 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:25 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:14 +0300
Subject: [PATCH v5 6/8] amba/serial: amba-pl011: Bring back zx29 UART
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-6-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=AZZ3BtHPYsdTJleQOEnSYeQu81ZAvH9LguAUd+n0Z5M=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXHYk8QOPpNQCe1Wwk6mIgsZ2Nv+zsJP4PY
 KWIaQ2iFOCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKiQg//Zn2a8aaTZQuSyt4cwOh54RlDf15xzdQ
 txtA7aqXssFF/JqZI7GOWW8JhQFJ7mudZDNWHj53GnkJ+N0efuz+vAmSSM0WzemjCIOv/AjnQfs
 xM1HLgxBUk+iNuV1IhoEZXRAYHi9kPaZTyIVWJwOSaTK1p25+oHaarMzaw0ha2iuHPDm85HX8Qc
 pjo7Z4HI7M1cBoHAtMUZNQl1wX+H7QACSGNczRRSUrzBm3N2eieQDrp7LGTCwMKKkKVqQ9EQmSR
 2RhVVi4qrzczHyTKhay88YorRUM7oMQBMfmtZ99qfNFpOjEG9P7f8pXklKuvIrDLW33fof3b54U
 ScQCF5mFC91rEKZFKsUyrK9inaaVV2+BcnvGsvC6uAnR27SNUYupEWKDo1LfFyKwgIc6uYWcfHN
 ATJP3//SliWsOvAaJOt83pn9Ehw1MiyPRjXpP+bCJFiIzzy148+Xrxu1pcBoE2PVa5OH+uuRXeu
 dyRui4+9dHU3z1/VY7Bq3GelKMFweEu9+TtAUquxeD//hrOfjKwo+TU94YQxI69V6fGUFm1bp5F
 yFhtFMKOnxda5r5rQW0WMIKcpI9B3i1kWlysqUnppG2Es8v1fSopis5Rq4jfkBCi6RTgW4gA6MV
 vSbrrsbXxHTulM9noIeSe9O+3MpHrqXMbGmrnpaBcFBQvEultgIE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132428_210896_ED3C0B79 
X-CRM114-Status: GOOD (  14.38  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0


