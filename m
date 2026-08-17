Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E941C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=; b=mJV4KWxAMihzhZKxn3KOJ7ovzQ
	m4JRjLqHXbgfyZnRZ4HNrl2FS19amNiECZPKJUH/GLYgXLC2UdW2CrQHmHILQSCkQ19Rw9ggFuoOt
	wKGWHa8O9GOFrbmk2hV8hAz9zBEhTmqxGdqgy88N/A6QYwaOEFQccTpwNsyGObafGgCaGcdDPBN6I
	s5YY1o6Cpjccl+1EHV0o/g8htorMxwjZFRj2XfNEOzWLjVID2cdE9spdnxks9y0UcLdqnkLT0hjTx
	TuUjld3AinAg/g1UruFhu2ZmpcoNxXbsx8A/bgqWundT27/gyKrSvE1nQgkfuZGUhzo2TFJ6AB2Vw
	AiixVDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuon-00000005xBe-102G;
	Mon, 17 Aug 2026 10:43:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuol-00000005xAt-0cRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:43:48 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so26062811fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 03:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786963424; cv=none;
        d=google.com; s=arc-20260327;
        b=RUJAuNCxTs4VsNL43XjOty206XERyLyHTobr2y/YvZFt2uC85Wz5GK1gefqadC3uiW
         ulVNfGpkxzB2Q5tH1eG6UDCKWSeAAzkm0qH96b8o3P0dv7BdJxhYTPKWZbYkuIcY7iB/
         qAM3S8wXlZ21Gpz+msvQrEkbcDy60BeRnkytPeja6ufvkhOluDs+UQUloM0kPY5iMi0M
         VPgyzQ/PQfPqHwL19AQmPzQ/X4e4afadmvk0HYbB2/R+6BM7fw4Dju2tdcN16V+8elYq
         kutFqf7XuNlA2C99mSQI9dEetqvesnNPAkiU1N2YV/s5DUGV6/eKtuQvJvT7jMLQp+sR
         XCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        fh=HmnqIYlTMDyiD9yP/FTc422jTH3q9BHb44cWE5h5Ouc=;
        b=XyH/oBSDGV8qi9z14PAjO2kmIkxo6+n1LfNIw9+b2ZtEspQx7VwpzWHnDfhH7L6Sr2
         pUoa0aAumOA3cRbMZQAXtT4oEdPbaMBmpRsNZ9hivC/Vhqs6VisioXPYReFscReoYGNa
         EGc3QpYe9B6617BVqAy2d7b/FG3L1IBC/OIQ8gqgFijTB2m8eKriy6xDh6kZwYzLG73V
         ukyZZccJzj9dI82i1UA+8DbzwGjvB8FLKPwAUHM4RptoYLUTLLJ8Ds17PSYPcE8uCKfX
         SeCKfzgt50SAhi6hgOcwDf2hLK0CdKcNlTbfUdihABKiyEqd7L5D4gGVHrzdsAagMbsQ
         eSUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963424; x=1787568224; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        b=d38kKNc0VAuTr+V/V7V5cHFXmtEeuoj0RkfGUXNjvPI8jq2SWgs8veUIoaR/x9Xzn8
         Jr0jgeWLwRYY0hgtbD4eBrseEPTzBZUobJ7EPp6Rj+XxjGWVTYb32WbmfTV25XYl2nfV
         DSv1vrU7JTfP073VIH4RhGK/XjOAiD7yujQ488G1LpqIoCVuLpggggajOtR4mms8EW5H
         tQjYheQorRIYdeyIdMzh/4ZXDq/VVzbsyq2wqvMg/qMp0XaxgQQPzRh0NmYvfIFyHuPG
         iQMB6Rf/M5rQuviszHCRECb4rRhGt78wRxP4k3EfxJCFxNBfJsLxKyuGbFGT88aMXsx6
         sfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963424; x=1787568224;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfXrwhUEdtSGObkxJ4yfvMMbCGkxVNdt2ypMc+rYzxU=;
        b=WoTNhgtTGjj6aZy4p0mKAeo4W7ICUsRwerEsNsJJeBTDxUXl6x5b1s14eOeXktJv4g
         ZcEbhK92mpjZgtA9h+oJWswRFpROJ8eAJMXm7Z/yI1SzooREjMnFQPgex2bxs5ZI6Rex
         EEz1/3qyuuLe48J7Wulaf9Vkikna9IAJS/NG2GFwFehhr/vmfYKYQr3A2fSqTWIlqAtw
         Vhh763MaQ4UGaj92upzM+e6vfBI1mwiaOna9OVQULFwq5I6pzIzSKx5kUvqxgplgQYuO
         GYmWKgpv/gw+/lT4p9aTbOeUs5VNAijX/lyRMjDMoLiOazIaaiAIMZjgYgy/HexBU0dU
         A7tg==
