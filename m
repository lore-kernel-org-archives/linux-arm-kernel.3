Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A790C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=; b=Dgss7JO0lyIU3zBqVhqAwDpsLV
	GZ0bBB6VCdSOOqSoJCNmSYSvFBFqqFfYOp3QLoNg7Qg2oZ1J1baEKiq3767fURLIQHz0pA1ukiTHn
	iPVj2guxrxAmllES2rxyvgQ2rno3oVRHHGqa888SIPdjliUDv8FxOqvqaJFVPDhJcpkwHhC5h+Ltp
	8doRKsCHbBwRKnbL8bI1lB+Aw/xdY7uKBviT76cb/JBZwJ2yODdOS4sPMbrQGNk4C5jcqIyAZV+Z5
	3Dr0BZKeMwQ76TfuGdG0T6xD/F0klFlZI+l++2U+umFp/9te6lgCVDA9lACyivsKxCaa6zZcLigtb
	hs2OpDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpP6a-0000000AMxc-2Ndk;
	Thu, 30 Jul 2026 11:39:16 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpP6W-0000000AMuT-3J0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 11:39:14 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-81062fdeaf5so10669647b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 04:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785411551; cv=none;
        d=google.com; s=arc-20260327;
        b=RUnfDa5cxUBQXIS3aFSBW+uhV1lOENVLLgDOz3cLehKM+SXjo0+igV6PAjWCAxS3wx
         ByWWUSvJpruRWOmNAnK4/pKHl/VyYN8xVvvRETEfr5rMvBh54ffnTYE8/0sQzVLSG6d1
         WwXALXUNImz6elpn1JePYLnQJyc9iBy3lfK/S/pTJllplja1dKzx8wO++deKJ5gEw8eV
         vD/28LmfTttMvQ6jcFmtAsHj7+X5oHyNJjukFWYImqmSz4wUXh495c8YgtMPWSbsqtX7
         cmuzXsvw15feVLrbe7XoYrEMdXnqQdk9ePJKZrUaTN3RlJJ3XwyMdd/q1t4POZNKLbdJ
         CroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        fh=AOqHQ5A2uEyO7uRxWe51zPvLOKmFiyppTxy0a21mRhU=;
        b=e2WE4gLfPXraUnZvXkpxsi4CPnLB2tsZTYDgjeZ8TIPCRsOyHuSpjWLReaTqd3GwUR
         PK32My/CQ1FJTz5J8fGJ4KyGfPqY5V+kBeIT9dTjpg83EaKkzdpjXV/no4kTVQixCKaA
         SscyyaPMp+2SruuVSeVV8shjoLkyGxxqOLpLiL5xlZvHCna31KP8u3GGLbQPyH9LH1ti
         lpw4TJ1hdbdzfNMi2rrrQVAV7KChvej9tw/noNd2GZcKxwSfX2eVuljnVvZONUeMp3t5
         HtuVsPNNZHwFPxuRW++ow/A4ahdasemD5Qxkd6Am7vs9aXpRXIH6OdhgcromrkOWOPCD
         aa3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785411551; x=1786016351; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        b=Ft10VygswMHpyJI6Oxs5YcS3bSVErOVAL1PbLrOx8/DMEY7zreDHNN8SglL5Tphb1g
         910EVn/UPh5wG8OflRSfP5Ox1bQZ3UHnNPC/anyWuvUv1/I5BgaPY19yxGIEDt20UGWq
         4OlQUJ1NZcKcSEGirXat9QITXF5A8xSd8tWZ73EdcUWgkhvPgOikt1q4N95GRHwwknwN
         bO+PiDu0UkSImWaZU0uq86ws9cnn/k+pzm/U+cl3+OVkqwfMgl36htUAAj3lZ1JBv9aI
         LeTgi07U6Gx2yZqqd8/dihStlMb1WtIuRP3ZEBKTlq1iqBiT7AFnpY9/2+qqIcRDC0m0
         iWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411551; x=1786016351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOxhSnayK8QxbrD63cf2oNZmoFkPournY0d5EVv7OdM=;
        b=EQeFOMeYtONhKInGSUotE1XVGeLhZQ5PeI557uh+KqgPu9DAfm+HudZ+Bo0QCnOchm
         HMceOgR4ocKkQjQ1w9wOvmVukt4KdcN8DTQBQzC7ybASkS7gEKeKeF9cU+YtG0nwbqDr
         XTkSzoHq5MfAaFXIZW8JUogWNidGjwkwjuo/jsiTcSIr3OIAXBMXRclse2YfKFDSc/gs
         G26usGWt56HeiLV/slC6p5R3/oXFamTojrzOqXldftzQXWMuM9yqMVP284UwjZgm25GP
         SjIl35qBXYkznh0r3gOMeXRvkTggbqyipS2y0uM58fooEUOqVJg83Ipjd2YSBh8x1Urq
         7U9w==
