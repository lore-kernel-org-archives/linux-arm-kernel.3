Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C89D59D8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=; b=MRzTaX1F3R+B5jtLuNVID7eaI4
	fl8y7m85IM+aFQVMfwmzmSYLMHS/MTm7yX2EZ03Si9MG/VGjEwTQjTvZlJe00AmEA52rZ/e+WbE3Q
	WRSgozhjeYDqqYv9CcKwf7bFJuhNqzvQxPF1n01IAyYeMSWSJU7pmmjNlGfrtG01uDxAqOPaTjUQ5
	bF3WOFEqnwHb6HfdYplCYCKgOY8in3ckTFG7sVk1hTTZEeyc1GvEkny9exIqb1VF34vR8VpcUrG/B
	3Gwlu/IVKJT+KepfXUF3eJGsSHTwCN6fN26fQ2dDqa2cig+xf7hhlQdTh6Y5oZJjHy7Yw4KpaiwYO
	hqsLM+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8Ym-00000000ym0-2eqt;
	Fri, 12 Dec 2025 19:12:12 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8Yl-00000000yld-02ni
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:12:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-37e578d04b5so19153521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765566729; x=1766171529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=QXKb1R0fPPzVwxJF3okJbbgwQJCxw4ztO7kw/qxG2IPJZSt/qkPgfMHE7GXnFAi029
         pMv+HpuK6aSxY90d25yNiZ0iH/OLG7DqAOQ4sJlSUc5RyrGCRBt7GJT7+7LBFqaSIhfQ
         3CoDkOpNcBamLAgEtdwIoDz5dlcxyIwT5sxB0ad0WVWCY9+qbPrlSOTm5eQtTzb1xkCK
         CN5Tf5I4peUSggmbkdEyrD8PWsxore5Ur9NFwMX+3zl3kuz1+JGNwTtCEDCAuYJUUhCA
         rau+I2d1N5XwSlCMkxPBy9Ty3w/AIQddTEQ1HPB9KBC6nuz7Dbq6Wp/tpL3wpt2SHBWQ
         tRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566729; x=1766171529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukvRgMINo4cgRsNKCNTMLrsVB8Bgy8vz4JhLYrjNDk0=;
        b=MZmMjEwgUNSpLTdcxYWBVkwNyb+onMJVOjO87A/6O4Tv9UlHdEIEzV1Kh7v9YiXosf
         zfTn1tmsUaitkgqfuh2phrQ+3cZIdaPRDZozlFQ58ZjuuwHpDw8N3bBU0CyrygNNYeEo
         D1dx4eYtwCvShqp3zBweLZwXwo4szu+sWCDk56I7uE336/hm7MWNrPRtDmqywexND9zY
         ziebUKxBdoDzN2zrrAebYM7e4YRnrY6bdP51DV7CcXOO2GdmLtC8/v6NjTavvam9djw7
         tPJuBRMqvAL91KM5/AsH3rdZu85vbW+05BOucvs2GOjCITl6/8d/MUCpjhtLb3LB9fnL
         XEIw==
X-Forwarded-Encrypted: i=1; AJvYcCXFCT5ANkeVJE0EfRmDcpbLYrhxv0Lc5rfiTvyf2+sHLUv7N3iij6HZcS3zdJWri1ADmUtLnEYr5EXYYNd0JUk8@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAfNSALtVLYHwox80Z2pLBPL3iG4uOYT3d262cdWEIo3HdZit
	b2oN4u78WJcqK8cJX6OQCPRNKXr7sCqinhxem9HIoHrP9VgnGC+5AGk50DXBddGApRKUh2rUjUq
	wMd8G2XSU2jziVmF58OM3tFJOnGvNLyY=
X-Gm-Gg: AY/fxX5u1P/i/KkmQMaU/ce90MgbhMOkTBQq9pkBpFdATdYyDudf5QiiwPMzwvTycMv
	g3Qn5qTqbk7Y8me6HKUEHRsS2zWpj3r9TDYVMUkUx5kkJojl07TuDrLWsmgi9IVfcdiZ1hUrAHp
	gBcsPeYaAOlwUeCFNHaxk6kZP+NsXdT/zHCs6kKBX+tn9gFyzJ76z2gSecjLtfGH2+S8ZZZ13Je
	exy5E6F9aRXLl+fQkbJoxyywEgDYAg7Z/HsYNW7WvwzJR6XOfr0ATBCTZGAW3rzDa4YtYdgrWFW
	NORxLxX3/9RGMOxC3iU3mTFnFzsEMR4LRYUp/A==
X-Google-Smtp-Source: AGHT+IEj10dSESv4tqdD92uZgst/HdgduZtFST/NwUvAzU4bgg9CM9GXNKBGTyQEbISBDFfwIgz40BfqPb/BI7eLkUw=
X-Received: by 2002:a05:651c:2222:b0:37b:9dd9:d203 with SMTP id
 38308e7fff4ca-37fd074cb0fmr9631101fa.11.1765566728739; Fri, 12 Dec 2025
 11:12:08 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 16:11:57 -0300
X-Gm-Features: AQt7F2rggIkxVWeg4u46uD2Cc-AiiURCFH_xEAAKKwLi1TDPjFTpo4ieh6EQ3lw
Message-ID: <CAOMZO5BuMLhMyMkfE1xhOwEs2U=+pZnVq+FP+_bp5W_Qg6oMxQ@mail.gmail.com>
Subject: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_111211_054565_D419FB7F 
X-CRM114-Status: GOOD (  11.94  )
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

