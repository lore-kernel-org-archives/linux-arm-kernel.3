Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6A9F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=; b=eRC+MculuJGpCa
	/q88ZyhjEb6D3gsrJsNhtMCCiZNWZdAr8dzD+qDr6rYGjDzFs1Pu6oa0ggFX2vdNLIHGcRVrjuynB
	i7CgOEky8iVNLKigjw5jJrWoZz124ROIjXWOPztWnHQtkx0rf92qPM6cp3/nhKO16LkbB6wxN/EDS
	0pBVe2BB+DFH09OJABuFXnYKjz4kFcC9qBxmiNBRfZa2nTkn0c5uLBOow66oLs0TU/sP07KsztxXT
	J1c+Bm/+yEPQK/mKayYnPfnqn7/iFRn9F+Nb+i4xfV1+8klfmJDnz+q4EXo0eXI5bKSpRHuQuiH9r
	rYsTMVMFh9iZK58EhLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ing-0000000HCPj-1Pd4;
	Mon, 23 Mar 2026 17:10:48 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ind-0000000HCPN-2met
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:10:46 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so3240885e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285841; x=1774890641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
        b=jn0cdSA6ZaKFCKywly9SgYzah3ykQNU0wXj5td5HeO0VUqQ0NO6aiZ70JuqEl6vrFe
         /ubszmlDFoG/PTiNoxpY/54cd93W5nZqSlyZzxKMV7aJs2/50qQnHPIoGSQdfwENXLgT
         6MHadg3f19XS0H1EIKAyu7Pry1pbzJdeLZ4qWwAQ6pbnnLLgqufDNffBYE4ij/CMcMGG
         5p42mXpeoXvq1xwSxSx+drHIO2bM+7KBBBHjTU6dwhmcHIwMr9w4XA6MH+k0LylxEdr/
         yNYMxLwtKNf0j+W93hcFJOD/Denuc46L2vL1Gmk9iMUQ9Wj8F153ebn9bFNQvF060SsT
         JsAg==
X-Forwarded-Encrypted: i=1; AJvYcCW92JPMpziLd/nXDP0je6pijoQKRnsfzuOxcL2gpkn0gM/dt7sOdQCptPj6+EhZyhVy6wp9YEhtk21D9R0EtZOz@lists.infradead.org
X-Gm-Message-State: AOJu0YwmcOR8Js6wG5o/gMrlC72QssXkMeqLLLi7y82mxOt7crANinB1
	AqXD4xITc+M2ED5NC2hL+UJ83lC+TmJcS9E/PC2GNxbvW473cyQmSZx4l5sVgOUW
X-Gm-Gg: ATEYQzyjhYYUjtODQbJ/NfguInFKzKV6D2BmJyIUtyD/CyP66rpXOuPTcOm7ez6Y0PT
	fMZDisIBOrq3rh5hg9V3+VEUcfsWuiFrJdVq0CQ++LeEHGSUh7CC0qr1uhsAOxerqN+GYI5uxo7
	z8nRH2AhSFvz9+PD+P8EKR8y5eov83/q5RybMilzQ9RyC9MtMbsribbkDcgLTSP3/5pGq1Pjwdv
	u5GDYb1Xb9hpRS+em3wRft3cEhUNazajzxHNNB8OPhIsGkmu1YAqfAU0f+gvgF9BUrohZWNgMGt
	gnuxkmpPirwGTymtz5nIKqT1YyjZRuX+ckave1FV9+bnUx7MWtomfh7h/JVoAjAd/olWRUR17cs
	tlPQR4bKGaRdB8+bS91PIV2XFiFAVprNh1U4DLZLuuBHZH3VVcAW7+nrvCTTLJ6D1QNpA6Tup7d
	hTIbILXJtC/B5vy3MerOoCKilRVMNLPdFkKfC0aqscpKQ3EfkNeyATets=
X-Received: by 2002:a05:6512:3da2:b0:5a2:8495:965f with SMTP id 2adb3069b0e04-5a285b04727mr3963616e87.15.1774285841072;
        Mon, 23 Mar 2026 10:10:41 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28e890ec8sm1326195e87.80.2026.03.23.10.10.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so20868991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYSQob8PEmTaTPiW6twp5ZrJXxfWpm64OxJFnTcjjf4IJwlH4pYgj5T7SKXRziiQ4+nCHT5oNrWl+nSFfuszX1@lists.infradead.org
X-Received: by 2002:a2e:ae0a:0:10b0:38b:f110:aff2 with SMTP id
 38308e7fff4ca-38bf962a085mr30981391fa.14.1774285840106; Mon, 23 Mar 2026
 10:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-4-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:10:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
X-Gm-Features: AQROBzDk1tGxLjoHwtXmw1tvFQAdkXahJu6ZBHXleJQXSQSs109gwXgcaBwuezI
Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_101045_739606_FC6C475B 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so w=
e
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

