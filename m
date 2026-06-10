Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC23CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=; b=rCzp+ZDyt+ujK666+/31pmpXPG
	l1j35SJSyGK80WzzNbuQZyhubrpTqnOiOASALspvk+nPeHzhY0xrAt4iZYuCaHdktpxza2GCk+KqL
	7jcwVJi2THTFZHwy5D5DhFO9NKZEiDbgGzt/tH/gp7LnHn4cQjv+w18Tjl1cx1jQg/NSa0fGnOIcI
	ydD4bGpd9nWmZ//v6v/gWiX5dgTjzGEnheSlNKFwXzZlHMgtC4fngY3aqWYNXXwIry7Qm2jQu41EY
	919NLHTAsldGp9QXwe7hD1rFaJ4HHyprM9EnETiRWSvksEM9h5WpsHKFA1JF1Rb/BNWKxxDIUbx0J
	9GRMStxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKfY-00000007zzT-24V6;
	Wed, 10 Jun 2026 15:16:40 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKfV-00000007zys-1uOK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:16:39 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-963a35acfaaso2658883241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781104596; cv=none;
        d=google.com; s=arc-20240605;
        b=ENOzSbyaB5k5XcF3/deoCvkmAktGy9D1DYqoZPhZnZxFOX7RmRtCdMbhLO84HZJPE3
         dZzRNPxre9uUETuprFZn5og04FxiMB+dpP0Za0Xub8V119n0pyzSZxL7d2qhm0xnE5E0
         3xSsRqgYsNDdkz3+/xCACAaemCI42agCAyfYGTuoF1WPvQd+kd8hzj3C7aKGzXKgAtBi
         69ByJ3U5C42gbQUDPgMTQNcjN74e199Ry953ePDLqiJBGT56EuhYr5DL/YNuUlrLPryA
         QxgA01Z0RxtxRmBly2m/LkQfO4UGIOBrsykX8UMXKYFGrcknGxW+/Qi80MLhauwNI2Ht
         n4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        fh=j5IA2DdhgQxBcZrInHTzcaVz+HyJRjAwauCFHO4jaUU=;
        b=fJQq9CT7vPvTijPnFEjIinZ9mcQMyiQ9YYIijzz+1TJN/ltVNpGyhzrKOLiTse99Pt
         8pg8YolXtERZJrwUyE/nkNPKwycUb5kwyFmphl4szBVRwGpmnuS2+8BQgug3LYkGpiOj
         +Wp30OnKzHTfJeza17XCqZxraB4EB74wzLDJAF4+2R9N66HwS31zNjLNgXDkfr1oeYq/
         2P3c+7CZ9iq020i0OuRcSN/TKflOR+tXE/kBQzDYAYlut1vDp/nGiH2BnlefiletuPq4
         AuEYGETIpskvfZyeulLcgkDGSPPTZ77D9a5mdCvXBsOY0T9Xe0aK89Vh715hig5hoJ6F
         Q2bA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781104596; x=1781709396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        b=KjynKpqYwU/+U3hrbDDgm6E7DctQU6r24KIEl+Hxi5SBvebua0fwn/vOQkl5btT6wc
         5UOtXrFJpIZHqcwfKAsv9wKzzFTqV9dlh6zw9LV/3N2fUbMW9+nd6eCXMjxsnPn+kUld
         tWnyRis7DUFmtXV4IQtoem6ajI7yOl5pGt/OpeznrtWv2KY7VYE5ZQA2ZJ4PIImkRhps
         PNS20GIkwLS3+mharHVyc4x1WRy9BJDaKI9kqpzf1NVEwnfvkdw9SuJDCgCAqG2xnQq1
         RvuyrchxtR7I30ddGbYp5ROM5sFIDBPrKfTmnfUHWNMl0Y3vTJh0FlkCWXTq/rGOAfRp
         bQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104596; x=1781709396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        b=cUc2+uzDr2m6DpkX8Hjz1PL/007V/iirkWakH0Q1L0s8VofwIrESZqiTbBUEJHlSIW
         kro49OdgWwHO4JG/axBda7g4jWxpYlMJIW1359AHswQ28u+3oGRZxEUDqrwsIZru+XZs
         perOsOpUvR12EIJFAKdAM88JBbh+PasRHNgo8WKMFzMeSYbOxdwM7CpZc8WKr5rTDvcu
         B1BVUMNcQG1+InKlaSeKnmd1kR9UAUvpqZANH9oa05yRhhVSZzilx6ZDObT9C6cFW8ZF
         /AATz0PdcvLcZS8RHFp46f/hHgB+oDWY7nh4n1p5B5n8DJEYTnjLofHSjwJ30cq7uu9N
         rV9Q==
