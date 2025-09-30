Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2936CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ0CnHPdlZrSsgwV+MI1ugRW5zrN2qsnIK75AqoOWqA=; b=4G11nnYK05qj9gopHMlMJU/HtJ
	3F+jr8M3+RoIoJFcI8iV7iCW7oAXMMpLltZBM4YYr5FRAojDsN4kcq8aDSCaeHCyO2xk2QubDAvMw
	T+W/jH9qJEdDWZmLj+HYE/gpvL1JWMBqD9RYL77jYb3AQ3V8LKqEv4rKes5qbqbLqAosyZ4dd97ew
	y+WTjoNzyGgZcz373v+PBls8HLvhzzWZVRCznuox1lB3ktE90akIN2zFv4/5Egd4u0Z8gYx2gR7pN
	5HZr4yA309wmJwHlfEVazxz/zMjXBMCPxDA+NrwAS65boi0kFGoxPHRn3QsriACaVkTzDH77vYaFs
	q2yHqbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Xu4-000000053an-2Vu4;
	Tue, 30 Sep 2025 10:48:16 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Xu0-000000053Zu-26z1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 10:48:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3d50882cc2so469124966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1759229290; x=1759834090; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ0CnHPdlZrSsgwV+MI1ugRW5zrN2qsnIK75AqoOWqA=;
        b=Sa6N2Z+3FeN5ykM6oRvRiCMq8njALMnMDfBU+sleAkwd9Wt+ZWHDqmIWnZxYXvy1Yc
         TN92ptyZBo2tCQzWk5lYE14Wh+n3eyJ1RhAMfPrdTg6jN41T6bK55n/KE7u91qgdllT0
         Y6ctHEuXBHLbe3GgvDw1ND0uXeJPX85DrkAPcE3u+LofdBOSv+SzsEmLPlUmbrtBxknf
         QGXU0+f1kxpXLL/g2EBjahSanlksqMDthomlyU5YvcfKsZFbme7pEYHkLfHw6SwYbvd3
         5PpJZGWx3yYokgq+wAvqTQkpvtiCfrnT44NcgMnSyMZr9CbNmQSx3PEEYUZ/9oPBggrg
         V2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759229290; x=1759834090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ0CnHPdlZrSsgwV+MI1ugRW5zrN2qsnIK75AqoOWqA=;
        b=jW+sO7HEApyjRWGuWv1j0A7mGsFYYc8XVhUr0pY+LCQYXHLEY4JxahE2fy+KtJXSYd
         zVLTPG9X0ETqm7AI+RlZi8qtpH8RbuM9tDnT6yVTMq6zGSiaj4eaW87BgqqDgz2Zx4jv
         62aq26WpzO/Tqk6Y5NfWePvEttWC3txjznR9PDHYbkVEieD1vnhdPmkt/ck9kzbVCbc0
         2SIv6SrGjNPms9AT9EDYLCzdDsneXKCr8ni/8cjAsI0AvMqLtC9gU+gl1tKryVXVOSHC
         e4kvKwVKRVY3uYi9ef2oD+JMlwd+ExQnqblgGstF1WIVpmO4sUe/BETZbOtZoRbIEwQ1
         dGkA==
X-Forwarded-Encrypted: i=1; AJvYcCVAv0Fq1zfEcdzcAjuIB1vxK2S989AfF54djIRnlTwBq4ZJNPI/AsPob3xOJSSKG+tiqAPxq9XXQwLGX2lWIL6d@lists.infradead.org
X-Gm-Message-State: AOJu0YyNImvidXDxpTyOD38cA/yOtq4drM8CMG1ZlbtCUAyWWTtmZfnP
	m59cuhM5k2qkYgVzv78m09udTmvpeSyTqak/HTY2j91z0UR0GEZCJZmDFnI34AVJZg9hdctRhBj
	nZn88UaX+3+8NyUwecmeqB84VHq0uoAAMsopagEEZGQ==
X-Gm-Gg: ASbGncvPQdxxrXnP7tXhcCeMWKKQnxzXwZ7Ql5lEftYkC5fdCGMXVkCULVeE5dyhdFl
	IgPbIXCLi7wiBRlppFHK9Mh0T0o+pU7GL6FLP5sqgKKmZ6VTzfNJE6JMGCZSxpnW4zdivpFa/91
	zpqZC0iu8B8Tv4//ZKPlgdQgWRScjW0tSdEBaXVmRsrha5ER74H2vIdlYA6DZdEoskbhiJCDVj1
	faT6O11ezrhqDx8f/zJIwlNpwQ7GpnqRZMLSN7sQZmCsyiN4SeJxdjto+R8XzQwmKc+AtrH
