Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2073C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=; b=L4locd/gOQoVeCkt+VTxDyt/pQ
	1SG0bjcf0jaF0Ru9mUz6Im5UKjFLYR5Y2iCFqJWeDvuLLbCivme/h574X+PBBAKt8ODG1LmGyPNAC
	GaacOHZfpiFRWna5IyAlS3g1HRAw00yE9zjFkfNoC87TYbYHlPV0byLRTSs4Sn4W+b2UuE6fZ551S
	VhPKIXRU/iw52Q2RmDN4IlsVXMQhz9WafzvcBFRKPLqmak0CHaWm1sqBzNJ6sNKHrlUor4HWqtP0C
	FpqzaNAcZVLHV+dblxqfIkJr6S74gSs+vXDf36Vof40ESzCCBLXBn2mb6ZI6FATzO/pAw69EriraD
	ECOA3yhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew3n-00000002J1p-2AjL;
	Wed, 01 Jul 2026 14:37:07 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew3l-00000002J1K-2VUW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:37:06 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66493875766so917339d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916624; cv=none;
        d=google.com; s=arc-20260327;
        b=G8F/dVxqiHMowEpBPI9Aa5ArO5PcGRbZiTXIa+jpmPmDsXHcKj7ylDs6guNwYNyY14
         TzmqPrzIDnfT9aLbkoGJE2sY3ZqL+RiMAUm4OGhqG6u02XI2FldL4PY6IBkyDrPc3tcr
         lCUNjUH4Z89E+jSuB3rf7vUCzYwEkg3Cu8Hk1VEjL7pq78NZ2dN26z6XHfFGX+RXJa7R
         Ooj2BGxdD9bLT26In/znMXZRN6Uiq3wUXTcNIL9qxg4ee4XobvpzLzgUYv/jjb55023a
         CCAx1uaKTUPIOf8WO7FMoqNMSM8Q9Jtci062stp4ZKxqUQ6zuXyhB81qSzqIldwg6Zoo
         r0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        fh=v5Nd2GBeLgqvYl4fi2SYEjEW7ULl7NrveTNIDU58Hd8=;
        b=RNlCzxT9QU4Kgvz2O2B42FfxaOPXP7TG5pkxd593FSiqk4WR2cek3JyxXzDu4z5ayJ
         zHEkZYdUiLwA0DiCPC1egztmpnJ5zKrVoyPwshLDFRIqe2UEkvsy60GycEcoV70opwca
         v5eqCYJIZNKsnAguCTIiC5tt6Vq1aQmGUR3lLbbBwOz1RABc+dTvwkV7B33mb2kkUi/o
         rCxLRQ45K8g8VSdmCw4Hjty7t/XOa018IMGq4IOuiarlmskzTPCtLzW/V6cbZJ45jDXk
         FBCK5myYyLXt7c0PP7ztLgiaMxaO8P6zSlYAh/K8AUBVWcG22rUTcgbMvwbPnzLVTVfq
         l+cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916624; x=1783521424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        b=eUn0wXOvSKn/XOvuuuBdJs8HhcO25PTwPROyjT4ujy4hkxNBg9fuEoz6tAxQVjDzaF
         OgQZp/szkKY2dJXjx4ScikIcBatHUrIRQyRv8LEEySU9eAdWlB2ufr+DpXHSMJyErRkl
         iaZQ0VErRw0WTPBNklMOahGW4YUAWaB47HXrN1/jzpTyJy3eNKzl5b6UER+55E0u95Tv
         pMgt1m8zzY6B19ESQdvpLqsFHxLLPHVrsEa0TVQY5TaVMU9JXwRtQxWMXFrZzkltQAIK
         iJw/V7aa3qk8OlImW/eWUtftursc0K62DtgEpGeDCg+RKrVbX8z4EVwsWiSZJ64rUGry
         ZFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916624; x=1783521424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        b=QIn2YKhs2ghGnBjAgK0TWsDHPt3g2g9VtFeiYM6j157Zeu9kqvc+JEHVHmY5XKqaDg
         krqduxrDgybBizOZljPOw1nBqzUWfIH4nqejUgIGJsJpwq6Zdr5WE7J7x0jsp8wUp8aq
         Hn8MCEdjpiRJscuSyed7T3KopZNb6r7BeplJpJQKpgtUkOHz99LSKBqJw5RLYO9KrCde
         EKpf+UksBgG3MA3dVfjgQp2tvmC9uBlb/eaJ0zHatXaPgAjVbbFWx5/DruHJ/dlo146O
         UGD5lPcmP/PR7EslCbzWblNJOBgtPP0XbSr1uQz1InoWDl6hvVEdB1JjXrf37auMtFt8
         Biig==
X-Forwarded-Encrypted: i=1; AHgh+RomZklKK6GTV/7faE/6/L2X+eLrxOVJJr4URT7Sw9v4T7GD6eg9in9O6/mektmLypOHlWXGVfxjurG8Gpf49z85@lists.infradead.org
X-Gm-Message-State: AOJu0YxSSWXb7TuOWtJqsubZAfx2pHf8IfkIEAFiNSpzmbwEphPl8ZeF
	l/U5410kuboFBhcsHTn0dsfyrF77sbHDNKQXdptXSjtpb92AlVQy2kAV9B7IlUPb19LIC21g64M
	JMi8tdspjplzZUJGoSgEgrpEq8bIq47Y=
X-Gm-Gg: AfdE7ckqlsyJw225tqoUJ1MotGsATmdONDSZ12y/P74UYfe85M27FhLpQpxrvTb4z/o
	cn6ZS1CK5tXnDcnG/If7z1JDiovKEmBASgKfuz1S3QAP9McxTFbQFpUjbLOU8hGFLh/eQnBI99p
	pvk72uHYXaYQ6J9b7h9yFMe0EHOTJknC+eQMuw/cN7cWvQUl7wEPk0XPvrXS9+Otj1Hz13C3tJV
	IZnA5Sg2Qy5jLl1n4VO9on2CCWkRY7e13KQHvI2Y1Tyvq1PnghA2qUXFvZYYhZFnS9y+4Ra+sW9
	ge+/dNUIR1xzOVa44zuQ2gcJ+NCFKR67+sIKTkCB47eH0e6djiJix2QKNFDJXg==
X-Received: by 2002:a05:690e:b8d:b0:664:ae68:33b0 with SMTP id
 956f58d0204a3-66521d75bb2mr1788278d50.81.1782916624248; Wed, 01 Jul 2026
 07:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-4-506d936a1707@gmail.com> <20260630-halves-magnesium-856f9c7d60b2@spud>
In-Reply-To: <20260630-halves-magnesium-856f9c7d60b2@spud>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:36:52 +1000
X-Gm-Features: AVVi8Cc_Z2Ec3ueDKeRbjSSEO7FpMbGiHoLBEK8cPVlZ9DBrXWtcjp1MzslxPtM
Message-ID: <CANpmGNs9PuH52ngbZq6jGHuJkoZ=Jz+PRk8Bq7Rn21g9KsotEQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: input: apple: Add DockChannel HID transport
To: Conor Dooley <conor@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_073705_659516_E83B7C57 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, Jul 1, 2026 at 3:08=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
[...]
> > +++ b/Documentation/devicetree/bindings/input/apple,dockchannel-hid.yam=
l
>
> Same thing here about the filename. Looks good otherwise, so please
> change that.
> pw-bot: changes-requested
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
Thanks again, will also adjust this name in v2.

