Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A77EE4997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCfXUzqG3cVftHj53I17dFR7YjIPCtvXBTRyCBkqeHM=; b=cEx9O7DzHJ7VLQ1gC0sJV4Bchp
	qV8e6Rb5DwbxZ7gchoSJ9RSbn2iB4u/XfN7KUGVqs6Ibb7ARvwasulW7HDjqd9XbLn7Ne1UWhGwGT
	66qrbL/dhiifmLIMANt90TBpWOP7cKqrPoEw3/cGVcKWRx25kpI9T38oDBoUEW4cqqr4n/B5adRoF
	O1hNU8e0bdBXBxs+U2RpHTamm5PsFHZlWQth9hE8cHLlsklNMMYVX5GNXkEi63sjYHcebLDryw105
	QRsvJNLlhjga67tL0o98Gwi1qyr8vS4HtCIVVUTz41OruiFbjqiUXMAQVlWy2TvK+MbMXfsv2vJin
	f2GSezpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaepO-00000005CRI-3Y5Q;
	Tue, 30 Dec 2025 18:52:18 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaepL-00000005CPr-0KVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:52:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37ba5af5951so93333721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 10:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767120733; x=1767725533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCfXUzqG3cVftHj53I17dFR7YjIPCtvXBTRyCBkqeHM=;
        b=cmjem4o+BVomqB6HQhbxWNJMCJNdOjysFlqYzpvblvt5OCMRGUaEHRJBaQuRkkCBC8
         g6O750WKZ4rGZHGADJVlQAhEOQIKy8cH3KlZayBjiVRe0izGXiKcIGN4Cm3LXeW7brx4
         62eJwee/eWbQaG27uxIywNIlEXtmKGg7fO/f2KSAYtpKO5A+7py8UK/Hj91wLmVM4817
         w42FN2gYSHAqOK8JQuz43OobojjilQoek2i+reqUM7mDnyJq4fvx37JG2j69Qig8P14z
         7g/w3i2smje5ZduZgTCROP3/5+bXyv4eI/205b1iTwyQWXS/vQLNkvMFS+JmKn4UW7ic
         xU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767120733; x=1767725533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCfXUzqG3cVftHj53I17dFR7YjIPCtvXBTRyCBkqeHM=;
        b=f48rZcA2KnYfZuZfOWsOeejPNhQMARzEn6kkJeKzb/Y6FnReKp3+mLlDQbZxtD0iko
         +LbfNOHNGyuiOThY8wG0SCPU59hlMIOBms0QeKmrQR9zfHv8l5K7D+GCMDuxvFkzC+/y
         9yA0Ff5yIHIVa+6u7LSjqEV5cIpQvCbaVxM4kL0sPsa3/CHXkOceN6f+R0bswMH4kP/9
         RddIjnT0lB1+Wk8Rqgxb6JaaTUnHUGMwWD0jz75W4sOrTYE5dlygsxWzH21Ful3w/N4e
         39D4GPJui5Luze+Co7Xkik9LNOK75D+yP3OV5/YrM6u3J4VvGr2pDPIaM1S2eX52y2f7
         sc5w==
X-Gm-Message-State: AOJu0YzJFTxEdszgebsgd74weIV+g0xQxnRqq42u4hn/NOg9HgZ/LPQ3
	vHRVetEZ5ML9RNA5GIyh5EJ3vtQ0+7TJejF+DN8aRQYXEar0cQrMsY3CYUM/+gh0hqo6hwGXJ4Y
	YT7qUJB0I0NJENbtKXp5cOjcC4VcmjEo=
X-Gm-Gg: AY/fxX6mD64bOcbeNcoLIyjnyA+0xeO2avd14diai64lEXPee4u7lw7aG0bTZreKUmb
	76kz7+RPRNWKjyUC/IxDjcybZiiYT2etpCtqnqCfVVxcrUrT3s9oIw9QHbc70Pp0PF1N1CRAGHe
	VTSQtB1z8R4QxJVpfL7DhGf6w9+3lvtF5Fl1p4bTECwbepQNwBZqzMrNwK4TjkATp4yp9/f66wd
	SYYkDF4TjFe0iqPryEA6DUFtryehi+NHLjeBo8sYQq75U1naQLcpcr95LU2F5A/ZdW/lu+HnpS8
	UtP1Iuztm7F7nXa28CF/rHv225A=
X-Google-Smtp-Source: AGHT+IFUnSlXZesKC7/z2Gedmk72Vyhz3T3P9a2mLpOhYQo2tRcPsOk9zvHAtYmSF9PmyTomhYgLnFqHRIU4PBG0H44=
X-Received: by 2002:a2e:b8cc:0:b0:37b:aa90:1f5 with SMTP id
 38308e7fff4ca-3812167ec45mr111776001fa.39.1767120732669; Tue, 30 Dec 2025
 10:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20251230184121.52635-1-marex@nabladev.com> <20251230184121.52635-4-marex@nabladev.com>
In-Reply-To: <20251230184121.52635-4-marex@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 15:52:01 -0300
X-Gm-Features: AQt7F2rn2wnlugSDBnS70XdP_2HLYj3sWlBtsvhMqL_ZKxQusvKKkquuYWpTCf0
Message-ID: <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>, 
	Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_105216_112288_2842BCD3 
X-CRM114-Status: UNSURE (   8.32  )
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

On Tue, Dec 30, 2025 at 3:41=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> +&gpio4 {
> +       /*
> +        * Hog USB-nRESET high here, since neither U-Boot nor Linux
> +        * has any support for USB Hub GPIO reset so far.

Which USB hub chip is used?

Documentation/devicetree/bindings/usb/microchip,usb2514.yaml describes
a reset-gpios property.

> +       lm75@48 {

Node names should be generic: temperature-sensor@48

