Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A05C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=; b=ECsx950C3dz3JsdMjrkLh7STOG
	M5rG3R6HHjop0B+Nk39cUkPOCD1eFfzscMDIHGc1rYYwDZr5iNsXu3p8ZU3LOz5AJroV+qiX4dNXd
	kqcHNwh7oI19lEaD5Ttk56L1cy/oyq9HiwbBOR7WzChLNqgl5r5Mi814B0fuh3mLK3GhY+mKGiznC
	EaITb1FNx2tLFSwAFgiiHChGjmplaEPvA/pZRHjFBjcNzaq7aJgWtOli9qhwti9g8+BccBqWmI18A
	Vm8A38cKXcrCR/wBhleUKS9t/Ns0COKyZsrSSf2uB7IxH8IHEDockBscdjyNZ8mv9XUNSWKjzzCGW
	q63AwqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYTG-0000000EQhE-0G4L;
	Fri, 07 Mar 2025 14:14:38 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYRd-0000000EQZo-3ENZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:12:58 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-60010601291so375321eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741356776; x=1741961576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=JqAFO6keoZ/xV/WaoSl0nlR8sk5yg1uNk6A6EvexvXXrlXdo1qvfafhA6E/7iXuIck
         qqTQqZ8x5iSmrON+cGvaiZZQ3A/P+smcSemLHDiFEV/X57keejQtHb1mptBsZRZNl1dX
         AFUUXDr4t1zifGhXw/0zh8Zw6RButh1dDGlHSRngoavncHcZbgNPMqgO23JUSI1ykwqN
         FzWqeGQVi3og03KHLy6K4uhV+Ztz5p7t+dhhfYakLEY9l53Jql8weCfarlmZu4Y8ZrrO
         8fh8CiXLtxe3BQZZ31VW8wDkLZqEuYQuNiRaNjv+ucauSD4rQOjHJX4ZMXZraG8GYlNJ
         un+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356776; x=1741961576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60re8BiRqNaxfgjZjOXpMIdToHtt/3wVQ2TQ428IPn8=;
        b=ZsNn3Zbgz/aDVUOiZkHGtbNaYBR6Jye8A3DKn3FJJj3MIQcQNzdXp/ehRyLVbS+Iu3
         tdVTTOVH1ogQgus0tjrWSHLyLjM4wBeIn5J7CjEGZuLkfoRSEkV6AoQ2B3wXH7Q04yZv
         8j2i0qef4a7qURgr/l+gPwOMNP9NemIEHkwjW+1qvfOaeBWOCnpLsVL8CQK+PYiuLqk9
         E7FMsWIdeBQ8rdpxv7voMIbVROG/YRdwJ9d2g5SzLUo4OSRzZr6j+pm/oGSRB9rUyuEk
         YktHA37pfcyNpF7JcjOao/sj9L4ql5KGBsSNNs7XNjQNy3yhwP7Pl77tid0R09T//AWf
         jIFg==
X-Forwarded-Encrypted: i=1; AJvYcCWgOKqn1xYP4K+bFnx74gQU43Hz4eRoQwKJQnFRzsCjuh4o/81ZCMOq9p9fyCqbWuFHQjU/yA21CGAxDAtN6Ug6@lists.infradead.org
X-Gm-Message-State: AOJu0YyRYeKEgSkozY6ceUdkkStczJPukt4X8YO+S4LGiuPbUAcjElyB
	PCc28h2phZQPp0NTIYc63kKI5rU++q9P51Iry1BtHEUrNaUEvWQIxMelkN9w/YRSNxYerrte85j
	63tPmOwabnXtnJrf7Qm2VE0jFj7wzmz1pudEtnna0WFY0XEpntvc=
X-Gm-Gg: ASbGnctwuAFOl1depL01ZJ746KbTgkWgoKrTeCT37n+0wwgG0BD6oKrzaJg9Jwc4chq
	ypgXzjeUqJxUG/pqUEuur+lGy2jDCx3ezu1foPmrRx9FTYZki19b773exoZ5zD6TuvqZT0a0UGS
	IWacq/Bl2gWMP/GNDKpqmLTc7NSu0=
X-Google-Smtp-Source: AGHT+IH9L2ObJ6dDXOCpIMSXNSBNafNehee0qnPWJxOsmaTrt6AVB5PDvXlGpGJ+NlBDx4GXdCpmmJeVhirk9krz6vY=
X-Received: by 2002:a4a:ec4c:0:b0:5fe:9a72:3dea with SMTP id
 006d021491bc7-6004a767138mr1732794eaf.1.1741356776690; Fri, 07 Mar 2025
 06:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
 <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-1-ea1ae8e9e2bf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 14:12:44 +0000
X-Gm-Features: AQ5f1JrAJDWL1aZmpxNwroG6aOpF70B9j3ySId9aUtSrljkJO2C5fdV0SfrMx24
Message-ID: <CADrjBPqxTiy8D8PVpZBzYnes-hxqKX+gd6a4WgJeDE=x7YQKAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: samsung: Add missing mod_devicetable.h header
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_061257_814556_27BE8A78 
X-CRM114-Status: UNSURE (   9.71  )
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

On Wed, 5 Mar 2025 at 20:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add an include for <mod_devicetable.h> in the drivers which use
> of_device_id table to bring its declaration directly, not through some
> other headers.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

