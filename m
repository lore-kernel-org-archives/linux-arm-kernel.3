Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0D7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=; b=kgGDLHo4dnhJFFqqCIfqccG4Jq
	t5CJs80RSwpu56XEC+hlIdYlHIOXZKYQditNQV0wri7y1U7wNKTvz1e9CLuG9T+GNO8RkQNAbsdBW
	asbWz4a3f8Lgy0OAPnaj4JMNIzPpM/8O6KJ0VTRI9tA5Y0S4FJ4ariDwyUBSKx36qIcTh1Cerb9ry
	Ifn5Ty+F+cpJIw0PmHUQkxYTtj3xtdEcs21D3NlEx5KJvoEmR4zniEcNBn0kuKkNJgYy8Eli5aot3
	upriDkka4hB0beMBiOL/b6RNvyC4YXYXOipq6Wraz9mTOzH0Oq/wE184WOE0Jbo9zku46bbBya2Zs
	Vz7G20bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlrD-0000000GDDH-0UQ1;
	Tue, 28 Oct 2025 15:43:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlrA-0000000GDC8-3iqg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:43:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4710665e7deso32552665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666211; x=1762271011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=VDb/eHi6e4I9rHrt4VhOcBleWi8LsQSPQ5xo9D4x3u2WajNRlKy1OqAkYUqMIpzYHK
         R299KG7vZwEwGECnFK/xs3XuUl9YV57+8y0PPfiskVmEt7Uz1EiycpRxD8ijkTZvVgVB
         az4rAaTthM/BOzlbXs8cTifpavaL1k6PYPXrgjRd4Hg37vsmuHjCacqT34xJe6+9ZiKw
         wVttnDTKcDMchR2VywEVnbHOZ/lmprmkaacjSJjaNlKx41hq4rNAUVQ1/fqh3TaeQLt5
         r+VzMw+vLiRVU19yvuY3XHk6dlIRWWdHfb+yqVfhZmWoh1UpFUkn2Nc+aImnvPHLq6DM
         W7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666211; x=1762271011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OdKjf6E11PLhTN47izQgrYewu6DAaBIZBsxLqLrIEE=;
        b=CduQNEak/g93Yh4MevGGPJe5DcT7Y87T/4RIjMqBRRUCPF67P1W4RRnIy5gV5GIbYJ
         lA8V4F4L8ML8Ynid3Wi6s0ULmBeqQdVPhTJEWUoCqNdDScfFSCcgc2tD5YLT2KBMUmOe
         ne9Y/VyIhX6qCcy67uwgxnK3m4p8r7QI7bziysVr0ROTzZaTDYUj2jqs5mpvIvjRfxRn
         EYZqdydp2UDwwI58TEMJUzTdtjCgeoeJCPMI8TzjCdi5rrsfpEGfwJuJdtFQU3C9NnUV
         PKSa+umH63C8CCa06fDYhAV091oR4Oc31c3z/1UvnAvQPaR2Apt3IvUWUGy38o1kFCX7
         +inQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHYHwn0DUdZbQsbgTFCLc+p89Dl1sq3/zeWmsmsQhZsDIUNoOYns1JVV5YeaMNUZ0MYT5V8P16A/orF90EVLKU@lists.infradead.org
X-Gm-Message-State: AOJu0YxSTuzktTGaU/GEshZOKsVwjdQVjYntKOofWsVcQ3ys2NP3XwrT
	e6iNcyOioDkJdBr26S2KLNNDqPC0t0sqKrYgTZcoOnkvm03EBmOk1Q+W
X-Gm-Gg: ASbGncsjsapnAI9Cg/I3SL2vG3sPfHxnEMUi7t04xM6qQK5vqTty7BJovADPBBQqmWh
	emSNXQwNT6Pw+C3xXRUYaFxeybpmBpJuMYpGqHKyRkIXMwvfXuDiqsA9N1nGbUD/XbvR64N2+Ue
	0G1H7CLo76yrHQyeYJHFlC32BB4jK3vynVIMHZG5rcy+RRJa7nq2prKoZBq3HSIAwPcbrfGGKgi
	hpka4G29Wx4/zHPeMJXyLfCpqRXVHa8ZEMTs2UlD0/uHppkEVIa67rZw8lYlkS6kseW0vJTmXXD
	nH8fAgcp+KyNAcosAXP7HyCdrIhid4fGIrAfQTWRADjB5+y1OkxSLf1op5edZHKLhNdfUt+se1U
	iY1GFzER9lFhMlirrcZ/DmW2V2K1N4kXkVgFolK+UA/IGaXh+gbBnxnYGmxxtFKHr2krw5PwKIl
	IZYNTISKNyFcxMXNW4yoB/WzGlZJrYvsogZjMt7BAagoDYG7S1rE4WXrFJ0A==
X-Google-Smtp-Source: AGHT+IGQT1sWn537O9lUQH0SeyIcZJ4uWohxTzjPx9kV6HFu78PmQQbglpth1JWOPqlEUpT9jeFZgg==
X-Received: by 2002:a05:600c:4e02:b0:475:dd04:128a with SMTP id 5b1f17b1804b1-47717e6b4c8mr33281395e9.31.1761666210763;
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd6dsm210045835e9.2.2025.10.28.08.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:43:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v4 08/16] mtd: rawnand: sunxi: add has_ecc_block_512 capability
Date: Tue, 28 Oct 2025 16:43:29 +0100
Message-ID: <8637155.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <20251028073534.526992-9-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-9-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084332_936146_08AE706D 
X-CRM114-Status: UNSURE (   8.36  )
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

Dne torek, 28. oktober 2025 ob 08:35:01 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H616 controller can't handle 512 bytes ECC block size. The
> NFC_ECC_BLOCK_512 bit disappeared in H6, and NDFC_RANDOM_EN took its
> place.
>=20
> So, add has_ecc_block_512 capability to only set this bit on SoC having
> it.
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



