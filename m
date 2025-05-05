Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A63C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ00OPYdqSJ+4uv8ctKPBsBBA32+QMJJaxQcYWfzOmY=; b=mSJ7NvfUmsJe1KQFYZqDV+I2NB
	+z0kj6V3Kg8O9HOhDSngQKtwlwbh4LpSK8GNM6Ql1aUZTBWxeBFzOKY1NRkvbUdKdrlb4dk/ceOlB
	D3wH6VLjua4GL5sumDsFQgC37YY61r3Fv93xcwHA35eheWLJTtaVt0KkfL9460gfvLD31c01U3D66
	Nwb0ZVAdK4LRvru05V2dY765kkBk1zT/Ez91gmq/ANig3ApASWnFan85u978rul1Or4uB3wQT1Q5p
	w7a8IiPmvoVzk0pfwF1GLZCGtz1QnSxnn/SXAje2Ld2pOF1Ye/7iL6otEZkU+UVlR3A764QB4I9o1
	ASmf4YMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkc-00000007Rud-3TEQ;
	Mon, 05 May 2025 13:20:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv5k-00000007M6d-3Kw6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:38:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3031395f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448719; x=1747053519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ00OPYdqSJ+4uv8ctKPBsBBA32+QMJJaxQcYWfzOmY=;
        b=aUhw+970idHl2P/kEVzKSvK6wCx5AoHqpn78RwAtHe0o7nVP05mbpB5eitGRuW8c6v
         Wuux7rAOhxrBEUAdnGbapPgQUdkCg461CkJ4ZOZ2OfOSikNCFIoQS4fGkdecHkk/9zSe
         hbY+vDXlxO4PajLxqE0UNeCFA10d1KkoWlW3KPuc3woomFMrxwVIC/PMf1Kq84PK8F92
         qL/v5dmhgdo0N7LWeHcu6SW1Bx3tVBuTKWRzzEdqk2NeQYJKgmZyzXeM6uVQejcwmofS
         o5/YOlrYTm55Wh2aAOylBZ6RjUjtlPasHSpJwrdFxV/4+t5w7RULH9xsU0zr5c56N7On
         EoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448719; x=1747053519;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ00OPYdqSJ+4uv8ctKPBsBBA32+QMJJaxQcYWfzOmY=;
        b=UxxBFxZhPGbCfuKuoJSRdzhH7WKNFPyansC5NVm1S6kHAPbLvS4Vo00AAiKT5Xn55x
         nwK/SN1UCIxH7+TSfB8XMt8LbpJ5EVjAegtRindfeWhkVRQR7rOV3P3ubo/ueshR4Eap
         cf4HNvtSM70v1yXW8oVeFq6K2tzX3YPsuw+AKVGYuyBvNpwSjBoQnBxqRNoOfMyS/60Q
         CUCP0YPwt44+UPAx00l8btATP3aIhfzsbxF8+k6HOByPWS0oHU/GYlJwluUUk++rUSQ5
         lfIA4qnOrDVPz/tLLyjzE/4AbZ6WRdsK/J57cGEmTapkccjyGMjznFW/U3vlc4ZaIRyB
         0+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWqpiZPMD/m3HDTv7kabXt5NUgqWqZD+jLJfHYm6tqydGptWoexWPrzPaVWWPx1yJMJ2Vh7EBF/t4rzd/rMJOkk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2bxG4jhDaFzL2DYnXdKhtVuSk1k0bfjT5qhpIaqwr1mJpKEuP
	j9wtq/qYi0w8iW3+R0I93svWX1ET/e8TC4xUoojiaYIxTlkWIRHhhruWv9Ikk8Vnqc9n4uqFsjy
	c
X-Gm-Gg: ASbGnct4WwOrDYz4QrDC6kifpQ+D2UHF4BGKyIU6+0x9ctnHUnnEvZMxCThisVJYyAA
	TlCEF4QJamF5m9OIpmSR5332iaV2YyBerLQvKwu1RPbSHjFPZ+LdEgOR7UHtTsjTC8zypX6LboR
	9zzKxBkUCDlTt9/jZhnPTNldX6zusgICOVHoN27V4gCNo6W3XOBCy/KaCTWy0HKaJ+hjIcXV5GN
	PgXbSehwIwt1150pjYBthojIOWJeCV7bDKPODlIHPpeSqV1g+CXMyWVwl+tqPPNiXrWvyoeVrK1
	6Y4Z3CuUys7VBPxyepYd6RnhhO4tU7y5ANQJ3xz1cNMeim3Aj1AWT08xLUCR1A==
X-Google-Smtp-Source: AGHT+IFy0/5CsAjAmtPJtG69bk3HYaRizPcxz8kBiV82Sd4ZPLYii45oNaazucMgx7OuBmnSByg2GA==
X-Received: by 2002:a5d:5c84:0:b0:39c:3107:c503 with SMTP id ffacd0b85a97d-3a09ceba798mr6003167f8f.31.1746448718752;
        Mon, 05 May 2025 05:38:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm10416625f8f.18.2025.05.05.05.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:38:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
Subject: Re: (subset) [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Message-Id: <174644871803.1393229.3140979499225174795.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:38:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053840_947761_53EB40D0 
X-CRM114-Status: GOOD (  12.68  )
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

Hi,

On Fri, 11 Apr 2025 19:38:14 +0800, Kelvin Zhang wrote:
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v6:
> - Rebased onto the latest v6.16/arm64-dt.
> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[2/3] arm64: dts: amlogic: Add A4 Reset Controller
      https://git.kernel.org/amlogic/c/946b51882b84f0cbec2acd203467866a7378abac
[3/3] arm64: dts: amlogic: Add A5 Reset Controller
      https://git.kernel.org/amlogic/c/f0911f29478992f37e91c208fe44c2ea5b378b61

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


