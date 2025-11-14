Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DACE7B0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpPC2wtFd4NLEl4Fex1g+49rhMvK8bEF1ED2igQKkxU=; b=MTz99rgZFD5qrW/VbQBigkTzUl
	o7XM2i3ITJHK1IPq1xHd1oCRkz9CdTeqHbaFnud6GKbgkRqFpp2gD8qhd0tyWyv+KBfCBoass/p16
	JVkt54sNQDZAGyn4J6iAG5Nvrs+zVT0L3yS3CqznhCbl+LgiuMNmh2xbnAzD7radEsok7D4G1J7yx
	JPGgFQoETUIOjqAdKMKOdif5CAgRdL0BXEIg8Befd67OibM0YRpQCxKUozP4InV1IvHDL1wtMuGmw
	jbU6vVryFwWB5oJ3PVscRSdcReF816eQtAllFu8Vjzg+KVOUltyv9ArIHKzk5g0fGw41YwbWcv4i9
	APfI5TVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtw6-0000000CGRX-0pyu;
	Fri, 14 Nov 2025 13:33:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtw3-0000000CGQg-45Q4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:33:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47777000dadso14965135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1763127234; x=1763732034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wpPC2wtFd4NLEl4Fex1g+49rhMvK8bEF1ED2igQKkxU=;
        b=3RK5KHQwhmvC5oVJ8JBml+ki8Z7GoyirOyZr20LuPd7FP4Vc5vRD+5fz/A10BMrwwv
         N96rM3HgvSUVgMmha4HL8/gddWwihtdLXc1mLDzJ6qUPc2FWX2pv1q0MYxVafiNix/XU
         arOFOASrll61nfdpOGXfNdEm0Q8WEr50m9LPzaJDBfx6aA85xSuIItwpQp7+CycSjvk9
         JpJgzLY7fv5TiSd7/MqqJUaeYT0y3XlxEqdzbKglz7VkISh3VrpV6qM6ID0Ece1c5KQc
         MWa+XPIQXWK+HOVBeM/g+Ap4pm6SyqBAS67NIija7xnXc5UYXoEoHIIgA/++F83dB2GA
         gh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127234; x=1763732034;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpPC2wtFd4NLEl4Fex1g+49rhMvK8bEF1ED2igQKkxU=;
        b=stzowpUWhoflNWT3tiVJ2UwVPHep7ZGG++K34BQu6zBjEemKZ295uyGAC9THzRDgcC
         Vi4EClrizOeysSrKVyrNF9NFrI6m9FtYPbGPzKmUiGfpjxzB0cqarXLOcTCBZNTIuZGn
         kk1skXivIQXvVVlA1ur/2AeNTDAtQ4EGYYeY2+A0Lq7NfiE3DWfISc36heYuxDkTnnu5
         fDLH9mLi+rsgNYO6AP9M/0VEU/tv0MT6NpcjrL9cI1eTpj2LVTbALnrB+l8O22OnUnl8
         A+O8FGJqiySLQK4hD234CvLyEY9Ri77Z9JrsTrGQPlBT0vaK6hPfQdOTaYSgP3JNSpRj
         BNlw==
X-Forwarded-Encrypted: i=1; AJvYcCWkTDzKjnVDSKVzR1qBJpTjrsuRbUKr+483U3+Fpvaz9zCHRJmAEQyWrq/+vV3UO9KV5vTihEd6pTZgrnuVu8AC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb1DQYCdouoaQBDDQBBGZd84HVGf7IIvAB38fYb449KNJY30d6
	Zu2qA7WpkPtg7MNBMYb1Xu6FW31tDjBEJ/SAePJlcgTcVm7/vLMnqA6ylYqVSsyGXDI=
X-Gm-Gg: ASbGncub7wAFwTLQ7wy73zkFizfRFQaGFCqCfj7ECG4umIcslI/JzkT/gTaKIIFZgxB
	TIm0DSfG8VfPFYJieL4uJrSSKN+cxXTUyU6j+3eBsOjo8jrdacopeQFK6/G1Sfy+zvLEUFZX0WE
	VXpG2bF7S9BXVShjDqWBVwf+/B1lw7mzgVKpp8/thIT81Z+yaKJ3UwTaF28zQHwuk0XWAfwzJ4k
	i6gNJMu9WnQlJuZncgsWF2p/EySrSi3z1bBL5uqkhr+t+6Lq7NT8KVtOjxYHrrYFvEyUzlZG2r+
	Km3/N4+/vNvoT8NwM0ozymz/vh22hFSVU8xGtzD3dRIMuYuPuewDjA6NQxm7QN0iH0vAqpQyOdt
	O9EJ853kY4DjNbE1j6HQuRNDHKIinggSnT1IV1Ke5C74uKaaC0Wrt/mZGzXSgx8llUWgRHtZWZi
	aisVtJac+WYoAZiXkhUHz5U8sl3+uUuNgHLrcKi/h0bJ4qGqaRSO+EmA3vY87PX3XCH7YENA+jz
	xJI6ScD0w==
