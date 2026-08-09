Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBA2C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=; b=3Xi6OC3I6jwo/LSbz3eQXfQ6pU
	ufXxGWPVadRtNfd5z/Edqg96n4jN1KGzZzYjJzJZ+IDbd2SqhSiDOemBFjaHb3J/LSA9xhM1yao/1
	OBkeol3N1yRbGJFsrQYhE3Cg6e/ufuW/gv8e/0wSGJaznHaTtxVA3wlslkS/9JJEJXQRML5dA9mwz
	IGrhEL3FdnkvplznvPrfX05XLSh3NZxgiFfrWs/jgEkaQvd1nX0zcCA6Vls9yjvN44CkyWRBPGf4H
	BVT9IyraVBT8eg8PFsmLiCtxR8z/R2MnJZCuTqfBJImDuA2pkCWTF4cxQ507k1rubgJcyX4lpvACO
	UexLgnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8go-0000000AazL-2xYk;
	Sun, 09 Aug 2026 18:56:06 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8gm-0000000AayY-2YQi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 18:56:06 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c20755e8295so217143166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 11:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786301762; cv=none;
        d=google.com; s=arc-20260327;
        b=B/wdzq6zqW+2ITh48khPf9yAq1t+v+iox8ruBSAPcO4Ce2ANgVZroLMNHL89N5T6uv
         6a3noxvobj416qNjpg1g6FfuFNheYP0voR8x8RMZDnI99et11CE7Tlm4rfTGbacD/gYK
         qjp6+iA4KNQPTPjMRsRHHC1Y2/5adgM9IvF1F3t6/upMRn0RGs2KMDYeV7UUdVqne6KZ
         0cMr7fTYFPpfhSTOteUCmNUi4KFz2eNtmXW8O2eufvJRUFuPf0amC+O7c9GcD5AZQsdx
         aCd4dNU/7pO3OZ5P2w37BEwBFiSzm0551ypUPmq0EL8DgyDA325kOgukLSQzMb4SqDBy
         h+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        fh=MeaIiHnTtpm9Z7gpqdeiPv9ybhIAyb/c4WmW3Gj0CMM=;
        b=Y11JcB6FoCbunpxwTUC58A1tcn5ltbPLgeTHJOgxQnQRlI2EADb/vo+7U7TPFWQEzW
         Szs5Uix4Tf9hB5+F1FBDCYSfYfE0iHv67l5WVFTjKfwqjenzOGI8QIcCr0CZ1IbQU4ZI
         L0V3EF5IOMMksu1buIspAnMUo4zeasVb0u1kNG82ZTlVSph1Ra7GV9RxJ5VRz50BBbLK
         d+ZPwKTeA1PkQqlWg9IHNtftz5MWlQk9JbsBa8pevEyMPofnSfvagVMlxu4dDhSBjdCt
         p1Goj+yEYZCDXSdIV5cWu6Y02oZqcGoVXN0f6PWBPmyIUTRDnOOL+2gCiC+MMJR7ycG4
         Np5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301762; x=1786906562; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=nIv2hoVtQRBv1NLX9uE0lcT2z/6+toMkHsotDN1ktaDwus7XIVMsgNpI7YCeR2hMGm
         WlT6PlECDtyq/Jc2uFE7GNdPFs7uNHT1JI+adWwzdybgNDVtgQ2GAzvgzfUr4cHPoCtI
         Iqzk+TbULXACJP6nwIJuOZiwLz7c/Ei5jXSUrBnQ/s1feeUYMkvOnDtJc3M/oxmBUAO9
         xcxnl+5buKryHj2ZNbR8Yg24x6FRu08xE10moNRI0m9OnooZcViirVQhFkPfNLMm2Ksl
         u0vCOVBwCT8/bbfOOM/28y6uGg4E6vunUX3FIiaNcaqgRgR/lN/3qA/nCNnFUvubKS3R
         FrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301762; x=1786906562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fKfWVbm9KpeTwL3/mVwrfju84PrObkxu9nWfkWUyNGM=;
        b=TaQoVbwaHHvXeNf0rdw2CQgozqrSDS1ik7ZkFetWMh5N+KBfaEyH35lWazCH56t8l+
         ADQhSMzbH7d4Hx5D95hhKevL4qDo8KVVzWaFvSwLHBe/HNl1cl3pivQft6X7q63bxyg/
         rDk+4AWLnVCN7eNtJd7b1A/je0mClmo59lV93YPHnYeRww5DtDl/zHKO7wi1WFTPx9uW
         aoCG4HJmli7N8/Cpw70iB+VaFOo5SAfMpcwk+SDqAi3t1T3v1jGacBOhHC5v+LXxrhzh
         pm0wHfPmp2fR7TLUD1xqQgJc+u/I8HeAvV60VKAYuqjJq9dvP7T5wojstBYUnOnaS93J
         hl2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrhYMHcRh9gU0ZD17oScYneNjJMU2b1QQVdJk5L7zkJC7EByrToeFiZ24yyw6pKb1f8/SLPbtf4LEBYELcs62V9@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLLDwDBwPIKlCghwGOvX5p5dQHzYCCtQsX8rz471gxcVXCnyO
	MfQspRrjzYTzZh4b3aoj09NCJ3yNGr+ZCU15jUOiaRkwApN4RUDBw/8/Q96TWBQJUOfUKiWrjXY
	n+T9QuFVOKNAUnVMZ3UNv3M53U1xTMo0=
