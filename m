Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37236CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=; b=0hafGLR+9fyZHP1YAOsl2qYAda
	9MyTyIR5o+Y8GBOd7vp/A5MLRdnmxl5TPIdJzI1ev9qKaZmZ0apUAWSbOasb33fLlo2zYKhDOgole
	c1CVGDEr3zqu4LqfNr9mLXuU8F+LvyqpuKBflLRSEXqXprk8sqr/F6KfCGk3TgcBY0EplBZVTelqX
	C6TsNkoB0bXwaXgxk2o4hsFdp7ZJaqI6YRxdEElTcN3kvYTDdB6YTTWjBBqB8qM1xTyMkzErTUATd
	7IYOEKOT/FNRfFu6MvPZMEtUaYbmq0ZcTYtA7HmEhQ6vGPUTak8VEMVBR0sZ+WdewVOVaWTjtZx34
	OWndUHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWwO-00000006BcC-2qOy;
	Sun, 18 Oct 2026 19:53:08 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWwL-00000006BbQ-0uO8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 19:53:06 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-990628fdff8so19967241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792353183; x=1792957983; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=WQk1eOLnIG6yQNLFFaMRlF+ppy0f6YrYSCJmm5OdFF/Jas5M0n/u7WSLBUnlmSRUzw
         digGXjs6EEesQFkcXCv6/kaA/kmvT0Xt3SyJgQHQcWE0GTvSFVi6bxU7shTImaH4SUvI
         3vh39bdkiuYjcQW4ntddfiPUUZRqFeO7s7xaz7rab1knSiQrTm1ztdN9ny+dqdZiFLhc
         gAAYLz/v/ExZmyLsSgtrPa4BctWs9BxzKo7tQpyOd4oW5Dp2eTrbWRDdW6nHN3EESEBg
         zBWL9Px/892DByvVLcC7VpYij//ux364sm7htStSnVwEDQpe4tZASzZ6qIvylTkbO1ge
         TSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792353183; x=1792957983;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wr/MzixbYBwaR8lJPphPBtNkVbR0d9HoMIeGuuWB7w8=;
        b=UJg0NtvAw6L/1faQBxBjka8+R4B9wtr5AxNbCOLZQ2BTWwFOjr+6BKrTmb2LV2UfMK
         Us6u5ZdSeLm1Gd1R1/JYTZ9rg/Zt0SDgWBLG8AomxMCrEQ5TyO06oi2jQ+AMX43JHeZN
         1nZh+Xfxu+x6cAbX5sS7KDBxN7o2X4akHQYEqVP+CcrJOZf2OGhk7FPzZafCRUOWharO
         ErOIzD9lhS8gF9LQCubT22yrpis8dG87tl78nSrLbVymsW5Ou5PQ/rVLxF7126Zd4Mfl
         zRFkRs2lY/ViZvQzBD7rdiqNngv7Z5v8rn9Te5+Myj8OfB35TKZJGMVNfmyA7nIzibYY
         aWQw==
X-Forwarded-Encrypted: i=1; AKwUvBxw/2pMZkQPQ8c7O1/gwDaXqHCxIWNzau51/vl+FrRUmPXMs+wA7fZd2yLSsYPOYGP9uM2BD2uUNJKmKtl7ewsq@lists.infradead.org
X-Gm-Message-State: AFq9FYIPMdsZ1LHCNgMJDJDlLzxxdZO40+thxYeZcSUR8qci/rVW6fh9
	YalvwLX8QeizNtcBF0gfASv9Ur/107ziUrRTPDNlGouNbfXHVKMw5KUDuStIhBBO
