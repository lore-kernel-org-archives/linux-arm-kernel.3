Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 02:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HagLySi8cLl3r+54xADX7ls5xoEWrbGMKO8f5L1ISh8=; b=BeDgRQ1EIP42BnwKmsCRWQSyOt
	42BssL2Xo+aIj53ZHid2ZmBTnMwTtbfRv8DWHO0N0moWJ3X2UvFgxOs8vSR3pS9rO7uFzw3pwC2u8
	JIAvxAmL0H1LYawEgx43mCS09FRQJHWCwfWdVFUqKHXkLBgFSttICIMjkUso0+gJxz1VV3CiKATB/
	TcQkWNaGlj0Wj1dlQELRtdOJXNqTwz3MOk+2tuFWFwQJaXhtoFTM7Br3eRwzCJZB7sTgUkLdZWiPL
	3RTTWpYhj6l7MJ/7mflZgi472YuP9DKVjWzbAcoxHTOR7NvCIf/Ll0vbpKF0EAK5spwZOUnExLudA
	6w3QEV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMOY-00000004QCo-34IB;
	Tue, 18 Mar 2025 02:09:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMMB-00000004Q1Z-3A0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 02:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742263621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HagLySi8cLl3r+54xADX7ls5xoEWrbGMKO8f5L1ISh8=;
	b=AGOFdEFPsByWMWrrQvdoP9D3DpSf5VCQLyuBCqGM+pMBimUti52H6dfU7ClV0TcdIgoH8n
	e7iTxjiB2zEpgpZ/o+pkCzguX9Z0LtAroIPYcDPAYVF2KQWPjbdye7r0V8KF112E8/KyZp
	vtBtlRgJ7Nj1qDRRL9CRZB9hHQygaCg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-v74Rl1goPkyjGFeCNKg-HQ-1; Mon, 17 Mar 2025 22:04:46 -0400
X-MC-Unique: v74Rl1goPkyjGFeCNKg-HQ-1
X-Mimecast-MFC-AGG-ID: v74Rl1goPkyjGFeCNKg-HQ_1742263485
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e82ed0f826so2984430a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 19:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742263485; x=1742868285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HagLySi8cLl3r+54xADX7ls5xoEWrbGMKO8f5L1ISh8=;
        b=oqKlgvdnUmHm0ZFoAtFbVpSqhLdvsPftPW++3VoDWmy6RU13hBjY7I7OHL7PjUl2ze
         76zM8yZIF026JjYuqezO0FPmY6UXAZ96X0ZpXxZ9Ckpu358b42H56RpFO3/OLtZCxGN0
         yWM8rdSxYnLXUIBFNHEw4ZzLiWfkerfp8YBJRE//wfEtlbFH4woXFZnZiPYJQKf2wZoD
         xLiLicJMIvHMvMmm6PlJYp6eyFg0dbHgXHOuiigqi9vLxRuedG2PRjrl7fSMYRFbZkAl
         O3DXBtSYga6pqFVetmgjn54DZlz/rfnRHYdFrPKnQ0fmsUDGZAND8vKSi1T+h2W4E5bA
         +vsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyxYnKLQeYmvcCUa7D1TOyTV6N8gBRYujr1inuL5t5rfuSuftpDM1UYKj/wnkwCXvc13cPkGDyIFxwFAPV5vzz@lists.infradead.org
X-Gm-Message-State: AOJu0YxCXXNCs1ogsj497pVaAZahDrFDEaLS0MiLh50lG1sz+TBSxuku
	hrt/OpxkmQarQzwfg7YYJ7nNrAvuBbU2p1Lfd9fHW0z0lNMp/PyTmYSEdoYj5/qkOj7QZ321fD4
	E+JLw5mrUpmAMcOPwYf3ny7K507NuqFgnVcm28k3NBsLPzdCj+cxNYmyoV05g9d1zeAZZqox8XY
	bpcGXJBTYS3BETyxJZGc7golU60xTKNqg10UQYgzH0fbCzm0M=
