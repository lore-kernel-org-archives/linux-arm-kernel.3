Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685F4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 02:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIN/h7uRleRuOPaWesWGXmjcSD2rqCCgng8WzwpjrR4=; b=YT7M4eagtAEgai+WfZh2ChqkS3
	+WQEsO/pB4j2ZNyDw2kZ9ihDpHfPUZ5nLxyEVeNNz/9J4VyLyhGcrBSok2+eD9wKgNaOwsVuHM2nX
	7bwOt4gpaz6r//otAIBTqAt70SjOoXMIn7VuUB9u5XZvHl+pTztPyX7elYQk/YC18aik17911aEO5
	CwEDr3naAXFifyLLXfHAzryaWP//t+2tghb2LRywV2mbZyrZcICdTTyShqDu7kok7l21jKtal2eOk
	QDPFJqZbe+Hn4sub2wuZhqrErxTtlfwlYTjWjO2qwTXTWekoi43jyE6sdxx8hv+ZR2Fw0DkX12n40
	9iz67B1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNN0H-0000000Bvtm-0wmQ;
	Tue, 17 Dec 2024 02:08:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMzC-0000000Bvpu-2bU1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 02:06:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so3295716a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 18:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734401217; x=1735006017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIN/h7uRleRuOPaWesWGXmjcSD2rqCCgng8WzwpjrR4=;
        b=A7WeMz5i3k9jkvXuziN4gjNZ/wkG/lgKphPcmOqPYl/uFjvcvEC1H3oUmj4v/J11Ir
         pLV2nPn/W7400ljnjFfsLJH1H/EM1TI/DDencleGgOxiWMUBuW5JMNsyJ2vo/ObnXY2Q
         bRx+kxckudunsN09O3do3cvayoWZ1F9e0U973jhQq8YZgNkuL3w1Pz3U8ZJMyLMAeObY
         WPQwWSoY3KSZyUPfqN4mJnV+FuKPFU3bwpOT8NC85xGd17eKi6GjyFKZ9dnQptgN+l9e
         9EkyOZLdca+cjCk3KxQjhR0D9oxR+DEEQwAXDrSmg2XC5vWS6ujLO9ouDyYe6eEsqIPS
         x3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734401217; x=1735006017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIN/h7uRleRuOPaWesWGXmjcSD2rqCCgng8WzwpjrR4=;
        b=wWrHJBVV+ZCoJ5H7PklgYeohE9bVpdmKP8fB9eEqQrcdHu0FpfEbQCIcjT7/DEGX3f
         xp7vXEQbjEr4LP0So+f3hpzZ/06JUlkRn23n0SfWYPumu5iLCvI0JXFzRLdgFx0aaYxq
         4OgbpCb3P/VBSp4Yy8XeAXyH83J+EVSpodeIfAqkWfc4pMvzHz6k+eEVaipJ63wmdNG8
         zFGo6FiPhrJ11TpPXdTEq5i8gTsFwhGwVnysfaYykJikRdTisfetxm4UUfWQa/5AHCWh
         fCqCznVmPRJpTCPgBy4/LqH7RRyCScBm+appppQ2ia3s2e/EF4EKQhJAX8EACtJ9El4Z
         WVDg==
X-Forwarded-Encrypted: i=1; AJvYcCXC4cYP/hdVix4VlDtyaa7Y+qLu+SN4k6c5SN5b0hf34crfLw37wfeWhWl9gsu3KPcQ5Vk4OPgqXFar0ju2ak+k@lists.infradead.org
X-Gm-Message-State: AOJu0YwpWnVBPXdgttmaYHdqDXBdJftUg8rMvkT9lEHuPDUB+/wghYYP
	WXgeerjxuRlrTEnklkNuBdc2m9RBs87pVZB0YbBpCtmrsB9hDh+Jlx1+mQyemd4/zjS6ahb2Tu8
	qoOUAY0ADMpc0C8ZxRZjAPKsQ1b8=
X-Gm-Gg: ASbGncsGk/CCpKi1JZCNJOlgegJz1bht3Bii3XBBUq/O0wbIbLTUjHyiNme2Cmm85o3
	ukMYAG9SYYkxHI4Qp3yEJcoysR+NLS3L6NTnK
X-Google-Smtp-Source: AGHT+IFTM+u99ByAMGYF6W0ILyoD1phxfeZM4zZP7X+sikySq+K1IeFxuV3WjGqrp+g/slaEeDRQbTQqBPtt0AYpniw=
X-Received: by 2002:a17:90b:4b51:b0:2ee:d186:fe48 with SMTP id
 98e67ed59e1d1-2f2900a6737mr18594263a91.28.1734401217267; Mon, 16 Dec 2024
 18:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20241216073745.2973317-1-guomin_chen@sina.com>
 <Z1_p0nU93PHJ4Sg_@pluto> <Z1_2rxJ7TOEIOMp7@pluto> <CAEEwsfRhe4-YAwe027huSXwFfkV-O-8w1GDNf=URa9efRsXiKA@mail.gmail.com>
 <Z2AEzHc5f6TjxErs@bogus> <CAEEwsfRKVBVR+DxhkYA5atxU7+6nsaL9X8-Yoa_DqB0YKEV1zg@mail.gmail.com>
 <Z2BQe3-zl2IN_Cjj@bogus>