X-Gm-Gg: AYBFou0mxt2Hh1QTubHzquuexjERXmcMqYxotC193zaXJvdygQ4PjZDdaBO1ytEf0k0
	FrSs8w4TijdfRyvyEFqjGwSeSxiVvDRJLRCj0pADYrR6YrDMka8ZZtt9whFrrcWmj26S/bnBkEZ
	++5Hj/ITlGUs+M2+Wz0jn/QlrPxR/miHqi5S3HNlWs+QJZN4kg4Wt2tnGihzKs7q6QOeSYse8Fb
	KKCSIQWBoj9gEyyWe8MFrJTZNRdC5m5nwYkUOiHkawp0j81zQH3NbFxATq5quNS9M4T5TyhCsv7
	4/20xCkf2H8oYrDAG37H0xkTUecFawYdcgs+DBfPzj4sDGTbyFp8nH1z/5CSAGgHrWiXSWHW/iL
	Q8Y7EskKhW5M8Ise280bHoGP9zY/vyzTMb5cIelCo/vHaE6G7rJsK8mATvPfhWAkO1lNlzyk67K
	lMluoNp/FCJXij5QPNlPxegDC1qBqRrv0D2VR3NoSUA6hGR3oev91SF8N4lHY6B1mA
X-Received: by 2002:a05:6102:418f:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7cc3675493amr1035152137.1.1792353182908;
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:109f:2ff4:4712:873])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1987900fsm8043946137.10.2026.10.18.12.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 12:53:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 16:52:55 -0300
Message-Id: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
In-Reply-To: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_125305_263384_5A9636C8 
X-CRM114-Status: GOOD (  29.99  )
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

On Fri Oct 16, 2026 at 6:00 AM -03, Martin Wetterwald wrote:
> On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.c=
om> wrote:
>> Hi,
>>
>> For Raspberry Pi Zero v1.3:
>>
>> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>>
>> Test setup:
>>
>> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c=
5
>> - Setup: RPi Zero v1.3 connected to a HDMI monitor
>> - OS: standard raspbian with the desktop environment enabled
>> - Driver built both as a module and built-in.
>> - The following command was run to test the sound: 'speaker-test -t wav =
-c 2'
>> - Result: Both HDMI audio channels worked correctly
>
> Hello Gaston,
> Thanks very much for your test!
> It's great to have variety in tests because I don't have the Pi Zero, and=
 I
> didn't test it through HDMI, I tested through the Headphones jack (which
> doesn't exist on the Pi Zero).
>
> Did you also also reproduce the bug without adding my patch?
> If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi =
and
> bcm2835_headphones are both not present. And you should see this in the d=
mesg:
>> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' =
because the bus was not initialized.
>
> Regarding your test: there are two ways for the sound to go through the H=
DMI
> port:
> - One is through the bcm2835-audio driver (using VCHIQ)
> - The other way is through the vc4-hdmi (bypassing VCHIQ)
>
>   # cat /proc/asound/cards
>    0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
>                         vc4-hdmi
>    1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
>                         bcm2835 HDMI
>    2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
>                         bcm2835 Headphones
>
Hi Martin,

cat /proc/asound/cards shows only 'vc4-hdmi'.

After adding the kernel command line you pointed out, the bcm2835_hdmi
interface now appears.

The default interface seems to be vc4-hdmi. I could switch to bcm2835 in
alsamixer, and repeating the test in that conditions works. However,
speaker-test seems to take the vc4-hdmi interface nevertheless.

Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
thinks seem not to be working with that interface.

Im trying to debug what happens in that condition; I will need a couple
of days I guess. So far, this is what I could check.

Any feedback on the test or debugging would be appreciated.

Regards,

Gaston


> Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
> If your sound happens to actually go through vc4-hdmi, then you are not t=
esting
> my patch. If you can't see the bcm2835_hdmi, you just need to add:
>
>   snd_bcm2835.enable_hdmi=3D1
>
> to your kernel command line if the driver is built in, or to the modprobe
> command as module parameter.
>
>> I=E2=80=99d be happy to run any additional tests if needed.
>
> It would be interesting to test other "clients" of the VCHIQ bus (because=
 I
> only tested bcm2835-audio).
> But I've just noticed that bcm2835-camera doesn't exist anymore (it was u=
sing
> VCHIQ via VCHIQ_MMAL).
> If I understand correctly, if VCHIQ_MMAL is still there, it's because the
> bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, b=
ut
> there is not current "client" in the kernel as far as I understand.
>
> The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV)=
.
>
> Thanks again for the tests!
> Martin


