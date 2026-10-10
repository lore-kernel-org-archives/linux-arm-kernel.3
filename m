Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DDACA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=; b=sXRJpb87s3yxDgRufT7dGxiwFF
	dAXkjIGVcnSd8npkF/8rAIlk2iZQKXfIhZJb1dxg01Txa8xpBul1AQ5QF/ygPulPV0vl7+o7zsn+w
	GwYDptgtBFy5t1OQsFfULzYgo9eLlGG/8/fa/Lj75sS1yQFVKTacrL/ux+xtWsvj4Ik257UntnbtB
	tT5l23baZ4j/V+AITNWAiEQ9rC8+7kIuRTPn7crAE/cGL/jOTvo9EuAr5cBf4mf2DVCQDLaADvhQ0
	QYcpdmzMUDs2ZdGLJwa3SEq0DJRzfOMos7Nun8Kmk0aqzxQ2BUOyd+tq4XKAIXGtNi3Wk/CJHCU41
	T25tKPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfKb-00000008UA3-2TGw;
	Sat, 10 Oct 2026 22:14:17 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfKY-00000008U9K-2oYJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:14:15 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-677d35fd1d2so649722d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791670453; cv=none;
        d=google.com; s=arc-20260327;
        b=eJH9ImZ4AKZW2vjiOeNaKMlNfmqHdfiEIDeM+OsSLFkQIcAdGN9FwGGPCG8KaVgrtn
         bbLuoHb+NZzxVuQA5OlznmstkUBlL/9Kk2Lw38cf72YTBaSC+0f0xMcgqiEcddjOMLd7
         1g4P+RPzW6VryqFAl8C4r/dYnptFa8sD40uFX7mj5NNDs62iEd4rtKLgHnRSlkh5609P
         ig/BLiLG48WofmsVepMivGZ1Uk+Zg4P01Vn9DhWOcxV2Cwl5neZwHb3XN9PbYXgX/isA
         IUQgekRzBnPnQF4hZci99oCq5s+VakNtCFxFhn4oIuo0kgMtGsWDmR+QYAq51D+4ldSK
         6KRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        fh=QkCgh1Q1f2gUCrCuSs0BvSi2JCO0L9JyIeCMaT2CWkY=;
        b=ErMQmMz/ukThDXShDaSXOo4LiK0jwO2WXCXAiRq4YI9tRE40n2XXfXvSYgLhtMq6mr
         oOqgIdHvw3MYgMkSuuZAhmpl4Q9UpXgw8c5d8oh1ka16mo2WvVYL8FYU87Fmy77aXDvd
         3mCiuNlT8jMgQ3+uui/GIW+PqgBNDmJkw4sMYiHcQO/zO1+pkVlpY0Kf9yzYpH/jtMMz
         kviYcClnYBTTAjWDt55XfJ+Ko765Xcha2XnI9JTKpa/9bQwNXhQEgJbXDIE4evZuxvyP
         xvO3KOrO0ZvsWB3YrT13haW3xmel1Wad+53LoPOqsJs+D1L0BXAX5SleZMu8Q5g1X+yz
         NGvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791670453; x=1792275253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=dgWytXtz+JcscZKvcULPdQYYGao/8TiRAqtrlIvhDPXsaiTMrkmedBlg0eyBaP1jz+
         x6pfhtPRPa/fxIE2QI1O8vP7O3gRvROj3w5aZ/szorV+V0ch/MUw8yJW7SBLeHn84IGe
         pPxVCWb8EfkV0G3V4C3wm47rri0vaecW8sQw2ru7fHZi/DoVg8S25lQ2JhZB6gyt0p+o
         W4LHOzcYv+PjtW8G9EhHB3E8WZszKKKWpnE0zO+RVVIwxe06KrFbyS34IKGRzzXxrYqX
         bizCqzvqVI5ozk0jEtzQ1WxX1FzdE9iuYndZaIy6JgeTqiTf26hIh/EyOwyBqXr97VZ2
         BFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791670453; x=1792275253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=EUaIT0cY/J95PRz1XpCS7wqdau+MZOfWcspuK/bvPC7f3FrO6VHa/5hFAWZ+m7+rkc
         ooaXC8fzAaqb1jaHU94L0av9CXS5Jlsd9EIJX60GbUmwGqVJzkYfgZWkgyBivDgeqQs/
         TFsjErRm30iTb5pAuGS5FtSnzKLrDjVvBj6d8zD7wuEy0rcqs0MBX9aSUC+Aa28myQqm
         RpWBR2JNsmsh69BlyFkIywU1iE0LmENBkFivgOKg9wDmy9OeZhCxe76QQOScObfabH+w
         TOelzikVN66Brz9dYHyGYNmieIctQuSUFvCBHIre3ElxMV2RRNs2NXAW7uJ302lFoXmP
         xBtA==
X-Forwarded-Encrypted: i=1; AKwUvBz4bfsJdA6LF3R3OYTKUmjcwK7b+yN2qZdfZS58I1msVIB1kweIkTjjf2MaO4CZANBtizpH8Ana0VFL70U9jAaw@lists.infradead.org
X-Gm-Message-State: AFq9FYLcz3L8rl4ZbxVD8nVIvaWCuk94Ful1w3hx/RHlQYxqR/EHFna1
	0Arn2Iv9JQzTPF1mPNDWaCANHkb96VMzLuVAqsSWFz+ar/2YSg0s+I12P8otybAPGJvSnnwSKKV
	ZLbaQZqcLeDsF/5xHOQfAQrBwyL3pBbA=
X-Gm-Gg: AYBFou360VV33EuMFa3Dl98mt/pws2Voqk+HgHYbzYSXl4Y2QpGE5SoFEUYGsGKtyKq
	8I3UMFXB/IM8g3ybreeZ+1oOJNnJ+w6vuk1YoQmp4IAItSzOMssNWsqlwHB0cw8+9g5eDxFWZSs
	0bKJx2tZ+K+/3s48Odh/6ebEWYiVx7Xsxe3q/FjjJMonca47OHfke5oS+936XbVSYmkLlOr3nsI
	7XSV2p9ncf8uYo72YAu6X8RRSWCt4YlLdx7rfuRTewzE+b81FXNErCC2/bnbQpvmD3CX8tZjkQV
	//ytAOOPz7Rrg+aR+remjjAqD0bC1BbO5hCeHdvfU/QTk63HtasbdTOBvnKejAZvs/1YomVvOIk
	xFNcmyklMAu43
X-Received: by 2002:a05:690e:803:20b0:676:9240:d69c with SMTP id
 956f58d0204a3-67936275489mr1125092d50.91.1791670453112; Sat, 10 Oct 2026
 15:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
In-Reply-To: <20261010105900.247342-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:14:02 +0200
X-Gm-Features: AclHuK8gB-tkTlpSxcPTOLR3EaTkCZhRdAGo-iA2p3YlqPx-9RYK-GDsrGLBxVo
Message-ID: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_151414_741688_2A9374DC 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Lucas,

On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +        # The TX delay is a quarter of the RGMII clock period per step,
> +        # which is 2ns at 1Gbit/s.
> +        tx-internal-delay-ps:
> +          enum: [0, 2000, 4000, 6000]
> +          default: 0
Is 0 a valid value? Let's say we have:
    phy-mode =3D "rgmii-id";
    tx-internal-delay-ps =3D <0>
    rx-internal-delay-ps =3D <0>;
According to patch 8 this means: MAC is responsible for adding the
delays - but it doesn't add any delays.
I'm not sure if this patch (removing 0 from the enum) or patch 8 need updat=
ing.


Best regards,
Martin

