Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C0BC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=; b=HliNXmb0M1QKvpsaV5cc0OSuGA
	B7m9TA5u7/FZeG4ljbuCB5Phj5Q8UzOKwLdDX5zn+oLS+qw1gEpEPwIs0NcNGBNIl9t/YABXzxGTL
	RkpN9Ka8RqnLlovd8JDJDKd/0ZN3/NEkWiumcX5QayUS1x0vGKvtf5BBvGU2T4jyNdYBV1O74KAGZ
	P8k6CngyxNWZrQ/TuMQySFwDndd5/cPAGchSaKGcV8jSaI7ULHHQ3xxgsYNScKNeaRJWW0PYkRiiS
	fMJX6hIqIlv7ET9RXcBNPg4juoFxfpSe/2HDj7f8y775GpeI1Sy9wPUAFiEoy+OU9EYe4EwNuVl8v
	M1UsPj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOoN-0000000Bgwu-4AgA;
	Mon, 10 Aug 2026 12:08:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOoM-0000000BgwG-0j6L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:08:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c2020421077so276887366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 05:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786363735; cv=none;
        d=google.com; s=arc-20260327;
        b=BxCETICYAJobrpJ7zJBijA/gHcF1DYmKSabPyVvVE8psHTUO8VpbhdQE8Q5zD+LGe7
         Q9F4t8Gb+OVBX2Skylk3kqp0MUp+Zj3O9PTfHMVLVMsVQKBt/Mu/+SXeL80+qqPaIwZY
         hjlcrM4LHra9kl2M5dbTPTex/jnhti5BP7H5t+czvfIRe6TKO6sY5rV1JYVuNRwZRlzw
         L5mHCcj4DgPFPj8XKkXKScJ7Wp162280SWRI805A9qJ5Zcu9/H55/OPlP319QUkMXTVM
         i/YeN/tODeuQer8ftffqQ4hu83LdT4VdHrV5WpDE/cLam1EGifW/jg7U4/w+smKKyGhF
         zmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        fh=ahdSZ5HiFwKKiDH4DQP4jSTOaMCxw9IW8N0Pixf9epI=;
        b=YV0GFqk7iTF4dOzyAJ51t29uYCvQl8GnCvggrCPjBS8A2kihBWTNSSM45oULIAymuq
         /Jat7vmRIpYYQuzbVnJhBCw7Ffr6+Dz4GdtNIB/syxfdoFDIQ2AOMmxHlV2XhhxvAqgE
         MMHJAFAzJF6Blpxg6+8VsCpWBalxjsna/b5V02snqUa6cLMmRVltXNEfTDjPifiapXYO
         nQV2xPeZIr9GW5878VmaEFo/64WJHTqjOKmN3uK57WPuXuwwuDki1fOVp81/0/rpuWi7
         to1axesZX8/Fn6DBq0GNSCs1UgJ93awYmXYebv0NDu7JBo94yV3MMLmfav+0ss8tpYk7
         80CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1786363735; x=1786968535; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        b=bXYcCsYuvXws5MiAg75L+M0NZyLE0n9DQoXiKiOGVXJnqzU0ziOveH3k5fDysGqgUq
         KgoC6ESVLuYILxwIR7gAwFqrrKaKeig479BwOFXjq2o58J7R7erSEwCm+1iGVQqGA+KQ
         hcH02QKTM95HKsTk/3ypr6T9jcMUyKAn2x9GTpSqma+hLw7ngGdVDSNxH5Z+/P9o15VC
         gIZt7aDv2NzBtX//HepjdWiWfIF37kYtmkdYD35ji8SJThxsiqR1kd/pGoEJ4jh6vz1w
         fQgrqN+jBX+iXomjoUDg6K0bKXfRIYkiLbk2rbw06S8Kuzh7lBTt173t4hKkZyP8Jgxx
         5uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363735; x=1786968535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQpWbJttwi61w+33UaX9aual3LIjiZRDlQt6M32wCuQ=;
        b=G9c5LhQ0DG+LTfRuuBO1P1y1XsfB22RDKMfh0mz6/me7Gklwv7Y0riLpuxvhFR7sCf
         e/ALAW7n6yeYorPUrNLyOlpb35S3oIz7vVv7P6mpYYeXKjL58Dz5Hr2GBh1RbbMhiqJP
         KlbYhQsjpHpYvwC88us9NySqpBpuEYjSAMlEI0V3KqtwDaSr4Biitf3tKBCcrbdN4e8d
         Qpc+spW0grNfeJzs/VIURM1E3vkTTylDF2OlxVYKHs6WG34yYEYhOg4vMe4OSonEk/G4
         BV4f6J8FqO+fCRm1Ub6CTHgPxP8y4H0oy0BBhKqR3Jy6lC8re6SJJlaQ0oWivpbWrOFe
         fkQw==
