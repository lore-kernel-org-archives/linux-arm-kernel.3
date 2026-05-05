Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE1AFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp+vL4Y47mntKmwi/M3+cxJYzXvpg2dPv/EvVl7OaFM=; b=kiHvkAFdLwPIRM8tpspOnLpcLL
	IPRksilGsfCM/DUVVg609WC2FRc7h7HU63+/Au/Dko2OeNiq+kTIChERimiytC9aiCSsNblbBGLle
	iwBEUcw79gLYQhIlMGNzza2d544rmJt/Zyilz+MQeIA/vefUFt2JVCstCkYd2R7NusrW/7x/OiGkp
	kMtWe0Ni/frCogX/DnhkEAsw+AK0kYML8N37xva206yNrJOQTWgNhJhn12On9dhHpSpbkUnpjGKWs
	TG6MXUNCkEugjlKQk1mH0qG1L3xx11r1QTbJ7ae2O+KipeWezpkXLigeOFvxSLUQYScP838ZPiGlE
	2A0XwEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHLL-0000000GbWB-46DA;
	Tue, 05 May 2026 15:05:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHLJ-0000000GbVI-0N1R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA46642DFD;
	Tue,  5 May 2026 15:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAE2C2BCC7;
	Tue,  5 May 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777993547;
	bh=fjhctLjrzP8ABWybAS9/Xz+fkBSmi6e/VKPohchYNGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DldJROvJl+GnItu11wN0UY1H6kpVglyyugjbuNb0x52JurAYJp3+RIldpVzIMIpDH
	 3UjyLAJ9kK1WNvj3gSQRs3BnPKMtVMdw/w90NVfsApy1YWCtUFAPVxGwQ3YDYGdpt5
	 UIrav3YWYVCyZv7zW8B2l2uT0XPCZmoqAiHxn9gQMH3Kf+gH++H+nyUfbG+58tXsFK
	 NcQBpoqwfWIw1c7gT36EjY2QkTAwdEHgq1T/Y5KbgzazK7Q7b8NQPPIlrahhBkUOAu
	 nkD4JblRwUB+x3kManmAZCtgsYqpt4mYTuvxQ3I0ML9cSjyeSRp3zr9A9W0gOhNf5W
	 a0cfPTqAE3G+w==
Date: Tue, 5 May 2026 16:05:38 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
Message-ID: <20260505150538.GE2661693@google.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
 <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
 <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
 <37ab0178-1c9d-409e-bbaa-832f8075afa4@oss.qualcomm.com>
 <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcqa5RMarC+6pVYYvYsuJ03GQMtM=69bQMxyotN1u2B0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080549_190083_BCB009DA 
X-CRM114-Status: GOOD (  22.15  )
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

On Thu, 30 Apr 2026, Bartosz Golaszewski wrote:

> On Wed, Apr 29, 2026 at 6:10 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 29-04-2026 15:20, Bartosz Golaszewski wrote:
> > > On Wed, Apr 29, 2026 at 11:46 AM Shivendra Pratap
> > > <shivendra.pratap@oss.qualcomm.com> wrote:
> > >>
> > >>>>
> > >>>> If set, it would be called from MFD core and would do the name lookup
> > >>>> and return the fwnode which would then be assigned to the cell device?
> > >>>
> > >>
> > >> Or should we just drop this patch for fwnode in mfd-core?
> > >>
> > >> Export a new call in reboot-mode framework as:
> > >> reboot_mode_register_node(struct reboot_mode_driver *reboot,
> > >>                     struct device_node *np / fwnode)
> > >>
> > >> Use the parent node in psci-reboot-mode and find reboot-mode and call
> > >> reboot_mode_register_node?
> > >>
> > >
> > > No, I think the reboot-mode device (as pointed to by the dev field of
> > > struct reboot_mode_driver) should be associated with the right fwnode
> > > from the start so it should be handled in MFD core.
> >
> > Ack. something like should be fine?
> >
> > drivers/mfd/mfd-core.c :
> > +       if (!pdev->dev.fwnode && cell->get_fwnode) {
> > +               fwnode = cell->get_fwnode(parent);
> > +               if (fwnode)
> > +                       device_set_node(&pdev->dev, fwnode);
> > +       }
> >
> 
> Possibly we could find a better name, but yeah the general idea is sound.
> 
> Of course, let's maybe here from Lee if he's ok before sending a new version.

Send away - I'll review in the context of the whole submission.

-- 
Lee Jones

