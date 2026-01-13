Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83CC9EC9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujA74UFzyY1R7k8wF+Fji5Xa7ziOl0VUUEmZ6sQVnWc=; b=lGoasmQ7yCftyM6k/NzjgzbHyl
	g6NrRODaBeGaBplDyxnJmu9iORk+G2Vu/9i92VQTLf0an+bt4eWnrNPLVuVOeVVxdSukNlgfV92fs
	renZF8Pd1yK0gnR3kd+J9yRYtDBuj5rtBwWHDIhdrqRvrkjO8JrZwOKpsIN48bhziDFt3b8Y5s9zh
	I4SnjLwSUmYhOfbNEg1TXQNM5Ljk+b3LeKflPEGASiTlWoQgrGxsTp3gTObwswxBRPQivwinouhPR
	l/I24oPGLuHU2ecVcDmDid+4wzOD86yVlkZxYKWfoQnztHcLD4ZxAlvxr2+OQ9r4zRd98bKEgOt69
	UGOg2ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbX6-00000006tfE-2heJ;
	Tue, 13 Jan 2026 10:21:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbX3-00000006tej-4AAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:21:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so14453885a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768299708; x=1768904508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujA74UFzyY1R7k8wF+Fji5Xa7ziOl0VUUEmZ6sQVnWc=;
        b=Zkl0hFMNlGnW99tJIrblzATL5QMkTc5kvV5TD2UWKq2AGaKQDT/jKzxf3u9xeYSMsh
         H92VXyfo2SGQF9jignpWhFnK1makwxu/yyKBMgyYL1vWwLFIsi0unCwJGhfOM39oQ/Q8
         7gT6ViWxW4w4XgkKn2HfnIvCJgkB7SZFH+TJhvnqjeYKC2xzfDta2ZIL7FaY0dXALifF
         gH1mk3bWjSuADG2AKwLBAniJMDEpRvQCTfzvvWs9rt85paYycgbmhZ/HiUadPFM3GymS
         AilySZCyHhdIMcY2RTC7vrQMjnXdHMkxTXjGjpzel7w3Umj0ZJ8uhs39qDjjXJ9yj8yk
         ro/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299708; x=1768904508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujA74UFzyY1R7k8wF+Fji5Xa7ziOl0VUUEmZ6sQVnWc=;
        b=LSFfPKAzUoIHHfa5FUMoztKwEcj0VbWC6YTxBwP30Wl6YPJ/QkghK2pxK5ZCKIbciR
         qvdJYzeDqU1qZQweLw6DBTFtCrC9RafPVyfMtCgQxRjLOtqY/ximHWEsic2cT4lRvO9E
         mf9gkFPDP53GFF68dDW4fqjH6GM6DoVt6ZDGUZW9Ipq72J5kwr6u8QMWDbz27xHnsPN/
         o2lUDx5Xt59+BLSgB+q5duiU4SxIxLCEebXilGTx/+rImXtrjktfHxSOou0D4ueDD7LG
         IY0cPnmnRnubENUR1VesiwfSTQuFpC3qgIS+XiyJ9BaZ4bKWzXw7bkbvOj2xox7gxATC
         NTfA==
X-Forwarded-Encrypted: i=1; AJvYcCUEoCYER5RzrEmMBZ1+2r2BWQ9yvmkX1oc+h+lkTsHOX9n4F3dFYb9zDIlrzgJmY5g2hetrP2oCSRllFxHPq0yc@lists.infradead.org
X-Gm-Message-State: AOJu0YwDdwQHvtU/7Ip7XhEnpGyFgF6X0GHjT73LsO4mF6djHSLNBPpy
	1wVK3K9SL3knN2aAS3IopxD+xTrf7Q6Na95KsLf1s+OM4n+6999ugbrvtYFDORTs7xeRKlekMzX
	GUJchxBRcQaGKcegOxveCIv7ju2at/Y+0j5pt6uAzVg==
X-Gm-Gg: AY/fxX4M98grnL2SiMwC6Yogn0xNSRUhxHFVQYSBvUzoDKqdaJPv+1Wz3ocKGGXyiLX
	OGJq1B6JtqaEdAZnOwQEw6mvvr8N75fk2ylX/7TwHrekDecGq4I0edR0jwwE9577IObM0dwJC33
	/4pdLfkqXbVCpv2+bnHC+Yy9P1ysytIsRtb06qTYk2n288lTap5D26Te+7O1Dk3WsfZHbbUUrHP
	lpIRPfhRx7BaSjPjqZIox2LHYIf8EGkHd4YRWZYDTXYqQcMaxUGkHuyfxPYo8vS7Wgr0HFK02P0
	9K32h3ZrDv5EpG2Ms7Q5fA2QBGdF
X-Google-Smtp-Source: AGHT+IE6Wy/aibh8AKdbvQrUZa3QES7svhGaiNX2I9LwEcDIqqUrH20FYSyHYt1NDfOmk/19+sQBut9iwFovaQ/hDUI=
X-Received: by 2002:a05:6402:5247:b0:64d:65d:2327 with SMTP id
 4fb4d7f45d1cf-65097e59b47mr21305946a12.17.1768299708020; Tue, 13 Jan 2026
 02:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org> <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
In-Reply-To: <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:21:36 +0000
X-Gm-Features: AZwV_QjOP9Ch49Q2hgsiMLNrbriy5_cS7vekI0_2rDle6kIOrdJ55TM-KAAjG_A
Message-ID: <CADrjBPpphmaiQRWhncxFPur0x4M-wY1FbYi_k4iTAHB38fEd0A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_022150_053995_0B80871D 
X-CRM114-Status: GOOD (  20.16  )
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

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 15:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > cmu_dpu is the clock management unit used for the Display Process Unit
> > block. It generates clocks for image scaler, compressor etc.
> >
> > Add support for the muxes, dividers and gates in cmu_dpu.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > Changes in v2:
> >  - Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> >  - Fix dout_dpu_busp parent (Peter)
> > ---
> >  drivers/clk/samsung/clk-gs101.c | 283 ++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 283 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004=
ff5ffbc9a19320cac 100644
> > --- a/drivers/clk/samsung/clk-gs101.c
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -25,6 +25,7 @@
> >  #define CLKS_NR_MISC (CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> >  #define CLKS_NR_PERIC0       (CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> >  #define CLKS_NR_PERIC1       (CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> > +#define CLKS_NR_DPU  (CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)
>
> Between APM and HSI0 to keep alphabetic ordering :-)

will fix

>
> >
> >  #define GS101_GATE_DBG_OFFSET 0x4000
> >  #define GS101_DRCG_EN_OFFSET  0x104
> > @@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu=
_info __initconst =3D {
> >       .drcg_offset            =3D GS101_DRCG_EN_OFFSET,
> >  };
> >
> > +/* ---- CMU_DPU ------------------------------------------------------=
------- */
>
> I'll do a full review later, but this new block should also be between
> existing CMU_APM and CMU_HSI0 blocks to keep alphabetic ordering.

Will fix.

Thanks,

Peter.

