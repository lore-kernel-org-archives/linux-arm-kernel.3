Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30154C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=; b=cmQrQQkHRSJxwB89cI7L20+U/6
	vqvuUYu2HTsMV5o2R+Sd7G/siYozqUJYOVOVV6AGIZOA5NAjujB8BYC3KfN9H3QtCI3KpxXXtm0/S
	yb0sSFLeVVu0zwTnHAaLnShfg7zQfxpMkoTOzOhBuUTW6vu+v2gcE6rLJudKZG284R53WB6zCe9Zl
	bDqfMRtNsSi42TLTzzXZ02TmKA/Zo7IWS7jmx2GUomvpQkjubbRB2MUkGHqtqGj4aWIOGr3pzoVdR
	uANu43PdhQPYwzjBF+xmGHHTxEiiSgPN3Zt5zimnWGa0B2OayGGcPD0/IZnI3RLlN103iFbU/1vQJ
	EX0Pdq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Eh-00000001FgZ-1aAE;
	Sun, 26 Jul 2026 14:53:51 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Ef-00000001FfX-0zSh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:53:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-698af3e3620so237175a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 07:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785077627; cv=none;
        d=google.com; s=arc-20260327;
        b=fLtHjWAtOUnLqaR1GwDzR7F6nLeAXFZS3EK/Nkfgt7/eoRUoNHLfJjMJHJ3JdhzwgE
         jGqvcyXeB7NX1VKYpfIATwuFBmRd7ZdKcS2LLw0Do0xYpWW0su/qmm3V8t9iCyKYpLZ3
         YbTCogHgi91mmQRk9zKiTRdjkBRXSwygPJU4jWOEYePCO0LzAVBeDFERByvffQHrtox7
         KAlbWKMpjxU3WQGcfYxU/Q26zYuESN40UA9O90eIXAqLyvRrnNh9DR+yScqslHMWGxd5
         Tuw+8ov7QfMcwtdD0ydNerHW1P+efkgy3XNbMMnG1X/dMSX54gsLg2Ovtu6s1r4ICt8k
         VVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        fh=9bxqZHYMk2GrsbM4q5BcmWM6QbQQM0iy37C+wGV9iJ0=;
        b=rZWKlfdrB2KHnzqY1vJL0kaB7MSsrJUCxUOwZT4A5ZgeDVzLzJSH95ZVqDHsRz1aJl
         HTtG6Cgiv1d6lPA01G3eIRqUgf5xHBBYhq0/RZfgdnHt2pt05DhQPKm53EczT6e6/RdJ
         +1RtPr+h9q64SxyMgoTh5+OJ+0FkuU/pz8GyA+xjdYyQ0AXOMHqoqdILtOEeSeg8+ESR
         XghkqM89g90bl28DIUR5Ssc8lIBbe2OiJJYn7qMCbd4aIqLjP5U64VV2eQySOBwh+NUA
         3Rn4FDtU+EX6TuRR2iGazn4A9D/3Hb3or0RWYnTgNLcOYtaoh8bn56MXKBP93mbXp7ea
         55OA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785077627; x=1785682427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        b=Ekd3CS3hKKyJSi/gx27tXl36itQsZdnczVRHm9k+CvbtHLfuoutQC+G2czA4/0whV/
         +HDoJYryuyTueyCaFwRi4nypNTYY79vp3bCmb1KLdVFJJaUluW442FEO/47cNhCUqISk
         IHKiSeUnocF3yN3JdTSht1IbPbbdT91sB45IaPzm148SkKwJfDGmgAi6EJu9ejwPgsnK
         kGfI3eoNsF+6xLg+l/u2qDGDscVrffDxPmyaCP6ApkdiP5hv2VYmbkxs4bNYXZ0mANNJ
         OsbQbL09BclVrM0Y1kkl6v/QFsMKV02SPqmSEqYyptO9znXjzwv73cm0tBt6mZnJFzDB
         apAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785077627; x=1785682427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xy1dPJ6HKi7tYjJxDc2Ha4OJQEIkMNVF9gLqcXcYzos=;
        b=h5uFJKqCQGue4sw9uUrfBTnr2sHSLM/fJOdwgpB53+GM7EMvPYrpZ1mQz97mKw3bQz
         mfMwTMip2DhO8D7ARWCusjsWsodDf6OGWPFVK5hm88zKKlzsHEMCh+4aa/hhyPg87FY7
         hJv3I5TDWDXS+nE5GS5VieNc5kMlDSGZlmKOPqqepuxvBELBcWbwWw9ZArxIWvworoRW
         sfCSgETAParQQ0TemrAP33Vas0tEr73gQyHZywU7AI1csbUFuYAX1nFpMbmDSMshvXnb
         XpVcXeqYSIPCMOb0vOKHJOGvZgHMcGVpZ4Dbn5hkJeEw7YsN7Mp8Wc/AasaQGZAmuvXT
         Jk2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoFIQXQzoZUzXmPU9PAr5+S0kJtAc21EYjmu6CwNYa0jXIPfwqEl6eBjZAnI+rNU5N/1znMobT8nCd/yDMUOhDh@lists.infradead.org
