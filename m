Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D18C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgGaJaPa/jEPScVXsjWC4390D+TFpvglNfRjMg/X9O0=; b=ewdRYcrp1KENzq7TNhhdhFIZUZ
	rpIV9BxIKsrnIwZcn+Wj0ZnpoEeO03hYzb6Xo/WB3mgd1leowpKB3tzD8WktlaVYoIEFsMMo4+Qkj
	5Ywuje4+1VT2KtWj300QE1nxnRxHG1KBSS1HFJoTKJ+hEH6r6giWvZTjd7pLo0Ig4z1t15RMPV4g1
	ar6IeHjAQLq3dkFvy8gDoC8REtaARwiNsXqONCF1b2sbb1WtlQWEQIDNak8Yat3uf46NupA5/ew5T
	/gOIyLgJ6mRkmIBDu5YswvOrhRCDnzk+PGP4MAg0aK18mYdH9EGi0axeoql1toXcGjoEOxxXM0HGe
	So5bN43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZXv-0000000EVyI-3VXp;
	Fri, 21 Mar 2025 10:24:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYuX-0000000EPgD-3eIR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:43:31 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so2051536e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742550207; x=1743155007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgGaJaPa/jEPScVXsjWC4390D+TFpvglNfRjMg/X9O0=;
        b=sWl81rV4Z2IbZL4sOG2sVv/VkdjQHuLxPN7o9l7TA/oNQEgPlj4VhC4lT3HRljESFR
         NIMmJjOAYoYxOnfdG2DgPgLp5h6bPCbh/Kb/nkvA9vjH7kCj1NQWigLspDVj/YwBtrZe
         M3+YECIDMQlYGJ/ku6DrZxrKGfyscOtNyrJ1MsMYQrfdN7BqXyjBSox8jZJ5DuVy9ODr
         J7TP1PhgKTGI+RMmMy3WzNu3y5CplQ+oM9WF3zl43i/eywoBIxqriIs8DfXSCwyqNCZu
         rdggvXQUXe0BEgejECCA59J2j6xSns69Fy5TTWiTiqRlzNBWv8s/9rJIXPnt7zqBE1Bl
         u0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550207; x=1743155007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgGaJaPa/jEPScVXsjWC4390D+TFpvglNfRjMg/X9O0=;
        b=XC8L3OFcgNQSkj4o6ucMBMmqoabUnkQHZvv2CvSL89K+jWQomU1pPDz5Zr1N1rE2Ul
         Dn/PVbNTkzZwZLfXO8rX7RSCS44AVmTgH9soX6tb6EvmLIOXCRq29LYLhwpsHefFhut4
         SQTeJOq84CPsy2QdFKW4+mjnz41YyK0pw+4GSLWERcOjB2lEEndCuSAoDCs1vWmIpYUn
         pyNBTZ/TE+9tKe+XrwjMqyU9E3XHcyhCq+QakIRTDoQTRSpX9HeqQKaohwIWXRAX470q
         pG264HEGRBkODv9N2yJg3SuIADCAmKPt8Lqq3CTjxi14rV/bKlyniiCJECb8KSVc3vG0
         O0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXmkdVxsynAurOX8gDtH87/igo7iBfXG+Uoa48rochZWHQ3G8eseJ4XEHf4cxHwqNGx38shmey7y8CWa7iYpXjR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8K/UJd81RHKQ3aqoc9xZz3kyPzu40AD3zCgwfaOtj9pnV9JsA
	NuxhIVzkKlN84JnV1SGgN0qQqj8PmA7vW7LfsvmzHjoZyzgVVUO9KbN05fyuuE8wrt/nMgB0lIc
	HpubFzCdgI9XTSMN2Ir5jrUzOk4PlX+XHT4iHRg==
X-Gm-Gg: ASbGncuyt7lsxSY5Ty1/aJjKztUbLCBbM3JdWc+b0zI2hv9dKK0ZJBkNjESyZXbOn8d
	vc8Vy8r9gCirvBH1L8jL6c3l67gofAj8344y6EXOfWswwGuw7r9p2hGwHlpwv+ckHJocK0C/KM6
	IGGPky1yRDMAdiAaXG9HKfPkJyBQvBneAqrwNyL0LBhqI/u8bhHb0OHziLPg==
X-Google-Smtp-Source: AGHT+IEDdJoaJq6teyJiW13G+bIfvvL5/3c4aVZ249NYoi9wkGLc1z6wYCrInzpYKLkQcy/ueE7DfYIIW3z1gg4d79A=
X-Received: by 2002:a05:6512:1314:b0:54a:cbfb:b62e with SMTP id
 2adb3069b0e04-54ad64f6791mr932986e87.35.1742550207212; Fri, 21 Mar 2025
 02:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com> <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
In-Reply-To: <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 10:43:16 +0100
X-Gm-Features: AQ5f1Jo9naRtRxBQvHi76DCGdYFDD5Qh6BXFBrW4RyaSHcjfJlIGHOXa5xvXdjg
Message-ID: <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for PCIe3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	quic_qianyu@quicinc.com, sfr@canb.auug.org.au, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_024329_911014_7153AFBC 
X-CRM114-Status: GOOD (  17.83  )
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

On Fri, Mar 21, 2025 at 8:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 20/03/2025 06:55, Wenbin Yao wrote:
> > From: Qiang Yu <quic_qianyu@quicinc.com>
> >
> > Enable the pwrctrl driver, which is utilized to manage the power suppli=
es
> > of the devices connected to the PCI slots. This ensures that the voltag=
e
> > rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
> > on/off if they are described under PCIe port device tree node.
> >
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 85ec2fba1..de86d1121 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
> >  CONFIG_PCI_ENDPOINT=3Dy
> >  CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> >  CONFIG_PCI_EPF_TEST=3Dm
> > +CONFIG_PCI_PWRCTL_SLOT=3Dy
> Bartosz,
>
> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
> selected?
>
> Best regards,
> Krzysztof
>

For sure. I would expect there to be something like:

select PCI_PWRCTL_SLOT if ARCH_QCOM

in Kconfig and nothing in defconfig.

Bartosz

