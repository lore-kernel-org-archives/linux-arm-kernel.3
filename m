Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F79C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzq+r9yMIm0uTkpbSqWC8pZkfh6urePDYePki9/XTlo=; b=Bnipsz6m6zbh9jkR2GcTbJN7Ba
	eqqTNNrRDo3O2IlpXJvASrEGIClTK8PR2EbkAQ35tXNMhFRFwzNwPttGHWFHXf4AJVim3tbGPNHux
	hPLtUwPCuMITa3Bm7DodgpTBDAYd5ch+SsEkhQzKavItyeT59sKrHVaNztfst3wRrwP0VO1KxHH5X
	dga0yLQnxSUwW1CxGgBbIAj0v9fYesWOXRcm0nykDd+tqxEIjTR4GuzYTXNAQig6otkzyNf+kcxmj
	JZJi9TtGEJJ3mZFOL3NECMUF/s4GwrftI/kLgASiEgqDX6hrB3wmbEXVr9tqWgzIzIJpaon/yDtbu
	JS76gclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udapz-0000000FhyU-0kSV;
	Sun, 20 Jul 2025 20:40:47 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udanZ-0000000Fhpq-0o03
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 20:38:18 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-41b7d1240d8so841002b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 13:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753043896; x=1753648696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzq+r9yMIm0uTkpbSqWC8pZkfh6urePDYePki9/XTlo=;
        b=IVqxmsR8S5risXjpy452FqWeul8jdNRdEd8U96oqO9feF5Y154xcKudqq3yBNTUUB5
         PbMvwGGXZ/xjSfMjo8hccf+rSsqstuqdUVKF6kyUYfdJwTzqbVp4YbQQ5kdatUdGkiC3
         UcbvLN97MPWE0fElOHd4Bcl9FAl4RPVWhTGU003RgRfZA4mrb86MB50/2t8UsXmzTZOn
         FUNa5o9OKNaRBq01CUSHEZqgzfR8L+QKR5mT5LzGhcWF2SCigb6Bcg+MY8bTyQYiFW4N
         DHnDEJZ2fPSLwrTZ0kGwdb0gQKXEEyBRttDAGb78ymj5vMoGrPXdfg1vY/q7qH8G4AUn
         govQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753043896; x=1753648696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzq+r9yMIm0uTkpbSqWC8pZkfh6urePDYePki9/XTlo=;
        b=KYtKhwctdcTVvu7G9P4V+RQ541cZnrh7yJeY4B2ufmkE0tnftviZh7ihJEvpn8uwAO
         D6Igzl12KOpSQLBlHtoYZKn4Qu23WIb6Sh60QhO5RNzfpceoaNKGOuIz6l+WSMm37yEQ
         R7S3piHCsEzFZvOGwzkdPzoYVDkCXT9QZkmutWpu5KZoKGOQ8gHrZg3CF3F1B6/80fp7
         6giXjIcKEm9tlNBkZ2fP9VlwvGeFff+c5SmBF0fZdf6fu2NuEdaF3MY4nUuzdpGT7KNU
         wltG/b7vz9mp8GWdQ2i82+lPg7ChKWK5uypyyy1B2jzD6chAxo61mLxR27Irx9hDGk5U
         5nag==
X-Forwarded-Encrypted: i=1; AJvYcCV37sfaQqx4Qo01JSUQC/M0EWHsFZNxdKY9Y14OZIIhSq5epOvRO4ylAgaDb5TApsAvpMze2JIsCDb/Y36KkkHw@lists.infradead.org
X-Gm-Message-State: AOJu0YxOoRV11wRtfyq4CCmfVlgFuhv+25vSqg2ZrtFejOgKVrGx/9Lt
	ME+5lc9G2LyfQLy3WIyIYL/4vI+1q0T6OgpwmFI68cIgKSIqQ+KAWI1y6ztXkXcfedQ0mXwAXnP
	vKT7DMXBGFORqvI+0BoKn9DBndn3dWKI=
X-Gm-Gg: ASbGncv2ml5OKC0VpjCXEqG9/kLqNdIkQApgDfWVr6rDp+kIy/aMwuCE+qUZ6WnEDLv
	Q9unCSVxe7OZcXc5SH5rE+cIHMP7IOPJ+q+xWR66yPV6tuP6toBPjwQDQpPpZIugrByzBL2EFZ5
	dCa+27OvP5+EV/bs4fZBjzQRKihFS7PR0mGM2GmkhvoVcvRlpQM9F5emMrqG3VhZ+AaEPEz08xQ
	6mhixAM
X-Google-Smtp-Source: AGHT+IFqM5NWjeucoA8iIWZcczbHnSPghvrG/jBV6uyfAA3kNLOPfjqdTo8q+7Q/oChHK5krN/lZwLiMN7UUnVF4/1s=
X-Received: by 2002:a05:6808:3010:b0:41c:cbbc:8abe with SMTP id
 5614622812f47-41cf04d9d0amr12433440b6e.31.1753043896177; Sun, 20 Jul 2025
 13:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250717072209.176807-1-peter.chen@cixtech.com> <20250717072209.176807-6-peter.chen@cixtech.com>
In-Reply-To: <20250717072209.176807-6-peter.chen@cixtech.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Jul 2025 15:38:05 -0500
X-Gm-Features: Ac12FXypnws4z96JaG_5CTTaH26H_l_f9V-btMxxJmE2pbuUWr7F44HPoNjyEoI
Message-ID: <CABb+yY0toMbsRkzBO4fpR=r2KsTfT9ms=ZYQ9r=yhsB_YY88AQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/9] mailbox: add CIX mailbox driver
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	sudeep.holla@arm.com, kajetan.puchalski@arm.com, eballetb@redhat.com, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>, 
	Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_133817_230037_09E56E66 
X-CRM114-Status: UNSURE (   8.18  )
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

On Thu, Jul 17, 2025 at 2:22=E2=80=AFAM Peter Chen <peter.chen@cixtech.com>=
 wrote:
>
> From: Guomin Chen <Guomin.Chen@cixtech.com>
>
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
>
> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

Thanks
Jassi

