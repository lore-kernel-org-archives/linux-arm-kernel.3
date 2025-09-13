Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085FDCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpVtTH4bHBYzIxiNrmk9dugn8tPCGekUmbNjeMCfqOI=; b=yUA2aDPK4cgLXYr03tW/bAElHW
	LgkVFowrl0S+FsTLzXQROrGdFwEsbAOd4KqdZEG3wLIe2JCI4uEX/Zr1E4Jsc8pb7KV7WcinIKnpp
	70OSj+hQGwoyMxdhAa8UJnH5naZSZDxwlrzwdYR7Pw9CIQD0G2+NBLa9LkB7tYNdtnI+Vh4/t2Vqe
	F4CE7YIRNCmhgpMp87UPVeZQgD211sN9wpeOPyFqQkA+E3KZ63o6HlJ2XPi6Vk8FmC2CEaUrnfmxS
	a6oBrY/WR4yPBya0oq4g3G6YxWeHblSdVoOENnHGlz7h0bOoV/MVEtpz+BjEdmouZyiV4E1Be/mOd
	ZCdU3m2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgt-0000000GJim-2tD8;
	Sat, 13 Sep 2025 21:21:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgj-0000000GJVW-20t1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so356477f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798500; x=1758403300; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpVtTH4bHBYzIxiNrmk9dugn8tPCGekUmbNjeMCfqOI=;
        b=WaeVSvHK/6WE6jIH40OaD4l6eRX5ezDDma3jPR2FNtIEz+LooKgx/46DAfs30oSSMh
         5siSHA5P2ftoNKUpuxplSw6tW86MGGHh1Sgk12nGLE6HyujyfxSYaBMcuVvG3qdtbZg1
         NBhNsTIzdFoL7jICw/NWxmFl9C4ekOWuEFAzFQu/uAhrIaTcRCZ0VrJh8jyQV1hFveYH
         qJz59k0OfVPdYW9Piw6T8OpTdkK6O1glntO6IiI/dzDz+6YQN3n5gUwJnb+Y540EoTWC
         wTw+biS9Y/U9EpLOlpv95blkxArqe842q5gGQeNcwotVaHWuZOZV33s8Pov5XnflMJrY
         jnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798500; x=1758403300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpVtTH4bHBYzIxiNrmk9dugn8tPCGekUmbNjeMCfqOI=;
        b=aNOIAi1FLqFhvfZZALozRSjlBNtJlKk7txl0Wm2EtENDa8AfVeF7DgX93/SiIMgSES
         CLyjsZs0pNvnejY0qsq6dmRRZvWY8C1Pj2sOim0cJPTeqVGChF7LJKP7QLiszx+tS8r7
         T5aUCVv2crqWzedYvsm+fkHjrFJD8kyCT3+oA9cfphqX/4PvtIOjMKW4mgsjgWm6GqKT
         uWBXpyg6GDdMf+gRypmTfmX4awI3NPirFkr7Ltls71TRikCDojtm04fTrM7WUuAjRUrz
         0Lpd/WiQp2of2fBSBJtTepMuFENo/wYOK9W/wMEwBZFIUCmemHv8eWQoNHFhxDHcgNgd
         44QA==
X-Forwarded-Encrypted: i=1; AJvYcCWBCtOL1IqKKUKqypsTwsriip0oEgUUXuHAcKNiOJ21dO0eBuLNj0ljxsC9aKV0sH3/TUA7uGfU62T9eTyyYfOH@lists.infradead.org
X-Gm-Message-State: AOJu0YymEzXNtna1x1iQgOa0tMc2kEqFMKcvOIj7WvUzVyRy26vvSHR8
	j2dTh8dUm3Qxt4uAk9hfNoV9t7Mhs8l8/DcPMhfCmGP1cX51CZZQasyJ
X-Gm-Gg: ASbGncvSh/Nmrotc+IiaKvRcLzXSwK/uQY5gGllWmGs23IKrdNbiDWqVjjWMG+HGhp8
	E1SA30ApkfJMrgBiZNfCHZwCYOul0ZSqhAb90sBMWFYVVFBEdxZs6XrqwTsm2FxX2d7xQWLl9hT
	foWquKAMZE6jlhZQS4FOMCyGwhcEKkFAYYjKstDpDQMCdlE43DiGBIIynljEObSORx7D+Y8uBGt
	zRRH4h24iA98IE3t/UWSK4yXNrIulQMA5bM0bOevmm8sZ8xxdPoe84/8gICaRey8EPlbA9p7UEy
	aoBio1GgPH9FtcMfiRIvAr4dZYQjpORKEDiu4Fz++5AxSox4Le7r8ef8XVbazd/arx1yUstcn0B
	9r7c1fDeXEEa0vH8XOSiO4Oob+djNLOSYCTcwDAMwhTScyaaA0W1g
X-Google-Smtp-Source: AGHT+IGQbeLuYMGr75Uv+t8fAINg0m32Go0SXPJ3x4GDoXlXLUXrQPT9iD6lPWsbNXLMr0iYh+onNA==
X-Received: by 2002:a5d:4b02:0:b0:3e7:f044:2860 with SMTP id ffacd0b85a97d-3e7f0442884mr3036887f8f.7.1757798499546;
        Sat, 13 Sep 2025 14:21:39 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:37 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:09 +0200
Subject: [PATCH RESEND 7/9] arm64: dts: marvell: samsung,coreprimevelte:
 Drop some reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-7-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=AOTuIRkZ7qxukusobcqK/hGoYlqb/lfC8O75aryw37k=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/iHWezr+Ji3VcW4KOXAtNRPH1Ked6kyHNpyev0K7
 ZI7nzLXdZSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBEvrxn+J+u/WeDhUtCgUiZ
 Ae9bk/sdh/Ofbw7P8H+yrM/g89cdk28wMuxnMjui4BTafcogPXb64b3WtlFnE26FcS5d8PHaod6
 DmYwA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142141_538838_F8820C1A 
X-CRM114-Status: UNSURE (   8.20  )
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

Most of the memory marked as reserved is actually usable. Delete its
reserved-memory nodes so that the memory can be used.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index dc58b19ef5d11c69f52ea7804323fe2fb2257ca7..13a726d86e65ad836166325e0958a6ec3e6d022e 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -41,23 +41,6 @@ framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
 		};
-
-		gpu@9000000 {
-			reg = <0 0x9000000 0 0x1000000>;
-		};
-
-		/* Communications processor, aka modem */
-		cp@5000000 {
-			reg = <0 0x5000000 0 0x3000000>;
-		};
-
-		cm3@a000000 {
-			reg = <0 0xa000000 0 0x80000>;
-		};
-
-		seclog@8000000 {
-			reg = <0 0x8000000 0 0x100000>;
-		};
 	};
 
 	i2c-muic {

-- 
2.51.0


