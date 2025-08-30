Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5E3CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9i2CcwLoRc0/4DfODi5u3sulqCWGxz4FU0iotFMg42M=; b=q/d3xH9BjrVgyVcNzPPBoalmIA
	beXAUWiN2SlzmaWSRu4QmJylxGge1beVWKZG1gmrKnR9PTeXVq+DZNyE9ws7qZt5rS6dDDeTgbHYf
	4oJYsHr/z5AGRIKFGdwjFGVinyzPj0Qa3k3LjyWGhGe7+e4Iaa1DC6ZyOAN4u6l4E9diDiVrmU6kL
	e8JjNnOZmloNKFRUMrZpyi8kphDmhnvI9CMBvVx/CYaKNRjtj1yEloPJIk7dodHm8sjpOowavOU3s
	N+tIGhyujy3uAFUF7Jr6+3kM4TksGLJrHXicO0PacLz4Yl6uYYuHE4dxrJpBDYDM/WVM5Fb3eOqwL
	Ny8W8k6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTLY-00000008Sld-1nDt;
	Sat, 30 Aug 2025 21:42:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTIo-00000008SdB-01cc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 21:40:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3d44d734cabso191244f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756590000; x=1757194800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9i2CcwLoRc0/4DfODi5u3sulqCWGxz4FU0iotFMg42M=;
        b=Kf2tIEdgcOKL5/vg++dgvlFUYJpAnO0U1KOjQk9K46IVKWDAQ67u+YZ2jBLnCk5OVh
         JJayhiGOkD0DUZZ/mYCzs8bFwa7EhiXOsXDvaVYPk+dNhdGDumN53IImm0pcYQldtMy3
         ox73f0FOz/GRGorT2fGHSci+owqbmBdfoYOi068H5mfMP3lsoIz2xJP0qjrewO+XKW/J
         IrV+Tw/w9DvIE+GQhvQKvwglypSf7MhoLFnWL7LiyvSFx6UHz1QQZM0Pf+qh2bIIggsS
         u59a5Puvgb3BFRjyRKw9fBTjCQJEokx2xKibdXtkaJKLf2LI/Cl0P4oOp3oPK4/Gh+km
         9RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756590000; x=1757194800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i2CcwLoRc0/4DfODi5u3sulqCWGxz4FU0iotFMg42M=;
        b=EXgZ4HrAuGoi3JclqTJDab18DMMq+eb/dcrSbP/1HC9y8+HkrYphXtg4pTM5WcNvv1
         KASRVg1r7sNhvv3sdOmqHqWn6tml93wcuygDCm+36N7H4SUn7ipJUfrQOrhhQkH7+V6T
         uW9PHXcdrx4PYvPjEItrnIdYi+RLgTJmUB/Jmne9w7vUnVoW0cQjYNQAoZNj5t3UTykO
         UcLLRrxkMDEds9whqiwBY2S3zxQwwjyHTOHewNuoJD4GK4tiSZ9S/IJsO3WyM4dXAosU
         FaLKmedW/V7d4OqQMlXDXeswfiqeLMUCPHqw4EyVQKTOS5nMSFKeIO5akf6lOcHVeUhJ
         KaFA==
X-Forwarded-Encrypted: i=1; AJvYcCVf73KMvWbYxvJiv3wbnujTjOuwMEiw+EW0fh4KysG4bunnsdhTmHFT6OBqLqDtI+lF+qLUJzFyPdAFwvMVanpd@lists.infradead.org
X-Gm-Message-State: AOJu0YzNSp4S4OwWAI9qpGazabZafo/ETf2oEDU74fswEb0f7UCpr+UA
	e6Q8uLSW1FbG5KrzjdEWXRpS99h/B46cxNiAoOherEUuSn3o7+dqbJ5k
X-Gm-Gg: ASbGnctHj9eyPg4N9R9jt7MvCcEqktsfu4XQMdGunhUWmS2W4uFIGUTZ/yb20N5e4bb
	17DS+QLi7R7R6fWom6FuwM7Ysnyn5rKlQCn502Vfe7AdNFksZKO/oj/9OfBTVmmJDDrFgcqIJzq
	Ivehrb9yWuoYNYZsuf16C++gVdnMTcRzDja/mjECc5HsedWdrf4CuNpgMfZWn7sBeLblJ0d0Mt2
	DgoQDTjoXr2UaAh5de6BEAUTaC+6hPi35Pci5Ev2Mk8LgeZF8HrZ+9f5l3tXUM+1bwZCBSa3QWO
	cXAZQI+hMmXh7jJWkO8d9cp/As2vgCYLz1icnaEdCm7ZPfTVK0/k/uF0XQxq459qOxl3Xn1Mkr8
	vupUq1hnY4eAw6oVvSiaR22IUrsqQBkYntPZa+mzW80npLLpRF+E6OJOzkx0OsbUKZiPqKN2zh2
	S5CPPaVc2NIQJ9Sstgx2dP9U1SiZjaXYyaTyQxQVziRs7z3cOpXT2NgbXzwWo4y2JBzmOljP8bm
	Npmag==
X-Google-Smtp-Source: AGHT+IE8zMxy4QIJKmBaOp8B+Mn301+XTbxCl7ZfysM567oIa9PnEQlaczOhMzDV2wCsdIfOswZE+g==
X-Received: by 2002:a05:6000:2007:b0:3d1:abf7:e1d9 with SMTP id ffacd0b85a97d-3d1dfcfb948mr1993389f8f.35.1756590000139;
        Sat, 30 Aug 2025 14:40:00 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm8561940f8f.14.2025.08.30.14.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 14:39:59 -0700 (PDT)
Message-ID: <d2012185-0403-4bad-ad4a-e0468e11928d@gmail.com>
Date: Sat, 30 Aug 2025 23:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
 <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
 <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_144002_055927_396A1E25 
X-CRM114-Status: GOOD (  15.83  )
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

On 8/30/2025 11:27 PM, Russell King (Oracle) wrote:
> On Sat, Aug 30, 2025 at 12:27:23PM +0200, Heiner Kallweit wrote:
>> The old array-type fixed-link binding has been deprecated
>> for more than 10 yrs. Switch to the new binding.
> 
> ... and the fact we have device trees that use it today means that we
> can't remove support for it from the kernel.
> 
After this series there is no in-tree user of the old binding any longer.
So why shouldn't we remove support for the old binding?
Do you think of out-of-tree users, or of new dts files using the
old binding?

> I think it would make sense to update the dts files, and add a noisy
> warning when we detect that it's being used to prevent future usage.
> 

The old binding is marked deprecated in the schema, not sure whether
this results in any warning.

  fixed-link:
    oneOf:
      - $ref: /schemas/types.yaml#/definitions/uint32-array
        deprecated: true