X-Gm-Gg: AR+sD127vZFyTAVNR78gD7Wsok/+pKsBbMxh/zTkR7MBQuzwGd2YiuGDDw+HWN2xDoF
	VRO5pyINhXhvxM2zp0SiAhnZpXAMVvqUbiqGQqXsEdOXazxV9/iIFO6dcdc2/1sGUuyOt4v0ko5
	mqPdKiI0umbNp+jstx6whljpmUV7U6Obcry14poIpALrhu3hZ1KHZ6F0iVBvk0jeuYTqh4PdGaq
	+sRgM2a67L4vZTpS4/chYRRqsK4NJQuUy6OEJgyBtx/C6iHbgRJ12gWhcqfaUHRZr0vQe2pvnvd
	cKxhdXVO/ztdesamq7yv2dTt5UYUFr8Uq7SdfgXwogdvVmFY9KU55t8fpeBuJliy/9KaVH+lmQt
	T50+FRnowMA==
X-Received: by 2002:a17:907:962a:b0:c12:b58c:fd7a with SMTP id
 a640c23a62f3a-c208d4b5c1bmr643267266b.9.1786301762159; Sun, 09 Aug 2026
 11:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-4-l.scorcia@gmail.com>
 <aniv5B4jz07mI70D@buffalo-ssd> <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
In-Reply-To: <0e4dfe8b-af67-4dcf-92fc-cd564d7c3744@roeck-us.net>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 9 Aug 2026 20:55:51 +0200
X-Gm-Features: AUfX_mw2G_pgmXXoJxjvv-8va564k6KXHRWKZyjeue4zkg_p1JWDElM0hRbQ6kQ
Message-ID: <CAORyz2+op80Tj1Ax1PD8wN9fAT5QfAev+vEPBgihvM0O-tWXPA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>, linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_115604_686860_0A5F8984 
X-CRM114-Status: GOOD (  17.11  )
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

Hi,
I added his Signed-off tag as he provided basically this same patch in
a separate series [1] slightly before this submission and I wanted to
acknowledge his work. As far as I understand, this attribution is
within the guidelines.

[1] https://lore.kernel.org/linux-mediatek/20260716161923.266315-8-akkun11.open@gmail.com/

Il giorno dom 9 ago 2026 alle ore 19:49 Guenter Roeck
<linux@roeck-us.net> ha scritto:
>
> On 8/9/26 10:04, Akari Tsuyukusa wrote:
> > On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> >> Enable the toprgu reset controller feature for the mt6589 SoC. This
> >> allows generating reset signals for the 12 subsystems managed by its
> >> top reset generation unit.
> >>
> >> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
> >>   1 file changed, 2 insertions(+)
> >
> > I provided "Acked-by", not "Signed-off-by"...
> > https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/
> >
> > PS: I am also fine with this patch carrying my Signed-off-by.
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> >
>
> That is completely inappropriate and unacceptable. You are not in the
> Sign-off chain.
>
> Guenter
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

