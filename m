Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD4C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=; b=vI11W+sUov6kQ8JIL+z5iJKHD2
	Mw1biMDyaMYIFTlfH18ultLJO5pE6kRb6dfmBmB9n55iPqY5G1Hf/dKuYai2Ac7ii1rL5CpbXY2q3
	8pVOyVaPaaS0+UCyVwfJxEOdHcJ2gEDJswO4JuxKmsdcanorVjZn01SGaTSnUdIKktoRTKegE82Qp
	eCKkquHu0qov33To/mIE1QujDVzPjZTmdSamK2Nh5K7HQ2wacsDEdY8i6x6eyrguBP0C7uKPFmzOW
	AHRpUvsqj0rlK1vmnSrEobOIhvAh8GeKHSQMD3xYcMdO9u7e9MKehLnFIfVREccJbIEwCgYZmkw7Z
	gJdxWA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt70V-0000000AWeM-2AJ4;
	Sun, 09 Aug 2026 17:08:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt70S-0000000AWdZ-3P3i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 17:08:18 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so964726a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786295294; cv=none;
        d=google.com; s=arc-20260327;
        b=Gt5YmRUqPVNl3yAc9710/ljdLNMFYi5EvlHYH5YGKumBCYm8F3ZUDGXjGveQHLAin9
         LhFRgGa7+iVJM+Vd4UEJriGkN01J6uze7/ofGRsN2X7TegaXw1t86+ZuFFQ+4Qk1dNvp
         kvI8NaXUEUt+fnGxDQeUiMR5fkt7WY9zUWwcZAGSsMSLK+WdU4RRNpQnLqYNB30zhv+i
         o7S7AdW2OBVb+99GbYy7TVnvb1t02agHCtLk852YXsvMc+uAVKXzpWtQqzfogGNKEWlF
         ZYFrpwIRq5ljQRdHxxZvYgkMHryOONCKYVGeIBcab0ztwImwFOKdBw4+AevlvWcf4G3v
         5Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        fh=I372Cs1rUSbEieNTWz0a07B9gqIhNkQ+uEYpnzsL5IE=;
        b=ODrl1C8ngq3c7LJzZX3eL+Fv+SRFslBnX4AvmvLnzBR+EbATEQXNsoElxHgc//+Lwh
         fgaycW6vZpBrRT92qvWbwUPzKbfDV5kZAD7XEUS3VJ/Pv3gSsSZ05VkPNX6VMSD6r1Na
         llQzILJL9ktBmT70CtMlKn22A8cYTb4MiCK38GEKcbL5NfHERGAO6484jHYsDmL6ptSZ
         fiYM0LxF750avuoPWzR78++ofGpE56G4vjcqoqw6/aUhIO4z8Iu2/sPHcIcAPdAhjjUb
         eLyeq0QbtYV/d/niBdE5S+q9rKN1Vy/45eVeaFjoO+cIB7KtO4G7TmRhQwmqiRVjQ5Zi
         /1pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295294; x=1786900094; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=kv0iVtakt3giXNd2jWnYyu3DkGnIM+gbd0mIsjAumdhJFYevQNKRZQ3ZjwqgHcu7oi
         ARfo1omPCYeIHwwbp5F+bnpcNME5kQLbx2sDEAHHIUChm/dVoqrcOEyxj8PSdDnQHNtV
         SOZNZxvzCTmVLa2ja3t5iihybHBo0anWQTqQNaRvQzhfKfcUnMYgZX+NbREJzgRIMyJw
         uTs5Jt2/UEv3xpkgTfUjFcuTQnJ3UFlH3qXRfKcqQpWL36f6wI3pw3XG8MiXw/M31JvA
         7n6kARkNdcJGtj9mZ2RhK39SwGJJlNArsqDNHg7m5Btq6dNDFHg1pZpd0JtgYBmGQzdr
         TWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295294; x=1786900094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8l7N5DEp4BhX7FXyEm1h5RGW0uDs9b178Mc0RCItNl4=;
        b=IekoAjqnzEHGHG9CkAtSz9rV49wR/1f9PHG1JCELnbKJxH+q4NzQorC5kTJYI/Xhdd
         FhHn3wB1fYrgjaU0xkZ+LVrWscfkQQWJeoAzeLTlZhR0uVebjeunaOeznSlL1M+8cNbo
         yjPYzU2/7wWyXJDarrKhTkZabPKCcc11+5KK8fycfCUqgh/dJzGnMCVoWMITKKd0QZX8
         9n8rz4bjCSbrwOndc2o0zdQ0eLshBB2Xw8yXn9EmVtqFGFMnyhzxEmBtPwoX+cVBMglp
         N7mNq+P6mGc/iWOgL4Ci+1XxesmpQVBHTEE3OGkE3dHNQJFAwg+KIaS4sByeeP+An61w
         rt4w==
