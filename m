Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E74F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nuGL5zzw0zKNjB/h9iN2OowlI7SEPx+4e4uFF+OfJU=; b=4vZekLZZjP2kEUUD0OxjCCFM/k
	XFYz66KaqV1aVvaIxWSWo5uBnXupHJ1KJqILKUg8AESjEAYv6WSubBT1msbEkL7MDykElG5pNWJ6m
	8yPf4P1f7jAWtSFv548VZvK6Ekw4h6w/ksVP0QjeHZKu9X+flxf5Lm3rA+JQk+ujZhW7zBokeBUkE
	BRRjjz0AXw4WGdJpY/daBXgDkFnXLTQ7bfSWe+HXxwy4dmcEX2NRw/s35W3zJEIS+GBaXCXuTFVVv
	4CrShZn9cxRri7r7iL7X4oQvZcSxTHKDyKx+Ppgpn/6QjbN6FAY5hvdpbape8ipGDVV1htTdyZ7VE
	FfL9gk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVIe-00000003o8k-20hh;
	Fri, 06 Mar 2026 13:33:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVIc-00000003o8Y-2YoO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1300860127
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 13:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D3C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772803981;
	bh=1nuGL5zzw0zKNjB/h9iN2OowlI7SEPx+4e4uFF+OfJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ljqmYZ9jh5Q0xvvnJaiHbvU/OYfrYMM1guAfOD+ablVi6QvEr1Sc0i20HGKrBOw0p
	 2iTGkekkY+wV8Q3SF8X7Iew8Mg8cyJ4/BKgJuwNblWliD5vv/5MxGHzBD1jpac+J+T
	 EqXqOLJ90qGAd8Yz2GvF6kp0kBH3uUfVuEV472tVFs1moULLWX9Q47tAB6iDZ79cCl
	 NX8mz61Mnmr60ExoADQyxBtC/a1HcYXyHNugUs1PLxzwJiHL/aeWLMOYiYkz1wBTcy
	 1hYiLJKfcr8qeIP7rPWXs6ohcM5tDWdb6js6bJJkE2C4df3YrADn6b/uD4J5SDps3Q
	 J1KTgd2So0ZRg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so2930343e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 05:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZSJdvgmhSFsyMx8Mudbw08wo7jceZDrXcDoyKP+Xx1ObPe+8sB3aEiia3O2eHgwkudgLa57NRCc1SBnC3zEFz@lists.infradead.org
X-Gm-Message-State: AOJu0YzliLyZUSIqjTPKCH0EMoV1DT6fS996/IT5ji9pn//p+y3nbSlz
	d1Wk76dRFAVHJtqANv5Z380K0iKI82Uv/Z6YcMHNRUXnRtdqAbpLFvAogpbe0sLlCXeQvjwVXQ7
	GMehuJpEHka1bNgvylaoAR7XJImKw+DyntYVPUG/Hvg==
X-Received: by 2002:a05:6512:3048:b0:5a1:1d47:76fa with SMTP id
 2adb3069b0e04-5a13caae7c0mr631136e87.9.1772803980252; Fri, 06 Mar 2026
 05:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com> <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com>
In-Reply-To: <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 14:32:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
X-Gm-Features: AaiRm50duFLHMSGqN_XTEZwDEkS1OZDEz-KXG7iHPD2r1Opb3JkLo4OLChEHr30
Message-ID: <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Sudeep Holla <sudeep.holla@kernel.org>
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

On Thu, Mar 5, 2026 at 6:07=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >
> > You should pass the address of this function in faux_device_ops instead=
 of
> > calling it directly.
>
> In last patch, we were using a probe function. As faux_device_create,
> calls the probe from its internal operations, "of_node" can only be
> assigned from inside of faux device probe.
>
> As our primary requirement is to assign reboot-mode of_node to the faux
> device, thought to make it this way. (As we did not want to assign it
> inside the faux device probe).
>

TBH This sounds like a limitation of the faux device API. I'll Cc you
on a patch proposing to extend it with the ability of using a firmware
node to describe the device. If it works for you, you can integrate it
into your series and use it.

Bart

