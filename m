Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84484C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=; b=Eh9SJDkcdHzdySn0UTwLoGg4pH
	7CFOzqZ0LXWAVEu7EThyeRJ/4GuGyqOPYYfdjk7cWKMAcBaM9h7pov7+1wsMNfxa+AHlMi1o5EawQ
	Ryt0FRyiNc8BzdPYyVo6D9jXn6C9aHgHUsE8kIHanyNYKAvy3Xi2r3xzhstvVFHR4hld80xWSBTEB
	VifqmxwL5e0Y30hXxshxtlrA117a7kjM51J1fCHEAGheueRF8GsPsIh4n42IWzdRVaeSwUtjjPA4G
	I0PRc7c8RCE4mUkzl+7VzhWI3F6YKwuSgc6GIbqkKKKpn8GUOCQwWmmSwAeMv1eecNHnoUFaB0bTH
	btyMgrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5hw-00000003Jij-20tB;
	Thu, 02 Jul 2026 00:55:12 +0000
Received: from mail-qv2-x01.google.com ([2607:f8b0:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5hu-00000003JiE-0kNM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:55:11 +0000
Received: by mail-qv2-x01.google.com with SMTP id 6a1803df08f44-8f0f56c2dc9so2523516d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 17:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782953708; cv=none;
        d=google.com; s=arc-20260327;
        b=AQBcB9Y1QelP27/8fef4oxumT/cP+4G8mtKjpvpvf15GccvoetkkwlYezEeZuCtCpq
         YvP91943UiIlAKqGG1KtcpWCekZdeXaTPdxApPtJ6748Qx8njKltHgaySUQskop/hOdi
         Vp1gVZG590VAMxZ/jx+fTrFpNj/fay6Dtj6BygOLPEdD2yDF2u6qDK86FrWH/+knbsL6
         Tmmol+eWw4qzULqaO9sxeXvPzMwjZ6syaojGrYbJE7chNcfycY7+rkLZgE1cx2ISHn1t
         rtl6LIlfuzLmEla1Q0Lnm4xgcnEuWIEeuDb2cWQwWduAB66YCm3eJ0VJyMKCOoeIScoo
         30gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        fh=1HEoYVEKA3/4GwbvrYTnPadyX3tWB4S4oJHb1j/Y6ig=;
        b=kZiAjS8V2XkLr3O5JrfCjcZKIv170ZSLHOVZJVhNziBlAlQj3VlUeinDmNqFnObJsr
         J0EUTvpZEI5YJ131d3JWtRsRuYhpwYCf4ucDBN8+8ILl58StehJm/6InEt8bXM1MOF0k
         8o13Dv205zIQLfgQ+DutDHUPZS63h/lk1Hzt3nTYzq00LtFDBMTnCYBYX91tN8Q9LRrk
         3qY5pZG3O/W7IIoeWP1MiST4kFPw0wT/zB/N82h2UHP0uUffNnon5uLR5P9Ywvrj39lI
         iDgJaPt/ZxCKfT7XCYcDH9yLLpcbfBWFH8f+rHHL+XpOpXmRijJiKFQCTStsyVTeUXPm
         S1tQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782953708; x=1783558508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        b=SB8PdE1B+tJ1vIjhIQDHoOa9XAZcPpBZvPR9LoYyDZqUqmkTkRPcXGfeY8os+wxnE+
         PvkY07mE3p0DGoSxcM/6/evd/VBEuWvMO58BC5/my/ndSocPMZkyf2CXyw9K6b+VXFSw
         eWcxQA3kzJrCxF3QxO/NSeHcrauWtD7MMorho4xxhCPaCybdlOCUo9lDWQBMrsq92rKK
         1o+GTBRqQaqeTjrlN3+3MswB0D48IAyIpTCFM+K6FPHoH/pO9gpeL7sN19hEnsVnPKTk
         jq/Gi9AIZOSql/x7vDwZfZyv2iUjcElsVNQEFfMc2B29u4iPb7B+M9VQb5WCeUtNlYjs
         08+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953708; x=1783558508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYYg+pEkCTZu2/BFkr8J5mfv2eARpE2SiRa74Iaa9Jo=;
        b=s0yMtbAndRKSyL/KnwxiMbKgHdbvc4UQskCvItcr1pt/5uy0zX5OOCh3dy4gwTPFCS
         6xCGWDShtCA4N4RtWy1pwHQeLwnJiTvI7Z2vVuedJzo04rx+4oC0tP7hsImaFT9x1p29
         2gYYS5e3IgS9Q2VY3M6ojg9HtmgG7QtVDe9rJxLLhP0kFycHlQWbYOqo7xxGFfragL18
         d7u8SMjl9PWOewAN87+bRw411Ia1Bc8No213fmemXJ7HKK4bj6XDRfUygxt1Dzyoac5t
         Baqifhv4pXMoslpQNCDFSqiDukkfGQzJfYaGoel5CYyq3m1749oC/FIqDp0Szf1iAprd
         erxQ==
X-Gm-Message-State: AOJu0YzKdcP60KKOHlQ99aq+KN2dOW1T3meWYH26IfBDNDOqEmxT0X8s
	ZMX5cChwKzYd5kElMh+fzmCd0z8hQjGn2YVpdnd858Txr5AeuDNFBacfJZyCiTezoQ6xDb+kKDP
	0+46Q1QD6IcFKHK65Rl6i8oYllrPEljY=
X-Gm-Gg: AfdE7clggXRC7SHxPEqvzCHoiaCtmzZCYVcYVFDIlHd9wTPibFgJl6X8xn60UOZEGMR
	LmphgXc2plHDk11Rwz9A1+sGOmHCxDO3IYx0Q7ds44PPaeb5znoH7KMjupMnLvaP59C2PDrTsfM
	U9L6StJ0nSXXfNoA7bU6d8b9ONyRHqZc7R6n+uPlETG4aWCKdXLVmRuBxT6QoOrZi7kdXv8zf47
	Ua5UU1qAYMidGDQKyxW6gfRWlp+Pm1IlGxPZO5c4h9mrxsANQSvCC1a6h3Jw9cmvby/xBHoVwdV
	wJmpuHYTknO2ZOKNNvJ8IH9XZT+HUkD3Hxws1iBNvM6M0bFzdriLfTg0ZA==
X-Received: by 2002:a05:6214:45:b0:8ef:1dc9:27e8 with SMTP id
 6a1803df08f44-8f3c99bfbb0mr36043326d6.49.1782953708551; Wed, 01 Jul 2026
 17:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-8-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-8-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 17:54:57 -0700
X-Gm-Features: AVVi8CcSOzhFzPsWUOEG7lSD3yFIyfxu2K16jG_kbQtZEf0p-TG6IrXn3i7gVuw
Message-ID: <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_175510_270227_68D3CEB7 
X-CRM114-Status: GOOD (  12.49  )
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

Hi, Arnd,

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> This configuration option is for the older boot method that preceeded
> ATAGS. This was scheduled for removal back in 2001, but the removal
> never happened, presumably because nobody cared enough to actually do it,
> not because there are any users left.

Only netwinder_defconfig selects this option. Do the most recent
NetWinder firmware versions actually need it? (LinusW, do you know
this?) If not, can't we just drop it entirely?

Ethan

