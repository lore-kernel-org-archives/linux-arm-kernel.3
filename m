Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59467E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=; b=SzLdmw78Ttne8zuTb1Y8YcSRP5
	SU1WnRt4mTWnz+l1MugcfcSnILHB/CsoL2Nk5AdUH7Ryf2iQvgnXgsR+O8sr0y5MXFfIzgFEpIRCV
	HnbQrZIj8zNoZ9KQRxR/z3hM29HTnEmcoBYKBoh3BK6Lcz/UsZfCesJm5ZXBAb4/Z4RmzqjV0I404
	QKek+f7bHocbaGxNjnEPFHu3iwQpB/PrSOQyb/Yfk/2esnWYMR7kc3qwE9NiugOK8LQhhH20RvaV2
	BJEjfPloHDZ1NaHMkU5hzWU0VkAQCmVOu06oUFGh5ZZoNZ8CWmFBZ3Q52YRb1BaemIIaAUxqyADkM
	cDJEaxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Ui-0000000EwS9-0TkB;
	Tue, 23 Dec 2025 11:24:00 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Uf-0000000EwRq-2vyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:23:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7f89d0b37f0so2956758b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766489036; x=1767093836; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=;
        b=fPWiZM0FGu1OQjSXwgwwReOJz9+CcW3gTmEVfu/n4ObUi2U32AVjTLHaj8FLigj8z/
         gLKPpF/tFRZIIrTSiLWFk/Miva03feQ89y7DCzOD73K/1mJZZIpzrj2/SrVBACi4UBG2
         sn4uqvJsf7HtgC9smH0LAzCq/8BCPbpE3IMEbooAo64qe/Ci0i27b10o3qOjcOedROlV
         zm7GwkWA+WJDFup4KnB5pNKpz2O8JFNnWxWSo9sHMdgDbzByvdg9cd+zd5T00wlbSXFc
         6q66+FUr2esWkOFXTbIxSCZyLfyZG4VqJbe56o1X9lcEWERRzvkAUmtpYgVE0tv0NWKq
         HA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766489036; x=1767093836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37RUNcK4I4PT64rzfy/R8cHrYSg57U06mGC+3iQ2/Cc=;
        b=FOvDi68hzvTI5FyNavCyGbKbFaCrFLK5urA6s60gO71HQCcIiaYUDJJ/I1E61pzR9l
         SMGLMFAJIc4hgNkUxC1wJ1EsdCfQZWIbReyrnhwRe9xXJTN3Zzf1t9aSi14vMA0JbhBr
         2716HMOfLXaf2lOdeLlSQedgngNLRrOZda2MwreMuvfjq6zilSHenG14qjA+nRGMKFmL
         IIkvlwQiLhO6BSDxf8Re2WpaXZcGmuMYlfmo/XE/fpzTsltYzyPs3U8UIU/fjgYiZvDx
         nerHEia0MiTN3scjINMZvaO/f5f2g97zowfsDwZmCxNU/MB96JADljPh04Pqpfp+aPdT
         1r5A==
X-Forwarded-Encrypted: i=1; AJvYcCXilwTKenVMKrg5Y2TXZqIhoY80y1q8Dp9GP2RONh9pvTr4ck0tp5SkXZUobnZrJsxNXLi2BZi/SaFznqTUrxke@lists.infradead.org
X-Gm-Message-State: AOJu0YyXmJRrS6RhfxcVtOBsgA9kn5fQf1l3zI4BEn/UHDafucZmoIrU
	GV3WvCkb2LJ1xF2Mwhq+TjPancueuJuZOm7z7LjMzjtynga2x7a/sXdb3sw7rYlnjVFOEx56cTM
	2fbkElZM=
X-Gm-Gg: AY/fxX5ZmmCIrz3r5oX7uaB+ccSLzadqZXquK2gvmZ3Bhk6x3f8NzEoDLClbSzuEk3+
	txpH76GTLmTrlKnAQaDxGVqxJ1VoHDVcB/VioBW7RsTOyHyfTofdZb0kzTgX8Lykm4+o3Sumdbz
	nhPNHwC8xkOoIgGKTec1C3uvXuWi9nOde0/LmZj5L0EqAciHKBKT3nwxl/xg/NlDHUDjUs5oWUL
	/N31NRmfoTHFpi/muJ32MviLdBGuphp3n4rL3sxazAHkdplQLYQ1ezJgK5Z38pYyh/qpjRwp+nc
	RbpbG2+Jf6VjPjf+AsJDFFYGnZ7hIl9gYof3vz01JWOWUh6ON87AjvNRpngYASgdLPp9O+KynaV
	rJGM3iDnI6rNikSGPr4cEwQhOJwDRMc1oDZDVYRUTTCWNv7fzek5+laCp7Wih10ZY2JDOwQCG8d
	vwej/fqLmJNle57as1
X-Google-Smtp-Source: AGHT+IGxox0BnKpXIXpIkILbnFvlZ2cigLgZX+lwkyuIDPT6BC7th92Abu5fCPBNRSHMzVeVYDoTUw==
X-Received: by 2002:a05:6a20:a11e:b0:366:14b0:4b15 with SMTP id adf61e73a8af0-3769f933424mr13267847637.32.1766489036518;
        Tue, 23 Dec 2025 03:23:56 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab836sm13480878b3a.36.2025.12.23.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:23:55 -0800 (PST)
Message-ID: <a3b89ce1a88e9efb2ff6af27bd1bd48dbc06c2fc.camel@linaro.org>
Subject: Re: [PATCH v4 4/5] soc: samsung: exynos-chipid: add
 google,gs101-otp support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 11:23:56 +0000
In-Reply-To: <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
		 <20251222-gs101-chipid-v4-4-aa8e20ce7bb3@linaro.org>
	 <aa55c3865d151697120a2855e711d59468bdcd0a.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_032357_749934_9BCA97E6 
X-CRM114-Status: UNSURE (   8.55  )
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

On Tue, 2025-12-23 at 10:18 +0000, Andr=C3=A9 Draszik wrote:
> Looking closer, why is this not val? Now you're shifting the sub_rev
> register value by the main rev shift, assigning the sub_rev register
> value to the main rev variable.
>=20
> And then, all assignments to main_rev become identical and don't need to
> be duplicated.

Anyway, it does work for the SoCs supported, my RB still applies. Code can =
be
updated in the future if the need arises.

Cheers,
Andre'

