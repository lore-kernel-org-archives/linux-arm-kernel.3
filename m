Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D77CCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 22:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=; b=RnmdFC0B31J8MTBLdozUI4LB7B
	5SP3WNiJE8TVdwVzzWwS2p2dbXvCxLajdABkCu+N4BHAgiFCDAl99JIjWuX8AXlugGNvu72mv0BIk
	4El7mITx/DtJaHa+EOGfOJY/Akigmj7XyY6iapmJmou5W1+K0dk0T+rfAMxAMX2vMiSsx9x5PNGxL
	Wz6n3qFkwqbpn76aFqWK6KBVWf7r+cdMMCpeCOorGmziUvfxVWVrHUS2bEjP3Cox6s/xYWutRwd4N
	E4MOVOIkHqj63LgprsS7T8xLlVgE6/aGtWxhQHB0IpbZcgaJ3a7hY6PSsOyra81Soara4UBIuERw5
	RY1qQNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHroD-00000003Xnh-44Mc;
	Sat, 08 Nov 2025 22:53:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHroC-00000003Xn6-21VW
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 08 Nov 2025 22:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=; b=ZlDPQnpr+LwISks+nfggrW6UGY
	h+4yzkcUn2Yx95+gwjqug12j1FDE8nImxha82X2Jmgz31gW1dHX06nBBfi8rt2qxEs9dOHohQB2Hg
	tRLMLCDcD5G339TnH4lUgKTvwMl879N4xftxwvF3YAD46ulsSkm7cswy9QM5BGx4uDpCIfEvNgGB3
	Uh1P2D0S72Qgqn2gG7AggIGQUge9xv0w0XEk++yOuThn3zVxZpDuSkOJUQTAEJTi0PFgPLj3Jrhl4
	L1hGTXwe3POpz9RQUtHAM3MLeoWZ1N0hiPEzJUtlLIah9blCnaQQbgk/mdjYJLphRPo+jInMrf91K
	UZ7BoVaA==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqwT-00000008TUa-1ImJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:57:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-297ec50477aso3360525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762642399; x=1763247199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=;
        b=MP1LzkSpxoDzOp/6PptknOYIQaSDsP3jJbh9numAS5HTnFDWbtPgmXLt/e/NCcx4FE
         D7iHSF51YzW3KC5INNC/CQD2nojrEhMBsn8nP384TESXotePbeSaD8CvU+/xOwWD8KAU
         /E7hfsvnpBCIu9MwZF9JXFhuKZniww2xAxXfwBLgSGx8f1gSh1YjYsdghMPcgQbyBoIw
         AT+3DebvCOyxI8FIeZim4Y353XESL5jy5ggxZmWLMXE0IfZbFcez0uKy0vrRqrk/6TrQ
         +PY62z84eHAel5KWXb45DPLQ9xbwxu7Vqh2XFwXTw6r3EyL1XRC2xBrsKIWnFAsaYvwv
         3/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762642399; x=1763247199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=woeNf9SnFDKMh9COMO6hWAKnDrWNbFGLLR+aeDPR/i8=;
        b=fUlslGlAajtqiKuyCQAz7TEMGWbpGFzWk2bJlChrpCD4PqJy4B7a2F8HD+UreEHl2s
         WTkgpNX936F2U91zZXog/PijIl4K+a7SfY05Rs62yKYMSz0fRO/3Dgi+uXNn402U9NIP
         9G4vfxArckIDxXdbTkW2HXsRYy4IJzMjhZmB7A3iWFarHq7W4V9ME/6pl0iO5Q2yUCFE
         Fpl067fhfQBkGFyQe4zJoVyPVuJzizywIBqo/XF5zl7Y0Ab0Gi26w13yM9Of6SOwedb6
         ASxt1ucZiZhJdE7rnxKXgSx/WEvm5pf/5KZ/ZNIryMAU9/jIuY19erDjo4xwAzIme/wl
         Yn4w==
