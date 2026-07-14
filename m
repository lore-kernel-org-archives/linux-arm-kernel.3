Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE6CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=; b=GBfCHZPOn2LsDxS3n5PXm+5Bpc
	LO/qdvtevv7c1cYqTuQivn7oEHax97aeapwe92xGNheiUFKcs9oC7cR9pPkKCL3+HmLWFMsenpgyV
	T2Me9J4MDSJUPOMNwGFXECMu/5+bctwAAV+3eaBQ8DrcXHl77dBBQixXLZsxH8lP5Rq9qCYtu4zU0
	W3CebqggnZhi1fuUushhAOhh+vaKWY8klM9EQtmfRucP4s9kpM65wtUAxK630ybr/+NUqwK3IEDkA
	ONG4MToaCEdBazv3Jv9QX77vjAlL1jRdoqzMwM+swP0ZheXHdVsKsCilWBXBreI5kcUtCDJTgVrZu
	kCSHw9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdG-0000000B2Hh-1l37;
	Tue, 14 Jul 2026 06:28:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWd9-0000000B2E0-2FQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceab75934dso30061205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010515; x=1784615315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=gQ1Rd7PGPJZuCEO9hKmYgR6r3yJDTWc2ldOlmnnsYXm4pD0QV3p8Q18qfbK48X4D2n
         Xx2+vJJKU12p0OERskOoJ7XWn3HZPPwTJgMQChXITcfFLxJnjQzKErIzxEWBQOgfx6wl
         z15Qvfd/HdbFRzG/KFZRN2gIwxAOxvrWXNPU22cCKfeZ3x91PLkMUftPAjESRVaS09Pu
         YEcHqaGRSF3vHJpSc3DFpHJueKGCHjd+lWeCxmTDWyU7cOECr2lvHqEsjvH5seIdDWZg
         hp5cYOoS5IQIQTQpd0Ka/W217ewaeKhFjtrS+ai/PckbHeuyuyBH/0e5TR8agT94gKG3
         SWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010515; x=1784615315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=Qtw4HRyOzyNSb/h/FgAfT9M5Rn5DuO/JtwlDsz10MTg3yAhwHbOiXlzoozoMki14bW
         qj+gxqwYk92Zv7KOKi4CMzUun7fJNWGhgrKwFHE6gBJg8d3nmAItNcPgzEYFjfGHMVr8
         z0Q/SSrYaLkl5wgvrXYzxTRjXlp51fntpywDjU9rjxWL8DBjTrFkF6CbAOFjJ7aSazQX
         XhlKu9Y/2i6tlUbpkkh8wPnr+7XBPi/aHW1YxuIKJIOzK+6A1Bz3k1/3viVU0oCG41SK
         CAEC5nWDqwAmNKGMV7F+Zusc7j7Wa76js2bZf3DDRZ/njZGVcgfBtuDHojf92PWi8+g+
         KxKA==
X-Forwarded-Encrypted: i=1; AHgh+RrTsIxVqoAkNXBzG3zH5IBVS9LM8nF8pN/WGFU+5CZAGcSg9Cl0SQt+gipkjM9KC6md+wPLv4xKtXr9eGU6F1Qo@lists.infradead.org
X-Gm-Message-State: AOJu0YyFTmJSgg3otYT+HjFibLnQMH6SWQ0gFpxcP3lE4xoPotkdrVtd
	QhmRitn51euritKX0jtLcMoM5tXF1g5E+PelCShKW8rTnS9FCA9F6r/E
X-Gm-Gg: AfdE7cnwlzwSQRN3Q4UpvqDJ/8iXe4KTN6brFclUHF7u/c4/STGAw0ei7Q7nsFhIKZC
	31EKTQujSzmdpOfHRkmlDNDd6gtVS4J3+PvDwNRbDsN5qvCV55R72tNfsUgXCFAW4P6nmNwu71y
	wnFCmxb8Q4zDcD1XKCzEk0DgMQuNipNT50Z54RPUP59RwJOmF/QjEwB1JZwcbhAxkAlpfpeOiVv
	RE8CgXCGA6SM+lvITFiBkMMwy+Pw81nyeWu5ynXivwa8pII9g9pkch+s3qxd/iIoq8ylQ5M5fZ1
	PHE9YiQZLEKG7QwASWGdlQ2JwEhk2/kROxoI4eL2UVTJZ0hNmdeOztb88WwJpDqupYLuuBvJzs9
	bz7/SByF3ajE6jzwS/QHV9Qy6mfujh6aaFp4Hc8mVZCdxa4+PILTppPzx/fj3agNLrCU4jmzWLg
	Ur3Om4VN0O8i1GL6DnGC7Y7/ta9Jo4QwwFW+mv+5u7OvfyqGG86udYzefmmmSkTFoV/CVjrZ86a
	BPQffGnvWJ9Fj7nIY5PlreLnFhpJsiUNXenY5JgLT3OKleYS2q3T/CulhjCEVv0
X-Received: by 2002:a17:902:cf0e:b0:2cc:fa08:eecc with SMTP id d9443c01a7336-2ce9e9a6f67mr116750585ad.10.1784010514891;
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:10 +1000
Subject: [PATCH v2 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-3-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xn2GO+oUtwUPDfxJPsqHbZ7FXUVp91WfJrde0vt5
 EyG21zfOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9s47hv8ePw0tWnA88ztt+//J9hQ8JR3uaCzP41+9U3qSToBzBkMvwV3LThsY
 372YILlXN7Yh+XRF5V/FY3uZtOusY7F9N2mxvwAQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232835_588414_4A362CCD 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..17db8d7a850c 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0


