Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26BA1061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=; b=4sSdFPoOHYNGBVp2bK5sQ6QL2J
	ebcgHnGIfhTZ9be4yV35yy98uczR97uQ7bU7V4mDNHg3FPLHo8KRLpnIeXvDPjmXdfGrtvQG1DZee
	L8zNyuXMZmLeHaqAa5Btk7xQ1Vu3qzylv+Ynte2gCVltRrPl4ZfN1Wtd7TQ5GGpeugPKdfp7XSwfY
	faznWxXNejZRo8ti+FRHFDNe6fdNvpe7iB5mpAt5YO1bj7RCCQRARVynURQC43jgUJCJcabOeuVGa
	BfYHdE6/4jLtyhmWlpkEqsUAPSte50bdgAoJJ9eGeK+eumk92Suce0shtVApdqtLwsydfcXuS0Wwj
	UaVtO+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K6t-0000000BuZF-0JEQ;
	Mon, 30 Mar 2026 21:25:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K6p-0000000BuYX-2be8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:25:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ab46931cf1so43444975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774905918; cv=none;
        d=google.com; s=arc-20240605;
        b=dtQ9OYH4OFyXWIN4S5TzN+8acr8HW69xIeAuRS/N66xV0EjCgy3xLGOcEENtIoCQax
         gCqemiTke2fMMS5xUgnwu+UCyN5kMOqEH0uGnq5vnY6PGhNB+FJ0PDLVcdNDyRJOfKdN
         Ua3BxJFkXVyBdpy6yTY2/aCFQB6eXmZ6dJ1TjC17VQrGbR6kyo8c3YqeXmy/6Vl7mQ7H
         vj3ArEj+S/s/EnB5w4762mku4615byvWTOK7wMTW26Ha8tHJn8saQnzp4+KAPS0S1jOK
         HM16I6QS86pQIjGnus2Mq3b5PPRhi2bg9ULJ95KIPynIat0y6kFkZUnZ379DBFQcko1G
         TZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        fh=Iejmt4xpoQ3zDrIxJ8lamnw/Ms6zHi9yX3kM52JGUf4=;
        b=ag8TsQXso3y77UlCfC/jeDue66F1n0N5ihSiZWuPB2uy0tKeHcBwq64KvSte+i3qy6
         6Q+vJuZNceBMmGNoXjeWL62D/VIjtvQq3hx9OnUgM3ylqyXWd5v4MkI+NFaf3iMsw99x
         tvqV652ZU8FpWNjB3zclhbQF4QzVZZeLe8FdtKaN3NdnuChfb4K++Q/vYznDuAHlLmgv
         BU17AzcWAaD08CpcPVZkGHc5FUHg9J6V44FXudGORBRG0HmL60uiNKYN3yEHPdLubJxi
         g+tpDYinWzQ7gJ0HYRi+ZHWgeph+C+RciHgL3U6WV2LtQjFDL5rzvIwdNjoURNALlJOv
         qBEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774905918; x=1775510718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=aEDhtkIerONWml5nFesaoRv426rqJ4vxvWvbfexuP5XZz+GZV6gkZ8OqhEIiubZU8O
         50F7UpgVbPi1eo16ljEACz1lO+g9E6vETIXvrRRWZ3Tc91H2eZqUB68hxvmUvnSVRa5+
         eNi1La73ZIuXqmDP9CoqWyUKRiVhzXtkdy732SPralQPYokOkNqdSudUAwYaml0CMbwS
         A2XmmT+46sMDCTrENKpZ/8Qblg6iSBPNRRfiDNsJjRY4+AvwZTpUENhE1y07RlNGG3Vu
         DrRSXltIJ4/rOCJOiy8Fqd98JDC8ltyTrcmizggk48UZqHTRcxBA/I5eMxgd2lbS1xsh
         sH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905918; x=1775510718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVVP7UQ619D3tEPSoWkJKGzOdcRkIzemvOhgtAvRnhY=;
        b=Le/gwOLvp/kyqoSR7oRpBAAvmvoNLLXD+gPVkARXMYeLlOcjKrX080MpRaH3e/oC9w
         Qx0rbD6tRjJ5Loooq0k+SVBMn+ybfVNWDvMHmZZ3QPUXWHalt1wX89m4j0Er8w8tF4jR
         GAGjdMQ/u/UYBtQHb8E39EX8sBWaePsCJCRC6ikTPDswIH5mxUH1JZFalvrhMwSwM4bX
         /GOjF7VUl1ZSzVfuaC+d+A4CSq1C9ZN6JqQAafdnTa3KL5VmUWMzJjfwX4r5uGiI43qX
         4jzqwyDRzot7TC8OvE9l8a9DKGUPU9RZHbbUc82P8TeDhbkCMM1YN5ag2T0wI5CbHJXY
         /wyg==
X-Forwarded-Encrypted: i=1; AJvYcCXozaWduGLHGVa3cBOTKG7sfSTmCJN1ZSY8SzRJ8Hv6RceMojhyiLd3LUb6hqyiLsYJ7DNATfkoh1v6t/V0lQz2@lists.infradead.org
X-Gm-Message-State: AOJu0YwnAI/vucIjO5xAdCY/gnEQ4zS1IAmktud56pJ0oUgi5jfzY6KM
	PWSvJp+N/BN36nmFo7tCBiqGE/ssmL9OabLxH65H0kgRl+rC0Rm4N7MheOmSIphlDhyrwN4xm7a
	Lj3kCHLQ23Ie1G4HKs4pXAhdsK8bv45k=
X-Gm-Gg: ATEYQzwKctaCJncfWLx0zfVSSwip8j8zKj3oahbl0+6j7/pGjetEJ6TXedSLss+KmaN
	Hoi1TefMCH/NrNJUCyf37SB4ZacHZ23K8tv7AJc86Ec/kGeFrrR1ufFGbJCmUgfDkkeAoth+HT/
	1kr5NElM5Viy8ioXgGeTYHhsBZbpPHw86Xe3UiJ9mm9n0I7Je3r9/1AGjNaN1ZHJp1W+zWNi9Mu
	cwksZgaVg+ATPuf2Q332bDI5SwXUmp3wJxqT1vccMIA4U56TpGFd4YHj6Vu7oDu22cbp87SnQuF
	xaBHoAJFe3jCF5lccby9hDOmBhAs9EYC3WQcYlHi
X-Received: by 2002:a17:903:ac8:b0:2b2:5070:79 with SMTP id
 d9443c01a7336-2b25ef3a597mr9046465ad.18.1774905917931; Mon, 30 Mar 2026
 14:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:25:06 +0200
X-Gm-Features: AQROBzD-B_vEYsIVR0iEnkiRzA98GHw_jcG_pPIvLF9KA5m8ziV-gAP2mWQJyxA
Message-ID: <CAFBinCCOXSKqv23UVKK8W9JxhBGfajyW8_rvkaak62LiRBvUSA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_142519_670213_6177803C 
X-CRM114-Status: GOOD (  11.49  )
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

On Mon, Mar 30, 2026 at 4:53=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> Correct the interrupt number assigned to the Realtek PHY in the p230
>
> following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
> fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
> interrupt improvements [1].
>
> [1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumensting=
l@googlemail.com/
>
> Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on=
 some platforms")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Thank you! I don't have a matching device to verify this myself.
However, it's in line with commit 3106507e1004d ("ARM64: dts:
meson-gxm: fix q200 interrupt number") as IRQ 29 is GPIOZ_15 on GXBB
(but no longer on GXL/GXM). So this gets my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

