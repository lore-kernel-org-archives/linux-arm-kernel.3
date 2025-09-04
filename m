Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8737CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=; b=gGFZ4DPShHUY2J+isyRfO2Scvz
	mGTcP6c2Llt7Dt1uM/uO470r8KZtm9fJuQeXH5gywtQi5F88ac8gd8UWjWCZEIR79byhdvCAyJzqm
	9vqqIM45QEotX0tvxVWJRvGf9PYwTCztlyXW0N5/czOZcg3rDddTOjH3SBf/eKdtXELzPPpPVgxGO
	cxE4BfgTceraThj5ze0nSlV6ZzBDPKnshjrW+Gwhbt0rV5ed4gFDliHa40AI1C35tsMJQnHa5X55A
	9l5aDSFPiwmhue/lq6gbtON5K4dAusJ+uK5lT/jQ7+yRCOVePeyjmywKGUMZY8erHZnLu6CH3k+MJ
	Li1oEfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1J-0000000FyqY-3Oeq;
	Fri, 05 Sep 2025 02:17:45 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFAM-0000000DmC9-0rv2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:58:39 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f720ffe34so1761167e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012316; x=1757617116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=;
        b=Fj3bBJJamxpiS6v+R4jr1v4yMOtPlpsGS6uI01uScof+w0gTd9wcW4g14OXXTmzAi6
         9E/OhHq9ozjTTeAdleuMiCOkD92pSw7OT6BzIp1/wjZbBhopnpCFSKl2UaQL4gjmOgMx
         KphaQ+Qj7Y8tQa5GR4biv7v8d3hyzN3V+MAwM64ckAM370Ht+scyknFZBU2ZBDnNchDT
         Iy/+vkApCXLxZNW4IfNN/MUc2TdTuY4mEQF9vmucdx2SyX94d11yDHRWhelmGGBfwhRs
         8YJS3yuN+FWfrr2WbvNCgeM+3X4TujMWyI5vv21bcn546Iscl2nTRSJf2zTjMYV4DkLV
         IDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012316; x=1757617116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXvwqhdr5kSofiFo/qxPpUj+SANKhSZFihnmnpGw640=;
        b=g2UKccQ60PC40BVaOE0OPLLPrbRxPmTw4LG4zKBKzNLMrcTYC0Q4qbEfHptyhvh2WN
         JRiIb8Mh8ugho9Guk0dGzP9aIq4LzVjnAYJEJ6pfT17opKyc7Q0YkZNw3NcNQM5Lnhh4
         rQYFym/SN5gaEqCVUhnisyg1VR7uyMjocYfs5VMqqP6G3zhMzBEJ6Ec3NefZelzF4vEc
         v/dc9ZHxQGkbSVBfmI3dyYIjpmQBOniICMXOlHo8yBRV2ozQiIixBcCR2RfZtC9z/wWm
         +U4B9RAXvThm1c25Y3T8z/DkjYns1lW4lTU8wp/5MTcL1a28I6Osm6ax64E1dywDViO7
         HugQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZZDqY9TFyRnkraBkxyEu67es97SDSrIyr1J6oMReO0llPz4GzFcqGBU13kafkc6F1Esclo/bujTX8vJ2LM5wi@lists.infradead.org
X-Gm-Message-State: AOJu0YwM3StdFQx7wYGHIpBLEwAo2D/PGtTAPav34taAncNGZFj8IKrB
	U4ciGeC3wzFc6NPAq7ZY3/UQ2gWjMSbwnQGpv1qiFQSN3Dab22JhLmu0jMIuM3PSFjR2BdvvGPd
	1i/qELNO4MQNYniiX0sYSmA4JfKyoAGa/p0/S66fg/w==
X-Gm-Gg: ASbGnct9nVcz27vSMGEGk4Lv1xEJmLx3jeTrHOzTQPA84AFCqY2Kk8KGEs5tpiI5s33
	aQMKLfSTdkah9yTAzxBCIlka1UQ5AjBr4aG9qzmhT6d07oJ2ZW2w+nkYyrCfkHiL/lyVn8t+5Yi
	g+PD2pIOJDdnqOP/1YNO0Gl/XL8SXV6nvnhwRSRI/Ei5v56ftOgwvp+Zf+H6hgqqof+Hcn2ystV
	T8WQYig30/49ZHN0Q==
X-Google-Smtp-Source: AGHT+IG+D8oTOCZCybe0jTMWAtEyJVHcF+x1RsxL88xvQswzc/kVAOPXSmL8jd/l58Uw6kNKnmcj7kant2xsnzkphIA=
X-Received: by 2002:a05:6512:31c4:b0:55f:5700:5cb9 with SMTP id
 2adb3069b0e04-560995f4a0dmr209732e87.24.1757012315206; Thu, 04 Sep 2025
 11:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 20:58:23 +0200
X-Gm-Features: Ac12FXymNXEWp0akA1KKPpfwK827qyFlyk8eBQbtNKsw_bFGu0HOwHEo76-xbLA
Message-ID: <CACRpkdZAROUdz1SJY=h_dcUiojazO1fYxGJ8X2KEE6ow7oFZaA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_115838_271031_34EB98B5 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
>
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
>
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Fixed up the extraneous label and whitespace error
and applied this patch!

Yours,
Linus Walleij

