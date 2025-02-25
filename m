Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5076DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGCiGjD3rT8WeMapv2F6JsVOidAV9/I18pkLa1aTeys=; b=bxWVK7j6vrGl0q+kzEvOSlN+Oi
	h3qJ3HAO48G7qtEs/YXsNc2gom3p9nsgCtPK7JaIn2v0+EsiRhgEqQ8HltdunPdz97pdjy5lozRFO
	TRUgWub7JyrNcKz3DCGXNOD3ikQV0zpfXAgrnXOvquhNtDee4zKBXNeYC7zfKmNHnm/aLXF7KosOH
	h3I8/UI7D/aONKfhrpQoTmXIYRIubciy1pE6MV1ZyfFOdLL2Vi+f4a1MWJFtaYbxGL3FCPK4FJsAo
	W/HHyH5iDoxkK7NClOOsm3hoiqYZcN3l88XYyJXhp5cqHOvJctIIzbPW2L/n7W5TrDkh5LI3QNUrt
	h/MYm7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1i-00000000Mgq-3uHu;
	Tue, 25 Feb 2025 16:43:22 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwqr-000000004TO-1bNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:28:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30a2594435dso66185121fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497283; x=1741102083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGCiGjD3rT8WeMapv2F6JsVOidAV9/I18pkLa1aTeys=;
        b=kt6OMFclfDgc+jQQ9oB/ajW6+C9YIgtPMoTKTEPWq6Ie2Bc6OcPwr0W5bknnVR0lz1
         hwlT0itleVMEDYdeHew2f5aTZe3yZvqV7ls8vXWWwZsGW4XjfGixxNNnVGi+h2FXJ+v/
         3l8Hnm9MrewP4HWK6FW31V/5crs9m9z9Cwbs0VQc9N59R0Vm4cOGiWxi6GTeTX5gjn8L
         3inGyQB6apRiUxXo1CL2Z/mWiP1xR7Xp0gl447leNbsdjVEScOLIDt+LcsX/z2dMZnJe
         lbBfr9+OUpRppmDjavWb57o6OtbKQK1bAhkMPQXoG1hbLqmoHnkMM8kLuFW0QPRIunKp
         YpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497283; x=1741102083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGCiGjD3rT8WeMapv2F6JsVOidAV9/I18pkLa1aTeys=;
        b=sS3pix4w4s6GoQfkOshNgVCxmHXWNjrBdFTcMNbIwlT5vIQKWFS+q7X5NbwMg3nPfO
         7cCQtcBNERY6ZNxuSDrZZ2Af+BXvozB4vhO0tmkss3dqAntfYN/rx/cFI+U4Pptw06lH
         oZgarPmcLM9jhyRhk/eJydfoHzZqZD7Ra2vakqAFURnB1S2VtOtxT02kJ9H0KKt7gAtb
         2hAUst7DoMGqq6cRNQ6fBrn24m3gxcZnNIbpOop/wOEvERrR2g2i0kbBIGXzCHLddQb5
         pF0dWji6cHvFbTNJn0tofF/bq6lnqIO8l9eYHUh09JpmfoY1rX5FKhxf4FxYKkyZq8EB
         8+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXEOtj+qdyRK6PCp0m9PbMAFM8apV3xI+XILs2kzIkL7sfbxgSLGTz+jbMx8KvoFQpn9roaFqJ9bYGMHG1Xc/dq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl5kCQsAKqf1Vbdq/70RCwthMHFOCGQ/y6LN0lK4/JQLlm0bBY
	zFnDt0zjwYX522gCuBic5p6MSOiQhw/L6XYQ3NjlioZVlcwxGJF6r8tt5uNw+L/v+CgATCXO8i9
	Rd/pAALn+1EBUEKtd/sS93jrTwf2ELNqLLIlxiA==
X-Gm-Gg: ASbGncvZtnAUYjcQr1et6Ow8I1WGlmWPlvTGOh67maTAXy4vLT29wFQ/OCldMwWWHKs
	Rk/mOWvexTs/ZmROp3+VQj1sSYtSMVcq7d08imyTP2PQtjoZnhopdBjs/HRKD/uOgPdKYAy9YD9
	vd3Ia5kk0=
X-Google-Smtp-Source: AGHT+IFIC691aWiQ6fX2Kh346loDQMF7svt4x3kP5BbJgZi/TCTQ5bjaKhl56TTJAVegI/rJyBI4FUJAROWzfxVZ1R0=
X-Received: by 2002:a2e:98ce:0:b0:30a:2b40:af0a with SMTP id
 38308e7fff4ca-30a505bbbb3mr72437221fa.2.1740497283523; Tue, 25 Feb 2025
 07:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-5-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-5-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:27:52 +0100
X-Gm-Features: AWEUYZmXC8d0HT56SyUltkg7iyFAN4LOhovsbEmG_24mIAewVxMQQtWLIB3aLtU
Message-ID: <CACRpkdbCZr9ZWirwfrL4MFDXzYmHLWQYzw9bTtGFu31QTKo5DQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] dt-bindings: arm: Add Rainier compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072805_418472_08DB8B0A 
X-CRM114-Status: UNSURE (   8.65  )
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

On Thu, Feb 20, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Arm Morello System Development Platform uses Rainier CPUs.
>
> Add compatibility to Rainier.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