X-Forwarded-Encrypted: i=1; AJvYcCVME7YgyCPXWK3N5U1F2jwEagFr43e9WWDCxFz7UGHxmafob+5gA62ih2ujjrwVr0p/njv3OmwXhav6kV4vZUw7@lists.infradead.org
X-Gm-Message-State: AOJu0YymqknPdY0i6e9oBEJj9acxmz/Qtum36QhIPIwjTLs0Qe49NVqo
	OHyDqWMv/WnVrmU/vSXtXdpRig8N20xvV/2kq/AR6QKjUl8hUhazYpYvELpSSwYpL89zAei5LRX
	Ev6AJj9TztmTtZBbayee1Fqlw7D0tOw0=
X-Gm-Gg: ASbGncvt36NltVuNQJSpn4/0HMz87Nz3GeWmfxG9EcnqjIH0pFrchmnUn365LN4hpHZ
	iPj8CGGIC7AeXWo1a5sEbneiPqzET2IB4Tm+jg93oo2fo2qXOredgO1tHnfNe2nNL1RcAYXWLa3
	hoCrVd4VUGDJKO4XxQQGIjFPXaf4Ax3PBVSpUNcsiqYtkE2kwuRyeZyXbBVOMqF6GhzIfc3ZZhR
	TMzL660CJSYz+zqHVr0xo3GjijjnJ5Ibo2SNZYYz6UzGq3XuAp6IHyky8+DdrjG1n616gseiFOM
	muCHs43gNKMD53R70doPa5VDPIvg
X-Google-Smtp-Source: AGHT+IG+/PJGnDmxUNMI7+aZcN60vo2SoWlora4RSCXqNkbJIUjbFrzUdNRAqKB5MSZuajIzoZgImhzbTKgTAYjlkVM=
X-Received: by 2002:a17:903:37cf:b0:295:134:9ae5 with SMTP id
 d9443c01a7336-297e1e61caamr46129275ad.24.1762642398835; Sat, 08 Nov 2025
 14:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com> <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
In-Reply-To: <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 23:53:07 +0100
X-Gm-Features: AWmQ_bni7l89RyP8uXpthsz3XoYRD2BT1Es7uRWB0DG1y_IRoUhPm173lpNSDGc
Message-ID: <CAFBinCBy7vPq0oX0PQ=yC5E3Mx3sv6qdVHsMh-NQQzAkbDuvRQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: zhentao.guo@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_215753_519023_C26172D8 
X-CRM114-Status: GOOD (  16.14  )
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

Hello,

thank you for your work on this!

On Mon, Oct 27, 2025 at 6:42=E2=80=AFAM Zhentao Guo via B4 Relay
<devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
[...]
+/**
+ * enum aml_power_type_e - Type of decoder power.
+ */
+enum aml_power_type_e {
+       AML_PM_PD =3D 0,
+};
Are there any other power types that you are already aware of - or is
this added "just in case" an additional type is needed in future?

> +/**
> + * struct gate_switch_node - clock node definition
> + * @clk: Pointer to clk instance.
> + * @name: Clock name used.
> + * @mutex: Mutex lock for multi decoder instance.
> + * @ref_count: Curr clk instance ref count.
> + */
> +struct gate_switch_node {
> +       struct clk *clk;
> +       const char *name;
> +       struct mutex mutex;
> +       int ref_count;
> +};
Generally I'm not sure if the whole struct is needed as I think the
common clock framework has everything we need.
There's struct clk_bulk_data which allows mapping clocks from
device-tree to an array in the code.

drivers/staging/media/starfive/camss/stf-camss.h for defines an enum
(stf_clk) to access each of the clocks by it's index in the array.
You even seem to have an enum (clk_type_e) which you could use to
simplify the code.

My understanding is that one can call clk_prepare_enable() and
clk_disable_unprepare() as often as you'd like and these functions
will do the ref-counting internally.
So I think the ref_count is not explicitly needed, as that's managed
by the common clock framework.


Best regards,
Martin

