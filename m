Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA47FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvXFoirRcPqCuFuuvonlBpC34k35CLwopAgTsReEcSU=; b=am+Gohgev/Xeu9/f13L4ABhxAi
	V5m0rL29KUc8iQ5Ie4/dklga/q5HMTffaC0cVLtgvwscYZj62G6vzuGO4082pB184Kt1OPf/rcmbT
	kR2wGzQITBUwIsa/p+9Jrspohfq7CdEIjJ2uzMHjzYhakv1++MtLweclxS9+EWgP2LEw92fMbs8a7
	fUy28WPgNXVgBPxukMlOzhAoBbHm1JGfxDpIxcdH6u6oPt/H+j+C0YuT58meSB2bLXN387s4Gr5xc
	R1LTuu7jXUP3PPA7Uab85GN86DEKe1LdN+0DV59bN4pRI1Okt/f3lazt6OxblifiMoy5bYeqegtQI
	umgzjmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQmq-00000005Tt1-3GoC;
	Thu, 30 Apr 2026 12:46:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQmo-00000005TsF-3Z0b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 12:46:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0685A4012A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FD2C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777553193;
	bh=D1ewCxGAb2m3foREBIoGUCfKhLRzglsJCqliRhlc5uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Obgn2jyvgdAi/bsERGQaWKegNh18sGZx/miLrkEr4I0ETUqn60h0r4j0SoehgYafC
	 B9Xz+Menm6uc28qNenIf5I/Hg6rgvevU6/CqIzpW9fZem+oJPTs4FOWYoKHLENa4+v
	 V8UCTB9Uu/t9K7ImuW0Y5PFhseA7T35wL/BLieQjIzapA/Qn8Aes4FPBnuBrYmFfJ9
	 7b8W7Q/LbUKZOV8zzTyKBQtVp5hGtBS76mACvsUsMQfsUNFQ02ns04Ww868sj02wPy
	 P9kMobx/4vBXM6xQLwZg1bDPInAlfZySuqeSLMaPOnBoLzpQM3moNrBccFKorkdX7I
	 LFhxi1sBb6myg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so7023511fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 05:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Znnv4aQ9L9TkA48ViLEzZ4Kafq5hBHJmekNK/qlKRhlL1skipBv3oUzRT4ff3rN4jaNRk9oQjFbYEnjnL9QB2@lists.infradead.org
X-Gm-Message-State: AOJu0YyQkFJu6IhqK6EvI/iwItrc4DLZl2Q+fGRehXhd2qwsX1ypG6jy
	S6zQ7ke6jOTLygP4lx79HGQnacquZtzKhh/bBsaWUEAOUBvzd8VJ3ZeanlCrfTz7PgPI7ufSLfI
	OVMMGPVEJueR7AUuKvSp9iwDhLzJgxdfel9JTGHyuKQ==
X-Received: by 2002:a2e:a108:0:b0:392:5c61:c583 with SMTP id
 38308e7fff4ca-3934e1f951dmr8911411fa.23.1777553192507; Thu, 30 Apr 2026
 05:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com> <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com> <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com> <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
In-Reply-To: <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 14:46:19 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
X-Gm-Features: AVHnY4IEmLYwEMMCdiN8KiXAHy3-1wn0tdvvY2-O1xx2kdj2ex6VTQTyzM2bmGc
Message-ID: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260430_054634_948615_44A5CF6D 
X-CRM114-Status: GOOD (  22.79  )
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

On Wed, Apr 29, 2026 at 6:10=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> > On Wed, Apr 29, 2026 at 11:46=E2=80=AFAM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >>>>
> >>>> If set, it would be called from MFD core and would do the name looku=
p
> >>>> and return the fwnode which would then be assigned to the cell devic=
e?
> >>>
> >>
> >> Or should we just drop this patch for fwnode in mfd-core?
> >>
> >> Export a new call in reboot-mode framework as:
> >> reboot_mode_register_node(struct reboot_mode_driver *reboot,
> >>                     struct device_node *np / fwnode)
> >>
> >> Use the parent node in psci-reboot-mode and find reboot-mode and call
> >> reboot_mode_register_node?
> >>
> >
> > No, I think the reboot-mode device (as pointed to by the dev field of
> > struct reboot_mode_driver) should be associated with the right fwnode
> > from the start so it should be handled in MFD core.
>
> Ack. something like should be fine?
>
> drivers/mfd/mfd-core.c :
> +       if (!pdev->dev.fwnode && cell->get_fwnode) {
> +               fwnode =3D cell->get_fwnode(parent);
> +               if (fwnode)
> +                       device_set_node(&pdev->dev, fwnode);
> +       }
>

Possibly we could find a better name, but yeah the general idea is sound.

Of course, let's maybe here from Lee if he's ok before sending a new versio=
n.

> drivers/mfd/psci-mfd.c (goes next patch):
> +static struct fwnode_handle *psci_reboot_mode_get_fwnode(struct device
> *parent)
> +{
> +       return fwnode_get_named_child_node(dev_fwnode(parent),
> "reboot-mode");
> +}
>

Yes, something like this.

Bart

