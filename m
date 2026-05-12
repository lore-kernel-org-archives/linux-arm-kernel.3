Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27621CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=; b=P32xNrEEVQ40oLqOEFYIT4EkSr
	95GQ/syLBBr58HkKHVpNZTwPJvXMqZdHCmeImu5eGT9DXIRr4tdc230HmRcqjJTN94cg21215rQP3
	Pb2qyQW4RwQmeCZRqPnDCEnTfTyHMqpYYAuV2S24EORPIh4TaqW8P+1McQohdfKnmHZyR5SSlo/51
	1cWHYLG72cJ1lL9jB7tjdlo7TiGrZX+cbDoTmxVSQ1CrU3cJeM03vyT23MSeD1xWXouMSglThlNrt
	HIh6XAKJOP9Xgfc6NG+kWrar/dFSWarsdeqMv0U79ALfjU7U805r+KyAYgZWglMT+ridfuEsMyVy4
	eWgS7a0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhEN-0000000FsEU-0a9e;
	Tue, 12 May 2026 07:08:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhEK-0000000FsCg-2lew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:08:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso6338478a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569715; cv=none;
        d=google.com; s=arc-20240605;
        b=k8wNlDzVLda5tGnX3xTaXx8IbXCBhbBvr5gqwTjrmjhFu/N0aeXpbrMDHBuZdQnYAy
         g8c8yROyqih2PssuwdVhwo4lA2FdpMQjFQKXUMi0kxTdNSqLTLlZ+OBZjUV+sun4grkY
         lXxvKZBDDr5uBzevHePQMwZaxT6vRPAXDu8h2wfxYV8DXMNXmJenvuoWXBUQKkFcwZzc
         WWsW4jpZEwxMO9lhPdK7fJznoQC53JHvQCHsQssnTiLlQIlb6MUW/heVP120dyqGgyjp
         MKZnBJ8uLHhQdyaBK27ZKrqzmS31wVlGxkNVpvfND9ynqDGoFDWsx+q/tcen8/nZzNxP
         3M7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        fh=MStspraGgPwdJ2BeZ4vPD+tiv2S7eGHtBSHHN2MhMu4=;
        b=iGAkRvDyiv7Ck0OsmiJdK7K9aA5ClGfxhDB59E4dFKjHYl/qOVX4r+790lcseP50eA
         1Yl8Us5lLPV2KJsb9dMIy4tALcXs4isNhseIBNzwta8z7gf5el2zwFLbwJMnYV5F0wrJ
         oo9hU29leDD93pbAweXST+tIjn9L8S2iq1mai7q81VHtUMRbCu0t5gkUnwlu/cjnCY2X
         NT+jhC+bLwjsTDVaXOimYwmyptNiZw6UX5rU+wreSVC+a5QwQNrtO1algBmiNzNnbX4E
         vTtaJtZHrlB2xzNP5Kg6qtLhNL925qxNx3nG9YmfqjPFacf9Ivkdxo0iA+GCDvefMCy6
         ltdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569715; x=1779174515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=UldNyVyQHp6XU6adYINIHF9PQPCD9nyJRDHUgiiuQmraBamRSP6AxVYblVVhT2dRLa
         nC4bmtQBQjRDXOxcNUvWlw/ktm+3bz+k+7K4HxRyOffOC9yjz3hccVbxbLeB3TUdn7s/
         WL+Yml+6STkHSjH4POtn+N1ohILIauQr0e0d1FLa/1//pC1X3ivwzf1Wowxfn+mMN3aH
         h/VOuCG+ld44Y3GMBMBDhF++ow2e+u7sovwlagI++qJ3BwIURQ6LOTdi4kIc0gDhLaLM
         tGknBNxDpBpIAt201uy1PLre2N83i66I+S5tfuekOH/sinV/RfL6wmTUHZgAccxNUJQh
         CVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569715; x=1779174515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT81Hd3L84EXgk134AFMdTo3wRN3W9j9EMFVjmJ2DXg=;
        b=J6CCPnRqGifX2YEShDScS7KtPTw+Y8mgnMaRMN0WaNLpOhZ6Yeeqb0/ditY9IJme/z
         CILHXzu8JkCnkS1E9d+098s++O98qe0IpKNpIldylpaCjgCyNFZDeeGt6mhSauzI7RMe
         D7ZcnEQjA3TjZ6f0Zz6TCsHfnvnvyVmwb0HKo02iTzjRxSzOOI5K4ju1wZGCMH2MECJf
         pp3/WmI7X0I3xunyKpG4wh6Z4f08qFlNco9Wo1Btbm8bRaqcSEiAM+w07Fkdhl/2GhXO
         Mp4lCraHxb9K8Y25XwFAqRrCWkLwDA6I3WB4VY6bESqJDFRRjiYwTn2f0kCqpilIMV2L
         Xrbg==
X-Forwarded-Encrypted: i=1; AFNElJ8FQunugBd5OruVZJWyO5aP6fbrS1cvTNrThPzD8yaJG8b96+8ghJuhn4zgYKmZsVuzQrmJjz93L4LVbM27V/0x@lists.infradead.org
X-Gm-Message-State: AOJu0YwKAW8pKVgJZBt3R6SiisCEL5qnH+D1OakpYh9WBclyFYlSjUDD
	07sVYCU+Bpnq3wSzf9kmTJNKAWwDnfy3YhGi7V4lX1LRwyBa8Z9ZzRpnXJnG/CebGPDkQWMVD7s
	rVKrt4GduIQpBTpk/CCxMqlPMs+Fv0NY=
X-Gm-Gg: Acq92OEyBfOq3wZ2VxyAe22jo9ZeRFRxgx917X5S5p9+bvtiWAJRRjOpjDwKDV5hxqO
	ah4CAMkwVnOwgIclUSiCR6/JnFwr39GvoDd65hVSh7bxUGOor7m1pTYO6gc9q5NFoLMjwEpC7ia
	KQFBJoPuz3QBSSfdhKq8pyeZeCYThm6LwtxuqtnwN2GIk3FeZ0lI7/5UU6UzIkptwhr89VuMQo2
	NAb44jdJfdaz9YdTR6iYjTLsbXagki5X9o+J/nqsUh7d87Cdq3HCrTkNpug/4FS7pl3FOCGYU61
	CJvejin0MOhlioPxLQlUiocXCmbtoynuxZ7eXKQ6fEi+SI9uV08LxhTYtPE+fO1o2SgOgAQSMPM
	xReFK5PU=
X-Received: by 2002:a17:907:9412:b0:b97:1d24:c004 with SMTP id
 a640c23a62f3a-bc56de100damr1755416366b.21.1778569714611; Tue, 12 May 2026
 00:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-10-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:07:57 +0300
X-Gm-Features: AVHnY4Jipzfnw1owf-ZULaa0oh4jwzOau62Z8kgQLDNNHax4pisYq4PVzs9Mr6s
Message-ID: <CAHp75Vfi8VwJvBLAAnRO4ZdoFYCCXcC62UOPC5hCcYpTpf-+og@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] mfd: mt6397-core: add mt6323 thermal support
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000837_161358_F269028C 
X-CRM114-Status: GOOD (  11.53  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> The mt6323 PMIC temperature can be measured using AUXADC channel.
> Register the thermal in the mt6323 devices array to allow the
> corresponding driver to probe using compatible string.

Wouldn't it be better to interleave these MFD patches to enable each
driver just immediately after the driver provided? However, in
previous review somebody ( IIRC it was Krzysztof) asked how dependent
are they and it has something to do with the device tree bindings.
Take into account that one as well.

--=20
With Best Regards,
Andy Shevchenko

