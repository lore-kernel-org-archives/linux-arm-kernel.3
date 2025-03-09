Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76CEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=; b=iPLKZdpS+arNIHmFKEA0VqCpSI
	ti8WcijYv9jIfDTHtoLY5HkMudHtpSF8XHbnrkvTsdpJENm4sEqZcUKuYqsT59GICcmVxXBxNOsQF
	YJst5Q48S//wiWpnJ8rbd3Z6OfDP56hYVYGqItIKlE1LIzQVTPlM8hK+aikESR63qb9HycY1WeL6E
	4tN2HnvOS5TrIov0XsIkUxJGPLCa0ZbSlnbNOlimVJW7geaBstR9k5xF8EQLpJwTCy2xhb2ABWz4h
	fLzrnPWBM4H6Qxtt814pLAlo6krMLigt7teoZrvv3ubmMy7b5RfnBUebyKH9EGUE6f9r6+iBOSgT/
	MtqSm5kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAgZ-000000005jC-3IjV;
	Sun, 09 Mar 2025 07:02:55 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trAe8-000000005W4-1tmx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 07:00:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abbb12bea54so596955166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 23:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741503623; x=1742108423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=;
        b=Hk308xVzMWpBdZfTmfEkml8DLXVrNfcootlj4Wz0TuWM2AByAybhRU+yQrlMYY6bUt
         Wbaq8ALrZt+ZNAZtwxh/BOUkTkZcXBG2loPohayTL4uK2EKvjoZfV6+g1fnYm+HJZjPR
         VseoRyVexqM+IGDxJ/srRQZQ2X8wmItMcUVf/7XF+kmc+XOQJcCmQ9/BCQoyC/T/WZxG
         XdPfiATqCUV0aYA9Qvg1a/+UsZCfxV8iAvsx4zuPhkI+gnkjEk3OcDbG7Oe/Wki0Kagv
         9Ph7X1qnYKR60jb6op+K3xC6KVTzHryi+zSrtzgsZ+RGTuMOT2FYJj+pOob3K0B7oldV
         3zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741503623; x=1742108423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOXmjlR5Rk5KRf6rwJVBLM/R3Wk88g6lM6HYMKYo1vc=;
        b=vENSKaqXEjI5pvyIbE9+4nDKbWNHAlPf0Qn3V6qv9GVIaT7Lzh/xV3wpwDy5Y1zpen
         C402tvAgM4T0/sjDUXwWcFoVq7/RMfiV47It+iqskk1QrV9d+cpuVCyTRAVV9PXGTOy4
         /BJicL58PxqLrVLT1uqXcMGlczXRfL3TJtKkKpJAB/iZV5jJNr0Rljx04WBR47JrdCbO
         fuN7IlG2K70handfFK6JWXAI9vsRpC5sgcGVOsscYeNssFhhGzkXuvflBcYLNImFBLsM
         uF5b6wQbaI4oBAiRW1dv3wD6jbQPWvzszpZCXbBqJwWwnt63WyK8NUNu6Y+UsUZ0KmWO
         26Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV6uOo9F0xBTSl7SejMwKdHOqUmdlsu2Ehj0UdWQkZbfcKcKGZWCk5yQwzzIyFROS/TqYOGcVXo1wyCyR1N0I+T@lists.infradead.org
X-Gm-Message-State: AOJu0YyYPn7tq5HWbhUdSZGKe0a8JTPgsKyC092nhkR/FCgIRfWr7z/K
	Lci8c9t2r+mKvQo60JLE4pDbhdCeLfMlvrgab6TAticl3KNDIk/T
X-Gm-Gg: ASbGncuZrcsLmVLYMfzewqLGrlUYPcZgQhFzJslWHdcgymFTz4gDblDvG26qgqaiHN4
	v59+MUwk9WPbUEt5K7Y8uBwbTrioFnC8hnDoUhg/q5aLNkvy7AUJ96Z3836aZDrGoOTl6Igw5es
	mr1JjIwe1nBHu1SqwIrdhzGXgNPTFC7oNRptUMK9OBXDSJIqbQRGpsryLGAZbXwv2vnt0o4DcIZ
	LiXTlPOvnFL7qpuVigwKYjIoPSdIL5XOZhZCWFYEu3UjojgtGqoZRYQgGYfWfRe0KhAIiUeGYbW
	nsU74B6B7me04IssD3ikCKqMESLIuvVQom8ai6wyoAPoah9fthamFOi+zs9xkQV7SA==
X-Google-Smtp-Source: AGHT+IHYSxE3dHIHTEa8uoEGGMpuf/AZ9EL0n7GTLf/jTzfr1egAgB9Y7RFOLIp+NZliiikRziEP0A==
X-Received: by 2002:a17:907:94c8:b0:abf:45d9:2607 with SMTP id a640c23a62f3a-ac252598005mr1084558066b.3.1741503622721;
        Sat, 08 Mar 2025 23:00:22 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac299a025c7sm14713966b.51.2025.03.08.23.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 23:00:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/14] clk: sunxi-ng: a523: add reset lines
Date: Sun, 09 Mar 2025 08:00:20 +0100
Message-ID: <1994155.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20250307002628.10684-14-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-14-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_230024_496868_02C97245 
X-CRM114-Status: GOOD (  11.64  )
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

Dne petek, 7. marec 2025 ob 01:26:27 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Allwinner SoCs do not contain a separate reset controller, instead the
> reset lines for the various devices are integrated into the "BGR" (Bus
> Gate / Reset) registers, for each device group: one for all UARTs, one
> for all SPI interfaces, and so on.
> The Allwinner CCU driver also doubles as a reset provider, and since the
> reset lines are indeed just single bits in those BGR register, we can
> represent them easily in an array of structs, just containing the
> register offset and the bit number.
>=20
> Add the location of the reset bits for all devices in the A523/T527
> SoCs, using the existing sunxi CCU infrastructure.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



