Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=; b=iKPhDBtkZzfPljFFtZ8xzrplLq
	C8vk+EBjBDqrHMB2d+saONqT6xJT3fwN8qHWR2VRZg31JcaZKuwkuGOsnPUIAc6XcQ904eijz63Qt
	dQFHlaa8QGbDBRm4Ag6DSa9wi4lKC73YimmeuZ59TQJMWG2O1XTOMkojyF6Ik4GdTF+h90PfgWlgO
	3A3FpEjDh2Hu7QA5x11/zTXxkrLVHaxbWc1DCs0DsuRzphtg2ylQHeGgzm6WDQR/a+cZ3vo6/jPBo
	PZAJC7a7zDHjjsQOJHG1famQpwWLu7f0BweW33tt1FQzmsGQyRW8I9lB31alzxSWHA3rnz5XNsYIf
	TqyOcD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuCj-00000007TZE-1Jxf;
	Sun, 12 Jul 2026 13:26:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuCf-00000007TYS-3c3j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 13:26:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ca70925c25so31694855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 06:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862801; cv=none;
        d=google.com; s=arc-20260327;
        b=LgxHo2FoIQcpzIS5aj608Bwll3j1uZtRTv7R2kzfeHKqfx9HPIIrXhX5Wrz1voCDRL
         paKUX1JDYArmPYJx3ZB7/DPr1hK81pwiakdAKRVAKS7/ocelR6j0irZvul9+wr1lzSUR
         seSyiLbhosS+kLLaB/jSUFIHzFxtBsjeMGKCOPqJnrqTN1R3DxSxjBtI65c3XJ5SIdvM
         dA4e6wUSJX/nANFzkJdzXiVBdcibqqTw57KjGRrcoegc4YU5jiVy5kPv22bfn3a0lgih
         vdW9xRpP6SZezvbkBRIEMJMgEm9ABlJJjcce8xWfUqPeus3CaQFBb+Iu1LBzpZ6WyPKL
         kLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        fh=MOwn/fRekpGml+j78ubw7XiOqikOtQiK3ATCNYpdYbI=;
        b=GtDfrhH6lntluNV01lsTw/Z03FgHPOhj8HTJuT8CxWYKKkGChPl+Tx4y9gYwd8kgCj
         8fCbcV0k6G2prr9cDJx2RdrxN91bvis2TNanGvTkcv7QH5zcZ1TE+TNoAZV4t8i5b5Hr
         DX7d72eFPoeS2s/40bthgrT/Xt11Cbw+FUbEN2eMA55WKhj2uD6b3O/ur3ciCBbCloSI
         5uOmphkI8ewUeLJKaa4lDdaqrHE3fh+EI8PiFi/+meNlAfXbGbUGwDvc+ADmnn3fN0Dr
         NK7NBqBmN4Ugzc7CBEEs6Prd/UyjfuLC/Grhqz80EdAvWE0zWUci7RZT+yUC3b23bKW/
         tl+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862801; x=1784467601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=qSuZWTapbD99J5AzH5suumIYlED20UEjHwimJMxcv1pcL+yuKMqCG6s5Dh+Q5xeetG
         K6ZSFz6TpOv/oRBA946I+rD9b6tPiDYc7oRVtAXq/e3fq7/a0Bz+7h9II3OSLcD/yMkF
         SsZ604wo4FTEUxg6sql1D++vQ5kWGNnIv/XFAg+YbUpZgjtHtRQGHvFTlZ0MVvPAXexp
         mEdhELW5faDED/LGV+uWZZ/FcOTAxELF/746mP4+y/hBnKoDF5Cz4qvw86Txuf9wmuiC
         DxzgVNpWeVcc5auLoCTwq4iCPOZWu+0hHPLKMiwmuj4jZMLof803sFyeISayW+w+N1rd
         UYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862801; x=1784467601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=qznMOvLHrm+ZdBl0B1XbBV1LD8FClw/8thg9V2S79BNrr0bpLcU5LZcPX1fFhwOapM
         PUSsOfazX3psg3ybav8y1T8FSRIa5RWXOgTb4X+OwiESTqoYL3jlsJv0aik0LydRc1ZD
         sUlLIrJRG19S4F8yDsDMoVab8FUNRf1SupCbKwcpNmsRjehaialM1tOPPdWWMmO05STg
         ctEvVO8NXDJcV5XRfKi+nVOieO6qm3A6gDTjrI2rAH2/pqTKR44b76tq9L6vwtCc2GHu
         AYy+QwmbKPSH49z0RncUwsRyVytAewBKkAccZ7JXm2zzQOUhXE7l47Y3J65ojbiMteMr
         F8Qw==
X-Forwarded-Encrypted: i=1; AHgh+RreNQls39IhF22PUuFXZ1gGgsM7vJoCPHviFTMUBfOap20WSk7EjnZ/39cK+m/xhhtigwDCco9LHsLZr2mONPSg@lists.infradead.org
X-Gm-Message-State: AOJu0YyLa6cTX8oQ1WCOs4ZQxzQjYU6DsGdHZ1dvpWd3wPx4cP3WkzcV
	F5EkhgUEMQyIogP4D0V7xpj+fKIjPvq/UnTUAdDVsAyxHHYVqeqwuPwzRdHhiJW/4cGfT7ipdv4
	iN5tkziVVhy0u8Ov4sSTAznf2WTFF3Ds=
X-Gm-Gg: AfdE7cnmj7SUIO9yiTaXDfKju4sFCLHNRSnCzL7/gpaJh+OZDBdpuN3LDmURUGG4bsi
	LDUW6BUB7ISebclKLcO6em7wf8epTIVsSiKBatjTlXp4cqhtYJXyhWrNfJ9LENwx6jIRYJpHQbp
	ucRt0JbuA5oranV3NQTJ3HDzshwFrobZ44HMp8EkfzV9UqNjeh1TP1AD+N6jacJPRlkNQGOkrjS
	IoE/NsV0Iz4hfx6VaYXu7X4bE/BpKsO9S2E8ry6wq8/Hw9hYDTiLxxadypagiKxIUUJJdHRCn2f
	2D5mjqMCKfVYlJmkscr1j0EoOdrySQ==
X-Received: by 2002:a17:903:2bcc:b0:2cc:77f3:a934 with SMTP id
 d9443c01a7336-2ce9f174650mr52007555ad.46.1783862800932; Sun, 12 Jul 2026
 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
In-Reply-To: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:26:30 +0200
X-Gm-Features: AUfX_myC7hx4fjS4-JwPMLgRui-DB58_FebfMXfpkFKB1CdDAdfGxwKF54CFOC4
Message-ID: <CAFBinCAPxkEfuY8orhd=R-6+2-uxWmEDJAaZmnKjJnzf_kQqUQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_062641_903065_C7A79B56 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, Jul 10, 2026 at 10:53=E2=80=AFAM Sean Young <sean@mess.org> wrote:
>
> clk_prepare_enabled() needs a call to clk_disable_prepare() on
> driver unbind. Make it devm managed.
>
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The additional error that sashiko reported will need to be fixed too.
Let's do that in a separate patch though to keep things simple.