X-Forwarded-Encrypted: i=1; AHgh+RoQ4ELRUq443RyHluDSm5J3Y1aujdamQSlo01AHVyiuVTSbKqUUn6v/mADmv6MnlUm7Ic7BTYZkYiCwn9DWtWsw@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkiTWRAJJea/le0gkj3NMMyab8K/utPicB0tG26IPbxw4KwhV
	dsWb30zd2rZgxWaG9FwNf7IZC6rEYSP+k2+u8+m/u27Ym9/IQfZXykUmNNzFiFhfKc3l2EpW4GJ
	R4SGA0dF70nIYgbiwYlYIX4lOL6UWyIU=
X-Gm-Gg: AR+sD127usSErWE1Srml3AUz2QPDeKHFfMY/dv1Vk345ixZ28+bN0wMbxUPVTD5V1nk
	KmlgBgYSBZ3/5NrkjFVaAiPrc3PNSJOAkql3bXHX+0kJLXvIXkLtgKWQpkct5rysAaaJng0P7hZ
	h/NGf9YhqopUUeFctx2JLTkLpyvh0/5vwbTtCCZMjc4wQ1IxCQgrN7DlGXKUjumBTsKI6NxUE9k
	Jtdp/g44rM3cX0a774NyAuiFRXdrE3ikWR8kcXzrsJ2DS9hdw7kR2AXtNZi2yCukawW/YUNZtZc
	P4u4BqdBTkO4pGhPDxmYymltB6eH4aY4q/Ym8BflpmDGplIkj9a4ceTWxpWg4G0x8zPhip335Ew
	QhiSgyhqOHFhDV/ONuoV4aV9U
X-Received: by 2002:a05:6512:b94:b0:5b2:a1fe:5e86 with SMTP id
 2adb3069b0e04-5b459139605mr3519047e87.1.1786963424020; Mon, 17 Aug 2026
 03:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <anoYr9H4KojJv-aZ@google.com> <20260814125025.90522-1-gvalkov@gmail.com>
 <20260817-hairy-serval-of-refinement-49039a@quoll>
In-Reply-To: <20260817-hairy-serval-of-refinement-49039a@quoll>
From: George Valkov <gvalkov@gmail.com>
Date: Mon, 17 Aug 2026 13:43:32 +0300
X-Gm-Features: AcwNN1Wb4hk7Y6VXWg-VU6GgBLtF3C0paYqmgk3rIoJzQ18A47YrPXh_NP66Nso
Message-ID: <CADOrJmb3uJPpYR481rB-CnL0A9B_5PQ683XP+Gdis47uihqMBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: wireless: add flag marvell,ignore-regulatory-hint
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	francesco@dolcini.it, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, chunfan.chen@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034347_221158_7A2645D7 
X-CRM114-Status: GOOD (  26.81  )
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

On Mon, 17 Aug 2026 at 11:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 14, 2026 at 03:50:23PM +0300, Georgi Valkov wrote:
> > WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> > from the mwifiex ROM, which conflicts with the platform regulatory
> > configuration on units sold outside the US market. For example:
> > - phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> > - phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> > - phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
>
> v1 as reply to v3 in big thread. How tools can parse that?

Hello Krzysztof,
I apologise, I forgot to add the v4 tag to the subject.
I have documented the changes between each revision.
I saw my mistake after sending the mail. But I wasn't sure
what to do? I will make sure to add v5 to my next revision.

> Does b4 diff work?
>
> b4 diff '20260814125025.90522-1-gvalkov@gmail.com'

What is b4?


> > When the system boots, it detects a conflict between the user selected
> > region and the radios, e.g. BG FR US, and applies extreme restrictions,
> > preventing use of 5 GHz and DFS channels. This also affects phy0.
> >
> > Add a device-tree flag, which allows affected platforms to ignore
> > an incorrect regulatory hint from ROM, so userspace can set the
> > correct platform regulatory domain.
> >
> > [1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> > [2] https://github.com/openwrt/openwrt/issues/9956
> >
> > Tested-on: WRT3200ACM, OpenWrt
>
> Not a valid tag, drop.

I believe the tag is helpful because it describes that my changes
have been tested on a certain device and platform. It's a common
practice in OpenWrt contributions. My last two accepted patches
have this tag. Should I still remove it?


> And you cannot even do that, otherwise explain me
> how did your device execute THIS (exactly THIS) code?

I am not used to your terminology and this gets me completely confused.
You have not quoted any particular code change, so I'm not sure what
you are referring to. Here is a summary of the patch series:

Patch 1 documents a new flag: marvell,ignore-regulatory-hint.
Patch 2 adds a device-tree node with the radio and the flag.
Patch 3 skips the regulatory_hint() call when the flag is set.

> > Cc: stable@vger.kernel.org
>
> Drop, what is the bug being fixed here?

Without these patch series:
- all 5 GHz radios are unusable and DFS channels do not work

With the fix applied:
- all 5 GHz radios work correctly, the platform is allowed to use
  the correct regulatory domain for which the device is certified

So this is indeed a bug fix and a very important one too.
I thought the commit description and forum links make this clear enough.
I can send more links if you wish, or just search: WRT3200ACM DFS.
There are endless conversations and many people looking for a fix.

> Anyway, property looks like SW choice. You must describe hardware
> instead.

I am sorry, I do not understand what you want me to do?
Can you please send a diff or a clear description suitable for people
who have way less experience than you?

Georgi Valkov

