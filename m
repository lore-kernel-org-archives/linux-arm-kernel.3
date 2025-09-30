Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61321CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUTT+JbzzVh0DS04H/ZHvMyWZt9/2MTU/ePqHnEgCL4=; b=Fon4kgvfplH1pFy60wn4GINptx
	uq+Cc/MLf35V875AQuGzfBg0QCbkU8TCs3x6s/OUDNhLd2Gnj5Un54/RMfAXP2YQAQuroj8oYw7JA
	pm6NpkD8O8mSPwnB/qjnEYPRTkmU2ueHO5bHwo/zmSFD1OYchkAhf+C8whmCqcAAusprso9ptebPO
	pLi2FBWASfaDs1hTW9HsMZoRCmWRQQOn20ykumvPhZv0W2pyaBnYlDMoFPKtI0FHQxlqYpr39l9Zc
	X8cKeYqEttt5NZkk0GuRrBa8ofsR9ARLoU/7p8AvMY9F5tZ0xHIWcmmMqiBO2i54C4Pu91yTNbs3A
	qaitfnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3eeZ-00000005vwb-0khY;
	Tue, 30 Sep 2025 18:00:43 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3eeW-00000005vw1-0Nyi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 18:00:41 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-7ea50f94045so1640336d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759255238; x=1759860038; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EUTT+JbzzVh0DS04H/ZHvMyWZt9/2MTU/ePqHnEgCL4=;
        b=XKAAVfE8FtqZIpywisJWEz3ODdA2QYn0OYl42nIrq/CLVBQ2wo7GXtnq0P/8UqvZqu
         WC+ZXop8rL994LTPvW6fyO6QeF9jJivDFrn8BSAYpBSAJ8VljThaU8nRRpcNB6mjvjnc
         XAn2O/6elPv3TK0yO57lBzZGN7ZBw6prpuAxAbMzpQCKnNOEMI/nFXdFace1YBWdyJgP
         brMleNko/zUOERBYJ95J+xIllQlLyq8TW5LlUMX25hNEbreAAfrswNP8UKxUZ+xrkpS5
         GawBMPBcrxGUWiw+rywnG6dUJnHgcYtOztH6QVT8HAO4/UFcutGyC+Z8cJwCJyMpb+ms
         9MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759255238; x=1759860038;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUTT+JbzzVh0DS04H/ZHvMyWZt9/2MTU/ePqHnEgCL4=;
        b=UhvW4ywz3MJtktaNUyLTryhJuG/SNmw+stQAUaKa6cl8fC9Chi42YzEg/CP4l7Xc3t
         Clf2FG2Y5Ly2dRK+3fM/wS0qVNu6/YkJ5QVLT3UGPAMPb3YsCBK3tXbuT3+elOvGZDWz
         4uw1QAv5nV9zjWbEIBZNn6qEGV/OHz5z7dvD2ee1uQaHmD808AJHIQYPtS6xWrwRTm/w
         etwyMvvB2kPSg64DtOCcodHvdQaYzoG8Zpf7eM+ynGnH6D1mcPk4U2OxGbHf6yjJRM+q
         0ZvOArVbHhe6eQzxG/SwwsfzRGfIuhfRDWZ8PUANB8VjqxmaoMhKNjlbd2MPflMPTRwr
         Ql2w==
X-Gm-Message-State: AOJu0Yz2KqAX1dTcm/awsxFlgLXBj9CkHMe8ZXxH1ZDNCidd8KuwMPuz
	iJTEUFBUCgkbo+1ecHIo9gkFS9AJ8qqhfXxMlK7RH5vJdzBy/fN5uaKIfwWt+v3wcYo=
X-Gm-Gg: ASbGnctnHgW1SSDZyMHUXkaMYWi5w/yAM8ZBRBTnkQgiizDwXs/Pb2vgDcgWk6jpPMV
	xTES5ORcc8L4R5bhqYbQ6uBzaT1h6lPdWxviCd0pyMwQq2XxAudgLXSvaxuDlnXnJvDIvKjWPL4
	K2qCijlmh5KWv+t9/oRufaRuNrnP6CC/JtVQQTHMC1RghJCkR6pKpMhrByNbJImSt0kFQHp3c7r
	VyszIbXy4kMyoSnmu3JkoXbSYR2+dbn56vSLZ4/hHp3y4NxEg4yWzDjgLc6SYw96cVlRpwUmfr/
	VApSZ2Lr6joMCwuBPyK1pp5XwDpU1uS1VpWMo3gr5/3Cxgl+VXKLDGvceukrmwC/IL0Vp8EDtFp
	Bqz2skbLBU/EpUmKUrGZRsdp5VPNmQ/2GkW0oEK6cF2CyVtZcHNCn
