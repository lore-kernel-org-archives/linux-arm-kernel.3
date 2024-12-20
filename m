Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050EFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFI4fUt1sI8nwfpq3FJ1MtiKgsdZm78mtJAIZ0bc/uQ=; b=YCvKVzQnMtNFkAsMaLZEenUTn4
	AUr25yfFrRU7xjHyZyykw86VYZz3sc0vZRqYSlzt3WIe8KOwE+jNCWE+sQvQC0FpOtIfYcHVS84yv
	iNPfHp/Q6FTF+cBU6KsGhrPiGOYlhu57jzXlpYs7bPrneldSiT0Z+cjW51kDrMbo/j4PZ+qvB9L6I
	b7y3jTpf3H7JCRUW2OJwC3ftifPZgeMnjlGSTQVoqM6Y14mzjhzw5pu9naGXB6Z3Smom6x+IMVg2I
	IDxOPsmtmLTriw/PizaTWfhFpxqxxPf7Xjv5RpIoR6JyHakCGEu/nc3OM/53KypIZReUT5XNerPIO
	y3Ka3sPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeEX-00000005BVa-3bUt;
	Fri, 20 Dec 2024 14:44:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeDM-00000005BN3-3WSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:42:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-386329da1d9so1007064f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705771; x=1735310571; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tFI4fUt1sI8nwfpq3FJ1MtiKgsdZm78mtJAIZ0bc/uQ=;
        b=DlqyZcoQR0L9f33nGZ2jc+RNyVHzGS2l9FeXmZTa3b/1v0sQ8oWoPkSGjfjPcCvHXV
         T8BTSBstxzJibV6OExgCqGu0fGw20GD+DY+jYYfgeDRV6HLFNCn9FMa6+F91MNufseAg
         Gc4ADrYqhgp/RM/9rua/O3N0TqatMe/s/7Z6krqrLIpt4u5/dbwuXkeJqJfIn66QHT5/
         IRzSpcOKf5LD6cBFFuEPnbWO3QrlBTwEqvWP41q2mF7W7knlnjqWWD8M04ttPvm1vATw
         l4nqRhqq2SPXLvMc09WlBh7sD6GAO7ofyiWf/hPlDNthf0IxAc0zIdp52jgSPFJvwUYT
         ap1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705771; x=1735310571;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFI4fUt1sI8nwfpq3FJ1MtiKgsdZm78mtJAIZ0bc/uQ=;
        b=pfSqVx/cLOVlPyE6CjFV11+cEtQWbW+6tXNSuCACOyRFsxkJVwraaLhunPf74iNKqW
         0rChYMbtlQyt8VFYf2w+zBanNsOtQxcOcH3+huYkauK/29Rbhe07m6DdWqMZeP7CpSes
         7kPK1MQC/7vSDt8pyDSCIuUy7mmUPmN8c2MmynTEm535EQtwzbcFhBuY0x6qIG2SjJvE
         zg1PMI/CpaSWxKldiz4Hst8mDLvK7gUbEaId6etyAov5ONBO5Mjff+Oxv42qxooATZk9
         1yMXiybvhxDE9WxTRilKcK70IW4+j2kaAhYDCFa1XPEQNwnwpbPDpLmKZUK2o5Ua8Gkz
         GmKA==
X-Forwarded-Encrypted: i=1; AJvYcCWqWXypCECHAQNwgi11g6QIsl/rjSYrtE/jm/JNnvxvehqfz6YSlJw6UR9Z9xGH+1xZbbb0YP2/rmBqVyfrH1EP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1x61ZlDVtJZ+pxLFUPt1/iS3+v+qer7wqNOa/9TH2BYBKg4EO
	zzKNEdmBaMcXpjkqr+t7HweZB3hR8lq6njf39iVfn9IjEYGdyaoyboYo/TnOXns=
X-Gm-Gg: ASbGncuWpOYhe9xI6yWO2dL/8+c1S2rieiK5Ba5GXktdZL69iiS0waioiusl2Zx8dqy
	a3wx+KwQRFmmNrSsipU1Od216JJXk0BqK01E9NtY46RB1MfoSk/4tEHOgh2MHLA1ruLYA7kqYxB
	jnz2xMP8MW0u8kGT1Tad94onjjrRxxMW3WYV0xQsSclQTi2IlsK1p2MlppEOEUjqfgMWXbgAuVh
	2paGp591ffdKPWR6QFBE1pNtgzSFt+R8/FIZUW1exSIWUA9IN2KBUWVcVdMTw==
X-Google-Smtp-Source: AGHT+IFt4rSrOvohVwd4q64VIVCiXXusgKxJgOvFR5SJjIJN9uX1E4X8Khns9mw+xl4mziHbQxzjwA==
X-Received: by 2002:a05:6000:1446:b0:385:fae4:424e with SMTP id ffacd0b85a97d-38a22408624mr2696915f8f.52.1734705771310;
        Fri, 20 Dec 2024 06:42:51 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e150sm4190849f8f.66.2024.12.20.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:42:50 -0800 (PST)
Message-ID: <21d1605c49d7d6a0f7f0f532d99cd7d285bd2958.camel@linaro.org>
Subject: Re: [PATCH v2 0/3] Google Pixel 6 Pro support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Fri, 20 Dec 2024 14:42:49 +0000
In-Reply-To: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064252_902891_893AE0E4 
X-CRM114-Status: GOOD (  14.59  )
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

On Fri, 2024-12-20 at 11:27 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables support for Google Pixel 6 Pro.
>=20
> Since Pixel 6 and Pixel 6 Pro use a different resolution display, we
> now need to add explicit support for it, we can not piggyback on the
> non-Pro version anymore. This means having to separate them into their
> respective DTs, and provide one for each of them.
> There are other differences between the two of course, like battery
> design capacity, etc., but they don't matter at this stage due to
> incomplete upstream support.
>=20
> * dependency note *
>=20
> Due to the renaming of the gs101-oriole.dts, this series will conflict
> with any pending patches touching the same file. I have therefore based
> this series on top of my USB series from
> https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-0-1=
412783a6b01@linaro.org
> and the patch enabling framebuffer support for Pixel 6 from
> https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932=
a@linaro.org

Actually, since this series was regenerated with git's
diff.renames=3Dcopies, it doesn't depend on my USB series
anymore, just on the framebuffer enablement for Pixel 6.

Cheers,
Andre'


