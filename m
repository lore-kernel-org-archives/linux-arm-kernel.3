Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5433FE78498
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 23:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HMFUcxRTaE7pGy8ulnNfmJ/TG2Zqwe3T4eukcCVv70=; b=zcvgH7PlTOVkH4LsvMStWKqMlZ
	NwAA8lHVArOnGqkTurW+qr5mwv+j+n2moZWGC2ALh1Gi57ZLITbxGI2UewdsIVpg0CoDVSCFW/EH5
	yzM48zwyW2P7O05pwSWRrHkYyBzE7jo27nxze5XOU5+W+hx3NNRJDEZ378+1Epc+fav+DUbFCpH2K
	9Irh2MnNv0Zr613XH7k3sulhhf87PAAqkGDQ2pcNjl1rdiaIh7jLISYOodnyvYWZvRKWT3lfiDQwV
	YM7W8oDhcAIEMj/HTrp4cdEqq4h5hFleu0Rx5rYho4SRV2mnLWUHQ5acNCfaRrqwy6n3/Wg4N657G
	ptw1/CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYNS-0000000HUtO-2VGS;
	Wed, 24 Dec 2025 23:34:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYYNQ-0000000HUsd-0VIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 23:34:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29f2676bb21so83567275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 15:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766619283; x=1767224083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HMFUcxRTaE7pGy8ulnNfmJ/TG2Zqwe3T4eukcCVv70=;
        b=KT7OdjGo+GvTzRDRyRjZ91IIrqRKnw80aa/Pim/J4cYqoBD6H1zNkxsTVTJAWessyN
         pP9B1nWOuqguwwuwsZuwuO09po7SbxfnauyX1kMP1vRV2kFiTKXlftaqdkojWOGJmmvJ
         UUTFYoFdJJpFw1BTu7Dhsatq9MdyTp/YvrjgtbbMdELdd/0eYDQQOTUZgTqlcDa01yVk
         VZdee5XcZfZN59Nmymz2pSqivnMmVmCgEk9wOpIAIAH7yPPAW07Ly+IqrG3sTasCDySp
         o6mBzYUMbwoEmkT+GP8R1B6cIqRssFd6bbBVGZ1oBkvJ66Opd+6W5PU32Bq/3dR1FMcj
         hn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766619283; x=1767224083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HMFUcxRTaE7pGy8ulnNfmJ/TG2Zqwe3T4eukcCVv70=;
        b=GNV2pIXOghgbsbEtJIBoOP+4lNFD6pcU5dyaYxUSnDNuJruTH41e1/2WMOImkSFoz/
         oP1CpNPR5d0M6Ir2VSTGQhD4YrCpsIP6iydHEZ5SL4O+Ww0dyst/3LJZcIbKDAzokbN+
         WeaEwdT6KKlLWW56xgeHTGGps5ZyMS/YgvFndlZq0jbB7f3Ax4g+GALOb8/YjFoqIlHn
         wn+yXqI0me3RkOGO0igPrlr3i+AbLIDHI2sUjslDNYAb2Fo6N/bWgwyhucCJQdUM28Qy
         XJnaVnF3Pm8HLHqQMnOnVjm8he+Ury/nUPfomUfXZC/8MgDo707NyV9C1hOyw0pIuBBM
         NR4g==
X-Forwarded-Encrypted: i=1; AJvYcCWsnfzaSYxOKx/g3bsd/+PraXkZCqlgGimW7sVh5le5j3Oe4I2X7hMrTCUEPqaC70J2OiQUcW1XgTJ3yYgiQyDN@lists.infradead.org
X-Gm-Message-State: AOJu0YyW8/QrPb6tkMLcLkQuaYMGg914TSPkdCbQOzr0zfJjsVGDNKtJ
	9RwViCjN3iqj17Mry/6UZw21stfAM74+2URwuppYea5y61tTPRZ5xxh1CczPuv4d2ceMC7dINHl
	bFhWbByIeU4CE9VNzRWiRnCN+QKt4Ptc=
X-Gm-Gg: AY/fxX6Rk0iI/0Z9iGTIgVmk2gQbO3o9Im5wQENiY1cla73KJWVF2aFYuczXqsah2+u
	/EQBLW/St0og295ZVWenZF/Y7jrdjEU3p57UWdxd06MNutChFOatBmTRoU13WRkI4INS4oKXYsT
	KcJqpOQztrT9cLmoIYKGMSaRBPXVDsOlgQ6Zg48F2Llp1rp7Kn964Ff/WPywC785EtewQGQcK/4
	0W+rBo1VV+iUoAKMnwcFsQdbyuIwrY78ZF4Yryldh/XT660jjIzIIX4Qa6opGnFVTuRgs2//xGL
	pdlyYsIrfBon7ENf3zQT3/vS+Oww
X-Google-Smtp-Source: AGHT+IEscuGb9wt0+CpZenO2NMSf5QW6JYBAQ7BYtVdw0Is0BW+2/6Y3bhJY7rYbgezF7I5nTgkhulSd7o8Hdzkc1us=
X-Received: by 2002:a17:902:da48:b0:2a0:d33d:a8f0 with SMTP id
 d9443c01a7336-2a2f2a4f5acmr153730285ad.50.1766619283133; Wed, 24 Dec 2025
 15:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-4-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-4-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:34:32 +0100
X-Gm-Features: AQt7F2pbVgW1Xzj8p6pWnIHzWV5eNc9gVmLZCBJhyzjhG1GiyEAK3WM9YyEl5sc
Message-ID: <CAFBinCAwcdfaqf-23rj1xOMK9R7skPZKM2LrQLq92VwiMDOy_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: Add S7D Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_153444_187445_BCB665AD 
X-CRM114-Status: GOOD (  12.40  )
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

On Tue, Dec 23, 2025 at 6:37=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
[...]
> +#define RESET_BRG_A55_PIPE0            166
For S7 (without D suffix) this is called RESET_BRG_A53_PIPE0 - which
one is correct (looking at amlogic-s7.dtsi and amlogic-s7d.dtsi
possibly A55 is correct)?
unrelated side-note while I was checking amlogic-s7.dtsi and
amlogic-s7d.dtsi: why do we have D/I and L2 caches defined for one but
not the other?

[...]
> +#define RESET_BRG_NIC_EMMC             183
> +/*                                     164     */
this needs to state 184

On a related side-note: while reviewing this patch I'm wondering how
S7 differs from S7D.
Is S7 a cut-down version of the S7D SoC (e.g. some - possibly faulty -
IP blocks fused off), is S7D a slightly updated version (like rev 2.0)
of S7, ...?
What I'm missing is a "big picture" (for older SoCs we typically had
some SBC vendor publish a datasheet - for these newer SoCs there's no
public datasheets).

That said, I think the approach chosen for the reset controller (copy
& paste, except 13 reset lines) is fine because there seem to be
actual differences in the reset lines. For other
drivers/implementations this approach would likely get very hard to
review/maintain (e.g. if we end up with a 3000 line driver and there's
only 250 lines difference between the two SoCs).


Best regards,
Martin

