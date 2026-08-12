Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4071C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4fYTkdonNFudLiCicR5+qg8B8A7g4fsWwyZCZbxLtU=; b=OuiVz92mJNI14ukWSARh+HYH7B
	KKStPaWyZyNOklS+REcsnNaH4YvGjLQR2ss6cKT++Asy/WQg4IgC0WmKYCfteBvopiZ3jHib863yH
	WJ5qvgVTzt+48ORTMH1n4Rf4mM/qnFSBunbLZ4BAZ0+FqsnbacEVIXh1YItB5wFbtherTmDD4DMSD
	nBWfjv4ylAN8oY1M2RT9GIafBxjPlNFRzGwlLnkCRX52VsFBLWWWv7VqCZObsEPW9mL7t5sMU/IOe
	H7xQMtL1jcGKiEEwkC3Hn0i4ENYInsRrgKvdAKbtIqxsFVXpJZunddwwq17dcYJ1a8/CzZ8gy72d3
	hxudM++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OT-0000000FeOV-2R5o;
	Wed, 12 Aug 2026 08:33:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4OS-0000000FeNl-13v3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:33:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E16B6187E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468E91F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786523579;
	bh=D4fYTkdonNFudLiCicR5+qg8B8A7g4fsWwyZCZbxLtU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OYBsB9g7UbjwdL7yOGmZrfiw53ED62SfdR0W4K14K/bqPwIinJWmUsrr+741SmLOm
	 IpUIWKL3i8JdpmKe5rwm7bcBgGrww4pgyMyTDs5vK1Lq5HnhNaZpHc1XZGfiFoW+2c
	 FnnIsubwyJA7R5zcY51vhpBsgOzggbwo7ubldGdl2dM3q0VOp4G0qiUsHWsLovcJlJ
	 4cSvIBDoStQEjD6bqzolgi5gclxd4TgYgRQTl1Jwsx0MxiIHbbzy2mBfKkgQj6mKxA
	 WykH03SkE22Z7Y/1kz4vhS5eCW1boKa/4qmu3nOFKWCn8mUOhPQ6h+OGLQE++X0UG+
	 N5G+E0Gwt0+fg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so643426e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqs6neS1Ae6qvunCvtEFF2+lewvnvc0+8L1KbF8RaD0fAYUa9ZQW4gICyTh96me7uB6TUEnMvyJhc+Q0dpo03Ez@lists.infradead.org
X-Gm-Message-State: AOJu0YwrtBf/o9NqRMRTPUG8sW1f+mxZVdYUadQ0GwSJcFofjtfVNFdy
	3dpxh4r8nf3WIMUrIlGreKqSnb+m2lkO6YqtB29nRNWb1LQs/MeQJ51zwhDxf94gzhxkRFdGZyL
	sAQtzceTuD7RGyXcGD35W6cbX4+CUiRFUw6zZB8Sn/w==
X-Received: by 2002:a05:6512:605:20b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b44e315709mr317066e87.43.1786523571645; Wed, 12 Aug 2026
 01:32:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 01:32:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260812081856.GF1072730@google.com>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260812081856.GF1072730@google.com>
Date: Wed, 12 Aug 2026 01:32:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
X-Gm-Features: AUfX_myM-KKHFiWlmkYHiKUnznZQ5Xi8sRhpZ_nwB_pCgToX6LZLHX_mNL9495Y
Message-ID: <CAMRc=Me7Nua8xgKA43rCH9SV2DQoCyAuOqb+KNDTuPxv_H5y9A@mail.gmail.com>
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 12 Aug 2026 10:18:56 +0200, Lee Jones <lee@kernel.org> said:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
>> The PSCI "reboot-mode" node does not define a compatible because it is a
>> configuration of boot-states provided by the underlying firmware. With
>> the new firmware-node based cells in mfd-core, this node can now be
>> exposed as a proper child cell.
>>
>> Add the psci-reboot-mode child cell to the psci-mfd driver with a
>> named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
>> reboot-mode failures.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---

...

>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>
> Okay Yoda, but why is this okay?
>

Hi Lee,

I'd like to call you out on this because making snarky comments on a non-native
English speaker's syntax is really not OK. Please don't do this. As a native
speaker you could have just proposed a better sounding version.

Thanks,
Bartosz

