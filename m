Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBF8C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1p5G3xJb8go3voJ/ska7MmknNqjaKO20ee89C7s96SI=; b=u2JR6Ikv/2PLAcUSOZEBKaLMDB
	+2i6r9oAGxSjt49Pj5YzKTvomNIqiAkwXGP5ut44GiE/dxnMKYipligYZY0sBLVFGsmKGVy1VchFN
	mv+UNEd9PIL/yVT8CuuungYho1Pea0xnIfJggyVhmjAhr5FLV3xOeke1RmuY0hc1/PrVeakimKbBB
	Vq4AbqvHO4l1gZrkFdqUkfZn9JOKLHzbNtsk886cukqsZOSAu0ffYTr5iY/HFZJBf0IJAVXwZT9Z/
	pPxe1fzmlWhFP18zcUitCG3S6Ji1rQlgi1NooeW+RUH1pYlQFTYL2rj1hB13uxqrcbrEecsdUlCAV
	1ytgY6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnld-0000000BlKL-0JCA;
	Mon, 05 Jan 2026 16:49:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnlZ-0000000BlJV-03ed
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:49:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0bae9aca3so830615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767631752; x=1768236552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p5G3xJb8go3voJ/ska7MmknNqjaKO20ee89C7s96SI=;
        b=P+6sBBGM2bUKyVWfIaFmkegs9rnqx5G9Mo0vlPhBNEB+yHrkYP8DKI3wZz7pFCaheI
         F6Q4vmmGda8UV6orVix+yHsnpDNAd/fN7IFOGNE12NrS2Ubg+Ssn4uqovHG6wIciGjS1
         +V+vhS6XiVLulgjCeLFLYHKogaO3QHgmpeUVfD4F2fZBRUMvH5wKMxidaQ43oe+QUpic
         LKoyMc4Tl0e7ZcaI+nzAalGBjl+DmTWRbivlWIkC/8HA2Z43/SWhKXxE+58OPtXUMwho
         Xk0oMwSSUByrIEkaMaPAAXbKIoRe7n635i2mcPqe/V6PchTQY1E1MKnAjzMB4YXaJBM8
         JEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631752; x=1768236552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1p5G3xJb8go3voJ/ska7MmknNqjaKO20ee89C7s96SI=;
        b=LjZ7xgb4R2yPP2a7X2yerRsm0BE3Ro0A7w55iXE7gVw+xgBQ8jpMJKE9cr6ohVFfF9
         ZKl1p6f0X+pBxD89GVzmAeqV/NpqUnFO0la3MtoKCphRAFlv1hTwTpXVvfXwevdDjXwr
         Kc//kXttidbVbnJyq1zBTWSeJmt1oZJKeVNqvGoXF8mhNfllmwrmT1+5+VPAiED4bB8D
         rxXecntk6QIbC5pWpkIiWz4Cpu0V9hWTVGKVlV1WqeruxpC4Z8aGUpD/FEQw8t0Ai/Ch
         sp0d4WOCfZKp+Cg9Qyh6QpIhycjyx1/yZBn3zIrvusQxTvK6tU+vOL/CRMStziout9yP
         gagA==
X-Forwarded-Encrypted: i=1; AJvYcCVkA7+v1gOlqHlRGlHyOqYlJVX0wkiWU528v8yZ4e1Zwpb2omvyumKvoSAiU3TDx/1NGdfGhrbiY++gpUUWsmXE@lists.infradead.org
X-Gm-Message-State: AOJu0YyUOPnMRZjeAoqgPIQzkqXYc5Vgo5QHw5zyU9M0Ti5qbqmmmywL
	KXwm1ZDMp3pNwyjxGPEVFPOxdb1SUXBmpiT5l5oQVp+hA645pM5GLw8fqZU1dWWZhze1b9Z+Y2v
	URfjwvbkeB49/pNmjeGgIHOTcH2C16M4=
X-Gm-Gg: AY/fxX6Q0INGhHnz0vrUe16p43I2kUTtZ2hrt4nfk6eRmI9hcw1uWoLEuQ4GRUzDUgs
	7nz+Fz33+LppItx+7mLGdmrFKWqtWifHurKTdObBzXTMB/vxEKI0gqfAUjPMTcP5oRUhY38rwX/
	uGRsi/C5313k72Dvs3X7sEmTeHlFPqMghYhvorCYYkfFoUCh37x2rTrzI9P1FTfZ/fQtbNV2TrU
	tkoGXOwEDNxGJ7ILGzjSEXzxXaPy/Nxcvo3P2aSIuGMOgT6ScEEWI7CDCe3ou+H7+Zke4T6zgn5
	BkS57F5DpkeWIpVUFpIVnoGDTAHP
X-Google-Smtp-Source: AGHT+IGDtOegmT/WubwoP9uhYGjEyI36HrbbD+HDLKKzlp50hnIAwbFpuvZJAMWfwWQ5Fu7mo4QOpgsR9wCZJW3kUe4=
X-Received: by 2002:a17:903:28f:b0:29f:5f5:fa91 with SMTP id
 d9443c01a7336-2a3e2cb39ffmr2973425ad.27.1767631752099; Mon, 05 Jan 2026
 08:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20251103221930.1831376-1-helgaas@kernel.org> <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
In-Reply-To: <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jan 2026 17:49:00 +0100
X-Gm-Features: AQt7F2rVWmf5Npt8HCJJTiZdHZlTavXt7hjPiasOfQo5l2lbIUvVpU46LHb_LE8
Message-ID: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout, message,
 speed check
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Bjorn Helgaas <helgaas@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linnaea Lavia <linnaea-von-lavia@live.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, stable@vger.kernel.org, 
	Ricardo Pardini <ricardo@pardini.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084914_565634_3B02A5E4 
X-CRM114-Status: GOOD (  14.07  )
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

Hi Mani,

On Thu, Dec 18, 2025 at 7:06=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
>
> On Mon, 03 Nov 2025 16:19:26 -0600, Bjorn Helgaas wrote:
> > Previously meson_pcie_link_up() only returned true if the link was in t=
he
> > L0 state.  This was incorrect because hardware autonomously manages
> > transitions between L0, L0s, and L1 while both components on the link s=
tay
> > in D0.  Those states should all be treated as "link is active".
> >
> > Returning false when the device was in L0s or L1 broke config accesses
> > because dw_pcie_other_conf_map_bus() fails if the link is down, which
> > caused errors like this:
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed che=
ck
>       commit: 11647fc772e977c981259a63c4a2b7e2c312ea22
My understanding is that this is queued for -next.
Ricardo (Cc'ed) reported that this patch fixes PCI link up on his Odroid-HC=
4.
Is there a chance to get this patch into -fixes, so it can be pulled
by Linus for one of the next -rc?


Best regards,
Martin