X-Google-Smtp-Source: AGHT+IFzudupquJcBtLRi08DPq6SOQOtO0F/U1oyiFZrHoaOZAqVKZqhFhjxzK7i3AUHyvkX6bah0w==
X-Received: by 2002:ad4:5ae3:0:b0:775:6a7c:dbd5 with SMTP id 6a1803df08f44-8737f6525e6mr8557786d6.33.1759255238047;
        Tue, 30 Sep 2025 11:00:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8016ce9a3c0sm97452486d6.53.2025.09.30.11.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:00:37 -0700 (PDT)
Message-ID: <f0e1c897b41706f15b765f1cbdf822dac5f596ef.camel@ndufresne.ca>
Subject: Re: [PATCH 00/29] media: codec: add new Samsung Exynos-MFC driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, 	christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, 	nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Date: Tue, 30 Sep 2025 14:00:35 -0400
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
References: <CGME20250930035518epcas5p2395afdb6f22d2a6b42f9daaec6bc3c1f@epcas5p2.samsung.com>
	 <20250930040348.3702923-1-h.dewangan@samsung.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-snajKa5n4NSRuOCFsqwz"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_110040_466863_6846F4EB 
X-CRM114-Status: GOOD (  31.65  )
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


--=-snajKa5n4NSRuOCFsqwz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Himanshu,

Le mardi 30 septembre 2025 =C3=A0 09:33 +0530, Himanshu Dewangan a =C3=A9cr=
it=C2=A0:
> Exynos MFC new driver upstream proposal
> +++++++++++++++++++++++++++++++++++++++
>=20
> The s5p-mfc driver in the kernel is quite outdated and has not kept up wi=
th the hardware advances of the MFC IP.=20
> Going forward, we want to provide support for all the later versions of M=
FC in open source (both mobile and
> ExynosAuto would be supported by Samsung)
>=20
> We (Samsung) would like to propose a new driver for the latest generation=
 of Samsung MFC (Multi-Format Codec) hardware.=20
> Although the kernel already contains a Samsung MFC driver (drivers/media/=
platform/s5p-mfc/), the newer hardware=20
> diverges significantly from the previous generations, in features support=
ed, register interface and in system integration.=20
> This has necessitated a new driver, rather than updating the existing one=
.=20

I wont deny that sometimes a new driver is needed, and I encourage you to d=
efend
your point. It does just justify any form of copy paste, also understand th=
at
device descriptions should be independent from the driver implementation. T=
his
is also why this is reviewed indecently, and DT nack won't ever be ignored =
by
us.

=46rom quick walk through, I'm not convince this new driver actually makes us=
e of
everything new in Linux and Linux Media since 2011. It will be important fo=
r you
to research what other modern drivers do, and what could apply to your code
base. I'm quite skeptical with all the custom memory handling code, which
generally indicates the miss-use of dma APIs. Realistically, you will have =
to
split your driver in smaller parts and submit in a way we can see your desi=
gn
principle, and not just randomly unused files being added. Considering the =
state
of it, we are up to 20 or 30 revision, with 29 patches, you won't get to th=
e end
of that process.

V4L2 wise, one of the common mistakes is that you are adding a lot of new
controls, most of them just slammed as vendor control without even trying t=
o
generalize. It did make sense in 2011, since there was no decoder to compar=
e
against, but today there is a lot of example and overlap between various br=
and.
Omitting documentation and not keeping the API addition separate is also a =
no go
for me. Make it very clear whenever something that will live in our API for=
ever
is to be added.

We also added rules since 2011 that enforce drivers submitter to show that
proper testing have occurred. Its starts with the very basic v4l2-complianc=
e
report which you have omitted. Since its codec driver, we require a summary=
 of
your conformance decoding testing done with fluster[] with the supported
framework of your choice (for v4l2 stateful, ffmpeg and gstreamer are suppo=
rted,
you can add more, as long as they are open source).

