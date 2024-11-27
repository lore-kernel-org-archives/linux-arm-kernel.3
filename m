Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8367CD6ACF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=; b=FSm9MSH76Fl9CGG+rHCw8YQTyn
	tnXZJ3fTmP/wEESqU/op//MbZ50mAWM1bRNbKBj41v8yJEOTVjylY7hqCjPXUrawZhM9DePUfnceD
	uuhhq5dQaw8Msk7KWlB1D4r9pv4lR8n00xhVa8LXPeIwjUy+nUwMcoZiutMrWsu+wKbooDmEU549K
	V7l5UmKLbWOcIK9j2RUSGOho+1klFhXMS3vFq0+jotAENSTMKXejf0ADJJGqspFiTiXijhewhSoes
	ibsOaddPSOicHbo0znEvuh+hhRd7qcHtlS8pNBlJMLPEM9ralyMHDP3A5EtgO3X6eJGnAGp3Y4lI0
	kfiT/UDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKti-0000000DcxF-1RA6;
	Wed, 27 Nov 2024 16:28:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKsi-0000000DcoL-2oiy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:27:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so14682965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 08:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732724831; x=1733329631; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=;
        b=OZVpm8b3O9EQwDT355Qas0l+NVWf5jnLcvOxJkLpSDoxtND5CzhokSEc8eEA9aGUm/
         kvd/pRfoprrRCQFzZSJ1iITIddAemCzihWtEG7fZHrtCd1Eb3Ix7BlxS7Yrnkz7pBgwE
         zmvJFkJOKo0z02vHgkOPsSOkmKpwn8g5l7o+je0mFVOFteehc4wcZxTtOO72geLYnCja
         opSvUwFr37WepU2499HfFjz39tDVf15+OYnMoUgOfkcso24sTZBz9TJ9EMkOZim8ETBU
         2/JMfwQJTc+GFrBLVC1KCMizd5I/HBsTYC0SzVct8qatWGwi3I9ey2n9e7M3GwrKEmln
         XnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724831; x=1733329631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=;
        b=Pif+UoeLIBgNV4tcmwoKCcGpUl54zrIUgvsZF6ItkrX8vxZZNah4g2kIuqqoFM7GJf
         GcIf0y3jISvYM8e8bcBv0lOFDQZJAUwk3A2BerF2cPJolbi9MTiit5AsERDMTcKqU/z0
         OUJIpxXVDI18IEbvMscpYlWTURVcmt5+DGg5jKgbKhx9yyFcKCPbQSoM++d7XFHIrf2h
         3sLlEOp0FqNhQicpV9oOWcaYEkdgbGn2d0Wns6f0F9vYRNffEjrV7DH83ApTt7UxMeMb
         JWxEuNDLC/cMftxwYnRQLcb7Die7VvR589J1fi9kHGNumVep99+cpqljQE4L1i06QjJX
         RVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVJr/X+3mhzFqFMkWL25Z/s2/IRmVfUwn93yv7WHor/Rc2XrHVjilTfs2KCh+O+it5Xe51rcjCBujBN8tidVyTp@lists.infradead.org
X-Gm-Message-State: AOJu0Yymb6mp9GYNZ5VofDIAWCyNHsCb4QThMgwaBeHt0ukv2UHbSPT0
	FUGeLQmuEuzch5AuxPiIeNAGN6iBRycralp+jz/S/rj36GQ35IJ94OV4gLoTmaA=
X-Gm-Gg: ASbGncs7pzZV9PfvMwaoA0H9eXpIdH7xQ1UbjuDh+A+mcpYBDmD40uww4WjYtS0imZO
	/LCx3xl+trsqDkPxvMu0Oq9YuNqHHpkY/m148mDmExyTofDF64HPAwyUk7kQi+PlhFg0Rgr02Sc
	I5BUD0ozaaXoXgoUKPUSD33EhSJm0BQHa4PHTCjTTw0cYlM89kA4routUjjN8Bx7wH4pd5TF8uK
	OWssiaL3DTncNSaCl/7Pk3NkLOUP94amehp9REi574iL3HZRkcvGg==
X-Google-Smtp-Source: AGHT+IHUXF8Dlt2R0M0tUhRjJZfzXWTd2QVl3Kj7qIQfuLN+iAXj3NQBYlBwZKmabbvWQBuy4HyzAQ==
X-Received: by 2002:a05:600c:474c:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434a9dc824dmr37930625e9.16.1732724830938;
        Wed, 27 Nov 2024 08:27:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74efbesm25624895e9.7.2024.11.27.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:27:10 -0800 (PST)
Message-ID: <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 optional orientation-switch
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Wed, 27 Nov 2024 16:27:09 +0000
In-Reply-To: <20241127-pushing-baboon-4afafcf8322f@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
	 <20241127-unturned-powdered-d9d1b695732d@spud>
	 <20241127-pushing-baboon-4afafcf8322f@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_082713_522642_E8B7B43A 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Conor,

Thanks for your review.

On Wed, 2024-11-27 at 16:02 +0000, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 04:00:59PM +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=C3=A9 Draszik wrote:
> > > orientation-switch is the standard declaration to inform the Type-C
> > > mux
> > > layer that a remote-endpoint is capable of processing orientation
> > > change messages.
> > >=20
> > > Add as an optional since not all versions of this phy currently
> > > support
> > > or even need the orientation-switch.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Actually, this patch unconditionally adds the property to the binding.
> Is it valid for !gs101?

Good point. I've only made it required for gs101 in the next patch, but as-
is, somebody could still add it (in error) in !gs101 cases.

I guess it's best to squash patches 3 and 4 in that case, and update it to
disallow for !gs101.

Thanks,
Andre'


