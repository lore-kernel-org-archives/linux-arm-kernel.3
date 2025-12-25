Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB6E7AD4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=; b=MVQaxtdQiD8PJjzMLtXMzd79eN
	sfWJmIv9FOI0bGAI4fB0xo4ebnLfPyF5Imy5Im6mJp67+HIusrNcJcKhG6cvw5lXjezLUAIwpN4d3
	ZQkL0y6loeaHcgZ3VU0P+t05MX/5CkTiWV5obd2JgdudlwvVXysedxVnBPB0lFjSn65/fGSJ2tK0/
	acySH6+Wla5TNco46nNQt8Tk+qXAhQgeFKxSgOAwNEazWsWsCsyNnL0McyiYpbXRu6QApKUT9GVCU
	s2Z7/gMJksZA2tTpmxJWfh1eZXfTlYvIUHaOopL+grTJtR+lfenzlpmuWz3P8zEMrT+i6FjDO4BXF
	lyRV1jeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqC6-00000000byx-1vJ0;
	Thu, 25 Dec 2025 18:36:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqC3-00000000bya-1Ou1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 18:36:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so7949514a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 10:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687769; x=1767292569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=ncA2ZiiAfSMPPwg2C/8a6TH3akWSp9GisNm3XDmaQtWp7I5ucOyJ2s+9LipcbJ+e9/
         o7QvdOi2lXHRjrJ9o6Ydf+yWBxV/WSuiGannFVWV46Mfi1LjDnidEf7QWU+yk/OSINmK
         9skqcaOy5PoecT8k804IrSAI8LP4AjugfOHNTUcwg99ETZyuI4sze1lAG3eXV+nApOI0
         K2y/YGVXR9otdkbRrGRJFcM6CTiaK+2AiAQDNm9arog2vWmbeqeAre/3Zuz/YnEGKlmW
         32JwR/FiWBhgPxPRx1W/plYZo7El0EZCY2+IEnV28Oj+E7dE60Ppo1N0EQ7YzxW5utE6
         MAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687769; x=1767292569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7JUOyMg8Or8uhrVC4CD+kMcOGeXL28oIZJIkKzR4J1E=;
        b=ZdCEjZ0PXSgd4B8IXNVIzjN07baNdUPJD3s5hOmG3oljmEVkNJjed/wQZsozSdPouI
         WIOwNIvmCEWgvg0kJmJL3Io6G/dT/0J+bdhXQg799l0Cj7Hoc+8ZW33QX7aw0AIIlOKn
         LJxIy4hyrONMijEvwLCdoKJPyGnc9z5yiQX41crrsTXP9HLR5nCo8s0MAVXQzSnMIZNi
         oM7wDyXySt9bR3P/HkEc9XHoVEYvVnPr+wjjBC34GTaGCR1OepU9+RsAMsGimGdRn76t
         Gn1n2U+wIItNGlNNkMz67zYbjVr9ZW5zZuTjvgszEcJwG/Pf142mE2IT4AB7keLdlcaX
         dWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV38t3E4EwQUYOkp+8yvZrtX9kj+XyxPgzPTNKVlNjbFp2HqlH/WXru3WgZ60KWzoXanqXsBdy5h0nAkPXgYx3o@lists.infradead.org
X-Gm-Message-State: AOJu0YyaW04Iw+Kx/Q6R4XNRIks7UUuuHpknga+Hyii8zAFpqeXv7loo
	TflcMuDPvRvsA/b+bfDiTeycZZCwcXXLk8dv0tnuc1sQGe/Ue0w9dq9g
X-Gm-Gg: AY/fxX79lR57VGQ85KWHVBsH6kmsM1JJsQmqD+oRsISqhRaMqfE6RglA4cenCk2Lthv
	wIsVBgwFCYC+b+I+6GFL8dlhkBN4rvjfYBTBxtzqI56BYbE8znlbZ4ZOmhP+nWxdkubtXx0vdxC
	ThNLiRVvcTdpX/clFYknT/gKJSqz8Y3VNIlp+Ltv5EF94JDM5/dcb1KyoWNPGUbdCZzZy9J1gWo
	/++xDwvl90XtqSZHm0ae4Qd5Qrt8rD6YLujo29ertYEdwKHxrZ2qPoofsaulK4IZ8N0FGMX8bbb
	Rf/B/1EwwQRHQORbcUcg6oMxN6M5+yBWk9AawaAV9hKfwwaJ1OsFxBdBLm+SoE7hQiao7Zcffs5
	w9xKTP8V4x5btHX1gTqW9/cxV5cnJ1Q/xUv2M0X2htB//z4I5RrPvAFAfIm7eZ3zknazWqe1mEb
	mZrnDIbiv0H4FrTgfMgVY9wIfV/r6JPsCpqwE5E+m7WHE=
X-Google-Smtp-Source: AGHT+IHEIjHpbPASvhXMCNryNTALHso5yEhVN2Zt1Wti83jtrsqyLd89aktdU3iFdV+yBgA6+HZu7g==
X-Received: by 2002:a17:906:d54d:b0:b83:1400:482c with SMTP id a640c23a62f3a-b8314005538mr450270266b.64.1766687769040;
        Thu, 25 Dec 2025 10:36:09 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad806asm2154858066b.23.2025.12.25.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:36:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern with
 leading numbers
Date: Thu, 25 Dec 2025 19:36:06 +0100
Message-ID: <5080862.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_103611_400164_11BC9BED 
X-CRM114-Status: GOOD (  10.17  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:13 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>=20
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>=20
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