We also expect that your firmware has been submitted to linux-firmware with=
 a
link to that submission. Without that, we can only consider your set as an =
RFC
to show people what is coming.

regards,
Nicolas

>=20
>=20
> Current driver vs targetted driver comparison
> +++++++++++++++++++++++++++++++++++++++++++++
>=20
> Target Feature=20
> Current mainline : Simple V4L2/ VB2 interface based encoder/ decoder
> New proposed driver: Dual core support, NAL-q support, LLC, Coredump, per=
formance
> measurement, plugin driver architecture, hardware manager(meerkat), DRM/O=
TF,
> Resource manager, bandwidth compression, New Pixel formats (NV12N,=C2=A0 =
YV12, P010,
> SBWC,=C2=A0 RGB family), 10 bit support, HDR support, Prio and RR Process=
 Scheduler support,=20
>=20
> Register map=09
> Current mainline : Fixed register layout, compatible across s5p variants
> New proposed driver: Completely redesigned register set, incompatible wit=
h old layout
>=20
> Command model
> Current mainline : Mailbox-style command queue
> New proposed driver: Ring-buffer command queue with different signaling
>=20
> Memory management
> Current mainline : CMA-backed contiguous buffers, ION legacy
> New proposed driver: dma-heap / scatter-gather buffers with strict alignm=
ent rules
>=20
> Firmware
> Current mainline : Supports up to Firmware v12, Legacy binary format, loa=
ded via shared mechanism=09
> New proposed driver: New firmware format, different protocol for control =
messages. Support Firmware v13 onwards
>=20
> DT bindings=09
> Current mainline : Single clock + reset, simple PM=09
> New proposed driver: Multiple clocks, reset domains, runtime PM dependenc=
ies
>=20
> Error handling=09
> Current mainline : Simple IRQ error flags
> New proposed driver: Detailed error codes, recovery sequences required
>=20
> Code impact
> Current mainline :~8k LOC, minimal conditionals
> New proposed driver: ~65KLOC with full features
>=20
>=20
> Plan for supporting latest MFC (Best balance between code clarity and lon=
g-term kernel health, while still respecting ABI and legacy users.)
> 1	We propose a new driver (exynos-mfc) for the latest generation of Samsu=
ng MFC (Multi-Format Codec) hardware.=20
> 2	MFC FW V6 to V12 will be supported by existing mainline (s5p-mfc) and l=
ater versions by Exynos-mfc driver
> 3	The existing MFC driver will remain available for older SoC=E2=80=99s a=
nd will not be broken. The new driver will only bind
> 	to new compatible strings in DT, avoiding regressions for legacy hardwar=
e. Samsung will take responsibility for=20
> 	maintaining both drivers until the old one can be formally marked as =E2=
=80=9Clegacy.=E2=80=9D
> 4	Keep it buildable for old SoCs but clearly say new SoCs should use the =
new driver.
> 5	VIDEO_SAMSUNG_S5P_MFC and VIDEO_EXYNOS_MFC will both be supported for a=
n agreed time
> 6	Long term Support for new driver=C2=A0 - commitment from Samsung
> 7	The hardware has diverged to the point where conditionally supporting b=
oth in one codebase is worse for long-term kernel health
> 8	Splitting keeps the code clean, testable, and reviewable, while ensurin=
g legacy users aren=E2=80=99t broken due to user space ABI=C2=A0 guarantees=
.
> 	This seems more clean and easier approach Both can coexist without code =
spaghetti.
>=20
> Features and description supported
> ++++++++++++++++++++++++++++++++++
>=20
> 1	MFC driver registration	Probe functionality and video nodes registratio=
n
> 2	MFC driver open & close support	MFC firmware loading,=C2=A0 "ls" & "cat=
" on the video nodes=C2=A0 and udev rules on the video nodes
> 3	H264 decoding	H264 decoding support - HW supported profiles & levels (Y=
UV420 Semi-Planar, 8-bit, min/max resolution)
> 4	HEVC decoding	HEVC decoding support - HW supported profiles & levels (Y=
UV420 Semi-Planar, 8-bit, min/max resolution)
> 5	VP8 decoding	VP8 decoding support - HW supported profiles & levels (YUV=
420 Semi-Planar, 8-bit, min/max resolution)
> 6	VP9 decoding	VP9 decoding support - HW supported profiles & levels (YUV=
420 Semi-Planar, 8-bit, min/max resolution)
> 7	AV1 decoding	AV1 decoding support - HW supported profiles & levels (YUV=
420 Semi-Planar, 8-bit, min/max resolution)
> 8	H264 encoding	H264 encoding support - Basic encoding (YUV420 Semi-Plana=
r, 8-bit, min/max resolution)
> 9	HEVC encoding	HEVC encoding support - Basic encoding (YUV420 Semi-Plana=
r, 8-bit, min/max resolution)
> 10	VP8 encoding	VP8 encoding support - Basic encoding (YUV420 Semi-Planar=
, 8-bit, min/max resolution)
> 11	VP9 encoding	VP9 encoding support - Basic encoding (YUV420 Semi-Planar=
, 8-bit, min/max resolution)
> 12	Debug fs support		Debug fs to control the MFC functionalities
> 13	Debug log support		Debug logs to get on the dmesg prompt for debug pur=
pose
> 14	Debug SFR dump support		MFC SFR dumps during failures
> 15	NAL Queue mode control		NAL Queue mode support
> 16	Batch mode control		Batch mode support
> 17	HW supported YUV formats	YUV 420, 422, 444 (planar, semi-planar) forma=
ts support as per MFC HW specification
> 18	HW supported RGB formats	RGB format support as per MFC HW specificatio=
n
> 19	Multi instance decoding/encoding	Multi instance decoding/encoding
> 20	Suspend and resume		Suspend and resume support
> 21	Runtime suspend and resume	Runtime suspend and resume support
> 22	Priority decoding (decoders)	Priority decoding support
> 23	Frame delay configuration (decoders)	Frame delay configuration support
> 24	Error handling and conceal control (decoders)	HW/Platform limitations =
should be gracefully exited and,
> 							bit stream errors should be reported or concealed with warning ind=
ication
> 25	Reference frame control (encoders)	Reference frame control support
> 26	SPS/PPS control (encoders)	SPS/PPS control support
> 27	Loop filter control (encoders)	Loop filter control support
> 28	B frame support (encoders)	B frame support
> 29	GOP control (encoders)		GOP control support
> 30	Frame rate control (encoders)	Frame rate control support
>=20
> Features to be=C2=A0 supported in 2026
> +++++++++++++++++++++++++++++++++
>=20
> 31	Bit rate control (encoders)		Bit rate control support
> 32	QP control (encoders)			QP control support
> 33	I/IDR control (encoders)		I/IDR control support
> 34	Scalable control (encoders)		Scalable control support
> 35	ROI control (encoders)			ROI control support
> 36	Multi slice control (encoders)		Multi slice control support
> 37	Profile/Level control (encoders)	Profile/Level control support
> 38	Padding control (encoders)		Padding control support
> 39	Aspect ratio control (encoders)		Aspect ratio control support
> 40	Buffer full handling (encoders)		Buffer full handling support
> 41	SBWC					SBWC bandwidth compression support
> 42	10-bit support				10-bit support as per MFC HW specification
> 43	Secure signed FW support		Security signed FW support
> 44	Secure playback				DRM content playback for decoders
> 45	HDR Support (decoders)			HDR metadata support
> 46	Dynamic resolution change		Dynamic resolution change support
>=20
> Nagaraju Siddineni (29):
> =C2=A0 dt-bindings: media: mfc: Add Exynos MFC devicetree binding
> =C2=A0 arm64: dts: mfc: Add MFC device tree for Auto V920 SoC
> =C2=A0 media: mfc: Add MFC driver data structures and debugging macros
> =C2=A0 media: mfc: Add full register map and bit definitions for MFC hard=
ware
> =C2=A0 media: mfc: Add MFC driver header files and core utilities
> =C2=A0 media: mfc: Add MFC core hardware register and debugfs APIs
> =C2=A0 media: mfc: Add MFC core command, hwlock, ISR and run functionalit=
ies
> =C2=A0 media: mfc: Add Exynos=E2=80=91MFC driver probe support
> =C2=A0 media: mfc: Add bus=E2=80=91devfreq, QoS, multi=E2=80=91view and c=
ontrol
> =C2=A0=C2=A0=C2=A0 infrastructure
> =C2=A0 media: mfc: Add buffer=E2=80=91queue and IOVMM support
> =C2=A0 media: mfc: Add rate=E2=80=91calculation framework and memory util=
ities
> =C2=A0 media: mfc: Introduce QoS support and instance context handling
> =C2=A0 media: mfc: Add decoder core sync functions
> =C2=A0 media: mfc: Add buffer=E2=80=91control framework
> =C2=A0 media: mfc: Add decoder resource=E2=80=91management (RM) support a=
nd
> =C2=A0=C2=A0=C2=A0 load=E2=80=91balancing
> =C2=A0 media: mfc: Enhance HW=E2=80=91lock handling, scheduling and error=
 recovery
