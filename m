Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DE9D59D8D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1lowozzoJJLhtLf9KNkes93NkLEQ5ay2ZJuWMEldHk=; b=ig/eBsBa904VTT1Un5Zc49kv/q
	bsN14/nfZjpHZvsg0LtdZHdue2PY8cxMhA+6pyivzE3SiuF9h+b0g0MeKUuwAGTqUDn7uIVL72nit
	kxWN8ZhFMN1K5hUHnEMfvT/ehta0s00fdgfJ83Nf9PT+BoJ+WbJUKMUOqUtm0PJApzkbupakuLDUZ
	kUZFTa14s58gfLoPdf/wTfnI2EgXu+5DdR+TnGNOCpt9kYWkSJKxkSkNXH2aqgpbqFzUlZckDV53c
	tIXFD+u2YR9l+ZIPNamcByt1ioBfvcsWlg4cfFj/GtJvONcv6g5Zb5BB8W/cmV/edMf67D1hnD32m
	bfsnlaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8Vh-00000000ycc-0Bag;
	Fri, 12 Dec 2025 19:09:01 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8Ve-00000000ycD-0xCA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 19:08:59 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37b99da107cso15414861fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765566536; x=1766171336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1lowozzoJJLhtLf9KNkes93NkLEQ5ay2ZJuWMEldHk=;
        b=Ru7iARTHbckWHv7E6k8yPcY3AhNcHdA84V+iadumFFlSvLv5bC504s6eGEd4yqLhgv
         JfllvLP43DEoTWbQS52ZPBZ6ejZx5159f/MZFp97CC7wCmHENu3npwJgpyHK31N533ri
         xi1IKY2ghQKZq42eSIIFdxti4lq7AbJVSTtGeHNld5/Zn/ngMuBgSSIqfYnIOQaWT5P7
         aHAYdiRQcGr77cVOtIdeN2+ydaSyO79Z3C1C+aFkH1HWanIpol7b3ShELoI2ONbCdzZr
         Rr931VyvTi2cJ1l3/KN5UbNMuaLmfkSlKFJ3br/nf5SgfLsj3F7pTgXrZyNfuVKS1NOC
         j1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566536; x=1766171336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1lowozzoJJLhtLf9KNkes93NkLEQ5ay2ZJuWMEldHk=;
        b=wcJYWg6oy1tTeePNBzYleaR/yLHXn07lOjYnEZkXkzcI3p1YvNs9Uf8662mdeTlkof
         oT6QVO6mgSuEmbUpmEhQakxnZ+4bobJYKHh72o4+TgANg1IKaF8COm5D8rX/ClQQv6WZ
         m4I76h48mFUJDXWaWwi/evucUbCZk8giYmuIRkqW8oxXnnElz45mTLnxmV7gUM2gz4Vq
         KHwQ6dCD1DvCY+chbnWS5D59N3g0wm1Z5jGwjijzWFpjkIxNNxG02huAOidS8xOT834Z
         p2QL0u0RC+DM8hz8KcNRhAWeeZvocT+BoGl1TkCsiEhCuR5BjIsit0/wmJCaw4j/MTM7
         zlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsvKLsso6dL+A5GLLiK6HnSNsMjn26T7HYnhChdk+WC9ZRSo2Gr6Hz+wt15DblSEOSR6xjArdcf1nt6BOlnfEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQA7hEz1NSZTkImAGntK1E1kBXpO4Lu/H/eJwBof4h3xpgolJ
	aaT3U8S7Fkqk+fhj9WFmVCDF8sffkP0dy3ulXd9wsjR3hWg2SjRrz3I8ea5dErB77ite2oBRjJV
	oi4+n0L0j4Kn6cQv/6Lgchh3SeX/P6c8=
X-Gm-Gg: AY/fxX6wno5NZQff5VAugMJ04P2LDXsJ8hB7IjXRoE0LHPt+5nhlhdM4UePrHHOaSXk
	fpXlRgFNHr5f6cDsbJHyJbrHMZvQe8ySsc9LNDs9wYRfCksmUvqowXd9VY4lGxfjU8kMZamb6ah
	Nu3+ESf79AASo0WFWCLjx+vMzL4htGgB+GY8A6wksz4UB1WvMFVa7ryxW75eHe/7cEeNZe3B3Tl
	V1UVGaazZ1j3wFfQpyhIZCc6PCNHo4Ey81cnWC45r3Lf7aaS+XFIlRWUPGkpXROaIp9ILgfCW1p
	kebrYlMJTsAQH+TAacbHqafyDSA=
X-Google-Smtp-Source: AGHT+IFExYPRM8AYTREPCR0FiNn2cEF8kHz9YaLHvzzQYidgFzDIIYi/K//yuA5gseU5Re9mzWl3jepxZfOfrKHMvus=
X-Received: by 2002:a2e:a549:0:b0:37a:2e32:320b with SMTP id
 38308e7fff4ca-37fd0885ce1mr9740521fa.28.1765566535744; Fri, 12 Dec 2025
 11:08:55 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DtBFTe26P2x2ca5Vv1sRtpCh0HVrH+9qXrFDVOPD7qGw@mail.gmail.com>
In-Reply-To: <CAOMZO5DtBFTe26P2x2ca5Vv1sRtpCh0HVrH+9qXrFDVOPD7qGw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Dec 2025 16:08:44 -0300
X-Gm-Features: AQt7F2oehvIRAUYbybAc5OGP9_ieItNAWEaYLF5Yxq_HWkpT7aP6vKABZurC6AU
Message-ID: <CAOMZO5DvEA9PXc2W7tK4ocVASK59FoKH5n2PmsGYfyUbTfH_=A@mail.gmail.com>
Subject: Re: imx8mp SPDIF TX does not produce a lockable signal
To: Shengjiu Wang <shengjiu.wang@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>
Cc: alsa-devel-request@alsa-project.org, Mark Brown <broonie@kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_110858_303638_B34AA71E 
X-CRM114-Status: GOOD (  20.96  )
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

Made a typo on the linux-imx address, resending it.

On Fri, Dec 12, 2025 at 4:07=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> I=E2=80=99m working on a custom i.MX8MP-based board, and I am trying to g=
et
> SPDIF output working on kernel 6.12.60.
>
> The XCVR node in the device tree is essentially identical to the one
> in imx8mp-evk.dts, with the only differences being the SPDIF TX/RX pin
> definitions.
>
> The audio card is registered correctly:
>
> # aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: imxaudioxcvr [imx-audio-xcvr], device 0: XCVR PCM snd-soc-dummy-d=
ai-0
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
>
> When I play audio:
>
> aplay -D hw:0,0 -t raw -f IEC958_SUBFRAME_LE -c 2 -r 96000 96-24.wav
>
> I do see activity on the SPDIF TX pin on a scope.
>
> However, no SPDIF receiver (a DSP and a standalone consumer receiver)
> is able to detect or lock onto the stream. Both devices report =E2=80=9Cn=
o
> lock=E2=80=9D even though there is signal activity. The waveform does not
> appear to be interpreted as valid SPDIF.
>
> I also tested by taking the XCVR driver from NXP=E2=80=99s downstream tre=
e
> (lf-6.12.y) and applying it to mainline, but the behavior is
> unchanged.
>
> Has anyone seen similar issues with the i.MX8MP SPDIF TX path, or is
> there anything known to be missing from the mainline XCVR
> implementation (clock configuration, channel status bits, preamble
> handling, etc.) that might result in a non-lockable SPDIF output?
>
> Any suggestions for debugging or fixing this would be appreciated.
>
> Thanks,
>
> Fabio Estevam

