Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB20AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 03:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4szIC/lsRfoeS9xWMEZR5DrnZmuFrT5s30XlGRR6/U=; b=xnnRvvxaH+demOlnDmizf0ynH2
	XKtEPUspbYphiB7zTyo0ZOircy6PqpIYBRnwcDjSAWaCLMPo+uVbXRWY9Ya+ao9MDtrsEMzlRmA6O
	SODwgrGYcyEdls8TIm1Br5DA6T7cLqB6wkVpJw3X7xvKMmYKM4fA6W4R8iW2yDxDx0DfSrj73tzL8
	oKdOAqg3kMfOKFmBY8n40gREL+CF506eTlcrDftic15Wv6MZYPHsTC5ex5D9of0zaROGj+9BeoctA
	q1UsV1sen5H9++PSZJE05y/2qiaU5iK8lLxcs90aEGHXUIJBeaTzPN/gkhyzz/+EWjIQwwkx6/CjX
	R3B4/JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uemGd-00000006O0e-1oC4;
	Thu, 24 Jul 2025 03:05:11 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uemEA-00000006NqI-0Ha4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 03:02:39 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-70f862dbeaeso5633207b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 20:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753326157; x=1753930957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4szIC/lsRfoeS9xWMEZR5DrnZmuFrT5s30XlGRR6/U=;
        b=gadBnDOl7woBNNGhdhBJAtEkEgsuUfQSZdEnKDAfr71QGfXOJkIQc9SLKsaPTWqnQm
         /pMY6iKm201WONl3OjylOuhQM9BVQWdj+bQd4OTqxsZW/rs0LQVEeLr0FATTiHbubx2c
         ykulakJlCGcIZ6RvNVWUojokDHZOurecBiez8dAv4OGjMcNiD4B3KiTQo9/Bzb87pGHW
         Wgp4aPhEM7wIcTgyPt54Lb3rnds1kOiC9yfhmG7K6AylDEFb8scPTVwCcEa/vLwzwTR/
         eZgo++6FoI9I8dq8xhwiWdGFQ0DTVAObbrvt7GSNjEa2k96H6QVsJDJ3edxChU/ATUGI
         1XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753326157; x=1753930957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4szIC/lsRfoeS9xWMEZR5DrnZmuFrT5s30XlGRR6/U=;
        b=mG+ujpDP56MTlseuu2/zJ/QfS/VEVBnmHsmtMxnjUHFLg6UX7oK7U8WR+BxyIGEUWg
         uXrNHsBTSqb8Gy5gXPPG3Cnf/KaI2LMCLYh5NLyXX/PMuDLhgj/aTHrqgIwi+dP+rc36
         6KwkFutwv++dW1fJB5YVIkYxnzRyPJ8AjMuUDDV0hpjlK9PvD4sQdmQxbZTeM0ViYuOk
         Xisa8aULnn2iZ03Aw6nrkTzC7IQN2c9cNLZN0dqi2EhtvQoPeC9mhWb0KsS/1u0ED3sd
         /1guMwBi38WwanlwDUzQUmQQHJVH2S5fCAuj887ZHrviLFSu68WN2+PTu96pLgO5JqzK
         qrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCVVVpfb9IpAwOnvfk2g27vO4JsLNqUVVUFMDDIh7AnuzSzYAnE/ynYk4TRKA3t1BphGbg0J/8MIN0hQkZP0NR@lists.infradead.org
X-Gm-Message-State: AOJu0YxKif/KYP9ajcK0/mxBhAj/f0nh1B1Rs2MLPtWGLZ67WSJUFJfy
	Osj/iBGOMfZnyewHGEXlr0aH76YfOXf/NhFKoA9zqumk1bwktoA3jKi+17UG58/5VcmgSpBUUaW
	58o92uk98+1rJ4dpEAJw1lQFZkqKz+jl47ZsUr7B1uw==
X-Gm-Gg: ASbGnctyZKukAqxlkqMVrW8tz2BsfzFkFKgKj6miPdAY8XqjFRTbYcMuOWJ5BnrPGWZ
	+NwrH8+Wjwemd+O9UmDgsHYUAU/rV705mn0EN26hFBwlNEhtPH3kBXgkqVSD1znZJeODGL3MEi+
	9Nhi8Kkcfq1x1bIcyvZ/YqxpfRN2+m+znK+BVltS9A0bNtNiW3Ixj10OimjsF3GbYsx0L2WYFp9
	WKvuUo=
X-Google-Smtp-Source: AGHT+IEIMtv289DTIkybfPfffRPAzee3+9DmTAuYGJM3UvEoqefg4H82jx7CiRhNSKxNLqGq+1drRcysqqTEjMpfosA=
X-Received: by 2002:a05:690c:22c4:b0:70f:83af:7dab with SMTP id
 00721157ae682-719b41e5925mr66244057b3.4.1753326156883; Wed, 23 Jul 2025
 20:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka> <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
In-Reply-To: <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 23 Jul 2025 22:02:25 -0500
X-Gm-Features: Ac12FXzQwje0qjCw-CvN4blAJTQm7ENnYNl_ILs69QPBbFxu9MyH6hiUp_sqjVc
Message-ID: <CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_200238_133603_9A25C2C5 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, Jul 23, 2025 at 3:21=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> On 7/23/25 11:15, Krzysztof Kozlowski wrote:
> > On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
> >> Some device trees, like the exynos2200 one, configure the root node
> >> with #address-cells and #size-cells set to 2. However, the usi binding
> >> expects 32 bit address space only. Allow these determining properties =
to
> > So if USI expects 32 bit, then why do we allow 64?
> >
> > Switching this to 2 means you use 64-bit addressing for children
>
> I don't, but the main point was to avoid defining ranges for every single=
 usi
> node, because they are a lot.
>

If all MMIO addresses in your SoC are 32-bit (they probably are), I
think it'd be neater to just make the entire "soc" bus 32-bit (so both
address and size cells =3D <1>), and map it to the root node's address
space with "ranges", like this:

    soc: soc@0 {
        compatible =3D "simple-bus";
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges =3D <0x0 0x0 0x0 0x20000000>;
        ...

That's how it's done in exynos850 and gs101 dts for example. This way
you could drop all those extra "reg =3D <0x0 ...>" in the child nodes,
also avoid declaring "ranges" arrays in each USI node (just "ranges;"
would be enough), and this patch won't be needed. Maybe I'm missing
some details though?

> Best regards,
> Ivaylo
>
> >  and
> > allowing DMA for >32 bit. This should be the true reason - what is the
> > address space and DMA range for children?
> >
> > Best regards,
> > Krzysztof
> >
>

