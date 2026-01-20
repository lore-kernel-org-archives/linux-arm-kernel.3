Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAE1D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=; b=MhRnQxS2hijLNOXkRi1ojm5Vr8
	SncgK0JAa76EI7DEsiUslI5k0TRuyXHfQp8TwJIDDepUSA2zeHACVWwYAZGsImN/6WWcKAHrQ2cWJ
	ZxIWmBIHJpMovM3CQaKMgwxOLODcY2P7rqDO99wPiYcAciZjFqUNp1xiWgXoV9nxta/oxkdfpDEbz
	I1GAtK/xtffbZAj5RfnGLUBDnY4QVrRxHQAqRtpoCWnEsmYEKlFl3HG3uY8gskx1ZUV8Ip4l61DMB
	zl+oiWkvt22DBX5SlwAP5tn3nkTV1KCoODLHVpNstcS0tKRKXFb65ZiVuYTj32XZR7MnU4oyO9Jdp
	+20A9POQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA9k-00000003k9v-3IWg;
	Tue, 20 Jan 2026 11:44:20 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viA9i-00000003k8h-2MfB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:44:19 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-124566b6693so7068811c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 03:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768909457; cv=none;
        d=google.com; s=arc-20240605;
        b=UHW3fQ/usX4Vq6sI14fov/pu3M/qRft/7pnSZG3MvKk1vjCISL06rLAiw4x0ZQrHdB
         +r5fRnIf5rlb3CdnujXYjtQjODZ2okm/0D4p3CfmmSX+qcY+qvn16XBXc1Ni9kaJnJ4f
         bd9y+5FGymwpF1T5cGDkR7Zqab0Wl/DWefnPRfN16vZDNnkC69I0G6P+UnP6DylFmBUt
         f3xn1ILkevEUw0A/dflZeEJOFN7bXUWV62sSJJOos6WTLgMQ8vCjRnUoYP8ixomcALjg
         +ApWzhuOfwl6zD6vNdd7XYr8KOoeCt1iPAGLnmqrRCWbjhn6h4Hk5r1JzC7hMIm5strp
         zrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        fh=rWN8tzJEYp+eIPVx7SMP8Xkwh4APoDWvgsoEbR0W07w=;
        b=ZP8Dz7eqM/VtRQzSAVaTURHdxL26XFnE9IvRK1OLkaZHYPip7v3c1r5NRXKDXt1mkr
         nfb9CBFCT+S1WpZ5ncMB+AFhtiT6ERplVb3cibFSpZ/oGpHd8N+9WnohmIs5O/pBJHv0
         aKh4QzSxEPloGSGB9UWW8WoyrQ51yIW0OuE8xV7OlnkgYYw79HGr/O1TT8/7rG1B+Gxm
         GGUEqGgsVP+OVLYdsW2ty4iljlsW5yenTLhiTbSRu6hKq7TCiX8qSEV5LjACOj0ob4Ne
         6rJVyk6v79kzu4rz8QbvPAjVJPKoHaFvdgHVJak4P0yBXxk69wIbghSNzbpVLEDTrd12
         53Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909457; x=1769514257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        b=RlzPRjXDSWyTbe0Oiqdz5vJ5HDDcBrpR2GuWJrRwZCxOwy0LHCxRPMpN9v6TaCbZVQ
         IFCOwTBYMawr62iGg4PadPFkV61W53S7Qm+Zp+7tCAkA12I08o1RQcAsCPzAdvVnZV01
         iUeBgnUDnWDMPcYfDHrDvopkkXPR0OC5UGpj25K4jOEK5uWmvzWABLBkdvIp5L6LkuYH
         peY3YoRfgoPvv2Q0C0KKZP9sXcDSyIektDisBLh3naPknIzRQElgLew51j5e9k+vEEZl
         9H3ZNLyjGUjyAk8Ty0v5EI+yAIXAJmHAPgptb27LoQOHYRR7gmmedu3Gpl3y5Ve+A2n/
         oIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909457; x=1769514257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E86ZXdE770Xwovkl6IYgj3eO0oOM7/ipyrSNGJ5VLkk=;
        b=gH+G/BUBNnZsjwZDvkt2OxZgKd5B1l3R/ZqDbnvpEjRgGhY/YFgKxJha6evsy6cGnH
         L3Ekgwz8HDW9PU1UavudFe7w1yYvjVv1tVqunEFz3XdjTFKEhrtYl6sIsC7qjuhknFDN
         MqZx5EPTTvLJMWuZ0/zmv2RUDnEFUHAl8Y4bfRI8vSzXEAjdVNChVhWqDedsvCS5zu+R
         DnqHRWQaMmXL8/RbiHNDa+/nsTkhQNoOIdeZcUVmcfueaRe0rNvmOXMsFUEDKgb/2UfV
         xLKcN44pWx+1U3KmKXYEkUhGJ4zrYuCyyqlJLemyQaCbZFBmF5R3TvwG15GHjO+aq55L
         hz/A==
