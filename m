Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A05C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=; b=o1xJA/wVppXfuf
	6z2Mz0MbocYAWUh0Qm+giUCOdVa+j36xQrsaS0bkdky1X0nPaulBD+M5eVu7PL5RgVz47nXKz9xHd
	6raE39F/RLAH9+INMeOHCx7KKBhyR4LKmWQ19bA7Z3jGm1px59D9BavqMJ1sB+OYWZnYlymCvLQra
	0WJBMBSl91t4lvzdheadjV7eXTvBjojkqCIhrrWVCC01tmsDOQX7uzb+ICCLEaIcufHvVHvTeP+j6
	e64hcC9O1uQPggOSOx8ll0Kdue4CA0Orsk9CFAQF7RuN0l8tnGnq9+BJfQFAMWzV+mC5gJw6GV0Oa
	BbOzREOT4IDKbQ/FBQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2w9-000000051HM-0FdQ;
	Mon, 17 Feb 2025 15:21:33 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2o0-0000000503O-3TA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:13:09 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54529e15643so2685101e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805186; x=1740409986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=;
        b=oGdmSXsad83UF1Z7t4k7hJ9H+xtrnLmOD1Ih+No9mkSalM2S+hF70mx7AkEcna1xo5
         u33pjVClL8wAUHELfgdvSwbib87AFm1DOL4Yz7mtbDnZMtWrHtLGLN1cP7CqzTUuFbY6
         MHS/om8DxW+bNmjaWk4JKvAnCFno5xYlkyldECDEbSfx4hpd3dm6el1H76HUdch0s8wN
         sGUkwM6kEHALpmyTcVR+ixaeTVacefjbk724IgCVZnUmNoq3y/ZfhQ8cmb4HZxQL55UW
         ApPNE2Z4u0FCruRhuKNTVseDwdj6M/UBP4ojjxoFOcG6/Rr9r0K+5G23zVDR+qCB6JGT
         e0ag==
X-Forwarded-Encrypted: i=1; AJvYcCUfTUBKPqEpm6vbBYVkynQUqcY0PI7MAjlgbtV4LnNUpVWZkwxOrNug9eZzUD4DidilQIik8hp+7i0F/nfNDxvm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz95zjlJiUXscQ0NeAlgOZLREMQ+d2lqTuXNJ61V8/YPaMSG4Y
	wAL4LitBGWQbLu0zWrf8ktzSr9X89Oma/w32tgLrPOhMpUECbkGj77wnBbRl
X-Gm-Gg: ASbGncvWYI39o4/AH7lCPABpYWzfcUtPgl1FyIl2xwW3t3/ZDAqXJDX3fmIIBrF/BVM
	kiWUyOZzQ7LokTjpHZ5f1+YcVhu2Em8VqpSTan6vuhKqOK9Odi8WfsXNimXDx6L2J2msvPjn5h4
	7LefmaSfy6KzAVRN/WL09QPhbQnq5NMVWwSEiPhdVaI4xWm1qrEPlTZb5mBBqh8atnaEu3GxUe0
	3n1vPkUq64kLo6XpXQPactC6x3eiLyjbvcO/nTHzyNx6zxT4kSZy3CUT5/W1hjLSlODoCvg6itA
	FeV0Gl/GOShpdg3gnDzCpwjZgmLm24GNIX8JA6kbZq+fnBNS
X-Google-Smtp-Source: AGHT+IErmY7H3xWfNNKiNLb0fDBf23zvgvdAdlNOvrziKRBX4OB5GugPICRcuF55vZG7sBLFk00pvQ==
X-Received: by 2002:a05:6512:3ba3:b0:545:11a3:7775 with SMTP id 2adb3069b0e04-5451dfcb82fmr5272608e87.7.1739805185515;
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54618f83486sm756000e87.140.2025.02.17.07.13.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307c13298eeso45965941fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbdZW3LyBiGCzcCdgAmZ3B3SBEoGZo16r/C4zY6TN5hKj3IoYzRLQm9/NpmV9rqhjRQ6ocFw+iAJOUL9/qqqim@lists.infradead.org
X-Received: by 2002:a2e:bcc1:0:b0:308:e521:591 with SMTP id
 38308e7fff4ca-30928b55670mr39756701fa.16.1739805185075; Mon, 17 Feb 2025
 07:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-4-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-4-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:12:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
X-Gm-Features: AWEUYZkPH3DyqUAjqlsWUrgFVAz25I3j7gx6gVj35UBevzeFHJcZOXdE_CBm2aU
Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] pinctrl: sunxi: move bank K register offset
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_071308_865941_02B8E11D 
X-CRM114-Status: GOOD (  15.82  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller register layout used to allow for at least
> 11 banks per controller, any more banks would reside at a second
> controller instance.
> When the per-bank register map size was increased with the D1, it turned
> out that the last bank (port K) of those maximum 11 banks actually would
> not fit anymore in the 512 bytes reserved for the pincontroller registers=
.
> On new SoCs Allwinner thus moved the last bank beyond the existing
> registers, at offset 0x500.
>
> So far SoCs never used more than 9 banks per controller, but the new
> Allwinner A523 actually uses all 11 banks. Since that SoC also uses the
> extended layout, its PortK needs to be programmed at offset 0x500.
>
> Factor out the bank offset calculation into a new function, and handle
> the case for the last bank separately. Since none of the older SoCs ever
> used PortK, we can ignore this case, and just always use offset 0x500
> for the last bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

