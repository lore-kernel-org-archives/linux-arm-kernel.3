Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNEZk5ddA3ly0m7I4Ts+PZ2QcYJquoLTFQCrFxQhjcE=; b=nZ1evhYy4Z3rKcphuHkErSaRX9
	4eTRGoyTu6ENUh286GvueLoDbLkEWFLTdGtJx/mTugf8jjwq+s9duO4ta0H/QPOoZy/HONvndR2FB
	+iuTNr6zBd0ImIS3+dcM2EJBngsiTW9cazl6vQ/eVVUWctvmUzkrS4E/OAQxaZP/8uHlJAtGIpoyk
	PfKhE2rVIlUZMwS/eTdQGCfq4h5CI98ijac2e0AmpNA3Wlops4DvHhK7lqqcnBsIOQGVoKre5LxrC
	jwetpiNhJw/G+z1e7UeQDoDtbGZbvcPy+VZ0w0Zs4lsjYmr9xztOIAdN7l1S0gahnSHfE7Qk36JyW
	CkXI5CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmvH-00000001MDk-2Z2h;
	Mon, 06 Jan 2025 13:13:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmYO-00000001HtV-1p9U;
	Mon, 06 Jan 2025 12:49:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2165cb60719so208201065ad.0;
        Mon, 06 Jan 2025 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736167796; x=1736772596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNEZk5ddA3ly0m7I4Ts+PZ2QcYJquoLTFQCrFxQhjcE=;
        b=TnJgu7U3J/NwpC9gnLT3ug12l4UzaWLk3UZwI3brHKG/VauycyUN0t/6AiRN4c8B07
         LeIbaqY3xWUuOBDFyQoRxxEDdu5QHtA+wqS6JSIePSaBvIptB5FgTq1KIzVFVoiHJHEb
         B5+t9+q0ogpwAGRXZykgZHgnebd2j14KRv8fRUMWqRhXwovXCEK2YFUIb4WdyA5dJpDA
         9drj4GBWZInZqUxztZ6HNTGlIqpMcmWU9j22nAnZTbK2B4KoHev6isng5DStBbO4qUo5
         Ftu9OFSMA9pOMTVp1vN4TW+IdrU2wtnlAroDfAkSEg1JOFbCx6QRklzdcUOs5LyokISU
         Zu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167796; x=1736772596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNEZk5ddA3ly0m7I4Ts+PZ2QcYJquoLTFQCrFxQhjcE=;
        b=AqF5BOl/OhX6V0m5FHIYqgHpwf3rXH7SZnMvZK8Nynwc0BJNYURP3EmBPf2niADF8F
         Dm/gsw10Fcjojzbj3CZrz/RFi9ZCvI+YVlLDyMSkAwiAR1DRxQF0mTPP3oeYAK4Rh3ac
         JWcqL1wdjlRs+dsrgp/f7wmhLEbJmGVC/vQFDP4tflARDiZ2F+Eww8uoH9NEzo/7Iuag
         wCMiSx6urnuy5Bp4rQs17QE+HIoVMQL9pr99PgZArYVS6nsuAIVTRHSHuBHpCced+f6L
         wLwPhHAngI83IwOBG5gecAKn9uN0LfMwvSO1EBEaMe+52UWQMJrb+C/q1xeusUPevSQq
         OUdg==
X-Forwarded-Encrypted: i=1; AJvYcCWhpDEbqsrSmkVVw0NeIdWwXywvYtacMmOgEkojOQvqQBd7zvBbwvCjouB9ddWHah0YNdjXc5YrZ8y59Jz93ppa@lists.infradead.org
X-Gm-Message-State: AOJu0YzGDtqkTS2JvLqO02p9TNdEq7QIIntcIuKxXqms0wTKijU1px2p
	iQYuLGsrCmab1B6av/H5VRMBdmyszufHMEIUHPgcITRRfWznEd1AVXDxeVyAlRA0EjsIyLBoZXN
	T/Dm55KmYdQ20jhfKUu+BC0l8S6w=
X-Gm-Gg: ASbGncuLVrhQRbgIoRnq5oWdmuV5STd7MhOTYHCEkBU1QDFYDOByQUKRYhQq55aDTR5
	6c3FwFERZ+LY2nrD+4jsuKPf2YiDKjzWy37PPqvywrDvQdIBeDleF
X-Google-Smtp-Source: AGHT+IEiBsuTS3ff1IHORBHdNPZnr464pawYcL5M4FmA7wQd0hDWTnZA/P5tSzmClXti0ljt5D65N86rEgJnLxZ2pCs=
X-Received: by 2002:a17:902:ef08:b0:20b:6d82:acb with SMTP id
 d9443c01a7336-219e6e9f521mr786531895ad.23.1736167795584; Mon, 06 Jan 2025
 04:49:55 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 13:49:44 +0100
Message-ID: <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: multipart/mixed; boundary="000000000000ba0f07062b09103d"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_044956_558755_458DA7FF 
X-CRM114-Status: GOOD (  22.69  )
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

--000000000000ba0f07062b09103d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
[...]
> > I have further verified that the gx-card parsing does find the HDMi
> > controller and links it correctly.
> > To me it's odd that only the .prepare() callback is not called, all
> > others (as mentioned above: .hw_params, .startup, ...) are working
> > fine.
>
> I think the problem you are seeing comes from the quirk of
> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> because further digital routing is required after the backend.
>
> Those type of links are not used much beside some
> CPU offloading on Samsung and Amlogic, as far as I know.
> It is possible, even likely, that things are still missing there.
>
> So those C2C links are operated by the DAPM events, not the regualar
> ASoC code. You can start here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
ound/soc/soc-dapm.c#n3995
Thank you - that is indeed the root cause!

