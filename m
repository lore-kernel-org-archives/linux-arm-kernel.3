Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BC7CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbssRci/vHGmHOd8+cbdEKN3kF4NLOmkPHSLIdISFlM=; b=vPr4yTkYgKW6/NQgI2T+LBiYQ6
	zGeCB+sZn8Ecx1DUvf+XF/Yc5QlV5koLAQ2Eet/wgGNIjSKWiwslKYFkLqtgO3xJyTJKc8xOMiP0F
	gQyioGGLmTJgze7DFw4hqks8UIOmrWnGAM0DKE0+VzpOZ/KmboHxoxxxR89WlonnoL4gi5TiW/M+H
	qnMkrBrXp84DbLBladqX21vFmmVvkppDVGCSSw1KMjajSKGvIDHlEbgJDEEp7m27Wehf0ve7qn0GV
	nsVmSa/YRKr6F1HxKdaM1OZWs7z/5/m8gcsbGzWjH9fpcpWRPmLPUE1wtgqehfBoHZRA1LFYTEPfG
	KowE81Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEATv-00000002KEY-1X6J;
	Wed, 29 Oct 2025 18:01:11 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEATs-00000002KDc-3R7D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:01:09 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-78af743c232so185303b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761760868; x=1762365668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gbssRci/vHGmHOd8+cbdEKN3kF4NLOmkPHSLIdISFlM=;
        b=AS6XP6P/3kzV0PNmFebgOPqQe/8fBLuYNDEtr83Ouv14x4tOBl1/T/iMIawK3mQNCG
         NVT6NIMXnqh1HMZLuSJxisJB2XdHa4Gfx93ybSZSWLlqEf+ZYYDhH5ToIF6X7H3XP+4P
         EZUUN2M2PlJ5qrymzYIOoWzRBcR9Fnj5DMOFXNQaxVa6HN/Uxq7ov1Zz+qYNh0MT9OLX
         k5s1zXFjL6UIIyHjU59fFFfgOYrV5Ph17SGJydV649siW9jTF9uFkrr8GewcRZMcQAu2
         HXvwFh7kJxevlw21wYfn1Bu2cwO6RjVzbsCcavh8NtJ0sIAA1yma9fTF6GqbLs55Bqye
         2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761760868; x=1762365668;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbssRci/vHGmHOd8+cbdEKN3kF4NLOmkPHSLIdISFlM=;
        b=q7lagwyKAyJGN0+dnjvXl023lacrH6feuQ1MK9INFnxfcJKwgqo/+R/JvkA9J35zR0
         DEVkguHTmhHK2tvbnz+LHe/vmnLm81a+W4O4C772MLEQYFSh+tgwseBWPCrh+jKm3Nvc
         XsfkHegI8GjXBK7xjQOYS/zu6fm/WHEaBXFywB43bXysvKfHtMoZ11UGkW8LLYZcdDMn
         oXFBnkfqoCVe7zBagung3PLQnh3ozFNr144LYUodyPwWfeY5dLDjS34WaXYErV08YiGu
         n/2Y8PaJEDEiZsD98mcXgOKeFFn5zC6TPMA7Q5mPhXr36JL0iuNFyQdrAB0xbvspuYAN
         dzsw==
X-Forwarded-Encrypted: i=1; AJvYcCVVks280QEoBtZV7+9O3wcYGVk6wLaNN+Joa+oqIORu92tbZH6JS/pitsf1+RNb8ar5BaQC6/dEJV/8E7fJuKkL@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ4QsAbqb+8hhnMRE+dQU2g1isY0LEb9kuh7obJmFYToX2+HJq
	WUDHQApcY6xMroodFDCA4WSfQc+wBemi3kuZkPHff+UBo381C5+eHqnB
X-Gm-Gg: ASbGncuwiy6XoJcp7NDMgojQh5mSfpFgA6GimR3KSr/74o54E6AfAM7XPIUysq/xyf3
	mJ7q3x7t4Jdr7al8vMt6gClGuA2+Ok7Xs2Enb0DTmfZSx9sN0NEREL/kzGxkij72nHxfqYhaJgI
	nk6RE9LAUvGYwdw/qn3YH7x7jCK0sUzuWxlvizZZqEJRMgimoS9gjJdx1SGVQ6HPNzIiimWDDm9
	MlbCWSbGdJ0TJJ3HXyeC31zKU+lVIbxskebv5KJg0PPznCeE7BAPgFxRmUIK/XtfAdPpaT4wJFm
	bQ2fWMNYMMBSl4eyu3E+mEOOZQvmNOay7CnCIctDV2qsvaZIT+1+s1IyqWrxEmSO7l7lHN8WzP2
	UJuTMjd/q6SS+cavw1BgNHxYvUWJgIjidsZ9dIVfT3HdSd4MB4CspNP1QCoYgPhQFHHzXQVGz/5
	SI6VyG/vFlfYI=