X-Forwarded-Encrypted: i=1; AJvYcCW4Z7TkbKfHY6IIM02TYE0NEDIQ1NTdTu2DIUge67cuPHFjjmxH7xdNxn/ruS1IgYpeoqcDkSM+0r4BcgOZECBq@lists.infradead.org
X-Gm-Message-State: AOJu0YwSkxsZAOfGDSijrTjAgrLXUhK0s0bt1s+4HbWiR7YH3oJKVHQR
	DnMwkN6fQy6lpTB1/jzh4WpVzJs0UZ+1XyGxC7YYhH7tnrXG8L8MeI9BNVpqBBhsulO9APnQ8q3
	dmkbO4if4RcKMYQ/24+zrtHI3XCDCluY=
X-Gm-Gg: AY/fxX4xNVltK+cgnINBi997moa8265laiBsTqao7KMen+ZP7PR8MMHmHU6WluR5Fur
	LHQjz4hpMT7wRjtsjENEctPqWZ0xrnLUCzl2eiCjXVj5+S9CTRwm3GkIfl68ljnPmXRCdenpLlb
	UFbFxqMHq66nxOfDfnPN0Yywj1/FI4uHCUqLKyqey35d2N9RTTZpnoVEjCD/mg2DQnc9hf3PI51
	ul0OHYPUCOK8+YkGvpkXid01HDeC99ywrJvUXs23glSCez5P4K6IDNALwEs9mekxEWXMc6Ic/yQ
	PNrbtzLnWoVszh6jWdNDKAcaPyd3kZSbqfOgEwYVF/S61NTrhtuFN7l/9N9cENJ5mbJpCBf4ThW
	2YM/GNZYRQA==
X-Received: by 2002:a05:7022:4184:b0:11d:e40f:ee69 with SMTP id
 a92af1059eb24-1244b380f9dmr12491059c88.36.1768909457416; Tue, 20 Jan 2026
 03:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
In-Reply-To: <20260120011757.1387140-1-hongxing.zhu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 13:46:57 +0200
X-Gm-Features: AZwV_QhZ2tV6-Vbghh15PVnUEIiWGUBvMJOKoCcTwI3NHHV2_Ne1DbptDmWuXU8
Message-ID: <CAEnQRZBpLxM289h=OoZA5Dx_pDdG6Ude2wam+sULb=www68uow@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx95: Add fsl,max-link-speed property for pcie-ep[0,1]
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_034418_601334_5252A7C0 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, Jan 20, 2026 at 3:21=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> Add fsl,max-link-speed property for pcie_ep[0,1].

Hi Richard,

Can you explain in the commit message why this change is needed?

What problem does it fix.

fsl,max-link-speed  is an optional property with a default of 1.

So it is perfectly fine to skip it as the initial patch does.

Thanks,
Daniel

