Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E960C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=; b=H+IQ2JsGPozvHVDVbyW6Sm1UwF
	IvBQK5eAWYfSNtu6xyxDow/ujIqwuoCc0+g55gfhXNaS8G0CarSPrkXFtLuHzAcaAhma0CrqMAVak
	9bgZ9dy2qIB3FAPMPqZd9lNA9AjVlKQMfd1/zpyBYKoi882wwuJ/c5MP8mdi0ImrkvtGr8q9Gi6T2
	+Bc3qyulSTOVQjkdrM27RuYZa5k+6BvL1o3eG+iEsQZZw/7y4ZrXNtG/IWlcCkkcB1RZ4LpxYwQkd
	NDG4ZEblTTrHbVfqUwgB59l0sCH7ZIg+dLKlBPZIO/aCWbKa2/xKLwUgKx2+maZFeFQr9KBa492GI
	VtPx92Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8y2-0000000HH5i-2OO8;
	Fri, 13 Jun 2025 18:17:32 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6ud-0000000H099-1ue6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:05:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b2fa3957661so2020471a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830751; x=1750435551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=;
        b=IivvQkoUDDB3zYogzEfpL/nsGx8668yK2ZHpGWRNIpASABUci0qMQwLOsg3nbgohOW
         J8SniI5OKBiw/nw2EWYCCuPSYXdted5oESO1CFjAtQ27nRTYYgZixc9BBIajK2WLr1Eh
         q2KuHw2Ms6Ef6dUXAMRn6ysrYRzVwmphw8jcMoaekoamP4evHEdvnKi8r6xlV4k/wAQS
         WJ28uRLZw+uDCUxvyrcwBTAUWWdBm0CFPiANUPCk/xATQgfWdhD3CUJk4zJXjaU7JjKj
         BkcXvW3/vj0gs2mL47WDdz3UwAjvtUEvLYbfuvBquzJNAChDr6mtAfBbHAfEi8QreFNy
         fdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830751; x=1750435551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=;
        b=vChQPm6kiJ8eTiUf+t2GAUqsr/pGSyDtvQv42GPQt0fKqTKolo6r/3WZ6/OjePWQwg
         0N4k3CogqDuRMy47MLfbDUNBLFuSDbtNb7qHBg+XiJCQvnbo2epMCVcG4PU3o47kfCWn
         EtSlDFwn5jiOSaqY27ZyM4+O0AJjTl53Og8CxEqsh8LvcD4l1lCEq/Ls/n8lUNu3j1C+
         fxY5Rz8/9iotXZe5gVzyHOarJTiNjN1sO7/dqubhGZqPiaM4bnTeaZXMVBgQskFG+0O5
         GihsIWvjsauaHpI3RKn7sJLJ4/+kQa+r7rWGGV3rRMUZFXIFpnZPP0WYqhdwQbNkUaJg
         SKIw==
X-Forwarded-Encrypted: i=1; AJvYcCVMvWpUPTF0/vOr2UzudNItEO+Aa2KcW3R6BBmdQ6teqA09H/rzWbUE9pCAH8C+1IqsGqqn0PD7JjzQl7QEO2eo@lists.infradead.org
X-Gm-Message-State: AOJu0YxSUks62bELIXQ7bh05nRqPbDFl3dU37g7Y2zz5pT5z4pwuq6ak
	6KiL5a7kUqSZ+D1eYJDpjQkpglV5ai3SG+kJAE5EF3MPuuspJwFtGdlWcodES9+hMVoao1ksAkh
	PZjlYkj506uoL8a0V8sU8b7ttbbLCqA0=
X-Gm-Gg: ASbGncs/ZflF4nfe0sKlQ6HuIeYGw1donw7mI+A/5p1vd21nuHrxIwhoCkt6CpYx3KG
	rj8v+l4pAvSPkTdA9XCT7hktQGzSTpEEhTQCZPml1XqNVbphErggiWiRfR96BelqKZUZUR5X7v8
	kufobXUvK0LhLkvHqDK1zwOvD/ocvJYAJXOcas3OcCp6BD
X-Google-Smtp-Source: AGHT+IGkRwuBDi8P1hGdy0piKZzS+a+5N+inyeIw1I7jmEwifkcgqsBw7iDP3Xyu6Jz+spOq3lm/iRfZkorggjRDPA8=
X-Received: by 2002:a17:90b:2e44:b0:313:28e7:af14 with SMTP id
 98e67ed59e1d1-313f1d5efe4mr350773a91.19.1749830750557; Fri, 13 Jun 2025
 09:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-4-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-4-514cdc768448@bootlin.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 13 Jun 2025 11:05:24 -0500
X-Gm-Features: AX0GCFsijTlH9k-tyupTKWkiHQY6VEd8JiYrIAPf2uoe0h8I7b4t84UjPXX0FBg
Message-ID: <CAOCHtYg10H537Hu=kMqgFashuNHK_pDFZ_SQsLaJjG-efP9_Rg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_090551_494007_7175281A 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, Jun 13, 2025 at 10:51=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> Document the seed,am335x-bone-green-eco compatible string in the
> appropriate place within the omap family binding file.

just a small miss (missing e): `seeed,am335x-bone-green-eco`

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

