Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A10F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=; b=hqudcRyxP188DboxaBWsWiz2Em
	PNVK49F0eAAHTrkGeir4W/6aeaVw3HksxoXMmb3JPnXVvOkHHGT0aezYlLa8J1f6sOOhtDdyFbC6U
	CWwBi9GdBzftCY4AuNKM5gtlxE4GI3cHw4FFLgS80o1m1/TOBo0iQcMxIYhIP1bR1ZHvRIJ9AisYN
	bS48UPJhdlLLQTatd6WyUQum/1930d/i8b84nkLenTRjeGFV30yAjDsiUQ9v6s/gsTudPRF1R2rI5
	zzBXgJ0E4+P8GAz4OH32+6L7PYwpxe1k+HVB6Nsy7YcIN/5SvYk6jsOwYlaei/Y6J5XCylHc3BigE
	kuvuP2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5R2-00000001TYp-2802;
	Thu, 05 Mar 2026 09:56:00 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5R0-00000001TXz-275B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:55:59 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56af41d1e0bso190583e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704557; x=1773309357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=CR/8LF5HTClt7hyNYZnlWlsCA/jSGi8AI8PkzIkwN4lhoePH2S084Q2a8hZ+8bRFkr
         3b84Kt8bb2L53Sd/Ws6oPIxnauIqG8cdj8r/pqXLakGQ8XsfI1WSWAng2pClZZsNn1lC
         pQnwtpVKRZhKTSLBQdg20DcWeL9WnTAzDndNTTBfdmSrFWg8p4UyNWsDr6v+Wgyyg6rb
         TMiKc5pqtX59zgTqI+WhaJgWy276I601sEXrX2Iv+unmONB5Rs/w5MQPS0afxvQELpAX
         C1w9lqJZyhQI+WF84tKUU5O3CqetZRfdvJEN4Ss+eRJdh8BDPMYb3yDZMdHIkLqFcfWt
         StsA==
X-Forwarded-Encrypted: i=1; AJvYcCVjBB59n53QHhcA/e8K6mDC6/li0J4epSYUhGKAk74OOcM7F/2NfFiaZr9LY249+EKkguZxYvPaLp6h8pQ5pM3A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99O89yPbZongKvEnU3xo1sJpVp/2S/JusVsuT5DH81gXnZKGT
	HgepzKvDxaf6jQnzVL6so8gXURGml5gHwBXcIdQAuePB/8f6L89T5uQASR9gzxxw
X-Gm-Gg: ATEYQzwCPd0Jx695aD6DDMVxyYOa/hkzu8K5RZggGpVSl8Jy5RXJOjLX/6kgM4brsuu
	6D5NxXdIQHRnALo2NJg9d4s7zDmsDPdMfXeAbOozkdvcsUaVAk0AFaKuhhKahwdelrnmifM6oZl
	i2T4VkuDaCe0ehBLNNlegYFx2hMCdC0xOlEIJ2xWuLxO9tivVLrPPtov9Fvvpod0Dp6k4Jdmm0T
	q1P1AWFfy/izgaZxmMgVUiByhKRYC/BxIkbBQXVL6rtwYVCJMqGL3jX9Z8px9FJioKaM4ozKsTy
	eEY6g0l2IRpnMru2/vB8dVI5YUcQXlh2jsL8Nw4q54/K3Xyja53//Qg+iUWS92Z3Eys06JiimLR
	/ovgXrPUeD0/tyslk6PFcbhWuDiB6YkQHiuE9f4a/pgh6bw3HOG0MuxBOfW1J3MBcRg0pfJDUa/
	lrQIVvv3EjZHuaKUtB8BA31saveuKCJahQVCXISsAGlRyEncne7NK0bnWd4P5H
X-Received: by 2002:a05:6122:a23:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56ae7603d05mr2346159e0c.6.1772704556752;
        Thu, 05 Mar 2026 01:55:56 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56adfad07f5sm7420933e0c.10.2026.03.05.01.55.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:55:55 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso836570137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 01:55:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaSgyoPZTqkCzM2ei3Zj66n+y5TWQNrB/rBQF5wZCef6LCkEj66HpaCGg1C/rKvzIRRJm8SgjDMe+TCdTuJ3+N@lists.infradead.org
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015558_571492_CB7476C3 
X-CRM114-Status: GOOD (  20.60  )
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

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