> =C2=A0 media: mfc: Add VB2 decoder support
> =C2=A0 media: mfc: Add V4L2 decoder driver
> =C2=A0 media: mfc: Add QoS, Butler workqueue, and priority=E2=80=91based =
scheduling
> =C2=A0 media: mfc: Add H264 decoder support
> =C2=A0 media: mfc: Add multi=E2=80=91codec support & QoS improvements
> =C2=A0 media: mfc: Add H.264 encoder support with buffer and QoS improvem=
ents
> =C2=A0 media: mfc: Add encoder parameters, ROI & QoS support
> =C2=A0 media: mfc: Add encoder VB2 support to driver
> =C2=A0 media: mfc: Add encoder v4l2 driver interface
> =C2=A0 media: mfc: Add full encoder support
> =C2=A0 media: mfc: Add H.264 encoder support
> =C2=A0 media: mfc: Add AVC, VP8, VP9, and HEVC encoding support
> =C2=A0 media: mfc: Hardware=E2=80=91accelerated encoding support
>=20
> =C2=A0.../bindings/media/samsung,exynos-mfc.yaml=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 77 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 10 +
> =C2=A0.../dts/exynos/exynosautov920-evt2-mfc.dtsi=C2=A0=C2=A0 |=C2=A0 630=
 +++
