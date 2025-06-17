Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CF1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8JJN4D88g5LZysAtEHW8oNqIwXChQoCpcV9xwGdAP4=; b=0D8MYscywELt+5ZCL2PqpZdplw
	M18NF0+S/6OzxdzXVLuikPuu6GMoTluNxOYFFjj09+48jxK5tJoWo3gr97iqdhsjmFf/KUuj+zHOT
	442EFb4XGKd9Sb1zwpjH+9JPxOxudLxtoeVSPr/sc4c4xa7sp0G9Khd/qjaiT2utJ8e0aBki7TCnl
	LUwAoid2I19jeSvpEZBR9hHXOwugbolgUVB1+nrOMHrK6CtElKJ2d+jIOLrqij0hzd2VlqtHn1bfB
	kpfFbZFdOinie+FrBTnC4t+VlB0jqr+mSXAHtAkq+VcehZCW1/+F8eoAilA0WqKt0swPiCxBptG7s
	bGCxkb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX29-00000007V2y-2mSA;
	Tue, 17 Jun 2025 14:11:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWcg-00000007P4i-02TR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:45:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1740805f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167908; x=1750772708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JJN4D88g5LZysAtEHW8oNqIwXChQoCpcV9xwGdAP4=;
        b=IS/kFbuImCYS38PoeL/cfhAjELu26GAtkfCcCqIUQ/bjy0fYMVt0N2rZZBfY9Lhh8S
         avY1BxNjTUUDbyGlNm1K3eTJ2k77PweKamUYOO5Q5aUleRkn+Md2uleDsYf2Cc89LCpq
         UU3dETzJatZ31vSuvAXf4JU603xQ82aDI/3xwaxg13/DTxg6R3gShS7fRFpT0nHiMSlZ
         ctdbRlpII4xIYx5wFtzlJo+jTNe2bhQoZFFnpMaOBaHIV1zAkMySTcS+z+KDgvhQQ8fi
         NgcC3FrFqHfKANdpjwuf/2zvW7eRhAiKzMe3/tsE1FUifxQ/hq02U3EhWwYIlUBn0jIZ
         M4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167908; x=1750772708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8JJN4D88g5LZysAtEHW8oNqIwXChQoCpcV9xwGdAP4=;
        b=nDK3OXdYU8s7lWDmGPIGMSPJCHRj2s5CMSzl6T5Wuy/0bOKrfT/KAfJS8xee20J1VV
         TEcPTdOF+TniUaayrMwsxAYnPusZhO3B3qB1eqqyNjry2DOrrOmlUC6ydDTVzCjEpIuk
         U0YHoAVhIoxvNlBYJQ7kFVisFw3PTRVPbfXL0VxP23N/SLRVN4UI5PkzmG/amCw5DLYj
         Hky+HZuZuJZZfB+0ZWmPeSuIB9yycmjRDcLR8optVHWd28L3ANkOZLU1HzTuyh/jN9y+
         XnP4mwkvdmdVtV65viLrt3fL3213Y+FZj5HStfDu2oiH7en5jnTTCmB0HDDYhwW6l7lV
         Z7Ew==
X-Gm-Message-State: AOJu0Yx9h/jPigZ65OwIfIWgX+pBWO+ocn/rRFsX9Zeoa4ikHONJMw1l
	CxIzErDnLSSCUqWz3sD2YJty3HCM3EjhXTwbxPtfdthGZyOY1DS2WX0yCnaLfZtICEA=
X-Gm-Gg: ASbGncvuqOfGlJhCl4gwfQmbHHLGvdlXubIjIzdXj3rVXGxnnbUpMxPYuf2RrbC5Whm
	QlrTQMrW4DvNktMExQSoUcx+feALoI9PcP/o25BXZ3fJUqzjah1dItI/Y4Hey5QsqgTujwQRiCJ
	0BXSaC4QjQzTpe+qkx8EkHhQmZ93ZDEsRhtOZQNSAibC+7SNg1ruy+SbC/YI1qGdQ5AlVnCd1OB
	vrttJ+z9YzBoDrqHqZg+lF8DBjj1Fn/+HZ96offcDXAG4z3MXsJnTwLNn0u/zKH97zqkinsYx91
	a+pf+W14kIXv5YT94MhXZ19vPD9eH2yaygJjmjx6soQwcARIYpU9FIJC5DjrmQNoLadgT1WwVio
	Uy9M12JNsvF7Bgj+DPkO7wA==
X-Google-Smtp-Source: AGHT+IHx7+MxOtQIlo3hCXb9uKaWLaaMM9I4c7QG+YXyxr08bo4gUYk8w8HO7kGmwusFdh08dsgFpQ==
X-Received: by 2002:a5d:5f4e:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a572e79d6amr11446870f8f.35.1750167908305;
        Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 2/7] dt-bindings: serial: rsci: Update maintainer entry
Date: Tue, 17 Jun 2025 14:44:59 +0100
Message-ID: <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_064510_054956_FC04A896 
X-CRM114-Status: GOOD (  11.85  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add myself as the maintainer for the Renesas RSCI device tree binding,
as Thierry Bultel no longer works for Renesas.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 1bf255407df0..548225e509e5 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -8,7 +8,7 @@ title: Renesas RSCI Serial Communication Interface
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
-  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 allOf:
   - $ref: serial.yaml#
-- 
2.49.0