X-Google-Smtp-Source: AGHT+IFSfYp+TEIQ0ghuAn77Ll5FRjYgRRifxjJaxX6xb5D05/JuUxVRrH0WsOS6QGKVmw+kLQGajg==
X-Received: by 2002:a05:600c:1d01:b0:477:54cd:200f with SMTP id 5b1f17b1804b1-4778fe69569mr30877955e9.9.1763127233520;
        Fri, 14 Nov 2025 05:33:53 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc92886-cmbg20-2-0-cust122.5-4.cable.virginm.net. [82.20.18.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm44948895e9.2.2025.11.14.05.33.52
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 14 Nov 2025 05:33:53 -0800 (PST)
From: John Cox <jc@kynesim.co.uk>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	 <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Stefan Wahren <wahrenst@gmx.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
Date: Fri, 14 Nov 2025 13:33:53 +0000
Message-ID: <vnbehk9a1e1pn6qv2qj8tcaj5l62u0dul9@4ax.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com> <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com> <e99ff4f12d52eee03075f911e6b904290b47a961.camel@ndufresne.ca>
In-Reply-To: <e99ff4f12d52eee03075f911e6b904290b47a961.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053356_053866_A6FD5D04 
X-CRM114-Status: GOOD (  15.19  )
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

Hi Nicolas

>Hi Dave,
>
>sorry for the long delay.
>
>Le mardi 01 juillet 2025 =C3=A0 17:01 +0100, Dave Stevenson a =
=C3=A9crit=C2=A0:
>> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
>> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>>=20
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 4 ++++
>> =C2=A02 files changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c =
b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 650dc1956f73..3bdcbb12bb30 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1381,7 +1381,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)
>> =C2=A0	case V4L2_PIX_FMT_NV16M:	descr =3D "Y/UV 4:2:2 (N-C)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV61M:	descr =3D "Y/VU 4:2:2 (N-C)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV12MT:	descr =3D "Y/UV 4:2:0 (64x32 MB, =
N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT_COL128: descr =3D "Y/CbCr 4:2:0 (128b =
cols)"; break;
>> =C2=A0	case V4L2_PIX_FMT_NV12MT_16X16:	descr =3D "Y/UV 4:2:0 (16x16 =
MB, N-C)"; break;
>> +	case V4L2_PIX_FMT_NV12MT_10_COL128: descr =3D "10-bit Y/CbCr 4:2:0 =
(128b cols)"; break;
>> =C2=A0	case V4L2_PIX_FMT_P012M:	descr =3D "12-bit Y/UV 4:2:0 (N-C)"; =
break;
>> =C2=A0	case V4L2_PIX_FMT_YUV420M:	descr =3D "Planar YUV 4:2:0 (N-C)"; =
break;
>> =C2=A0	case V4L2_PIX_FMT_YVU420M:	descr =3D "Planar YVU 4:2:0 (N-C)"; =
break;
>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>> index 9e3b366d5fc7..f0934d647d75 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -697,6 +697,10 @@ struct v4l2_pix_format {
>> =C2=A0#define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', =
'2') /* 12=C2=A0 Y/CbCr 4:2:0 16x16 tiles */
>> =C2=A0#define V4L2_PIX_FMT_NV12M_8L128=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>> =C2=A0#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', =
'1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /*=
 12=C2=A0 Y/CbCr 4:2:0 128 pixel wide column */
>> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
>> +			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 =
pixel wide column */
>> +
>
>Nothing to report here, it looks good. I can't remember, was there a =
reason not
>to add this format to ./drivers/media/v4l2-core/v4l2-common.c ?

I'll do that for the next patch. I think they can be described now.

John Cox

>Nicolas
>
>> =C2=A0
>> =C2=A0/* Bayer formats - see =
http://www.siliconimaging.com/RGB%20Bayer.htm=C2=A0*/
>> =C2=A0#define V4L2_PIX_FMT_SBGGR8=C2=A0 v4l2_fourcc('B', 'A', '8', =
'1') /*=C2=A0 8=C2=A0 BGBG.. GRGR.. */

