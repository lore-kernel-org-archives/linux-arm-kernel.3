Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B14CC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=; b=MVVZSsf9jpw7hrtW4NgfVQnNEt
	x5HwAdnUniVUL6vyNxUd7b/0Z+EhBjodcKDK4MrHANxZFrV0L9wAayWonot7PFED53IXMOIKQLNKx
	WNQuXAHAuAr7EqX9L68l+cGLTUZdTWoXYziTWjzDmKX3HH3cKASRDrrBklq6PUvPyAZ/4b2E4w5tO
	EGW+Yyn7VzZx2gFKSQFei1wLhpRq8/bpCGp5ZpVu1YLgOd20xQrNtGtUiUEedHdsWxDIdtCFlJYDG
	7qH0NAevgwYnsdP9deo/GUQcUSLieeaIsG5YFvgLHbXePld7FW8yGQ50sHk/YYPhvHJh/5zixAVQm
	3nQu5QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdt7-00000004Srb-26Cz;
	Thu, 27 Aug 2026 17:27:42 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdt3-00000004Sqh-2izg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:27:39 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3a1981228f8so933441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851655; cv=none;
        d=google.com; s=arc-20260327;
        b=g5/IoB9BlRHFRgnLUrfkcpvsIYPiHpRbUbzhOvZxPgkK8Djl8CN+j+G6IUe1J8uTt7
         P0ah8pbG5bf3TQHyhaFdazc3jCGVTTYBiq4STwILIxF9NhFVEvj5MNCaqZG2KHU2uKlC
         gZSHzF0AzmhNkNKvF90TW1Q38dRjoh/e9Jz99Q3SPnEeNoq1VJEwJYznVQDqT6zrxx2d
         3wSA5xHbg8d7bB9/VTRmFXBXFSdKEF5hSuq+sHq2z1JVXTfU5g2WSSniOPx1mvGqwRVX
         QTQW1X9LPsbArBLiBg8Zn7SKeICqFrkH7jrmsuuoC8nlhsn/tVyj9UGQs3xZs7fCitOR
         zFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        fh=+QSc0DX11TPo9+YMJ1rVChZIhEKkSX2rcw0Fze0xFp8=;
        b=HODCcCi+CSKYaXi7fSjuwHXA4k9dBBM6V8LjzvOTc9T8RIx32zxjCesKmni8dCE1bx
         FNee1pytfELloYEQTbzhTzfC2zx5mtw5MLrVlqq4bN0AiC7dCNY//7jnMicjNsQsItou
         lqHzVAaaD4m5yF5U2gQeMTkZIJ49c8ckNiLavNW3264tQBFBSjfQTpNjujkRyz1lyeWq
         7wEwu+OkNPjnZeC8l7ubuJCzUcvYFG/1mYkCtAxYSIN1l8pNyN9IXnDlDdcldD1Hr5Mt
         5RuEzkKUStEg9xNlS/OXqIReqr1wrhEDwZbFfxo7Ymwc8oiHyQyw29xMQQKAVsx7fNif
         zqRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851655; x=1788456455; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=b4r/dozQUS2ZyLJh4dx/XGm49PeMr+001u+DB0GWDkn+en3iXzHf5CHjV7Kzw/x1F2
         nztFRv6G0Cty/R++nBnc+8i/JePuCGZPCOeeMuHTcUu35MIq1H3NiOjldXSrb5xHj97Y
         J5hscFTY2MYX7I05pE+8QgGME4s1OhgvHwksC+OERxnk3fOe63mlCAx+RLAc9MLCDW4j
         wXOIy4sx82J5nn9q5EdBfT8JLkLP83uy+kp9Hekv8yvxL98P+aO+6kEvym4GDgnPzWk5
         GSR4yIP234YnHs0XmMnLpT6tNLxcFcMg0G3SRCDZfEcTgiBmG8T7XYYOMp/uwtI5c69U
         ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851655; x=1788456455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HvwT6T6j+NkHVCIiwJZYKviDkprWnij+Zd4dVGP5+4c=;
        b=cezJxIf8Km1L3QsmUjQvtxdNWwJSGzwOtNb6x6rFoFddr45BU/+HZAQ6wGvQRb2iZR
         cRe0GN2NJeltzdN2acfz4Z/F4CrBJYWgKsiVkbXbxtk+2kbFTk45COgcGksq+DUgzAAO
         weHIOzSwBV6tRTSuT5bJ1Uhw0qQ2hUqrUSK5w+zfKIFdLheUVxavARJYdtnDiN+xYZhZ
         SaLHgFX8M8DoHY0ke6jV7nlfRCXapbNnnlTKuUdSwpzCmKAFtLYbdcuiMIx0uVHAZx8b
         30BX/1MtVzJ9Rimo02TEID0bhMsedboGwFa759JPKmcm97TwvZQicxJyHyTPKaLslIqi
         5jpA==
