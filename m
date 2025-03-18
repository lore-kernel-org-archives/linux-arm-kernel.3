Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BFFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=; b=Ezbdx1sGpMW1tUl8y1aAK4aiQB
	tqyhUqXv55npu6G3NtYAZFLuFqid1OIMoW4es/PfgbAHy2f4GUz8xn608EwTBar7E8UYNlIy3qWaD
	XfzyqeeY+viqWPzc1AS11tzpRapzBImXJLc6Yp10ILjyrsYQh9T7xGdgUaxJ0ff7A1OfYtMdJ1XC7
	dubG5HounnnLoeLaGli6gjRt6ip/hzZIamUhsRzddPFfS+y1OmBXtBnlTb3YvJ8tLbiXUNspeQU+0
	S6N0MbaIW2lldU9+GRsSLi3u2MhQ+ewVauBWcgqRkxGkA6ed03fgOLCrc1Rqekdapw3D8RieeTKoX
	3u87dKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUDE-00000005VrY-1zDl;
	Tue, 18 Mar 2025 10:30:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU6c-00000005UNL-3G7Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742293409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=;
	b=ib3c9nwELDYrrI292ukohrF9jF8bTR9WFSKpH0hTtv6pkapFYQGXvGr9QOv8dB13rQyGam
	B4pFiRlrzcKLzFbfhAYqhYF4vqqsCxAAjrrav7rgAN7Gu8khCSwj3c5RQUzE+OnAq+HMtL
	VDycQFxW9t3TV34ZJNi+873DxVmQXR4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-1eiYd8O6OPSSKSyLqMIsUQ-1; Tue, 18 Mar 2025 06:23:28 -0400
X-MC-Unique: 1eiYd8O6OPSSKSyLqMIsUQ-1
X-Mimecast-MFC-AGG-ID: 1eiYd8O6OPSSKSyLqMIsUQ_1742293407
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5d9fe42bdso7512628a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293407; x=1742898207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu/miwHG/5DBOWrVzesxZsGrjR/i09ERA/Qp7bJIj1s=;
        b=CE/xohGsqgbahEi2BpSFPWxmF9ayyF7OHoyLeKBV198ZYAzPMDkyc6o9VrbcAsml91
         SKiSyHweSQYIi4BELAT7vxOSVFNN/KX9EStDKN4IMzu7hBBAsnEicIVMdt5px5LZoD9s
         S4NmIij2o+jhXK5RPWSG+CYQ/eSBXd5o7jjB1W3Pn/e57oeoZHs2/Rv0Vd160win+mnA
         89tn1xdw/nHLXl9tThQr9+qhKmijm7/k69QnQqHPjZIznAj/OCwA3D1kIapogZHLGHSn
         iv2nC2VHZTqbPlq4gPPp7tnujnFfYuU3sWw7zEAton40JL/jHoJm9XLKSAIkNgJzMjIB
         mpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1y6um51QTfbog3YUdi5wyJDxoqfWxM9MvXiDBxsRj9/k6dgMjHiclcsCqHgJJOz8JgRxye1fn2PHYMrVwONx7@lists.infradead.org
X-Gm-Message-State: AOJu0YycUBpGx+W8/ocIm6A/Vzizj/NVfav9fQ7TE+oq7pRpoZld7Mcu
	nsns96J7GaeOmZQp7BONkiVbfpwdLKhXOx8HXRabCvOPtnxoosUvcG2ulnV9lzQPhxMzKCVoZnM
	cpBdsZew5Xi3M4Ed2R2j27nTJAGMuhN0GpSd6L06qJwkO6XDaXkkJ6/28I8O1UB0TrRt6pCdgCC
	UyvKOlJCe5kvmPrPObh6KegQodVoB//nawv2fnGvesL2iPBk4=
X-Gm-Gg: ASbGncu5VeJQgRMEwCxAYGq5wcxIFoZgJvic7cGbGOOfvwjSqD3lnQ384b1GhlYmd3M
	TJCnLyxNO1W4CSM5/UElyx03JTzToAwJInsgLvCumBUHRqYj/y74rFZ2fafshjExDTn2y1f8Iuw
	==
X-Received: by 2002:a05:6402:2746:b0:5e0:4c25:1491 with SMTP id 4fb4d7f45d1cf-5eb1f0003a8mr2755906a12.7.1742293407114;
        Tue, 18 Mar 2025 03:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjyrDRk1usiBEXrUhkwIqs03+nWpkGjuY57aQwx3IT25kzIUISqmC8GAQ0nzFy+hG1pV9t2z5H2wCr9D8rn8k=
X-Received: by 2002:a05:6402:2746:b0:5e0:4c25:1491 with SMTP id
 4fb4d7f45d1cf-5eb1f0003a8mr2755871a12.7.1742293406690; Tue, 18 Mar 2025
 03:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250313173707.1492-1-quic_philber@quicinc.com>
 <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com> <xogief67mb2wonb7angoypj4ddvvecyrcsnncqitggpij6ssim@fo3psnqqhovp>
In-Reply-To: <xogief67mb2wonb7angoypj4ddvvecyrcsnncqitggpij6ssim@fo3psnqqhovp>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 18 Mar 2025 18:22:49 +0800
X-Gm-Features: AQ5f1JrBFyW8xkFgMxVk6GGg-rvzIxamknFWt0oP1OOTPXdljbsO7bXLrfDxGHk
Message-ID: <CAPpAL=xiQ0x7Vk55of1=-Hm0ijsVQkeLixv65WJc-J0sL9Fnww@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add virtio_rtc module
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	David Woodhouse <dwmw2@infradead.org>, "Ridoux, Julien" <ridouxj@amazon.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Parav Pandit <parav@nvidia.com>, 
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Simon Horman <horms@kernel.org>, 
	virtio-dev@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JE3eLRo0LwyM6bf5lDpfaqM96Jtth-n5c4VOpY3SFvw_1742293407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032330_892433_CD4D4636 
X-CRM114-Status: GOOD (  16.70  )
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

On Tue, Mar 18, 2025 at 6:14=E2=80=AFPM Peter Hilber <quic_philber@quicinc.=
com> wrote:
>
> On Tue, Mar 18, 2025 at 10:04:07AM +0800, Lei Yang wrote:
> > QE tested this series of patches v6 with virtio-net regression tests,
> > everything works fine.
> >
> > Tested-by: Lei Yang <leiyang@redhat.com>
> >
>
> Hi Lei,
>
Hi Peter

> thanks for the reply! However, I am not sure which virtio-net regression
> tests you are referring to, and how these tests would be relevant to
> virtio_rtc. The virtio_rtc driver does not have any relation to
> virtio-net ATM. Reusing virtio_rtc within virtio-net has been discussed
> in the past, but not done yet.

First let me introduce the virtio-net tests which include
ping,hotplug/unplug nic device, live migration under stress etc
scenarios. This test was triggered because some of the monitoring
conditions of the CI tool are general. I will change the code later to
avoid similar things happening in the future. Please ignore the last
comment from my side, and sorry for bothering everyone.

Best Regards
Lei
>
> Best regards,
>
> Peter
>


