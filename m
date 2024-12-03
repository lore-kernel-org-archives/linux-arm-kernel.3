Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53533E6C60F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVFLB+6OBC9CZT606g/sbUfLAfNYRu7/+f5lWtBw8fY=; b=vpuJmJwnhsXiVH9VD+wHZDNpqE
	EiFqbYCUboZUkKaADBfKj8OSnu3jatw2YVr3kJzZpRDVUMkUYCK6XA8Eg4ajpr+iojEZgIRP8eosf
	gj1mWHLTtxB72wYBOWikRIfoiN7PVl98j8z7Fm0ccDgyjvhQBeMUfndZejwIbVDwczVPGWNIjUalf
	3skB+MlAya1L++bu8efJs4lwxDTOxLkAASu1OHitv3T364wKpCBHCJB6JjIQRgyTJNYSx9NqgiV4G
	18KaRP8I/YY5Xh6/zW3QyL21kzx9qTzCWvcWrPdltKRNW44Ri1RaG/77eFubXy7BFLJBqPq941nqe
	9vi4GTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMrs-00000008Skt-0eoo;
	Tue, 03 Dec 2024 06:58:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIMqs-00000008Sdf-2yp8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:57:43 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385e1721716so1857664f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 22:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733209061; x=1733813861; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eVFLB+6OBC9CZT606g/sbUfLAfNYRu7/+f5lWtBw8fY=;
        b=n9wKQCPSF3y6ux7Lo9Ej/6JRFuzcqCZSE2m1S00PnCaTYzZcLGKdwEwz04ebxqLaHd
         SnQcdvOFw4Q+Vq47HJq0rbQgz5msy2PbzWHCNiqYDlVbHYJqHd9kxh48qJHFgrQWVfJ3
         hU2klX8l9FqPejXDTRdUkAPtBZCkRCAXWFzwbyhHwYJvuggrwiY+UO4kIEmIyCAYtFRS
         +vh37UqW4VHPkPbetsyUI57UtHdQtPVdtMZXa3B9hhZ7zJObbTnqNVQzeHXewJVgIptl
         dTJ0O+KYuRnE2EJr3PCUUJhqQ9AeaNHm9vBLSeExcgEpUPZA9gRU3NK4gwF5QNthNysM
         guPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733209061; x=1733813861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVFLB+6OBC9CZT606g/sbUfLAfNYRu7/+f5lWtBw8fY=;
        b=rRimn7HbUyZa37qWQO8ilXO2cHnjY4GaFAC7kjYAJBND0PRHiymM+BTpJ5i27B7ulU
         bDztvbsLZcPs5mDouGfdyZ+ydKhAXUdWevLSmtYSFPCIebYA0DFn1JFQfZ1sOH/uXnbS
         TyKNImgbipLS2KQrDl6hf505nQ+GPAu4CpiTeZNJkK0MIYpHlWfvR1rSdkmL1o68jkdf
         4jMMMBo5DWN+WCSn9G1Wap9nBM8aNtzawBqiVUYD3325m+TxQfv9xxMX60iXlnwRDa3z
         a3ZKW9lXLDpMN38XCq/JTIJBHpUeTMGLbvC8hzajQ5HDGsxp9Ryk2NPtdaDRsxRUM4XN
         IN6A==
X-Forwarded-Encrypted: i=1; AJvYcCUdkf1XMbhXSOYX9sx9fQneS/blmWH7bb/eoSFWwP6vD93I6BrXqC+hdq8VY7xuUuYNdx6aMyZhJ/Wj6lbMYnxi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj0z6iWX8qZ9NLsKUA1gsfp1feCKcx8Tvoaza6cnkj6kBh8lTE
	Ip8j4THlvG+hC58eXQZ2a+ZCzD/fFTmv/33OM3H9dOdKmJ+pmP8cdOYFyw30hiY=
X-Gm-Gg: ASbGnctM0bDv0SF2IelItnSXtNy1NV7o0UVltyuu8Mi3sdxKyQoLactwG47RScEH47g
	Iv1cgx9loSsJvvyQSpAOtvwwv54fOKjCoD0dv9MYUarF4HLoJu0xlpeZn5LGFMvLr4UhlXwvoC3
	SKRhjT0zqdwskjH2nD9U0WkHCjduaFJGMFAA1d0HWvhn49BoMeQySn+PzejXnw8MnucCg3TRD1A
	UJaMgenqjroGnKK/7IQ8a2M+ZYreR52WuvlWNSTkx6rpFQXkEW9T/o=
X-Google-Smtp-Source: AGHT+IHBAYAD3b2nuutPCc6vz21mpmvr9yIOVo8l4J3kzBSf1gujYTEow9QfmlkAK91qibZX9uKohw==
X-Received: by 2002:a5d:598b:0:b0:385:ec6e:e899 with SMTP id ffacd0b85a97d-385fd42a804mr907858f8f.59.1733209061057;
        Mon, 02 Dec 2024 22:57:41 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ee60549dsm6267059f8f.34.2024.12.02.22.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:57:40 -0800 (PST)
Message-ID: <fe254a002000f2bbfbe51d074cf28f7427a27f9a.camel@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: power: supply: add max77759-fg flavor
 and don't require nvme address
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 06:57:39 +0000
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-2-98d2fa7bfe30@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_225742_764634_7656B0BB 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, 2024-12-02 at 14:07 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> As the Maxim max77759 fuel gauge has no non-volatile memory slave address=
,
> make it non-obligatory. Except for this, the max77759 seems to behave the
> same as the max1720x.

It also needs an interrupt line, and the previously mentioned shunt-
resistor-micro-ohms, and probably a power supply.

Cheers,
Andre'


