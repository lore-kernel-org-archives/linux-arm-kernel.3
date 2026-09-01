Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F8C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBmpv/kkFlJED2xyi2We3aIip3PLbNhKdHR6adYaq6w=; b=e2EfGq3U9QP9K2423J5fUA/Yp6
	rGsC3ol0RvzvXJUY7/IbnUykSswwBINid9SUsYCHrnyuR8OS6H/TBfLivlTYlJh6UKMR1TDKiFSB+
	SoUTc6PR09hSJkMz/WIk7LiyTUJZUNSS+3PMIA7F9bd6HdU742CRVpePGkAVfDKGa+tQ1ygAfoqG/
	xuQ3YcW/ZtPsASzSXjcJCSUnG5fY4ZTcfsz5jd7cxxg7iBuyWSKegDRyQiDX5a8p0MwPfv7gzoacB
	AZVr8G1z/d3pB8rVO7m35Hweh4TeQObL3PWI0YAKHjgja0w6PobytqVrhnEb+e9uiSg486HX3evFW
	As0kdQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jc1-0000000BEay-29OP;
	Tue, 01 Sep 2026 08:12:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Jc0-0000000BEag-0jFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:12:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B648A41513
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Sep 2026 08:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF9C1F01559
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Sep 2026 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250375;
	bh=HBmpv/kkFlJED2xyi2We3aIip3PLbNhKdHR6adYaq6w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DGSR4wr7vG4DOE5LQp5fXQLm22woEM2CJP7IqR5xydptbatSxoFgcA5Oj+mgGQXkE
	 0rkMOshXkyt81tVbP8LnOobbQrV00XivAOst3JT66iN0rgiSAYSJ1AfNb4IWnpTf8t
	 zwZ1F76sH2qxug++ZQSfAPNNEz1xuFsbQwiB0sTmfuRbzD/P4g1ySp7oNaQbdagWXK
	 l+UEuKr7/avi6Eid6+VbdhZ0Fg+XRzaTCSovd67CWvHWjWyy4uGzWn0YIcIIgtbLw+
	 WLv/v7b9nwcdctPj+0Yo2yyxIzNnPlPJrYI1Met9lPR6UV9fVYAz1T9CJ2MA4V7lFF
	 h6lGYmG8CEVgg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so3691797e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:12:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEi+x1xhPSTMe99cHY/qqP+xx4NoLBGc+S4cmAfdkxH1e9pWEAwuwMOoAVBQgdsHKcnGQSM5N7kBJNxY0S4g1k@lists.infradead.org
X-Gm-Message-State: AFuF++nHxJ0sTUiRkVmW9oP0+UtTft0EYqNd2j76TrlLuQUjj3zlnanI
	MmQTZjhnhgiMdILVHs/rCbhQm3LyNCvgJwi2Ba9ti+Cjuz6PoP/IjG4YJhE5oFw1dyYTk7HTl17
	JIVcyilV4tklaBQgXf5Vbkcy/R2B/KW62y8Ck5KEy+w==
X-Received: by 2002:a05:6512:234b:b0:5b4:adb1:b25b with SMTP id
 2adb3069b0e04-5b5fe0d8420mr2844144e87.14.1788250373694; Tue, 01 Sep 2026
 01:12:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:12:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 01:12:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260827125906.GJ770273@google.com>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com> <20260827125906.GJ770273@google.com>
Date: Tue, 1 Sep 2026 01:12:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
X-Gm-Features: AcwNN1URolqPxNp7OBkDyFKCbmiVpB4IqtdYvYItWVcsvGzePxbvMEDVrJj876Q
Message-ID: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
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

On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
>
>> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
>> <ulf.hansson@oss.qualcomm.com> said:
>> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
>> > <shivendra.pratap@oss.qualcomm.com> wrote:
>> >>
>> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers, =
if
>> >> introduced, would also need to bind in the same way, leading to sever=
al
>> >> drivers attached to a single device node.
>> >>
>> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and register=
s
>> >> PSCI child cells. As the first user, register cpuidle-psci-domain as =
a
>> >> child cell.
>> >
>> > I don't think PSCI should be modeled as an MFD device with childrens.
>> >
>> > Instead, this looks rather like a better fit for the auxiliary
>> > bus/driver. Please consider using that instead.
>> >
>>
>> Hi Uffe!
>>
>> Since I was the one to suggest MFD - would you mind providing more argum=
ents
>> in favor of your preferred option?
>>
>> My reasoning for MFD was that it is indeed a device that provides multip=
le
>> functionalities, of which cpuidle is not really he main one even though =
it's
>> currently the only driver binding to this node.
>>
>> In any case, we'd need a "core" driver binding to the psci node and with
>> multiple auxiliary devices with their own drivers, we'd end up reimpleme=
nting
>> MFD.
>
> Ulf could be correct.
>
> MFD is usually reserved for real devices, whereas the aux is a little
> more loose.  Please consider it as an option.
>

My point is: if you start registering auxiliary devices from a "core" platf=
orm
driver based on real child OF nodes then you're basically re-implementing M=
FD.

At that point you're better off just using the existing MFD infrastructure.

Thanks,
Bartosz