X-Forwarded-Encrypted: i=1; AFNElJ83COCl2hDM0MomqrLhUrH2a9Er+GK1rwYMa+F6oAqCO443ma0RLDoYBb+ozLcFVzYRGu+UgJp9fNGb/WBTiwGS@lists.infradead.org
X-Gm-Message-State: AOJu0YweWydCMgy2gLXnDci/Lly6IvZWFde8dy/NUAhaHWnD0HckiydC
	26Y+j4SQlcHI2dGQog7JRkv19SWuKWEczlF0F1h9blffDyWChAAnHjcZ2X7jjWscDH2nZI4iNn+
	oqEQ7JPYf11MnQxcSg/12hHHFNkKX2NA=
X-Gm-Gg: Acq92OGxMwyyUTYjwKAIbWGq2PjTLu/G1nyzaTaa70gELOate20NmLpThbQbxU3xo0u
	rIdf66148XQNGDwBVU4Bkt+1uU86nbNJY4Y4+BFHhTe1gvOMkRD/dx+7YVep33BfbCqLKUBen2S
	2VC+eObt82Ci1AiFB2JCSCcvy/vgjEFAiq/hIRI0Cs1KX6ZwMD4hvXUVuhshCxm28qScikQTX9X
	fnargxrMZzERpl7HZ+7AC3mw453CcNUadBN/v+4F9h3Io8ANsV3/i/MsByQrU6HX3+ENm49j5qx
	iKUAzioPpBdMawJGvFVL
X-Received: by 2002:a05:6102:6447:b0:631:b834:e05f with SMTP id
 ada2fe7eead31-6ff0610caf4mr14199152137.11.1781104595646; Wed, 10 Jun 2026
 08:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
 <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
In-Reply-To: <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 10 Jun 2026 23:16:24 +0800
X-Gm-Features: AVVi8Cc7NRfVUhw9WT9jp6Y4XQLBetD1jrzFvFoN05U7Qh5wPj_DELWRqc2qZTs
Message-ID: <CAPBH0A-8VcJ7zDfKrhKn3ZhqdKxz2vt1umJShtHre4=H31pkcg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure devicetree
 for development-phase
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, Andy Chung <Andy.Chung@amd.com>, 
	Peter Shen <peter.shen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_081637_512854_245DD2EE 
X-CRM114-Status: GOOD (  23.63  )
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

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2026=E5=B9=B46=E6=9C=
=8810=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:04=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Tue, 2026-06-02 at 21:24 +0800, Colin Huang via B4 Relay wrote:
> > This series refactors the Anacapa BMC devicetree layout to better suppo=
rt
> > development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a pl=
atform
> > entrypoint.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> > Changes in v3:
> > - Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, =
making it incremental rather than standalone.
> > - Add the DVT devicetree, inheriting from the EVT2 devicetree.
> > - Enable MCTP and FRU support for the NIC.
> > - Align PDB fan GPIO numbering.
> > - Add an EEPROM device node for the NFC adaptor board.
> > - Add an additional EEPROM device node for the SCM.
> > - Add shunt resistor values for HSC monitors
> > - Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-d=
evicetree-v2-0-68f328671653@gmail.com
> >
>
> So just to check, the changes in patches 5-8 inclusive are applicable
> to all of EVT1, EVT2 and DVT (given the way you've structured the
> includes)?

Yes, these patch apply to all development phase.

>
> > Changes in v2:
> > - Fix dtbs_check fail.
> >   Validated by following command:
> >     make dt_binding_check DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa.dtb
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa-evt1.dtb
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa-evt2.dtb
> > - Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-d=
evicetree-v1-0-97b96367cac3@gmail.com
> >
> > ---
> > Andy Chung (1):
> >       ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
> >
> > Carl Lee (1):
> >       ARM: dts: aspeed: anacapa: Add eeprom device node for NFC adaptor=
 board
> >
> > Colin Huang (5):
> >       dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 DVT board
> >       ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper =
to it
> >       ARM: dts: aspeed: anacapa: add EVT2 devicetree inheriting EVT1
> >       ARM: dts: aspeed: anacapa: add DVT devicetree inheriting EVT2
> >       ARM: dts: aspeed: anacapa: add additional EEPROM node for SCM
>
> If you need to respin this series for some reason, can you please
> capitalise the first word of the short description (the bit after the
> last ':') for the commits above and the one below?
>

Got it.  Capitalise the first word.of the short description.

> >
> > Peter Shen (1):
> >       ARM: dts: aspeed: anacapa: evt2: add shunt resistor values for HS=
C monitors
> >
> > Rex Fu (1):
> >       ARM: dts: aspeed: anacapa: Align PDB fan GPIO numbering
> >
> >  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |  178 +++
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1179 ++++++++++++=
++++++++
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    |  228 ++++
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1077 +-----------=
------
> >  5 files changed, 1589 insertions(+), 1076 deletions(-)
> > ---
> > base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
> > change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
> >
> > Best regards,
>
> Andrew

