Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E95CE6817A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=; b=sleq2zVbUX3SL5i9HuzDtvxGE8
	ftsYyckodGdiizcge6Rls+pf/kI3OJtHQv/rYy6UJR4dXdUj74DGw/B/Q07+qa1jb/paSs2bS2U2S
	OWRYW7Qe/xOpHkRDakfylrMeuF4Cc/mLqpryLAnVblJG/LaSIZZbLVb1TNd+ag5K0qqXqfSPlgPeN
	eENYODR8B+sFIlDEW8nZBmr17IigXwQ92qiqJvSMhhXGQt06eAp/t2hltEm/3nxAubAC8cXnSzDqQ
	JC+jwzubwSxvhX8lXHRMUcACFdlujVjTKnPPOnMHvxFqLmM5cxDBgcFOnEeNfcUJSev+nmVR0+2R7
	+mpVVg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKDL-00000008DCT-0h2H;
	Tue, 17 Feb 2026 12:30:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKDJ-00000008DBl-1E2M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 12:30:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48371bb515eso47263105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771331399; x=1771936199; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=;
        b=L70vlKBn6SQoBZ9y6B1zSz4gSVtp1tG1DTnLeYdkC0j2BbzQiSb7Q6/LrvUgm6HICz
         6fAR3LUf20H7SetcMuSXpbUv+h60zs7Wm1fxy7Zz16z0+Mwti5hmJBvEt70yCvlp46CM
         k5m5kd2hSKk8wURDj/VD4iSScWgPdxp7SwlLbyh9V0pjAEoqd2t5IcU8JiqXE9IZpA/k
         Wee6Io6BN9IEvq8oQU2IxJXU+3T5N5Cok/Ejpn8LN3idRu0bqtLs81vz8p9F4mVI6De6
         p57BPerqLrpgVnu0nu3UgSpm1896qBJVTvazUQ2MW+DE+po9Ddvgz4lFW84GuWmLIFqk
         g7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331399; x=1771936199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veW04ITIm+kS0Va3WwG1j5wGlLSf3zAowo/9T/TxpYk=;
        b=NW91HvZtQ1M9OjxV/nZ7N7/ZbNaNGBg2g6ThRGZ5NiB2y34Q9oRUud/8R4UcnG3HEo
         25SvHdRr0k7vC0WdhVX+chIrUzWy/vyWBqnmCz8GrWWsQgHnaRKaiMoqydJkS3Ddf7Hc
         Wb6s0nUTfOtQeTG+jLppePt+w+n+4mlWWahnrT38gkaLRlK11anJ8KCTcFkUzi8JAJRC
         QDSrsHLseiF7GqYhKusVUKmN9devWRuSTq9bVfDmnCHKC+DRwCVK1+zAGoSU4bBiu0Sk
         Q646ZBztHE1bYpEJ95shMlUKFA4Ekhl+nJmgyOi02raZMaOiFO5gOY7c6tkq9UaVsl6T
         hSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwK5gwgssSHTNGSqesfbs3gOHJ90xR+wqL1RwULt6dB3412u5fKlpcU89c7eozAaIQo+G501ZekKMTXRWnqQuh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4qNIlJMqeizU+r60W2IXInN3vbOxo7GWGeM5IkBofKYIY/Pzr
	/V1ifAR5VWrkmz/8Ir1hOk4mZnwUlQ3mKfRS5YfT9WffcaExuiGgoOIu3G+tFFdEnmE=
X-Gm-Gg: AZuq6aLRo6J5SVtT7q09gT0b0j6qHRBZYvFxBBwxnTSe/BhBs01OKJoulnEyf2miKa6
	lHJMb1iG3fwLbK2KqK50CZsZXbN2cMpUwEq3EvQQ0pLrhTpiEWfSXtpCLqYSc4r4NPTwi5RHlRs
	LU2BhNXhKMBGaw9cvXaAxouXbcmdQpPhUju2f8RwHi9OF3vZTVKs2lgMJ2m3O9YD24mBsnA5fkq
	APuL7ltJ/whR+tebl2/TB2pO8V48GU5TLCB8Jf+sH0avVQSItJUeLd27//lViK8YuM9c+F6PeyA
	lcQnIEdOz1Aai6329GcZqOkJYVFeUjPdHQ8qIZzNdfZBhFiJqpzIFivDquRoPGaxaUftFkelvWq
	jkGonNzMZT00EHBvE91MqNSNSs1X0N1smEa2UIjj6GHyk+gsu8TnrQoZfvTrM3YuE2ELueELgai
	0Yf0qO9EB045N2BBBvOHoP+nuaqYg=
X-Received: by 2002:a05:600c:1381:b0:483:4a95:66da with SMTP id 5b1f17b1804b1-48373a1ad50mr231637905e9.13.1771331398916;
        Tue, 17 Feb 2026 04:29:58 -0800 (PST)
Received: from draszik.lan ([212.129.84.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a44ae0sm99721435e9.29.2026.02.17.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:29:58 -0800 (PST)
Message-ID: <9ac93f5456adb209bbc0e750434c356000eec6d6.camel@linaro.org>
Subject: Re: [PATCH v6 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Mark Brown	 <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Andrew Morton	
 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Tue, 17 Feb 2026 12:30:17 +0000
In-Reply-To: <20260214-max77759-charger-v6-3-28c09bda74b4@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
	 <20260214-max77759-charger-v6-3-28c09bda74b4@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_043001_356226_B6BBF0A6 
X-CRM114-Status: GOOD (  10.38  )
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

On Sat, 2026-02-14 at 03:12 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
91 ++++++++++++++++++++--
> =C2=A0include/linux/mfd/max77759.h | 176 ++++++++++++++++++++++++++++++++=
++++-------
> =C2=A02 files changed, 230 insertions(+), 37 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