X-Google-Smtp-Source: AGHT+IEK7EeZVIM4eFqBddBlc5fujpHTgJwOvNfrZ2enVKLzN/V/zlDV72wpwI//cQqfhNOcBy1gRA==
X-Received: by 2002:a05:6300:210b:b0:334:992d:ecfa with SMTP id adf61e73a8af0-3465381d8ffmr4700279637.18.1761760867622;
        Wed, 29 Oct 2025 11:01:07 -0700 (PDT)
Received: from ehlo.thunderbird.net ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414032c71sm16133366b3a.25.2025.10.29.11.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 11:01:07 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:00:23 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
User-Agent: K-9 Mail for Android
In-Reply-To: <20251029-reseller-unsavory-5461fe7f6cce@spud>
References: <20251028-semicolon-audacity-dd5bdd418207@spud> <CALj3r0hWzH+pmkbJe7DdqEzwqcpSQdkfPFtv3S7m-H8gZp0A6w@mail.gmail.com> <20251029-reseller-unsavory-5461fe7f6cce@spud>
Message-ID: <8C82BBEB-2302-49F7-A441-600014D7E250@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_110108_887052_1D7C64FB 
X-CRM114-Status: GOOD (  30.64  )
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

On October 30, 2025 1:24:55 AM GMT+08:00, Conor Dooley <conor@kernel=2Eorg>=
 wrote:
>On Tue, Oct 28, 2025 at 01:04:32PM -0700, Coia Prant wrote:
>> There won't be any problems at the moment=2E
>
>Please stop top posting=2E
>
>> Just out of habit (because when writing code, variable names cannot
>> begin with a number)
>> There may be some misimplemented parsers that cannot do this=2E
>>=20
>> As a practical matter, the branch of openwrt has added support for
>> this board in advance, and openwrt uses the DTS name to initialize
>> some default settings such as LEDs and bridge
>
>That sounds like a problem with the WRT development process=2E This is a
>trivial change, there could be more disruptive things required to
>satisfy reviewers=2E Why was it submitted there in advance anyway?
>
>> I'm not sure if he will affect the version that has been released=2E
>> But maybe it's not a big problem=2E
>>=20
>> If you feel that there is no problem, I can send a new set of patches
>> to fix this problem=2E
>
>Please do=2E
>
>> 2025-10-28 19:46 (GMT+00:00), Conor Dooley <conor@kernel=2Eorg> said:
>> > On Tue, Oct 28, 2025 at 12:38:10PM -0700, Coia Prant wrote:
>> > At first, it was to avoid problems with the beginning of numbers=2E
>> > What problems does starting with a number produce?
>> > Given that it is already used by downstream projects, we have retaine=
d
>> > this to ensure that users can seamlessly migrate to the mainline
>> > version=2E
>> > What's the actual impact of changing it from "nine" to "9" for
>> > downstream users? This is a board vendor, probably nothing is even
>> > interacting with the board-level compatible at all programmatically?
>> > Please don't top post=2E
>> > Thanks=2E
>> >
>> > 2025-10-28 19:35 (GMT+00:00), Conor Dooley  said:
>> > On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
>> > Add NineTripod to the vendor prefixes=2E
>> >
>> > Signed-off-by: Coia Prant
>> > ---
>> > Documentation/devicetree/bindings/vendor-prefixes=2Eyaml | 2 ++
>> > 1 file changed, 2 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > index f1d188200=2E=2E37687737e 100644
>> > --- a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > +++ b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > @@ -1124,6 +1124,8 @@ patternProperties:
>> > description: National Instruments
>> > "^nicera,=2E*":
>> > description: Nippon Ceramic Co=2E, Ltd=2E
>> > +  "^ninetripod,=2E*":
>> > Why ninetripod instead of 9tripod? That's what the company uses and i=
n
>> > the marketing fluff for the boards=2E
>> > +    description: Shenzhen 9Tripod Innovation and Development CO=2E, =
LTD=2E
>> > "^nintendo,=2E*":
>> > description: Nintendo
>> > "^nlt,=2E*":
>> > --
>> > 2=2E47=2E3
>> >

Sorry=2E

I already switch to a new mali client which support bottom posting=2E

I will send new patches after test with install PCIe CLK=2E

Wish have a good day=2E
:)

