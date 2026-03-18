Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8839FCD0DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=; b=dyfgzgcpivKIq2zThAZs8WdnNC
	KGt9o9DSh8KV+uC7xTwg16Aac2TF27bfMboDhbnIHHspxPS9sfGjQMHQEez16ziMVx916eFQz5rUB
	oJngSrRkZ3xjTVjhG9dOe3q4t2ROntz4F9TB21s3z4exUdwn06+oquTW3LeezJoo/3/pShlSpTT9b
	scWWuwWV9mOAXVaxNn4Bzc4FVLe6cg4sD4ep8WcPierp8vbyIpxyiomVZDzdYLVST47YHsWSBYpYW
	FLqmYikBRZQRIfVFmffgqyH9Juczbjy/n8lpzin6jntPoFR3o4jWvzM6l4u8eDYXeFY+/PzoRL5jf
	x15QpboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mIn-000000083EX-2liA;
	Wed, 18 Mar 2026 08:30:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mIk-000000083Df-2S9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:30:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b96d784828bso983781466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773822648; cv=none;
        d=google.com; s=arc-20240605;
        b=TJMyMNFo2zgrXiBslEsNqALfcm5PmEEq0JE7RvG/rQD0Bm4xeg4ndZSSxZs73M59b/
         9UBVHs0XXib9xFOo0vBAAyYJ0EKGJNYsc7MBpdv+SptkbhArq8iikvzjW5vkPm7Czw6i
         O+TF+2Gq9tuebhmPgBrxQw3UI2VVVFPPkot5a0C/E9ECZw1B89pP7+pA6LGIxsRi3Rf3
         nZ9VmEfW4FfnbUL/I8u/7ef98It52kbk5gAMWs69DHMlXY7dnCOl9NXUoZBitxKudbm1
         L2Xz9L7K/533GP9fwEQZGa5QO+lO3gUCwMN8qcE0xciqu9l627fXbOjOiQXEJMxNnuC+
         qXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        fh=Y+xBlsIN5bpFQ0dSN4CQwVlJGg1Np3HVCe23G9UIHHw=;
        b=ItCwtgiZTXyDAFSDyrHD8pstugJP7gOStd5lIe9UqCqw9fOiQ23sRbX6EO++aqFyJK
         9hkvy6lZ8+1UGKWPn97ebd1zDUqkctWcqGU6qUBb1/vZmqMn9o89+S8ej2FwuOR4WB7q
         dp27cQ+xZihCFfYz0O+4kdm1AyguPW1Xlh91roKsOqiItnhi9DvuRsEqOhgWyKDmri07
         mwDQkPrJNm7n+/qM2UObmx3atQY871HPdGYEfbb3BiEShxJIVxyJPkJ7gKoYm3oqFpYV
         1iUw/7/Z9kKA+FQrOotoEUFy+gBoiga1tyww4+L5N+KCZ1MyEM7IC5lX8tkjinmc1SnG
         Zpbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773822648; x=1774427448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        b=WhD8vneUPtP/U5osSH1XQI8WYaxS31JWhuL3IT7LsIbeT9GgNXe/pf6skv4PPLLTZU
         fvTFXAUNxXtTd1FGEa6VQ7Q8bBH6MzN28RlTf2qljFTJdOrYbvsIm8M7Mi3arLRLYZ2V
         +GMPrU4wOJ7sbO7qdgKE87SliXZ07HSgKV3Uy0L8U27rEQbpGuVVTP6A2AlcTvmLtsKi
         t5Sza7Pa8nYKCYJekvnL4bqbhOMgCD/x62C6OX0Y9bVBuKJet72YeHfawk5+bJVIjh92
         Qisr6El3nSbolUGG4bNvO9Chv1I7d25B006ACbkRER/3w+dVxVSv1XLNmftf3C9dXA2w
         rXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773822648; x=1774427448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BbWR2/gQozMOlanUkb5RxqFQxqhUpLHTgJQy5vCFP2w=;
        b=iiqmDKK0Mwdp3XoV6iBfc1YCev0GsNEr1Ynh0JAi1uGRBOemvbg8G7W6L7M4G4DBzB
         jxbWdCdPBnxNoKbn1S5jXkNNPdVHXTc+quxeNe08zuTyOnm5fFutKeCbgWTdtbvNEPfl
         ZGdrqga8atl6nva9/ttOlC4yF6QNbVBT1BkGERa8h5ajR7Mv4XKBklqCKzcGoDdXWlpS
         QKPgVbkvLwQOBwCvS2WWadT1HISo/A4vJr/4a47U02EjRjmpucPfFrcVD7hhNOR8HRpe
         vNNXSW3KgP5tgwOz+RgxkMYNYKhX79AJRihn3Wl6ki3l/Am6plaWa2e+SQ6C1SflNSUM
         469Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhYB7hyBwMYTBNvOBHJjbsGOIbUmj4H/LPVoMCH5GyyDB4t8nItDxZuDus9ZDb8WWjIQK1dtTasz/UusfxfTtJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxoW/Klu/lSpCnRQzYxCUiu/71nA0XH6RS6FLtUGxTBYpkJHVYk
	gf/keXK7750IgFbff7REEYcx4YQPISZztgH81bHj9lZc8OMTniU/siu3JghdoZlYyNr1F/PN0vT
	cs47Z3rE1aQ6SnAD4Yl9sGLJQOP8cYlCc2ot4uiRRHg==
