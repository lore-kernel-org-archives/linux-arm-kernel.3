Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF1BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=; b=FD5UQAXk5LvXwF/xlfXL1krrx6
	Rkd9E0K8Bf2/EjgNStgv/QQDN06E22vl4X0z679N+FF6VbAkLitbz+t3JV6oD2oI/IlvHHq7z+eFi
	LB1WpxwSOepErjgvagOn/3xFL+VRNrHOhM1MWjeFW21K0DmjjHXwZtNEXyDkLOcCgebLcDZhOonxP
	5MpWmRfAwq5dHKg2Jyj2Yf2ckZlXBIb3sBaqHdotSeLkzh+AMxGzubbrSuRxCc06g//8Y0bqfLDFO
	GPRDfLE8lsSqSCJpBGUe2FLS0CIuLDz4tXscgTZMWJx6fp0a0JaWjdZysuauJLNVp8A2Vb03nXOS6
	lyMmrebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzg6-0000000Gfuq-0Qdc;
	Sun, 30 Mar 2025 20:54:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzeL-0000000GfqR-0vdB;
	Sun, 30 Mar 2025 20:52:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22548a28d0cso105630205ad.3;
        Sun, 30 Mar 2025 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743367976; x=1743972776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=NMje6EEz/AMVoTSY/AiUNhqGsHvZL07YC00GIfvk+wOPZwAf4OyDN4Gart4RJeH+Em
         dO478pkioNBtwLmpFsGKVR2qV7Q7lIcVGtmRQitjYXuf5ioJVJG/Q/TNZsByAWscDXb7
         h/7YKxDviBKaTeeMVGyYB6NdBI2tr/RjrZ/wby9GcHXIuZsrd/UyJqHLhQk0w7MFbvy1
         iktuKO8Ub7iepqSuDRLRwOen8NgEwRT/alvV0/9TZNdE2QO0KaFRsAcRDulAToWfYZbE
         FEHbaptJ8Iu7b+aq1/oSvO60rYl0rEgI/J86BWGvt14pLjRK11QD1ZGhymJBuMh68IOE
         NMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743367976; x=1743972776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=ah64rFta8Mr1RjCHQEE9u1MTiJG7G+K7gyUlSOV3fuLg3jfEcCKFHCyvQOUTvplcLl
         maosY++X3HYlw50x7r4/cttp4dcCkgRPehKgjoRqfxeES+1pC2akDYwK5C0nShA+sbTG
         UogzP4cPUdXvtO6Uy4K2DAvGkiF3R7B4CRTdOhpri5XZShvsGdshk0Tr7v9XgcUs+H9v
         x7+XDYoe4xJdNm/qLm07Csg4qL73WrTV9XGJTC0BeJRGNxpKyspg2OVp+N+6DD5EY8Vz
         eMWdJ8mWfKJWo/Nxm8onuuthdMPolfwZevZ1xAha+xLq9fuqAMQ9GOqWJN7LHtJQ4Z1O
         c64g==
X-Forwarded-Encrypted: i=1; AJvYcCVPdtfNEST+Bk5xCmhtc1nGksfqKcD38l9EDjWEB1c21pwkoiseldXjMZbclQq4cVo/ca7Y5YvyM3Rvib/A@lists.infradead.org, AJvYcCXh/gYGGq5JIk3FdLKAMYoQpQw9YWUcwtY+5UDEjC63t5+qG4mHU/y8w6dHxFQYzZfmdeJzJQpxB5iMJkYbzzvOxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeeKr8AfLyurNSCKE+pVfCEn3pkrZIo984CZtPAegVw5h2gUQM
	e6yFd+FiYYZNsG4bRxzJ4Ugj11nilKk69NxPbG0kjstY7i4S74GkedeVtgWn9hhazmwUjCYX28l
	uhzGy9y3GQZ/s9ecqe/uoi6c+5B8=
X-Gm-Gg: ASbGncveW5gc7JMT60tn0xb1HEa/VHIS2AOInqPjs6PKZW0p7NtagMFCOT/vvHaJaGC
	erDfK1GddVKG3Gt7xQqiW+4QImXo+PZMU+YB6ptynlVJk6u4+EFEqK6olxsRhlD4ssdS+13bsrS
	NoI/lczxkaBaCbgsOeUOo3iqaEupDM6IOLB2SNwj61aiMI8g1/63FslTo7hQQ=
X-Google-Smtp-Source: AGHT+IGlpG9xeO7YabfvvWdcL4rWdf0vZ+QCfsjk6aFSH+Qe92WIllUZklTnZqtfCCxYvcoObf2vFCcEInm2m2e86xU=
X-Received: by 2002:a17:903:2303:b0:223:5ace:eccf with SMTP id
 d9443c01a7336-22935084a88mr74482475ad.25.1743367975896; Sun, 30 Mar 2025
 13:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 22:52:44 +0200
X-Gm-Features: AQ5f1JqiXYa2Fy3B0Ec_8DxGmkHROyPsojXcUZGTqJUnNHSoBI9B-XlVAsRTV_U
Message-ID: <CAFBinCAvCvqbv367_rn_Rbvn7p8q5kCLuSE7m+gnxaDo9FvaeQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_135257_301681_EBDC1904 
X-CRM114-Status: UNSURE (   6.85  )
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

On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Fernsehfee ("TV fairy") 3.0 is a set-top box with HDMI input and output
> ports. It originally ran Android 4.4 and a Linux 3.10 kernel.
>
>   https://fernsehfee.de/  (German)
>   https://telefairy.com/  (English)
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