> =C2=A0.../arm64/boot/dts/exynos/exynosautov920.dtsi |=C2=A0=C2=A0=C2=A0 1=
 +
> =C2=A0drivers/media/platform/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 7 +
> =C2=A0drivers/media/platform/samsung/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/samsung/exynos-mfc/Kconfig |=C2=A0=C2=A0 34 +
> =C2=A0.../platform/samsung/exynos-mfc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 26 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_buf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 765 +++
> =C2=A0.../samsung/exynos-mfc/base/mfc_buf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 43 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 444 ++
> =C2=A0.../samsung/exynos-mfc/base/mfc_data_struct.h | 2014 +++++++
> =C2=A0.../samsung/exynos-mfc/base/mfc_debug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 247 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_format.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 316 ++
> =C2=A0.../samsung/exynos-mfc/base/mfc_macros.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 95 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_media.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 554 ++
> =C2=A0.../samsung/exynos-mfc/base/mfc_mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 995 ++++
> =C2=A0.../samsung/exynos-mfc/base/mfc_mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 155 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_qos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1070 ++++
> =C2=A0.../samsung/exynos-mfc/base/mfc_qos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 99 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 966 ++++
> =C2=A0.../samsung/exynos-mfc/base/mfc_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 158 +
> =C2=A0.../exynos-mfc/base/mfc_rate_calculate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 640 +++
> =C2=A0.../exynos-mfc/base/mfc_rate_calculate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 106 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 58 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_regs_mfc.h=C2=A0=C2=A0=C2=A0 | 1002=
 ++++
