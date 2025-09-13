Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898FCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyY3y/zfUMXFXUpRJ3OYxoXXX3m+tz9/9uTca/6/ofU=; b=AnLQeXK46QiLvi7N6dHVqjIKQZ
	bNlIb29ntQ7sXtuJhn8f6I86caSr2qpkzC/J0cRof4MH1m3C2JDjnz5Rv2w9odKCZIgS21Lho2gLK
	UfRLEZEJCvTYdwmo56RCJsaZMgUOEFt9fSqUC9r0N5GEuIgSwLtj4335XYma8BQQedAoseu6dH7WA
	FMZjiEMZP7hpE/wIRErQTwewP97fcw0u0m4+qDsvb0v0r9avOBVQmaw+ea8RCXCE7MAj3C1Dgyb+L
	dvItrWIUKqdb9pn6VPzkh17e9JQANDPq5oufE4qcfjkmBL/dWs9n6OW9qM5EtWft2b6vhYJy20l3I
	Iyuvh8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgu-0000000GJkQ-28eb;
	Sat, 13 Sep 2025 21:21:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgp-0000000GJdR-3RDv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3dce6eed889so2684309f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798506; x=1758403306; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyY3y/zfUMXFXUpRJ3OYxoXXX3m+tz9/9uTca/6/ofU=;
        b=V26oCiz+f118fVKFswm1RinhhSQqJB8OIyRm346+OrVpLfUFg/2ZwbXKn5o0yj3Fx6
         TURixILVokKhJrwuptJHgXT92meY3wkHNRH/uuzkSAbZhWnmEHkKYHAcXvEHx8D+Njop
         TJKyyDiXhfLwh/DDccjFBfwYVYYTjx7g0xXd265/Z9j1U84mumTgrRMQsAzlfOS5VHLE
         2ZRSa+3kvEc/snWw7Dqcjk0NoK66zwVjNAxMFXLYrz5c+jSCNzDQamQu3ieh7caaoUU4
         XorjYfUNa6+9wpcEhdF9FzcMW96rIrMKMHqzmSigSNrGDF+o+aVyTTVXay8VVdJPZpbS
         1S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798506; x=1758403306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyY3y/zfUMXFXUpRJ3OYxoXXX3m+tz9/9uTca/6/ofU=;
        b=o1Jfd4Osw13KY2gn7zJVIvY+DC1uvFnyVIvvjkaTWd4860oMCCIEApfc0D8TwlYrha
         f/G8ObLeEhFUfioTMAoH/dwl3pCZQo2JlWbDc9R1cJSemLjuSnuWdUlpRIaH57TCx7xY
         ilpaPqyKv0bgBnDoMpDPzNfQtODEQX6zLCXbfjeSM0NW2hcjIkxwCy9vKb9IgmZ+ys10
         IKugN6XjRaevz4MedZEUt/rx5MO0mp02W/dLJkcEMVmgjdXIXVBxygONZcEEGLQeT3Rd
         0GsPkgYNPhdouaLCVWJHvhhNmiXhKFWDzHhZbO4dI87iSMGwa6K8jxdk/iN5GQ1EIRP9
         +rsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM/z83xdq0oFwMbwMt5q9lYvQD/f0wsCP8JfYuhKnKDfWvheSX2QBsuEaNQh5KESPTDNub8IASVHehOH8oqcrM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi3+EFt3ffekNRW/C6U1XcoeGhCtEym45OZCv7yeGyjZ6uzPso
	Ys+nRJw93t3xCMu3yRUCo1Rx7QVInSfwuHJNn1Zb6ugSy3wgZPLBYLov
X-Gm-Gg: ASbGncuHNDgf8KMNYRscYC69GxUdKJ6tXoFkooy+KH1hDB2Za45JL6V9tuPmJWNOxOj
	glWkC8IRFGRQhYjXL1yicDlC5z4YD51xbl6CYbTiMx15C8Xg4OgkJunmFG+jhj/iblZMp0fCAuE
	B1EVk57fcNwCgegS/KgzWoQ1903JGrk7hUvVUKYwXXtHZp6oVqHrTVadeXw7ecOVU4Uzz54vovJ
	9ibMnWOKEhE94ThUnFwN0496URgR7QfavPnYApk6wCgsDXVVCQkRiTkUlVqoyH4msr9Ex7mpAR4
	2FL8Y/ORP8EZc1TwmiWc4NuJMgv0my9sfqrG6Tfvm2pXNPKcrs3/BHNIynCKKQ1UbeGD0G2Yj2i
	cFyCPKqhCEse2PS7TsCrc9QF3Ei0j9pJrBooYNvyhhKdP7MKgk4dX
X-Google-Smtp-Source: AGHT+IHeRMdY0v41y9UG/rCilo0nlRpcPpVfU8FDp0C5dtOoNsF92GLDoRzILM7KZ+pH0kQfdzQpNQ==
X-Received: by 2002:a05:6000:26cc:b0:3ce:f9b7:4db with SMTP id ffacd0b85a97d-3e765792bb7mr6581555f8f.24.1757798505977;
        Sat, 13 Sep 2025 14:21:45 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:44 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:11 +0200
Subject: [PATCH RESEND 9/9] arm64: dts: marvell: samsung,coreprimevelte:
 Add USB connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-9-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=UoJNCWjZnaplQXJr+hNjiSMuZ5Y1BK5iXqLcT0rH1m0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/i7ZUddnNcm6NX88ZzeqdVLopceTHzeyvbQ4GbZ5
 PvaH7PaOkpZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiM30ZGT5cnORQud/ucF2i
 9XoPuY3MVi/3HmcWv8LkI6p32urQvgBGhgtbDuqdMI6cvOB80Kwj50vyGvdPfxFbJPvwiQpTp6v
 1H24A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142147_883337_3605C320 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add a node for the micro-USB connector found on the board.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b3741389e2ae056714ff4235b972bc72b5560455..7c96eaa33b1ef0176811f3b4d915ce1a69cc690b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -68,6 +68,12 @@ muic: extcon@14 {
 			reg = <0x14>;
 			interrupt-parent = <&gpio>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+
+			usb_con: connector {
+				compatible = "usb-b-connector";
+				label = "micro-USB";
+				type = "micro";
+			};
 		};
 	};
 

-- 
2.51.0