X-Forwarded-Encrypted: i=1; AHgh+Rr66/AnESSGQdbmwRb1UDmuXLhiIeWY5Pqf4v3z3FvwOmw0dY8ViCoKhD01jEI5Dg9B0MbjhwqaOI99sEyVSBnY@lists.infradead.org
X-Gm-Message-State: AOJu0YxA/XKZdB0esxGFItRn6LKrOVm7SlvFEEKYmAWyKIy/Qd1oOb70
	4pri2QOvv0CRMoHHSwKloCGuyUVyX+/Z5LaXWv691aEj8+xXgfc4pjn/8M8fA+Jz1RwwPmXiCXh
	FRvEsu6T6FcDxUFTUnzlkJfBfKhhEarKt7BKroIxj6A==
X-Gm-Gg: AR+sD10q35BpHAmjFrESUOsrkcRZtjZnourjG/bJ7IhZuXcM8iRf+e5U3r8Y+iY1pHa
	rAVZL8zTfeW3YQYH+/oT2rl23gvqAkVA9CvI3JEGMaAZxsKJ9VqIJqFkL1cTQ6TfJCTh4M7c3oV
	VCiNEH2kOlAkzFUjjAcNENO2CfJHGPCjoB+EgpEvq2jF4cOCcQXhTex7em1Lcxi9hEZTaANCItQ
	LwJJf9hX95rLxyZauOa5Y2CWxUwhPkKRScIutFfsCruFab+VmiKZZ6ROO+vogdb/ZfdpBb60y2D
	UGlg7tLIeATjMB3jcAuMnea6dI6lShq29YfVkXQ34lUsnu1oXq98ppo+vHnMHXMknb22wWiwWFj
	h
X-Received: by 2002:a17:907:728b:b0:c1c:4858:251a with SMTP id
 a640c23a62f3a-c20c6782f60mr50310366b.8.1786363735166; Mon, 10 Aug 2026
 05:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20767137.geO5KgaWL5@diego>
In-Reply-To: <20767137.geO5KgaWL5@diego>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 10 Aug 2026 16:08:36 +0400
X-Gm-Features: AUfX_mzk8t-Db9KtlR_l-8Y27DWWGagvh3frNOmzayIZmNSq8DatjvUHckrxFLI
Message-ID: <CAKTNdwFPhVrjb4iVpN19f0Nw+MA_BxXLOLs4V50fuyf+_rbEPg@mail.gmail.com>
Subject: Re: [PATCH v11 00/21] Synopsys DisplayPort Controller improvements
 for Rockchip platforms
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_050858_264257_BB41C742 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Heiko,

On Mon, Aug 10, 2026 at 3:49=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Sebastian,
>
> Am Donnerstag, 6. August 2026, 19:02:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Sebastian Reichel:
> > This patch series updates the Synopsys Designware DisplayPort bridge
> > together with the only existing user: The Rockchip RK3576/RK3588:
> >
> >  1. Follow-up bridges (PHY, USB-C connector)
> >     This is needed to get USB-C DP AltMode working; I've followed
> >     the Qualcomm driver as reference
> >
> >  2. Runtime PM
> >     The initial driver has been upstreamed without RPM; add it to
> >     avoid wasting power when nothing is plugged
> >
> >  3. Audio
> >     The initial driver has been upstreamed without audio support;
> >     this adds all missing bits for audio with single stream transport
> >
> > To properly make use of the bridge code the following USBDP PHY series
> > is also needed:
> >
> > https://lore.kernel.org/all/20260714-rockchip-usbdp-cleanup-v13-0-6cb3e=
769d4c5@collabora.com/
>
> I've now had time to test both series (dw-dp + usbdp) :-)
>
> - On my 1080p display I get nice output
> - On my 4K display I get "some" output after increasing the ACLK_VOP to
>   750MHz - although the output itself is garbled. Before there was no
>   output at all

One more thing likely to go wrong on an otherwise unpatched kernel is
dclk. Could you please check what pixel clock your 4K display mode
wants? I bet it's not the 1188 MHz the default PLL configuration
provides.

When my colleagues and I tested a previous iteration of these on over
half a dozen Type-C monitors we could get our hands on, I had to patch
a whole bunch of PLL rates [1] into the table, and reparent the video
port clock driving the DP output to an otherwise unused system PLL
with fractional capability (VPLL in case of RK3576). I'm not yet
trying to upstream those rate changes though, because our prototype
board, which we were testing those on, had signal integrity issues on
two out of four DP pairs, so they need additional testing.

In my experience, any dclk more than 0.1% off the rate required by the
display mode is very likely to produce a blank screen on DP.

Garbled output sounds more like an artifact of an overclocked VOP2 though.

[1] https://github.com/flipperdevices/flipper-linux-kernel/commit/a4c8ce773=
b069672f0dd4ecb79711bc7d3319b38

Best regards,
Alexey