X-Forwarded-Encrypted: i=1; AHgh+RqLBjDCIzrQrM12fhulwlLYgvoL7UkmEk2X4TuUBx0QOP6NOw4rlWFRM6GYgQ9tJkXq4rFdPwVrCHFMeM1Zi/2h@lists.infradead.org
X-Gm-Message-State: AOJu0YxGUHUv5GrAqjnXDCBqJR8L5bjofMt34Ni3AYrIUepMJsUouZC+
	5lEE1I5YJTRNUFFTREO1PCiwJqIb4O9GnioNUwwJAwXIvgDbifM5NQhnRPvB+xyCYymTJ0H2ffo
	VdDwRBDPfd4ynRsEA8UEjn/gyCfQbc8+vZ4oNXgqLDA==
X-Gm-Gg: AR+sD10scCONqeeSwUtJuv1+mya/NtTwCI+cHWH1NmqwjCihM4NlHNfv+P+4YuiwRX6
	qEDytRryrtBYBXRnnhvXB8VLMvSN4im25zOzvlxDUNG9pdhALbxwNqcIjVN5xmNAa6opiZAzTJU
	Yha5kbCE+XvKe7OkV9tHNC8DeeLlv5jzoUa4bhm2K7do+Fn3mfKr+iZLhAjwCYuVieCKV3Z3yHo
	fvncT8/pqigWA29tOcwSzTGqi1vOILAbHYM9ECM8IbDIxEXgHSiLArQp6L1XXmDCf/NyH+wBL/d
	ZNBxFjYdKo+iISWVPr21dfuwruhyNffhthV/Re+xDRe3
X-Received: by 2002:a05:690c:6b01:b0:7fd:5508:b2dd with SMTP id
 00721157ae682-81fb97f7a2emr12051367b3.22.1785411551310; Thu, 30 Jul 2026
 04:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
 <20260727021048.3375444-2-attinagaoxu@gmail.com> <20260730-lucky-strict-oryx-9ce8de@quoll>
In-Reply-To: <20260730-lucky-strict-oryx-9ce8de@quoll>
From: Gavin Gao <attinagaoxu@gmail.com>
Date: Thu, 30 Jul 2026 19:38:57 +0800
X-Gm-Features: AUfX_mzaCwnwh8yAtjVvunPNaTB-XiGKKcyJxT9ge1AJjv97-ODm4c4wF7ehf-4
Message-ID: <CAK2JjQVoaHjzf4Z=_LDVzTj0R-ey1Z4T+1OF_xYACdz1C4yReQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: rockchip-dwmac: Add 25M
 refout clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, 
	nicolas.frattaroli@collabora.com, sebastian.reichel@collabora.com, 
	sashal@kernel.org, alchark@gmail.com, chaoyi.chen@rock-chips.com, 
	amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, horms@kernel.org, 
	alok.a.tiwari@oracle.com, david.wu@rock-chips.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_043912_844595_F67A3B44 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, Jul 30, 2026 at 4:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Jul 27, 2026 at 10:10:45AM +0800, Gavin Gao wrote:
> > Some Rockchip GMAC instances can provide a 25 MHz reference clock outpu=
t
> > for an external RGMII PHY.
> >
> > Add a clock name for this 25 MHz reference output so SoC dtsi files can
> > describe it separately from the existing MAC reference clocks.
> >
> > Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml =
b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > index 0ac7c4b47d6b..074ac274f2e0 100644
> > --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> > @@ -81,6 +81,7 @@ properties:
> >          - pclk_mac
> >          - clk_mac_ref
> >          - clk_mac_refout
> > +        - clk_mac_25m_refout
>
> That's the same as clk_mac_ref and clk_mac_refout. clocks are not
> outputs but inputs, so explain how does the device take three SAME
> clocks: clk_mac_ref, clk_mac_refout and clk_mac_25m_refout?
>
> Best regards,
> Krzysztof
>

This is not the existing clk_mac_refout clock. On RK3576 the
REFCLKO25M_GMAC[01]_OUT clocks are separate 25 MHz reference clock outputs
intended for RGMII PHYs, while clk_mac_refout is the existing refout clock
used by the Rockchip DWMAC binding for the RMII reference output path.

--=20
Best Regards,
Gavin Gao