X-Gm-Gg: ASbGncvsYHpTxNGAsaAF++/zLQXL6C0k3qzZIcd9B8Z7XdzxIIxx2rZqKW3ZU7MxOuF
	s3au1gokRsLroK3wnvXgsVEi3EQdvbtvRTvpkPcHcQi03VwnK8/6ymdkcQPIGnV8NezGGNlR/0w
	==
X-Received: by 2002:a05:6402:2813:b0:5dc:94ce:42a6 with SMTP id 4fb4d7f45d1cf-5e8a04269dcmr12618035a12.22.1742263484898;
        Mon, 17 Mar 2025 19:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTHOOl6Hk7CUXcBJnZcgEEeHkmDGirQ0K5SylxbpBmJhN12iZN0vDQ4dXRO1NR5QuZfjHl7zqPMlB3eBqqNbA=
X-Received: by 2002:a05:6402:2813:b0:5dc:94ce:42a6 with SMTP id
 4fb4d7f45d1cf-5e8a04269dcmr12618008a12.22.1742263484512; Mon, 17 Mar 2025
 19:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250313173707.1492-1-quic_philber@quicinc.com>
In-Reply-To: <20250313173707.1492-1-quic_philber@quicinc.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 18 Mar 2025 10:04:07 +0800
X-Gm-Features: AQ5f1JraV-K8l7M1witBxN1YhEzF_YkK0S9tGmarwOVGMg-B43l_lWg4rMiqWYk
Message-ID: <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: XDR0A3Rpkq7cm4KhcfxfWnMzIgTdi_ma3UWiU0ts5Ro_1742263485
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_190703_935548_637A24CE 
X-CRM114-Status: GOOD (  37.48  )
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

QE tested this series of patches v6 with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Fri, Mar 14, 2025 at 1:38=E2=80=AFAM Peter Hilber <quic_philber@quicinc.=
com> wrote:
>
> This series implements a driver for a virtio-rtc device conforming to spe=
c
> proposal v8 [1]. It includes a PTP clock driver and an RTC class driver
> with alarm.
>
> v6 updates
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> v6 fixes the PTP clock name length, and a few style issues, some of which
> resulted in warnings.
>
> Overview
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> This patch series adds the virtio_rtc module, and related bugfixes. The
> virtio_rtc module implements a driver compatible with the proposed Virtio
> RTC device specification [1]. The Virtio RTC (Real Time Clock) device
> provides information about current time. The device can provide different
> clocks, e.g. for the UTC or TAI time standards, or for physical time
> elapsed since some past epoch. The driver can read the clocks with simple
> or more accurate methods. Optionally, the driver can set an alarm.
>
> For the Virtio RTC device, there is currently a proprietary implementatio=
n,
> which has been used for testing.
>
> PTP clock interface
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> virtio_rtc exposes clocks as PTP clocks to userspace, similar to ptp_kvm.
> If both the Virtio RTC device and this driver have special support for th=
e
> current clocksource, time synchronization programs can use
> cross-timestamping using ioctl PTP_SYS_OFFSET_PRECISE2 aka
> PTP_SYS_OFFSET_PRECISE. Similar to ptp_kvm, system time synchronization
> with single-digit ns precision is possible with a quiescent reference clo=
ck
> (from the Virtio RTC device). This works even when the Virtio device
> response is slow compared to ptp_kvm hypercalls.
>
> The following illustrates a test using PTP_SYS_OFFSET_PRECISE, with
> interspersed strace log and chrony [2] refclocks log, on arm64. In the
> example, chrony tracks a virtio_rtc PTP clock ("PHCV", /dev/ptp0). The ra=
w
> offset between the virtio_rtc clock and CLOCK_REALTIME is 0 to 1 ns. At t=
he
> device side, the Virtio RTC device artificially delays both the clock rea=
d
> request, and the response, by 50 ms. Cross-timestamp interpolation still
> works with this delay. chrony also monitors a ptp_kvm clock ("PHCK",
> /dev/ptp3) for comparison, which yields a similar offset.
>
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000329>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>            Date (UTC) Time         Refid  DP L P  Raw offset   Cooked off=
set      Disp.
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>         2023-06-29 18:49:55.595742 PHCK    0 N 0  1.000000e-09  8.717931e=
-10  5.500e-08
>         2023-06-29 18:49:55.595742 PHCK    - N -       -        8.717931e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101545>
>         2023-06-29 18:49:56.147766 PHCV    0 N 0  1.000000e-09  8.801870e=
-10  5.500e-08
>         2023-06-29 18:49:56.147766 PHCV    - N -       -        8.801870e=
-10  5.500e-08
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000195>
>         2023-06-29 18:49:56.202446 PHCK    0 N 0  1.000000e-09  7.364180e=
-10  5.500e-08
>         2023-06-29 18:49:56.202446 PHCK    - N -       -        7.364180e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101484>
>         2023-06-29 18:49:56.754641 PHCV    0 N 0  0.000000e+00 -2.617368e=
-10  5.500e-08
>         2023-06-29 18:49:56.754641 PHCV    - N -       -       -2.617368e=
-10  5.500e-08
>         ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.000270>
>         2023-06-29 18:49:56.809282 PHCK    0 N 0  1.000000e-09  7.779321e=
-10  5.500e-08
>         2023-06-29 18:49:56.809282 PHCK    - N -       -        7.779321e=
-10  5.500e-08
>         ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) =3D 0=
 <0.101510>