X-Google-Smtp-Source: AGHT+IGX6zNpxjsPjtC0C+vJp47Ah8di0xP4NLfAUEWW/OF5HmCNHB9bJwapc+3TAx0PM7pbADgUcyt3dY7ecyU5L7E=
X-Received: by 2002:a17:907:2d1e:b0:b3f:1028:a866 with SMTP id
 a640c23a62f3a-b3f1028b3c3mr763065766b.15.1759229290129; Tue, 30 Sep 2025
 03:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250925000416.2408457-1-svarbanov@suse.de> <20250925000416.2408457-2-svarbanov@suse.de>
 <20250925-outlying-causal-015d8ba33c53@spud> <89dd04b9-e261-4bdd-83ab-499e46fc9c01@roeck-us.net>
 <88bd67f2-de8c-407b-ba98-08663eee2d7e@suse.de>
In-Reply-To: <88bd67f2-de8c-407b-ba98-08663eee2d7e@suse.de>
From: Phil Elwell <phil@raspberrypi.com>
Date: Tue, 30 Sep 2025 11:47:58 +0100
X-Gm-Features: AS18NWD2rGnxVnwcFBxYV1aba-fyNrawMU6W-du0N-jpjKmm4LpdaR5Bhec5eAQ
Message-ID: <CAMEGJJ0KqPX462iigbMP+fwoyZgZ1J1PqaWt82MrNTW1VMwbpQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Stefan Wahren <wahrenst@gmx.net>, 
	Saenz Julienne <nsaenz@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_034812_730125_D6E2B9C7 
X-CRM114-Status: GOOD (  28.45  )
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

Hi Stanimir, Guenter,

On Tue, 30 Sept 2025 at 11:21, Stanimir Varbanov <svarbanov@suse.de> wrote:
>
> Hi,
>
> On 9/25/25 11:37 PM, Guenter Roeck wrote:
> > On Thu, Sep 25, 2025 at 08:40:54PM +0100, Conor Dooley wrote:
> >> On Thu, Sep 25, 2025 at 03:04:13AM +0300, Stanimir Varbanov wrote:
> >>> Document dt-bindings for Raspberry Pi's RP1 ADC.
> >>>
> >>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> >>> ---
> >>>  .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++++++
> >>>  1 file changed, 46 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> >>> new file mode 100644
> >>> index 000000000000..5266b253fd2b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.yaml
> >>> @@ -0,0 +1,46 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Rasberry Pi RP1 ADC device
> >>> +
> >>> +maintainers:
> >>> +  - Stanimir Varbanov <svarbanov@suse.de>
> >>> +
> >>> +description: |
> >>> +  The RP1 ADC is a five input successive-approximation ADC with 12-bit
> >>> +  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
> >>> +  and one internal temperature sensor.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: raspberrypi,rp1-adc
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  vref-supply:
> >>> +    description:
> >>> +      Reference voltage regulator 3.3V.
> >>
> >> Looks like you're missing the io-channels-cells property that allows
> >> this device to be a provider of adc channels to other devices.
> >>
> > Only makes sense if the driver is implemented as iio driver.
> > Which would be fine with me, assuming this is a generic ADC.
> > The iio -> hwmon bridge can then be used to instantiate a
> > hwmon device if needed.
> >
>
> According to the RP1 peripheral document the information about ADC is
> limited and I cannot be 100% sure that this is generic ADC, but it looks
> like it is. On RPi5 board the ADC inputs are not configurable, but that
> could change on another board.
>
> I personally don't have objections to implement it as IIO driver.
>
> Phil, are you fine with implementing the driver as IIO?

The problem with adding unused functionality, apart from the effort
involved, is that testing it is harder. Will the IIO driver be
inherently better/simpler because some of the hwmon support gets
picked up by the generic IIO/HWMON bridge?

Ultimately we'll make whatever changes are considered necessary in
order to get this simple driver accepted, but it would be nice to feel
there was some real world benefit now for the work, not on Pi 6/7/etc.

Phil

