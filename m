Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D4FCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWd2b4T+HmUToKXe+DhMe4fckX1fCVdutnchyiOuReA=; b=hkkVNWLLdJ+14dBODXhxvc4TiG
	zfhciLpE0mGYaL7ALExcxbt0qwGPLxljOpha77gAoXenmSP+lh+J58qEtlDI9XwT5kewgUj4XkQ9r
	1nT+pTNXhXLuFZhccEcIpVRtC+9aUsXMU4FUGu2y8OFHO/R7pkLQg7F2s6KGLg5yJa9tPccn3nDM7
	RvWovw0ndc/jj5coyf8nmT+QVchSyW2v33nrb4bFCnz2DXxEhGcEQ+v1QJNNEhyvMtNbIh6rSOvdm
	kpJuJ/UgX3t2AZVMfWgZ0nJJ4Hp9K1xIPjWofcMXT9rBAm49igJ2Nnuir24Axz/QRvL7KkDU8hSNu
	gac9QaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgY-0000000GJO0-32XH;
	Sat, 13 Sep 2025 21:21:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgV-0000000GJM5-1FtA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2045882f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798485; x=1758403285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWd2b4T+HmUToKXe+DhMe4fckX1fCVdutnchyiOuReA=;
        b=BeMMF/U3tqk5CcS6Q/rmvWSuZT9imVS/ZOMowTgKlt6O1MRSWIqZbkhtk5IdLTbsHn
         QhZbN5BRW34Dxfy2zXrotdoQrNWQS8MwWw02UMYx/d3UsAEJXOgIoBf8B+wigYuzkIaB
         po8k/EJc47IP4fFXpBrgzXQ/isC+MfrGZQ5VIunsOUBJ/MWnvcvrBTSv1jdfbSFoaN2N
         Ff6kRBEOubLS9LICEKk/9cL24l+12RnBFMHVQ0fGM/T85RPyuCx8ZBbQI4f60v1IF8FM
         lg8YDphWRyqTUX6xWEMnXKkZOXRwUb+NunVKOc5//ESp0qgjmNFETYDci8BmIsD2jA2+
         IINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798485; x=1758403285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWd2b4T+HmUToKXe+DhMe4fckX1fCVdutnchyiOuReA=;
        b=RJTGYR6VHno+yUKyBCuiP28xueU994RNmxbD5hM14tommJC0/yAkiRC5zHvLSPYLXM
         e9r5refpfCfQwtUhr0hNWyu0W5jkmVq4paYkr6F6DBOGK7CorrS94VMhJJ+4KpSLPHrz
         sSYZ6fbt6q1d9YCtcAeb6HxfNYBUh9CUgtvui13kK9nSZjh2RdFIjYLbTSFtCPas5Py1
         P3L7BumYkGg8oXcQKbddnrNFqUfhfFjpi1lWDQpj7VGo3DN/ktJXHAWT5TIhMkW94QmB
         0yG2d4eJJM90f+sHdOncjKlBkN5ZvQEWOn9hPM2uAihCZbMsSrcb4oPdYOn4NmoK7txm
         yVYw==
X-Forwarded-Encrypted: i=1; AJvYcCV89OUtthrE2Pf7lLiNmyxa3Hhz87P8mRNWg3PiazXh5PqhQmRx4FhVo1657qTOHD8+7anD2Hwrr+RDVV0l+su6@lists.infradead.org
X-Gm-Message-State: AOJu0YwtULl5LyHGVbce2IXw8wKfxshRgkEHqroTrWQA/dsUJFiNWbxC
	kbyJCwe5zrvBBK5ToM28n33yHmfNOTmS6FxeOAmAuGGPBKD3uFztEgpd
X-Gm-Gg: ASbGncs7T8QGR4kSiAZfulWnio/7S77KNLNKAGEesZwkv3MSS32Wruxb+98OORpwL1h
	pO+Bgb4ToY6tsYubpOg+Hc8vqyAK8m6pBfwfSSwACEWTqj0yXRLGbAwYpDgqOWb7cp/sFPPnPpT
	t6tWjzCwBPJ72A4+APHuk9w0XyXh1qNanb6C4C1cu4Op4g14tffZLq7k9tllUYNpGShFYYwp2cq
	E11Us9GBbwsDQvfb3WJUs1V9Cd3dMrVjrfHpzTrdagZtoy5Yv0ycDUd1RYBMbrlxdYEHs7VFQzt
	2KKEdBdcM9MnWSmTZz+3K1F2AgDQssiC5JglgiPJPzHtBfnVGPNm8RRgqifNwpzZTZrv4eMuOH0
	AilSTfs5kuZ61nllIGkQZ3DaZffUfmO+kxMou3kB2rg==
X-Google-Smtp-Source: AGHT+IEGJzSKpd6zREOPWaWs/h+7A671p7jcXu2As5oGpHICFBcGGlWQqYtS0ly1bNsIo7cSV/bMuA==
X-Received: by 2002:a5d:5f42:0:b0:3e8:6b2b:25e0 with SMTP id ffacd0b85a97d-3e86b2b278bmr2411238f8f.25.1757798485438;
        Sat, 13 Sep 2025 14:21:25 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:24 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:03 +0200
Subject: [PATCH RESEND 1/9] arm64: dts: marvell: samsung,coreprimevelte:
 Add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-1-8120cdc969b8@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=3n1cVAjfm4iMd5ytnRCe0bLiwYBnKiHaKl8qPthmrxY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/hXRhoe8Uv9obNo0ed8oRy98/4WF0LNYuP3zt/In
 WfmFnK1o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACayai3DX7ni9SVTgjLbf5mH
 etXa+kVFmPX1CnXJdps82B1ZJK7izvA/2tDK/nTfb2vDI2slt2+/LPXgmW4+rxfXapNP3yXbUjV
 5AQ==
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142127_358059_625A3A0D 
X-CRM114-Status: GOOD (  10.04  )
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

Add a node for the KTD2801 backlight chip found on the board.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..b9628b1f59f2f749804799e3d9faa48e3036e81a 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -115,6 +115,12 @@ key-voldown {
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	backlight {
+		compatible = "kinetic,ktd2801";
+		ctrl-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+		max-brightness = <210>;
+	};
 };
 
 &smmu {

-- 
2.51.0


