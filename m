Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6458CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=; b=sh4rS2Hhld+clG2zwokkTUPmp4
	rQAVoLFUdipiVq+nFtGD5oiOthkHOXq26Tvu/VY/5iOq/EJKw3QdWotxAhcg3F+sR6Ie/iZQYZ1TX
	9TyNnsv/WrRltC57ZJHIOn2olbqq5cMS8p5Qf0VNgjiJefm0AUofbHmlLRVdk9oku5HAMnfrh6QBp
	rQVD19v+4X9SKNVTfLz+KEWZMUeUgvqD0LCI3vqtYawCMvVMpzIXo+eKUlvitjG5dyGoZsmSs4JFb
	ge/DmEGLgsWDXSlskYkPOS0Grgqyytw+mFnyAKwGkbkmRBdIju7EsUkmhj8iZgquS0dBU8mZJLEEY
	XMaqLRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JGy-00000003uok-2lMw;
	Thu, 16 Oct 2025 08:23:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JGw-00000003unP-2pjX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:23:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso613675a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760603021; x=1761207821; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=WuCgM4SgOLiJX11DCTKS0hicwhXRODYNWw58UMEjgWE9lxBbbhqfi7QhYlcot724aa
         8S92+v7/XV7KqaeSuTNdCWkQ8PZQBl7HQD8C7Y6HuV524becDI4oVmXRp7zfWDoLO5Ih
         DdYlSz8Vzsyz3GpiJ37xAF/dkqu9CyESi+dQgHjCqJdPYyTGfLDl+3qElWbJDlCEcQC1
         At8NwIkXp7GM24dg3oq+DjriSL9vFi9TGKiIAFEqVdO7gLscW/d8lGlV9YQ+PfJEKTpV
         6GlxBhCVwNETKUvpXPrrK3Ww3e9iPKse/pV0WXQLHUqXH+7p8Hgxr/iMZhrffPcHZvds
         AkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603021; x=1761207821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=iTdZ+TN1ttnvKWCuXrlIGIA3gm4WdNq85Vd3RmS1q5NEWl/1Egr5JaM3XH4nSyZkSX
         ZlQR7J4rYDMGbNyHBizjd3kmgnt1BJ1i5nblGhFfun8ge8wH1J60wzYw86Pk9kQalYVQ
         G7rz+VfBJSuE/+Wv9BOnH6lG5lBb1N4GV5QtFm2HM+JmdBqQQFmkeM3v4wlo4sA3GZtv
         g5g4d0b3Nr2ouiyiDb14zDIt25HnqVcjScfFV27+ya1hLKru4kpU5ElT5aRitUYRjbdd
         H2GCrohXcHspWeTFlRutkVggSUMo54b9Zjilec3jFWbGNe3mj8AuMSiru3w8yTL4WfPW
         +oPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ahLGTYpvH9iNKQV6fKv8HnN7zvGGijnByrQHzzePu/RrfGKqX9gzxTuGDOBKYpgIYOatx+I2xGXCw3KSrnxe@lists.infradead.org
X-Gm-Message-State: AOJu0YyuR+G5ZmFB8yysM+8PxLg9BxU6gNjAQOEuqTRl7mZElYsCSYPM
	MJb/RoQV+hi77JQQHtAJGhwPPr5Z5hY2KRRhMVKuzvTunCtUMQvf1BtJlPQZrp0hxf0=
X-Gm-Gg: ASbGncvYR3QxLmI2NB8IeHVfvg8K5VVWdSDqKkMUfyTv+gIfB75Nl3R5fjaJZCrIMCY
	JStYlJSmYqaj4LAHI/IyJSBV5pLMGgdfhqORG0LBfHYzoWDwssCerj/FgZl+FgaWGpJofqmj0Eh
	8Pv6xly9cDjwFz+rX0VfvQLMFld5rjp1YlmLJeuZnWrEmjNamGgLe/PH08sEoq2dd300y3Yhqkt
	R/p1D9RonG5xTRqbNQ9g6jlycM2jqzyu8WJsAG0gkZWGiCJsc0bZ5GvQuffKEPJDNAJjxeNOmbF
	32AfB7prAQBcW3oWl2LJTb9w/W/ZgQNGRVVvQK5fZ/Dyuj3/UVkATHELS88REVxBOzvHfOzN86z
	2zrykTD+YEF5zQCvDgsWEJ7X4HOSVVLxNL5ezeJDsExVkAZW7l6zORzFfQHEJGuPj8kmW9Emg5U
	ujTVRAt/0=
X-Google-Smtp-Source: AGHT+IHxUnUcoHUcFtyP0SeT8nrAVOhELQzl+mJmkJlg9L09uwKru3NwHd6GyQw68Ab0pvVWTAq0+w==
X-Received: by 2002:a05:6402:26d2:b0:63b:f909:df50 with SMTP id 4fb4d7f45d1cf-63bf909e210mr4148941a12.14.1760603020784;
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b7144esm15099610a12.23.2025.10.16.01.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Message-ID: <17643995510406a50157a808ee4191488f24f97f.camel@linaro.org>
Subject: Re: [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg
 property
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
Date: Thu, 16 Oct 2025 09:23:39 +0100
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_012342_726054_828E5235 
X-CRM114-Status: GOOD (  10.05  )
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
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream)=
.
>=20
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

