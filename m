Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F0ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZZmp3CRIOdGFj58JHDnDs9xiyHh/RfAbGLo8F1+ehk=; b=aM3j3v5MrTqE9WZWB5SNdkvw4E
	BLK+S7S9L5MeydrEvfF52TiaSNxJ5jpEtSbf+LGasOBg2jVtXKPn/dpfL2+I0OZ4zHZg+9hRP6V7S
	t+MwBhEHKMR+AdxfMmW1NP1Z7Sx4Nfl0xM7hNZ392WLM2zRYi3xuiXtqoZn6iA4T7yMkf6JE6BPuv
	0R20yl0LeY5vWESxNJdcJADkHx6NqWLO2GTRF7gnw2MIJig9KTASII5RR/HK1IJZHb5GhPYg16vG7
	ifRAefjq4KSvkUyaq71FawAdeOW0O0gPAqs63DXq0TbcDGGdVu6i97mzkFONVMOileitDe5yk/Cwa
	76Tys4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4pY-00000000p91-2vNQ;
	Tue, 06 Oct 2026 13:03:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4pW-00000000p8I-1amy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:03:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so4976545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791291816; x=1791896616; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZZmp3CRIOdGFj58JHDnDs9xiyHh/RfAbGLo8F1+ehk=;
        b=GWzmmdd5GC19joj9vh/Kk253oqiB6OoCVZBqjcHtiyeAPRRNZPs1j200BI8SI3p1fX
         4V6SlhS+IFzao8lOG0MHB47EHbvrXKYNhlBgY6DEaBHX0ciR7rC5gANhfhglNA2ekToY
         hH9aVYdKryIIyvbxrCeK8KH/gWfizxH22bh/IeuzlYm/VxNxVU4vpIn/qxp/NhMDcY56
         v3DLE9wgGin2S5WUOh7bvBnjPeToNek6uoZPA9oOOH56msSWji1eoRqoqFOL8Od2iIrh
         ITq7UamZBRgdAKMTLUlmmfQv7hk1xaimeG8wLAA/2KZ6RMWchhcT/TvgP81/FYOeL2dQ
         necA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291816; x=1791896616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZZmp3CRIOdGFj58JHDnDs9xiyHh/RfAbGLo8F1+ehk=;
        b=MxlOwW6XqT211R/xvKm8yuLWK1kWFUDx1NceAIYolkVww/HqE8gdRLdgRz67Z5OmRf
         qLns65QddCx7t+yTxMhaBxoaPxucPDoi5GSSHyR5dDJ9W46aGacaiDjDU3uJkyehPmZm
         QRive1bVVmg3BFh4VypvWa641SnZBoAYwKiLxCXFE9ur/30Cu9RN+RAG/G0J2OPtTmH/
         WCp7v8hQjkNeavy/3jnNkoavh3aoPx862RPGpaC0w60Iw3BM9goRZQ2h33JwZqjUjWrg
         gIlDTUhgQdPil5A+QIZT+/pvFBMit67tQOOAEay694bOaAAflnWs0S9wkrZFXC8uKjIL
         Ispw==
X-Forwarded-Encrypted: i=1; AKwUvByvNLkIgobmJ9V5bkbYno6zY7qasoX8TBdxTu6xrg1yuX8bwR308d6Zjk4cW349k7vUMoB6l/XP3yX7OsXFSZdg@lists.infradead.org
X-Gm-Message-State: AFuF++lVdCWAt92kGyYoqpTaj4Z8BH9ucLvTzUL51/ovhNSHnds4U2Jj
	uFGBMjo4OcoZ0zl2/vS46Gkjg9/ditgrXyS/eCON2J+0aZgbhqFJR3luVI8ywqZsLEw=
X-Gm-Gg: AYBFou23AZMb91RQBsehecCU+FKnkMaDjYeFpAW1GmFdR8aKzvHWqEnMwQ8VhsH0wd3
	MQmGwRnZLHHVa8mLvVarPxvLaJitqf2sLPpZnhOp4zYsnNC4GGI6kzYkD9rmpHI7gm1T/yIAlUE
	U4wfAgj5tW0xYvwcq4dxQqEDRd4Tyoi0Lfv29FJ30YoqCqV4c3GZc1ut6UCftWQNTj1aCr8OwWV
	OfI/mi7Sc1HE/GM+KIJHPtxkKLkYg364mMpEMrAGCv3Fm5pJuj9zXAWxRo8v3kMC4Kd/jDDe/Dr
	+ug+uOnXENpxfyfmnd0F26WFxlE+KsScIz/ENRwoTSmy2+ixcS+pFeHLiFngfX0pYO602Ft70C1
	Yivm/F+f0jkBG5iDETKQOVBLwnzK0Gb7z8ANOqwSuR98vR1Q56Behf/LaiPtMgORJblXdlWP73F
	jQrtzm8i3q6gkTztri9T1uo6EWgxEFmL0tBe0clx9C3UXo6rh1Hw5a5mTRZQ3dWbL2ungbnl3JP
	D47EsqLOAS1869+P9S5
