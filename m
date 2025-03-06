Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D9CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=; b=qmLGeqd44ljI4EddHKmBivzJyx
	AZ/lBO+FocekwT1UbJSfSL6i4UaApSrwGAP27I3m9p4E0E30He5uBu3qNRC8iV7PtPc8HRWEivBab
	ULYIVVoY5vjJXhgfYLcUjHoKSoZLeV2mCsUzn/J40I23cKT6tfLmj0OJ6V5Lb7FV64whdJ7XI+haV
	8YcmQwOEm3aUP+WZ6oxLPAPott0Barfg7dL1u2IpLXBKxzTk37mrux/rbeOVFPuLBYFkAfm5jUI39
	oVm9YLzbnWDU3CVzYBiT7kZFFMAcJWKIeZOBs1JeTcvTa402xbJMSn67qroFa1oY2m9dqWrX/2iMN
	XrWmiZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8wi-0000000AiEM-2wjS;
	Thu, 06 Mar 2025 10:59:20 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8v7-0000000Ai9G-2KP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:57:42 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so649903a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258660; x=1741863460; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=;
        b=W/MeVSCGBoI8XKopG3SZ2Btf3kar7tqr4yR5gUREosPLDcSZWwMlNu70QTVwSR+71h
         VRjvKKeceBXIglkTToDJH2Rw9dI33V+w74yeS2Xr0y2aAfYFGXceWiQ2BzO0IHcYzHo5
         NBkF+LJ5wiG3sPNaNy1+6f/scEgFdcEs1l2k/1PKC/895PT7mc8ZHVJBN9nJoWpuc8Hl
         1pxerstlTtcmH2H+d0I+YDo5693T7gr/AuYiLueNL4b/jUsm7I4npzcsdtBfcOlZle32
         mmQ7/Umx/h0WvupQ2kW8XSwVot2ON6RhEoh1nG8g539Xw8/RJ1q/H6SziVd8GIte3rkt
         b7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258660; x=1741863460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUzA5Pu2VpXIYuAhDxgWPL7oFqKDgn6WYCQ3x4sKcJs=;
        b=kp+AzQ6JjrTyHOQEugtb0VC6pkC6RA+R39mkOy2eduDic83E8uzJPMoyvFobXLfEIQ
         6nLLp4sa5BFW6ki54C1F6LRB9UrA8KWAg0jkxhLPS/LrdQfDsQ1ZKsCL9CS4oePXYXm1
         aDshF2Cwv+qrPUO9ES3UFlw6TKTNEN+00k9LgaqTMYtz2UWNrSXbfgV5Av1eHf4teid5
         8eXsBtVkmx5jj6TPbp4zfhVmE5fpM5B33SQYtvCa5xm3CcvKuUJrZF93nextJ9q3ISYu
         NEQpDvSV0WjrWZcIJ6qxzy732BMp0Vy7j0G2vFXbrfeML7JeNURRr6KKBf48lKuI5Gb7
         d6yA==
X-Forwarded-Encrypted: i=1; AJvYcCVmciwXg882HPjs5TQJN+q7xDdPhRWf9NYUH0GE3zt+eLmN3p7Y+5OlXiPsAibqSLHVYrdWvHcuo7uoXfdPE3f8@lists.infradead.org
X-Gm-Message-State: AOJu0YypxE7zIH41YmwLzmnciDpCC1pGPe296l26MtBtaL85QHguFbUP
	YlIuOOJKtFtuan8eZd2RKJO48Cqx+bSHBmyvkNq/z8DSsE6zaK5XuYlr5h5vIps=
X-Gm-Gg: ASbGncsaEXQidGd7jj5LO2ERSgUIJYDUAkYgYN13cwDKqKEp1lYMKKLNTuXePS668al
	pUNsAGg2kRAQkZhQ2Utj7H1t/xJqGoiANNTsvTb12vYpjZAl5yaHp8FFH0UH7Yg7d/noVSBXAdw
	8LtcfQAqxB6jZXy7Vuz4G7wAeL3rnTvkLk6YxFBB3jCGPM9sc/B5tSH/McOr1btYph3I3bX+qni
	LzADzKCGA2Lxe5vlsJ3uGyJI2PvpwwYMWOSiHZikXHzqUaIDM/SCFpGxaEiCE+tL9VkoCz0qt7Z
	whEGCObP7YTGzegPtQx23rmvryL/t2i5yl34mcT9DKp8RFE8
X-Google-Smtp-Source: AGHT+IGeZOiaY1aJKJjqtYueXhMP1BS31yX+hr4PezJXUBtQPVrMxRBsSKLnYFZO+vtwvwtDRkBuEA==
X-Received: by 2002:a17:906:29c4:b0:ac2:29b8:1f21 with SMTP id a640c23a62f3a-ac229b8202cmr306641066b.49.1741258659698;
        Thu, 06 Mar 2025 02:57:39 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d47b5sm74174966b.168.2025.03.06.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:57:39 -0800 (PST)
Message-ID: <b70f17589b91730ecf6080c626492368283ce7a1.camel@linaro.org>
Subject: Re: [PATCH 0/3] gs101 max77759 enablement (DT)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Thu, 06 Mar 2025 10:57:38 +0000
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_025741_594963_D1506DB4 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 2025-03-06 at 10:14 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables the recently submitted Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
>=20
> !!! Dependency note !!!
>=20
> This series depends on the corresponding driver and DT bindings
> proposed in
> https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.=
org
>=20
> Note that in that series bindings and gpio driver are accepted, but mfd
> and nvmem drivers are still waiting for review comments.

To avoid ambiguity... with 'accepted' I meant reviewed, but not merged!

A.


