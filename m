Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F7EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAjBGWJRoGm7JTR+Br2s8FJl3Vt1pg1qoRHT2XI61aA=; b=C5z6EKy44kKND9frdakEUZZR+t
	MeW7wFf4sKnsX26CizfpYaFY6E3NId/XzPwZiB4bw8lFHPeqP5U3nT5aHgcBrgNjdZvFEqFV1tOgp
	SSWxgfudnyt81U+9QIgcOcOv1FVSfjF5bhVFWMaQUK/3wudliKEvdRECKi5i3SE+10+E940dFHq8t
	Fd/G+rIQ1zdxS4Ekl4cP7U1n/Uz9yzHAMOh43qP48rIRBWKKG+av1++8mkA96e4QwrE86GXjUAxNY
	r6kAhuEUfm8hpzsu9HLSoesGKv4aKdluAS8ak7vHwOMszNWW7ySkrX1K6px2VqXHaJJjNs6XTUL3K
	sln2vfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Zc-00000003OCm-0IMH;
	Wed, 29 Apr 2026 09:51:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1ZZ-00000003OCF-02X3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D9BB743450
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EC5C19425
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777456271;
	bh=xl75P3m2W4e1+CXN4v9hPNik1UQ7Md24Me8vwhtUHnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r1LsHEeptVM1+C5tb/F06/FEv+YdBnyquB99JAZrLKmItqwb7+lOoFfUrzYG3P2aZ
	 TaQKktyRsDc1TXy9LiocFB3U5YQYVd2dEesCp5M7GkvQCSfeVIJZ80oRtpq58ZSRbr
	 A/PMnsK5Y/PqwpN1k0aiWSdmIv3xtSmC8jkr5B3kJeVaWorsJ3dZqBeu7EBewryMEr
	 x5boLEYdBYJ1RAgegju5fNrYHLQiyYt//71nSkAfnP8MY8qvsJkZ8mPorObi711bJn
	 OMCK+5uRi+l/2+vHANE7hBCmOeABKcUiZJRPUEPB5jHN0qFdjZ4RZ8Q0GlyhuU4+YV
	 h8rV5BRs+RL+w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so123245501fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ifB/ZFS6Y8AmPX2skQ/SiKhkO5O8HG48JRXp4e/qO97zfDSvgIUohfgnjixwlfjbXE5vXM9Dn7QsyLCna+c9/@lists.infradead.org
X-Gm-Message-State: AOJu0YyCN/M3K/GgBt31Qc6yDkzesyjfHQhHuvgfhqGU3fuSJ+E0IzEp
	CkI/fCJuMGdyf433jhekgDFen+uT9rwZsNbHADUBiaOrTanirGqTwWTZA2LjODb61v2l4k0rKAn
	VJirJrXgjl4/IcZ0wGb1pcouioJ8B3R/dSeLI1S4rXg==
X-Received: by 2002:a05:6512:15a4:b0:5a2:c0d8:e634 with SMTP id
 2adb3069b0e04-5a746409fc9mr3018093e87.8.1777456270423; Wed, 29 Apr 2026
 02:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com> <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com> <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
In-Reply-To: <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 29 Apr 2026 11:50:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
X-Gm-Features: AVHnY4LjKEpG9nYw8-Iw2BW7MqAsGu51jz6EVLHSjBeVIe-JDK-BL3dxnn93Q4c
Message-ID: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025113_111915_077277DB 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Apr 29, 2026 at 11:46=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >>
> >> If set, it would be called from MFD core and would do the name lookup
> >> and return the fwnode which would then be assigned to the cell device?
> >
>
> Or should we just drop this patch for fwnode in mfd-core?
>
> Export a new call in reboot-mode framework as:
> reboot_mode_register_node(struct reboot_mode_driver *reboot,
>                    struct device_node *np / fwnode)
>
> Use the parent node in psci-reboot-mode and find reboot-mode and call
> reboot_mode_register_node?
>

No, I think the reboot-mode device (as pointed to by the dev field of
struct reboot_mode_driver) should be associated with the right fwnode
from the start so it should be handled in MFD core.

I'm of course open to other ideas on how to do it.

Bart

