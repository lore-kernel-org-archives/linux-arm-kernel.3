Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF2C02184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjQD7wnzrgRiFT2qnnM8Tu9JE5J2THHckGAFjcSoO6I=; b=lYkkiUFufWK7obiUJd464ZzV4d
	AZLSKM/CihqH6UdP46BKjmCjB6hp91bf7+W7+ND8Cgtjgtlmj0XaFPmpUMH38ifQ32AcVpprToBZj
	XTUPGU+/NhYTIJXuSL6Q8dKng0KSHJwwVyC6Lk+4H14zQXHP0XqlMPmaTZQhQP22/QaS3FTI9qonz
	8IMxCi0wONUn5i79+xd7+XS1bLco4MAZG2MyniUDRTdbDzbR5SFdfdV3RyPHiJogdiX0cE9CLMtJA
	3XBiUAGV2xUWjzZyNnD7C7lv9956Q2H4xJbv3GIwqO+JG55V4qGepAYDaaxFp0gER4DfR//71lNub
	9jBPxH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfHR-00000008Hdz-0yzW;
	Tue, 14 Jan 2025 11:40:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfFE-00000008HIY-2ah8;
	Tue, 14 Jan 2025 11:38:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736854659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K7bpJoRSD9xaIAURIufGX2z7/sm5DwWQadN52Eb15woL8g8Lf+l9p9/fH4LU1XaNc3kS121S+xP3WwsJ9l90mJKRfqo6j02t5fSISv5Dvfj0o/Xzq+eAhlN+xZOxsv77vitaqO8e+idlWO/DOM6aUYA8W8yzzV0pPYjWGgwGCa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736854659; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KjQD7wnzrgRiFT2qnnM8Tu9JE5J2THHckGAFjcSoO6I=; 
	b=D8OdykcCRRKQfNSJH6+LY1fhWSWWamjHe89vaxZTl0tIlchBZXVPkL2U5xJAhwB2z3XdCFFi/7ObNaMvIljLtABWGpFhW1yooID9I9HRYQqV2rzWGSHk21mlyARLgd0QHAXobfp9Fr1alm+ZvwQOmQLjcubcXUKnEN6aw+O+tmw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736854659;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KjQD7wnzrgRiFT2qnnM8Tu9JE5J2THHckGAFjcSoO6I=;
	b=Oe++g22Q8hGcC3MenJqDOIgRmGKuaE4Q/MQTx0pV4V/Zgii555nAhn0ZyI9oHwX0
	PmS6jvKZA0git0k/0l+QpCkrUqjzq1KGNfNt06dmlFOOrHaodKl1PddgMUedvXpa0AK
	vh4bLSzfLHlAUAqDpvH/6TW2FpHOEAingRxHXgMk=
Received: by mx.zohomail.com with SMTPS id 1736854656305475.3833676137276;
	Tue, 14 Jan 2025 03:37:36 -0800 (PST)
Message-ID: <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
Date: Tue, 14 Jan 2025 14:37:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_033804_750480_F3DE9C1F 
X-CRM114-Status: GOOD (  29.00  )
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

On 1/9/25 02:17, Tim Surber wrote:
> Hi,
> 
> I tested your patch with the command
> 
> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> 
> If this worked I moved on to a visual test using
> 
> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! queue ! v4l2convert !
> waylandsink
> 
> I used a Windows PC  with a Nvidia GTX 4060 as my source for the
> following tests.
> 
> | Format       | Result                                      |
> | ------------ | ------------------------------------------- |
> | 4k60p RGB    | Recognized as 1080p / 120 fps - no output   |
> | 4k60p 4:2:2  | Recognized as 1080p / 120 fps - no output   |
> | 4k60p 4:4:4  | Error: Device wants 1 planes                |
> | 4k30p RGB    | ok                                          |
> | 4k30p 4:2:2  | ok                                          |
> | 4k30p 4:4:4  | Error: Device wants 1 planes                |
> | FHD60p RGB   | ok                                          |
> | FHD60p 4:2:2 | ok                                          |
> | FHD60p 4:4:4 | Error: Device wants 1 planes                |
> 
> 
> When testing 4:4:4 chroma I got the following error:
> 
> # gst-launch-1.0 -v v4l2src device=/dev/video1 ! fakesink
> /sys/v4l2/gstv4l2object.c(4344): gst_v4l2_object_set_format_full (): /
> GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Device wants 1 planes
> 
> I could record and convert (with errors) the files with 4:4:4 chroma
> using the command Shreeya posted, but the resulting video had wrong
> colors and was flashing.
> 
> I was not able to test 4:2:0 chroma. I tried to generate an custom EDID
> with support for it but I could not select it in the graphics driver in
> the source, maybe this is just an issue with my setup.

