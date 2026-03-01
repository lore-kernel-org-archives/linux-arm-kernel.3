Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F14FD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 02:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=; b=39fnryEVq3gA+NS1/DuqhUaPZ5
	Rr11ULM4MwbvvDZ6ZifanP/xpbE8vjHF2LIrBx/6uXgcy6scNimaSpHa3Dz6FPsDNcAClDSLwxQjh
	vh50bzqq8+yk1y0tszIjm1g06hYdGso61Z9o+/9DY4XOm0idugDl6vwUnRWIuZwjUMS5m9o+Of0QH
	DRJLhJra95ynzWb4Zi4wpYZ1ygyMuceTP9XanZ3ceZiiJeUw3JMfXOdzO2bZEZ7M5Stv4HQCCd1yi
	8dgC6nN4B9yu2TgGeEConnWe5KkgvG2cXPGCTfsxWTZEFEmMlk7fpv8UyUe8J4JGnKBnzo4xRaCYn
	sGkegv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwX0C-0000000AlxN-3I4U;
	Sun, 01 Mar 2026 02:57:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwX09-0000000AlwY-1Klg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 02:57:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48375f1defeso23869625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 18:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772333867; x=1772938667; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=;
        b=SG9wk7fhIDwkiBAmdDdyLNQ7x5Heyy5qtYMUDJESf8nZpxpbZHnFakrRYq5syAeCZo
         n8LlKi77VoiglkE9ShNNWCcZNcR5fEPEPDlqfgRiUOBAWB14fkQ1vmKpOfS2SK0aXJW0
         N1mMKIWfn9WNcxBCfVcWwi2CgUgy7dZmBYQZvLKcmoySi5fJUKvJ3+QqJNVVMC6RRPo6
         pmMUD+3lqjAIgZ4Iwtw83HEvczo1ms7OzOolFqCL3/FI8l13RkdfNQRVs9iMv73OKp4r
         9+FwoMgHd9kqJf3OqVfEOova+700PjMQBl8C7ztUcglItHeKU8uWOqHwveJ9i8CJtokp
         6p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772333867; x=1772938667;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7j7u4Cgs/YgDdAJ7Cmwg6YLlgzhvBFEmlTEsg17hQE=;
        b=TPLSywhEdFXRhaupSXijBjHytZyjSjD1J4ZzDcIq+TyZJEhF/JC1R3JsSWFVYyqbwX
         FLnXQJZP9vHIsxCNmEvHT5F6ahIu577DXGW7iDqD8OwS/VRtKa2tus+oHAw6egn5Ospr
         0BTjNv5q3T+wnmW+K9y+wTpQXNRG6erwQMKp+Mu2pxM7o84+YIoblB0INsOXqJEVr/ES
         Tc1PYN6zkV6iViBLoLPd8gLoDWXCpQJnOyDU/Qog25fIGMF2AEZwvS71rccdjo4LrJIn
         J4Cu9OzX8Khp34vdq8Ndo3u4ECOnTHdl3elGyCO2sfNYEwYhfIH0xBvvrQONKjIaI/8R
         5N8A==
X-Forwarded-Encrypted: i=1; AJvYcCUN7cvTZF+pXId2l47oYW6Y5AMPwxBC6AuuG+beJ4k1MiWBkYOQNv5r+yymagATzycqEjHxdYcW5RxJQ1PIK2bc@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ7HPzZpxpdCFYB7fXcjWhM8i3W4hbJD1nTICvKX5FAf8iAeAL
	sU5Z2V0Wi4raMtgaSza/rRJrkfK5kH2/TILjjFWoaAn8mQttiEX4/vwty982Kr06uE0=
X-Gm-Gg: ATEYQzxvLuG8x/n0ZkXfatZOz+A4Iz7GQwryukf9h93zUvyklxSrhxy5rBoz5S+YlPS
	DPQxZxqHyRmGdNYnsiVRc8S6WmLmcW98K8GjRsS5UQasAwrULgY9K4txoZhJuZYhm1EM1VWRq10
	muGP2KFXm9JXj0735rq06ZN6YB5lKKb0Nhz3+e68qttHg4KIJW3wNaFw8/Ahv7Qtq4wgxJcV+ku
	dwwXn2IpdOAabTaIretDHg+HCvD0cnhOW/jg5vVV3F/wfrMcyUdnjxR89Z88fw9XpYvHZK8PKu2
	IhnVACumPC8As1dlXvit0LsiZP6L7jyOyJK4xaa8qhaXs0VHaSWye+oce4pfZM6rZZJii1gAdLE
	bw9ILfnAnwQDdKDaZ4fgoeW7Srq6xvQRSbkVlGaXgANg8EwFcLtH42NnssAXcqBDheXyoY8Vnmw
	oVUl6oR5HgI3O2bTHjRyU+/QVUltGo1dps4PSSaiqr8I8lPyhirfPi3BEprs0d6hry3jDUHQJHD
	Y0Yo5v0F0C0dis4vg==
X-Received: by 2002:a05:600c:8106:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c9bb7b7emr131516965e9.1.1772333866793;
        Sat, 28 Feb 2026 18:57:46 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:6ece:b3d1:ab81:6eaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c764a35sm19633263f8f.30.2026.02.28.18.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 18:57:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 02:57:44 +0000
Message-Id: <DGR3X53FPO88.3C2UO0HGRVQGF@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Daniel Lezcano"
 <daniel.lezcano@linaro.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_185749_385207_32EA76B4 
X-CRM114-Status: GOOD (  10.65  )
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

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware.

[..]

> Sensor Mapping (One-to-Many)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> The SoC contains multiple physical temperature sensors, but the ACPM
> firmware abstracts these into logical groups (Clusters) for reporting:
>
> - ACPM Sensor 0 (Big Cluster): Aggregates physical sensors 0, 6, 7, 8, 9.
> - ACPM Sensor 1 (Mid Cluster): Aggregates physical sensors 4, 5.
> - ACPM Sensor 2 (Little Cluster): Aggregates physical sensors 1, 2.

What about other non-CPU devices? Are there no sensors or implementation
currently doesn't support them?

Is this implementation and ACPM TMU support exclusive only to GS101 SoC?
IIRC, mapping could be different for other SoCs and, for instance, last
sensors could be non-CPU devices.

Best regards,
Alexey

[..]

