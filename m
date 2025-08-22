Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF18CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlRiptSGIO3mJNWjLIm1o29aFKtLuhg7l2Spu3OAj8w=; b=Tak4u2qpNPSv17qpe6sjHZecWZ
	w19ZUW8oxhvg0eWfAeR9CLaDqnMP7cznCPGnvwQALdRigoVs9G0m6dYVSWxuIP+4eLCay7lIL4QpW
	7Jy+WmvzGBO3uGZnYfm7jb8a77ck4sWMCy0sFsB6/LGvSigdxavX8LzJg2f6NO8LhAUW2oUxK3Q1K
	N5KdQnCTyM8MT3DuMEJJoeHtwlKIRGpJWQ11tz0YwSy93tfU0jE2q5v7ulI0UWrb+VJg/NWykB1AZ
	b0YIMFzCDwuYlX4KXS4q4BhjebfEZufb2Eet3hRnp3cahmBG2Gd3PgOzYMvvb/8xerjaewWQ07+qf
	Vcu1/rfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphww-00000004E1F-15Qn;
	Sat, 23 Aug 2025 06:42:02 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVzw-00000003H2S-1Z0F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:56:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3354b208871so16989511fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755885379; x=1756490179; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlRiptSGIO3mJNWjLIm1o29aFKtLuhg7l2Spu3OAj8w=;
        b=JPLt7K+5dx1d94P3vJnjKCHVzJWTvNJG3pwsAOmKALBVLwmHiGmiE6XAUoE6veUbaJ
         wFDNLgS9c2uL1KkrSkt3imiRg5VZ2zeIFcMiltuAsvqDfD/YbaQIXHkcKgOzfZnxrrXV
         PcFbZagEW0hVFm1mRf1H0O6cTWF8a5pgc/sroKcA8nbo4fdlaaSFUTC27lJ6k6yAxwhr
         FyYq9WmUMq2HLIs9HnlO7Eikz0zX93L8x7e5D6GLNtFQlESFkfneiSHAFgP8eR9fg2Se
         orAuDfUrIZj9fPigCRrrgxiDITQBGYPgBxFgwssVkhEeb9CjCookAXHmDZjASp23Gwwk
         8otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885379; x=1756490179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlRiptSGIO3mJNWjLIm1o29aFKtLuhg7l2Spu3OAj8w=;
        b=utLFGr31mfJ47Ebm5XHXaFCKRbW9S0eBcf773QvQd2OxCcRXXQ5xiCESkoCFjKdwyn
         aHocS5ec3Ac7gHK9AG3yBl5sZeFyC+3scmPGu5qxkUsSyRnD8nZYAnbSWNxkK9QgZEAI
         J+qZBgoIRNFqV9lK9Z5gn8SPU0VmuBkZxRinuZTawp173dHtNleilq9ZoThEgWD5tOeS
         Ch031GuRgjkE4YSsx1DazPybJyl+YXRvn+z9smRc0kJVoQojSSg33LAzBnDJWQJlExQC
         6SyOYEi1BtMzKA0EvEnqRnwatwn1HErsf5meb4KI0YW6KeAlcM4nby7+fFE/mQwoze3Q
         MaUA==
X-Forwarded-Encrypted: i=1; AJvYcCVR2r4JCZ3NzGGDMWFXfrYDNU3Shgo/9D6tS/pyIk+stHCWC2U9vSlJwefORVwHQYf7gACxVKnBFBqzDCxLr/xb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3lvSrNB3SUYthQNsdf+kVJtofE+khOHCzBxae3fDOMYS5Sn0r
	ZJrr/8AIObIvU36/UrxReMUnWdPz6kKlJAVY80m5d8WgZtCeQvu68c2XMqS/IR+f7+g=
X-Gm-Gg: ASbGncvGGE4lKlJopjNSQdE5SQvmOeEqV1qpUaxSl2IOwfE5yaQ5eXAbn6aZsf4gTew
	wdHp2Y8o5eUM8x0O6fwdHsdEczFKDn33QvH9l44vE4uiml64HO5W3c/B7arclxHivumzYtOnuAc
	nVsSuG+ezIfyePm4nhT/OizDX0zCe/KB4lqtdWm5aPdmrgfWbtEOmigZoyjXI6G16k+thTduk8M
	fSSJbxHiU4IMhH2Yq/r1ZAdsMWaX7lyQMdvWjFZYjQ2DrMbT72DQY8bYqKOanR5bK/ggQmF/jxR
	RUYBId81h9IkesCtUtIpkXO3xAWDrv4ECZ6suaoqQYKdc8AMwbqAImMRaPTnVh4mdqq+P4Q6C2U
	u5Ciq5vrisi73Wgu3benEInlUKDqPfyue
X-Google-Smtp-Source: AGHT+IF23/lpqJbGHNLzIUgwPgFNvepSu6KZFTzrnSD3HZe3Zc8pRdkZ7o9Yobc+4AZCHG6bu2rUbQ==
X-Received: by 2002:a05:651c:3042:b0:335:2b7a:4791 with SMTP id 38308e7fff4ca-33650e9ab5cmr9702371fa.18.1755885378566;
        Fri, 22 Aug 2025 10:56:18 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20d2e1sm605121fa.1.2025.08.22.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:56:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 19:56:15 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: ixp4xx: List actiontec devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-ixp4xx-mi424wr-dts-v2-2-cc804884474d@linaro.org>
References: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
In-Reply-To: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105620_414780_864D08BE 
X-CRM114-Status: UNSURE (   9.67  )
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

Add two IXP4xx device families from OpenWrts backlog:
Actiontec MI424WR revision A/C and revision D, both
of these are IXP4xx devices.

Revisions E and later use different chipsets.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index d60792b1d995f909f621b3326e62d19223f6683c..b7b430896596aacb792983d8538b84f389cc5bd1 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -16,6 +16,8 @@ properties:
     oneOf:
       - items:
           - enum:
+              - actiontec,mi424wr-ac
+              - actiontec,mi424wr-d
               - adieng,coyote
               - arcom,vulcan
               - dlink,dsm-g600-a

-- 
2.50.1