X-Forwarded-Encrypted: i=1; AHgh+RrFlocPF3gVEtzOnTF9QOCxmnE2BqFf67yEj6w+C1UmgvXEK2jYOJrNZKT7BkOFHyfA9yiyKCKsRkeZyVJO1OZk@lists.infradead.org
X-Gm-Message-State: AFuF++mrpu+3dUJ+FUN92kyBC5cukJVgunH8ODDyWX9DjHZxyo78ydT8
	8bCAGbmbiyvrNJXBLQbbFxcOutQwZf9nnU5C6O2/Vf6/x2NFL3HPNYqmTXgtQGlXFW8goxjrwX1
	3hKDoxeATD6nI07yPIRpel/riIaUW0aU=
X-Gm-Gg: AR+sD13BGS4WFB+HQ6I6WPze8I66BMM/OwRBFjJrTv4J5BQU06Qe5sMIta8oGmEHyGn
	4ca3Ov0f27aT1xULpdmctoTnEzx372s87t/sRfjGzqvdO4cMWLu5uJYXXuKvwtZTm/WYTkT8M8a
	CHPbbC02HYzyH/pEy8KhK70YQhgxVXMSDUTQ3v1PwLcdYcCYhrQTLsvgQ8umq1aqNiz7vCglaqR
	Cf7gcEWWh/8Po0hheNoBwSzasXuiTArrE6RmA2gTB8F4DSVX4sTun0EEqFQ9cgLVOWVMRwee3XR
	G9xtdMJp5S6oXsM9m69OmBrwRJjB/PKG22+1v0/QS2bJLycnU5UdGHKAKZx9vjwjRLXm8pzWbeM
	uJxBIEOFChfRVB4N3W0pbt0G+rw==
X-Received: by 2002:a05:651c:43c7:10b0:3a1:980f:5905 with SMTP id
 38308e7fff4ca-3a30187d5eemr119801fa.3.1787851655217; Thu, 27 Aug 2026
 10:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260827130335.6606-1-gvalkov@gmail.com> <20260827130335.6606-2-gvalkov@gmail.com>
 <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
In-Reply-To: <fbde1932-5433-48e8-b352-bf27eb545149@kernel.org>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 20:27:23 +0300
X-Gm-Features: AcwNN1XMmtv8Tl2z9UfKPdkvBE_-gNrpL34xpH-g_gnIEgIMH3CQYCP7LMwA5gY
Message-ID: <CADOrJmY5jZvn8zEu-jCntGChXSY9wRd3bsOy1GB0EWNTY9GK6Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] wifi: mwifiex: add dt flag to avoid conflict with
 platform reg domain
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, francesco@dolcini.it, johannes.berg@intel.com, 
	kees@kernel.org, miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, 
	wenst@chromium.org, rafael.beims@toradex.com, avraham.stern@intel.com, 
	error27@gmail.com, s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_102738_647432_F74CEEBC 
X-CRM114-Status: GOOD (  22.47  )
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

On Thu, 27 Aug 2026 at 18:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/08/2026 15:03, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >
> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing phy0 from starting on any DFS channel. phy2 works.
> >
> > Add a device-tree flag, which allows affected devices, where the radio
> > conflicts with the platform to ignore the incorrect regulatory hint in
> > the ROM of the radio, so the platform regulatory domain can be used.
> > This does not allow the user to change the regulatory configuration of
> > any radio. It only allows phy0 to start and operate according to its
> > certified configuration.
> >
> > The change affects only platforms which explicitly define this flag, and
> > helps overcome the incorrect behaviour of proprietary radio firmware.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Tested-on: WRT3200ACM, OpenWrt
>
> OK, so this comment from v6 was not about binding, but this is still
> wrong - there is no such tag. Just make it a standard sentence.
>
> Do not introduce OpenWRT rules in to the upstream kernel.

Dropped the invalid tag. I hope this is suitable:
The change has been tested on OpenWrt and fixes the issue where
phy0 does not start on WRT3200ACM-EU when a DFS channel is used

I sent v8:
https://lore.kernel.org/linux-wireless/20260827171937.28878-1-gvalkov@gmail.com/T/#t

Greetings!
Georgi Valkov