> =C2=A0.../samsung/exynos-mfc/base/mfc_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 30 +
> =C2=A0.../samsung/exynos-mfc/base/mfc_utils.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 401 ++
> =C2=A0.../samsung/exynos-mfc/base/mfc_utils.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 481 ++
> =C2=A0.../media/platform/samsung/exynos-mfc/mfc.c=C2=A0=C2=A0 | 1366 ++++=
+
> =C2=A0.../platform/samsung/exynos-mfc/mfc_core.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 703 +++
> =C2=A0.../samsung/exynos-mfc/mfc_core_buf_ctrl.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 543 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_cmd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 576 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_cmd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 41 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_enc_param.c=C2=A0=C2=A0 | 1463 ++++=
++
> =C2=A0.../samsung/exynos-mfc/mfc_core_enc_param.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 23 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_hw_reg_api.c=C2=A0 |=C2=A0 122 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_hw_reg_api.h=C2=A0 |=C2=A0 144 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_hwlock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 761 +++
> =C2=A0.../samsung/exynos-mfc/mfc_core_hwlock.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 80 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_intlock.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 98 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_intlock.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 20 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_isr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2104 ++++++++
> =C2=A0.../samsung/exynos-mfc/mfc_core_isr.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 25 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 813 +++
> =C2=A0.../samsung/exynos-mfc/mfc_core_ops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 16 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_core_pm.c |=C2=A0 209 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_core_pm.h |=C2=A0=C2=A0 33 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_reg_api.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 597 +++
> =C2=A0.../samsung/exynos-mfc/mfc_core_reg_api.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 380 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_run.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 541 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_run.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 35 +
> =C2=A0.../samsung/exynos-mfc/mfc_core_sched_prio.c=C2=A0 |=C2=A0 431 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 423 ++
> =C2=A0.../samsung/exynos-mfc/mfc_core_sync.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 34 +
> =C2=A0.../samsung/exynos-mfc/mfc_ctx_ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1469 ++++++
> =C2=A0.../platform/samsung/exynos-mfc/mfc_debugfs.c |=C2=A0 248 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_debugfs.h |=C2=A0=C2=A0 20 +
> =C2=A0.../samsung/exynos-mfc/mfc_dec_v4l2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1739 +++++++
> =C2=A0.../samsung/exynos-mfc/mfc_dec_v4l2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 20 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_dec_vb2.c |=C2=A0 394 ++
> =C2=A0.../platform/samsung/exynos-mfc/mfc_dec_vb2.h |=C2=A0=C2=A0 19 +
> =C2=A0.../samsung/exynos-mfc/mfc_enc_v4l2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 4614 +++++++++++++++++
> =C2=A0.../samsung/exynos-mfc/mfc_enc_v4l2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 20 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_enc_vb2.c |=C2=A0 443 ++
> =C2=A0.../platform/samsung/exynos-mfc/mfc_enc_vb2.h |=C2=A0=C2=A0 19 +
> =C2=A0.../platform/samsung/exynos-mfc/mfc_rm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2652 ++++++++++
> =C2=A0.../platform/samsung/exynos-mfc/mfc_rm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 110 +
> =C2=A068 files changed, 34773 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/media/samsung,=
exynos-mfc.yaml
> =C2=A0create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-evt2-m=
fc.dtsi
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/Kconfi=
g
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/Makefi=
le
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_buf.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_buf.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_common.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_data_struct.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_debug.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_format.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_macros.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_media.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_mem.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_mem.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_qos.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_qos.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_queue.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_queue.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_rate_calculate.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_rate_calculate.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_regs.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_regs_mfc.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_sched.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_utils.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/m=
fc_utils.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_buf_ctrl.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_cmd.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_cmd.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_enc_param.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_enc_param.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_hw_reg_api.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_hw_reg_api.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_hwlock.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_hwlock.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_intlock.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_intlock.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_isr.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_isr.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_ops.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_ops.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_pm.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_pm.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_reg_api.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_reg_api.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_run.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_run.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_sched_prio.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_sync.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_co=
re_sync.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_ct=
x_ctrl.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
bugfs.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
bugfs.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
c_v4l2.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
c_v4l2.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
c_vb2.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_de=
c_vb2.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_en=
c_v4l2.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_en=
c_v4l2.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_en=
c_vb2.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_en=
c_vb2.h
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm=
.c
> =C2=A0create mode 100644 drivers/media/platform/samsung/exynos-mfc/mfc_rm=
.h

--=-snajKa5n4NSRuOCFsqwz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNwawwAKCRDZQZRRKWBy
9HOeAP9XMby7/mPmFZF1KQPpm1kpFnVYz4CtmEfncKv4T9R2aAEApzyHqNQOlvHw
EDZwNPbJnUER0c0pp3qD5LHIz4jNWgI=
=Y89z
-----END PGP SIGNATURE-----

--=-snajKa5n4NSRuOCFsqwz--

