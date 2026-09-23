Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB3BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=; b=KauHvIfh/td8C6cmdo7sCdx8zO
	XZbL9ymNsCH0Fky7j8zVGvYq5TYGqzDfCeyuN2FgNC30cGypTR/K5FcdDqRY+hPyxEpq8HFUZ1HUp
	XjE/Sn4zOiFDhsk3Y7KIYj49NqrmXq/gguJxemq5KGbecWU2kk1Zf06yvpf5YfMwElN1YDg7zLopO
	xKhZH0/k9WwqTNa6wnHtwVSSVSQRmmA54gJT/8mo4KZh2X+TNyTx/lTjIGmxtEp5A6J+jvDc7SrHo
	XASKlKQ6Eqle71mTCQ9xa8UpyBB7HF7xooaNC/2DYBYRFuOzszp+QVcE1/dAyLZGCEPJkQ6dOcvtQ
	K6W3KohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IOe-00000007XGT-06xt;
	Wed, 23 Sep 2026 08:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IOc-00000007XFM-1TI6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=; b=Ck/ld4nsHYcckA/WDk8QIDn3DU
	8n/C+2+1+0/+4agprgTITTbTFyADvXD/Ts59NwiKEiaQQ70M55CafNK2AWVitXDy0BveyW/9BqD7d
	/EuURfL0YhT1E2KvzbYx6ZhPqv7+42u6Vg+YEzgd56dwou6lepcIiNQmwEzS4M4dkdOOgmUJOFXun
	VQ2U2slfMt9D0+TOqyxn8V4iQmn2+wNL0Hlo4GEuknMC+t0nm4DBypYTNy18Twzge8+by9NV5rkzm
	TlLV7kELLFD2EdvkFDtRMFpKWcZtoZHi5UOfA5VS0anFf43PAux1yniMu4NHV7T/Xa7/9YsjgeOMx
	Q7OZFMmg==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9IOY-0000000EWqM-47lE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:32:05 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso5343626d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=DJszzAJ+gSScmtjZLeqoWsogneSGgQP2Rqj6BLADyZzXS+OcWuD4oHa67HJh2YI3ir
         YvFumVKhi8LtT2y/xPaJUs7nmDunaCx0+OSXTY6w5VOBjzE0kXZNhgMiP9DT9FiE4Yr9
         cMLNPINeGy0xKxFo4MxvlSE/Y7FQZcUTQBXUB2KKMdXhVuFQTBXv52AnWrbCqrCLvGuC
         ZPxXgtgHdVvXTy7RtYpPwHT0sobZXkczPAir3BrhUga15HqnbAQ7dfVUF1SnQrjBppeF
         ZwWaUjOvF52zAAUM2ArS/LwAJ667IE+jdj93W/yY7yN2itxFyNgxiIN4wG5VqU83sNkS
         9irQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=vRHiDu+FZk4QEvi4/CUEJM6POvPmVJJl6jeuj+uamwU=;
        b=HiozmNCJC07T3bpkLEMavWhg204y1rJ9JxEo4QNWmppTkXXkm9NAIa1bvnApBbXPlL
         BPjUk8brq71rSLkIlHRhxFyB5w+yviwOsQBdx7vTNRW1nJnXz9R9OvgAXOr3tjtFrUZ+
         5yhp46dgIU0gHZV0ug12gQm/LEiefeKHfx1997Mb7rWSBiSfJ1j5q5Vp3ifPm3Hwh6kE
         Y4VcDGcB0sefw/vlMdo+TEGKB6Zzk0Tvrbpaytc7gE/PwbuRairXhJuxEdrZ7Os8fZIv
         FXvABEEJ35zVy/xa9I9IE96ajBoO3BUpynCdP5QDCfDWC+5K1jCi6jlRMkR8w59aAHR2
         Cwgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=NqWt8RxW06nXG1ZVVVsVdVsi+9wp5z9m5jQ1OAqTTkQQag4pv3B/7Fgppx+xbfm7lX
         IXG4ZXUpfXI0RSXchlcjuFWW4SAlxoLRauSbmnbsqU3p/VrycFn5kAUpDyNfRfUqHZX3
         BE2a5aAKdNrzDcMJroxox1H3XKNsnj8GFSxOYZ5F2o04cSlG3D3CsuypWz4Q4GRVz9Py
         oWXCNrD2ThLeClh/OCaE9Ie5ctQYGBcRDM8OkuHDHr0IC8By0noHFmeslMkBTraCxHhX
         WXeEl3iv0Cc78JuWffqmWs7YmQW5Y9U1pIwU8YkdarqMNRjVzONEDtDp/O/eZdTVP9fV
         Z0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=01KnaoMy3+s1pMPNxNPYeooC8ssPKsvFLdKH0oYFO78HQxxk2AIbiXs5u+SBUY3Obt
         TIW9q58vYYOHJIheBOjz9stP0mjQ6pOtlAQhS5/7ThlZPhN6lMpTfqp/noPlVRRBIKTH
         cQdEsLtpedfGUzhYN4lZ3BLqytSzV3vdJ04Q4RcPsv/JqEXyqnbVKd0fxsvVVwXiVwyx
         nXsHEvnTthW0S0teffg8TU2UOf9XLoUzK8rZihrWWOOq+WPqKOz68jJxJuk+zUtPG/3g
         Gz7WAJr5soWYoK0wHIBGWHBlz5fvAbkTE8fkETBvAcTrtvzeIjqfaxst1bMmdlfli/VA
         joDA==
X-Forwarded-Encrypted: i=1; AKwUvBwvqBRwg3kmkrauaF+ZvcL44Dlk60Uu9pcn3w3gwCogIJz+jHQGHuY5a62WMtB5OXEIhD1afWubLsxutWnaRnyi@lists.infradead.org
X-Gm-Message-State: AFuF++lWpQ+S3QMQ852cMNzsHAIxaLGyj111F5r3mDQjJYAl1M5YDHsw
	AT+WJbkosAANG56KFr0twm2lF4L0HLcH2NDlYPsrcqamA29psEJd9ppN6qMihCSFT0pmY2CYUOD
	17mW2QFJ7dB0XuiUAfB7HDAZa/1mHD/Y=
X-Gm-Gg: AYBFou2H87r1pIXJiog1LkoFii7517PZKX8G8qU22EJkj9iJkU/nUP5gcZu3XuYsTh5
	5g5QL66Cx3EJXm7vP9QAu16wJ5ScmGXFt2qeUvzC0KTNulmQExUSLYkSEUevFQvasacHkX/NVTZ
	2BBgiiuSF1S+LQJ08zVfKV1DpzqUvYcVVnKb1gp02R6pt7ljLXKykVVQ3ehheYHT91v5uYE8zSp
	kpKrBZXq/1/7MwNvjTQp2KPwtbzUjsd/ekmOyIbJWVyPW/icqIWsCkuMI2FbRLmJYBwuavotnoD
	2C0A1GSENlhD3mQEVfKhjvOtoCb82stpLEaphOcJXVMf6jMYEt96X9+kPeQr15Du
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_093203_490890_785D9686 
X-CRM114-Status: GOOD (  22.54  )
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

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.

