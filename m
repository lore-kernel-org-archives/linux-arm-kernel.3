Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28DBCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynx0YVdRpScOcVOUl3nY0Y9gWTKj9Ts8mNFO+WkHlNc=; b=c4fthpwl8RY1iXWX+4uMrI0Nf5
	iaH71KLNAOuWBF6as6kJtDY+QqXTNzEEgyQnu0R+B/bzPYlsWBvvqBIYZsIkjZbLcnxWucG7bbhEL
	wqhSImN24T5eC+LZ+PrhvLMbwU0ZL/m3Zf8mQWiIrpElwlTxIQ6b19oUDlgEIB/4qEsuc1FrS9r5u
	NQ089JUbdpqCrqKUa+iUYGstCwoZJhSMT7JTUmAoVMYnsgtbYo1Nf0v88KgEro6bpoBoVAWs2UT0T
	wdB/SHAnWS2ULrvqN9KeaTVWbZyOIDBb1LfLGLO1NRI3L03iGFMZ8eft2bTYfRiMtuyuAZ4+rMUBR
	BrmuenCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEF2-00000004BSu-0be5;
	Wed, 27 May 2026 13:24:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEF1-00000004BSk-2Kxe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:24:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0282D6022D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF061F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888250;
	bh=ynx0YVdRpScOcVOUl3nY0Y9gWTKj9Ts8mNFO+WkHlNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M4ZoD6+JXZamGLbvvzX/8mFPVFodp59z3BYZHOJ1maZT37ITWJ1ws8ONO9jIbUftd
	 LhBznDJJWgJ/U3q/e786ivP8rwVQtbr3RJRmy6qBsz0ICUZOKF6QS/jIpX3pL85Hki
	 SBmpqnhbtAvifobPfoWvZGlHFvxvtwHbn014qxWtP3eC7ft5ucRqNyM7sDgcHxJLzZ
	 CjuHGcMnd1dOC7Ya72IC7X4enemClLRXmDi8GBQi7DjBa5i3d4hQ/BgtcnHmfcskwr
	 iSmD9SSLkwPopili/8IrKg0QYxQQW1DIGqW3wIH4gZu6D00pC5ZOrV7RLY/I77dU83
	 JWF0LkIvryJTQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso6376120e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+D1BOC6YwxFdoCa8W28f+09umGUhAScWdc/zyDih3uvqhtH5AT75jV62GP74fGxs6OPABrB7kVfOyooQYweAsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf7U3kQ4lwpsff+BsIguNlIwvMgNkPr91HRSCOJwHXZpMTmfma
	rCNT8NG2mMYdiZvz/dyex3MfJmHKVHhX0PV31geoYWPghRh/4P3LCo1SEZoh36+sb4QaOHE+Z+N
	rgqigBkmRvjtuX06w3PMExoSO9qygvd4=
X-Received: by 2002:a05:6512:31c4:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5aa32369f4amr7061708e87.9.1779888249425; Wed, 27 May 2026
 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260508184626.15938-1-manishbaing2789@gmail.com>
In-Reply-To: <20260508184626.15938-1-manishbaing2789@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:23:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0QWoTCXEqZbm_ECV2YQdL6PBZp2+EMSVH6DrmPx=dKw@mail.gmail.com>
X-Gm-Features: AVHnY4LJ4ZgmIO12q-22xaSmmAdfwCpy1pxkuhOelzvqfy6Ynt81zGPLoHbXLKo
Message-ID: <CAD++jLk0QWoTCXEqZbm_ECV2YQdL6PBZp2+EMSVH6DrmPx=dKw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pwm: stmpe: drop legacy binding
To: Manish Baing <manishbaing2789@gmail.com>
Cc: ukleinek@kernel.org, thierry.reding@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 8, 2026 at 8:46=E2=80=AFPM Manish Baing <manishbaing2789@gmail.=
com> wrote:

> The st,stmpe-pwm binding is already covered by the MFD schema
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. Remove the
> obsolete and redundant text binding file.
>
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

If the PWM maintainer is busy maybe Rob can queue this patch?

Yours,
Linus Walleij