X-Forwarded-Encrypted: i=1; AHgh+RqaGk4/uhcuDs6/aXkEMZeYr7nV07S7BJ/ridpyYwqKB+eFcjQZbhyJODgelYlnp2JHigMau105DKqPse8+1h7N@lists.infradead.org
X-Gm-Message-State: AOJu0YxubQPOvCTUxsbVQY8O1q59s66iMjjgAsaws6FA5sYn6Fw26/so
	FnAIlJQXwfojiPgKv9Uf+DUc+zz/CoTC4UGoyO81dWDhm4Ars4fx/j3C2D+lpO4Zku1r0Jgd7pf
	9FPufslb/aipkTkMZ3NOt4WEiToyUWMA=
X-Gm-Gg: AR+sD12Lw4GCcCo9T0UaaRShe3nu0U7FPVeTonA6LTRIFekQEbpcCGj2olPY5D2WNzn
	UBhDUq4+jfgxsyO/kdgBwLJdF+m1vx3eAwPsKTpVIlifCzR9m5JTUwWXOYU0LeGJ4PDwa3eXXJC
	AUYj1KvBE4AFV3/vD/0/MBlR4NWl6vHA74RdQxdZxrJcUXZYsTqg/lWqtWOr3KdS1aRJsrZfe6H
	/CfCLo2pGYXn/mbiy0fxETBIf6rO4UON0M1+b9Oa74PexBjgN1nGTD9r1B4MBLlrBubIYKLoykT
	dvChrwP82K8QFlyNzE49/09pN0HfLrHEoxCKffo4/G4RHU4d0aisUumcBnow8pQlfEoCTUQsoeE
	=
X-Received: by 2002:a05:6402:52cc:b0:69f:cb2f:7a9f with SMTP id
 4fb4d7f45d1cf-6a1f24a6398mr5908345a12.0.1786295294390; Sun, 09 Aug 2026
 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd>
In-Reply-To: <aniv5B4jz07mI70D@buffalo-ssd>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 19:08:02 +0200
X-Gm-Features: AUfX_myTNLmmUZQ4XLSt8EOVRxvsoxIzUMQsNPl9nlvxlnEuIvs9heC-YuaZVok
Message-ID: <CAORyz2KJMY6OvFQEB2GU0P7CkxothuXOCXgCcRvtiUhhPaK1ig@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_100816_892031_DE26D1A4 
X-CRM114-Status: GOOD (  16.10  )
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

I apologize for the mistake - if a new revision will be necessary I'll
correct it with the Acked-by tag.
Thank you!

Il giorno dom 9 ago 2026 alle ore 19:04 Akari Tsuyukusa
<akkun11.open@gmail.com> ha scritto:
>
> On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> > Enable the toprgu reset controller feature for the mt6589 SoC. This
> > allows generating reset signals for the 12 subsystems managed by its
> > top reset generation unit.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > ---
> >  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I provided "Acked-by", not "Signed-off-by"...
> https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
>
> PS: I am also fine with this patch carrying my Signed-off-by.
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> Best Regards,
> Akari



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