Thanks a lot for the testing, very appreciate it! Good that RGB works
for you with no problems.

Testing YUV formats isn't trivial. Personally I've a custom setup with a
modified display driver of RPi to test them. See more below.

> I also observed that the the framerate is reported wrong, for example
> setting the source to FHD60p RGB resulted in the following:
> 
> # v4l2-ctl --all -L --list-formats-ext -d /dev/video0
> Active width: 1920
>     Active height: 1080
>     Total width: 2200
>     Total height: 1125
>     Frame format: progressive
>     Polarities: -vsync -hsync
>     Pixelclock: 214076000 Hz (86.50 frames per second)
> 
> This wrong framerate reporting seemed to happen across all framerates
> and resolutions. Gstreamer Pipeline negotation showed the same results.

I've re-tested YUV444 4k capture using RPi4, works flawlessly. Note for
gst-launch-1.0 you used video1 and video0 device is used by v4l2-ctl
command above, maybe you're using wrong device. Please post a complete
output of the v4l2-ctl command.

The command I used to test YUV444 capture:

# v4l2-ctl --verbose -d /dev/video1
--set-fmt-video=width=3840,height=2160,pixelformat=NV24 --stream-mmap=4
--stream-skip=3 --stream-count=3300 --stream-to=hdmi.raw --stream-poll

The I converted captured data to a video file and played it:

# ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt nv24
-y -i hdmi.raw output.mkv && mpv output.mkv -loop 0

Don't see any problems with a reported framerate:

DV timings:
        Active width: 3840
        Active height: 2160
        Total width: 4400
        Total height: 2250
        Frame format: progressive
        Polarities: -vsync -hsync
        Pixelclock: 296992000 Hz (30.00 frames per second)

Note the timing data reported by v4l2-ctl updates after launching the
capture. It's not updated dynamically when you changing mode on the source.

Lastly, please run `echo 3 >
/sys/module/synopsys_hdmirx/parameters/debug`.  Watch the kmsg log.
Check that it says "hdmirx_get_pix_fmt: pix_fmt: YUV444" when you
connecting HDMI cable to a YUV444 source and see other related messages.
If it says RGB, then your source is transmitting RGB.

> During my testing I got sometimes an error
> 
> 
> # dmesg
> dma alloc of size 24883200 failed
> 
> 
> I'm not sure when this happened and how to reproduce it.

This comes from v4l core, should be harmless as long as capture works.
It's a known noisy msg, you may ignore it for today.

> Then I tried to use an AppleTV 4k as source. I don't know what
> resolution it tried to negotiate but I got this error in addition to the
> previous "Device wants 1 planes" and no connection:
> 
> # dmesg
> fdee0000.hdmi_receiver: hdmirx_query_dv_timings: signal is not locked
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> tmds_clk_ratio:0
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> dma_st10:0x10
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock,
> tmds_clk_ratio:0
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x0, scdc_st:0x0,
> dma_st10:0x14

"Device wants 1 planes" sounds like you're using a wrong v4l video
device. Please double check. Though, the "signal not lock" means it
doesn't work anyways, please make sure you're using the default driver
EDID and not a custom one.

-- 
Best regards,
Dmitry

