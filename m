Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7D2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byZsLH1qJnr5XUYqbpWssvf4t8TS4Pv9mhclLh+CHIA=; b=HuFvYPuQU0UJ0k1wJiDPWsqcWD
	tTZ8rFm7vZuIy76G2TnWPL74X0uZUnn/gRvZJdV4L+fs4UISI91cT/56WV8EfNk0MTlh+8MFi2E6c
	hYtkr1TG7HxNMIBty+j94L4drdhXOcWdvocp1Zy1ZRkDQfcgUSZS+7L3pglDpdlvd1PnNCugULkA6
	cdc6LzFf53rRoSiUx/LvXvVmAt987DPxQLIc3bng7vYK7GhD5W7Ru+uLp2Vlu7DR31CAR8OoDs2B8
	GFw9FUJjGr+WGLArMw/NWDkK7sejT4LQ2EsR4TsUKJ9Q+a7/ISLi2V0ZlVEQYPp/pFwi4dGjlEfT2
	TjPnTy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCDD-0000000FgOA-493B;
	Tue, 05 May 2026 09:37:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCDC-0000000FgO1-3Axk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FC0260128
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9704C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973825;
	bh=byZsLH1qJnr5XUYqbpWssvf4t8TS4Pv9mhclLh+CHIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VpJ7aJv+FYkJSmFmvhnwPPXv7pTTxYrV3Hu69+ZwvR1PP+1x/gVahlERL4p4WUWxK
	 pTW3b/4Koy2may53/so0/iCadMQkEHjnsjsfnns1tnqr+dvpJVBI2MVw0RlazIRsPf
	 PN+p2PpApn6KS/JvpotTuilvlB5crf2P5mHw4X+2U8g/DhDSVIri7JbMQdDLfsbGd4
	 Rgo/iPVw27OFFkFPcjG6bRhSnM63WhDrimYUDCYVCHpl0FO5tCR7jg2jyX9tLJIItq
	 GgJSB06zAcbdhcpboUtxMsO6OMiVNtk5RCY1ZeCH1c39N/2sWplzn+2s5I/FalG0XY
	 FHQRUzfwXoLtQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso52275731fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:37:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9C8vM0OsxJBWjAYN8ewmXpH8uesrR5ITpcKCYRozQhjkq1OWUTH7f7dqsHsKr4ggD+580q2wAK5+3cpjBOGkNW@lists.infradead.org
X-Gm-Message-State: AOJu0YxpX8ePAAMxugr5AGq6+bJhJD/S7CwWjoKtKHEXus/eNaHHc9ZW
	TmLNoQAW3YGVnSwnMFOFciI2jjq+mcN/ubO3OqI6tOZzgls+dT0d1w4r7rk99VfuIpsBEkkuWbo
	aISaFIpISR5Ktl12gDtSGgWRbB4CeR1o=
X-Received: by 2002:a05:651c:41dc:b0:38c:45f1:1eb7 with SMTP id
 38308e7fff4ca-393783ec7ecmr39396271fa.8.1777973824642; Tue, 05 May 2026
 02:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260428191029.809462-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:36:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVncsU3xmzRE2Qd2N-PvbwN2085zQ_rYtirJJHaxpHFQ@mail.gmail.com>
X-Gm-Features: AVHnY4KfHUdwiDmzBqLhufIE_2SrMZmBj7Ow-JJKquMo7HXRoyl_eHpQhojBhXg
Message-ID: <CAD++jLnVncsU3xmzRE2Qd2N-PvbwN2085zQ_rYtirJJHaxpHFQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ixp4xx: use phandle-based GPIOs in mi424wr
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Imre Kaloz <kaloz@openwrt.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Apr 28, 2026 at 9:10=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Convert remaining legacy integer GPIO specifiers to phandle-based
> descriptors in intel-ixp42x-actiontec-mi424wr.dtsi.
>
> All other GPIOs in this file already use &gpio0/&gpio1. These are the
> last remaining legacy users in the IXP4xx DTS files.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

I signed this off and sent to the SoC maintainers for application.

Yours,
Linus Walleij

