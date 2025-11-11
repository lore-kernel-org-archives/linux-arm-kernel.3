Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F16DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=; b=UKDlOWhG0sJw+RKX7dVmNtSgcg
	Rr33PTJdbWKqvXMg+5DbC+y82weohcASeD6gE8S5wBI9JeElhoaRNRKfZ5p2VeSdIEVRwkGfelPNa
	4k8RJkuHCYvHkeoC7G/UpBWsXbzPswQa+VVfjZ9jRf6l72/NmuYstIOT1wE5Bg6QPeLVkGmwr16so
	CoiPsX/n6XIpdDIt8wQUPqQ+ccbozKKRfzCvOMwS31Dh/4XOz9Nty/t8MLlhKg0LJt6XoIk2tc9R/
	AFVyZNCCpVZQD4RY2gPFRz9wqi6A/LseDdwnA4k10vSUO46bKyaYwEg59ikEjFSwlx/AiYeRr66kZ
	97JNbJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqsL-00000007QVG-1Zjx;
	Tue, 11 Nov 2025 16:05:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqsK-00000007QUp-0M2i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:05:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47117f92e32so38412675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 08:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877142; x=1763481942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=rKHSTjF1YggHoUeYdGaJSv64oNdaHFgPbqtRpQVy629J842bmoybC39H51UASFFw3d
         KwkEVWFLTBZNw3qmk4CwH1wlDkr2orafPwFo26Yk2CTFim3AcKwYGS1pZiBKXxAxqOY4
         qzi1DyQLyQ118mUQzQHTOeQF1a2RijtPS57qB5KXVbiYt8bsMVsbql2nL50p2d5A2lCA
         u1tGzK4tJ4A5mmEAbmsfnluRZWEogsivaj9HnGEhE6J7fuT/5XnWmUV3oBDotumKXPQW
         /61KPJv8MVuJA3DeAs4iEdlMj01VwUjrdbF4H5WwK7UKvSDhNjmtzRq+oaddXH1C44lM
         px9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877142; x=1763481942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=laDNhgqqNNxrocgNeUcGTmLMROiiCWaj3HMhS8Dyeop5D7wCV/44k6ryhowcn4E0MT
         mXjS5Oh7ogPy0si7A26CZIKfIqUWMhj79AKgyQWq2o5eA41CEz5Yap5A6KB0/qScauVa
         bGdvCNBj2HV0f6gVErdcPHSmaQ1DG+x/idcjpnRWGQP71SY3jO9JbbAaO5CJjR3EzDPv
         ecnBwY0gmINyWxL8bGPPYogR1PJlBwh2lyAuW2npmuCuqvUb9Jcez3m+0DsHZKDEaMJe
         LSmA429zELpA3IKHhB6PDBPyRQQbgtS43M8uDCQDe/yPCmL33rOfqp6hJ9qHaIwqqpSZ
         h2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxWcGIUrbiZTYTjqMCrQbIpYgFuEYE0E8rhS8lxhNBsSu6R52WyiUeeXw9FlW8E9tie2if2ZQyqlwMIU3bp9Tx@lists.infradead.org
X-Gm-Message-State: AOJu0YzXFtuMgiUvR+UhR1vojdHuibGYRo3DAbOLLbHF1TT1ICJ67Vph
	pyiGaspS6ADSC50dYcl3DIzcw2f73qCP2yvHYhSABfPIxpxAKzPPCAU8G5nwJdb8VEE=
X-Gm-Gg: ASbGncuCX39Od3C7iYYol4/sHW1AS+Yu70Tdk1n83OnPiYXOKc7O0xlRRAS3Zaw3FoK
	eKJBpsLQ2i+4yUyfIfRRyXWcpZmE6Zxtj9bEt1uRrUqdvlL2q9hM3wZbxM1OICvgKG0UCqGmLgC
	VeeE7GrZt9raI4jOmr1NgFBAm+4gnesOO0Py9dlHsUtT6sbsupaKfk51bv5/1o5yuMabAId60mD
	earsf11Q1eHBO5UFYbow6S0s1+Qa9RBrNBPbGG5Vwo6D3CSWbXzYyeqqEH3Sq0eATwBQp3ZbeKt
	ARkYJII/Og0ElwUG+sHOHt31aa9JH4H7VvjgskVg56gXHCdiiuhKjghRrhbctOVqUTIBaiItgxM
	3TKmx9DosEOaDiqt8Wr6Ot9K0dWyDrqgRUUKoMiDcNdogYlOb2kbVOE+i1BgOVea5r2Yv+ZZliA
	aHpZxcHEP3JAYPvmM8Y2E=
X-Google-Smtp-Source: AGHT+IH+MYmpINWnsFKQUpl4/+4Jobxe4uN5z+gwXyp65Xhhafeom17agVpTYxk/6AzKP9Q1JVntow==
X-Received: by 2002:a05:600c:4ecc:b0:475:de05:661f with SMTP id 5b1f17b1804b1-4777329400bmr113603115e9.41.1762877142176;
        Tue, 11 Nov 2025 08:05:42 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm384957555e9.15.2025.11.11.08.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:05:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-Id: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 18:05:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_080544_163509_47049A18 
X-CRM114-Status: GOOD (  10.83  )
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


On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> LPAV subsystem, which offers clock gating, reset line
> assertion/de-assertion, and various other misc. options.
> 
> This series adds support for the IP by introducing a new clock HW provider
> driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> allow it to be used for i.MX8ULP's SIM LPAV as well.
> 
> [...]

Applied, thanks!

[1/8] reset: imx8mp-audiomix: Fix bad mask values
      (no commit info)
[2/8] dt-bindings: clock: document 8ULP's SIM LPAV
      commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
[3/8] clk: imx: add driver for imx8ulp's sim lpav
      commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e
[4/8] reset: imx8mp-audiomix: Drop unneeded macros
      (no commit info)
[5/8] reset: imx8mp-audiomix: Switch to using regmap API
      (no commit info)
[6/8] reset: imx8mp-audiomix: Extend the driver usage
      (no commit info)
[7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
      (no commit info)
[8/8] arm64: dts: imx8ulp: add sim lpav node
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