X-Gm-Message-State: AOJu0YzsjvGul+HnIigLzQIzHsivXXM2kR4BZ5SVwJD/lueFWkvYNEjB
	PwGIvqYqxn1mWHWzptCrqLU7jJghncdT1AnaYPs+xOuKDIyHYhZn0yj9Qea9L+lFVVPiYvfxt7s
	vF/0h1jvIVZhVnGUGC+e3mUDr2X/E9yQ=
X-Gm-Gg: AR+sD12sZp/5r/AOh0nbv8r3oZhKMw+RBQd6yV5dJnqGfNzUuRl9IFtV2RSIaVQEMVA
	Qk6RNcHDSV7hh0RNPQGysGaAsSOUGRabFGxxXcsiIRJD1ziU6tPeXt+uOwls8KVyJISuSr6YDV6
	/YMnJjLjgFQc/6T1+0TWYWUV2HB3wYWdl7J9BbbHDT9VyLWJD2rF1JKbkiVjlk41M+5YkMb3xmT
	G57/A82+muG1BSdMO19igdzBo8b4rO+au+eI/olWGyXCRPPKwl6HmWKOac6lQ==
X-Received: by 2002:a05:6402:450e:b0:69e:1246:a86a with SMTP id
 4fb4d7f45d1cf-69fc0f3e1bfmr2140114a12.0.1785077626864; Sun, 26 Jul 2026
 07:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com> <20260724-incredible-colorful-trogon-9df033@quoll>
In-Reply-To: <20260724-incredible-colorful-trogon-9df033@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Sun, 26 Jul 2026 22:54:21 +0800
X-Gm-Features: AUfX_myy7YsobI1pf_jlBSXk7SDYrWERjtETFkIdeKdn3VY9LKRwt38o3X4kakY
Message-ID: <CAPwA33JUWPoWokeTFmP9RR5AzBqy2v7cEA8NUNr1-eUKyaaKYA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: support
 per-direction phys
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_075349_291977_864A6BE5 
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

Hi Krzysztof,

Thanks for the review.

> Filename must follow compatible or binding filename, so this is
> rockchip,rk3588-mipi-dcphy.h for example.

Will rename it to rockchip,rk3588-mipi-dcphy.h in v2.

Thanks,
Jason

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, Jul 21, 2026 at 06:35:19PM +0800, Jason Yang wrote:
> >    clocks:
> >      maxItems: 2
> > @@ -82,6 +92,6 @@ examples:
> >                   <&cru SRST_S_MIPI_DCPHY0>;
> >          reset-names =3D "m_phy", "apb", "grf", "s_phy";
> >          rockchip,grf =3D <&mipidcphy0_grf>;
> > -        #phy-cells =3D <1>;
> > +        #phy-cells =3D <2>;
> >        };
> >      };
> > diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/inc=
lude/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
> > new file mode 100644
> > index 000000000000..60f6630f58b3
> > --- /dev/null
> > +++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
>
> Filename must follow compatible or binding filename, so this is
> rockchip,rk3588-mipi-dcphy.h for example.
>
> Best regards,
> Krzysztof
>