> You'll see that .prepare() is not called, same as .trigger()
> That should propably be fixed :/
Since I'm still very much clueless about all of this I just came up
with an experimental patch. Any feedback on it is welcome (I can send
it as RFC patch - but prepare for me needing support).
With the attached patch I now see hdmi-codec's .prepare callback being call=
ed:
$ speaker-test -c2

speaker-test 1.2.13

Playback device is default
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 128 to 262144
Period size range from 64 to 131072
Periods =3D 4
[   42.043413] hdmi-audio-codec hdmi-audio-codec.0.auto:
hdmi_codec_hw_params() width 16 rate 48000 channels 2
[   42.047916] hdmi-audio-codec hdmi-audio-codec.0.auto:
hdmi_codec_prepare() width 16 rate 48000 channels 2



Best regards,
Martin

--000000000000ba0f07062b09103d
Content-Type: text/x-patch; charset="US-ASCII"; name="soc-damp-call-prepare.diff"
Content-Disposition: attachment; filename="soc-damp-call-prepare.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m5l1ck5a0>
X-Attachment-Id: f_m5l1ck5a0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvc29jLWRhaS5oIGIvaW5jbHVkZS9zb3VuZC9zb2Mt
ZGFpLmgKaW5kZXggYWFiNTdjMTlmNjJiLi5hMTE1MDE3NTI2MzcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvc291bmQvc29jLWRhaS5oCisrKyBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCkBAIC0xOTMs
NiArMTkzLDkgQEAgaW50IHNuZF9zb2NfZGFpX3NldF9jaGFubmVsX21hcChzdHJ1Y3Qgc25kX3Nv
Y19kYWkgKmRhaSwKIAogaW50IHNuZF9zb2NfZGFpX3NldF90cmlzdGF0ZShzdHJ1Y3Qgc25kX3Nv
Y19kYWkgKmRhaSwgaW50IHRyaXN0YXRlKTsKIAoraW50IHNuZF9zb2NfZGFpX3ByZXBhcmUoc3Ry
dWN0IHNuZF9zb2NfZGFpICpkYWksCisJCQlzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0
cmVhbSk7CisKIC8qIERpZ2l0YWwgQXVkaW8gSW50ZXJmYWNlIG11dGUgKi8KIGludCBzbmRfc29j
X2RhaV9kaWdpdGFsX211dGUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksIGludCBtdXRlLAogCQkJ
ICAgICBpbnQgZGlyZWN0aW9uKTsKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtZGFpLmMgYi9z
b3VuZC9zb2Mvc29jLWRhaS5jCmluZGV4IDM0YmExYTkzYTRjOS4uOGU4MTc4M2U1YmU5IDEwMDY0
NAotLS0gYS9zb3VuZC9zb2Mvc29jLWRhaS5jCisrKyBiL3NvdW5kL3NvYy9zb2MtZGFpLmMKQEAg
LTM2MCw2ICszNjAsMTggQEAgaW50IHNuZF9zb2NfZGFpX3NldF90cmlzdGF0ZShzdHJ1Y3Qgc25k
X3NvY19kYWkgKmRhaSwgaW50IHRyaXN0YXRlKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoc25kX3Nv
Y19kYWlfc2V0X3RyaXN0YXRlKTsKIAoraW50IHNuZF9zb2NfZGFpX3ByZXBhcmUoc3RydWN0IHNu
ZF9zb2NfZGFpICpkYWksCisJCQlzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSkK
K3sKKwlpbnQgcmV0ID0gMDsKKworCWlmIChkYWktPmRyaXZlci0+b3BzICYmCisJICAgIGRhaS0+
ZHJpdmVyLT5vcHMtPnByZXBhcmUpCisJCXJldCA9IGRhaS0+ZHJpdmVyLT5vcHMtPnByZXBhcmUo
c3Vic3RyZWFtLCBkYWkpOworCisJcmV0dXJuIHNvY19kYWlfcmV0KGRhaSwgcmV0KTsKK30KKwog
LyoqCiAgKiBzbmRfc29jX2RhaV9kaWdpdGFsX211dGUgLSBjb25maWd1cmUgREFJIHN5c3RlbSBv
ciBtYXN0ZXIgY2xvY2suCiAgKiBAZGFpOiBEQUkKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2Mt
ZGFwbS5jIGIvc291bmQvc29jL3NvYy1kYXBtLmMKaW5kZXggOTk1MjFjNzg0YTliLi5hYzhlZWYy
MTdkYzQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2MtZGFwbS5jCisrKyBiL3NvdW5kL3NvYy9z
b2MtZGFwbS5jCkBAIC00MDEzLDYgKzQwMTMsMTMgQEAgc3RhdGljIGludCBzbmRfc29jX2RhaV9s
aW5rX2V2ZW50KHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAogCQlicmVhazsKIAogCWNh
c2UgU05EX1NPQ19EQVBNX1BPU1RfUE1VOgorCQlzbmRfc29jX2RhcG1fd2lkZ2V0X2Zvcl9lYWNo
X3NpbmtfcGF0aCh3LCBwYXRoKSB7CisJCQlzaW5rID0gcGF0aC0+c2luay0+cHJpdjsKKworCQkJ
c25kX3NvY19kYWlfcHJlcGFyZShzaW5rLCBzdWJzdHJlYW0pOworCQkJcmV0ID0gMDsKKwkJfQor
CiAJCXNuZF9zb2NfZGFwbV93aWRnZXRfZm9yX2VhY2hfc2lua19wYXRoKHcsIHBhdGgpIHsKIAkJ
CXNpbmsgPSBwYXRoLT5zaW5rLT5wcml2OwogCg==
--000000000000ba0f07062b09103d--

