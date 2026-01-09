Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C849FD26D9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHsh6MGOwaIqqm+hN1oX7sSQ0wIT7SPKXS2wr/sjS7A=; b=mXfFwIR3C2MU8jBMmr7XmIKBRV
	p0BM4+F3VNMDsdi0XjZn+bIMejjhuythQYoJ9CwdqWom+enW1aEZDDPH6HsAg3qNf+QNHN2TwLCrL
	Up2zR8W7ui6YeJrgS3faO4lRb2sBBNJyNaUGOj/V6KGpz2LZPp8EeCgYiJgTxfDU8brxq5Vu5UGzQ
	jGQiL8Aj+3DuDiZq11EtLiDo2Uyz9AAnQ0Qd3V85TrepaOUTlrEIKhSKqeEFP86bR1Yn4u9Bla5bn
	iT58o9YhYyr+ZVDvDEj11XcHRzYRZ7c9n6UC2pWxVz+bYcf2apo/x3UFosNWpuAHdaQDOsesAb51m
	+OdsHlMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJe5-000000031fc-0Zun;
	Fri, 09 Jan 2026 21:03:45 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veJe1-000000031eg-1ZvI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 21:03:43 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso1840570a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 13:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767992620; x=1768597420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHsh6MGOwaIqqm+hN1oX7sSQ0wIT7SPKXS2wr/sjS7A=;
        b=ZDNZQ2HXGfBCZ/az6FTsFnSEI2YO3fLmc4/Mg6FU92bJT1WriQlWh1EHWnaNl2ucQL
         tvl4rpo70BP4sh6ChMT3U/oeKV4etYgwviZ54Q6ca0/bOOP2W5wZT7AK3/My/8ePCjvf
         ifSI8VZ3126KpMiS4YE9B5fV/o/YdVpc8PVFDoDuv/pTMYx4yI0YzDHDjJ4XCDGtMXfc
         7HHK1B037kgxJZNkZfNzhmAhYUyVKwTcTSKosXmISrulH/eResAop3iJApJcX9xWzzdE
         Waio6HssN+QoxdNeqJ+vxpHzYLs04Rxb/ukH0nvdj5tcqVI508316NbStWBg9cM/nFkC
         hO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992620; x=1768597420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHsh6MGOwaIqqm+hN1oX7sSQ0wIT7SPKXS2wr/sjS7A=;
        b=PbErTHcONcUTXa+a0HuT8eBft4Ga4M9VXt2eQMjZcJrxm3vFecISS+Ih1D/cB+rDGj
         VFVBIbBfE//QvatYoVOnpyuIpwC02wPJ6t4WiOST9gS+f62Ib9XM/VBMyA8ZJJCaZvoN
         5fpcVwG1TkZ8Vd6UL6TpXMYMrBkBZr703W8Azr8t/B5R2eglZAatRzrYtK160YpUXpyL
         8OheJEBP2wL6NxY3/yUzMY4+trmU2dxdQLbPrathoBDbNVaRhHhRzlX/t6UDhya0IW6N
         lczyQbpDICU/ImTSxGTmKCc31ogK0gaN1g5JaAtfCZZWDJlHufFPJcBoW0MNWjoaRr5E
         VouA==
X-Forwarded-Encrypted: i=1; AJvYcCUk5t2tIWqXzZB0sQa7xJarBsYTUhPTX/5IkaBGIF664TmvcMeAm8+I0Q3rn2je0TyyLtpipS+oXU+C75RjHZr2@lists.infradead.org
X-Gm-Message-State: AOJu0YyasvSXiT+aNULi1PxQvHjW2hzHDlAi+lstKIAk2wFwBvYAfM19
	XJUWTjMztkMiLUBxKlMHeDk8gwgJeS4AXPMaxs9sjY2kl8evZhoIDOtxoebRKA+1eMLN+KNXIY5
	IJZntItsZgVH2Irtkmd2RfUrqco1e80kOoPTd
X-Gm-Gg: AY/fxX6apJ/3ojeO73ulPg/WNJ/2NMw/9P4H9Xc1YTDH1+ebN2zqK3KZ/aT2dxCGiEn
	edEb5XaaY+Mbtdpo93ccvrk8D+ZOvIkPbGef8yCjaUvV3JJsdg+X6pB/QuCeQED5yB9rkcD+O1f
	jesbDFdi+1RIzCALRWvdmD2d1vmPUerAtopncGVBeO82/FfKZ5kr2UMpbFerj+hXjXZAAWtCDEF
	SU07Xr4CWIT2cQKgwIqpDXBP393kDKdWk1JF+B+LqgTFK2w34cQVzcv5RxvMVyxoNgTrlRgUVwr
	XSGtLRf/EcTRFW00y0t4cLrI4tlE
X-Google-Smtp-Source: AGHT+IE6xBMNDdxDFDu45mzdnkNgP8Xo2RHjKHEEi7OxCq3tsQhTwUbilionwt/MAUeqVtxj/vFWwNYWT27IOouoivA=
X-Received: by 2002:a17:903:46cc:b0:295:96bc:868c with SMTP id
 d9443c01a7336-2a3ee41d111mr119743015ad.5.1767992620326; Fri, 09 Jan 2026
 13:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20260106090624.518117-1-martin.blumenstingl@googlemail.com> <890f1ce6-60d2-47d4-8552-940f3abd7c1e@linaro.org>
In-Reply-To: <890f1ce6-60d2-47d4-8552-940f3abd7c1e@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Jan 2026 22:03:28 +0100
X-Gm-Features: AZwV_QhnbrdFb8OdNAcoIBBeUA74zu08xfJnlk97QmF8Ut52hYzn5fWJkesO7g0
Message-ID: <CAFBinCAdDVjvu-ZYMZo4cMzmDZVK7kf84txw1v_hh3b4NLdrpw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: move CPU OPP table and clock
 assignment to SoC.dtsi
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_130341_431149_5187726A 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Hi Neil,
On Wed, Jan 7, 2026 at 6:54=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
[...]
> Tried to apply it on v6.19-rc1 but it fails to apply:
>
> error: patch failed: arch/arm64/boot/dts/amlogic/meson-g12b.dtsi:57
> error: arch/arm64/boot/dts/amlogic/meson-g12b.dtsi: patch does not apply
Sorry, that's my fault. I had a temporary change as a parent to this one.
I just sent out v2: [0]


[0] https://lore.kernel.org/linux-amlogic/20260109210217.828961-1-martin.bl=
umenstingl@googlemail.com/T/#u

