Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E34FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H06R9NsyFguVgVc2OrDtUg5k+e6blEtpJ4v4I1D5i5M=; b=nuGWuyQCCTrjK7MLj/gHmDRs1P
	KOw5+y2CHPK5tmZWolQX4b5S8FTS4xiICaXUxvLk90Vqvp/nPXD2B9lDp7KlXhvuAViYGEcJK0hY2
	GHPtYCKd053QDNWbZkPruZLKkFJNlQi/5W5bXHUEaFYvE8fvpBb0EYANSkeJ2cPUYSpdhDxzEtGV0
	oHdYwHWqqUb30AjbUKApWkV17mL6GwX+4tZ3ODJwiSPjm0XnNncyrkH7B8dlKEzQXCS98FrDPE1Hh
	fwJKFJ+bUhGbI0I9OPdjCB4O4btL29p15f6He2kI7ycBXn48OCvBZ3ebKqplpCB875lSGc1dp4HtJ
	uHMZglmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhuc-00000001TAu-2imB;
	Tue, 28 Apr 2026 12:51:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhua-00000001TAa-1KPP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46F194441B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C806C2BCF6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380695;
	bh=H06R9NsyFguVgVc2OrDtUg5k+e6blEtpJ4v4I1D5i5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OywqrMno8jmcYD5v5Fd/6PqnvmgjCNVeng1svVEtob8W/Iw/FcndcE6vrAV8z0aqs
	 RUW5idBfci72/mDGzWN4JH6suzNAOE/YUUE0uISvzPMs5H71yEO9dtJVejcll0MDzP
	 9e2XsiFv5N4v/3lP537JwiWFk7kX1fNuko7bbhIbDRSJK/5lSUbKSLK499ubLLFwh7
	 sigbIXKG9deE+GdQJX9rM7Vvas62YzWyPh+xGUAvamMd/CRcZMOl3rxtumhupZSFUn
	 agKcPV3vY0KM9T9Iv5XTbORmpetX8ZhSx3EbWgN5kj7oG7cxwdrNOOZv5jtT7gN0gj
	 5evw1y28sf/Ng==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so11255029e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+AeKQiUrcxy04XD4zMBGuvrvt1cADVjLpCrc/oHXX+/YCNd/CgieVpx3jVuoUgVRrfZw++8OxkdRhPeJkLc/eY@lists.infradead.org
X-Gm-Message-State: AOJu0YzB40j0AyHAgfANDo3wPH7CkHX5+ocH41MUS5U0gyia0tpgfko4
	6egYgSUQV9Po/f0m170Hk/UfvGpWxHQkzL7aHYYfsi9foR0vuAHhjVW/o8fC/2lQkgR0lIeDcXs
	A374PGWGZnvebaZYEfL3gCEnqP4kWqUkbWxBw2sZurA==
X-Received: by 2002:a19:f617:0:b0:5a7:470a:cc2a with SMTP id
 2adb3069b0e04-5a7470acc7amr726274e87.31.1777380693277; Tue, 28 Apr 2026
 05:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com> <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
In-Reply-To: <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 28 Apr 2026 14:51:21 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
X-Gm-Features: AVHnY4JU1UwiPshYmVjsgOwUMFBB1XE6bzFZjj4Zzp3u2SG40oRUQvl3mhft_7w
Message-ID: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260428_055136_417944_4207C6CE 
X-CRM114-Status: GOOD (  23.23  )
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

On Tue, Apr 28, 2026 at 2:18=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
> > On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> said:
> >> MFD core has no way to register a child device using an explicit firmw=
are
> >> node. This prevents drivers from registering child nodes when those no=
des
> >> do not define a compatible string. One such example is the PSCI
> >> "reboot-mode" node, which omits a compatible string as it describes
> >> boot-states provided by the underlying firmware.
> >>
> >> Extend struct mfd_cell with an optional fwnode pointer and attach it t=
o the
> >> child device during registration when no firmware node is already assi=
gned.
> >>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >
> > In the following patch you use this and violate the supposed constness =
of
> > MFD cells. This also mean you need to modify the mfd_cell at run-time. =
I would
> > prefer introducing a field in mfd_cell: bool use_parent_fwnode which wo=
uld
> > indicate to MFD core that - in case no fwnode was assigned from other s=
ources:
> > DT or software node - it should reuse the parent MFD device's node.
>
> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
> to psci node.
>
> But we want dev->of_node to point to "reboot-mode" node. This may need
> an explicit assignment again of of_node?
>

Ah, sorry you're right. I'd like to avoid having to modify the
mfd_cell entry at run-time if possible.

How about a callback in mfd_cell like:

struct fwnode_handle *(*get_fwnode)(struct device *parent);

If set, it would be called from MFD core and would do the name lookup
and return the fwnode which would then be assigned to the cell device?

Bart