>         2023-06-29 18:49:57.361376 PHCV    0 N 0  0.000000e+00 -2.198794e=
-10  5.500e-08
>         2023-06-29 18:49:57.361376 PHCV    - N -       -       -2.198794e=
-10  5.500e-08
>
> This patch series only adds special support for the Arm Generic Timer
> clocksource. At the driver side, it should be easy to support more
> clocksources.
>
> Fallback PTP clock interface
> ----------------------------
>
> Without special support for the current clocksource, time synchronization
> programs can still use ioctl PTP_SYS_OFFSET_EXTENDED2 aka
> PTP_SYS_OFFSET_EXTENDED. In this case, precision will generally be worse
> and will depend on the Virtio device response characteristics.
>
> The following illustrates a test using PTP_SYS_OFFSET_EXTENDED, with
> interspersed strace log and chrony refclocks log, on x86-64 (with `ts'
> values omitted):
>
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>            Date (UTC) Time         Refid  DP L P  Raw offset   Cooked off=
set      Disp.
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>         2023-06-28 14:11:26.697782 PHCV    0 N 0  3.318200e-05  3.450891e=
-05  4.611e-06
>         2023-06-28 14:11:26.697782 PHCV    - N -       -        3.450891e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:27.208763 PHCV    0 N 0 -3.792800e-05 -4.023965e=
-05  4.611e-06
>         2023-06-28 14:11:27.208763 PHCV    - N -       -       -4.023965e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:27.722818 PHCV    0 N 0 -3.328600e-05 -3.134404e=
-05  4.611e-06
>         2023-06-28 14:11:27.722818 PHCV    - N -       -       -3.134404e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:28.233572 PHCV    0 N 0 -4.966900e-05 -4.584331e=
-05  4.611e-06
>         2023-06-28 14:11:28.233572 PHCV    - N -       -       -4.584331e=
-05  4.611e-06
>         ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=3D10, ts=3DOMITTED})=
 =3D 0
>         2023-06-28 14:11:28.742737 PHCV    0 N 0  4.902700e-05  5.361388e=
-05  4.611e-06
>         2023-06-28 14:11:28.742737 PHCV    - N -       -        5.361388e=
-05  4.611e-06
>
> PTP clock setup
> ---------------
>
> The following udev rule can be used to get a symlink /dev/ptp_virtio to t=
he
> UTC clock:
>
>         SUBSYSTEM=3D=3D"ptp", ATTR{clock_name}=3D=3D"Virtio PTP type 0/va=
riant 0", SYMLINK +=3D "ptp_virtio"
>
> The following chrony configuration directive can then be added in
> /etc/chrony/chrony.conf to synchronize to the Virtio UTC clock:
>
>         refclock PHC /dev/ptp_virtio refid PHCV poll -1 dpoll -1
>
> RTC interface
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> This patch series adds virtio_rtc as a generic Virtio driver, including
> both a PTP clock driver and an RTC class driver.
>
> Feedback is greatly appreciated.
>
> [1] https://lore.kernel.org/virtio-comment/20250306095112.1293-1-quic_phi=
lber@quicinc.com/
> [2] https://chrony.tuxfamily.org/
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> v6:
>
> - Shorten PTP clock names to always fit into 32 bytes.
>
> - Fix sparse warning about endianness mismatch (Simon Horman).
>
> - Do not mark comments missing parameter documentation as kernel doc (Sim=
on
>   Horman).
>
> - Improve error status computation readability.
>
> - Avoid conditional locking within a block.
>
> v5:
>
> - Update to virtio-rtc spec v7, essentially removing definitions.
>
> - Fix multiple bugs after readying device during probe and restore.
>
> - Actually initialize Virtio clock id for RTC class device.
>
> - Add freeze/restore ops already in first patch.
>
> - Minor changes:
>
>   - Use new APIs devm_device_init_wakeup(), secs_to_jiffies().
>
>   - Fix style issues.
>
>   - Improve logging types and clarity.
>
>   - Drop unnecessary memory barrier pair.
>
>   - Return error status from device, whenever available.
>
> v4:
>
> - Update Virtio interface to spec v6.
>
> - Distinguish UTC-like clocks by handling of leap seconds (spec v6).
>
> - Do not create RTC class device for clocks which may step on leap second=
s
>   (Alexandre Belloni).
>
> - Clear RTC class feature bit instead of defining reduced ops
>   (Alexandre Belloni).
>
> - For PTP clock name, always use numeric clock type, and numeric variant.
>
> - Use macros for 64-bit divisions.
>
> - Remove unnecessary memory barriers.
>
> - Cosmetic improvements.
>
> - Drop upstreamed timekeeping bugfixes from series.
>
> v3:
>
> - Update to conform to virtio spec RFC v3 (no significant behavioral
>   changes).
>
> - Add RTC class driver with alarm according to virtio spec RFC v3.
>
> - For cross-timestamp corner case fix, switch back to v1 style closed
>   interval test (Thomas Gleixner).
>
> v2:
>
> - Depend on patch series "treewide: Use clocksource id for
>   get_device_system_crosststamp()" to avoid requiring a clocksource point=
er
>   with get_device_system_crosststamp().
>
> - Assume Arm Generic Timer will use CP15 virtual counter. Drop
>   arm_arch_timer helper functions (Marc Zyngier).
>
> - Improve cross-timestamp fixes problem description and implementation
>   (John Stultz).
>
>
> Peter Hilber (4):
>   virtio_rtc: Add module and driver core
>   virtio_rtc: Add PTP clocks
>   virtio_rtc: Add Arm Generic Timer cross-timestamping
>   virtio_rtc: Add RTC class driver
>
>  MAINTAINERS                          |    7 +
>  drivers/virtio/Kconfig               |   64 ++
>  drivers/virtio/Makefile              |    5 +
>  drivers/virtio/virtio_rtc_arm.c      |   23 +
>  drivers/virtio/virtio_rtc_class.c    |  262 +++++
>  drivers/virtio/virtio_rtc_driver.c   | 1407 ++++++++++++++++++++++++++
>  drivers/virtio/virtio_rtc_internal.h |  122 +++
>  drivers/virtio/virtio_rtc_ptp.c      |  347 +++++++
>  include/uapi/linux/virtio_rtc.h      |  237 +++++
>  9 files changed, 2474 insertions(+)
>  create mode 100644 drivers/virtio/virtio_rtc_arm.c
>  create mode 100644 drivers/virtio/virtio_rtc_class.c
>  create mode 100644 drivers/virtio/virtio_rtc_driver.c
>  create mode 100644 drivers/virtio/virtio_rtc_internal.h
>  create mode 100644 drivers/virtio/virtio_rtc_ptp.c
>  create mode 100644 include/uapi/linux/virtio_rtc.h
>
>
> base-commit: 9d8960672d63db4b3b04542f5622748b345c637a
> --
> 2.43.0
>
>


