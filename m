Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F089EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=; b=o62z68jV687zNqetSPp8czjzPm
	kiwV0bCMM/scquumUiZIXr3pJ3OUJI4/VMKg36jMxPwO+FW2pLYscHPjxUHvADNqyP22oFSNDg1Qw
	ERR3CqNKTBV0HBU7C2S4qR9Fjrmupuup977oawFh2Gl1wdB7rxprrMOv3XOYS86bPSBziqnnRiF16
	bKr846szXGfIAVA2VFkyDzNXhJB2Tftxr77AD/WYFSj7bN4+5CNhM5brKvvg5mfBzMK8rAcU+9LNr
	8kKyPWI5NDp/Bf2xSWibHTTxo2dME+/mzNAYLUyzJDsOMwh9V3wV+c3+jOcbrenbsTLjcbbSlcoOn
	3oWVFU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3oO-0000000DsEq-0wYS;
	Fri, 27 Jun 2025 07:47:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3Yg-0000000Dpbr-3DIG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:31:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1225230b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009498; x=1751614298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=CusmTQw8oNsSARykHlCPME4rBGQOic155AbazP67Wns04WpPF/5psSkJkIYo70Zqbf
         Ked6HKMTckifIerU0QcaqXYoiCIhr4AS8vlGMbvArNX7HKbfsVa6dkuu+x1CR/NzByr3
         gU4XclDBCghawhET7sV+qt/yJK1Y2xOZmI9L9j0mTi2itpytpfZyrhR7WHNllfkfUbZx
         6KI3NrMT2sIbEXwsMXi86Hu3mJzavfHQLoAqBabhj1GtZZzQ3yW1uRTD5jf/A55ndRLI
         WBOc+bZFrtdXbQx/zijP9Eee6FGbKRnMKJjNaN9NsNKRZatIeU2oLTnOKik7poQigbYV
         kAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009498; x=1751614298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKbBTi7IDp31OkTJ6cIcfFVheRI1s9qIcPf1iWX2qRU=;
        b=XqsNBt/7k2xyQ0eb3CDTnPFG9BWKgjaf8jHxiZWThryVqmLfWgpeYlEFuw7Uw0dMNW
         n3AboYn8OC73j51QKYd7LHMrjpSVZJphp/Y4FJxYBbyZz1+3sRwL+X+AHAkcKwbdpScm
         HLHKk5bXC+IEcSr06Wmpk2J/N72gS0XmA4hMi+tbwYDT0TJH+9QmFOt2UxPnvHwDWs8R
         mQAJYdmElD4u/ws1hIjVPeX7NJ+68AVEWQsnLCzvqNEi/S51WqDvs/HJVR0l5+EIqG2d
         CbnYjFflkm6vytq6r6LHDTc/26TLNcYLGWRaU8dqeUbxAwTVamyO1QM6l823z6DI9r82
         NL9g==
X-Forwarded-Encrypted: i=1; AJvYcCVnrnqh7rkLLXQSoYl/mkwEal+vEUcAW4tvs1E6w4unnfm1aT6Ciczs/Uf2mtWMyNOyiioWN3lGqJ4Qkp4C5l//@lists.infradead.org
X-Gm-Message-State: AOJu0YxJvhQ6b3amb8HlKUwlz2p4F6iFmUpU923DuKy02ArCctU4ynim
	diOFkJvkJlFEZ+rU6bY8L0Jy4nsPw6v6neXYU8OqBa7XLvkoGreyKch0
X-Gm-Gg: ASbGncs8e+3ffNPva0SakA/oi2lOs+ehZV6L0drwIXqE314mu6ESNhkiae9FHyIghJ/
	8KO+YOFqSLT2HNeO2HBHOjLHyMh7fS0y6hGck67WoGoPqpPxpHEvFSDP80FrNKEb0zWzGdy/8Ze
	SgYsboKU8wCU8yY6miH9SAnKnAJj5zD7KiILdpt+POr5RUhmJn/ND9GqGJZBgJn2T+TXXFr+x/D
	qooxqljRFDt2fFvelBkS4YRuwz1MU+oaa1BSQVn20tTdr++41zd25nD4V02fp+2lhXj7xqJpPP0
	znskWE2nOsUcXsq2/ls503GTOcCywW/Wu/cy1vJFjywDcEWA/+Xp38jzLsFMmEjnibXDsYlgQ1X
	R1ej2v1I7VTc32jPu/2v2nM/EYiae+Ck=
X-Google-Smtp-Source: AGHT+IECsc8On/+R7tO6ST+8PJjvqWGuxkQi4vIgQwaKYmKT/4qcJMiyQapkOxql4fr0M0zlc4QUEA==
X-Received: by 2002:a05:6a20:394b:b0:203:bb3b:5f03 with SMTP id adf61e73a8af0-220a1251b79mr3468887637.6.1751009498175;
        Fri, 27 Jun 2025 00:31:38 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540a8f6sm1628646b3a.12.2025.06.27.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:31:37 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 27 Jun 2025 15:31:21 +0800
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v5-1-038ed6f1cb9f@fii-foxconn.com>
References: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751009491; l=886;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=jaJuRFuiQIpQeCgkDZC/ZckoYXAyyJRWtir3QL+VwYw=;
 b=D+RmPFLvbiS065/bwt7uUHl7ONdOQY8Dg4MN24Za+XYvfv5b7lQTjMYSt/GoQgrKrbrwbmw/z
 lnWZsZwQ93ZAQoOvOGe5TVdbZyQ6eGeDHb2qogbq/yEyGijxpWo7enG
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003138_798340_6378856A 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


