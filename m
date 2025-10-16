Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB8CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=; b=j0V337lhZ177QefQkLK8Uwf7Ad
	DOmIpCEPanSNvvefAnc6UfOTJZu5b4XAQ81w0amGTPvxP2z00ZfEk9DMKD9slLox9SYg1Y0ENPf2t
	S9H/mZkkYiUO43O42WeC28xJQdBiT436KOQXto+x0DzPoqn305fCiGmCzGlVNXAbz0LRlJiBIxkV6
	yhEtbhIggo4RdtslARQAD/aLHMmTk69ijG86803zV87YVJI6YQJIone5izCiEr04o2EdidEj0BSWf
	GmB2DzmIbi5Q201OoKKQwjUMWSE4nbqbp9OvJM2QDkUd/7Vt3q408Tf9+E8skuyzLu1uyXYSsQHtn
	1V825yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gn9-00000003WVW-05oC;
	Thu, 16 Oct 2025 05:44:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gn6-00000003WUm-0Nec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:44:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so385477a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760593482; x=1761198282; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=;
        b=X51uqUipgmAQaED8x1W+iEFIlvRAHxocBkqSrqiMKMACwUsbRPbxo1W/5iOC8k3tDV
         jE2hyMVCIywSSOgTV59h4p1BTpFTSyRIC55M0DlRha89PibinDM4gJf69ZIV9pZRDUD+
         n2H6GOOK4fxKXZS26y20WpePUZqpux7z27NoUPDpMMtpajDx9t1d7A4gd4BaXJqEdh0/
         XS65TtSwjQl/1tnSUYj5h3r89KoONyez/JDkRTT7OCbSIcaZqnGkJC8tEMisquucoNpp
         tPWx2M8cZeTOPDi+wEWjTZPlEbUaBsNSsRqfV9PHoYJeUYbLxNQiET0KLSsrdev8kzBG
         4aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760593482; x=1761198282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9TBkTZ5r+V3Vqzg3Erf9DxM3Aqb0ebyWyF6uv/8DBk=;
        b=TSDe5F9taFIzS5wkLbpgY3OvwKlJOkpbjf6+eCE+vvF7pQK/uQ3OMZ/mhUyLv3AVxI
         YxRa/qtjKY93xJ0/O/yHOOcfpgvzYZaXlMa2gEsw7Kfropk6VEUKLxBZcMX1UxSflJGg
         YFKygBcanz3ehUyuBuPpYBJ/IP5OAQIO7xTdCkAGsNmvroyN+ImUE+TsMCw3zkhY05L3
         6D27dJA1VHOfejjD0V3vlk2gippCyCRhVYNendFDc+6tnU9sYsfDhDKlrLspOdcjJKaT
         eIhDRmK21vsXToRtLYnWjNUSWcxt6MoIGiPGQ/qupzLB/BwGFWqwCshvNrJkXGHRppj1
         ZH+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHF4Y3sdyg8b0OzjY8xXytJ65DS0QEz8bHKxVCdYzzL8Q44TMOU0JgCGCCgmP7TXrRXcSE+KunOZSFEa/godKw@lists.infradead.org
X-Gm-Message-State: AOJu0YzStxIxpSn4AE1CnlSaa5IZZh8MVody4sdELYWZzgF5/8tUJ6t5
	PXYfv4hVFWeNJZOCDy8YzuU6ZjMYlZYHTdoETdw4ZQ0XPleLvS5NrIYQ/b5qjTgKS+4=
X-Gm-Gg: ASbGncu5DKTr+L9LSBMj5xuaHLFsS5aRcjMyrGam7C542cW0XNwg53KhS8IY7qQG5QL
	dejpCYgCnzGdK3c1XDi/GZ/GDs6OhPuVgkgkNKR+VNPfDPR9zb+PuUt5gd95x2P9fMIaP9LHYjz
	aucCRjNlNNC8u43nzBugVil7xqtoFC5CXDLQhCHnyVckiQvaZxVf7k2ZM0fL6oXtLgBVzx6ZBYC
	8DQi5UMn2P0HEk+2K05gQErVz8RM+95rsUdt7kPzcjHJ6Qgm/hpzkEM4D7tdvHXAkpEFmGZC2Es
	qTbj35rcPBLInt7XUcjmkg9/8rNq00THT0auzCqN9nBIkvQEKgJwfOFWe5TjzmxGtvBNJ96yQjv
	+kyFN7yxKW4IVz5IALCjcfYGfbx3Xbu6t5EinN8zgFKa8nhLLorAgOh/dFOLq0o+qt1X7x0VNlV
	CldWWuz1iWf3LJTItBNQ==
X-Google-Smtp-Source: AGHT+IGTAzXneDlTJJthrwyFh1A2mpMs+brYmC8fjkaobeSG7qIGMGjBpTwlt/OHwTYQt+NY+Zh2QA==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr28820056a12.13.1760593481782;
        Wed, 15 Oct 2025 22:44:41 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133412sm15055961a12.32.2025.10.15.22.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:44:41 -0700 (PDT)
Message-ID: <a8dc26e96c6ea0bbb2b9f02ddf3360cf0fad8331.camel@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:44:39 +0100
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_224444_150127_43B9D309 
X-CRM114-Status: UNSURE (   8.74  )
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

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to t=
he
> documentation.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A01 file changed, 4 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

