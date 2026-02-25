Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C9FD3773
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=; b=faqWfz3WmY72dGVuM+44HpxCuq
	Hx2Msn1VF5WGh3ml8lzmeDl2MUSxX2/OxlyM36PTXQ43o/Hpi4vQna182bShJbk2kvq3s/zUH0wUX
	/GxYAMkmAKtq+Or0TeOdwKbEujKHRIQLIWKYIxoQESiqRPmuKIEHHFBtg/Sssw70AkKgI3CIggDRY
	F8HCJPzcXN2sg51HvefZ/HgmVFMpPm6+SIHdnWD032ONDlk6aU3w/IEj7uwX0MxKq68ZYdxn9Josx
	BGl6MCA+uRUoEXyhYunaNUYQew0EXDWKY+XfmrhzMP1KT95YGK/kryriosF5I8QtzqkvzZyXTAlc6
	wytHLghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIDB-00000004aMd-2hkZ;
	Wed, 25 Feb 2026 16:58:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIDA-00000004aLx-0EcA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:58:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-483a233819aso68815285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038686; x=1772643486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=mxRa2r9/UZzCe4tThueb5ciPxLbmvW+krFs9X4HuarC5u3oODHwPi/xL2PydgJ0ULu
         Si78DDAI6fqfWz5UGwAyZRD+FGQYFGtXkAMYOtpry3jLgoFVhS26PjHLdn2H7fvhgHSl
         Ik860ifXIeWAydGy4KJACivQQM9l9j9k1Gx1/xo85QReqnvzhx9WYiqDnxQl4PjA5Dar
         5PW0DNKFMEKrE5LXwrZTaTJJLzi6c+qCsZ7DDenNDVVsCfg7sZDYlBY5yoa0mVgbwMQm
         n79occ5HbsqcBbkbVvud9HhrqoLSJUzc1KxNUxRCiErAtVAo2nQbHPXKU47yQtPeV1O2
         slZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038686; x=1772643486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LsyQapBUPdwmIiG02O5zaGYSemSJNCNHx7rED23cBYY=;
        b=KWbVGOL1gectFrCm6brOAYVn8aLDjHPZWTTAodbx+uwjfluxnSYOtJ+e+6pRR4Mzb9
         YKxF/58z3UMNOFG3+UTteHE2HxFP262Ibdckdly3PAoP8H6A1Lg+Ca2yDMKGUwBYm3z9
         3HOpQXsNxFRWrPlGulKhRnRXy54hIkh1Ehu0R04uIiB9UjBU9RFro+n12bj5ZlBnZtWI
         x+6LIWD6oKN0BZiWcfmrH71LlX2PRyzDFsAEYYTo1BQs5I22T65rMA8UVcFMFtCqPXaX
         OgeOnVthkN3nwds9VbPvfEX7vJhKol52drDOoUAXi4HvLcCvEyuWKEl/eAVX27bJ43Ko
         d8pw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+gJ3tq3P9yNKvlVy+53D6OjWF2/i1P5zI4/LnYTr/jmXDJfUUeFVpTXzdkzBrTx3lLUXxw/PXnf0j+jgxZlp@lists.infradead.org
X-Gm-Message-State: AOJu0YzCNLk3CtGDMPdENZtyGa0/UCpx1UQWKQ7uCSjURwSOrAaD2HDT
	lqzuGIyC5Vq93G86eufCFuUb5rZ/QG1AJBwXIQida7kabogKq6PedrjsY65jtmIo
X-Gm-Gg: ATEYQzz4zaxUYDUUW6Da24yXO8zUuKY85vvMtO3X63PuBsS6A4crSSn1BMVMZ2z0wnj
	W9y01KlMhzdOQFcl78hFUVl7YfCHuC602cHDPY2MnV4IS8k/ymlyfuZJyz3Zt8e+2dvJRAdqq69
	98jXtWIaersl3k39+E3f3krZb3sRsYvJOktYzoqlm9IKnq5rA6Rt0oMET8vE5GwdciGN+mK+MGQ
	FsKySJmHqJNc8b0B3cuhzJ+N39XMC+uU2C9HKfvZ1Iamr5Ke50BTrM9IUmVUUFMzIR7LmflZ0OT
	/E+/rIZmCmDGNkfsO/sPRpv+Piq/z6s/Ejvr1eHn+YAR0l+kaJOzURoPWNYs+pRMfuL7iLiNHR9
	5XABe83Fr6T5qkpEkVtuKlPjZQ0IyDyJm8OWAdNbt54MNuAfGvgPJqVofWto2SfDKDl0KRYRa6c
	fgz3wwpeHkM9IaQ82xvMbCmfkXfJaOTpRWf4X8IEY8o7twCcOI6XGktWfqQpuo9sHb0AHj2CIwJ
	jPGw7DO
X-Received: by 2002:a05:600c:8b03:b0:483:c12b:fe4b with SMTP id 5b1f17b1804b1-483c12c002cmr31522165e9.9.1772038686018;
        Wed, 25 Feb 2026 08:58:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm29583655e9.2.2026.02.25.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:58:05 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner
 A523 SoC
Date: Wed, 25 Feb 2026 17:58:04 +0100
Message-ID: <5968038.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260225160828.1687643-2-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085808_096564_773DAC83 
X-CRM114-Status: UNSURE (   8.86  )
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

Dne sreda, 25. februar 2026 ob 17:08:24 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Allwinner A523 SoC family features an identical LED controller as
> found on the A100.
>=20
> Add a SoC-specific compatible for it, with fallback to the A100 one.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



