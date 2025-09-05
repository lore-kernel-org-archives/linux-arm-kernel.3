Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49441CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=; b=fBNBb/5llxuQ24htA25qaflQQm
	cjnrMh50TFTRYR5YvPJpaGyUxtpMskVOCDWtEf0Mz/1cvr/yCBCTgK98cVrFBOdA5vA3aslw1AbQ0
	NLisEnqb9zqkAIL8wn2GMJl1LnjFS/TbNoFKgEb4w/Tao2u7CfrzqBnqLdxnIMVcov7xRHbSw+rUv
	rhPxJ6HCXm+QaKjyWmMsWrubpEvdIgiUEUPvYTp80K6xKIefO7zQ8B18CxYj7c+3HKcMdap0CHXnV
	Fp2QNqByvv8v6LAKEnDtl8bevjTbeZ2/KngMzEI9pTXro0VlH07MhuNANu9lUQP0PizO0lNsCromc
	w6xYnTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNoo-0000000GfGa-1BPO;
	Fri, 05 Sep 2025 04:12:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNm3-0000000GeJI-1Sgj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 04:10:09 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55f6507bd53so1841670e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 21:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045405; x=1757650205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=LxbLkjFeGp0kXGm+biVSgQVXYyM5JlrIhgy9Ixcr8NWFhnY3SAi7alKZFtl6Y++GYj
         IGmSbdIHLuSsI9GirVZSYoYN9KP4hMqYt1d0n+4NygL/loAoxDLo+wZHCBZYN3w4BZ/V
         WhpLaZ99bFD9ePzW4hJC2M9LxGvgMJ6BlTAYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045405; x=1757650205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=ZGvb+uBpFvViOLZQCMC24m+hpYPgSaBNbTc7fT/oog8y01QH14fl2HolEwGPZslRkh
         MoIslDMfdl6voyfb99SSH4TNFLzNmH1JZo6OnaZoabyVdzU84pOQ8+1EXAGPOR5aDOh9
         0nchEXCK/97z0VAXyszgMamTGmLilF07H9VJNSx3TGIwUKsdsytStmFzXXO1zaBQ+O8y
         u4XNdlVBYwkVmtC7eGaZT93RO1LPsKm9wCW63RJCkFFlYUngvAn0nyTh5+ngsMMher9a
         TnV2uDH6BeWc1z1EpRLtTd6nEr612Vhc4aO//+linFDf81GQCOCRP8b+AeD2pZMyg0Ov
         JLww==
X-Forwarded-Encrypted: i=1; AJvYcCXEn6hkf6UUNt9WbI8JZqRz6RUX6dlmVCMfwJNEPccCmPk8nA1Nnv/gENQ5ivcNOKYpoIZvTZghx308dlsrf69n@lists.infradead.org
X-Gm-Message-State: AOJu0YzBArlRuVjOwqm3prdeNkPuM9Vwr0DBUlH4eTBvoZT2BU5jNx5U
	elqtVhSqTD59VNQnvLtAO9Ywz+kQpEbCXe6r8E4HZHc4I35FTC9cobTjI33C+B+Au+3gG28BHlL
	ZUK4BBweGCLeKpa0AlPjCVpHTlmXtOTIEK0ti6ADn
X-Gm-Gg: ASbGnctb9VBx0fckvGpaQFX1CMtjVyeSrHyKe/vIGxf5oLoriPNIdtszE6rQQgUb99e
	SPkpUkxjB6yjOdsO0UC7Ax5da6PY1nfGS3tT8TuFEoEjPRdkq56SD+9kRwn86vMf95pv42aNvZK
	Emsredqa1N+qIwdaFp2quMfJDEEh5p2aCkdf+sHa/3wV8+w1C6xUd9cke7bPDo05povWCHIJG8V
	HD+7rRvZiJtgcHcUlJybIkPZ5c5HldEZyCqqQ==
X-Google-Smtp-Source: AGHT+IH7HKhnxC6o9ewQ28R2ZzX9RmDQokY2C+2i+wMjE8WlWqsz+BTU++rL/6Yzgiv59B7OTvBGnUhQzmndeoe72TQ=
X-Received: by 2002:a05:6512:650f:b0:55f:65f9:512e with SMTP id
 2adb3069b0e04-55f708a2a7fmr4251279e87.6.1757045405415; Thu, 04 Sep 2025
 21:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-4-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:09:54 +0800
X-Gm-Features: Ac12FXx6pAx7CiAA-H5MAQbshXKRXROm_6MtHlpf5-g4LpJf9Fu8XFakXK69rOQ
Message-ID: <CAGXv+5ELv9vR7i_Xd7XCC7gBciMXPfQfDAD1WyNy89=pJaLC_w@mail.gmail.com>
Subject: Re: [PATCH v5 03/27] clk: mediatek: clk-mux: Add ops for mux gates
 with set/clr/upd and FENC
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_211007_426708_68691985 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, Aug 29, 2025 at 5:20=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

