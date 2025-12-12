Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA35D59D82
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=; b=ugOoe952euI8+oX4Txqa1Ie3Va
	WWBcPzm1NQ1Ah7+ejua4MylHQnNtcRBF4k5HgdMDzd/pT9AvIO4aPUa+1tvf5EHgdWHTc856SXtG5
	2Xvt9ozfzzirL69Wv801SHJzIDheGpc4sP1bj7UzgmPRz4Zoy7Ty2NPd4oc7zpsmaIS1gsx48VyA4
	bnlsyKeBfMyqSrHFelBbzhYYQpq9oaj55askEn2Q7/eHbWD4MLFqRY9NQklvFZpaOYUAJGeadth24
	vGk3nYWDH6UM1p4BLFTmunNP6QXzAE/IzAiWIkTjQBpxgILDnW8F3tIbW6WONRDwZ2EAfKHrcTlxM
	xutjyMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8U5-00000000yVS-2KiY;
	Fri, 12 Dec 2025 19:07:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8U2-00000000yUz-3Sfc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:07:19 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37ba781a6c3so14672091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 11:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765566436; x=1766171236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=Kn+4EesZnPpJzeTWdDkfIwiEpCxlZKnkGVe4sqKQvNeIzwJ3XRaqfGrX+xU6emR9La
         n/xw4RZ1VAoqIpjsE3jAV46fYIDP1jy0y1PY4hDuqfVqKd4l8BE+HoERF6nHBYV+EEMq
         5QdLqlJokWYULcUuvRwh9ok8XjIq/smkSXsJO+pTP1HbyU0iPfahTnxAztTAJZVNnXdD
         /aoxqs0Dqrda1mv4cQcw6Rcaic/Pj2d2ctdUSYo7/KJbV9jMrtPMoqIDpfPpajQgZi+3
         CQrs0Lw9U1S4aOki8BBN6ogc97xVYukuEdiCZ9k8I3WzotC+hf9gqS5QWHE3134vM/b0
         C1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566436; x=1766171236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=LdkFOFb3+wqh4tqB5yXdpV1jDpWb2QuYo078g3dHjJO/03joUCBDrMCmdOrn+2gMUk
         onuL5x34f58tXCTy9cSCQ+6y9DKgTN5B9vF6A7V6r2VogDkgQue/KPBavg04PxSoouTv
         4p5TgT8tQltsw6Gab71Q7HbOvWD6NsnSP81b/16XKGNxuqkUdtB1ubb+07m7c+4qRXD3
         yr9sp8dJr+NDZ+7MjFHoCdEDfbf4cMoZhS50KyqbrEqZY2PeP8RyqFycnN4OeXhiNxjO
         BczZmZfbjed8mZ1mHr5OXS9LG5hvXrv0Me4YIJwJc88mViSXQ82V6jNB7SM6v3PvpULM
         ClrA==
X-Forwarded-Encrypted: i=1; AJvYcCUyDOOLsbW/1jLWS7FMQHy4I5DpIUP91PZVK9AmMSo+pqY9fJOZ0x5F9WZMXQv9c8cHiLQTBkgjRHfEVFaOfMtr@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpVQtp9t0gyFnNJ9fF+UzQ2URlM+t3BSx/XBGZuoTHsla9+kU
	oXvs8kLwaIAZPwP3i0rzRwT3aIU+93DwmgoAkxoI35eEcKj1mZT2NS5C7SHXUrw9n80ILERTMpF
	LeQtcPdGsbvM2jKglD7vX09ITxiCbQG8=
X-Gm-Gg: AY/fxX5GPO91Yrcl09eQkjataGapDl4TkuUcxTpG1pHqfY0guZKu5FMjfLPheCpUzZ9
	+KLeu25tGRINPQabBG4+NAiNgS+iUFBH5ZdTG1Jz4k6a6erQdOSj3PPbv5iQpJngI7RKI7C7gah
	1rSaGVjpkq86MK4ULAeZNhbmnGTjyiQxrcCH1UqV3Yk1np+O+Ww9wcZVMSoKyYAyE/4I2r9HpW1
	zPMRHgJ+ylcPYKJR+ByBFPnMrytRQYklAFxSj4n/ZdQe2bK1GP9Uiwhjkm0YazZuP+Cr8TLRVAL
	1kr7a6BLgPmjrC4/crYOC3knGTnGKorYDulPpw==
X-Google-Smtp-Source: AGHT+IGBme0rVODptUn6iJCkmAirWq7QwgRMBvHTTj2H4ybfOHw8mzA8vh8ZDOqnqjQfhTUDsD9d3feCPVc2zyuaFeM=
X-Received: by 2002:a2e:a586:0:b0:37b:b00b:79a2 with SMTP id
 38308e7fff4ca-37fd0726995mr10507961fa.3.1765566435785; Fri, 12 Dec 2025
 11:07:15 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 16:07:03 -0300
X-Gm-Features: AQt7F2rFibSmjR0O0aqBOLFwY_zT7zEPUiMsQVauu0xuCzBdtInRvdAxeu3wrSo
Message-ID: <CAOMZO5DtBFTe26P2x2ca5Vv1sRtpCh0HVrH+9qXrFDVOPD7qGw@mail.gmail.com>
Subject: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>
Cc: alsa-devel-request@alsa-project.org, Mark Brown <broonie@kernel.org>, 
	linux-imx@nxmp.com, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_110718_875005_390DB0E0 
X-CRM114-Status: GOOD (  12.37  )
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

Hi,

I=E2=80=99m working on a custom i.MX8MP-based board, and I am trying to get
SPDIF output working on kernel 6.12.60.

The XCVR node in the device tree is essentially identical to the one
in imx8mp-evk.dts, with the only differences being the SPDIF TX/RX pin
definitions.

The audio card is registered correctly:

# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: imxaudioxcvr [imx-audio-xcvr], device 0: XCVR PCM snd-soc-dummy-dai=
-0
  Subdevices: 1/1
  Subdevice #0: subdevice #0

When I play audio:

aplay -D hw:0,0 -t raw -f IEC958_SUBFRAME_LE -c 2 -r 96000 96-24.wav

I do see activity on the SPDIF TX pin on a scope.

However, no SPDIF receiver (a DSP and a standalone consumer receiver)
is able to detect or lock onto the stream. Both devices report =E2=80=9Cno
lock=E2=80=9D even though there is signal activity. The waveform does not
appear to be interpreted as valid SPDIF.

I also tested by taking the XCVR driver from NXP=E2=80=99s downstream tree
(lf-6.12.y) and applying it to mainline, but the behavior is
unchanged.

Has anyone seen similar issues with the i.MX8MP SPDIF TX path, or is
there anything known to be missing from the mainline XCVR
implementation (clock configuration, channel status bits, preamble
handling, etc.) that might result in a non-lockable SPDIF output?

Any suggestions for debugging or fixing this would be appreciated.

Thanks,

Fabio Estevam