X-Received: by 2002:a05:600c:c490:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a17b53656amr21782015e9.17.1791291816314;
        Tue, 06 Oct 2026 06:03:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178caf832sm81042065e9.4.2026.10.06.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:03:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Igor Velkov <iav@iav.lv>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <179126094299.1095177.4869656735733059341@iav.lv>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
 <20261006041733.8C4081F000FF@smtp.kernel.org>
 <179126094299.1095177.4869656735733059341@iav.lv>
Date: Tue, 06 Oct 2026 15:03:29 +0200
Message-Id: <179129180999.592940.1230542534490853306.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=an8RRqaHB41r0ebVeLgeXHHwXpS6JRCN4uHoaw5ZiSU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqxPGmrDte5eWAM2zYZCOxW+dCQx8lZh15pobaMzdK
 8mhJRwOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCasTxpgAKCRB33NvayMhJ0XryD/
 48bpmUXwaPrcjsq5bMH5cKzGfT54W2AWi9J6zlK/7uVia8sMg1eGMfQciIz96Z9EguvHk1CpDiEL1g
 UkGmSjQE6v7C8p31NwNiO4Wmv04iLWsQc3HCW9nFuJLTkD05DVmXQW76hrxq8Fks+4Twyj+lQr1UPx
 LLqWXxFvdwh4wOTenYpKuUGlAXYizzthnQkilSyO6nqdz+WpIj9sQCr5gYi60L+LhJfNeZ1VsCGaAZ
 SQ4oFW4pi0ZBiplW0d739hCWQ+IaX/BIzQ0BrTxiHM3eMwJAI5h49uDpyp1fOzJfExphssTAwc4YQD
 /C2A8wTq3eVk5DIsQRBLb3iSe0+O+dOOMDIXy47U5isY0WWgNwubBC7fkmA3b8dawfZwOdbT/rSQ4l
 uJTdQxz4VpKNvk+fdGmiBUjSJxiwwbgowIOPu4mwOo8qztFd6S7HpUH6cKZzEL0Sny/8kgmodOXyTG
 dpbxnoekOMkmqmghcLsQWAoWKPC9gcSbWw5WL7d7KvnmTdeS2jRFef84NmI1ys10EtS8IfsAHc9Oav
 3uOP4tnpM+b+4Ew67j4fQm1wb/dFuG2o/fJfwssqHNrg+6KMCnXDrD906eLuPlzRlqeb8sXBuUnOqC
 l/XQMQw5ZPbpbyyF5p8bBfHZqmv5wAg56d9JBitTQ12lYBC5g1xU2vid+g/Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_060338_429982_174D191E 
X-CRM114-Status: GOOD (  14.21  )
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

On 2026-10-06 07:29:02+03:00, Igor Velkov wrote:
> On Tue, 06 Oct 2026 04:17:33 +0000, sashiko-bot@kernel.org wrote:
> 
> > Without an explicit pinctrl-0 property in the fan0 node, will the fan
> > tachometer silently fail to read the fan speed (always reporting 0) on systems
> > where the bootloader leaves GPIOX_7 configured as an alternate function (such
> > as uart_b_rx or pwm_f_x) instead of a GPIO input?
> 
> Checked on the board: with GPIOX_7 muxed to uart_b_rx, the interrupt
> counts edges as it does with the pin as GPIO (452 vs 445 in 5 s).
> U-Boot leaves the pin as GPIO. The PHY interrupt on this board is
> described the same way, without pinctrl.

Actually on Amlogic platforms the GPIO Interrup HW block
directly gets the pin input directly from the pin, so
the pin doesn't need to be set as input.

Nevertheless, so be sure there's no remaining pull-up
or pull-down remaining on the pin, it's safer to add
a pinctrl mux node for the pin.

Thamks,
Neil

> 
> Igor