In-Reply-To: <Z2BQe3-zl2IN_Cjj@bogus>
From: gchen chen <gchen.guomin@gmail.com>
Date: Tue, 17 Dec 2024 10:06:46 +0800
Message-ID: <CAEEwsfSYMx6Kdf2TK3hMN_TyoqEBbQXkCk_zPb+6-i=omZU_Fg@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless scmi_bus_id.
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, guomin_chen@sina.com, 
	Xinqi Zhang <quic_xinqzhan@quicinc.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_180658_657922_ACDABDA3 
X-CRM114-Status: GOOD (  41.21  )
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

Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=8C 00:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Dec 16, 2024 at 10:10:40PM +0800, gchen chen wrote:
> > Sudeep Holla <sudeep.holla@arm.com> =E4=BA=8E2024=E5=B9=B412=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=B8=80 18:45=E5=86=99=E9=81=93=EF=BC=9A
>
> [...]
>
> > >
> > > I would like to understand the motivation behind this change. What is=
 the
> > > goal ? Do you prefer to fetch the name and protocol id from the devic=
e
> > > name itself ? Is that your requirement.
> > >
> > hi Sudeep
> >     Okay, the reason I want to change names like 'scmi_dev.3' to
> > 'scmi_dev.firmware:scmi.perf.19' is because when I was migrating the
> > SOC's kernel from v6.1 to v6.6, I found that the context for creating
> > SCMI devices had changed (commit d3cd7c525fd2: firmware: arm_scmi:
> > Refactor protocol device creation).
>
> Correct. That's the beauty of Linux we can adjust the internals to enhanc=
e
> the features without breaking the user-space.
>
> > This change meant that device creation shifted from being directly
> > created through scmi_protocol_device_request during SCMI driver
> > registration to being created via scmi_device_request_notifier.
> > This shift results in changes to the order in which devices are created=
,
> > causing the ID in scmi_dev.id to drift.
> >
>
> What issue does this drift cause exactly ? I mean the order in which
> the devices are created should not impact on anything if the dependency
> on the order was not created. What was that dependency ?
>
Yes, my issue is that the loading order of the scmi_cpufreq_drv and
scmi_perf_domain_driver drivers causes other consumer devices to find
the wrong SCMI device as the supplier. Since both the scmi_cpufreq_drv
and scmi_perf_domain_driver drivers use the same device node (the same
SCMI_PROTOCOL_PERF), device_node.fwnode.dev will only point to the
SCMI device that was registered first.

Thanks

> > Additionally, I encountered some cpufreq errors here=E2=80=94because bo=
th
> > scmi_cpufreq_drv and scmi_perf_domain_driver use the same
> > SCMI_PROTOCOL_PERF, this results in two SCMI devices corresponding to
> > the same device node. However, device_node.fwnode.dev only points to
> > the first registered scmi_device, causing other consumer devices to
> > find the wrong scmi device as the supplier. So I would find a
> > multitude of other consumer devices waiting for meaningless device
> > names like "scmi_dev.4" instead of meaningful names such as
> > "scmi_dev.firmware:scmi.perf.19" or
> > "scmi_dev.firmware:scmi.cpufreq.19".
> >
>
> Yes this was reported. I think most of the std protocol may not use that
> node and need not be assigned. But I think vendor extensions are adding
> info to the DT that may need this.
>
> > Although I could further determine which specific driver it was by
> > looking at the driver links under the scmi_protocol bus directory, I
> > thought that if the logs directly displayed device names like
> > 'scmi_dev.firmware:scmi.perf.19' instead of meaningless progressive
> > IDs, it would be more convenient and logical, and thus more
> > meaningful.
> >
>
> If the issue you encountered render your platform into boot issues ?
> If so I would like to know what exactly happened. If not, I can think of
> alternate solution if possible.
>
> > > From the commit log, I get a sense that you looked at the code and th=
ought
> > > of possible improvement but when we mentioned the limitation you just
> > > improvised by adding parent name. Do you expect any userspace to pars=
e
> > > the name as that will end up being ABI and we can't break it. I need
> > > real motive to be explained here in detail.
> > >
> > I did not use userspace tools to parse this SCMI device name; I simply
> > wanted the name to reflect the possible logic of the device.
> > I did not remove scmi_dev.id (This scmi_device structure has not
> > changed.=EF=BC=89; I just no longer assign values to it using scmi_bus_=
id, so
> > it should not affect the kernel ABI (kABI).
>
> I understand the change, just not the possible impact w.r.t user-space.
>
> --
> Regards,
> Sudeep