X-Gm-Gg: ATEYQzz8+eoP4pzjOWJG3f0GLa453wkS7zMZOCtK8r3K8VhQQ2T31K/teYHa/3LsRkc
	LWcDEQhhjytmqkSlCk1CS09E91EyUHxSky4xQUiO9nImVA8dZ7geZSPGPBPHK98/9oRFj6CS9bs
	Ntj1aLA2S/EGlbZY3d/ngmf+5ojaGxCwVcn2rbF3zQFLven4rBQZYEpNYGgCIN084ZcLJNSamno
	Jn+bP9W7nJ/2oYOJ4/P1sdvBjRhsxYFiSHXRL545AXDZuFOX/169i9qjt5kNtSI6LmfNmhHMdNZ
	CGsCZYAJ
X-Received: by 2002:a17:906:560b:b0:b97:b6de:8b70 with SMTP id
 a640c23a62f3a-b97f4a83971mr100061566b.45.1773822647758; Wed, 18 Mar 2026
 01:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net> <20260318-able-goose-of-downpour-db3bbd@quoll>
 <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org>
In-Reply-To: <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 12:30:30 +0400
X-Gm-Features: AaiRm51FSOw7GXPkE6PrP7Z08J3AwH80SUW7rhgBPEdKkIl_8cJ7xjS_zqUlAVs
Message-ID: <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Yuanshen Cao <alex.caoys@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_013050_649931_405BA6C5 
X-CRM114-Status: GOOD (  19.37  )
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

On Wed, Mar 18, 2026 at 12:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/03/2026 09:17, Krzysztof Kozlowski wrote:
> > On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
> >> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller=
 on
> >> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
> >>
> >> Add the required DT nodes to enable basic HUSB311 operation.
> >>
> >> Note that for full support of mode and orientation switching, the USBD=
P
> >> PHY schema may need to be expanded, such as in [1]. This is left out f=
or
> >> now until the respective schema is finalized and merged.
> >>
> >> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cle=
anup-v3-1-3e8fe89a35b5@collabora.com/
> >>
> >> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 +++++++++++++++=
+++++
> >>  1 file changed, 20 insertions(+)
> >
> > DTS patch must not be in this patchset. Don't mix it.
>
> In case I am too vague: by don't mix it, I mean - separate DTS changes
> to independent patchset. They cannot be combined into USB posting.

Thanks Krzysztof. I will split them out in the next submission. I
think it's important to first agree on the use of fallback compatibles
and the best way to handle the (already queued up in next) ET7304
patches this cycle before their bindings hit mainline. Then, I can
rebase and squash/split everything as required.

Best regards,
Alexey

