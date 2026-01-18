Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4875D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq0ZedcEuNO+ABzh265FROMeuNw22COMEoNCyWJq1yQ=; b=COZdKyR3GJbPfCJI+K/1SLU3aN
	13Jx8I5pCQW80lR0xsTLIxp6lMadRGbUCTvlhDqN7kXRbjtZs5tmnusLQ5pjP7NUHFxBUm0yc9Gxy
	6EljRuJTK52rmY6rt196AIYesP7b8ngRgl5MwvwaDumVlBZKb2YcLYmwEwFy7fEvLtE+qk+xyK1yE
	mgSDcxiEviW2ur7EqXH/HB5kowO3uHmnOpR8D96zxU0BHC4pYu6IUiEZC4Cft6m7NOWyB8ZPX81Ki
	mTjHi7sWOdcSRm9gviQU+B3iLZoB9d8gR9cKjkS+hX7a7vP5AolZsbYUWpDoBCIQCAB+PQVd3WVkI
	vrnDqXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSI5-000000002eX-3hji;
	Sun, 18 Jan 2026 12:54:01 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhSI0-000000002cu-3AaW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 12:54:00 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78fb7704cb4so28806267b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768740835; x=1769345635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq0ZedcEuNO+ABzh265FROMeuNw22COMEoNCyWJq1yQ=;
        b=FrUoebg6W7QWtM7L9IRZmb1UWzWEY3wjoi+iFZ2tkV4r2pLB5ly6XBgequ/E8jZEtT
         ve61nmx7RsbJaK5Huwuc+lHaEUB0L7RJCkPl5b/pjJSs5bPYy2t3hZKHptByGG4XL2XQ
         3wxlOzSSu4jc2/4ThG4NC9wHINjAC6AzE/T1yFmFdwkOjuw3IwM2rK/6rNfmAR7YjWS/
         z3oDeeFOkak2XCo/D/yct8apSLFxYCNPiKyzHIRDmr7B8Hj7uPbrpIrhsXyYk7oH6Ik6
         wuWFLinhkKow0sP2vnRpKl3b8d6TjGE6IfW9HBPDn3GZchJZrkytJTnArG+HzyB6gn9W
         ZIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768740835; x=1769345635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nq0ZedcEuNO+ABzh265FROMeuNw22COMEoNCyWJq1yQ=;
        b=cVIhOU/hBWfqETSLwbruXJ8Dxp0niiJCGllOUOhq33GePgvz78n1PnocAeP/ulbPdq
         hxvM9NaQeKtACa5DRsQwQkOpeGwqTSPSofhibnTSXi7Ro5damUYsLlkKW7Vh/M3HYjYV
         DOoInoJaraSpfdn3qFWms5WBTi+GTdkMUTF5Pla5Aw/qNWRFSV4Om6E+SVSwTHaJnA5p
         lCraolSH23KEDj/6/0jgA1JSjcFcJC9NWlCaRLm5JXKTaH2OEfyHWpfFEfVSxRXESLDv
         Y54A0ohZtOfxzRiVrEvVV26qxCSe8gcVJOLq5F1BNS1iXOcfpJx/EfyupceybqN5X5E4
         w/rw==
X-Forwarded-Encrypted: i=1; AJvYcCW3nmS5cOHEfeYzOqjLu5tpJ3eBbBCwUULX8JIvGvx0sVEWecH/VNtyghXgh3QLJGP3VUWxKfIwuRnlgyF+h94z@lists.infradead.org
X-Gm-Message-State: AOJu0YwTGgdKlJxzn04noKwfEcCGq7SPlJ3gRysi0dLMo87h1e2A8xNE
	8wf4OSDCbid4S2P2/VkQXMCVreZTGqUIxZChretpuxgc1hQ/SvbkqDu2uCGhnCAq/Bi03CNSUfU
	5g1XxleNRdCrGHSqHfk/7ULDVjQv7dy4=
X-Gm-Gg: AY/fxX6iThrmW0Y6Tc4l6f34v7h2ecA8MiXiID/hF84KTHo8kEZGVmqLbMfsffbmJIv
	E+1Z5PX9mdzZfHiGTw7jhJvFfnT90XLWLcU9FizZFE1kBNkNJjXxCYK1cST6EDqXpaOEeeMDdRz
	BARp89Q4qOlb1zMgC6XQUW4eT71Qx+PZtwf2r12E28oboxYELZumMgyrZqz4Q+l541lozH/Z+WP
	uxMx2QC2CZPFn5s984SB93XoP0Wz2sQqgF35MZuM+FT7uNXku25td01aA544UtimGEMBGUcztif
	fDhgttmD85f+3VL5IlzoAI9CkT3pd31fGLoyDlY=
X-Received: by 2002:a05:690c:6:b0:783:7143:d825 with SMTP id
 00721157ae682-793c671d3eamr65122677b3.25.1768740835221; Sun, 18 Jan 2026
 04:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com>
 <20260115-b4-macsmc-power-v3-1-c236e09874be@gmail.com> <af3204c0-0492-4555-9a75-3716fa264ecd@kernel.org>
In-Reply-To: <af3204c0-0492-4555-9a75-3716fa264ecd@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 18 Jan 2026 23:53:44 +1100
X-Gm-Features: AZwV_QgnfqxKHc96qGbQRwH3BPdaA4uu6Z9QA2PDHlHd4joF1Pds45iGW_-m9gU
Message-ID: <CANpmGNvNe-Y7mgMEqKYGvyA-v6pKLc_9NZ8LBLuy7__F+k4oGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] power: supply: Add macsmc-power driver for Apple Silicon
To: Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hector Martin <marcan@marcan.st>, Lee Jones <lee@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Janne Grunau <j@jannau.net>, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_045356_793423_689F96F1 
X-CRM114-Status: GOOD (  11.62  )
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

Hi Sven,

Thank you so much for looking into this!

On Fri, Jan 16, 2026 at 8:00=E2=80=AFAM Sven Peter <sven@kernel.org> wrote:
[...]
> > +
> > +static int macsmc_power_event(struct notifier_block *nb, unsigned long=
 event, void *data)
> > +{
> > +     struct macsmc_power *power =3D container_of(nb, struct macsmc_pow=
er, nb);
> > +
> > +     /*
> > +      * SMC Event IDs are reverse-engineered.
>
> Any chance you meant something else here? The event IDs aren't special,
> everything here is reverse-engineered ;)
I was more meaning that they are made by correlating when certain
event IDs appear,
so the comments I've added aren't 100% certain as what Apple intended
for each ID,
(unlike keys where we can be more certain because they report a
physical value).
I guess that wasn't the best choice of words as everything is RE'ed,
as you've said.
In v4 I'll make this clearer, thank you for the pickup.

Best regards,
Michael

