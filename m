Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD96CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=; b=NiaHw2VuKfotMBgXwTL8woc+KD
	4L6TWEYIX0RXWte69fMlC559Y0ehVsIe7wMx09qKzfqpx7Tuu9d2bioYgU8BcsmCzdq8LbLdk/mzF
	Yn6RaXgGLZ7qYFIWjdeseXPg+0sFBMDsJD3v11famXEr3867r9ZBoN4LI++qLlaP+773dnjoEP98y
	7GCoK1+u5HuGDKzge3tGa3S4cyWVr0Ixvp/u7YV+eE4xH6ywHpCYo7+RcYy51AGsjqWdnbZDwUyyr
	C71OdUU4Rabm+vO2C1HjWFGQoRdlB/r3xWa/2sXVbd7QEKeND+vdDtIywD4oJ/pNlMl8qS1VaTDrc
	1ccCro6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvcv-00000007Ixi-3BN2;
	Fri, 29 May 2026 11:43:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvcs-00000007Iwo-3xDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:43:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T8CjYe1495941
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=; b=Fu2xW87YYyD+4yeW
	KDg4YEwTK1yKM6c34f+6/pxqjBETi2zXuZLZ7Vbd7nCqyIHkTWdzz2S6U8JNvFzR
	V79yctXtNO8+RiYESsy1Am1J+AoaBWVTaYEqPoF7/EELwXQsMHuYPvopds/Gwzkm
	ffpF6F1n/2wtxTER/MqlSN6zm7uTPXijiZqKhEG0hkEhowZgcgQ3/guY+t/QBfo6
	63Yj1qtmZuv+8dXufp919UlzBbfWBj98E05nf43soX/b3MmLCT89LRbCs2X7MoR+
	2gICN3w3XG7przi1xNh2UA4rl0Su45BZ8XWmK3hVP5x4PEHy+8suox0IzvSj/Vrk
	S/Inow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015aene-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 11:43:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90cbd806004so2809383485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780055021; cv=none;
        d=google.com; s=arc-20240605;
        b=fn/xvjABdE1PKMERmxpLNm1yLKYWEye2zd9Kj9njYHLv0qBQeE/4SxNbANtU6oU41r
         oeUflHTjmmOy6uc/dwb+7zaPpEiJIXF6oQDvjc2RySmYtIc2EHEvfY0Aeg5KsjhHdVW2
         PVjKOYqIndcDzWxCERfMqBOmrj757+tihmeu5+rnvVp5UC8+1WBpKcbjQubg3pBzCm4O
         BcnQ+OTiihGhHkYvFgi3FKc9y/te09hmeQT5jWdr7YvPsGG91h8eUBMCsUbF83vZEY2i
         bJaduRJKLvBYfvm/on/xnE9769xAp5YRmx3EZaxkaGJEaUP1pVgSzHoX79SDqO6R0n7u
         +8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        fh=mEjDwcOhbee8JmFm07py9QhKzdgzXxH1YzidIYiz4p8=;
        b=JmEPGStwNGtym0GsiwbYYpL6vPITg/DFnh09zRukA1BDx7f4xP9odhbOet5D+AZh0X
         7tEY6e3E5ZRRjHQ/WB7CcazBppZV/Y667VCbrvo+U3iSD4VEFGKJXfvsbMgqviDbLwlo
         aYLHNY7ycw7Iv1Zzu04UKawz3p7G2KTWnysB1n5EkB+ox2Ie1EUJ8g7wC7DYRtROIixL
         GLvUjS1xU7hmVwkUNplHf4dgm1n/OdLGNHQIQCNaBrG8y8FpneriVJ4qcknCGnBwN5VQ
         3AcRKX04UnOVruR6vpjjqf3sZiwqptJPXwVv9CzoaVc+tRX841hZakH4mZSBph4vGIuX
         SGnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780055021; x=1780659821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=W/B6o2LvT9Q6ETGeMLM+H9kPha7NLtwok7uCZRFX/ssDW1ZnR+HO6EOq+QTdckJKek
         Ir74XzDwJXaIFpJUuWyxcK6O7P3yn1uIcPqPL3e0rlp9MJMgK5cinoilG5cLbATKup+R
         0c4zthIFnsHkMMHxI4nVNNFI2wkceutvf7NEDs1CgvwQ3jzVGPXL817R2l6GN//6iKwD
         JP0W8D4actRtdOdj9dGmHbJSa9hvmN5E17OdSZj94m9P7sf00FXhJjlO/tPUct8v5UPx
         1Di4PD5QO5brT++ateivpOEIJDqJsNJPPsENsOkLRWHhNqkJ4Sbe74zpC02KeSjrDh3u
         uBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055021; x=1780659821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=e7GxsH3C2Cu27alxXZVo1aEhgURrNIZUWFyeTk90Wqu6d+kNGyVOadOJ/xebMdsFPs
         h8fsD1TkrrzSH/1mXhazYePc8YZjmdlYiSrD+nYuopIeQJZHWVjSeivay5YB85gQkfaa
         pF3ptZV3u/2/Y6D++mmkIG2jFD/psXcpKiFFoAqx7f3RzC+X7bRBbM2OvdbxBC/yRuRZ
         zoqswx//Ds65iA1rlM14J+9gcoezKBOoZOZX9ozHJ5buNdvfnGCoI8QRo3YtGGVc6Djs
         Szc1HS+25fBy3nz72jRnPDj3cHbqnAGFfUrsZuluLE6Dad1/rV6pnK6uYTH6TjJSxgnP
         dMig==
X-Forwarded-Encrypted: i=1; AFNElJ/y9r2UjLtzn2dWa1ukWlDI2tFU8GzvPwldZkoEPszaU9w9FHCHqK/oKuvqz/2khFGnocph9CfZWt2hDe7lBAA1@lists.infradead.org
X-Gm-Message-State: AOJu0YzUDGVLZjIJrbNUrdwoQq0M2zqQgGB+fzCa0KaNlk1agUYieGL9
	ww1NtlziE2Q9mYwMDdEVdKgPnYKklX1DUSkprTr2mBuRvJQDZvWKtTKOXPwTVmpDPoE31r8ka0I
	Li/thyEJRppWPGzRhwIAzTf0X3gSTocJVKz0NBUVyh+0AFKNqe7jWCRjBa1lIt6rRKnW5s97iYq
	Kob2R0cxvcOWTdR0fXhIFkhAZbHzatBZCPHaLpnaeQLuu9Ww98j6G/
X-Gm-Gg: Acq92OF4msNSCpu2wS+jXStwWeXD/jgecNlZtiQ9p0Tx29X263T4BeC3iaOsTU6XsQG
	aP18YV7ZFy/j+cWx2/Z4Ih3EQXkU5x0rr9cb7GC4zfMcR3s70kjhNO1l3DK+4uZfQTZz1AYEeN3
	f4zDSz8gHtACEN7iJL9UXavs9eI0lP1bi/LAhcYqQTWprH6b8CxDFU6nn36Tpd9vVDiY3T3ipk2
	DD1fH3EO63iV+bW6itvYPZ6D70RXWAMnrtLs8nhyLXuPnZTHpY=
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id af79cd13be357-915300d1513mr314024785a.62.1780055021085;
        Fri, 29 May 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id
 af79cd13be357-915300d1513mr314021885a.62.1780055020581; Fri, 29 May 2026
 04:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 29 May 2026 13:43:29 +0200
X-Gm-Features: AVHnY4IbpeWPy4_nKNjQp3G-zFolj0rVyObyJjw9IsO8YU5DydMGzXKXSO_M7DM
Message-ID: <CAFEp6-0ntknHnpsj99YUHpD8R5SMDHf8Upn+yaED-A-sxonscw@mail.gmail.com>
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: wswtTJAbek-0wE7d2NDpORhGhNEujkj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNiBTYWx0ZWRfX2/dPuFRp1E5T
 BmddbnekpgbfvRpEWHp/7RC7OpZnIWrS+ZrTiVZobYXhZwbSwYWVGD4ZmfqCuVwAWAmMRLvjpKu
 4lBeUVFfZN+5xDiANGsY9GXgqZx3pATztbO8i6q1z6UFmLAD1BNp3tlgx8vHxtklmoKAmHlE2lf
 yGrseU0OYThlpfxsxfRic3ilWvZFaPbxfVEOb6LCysBpbJSlTun6wyS0BmN0RYClIVgmJZLXZSc
 O5b5SwOcONFzhsgzsV4Qnwjz+cqMIzeEcxNQBUxYKtWBLLd2h+texXnyOHNPBvRlP1jG5U1mOAN
 5kmw1FwIa4sCyu9wRjJ/YMALfkD/nLMsh4H6HtNFLbUX2B+e+Hby4pKwsVHSXh4oRr50BYg3RsT
 2M7+rarQG/RDAZNGYr1NWBQg3pVsIt5UyFlQb67dMz8DFSkLuOdoW1OICls5YqsD1z+jwuRm9v2
 tyTeuJ+19ItX6tY5HPg==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a197bee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=GQ8KfrVOiNvgsdg8hPQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-GUID: wswtTJAbek-0wE7d2NDpORhGhNEujkj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_044342_986367_F81DA4EB 
X-CRM114-Status: GOOD (  28.17  )
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

Hi Jack,

On Fri, May 29, 2026 at 12:31=E2=80=AFPM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.
> * /dev/wwan0at0 - Interface that supports AT commands.
> * /dev/wwan0mbim0 - Interface conforming to the MBIM
>   protocol.
> * wwan0-X - Primary network interface for IP traffic.
>
> The main blocks in the T9XX driver are:
> * HW layer - Abstracts the hardware bus operations for
>    the device, and provides generic interfaces for the
>    transaction layer to get the device's information and
>    control the device's behavior. It includes:
>
>    * PCIe - Implements probe, removal and interrupt
>      handling.
>    * MHCCIF (Modem Host Cross-Core Interface) - Provides
>      interrupt channels for bidirectional event
>      notification such as handshake and port enumeration.
>
> * Transaction layer - Implements data transactions for
>    the control plane and the data plane. It includes:
>
>    * DPMAIF (Data Plane Modem AP Interface) - Controls
>      the hardware that provides uplink and downlink
>      queues for the data path. The data exchange takes
>      place using circular buffers to share data buffer
>      addresses and metadata to describe the packets.
>    * CLDMA (Cross Layer DMA) - Manages the hardware
>      used by the port layer to send control messages to
>      the device using MediaTek's CCCI (Cross-Core
>      Communication Interface) protocol.
>    * TX Services - Dispatch packets from the port layer
>      to the device.
>    * RX Services - Dispatch packets to the port layer
>      when receiving packets from the device.
>
> * Port layer - Provides control plane and data plane
>    interfaces to userspace. It includes:
>
>    * Control Plane - Provides device node interfaces
>      for controlling data transactions.
>    * Data Plane - Provides network link interfaces
>      wwanX (0, 1, 2...) for IP data transactions.
>
> * Core logic - Contains the core logic to keep the
>    device working. It includes:
>
>    * FSM (Finite State Machine) - Monitors the state
>      of the device, and notifies each module when the
>      state changes.
>
> The compilation of the T9XX driver is enabled by the
> CONFIG_MTK_T9XX and CONFIG_MTK_T9XX_PCI config option
> which depends on CONFIG_WWAN.

Can you specify which userspace counterpart you need (e.g., a
ModemManager version or a link to the relevant patch series)?


>
> ---
> Jack Wu (11):
>       net: wwan: t9xx: Add PCIe core
>       net: wwan: t9xx: Add control plane transaction layer
>       net: wwan: t9xx: Add control DMA interface
>       net: wwan: t9xx: Add control port
>       net: wwan: t9xx: Add FSM thread
>       net: wwan: t9xx: Add AT & MBIM WWAN ports
>       net: wwan: t9xx: Introduce data plane hardware
>       net: wwan: t9xx: Add data plane transaction layer
>       net: wwan: t9xx: Introduce WWAN interface
>       net: wwan: t9xx: Add power management support
>       net: wwan: t9xx: Add maintainers and documentation
>
>  .../networking/device_drivers/wwan/t9xx.rst        |   48 +
>  MAINTAINERS                                        |   10 +
>  drivers/net/wwan/Kconfig                           |   17 +
>  drivers/net/wwan/Makefile                          |    1 +
>  drivers/net/wwan/t9xx/Makefile                     |   16 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c             |   95 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h             |   88 +
>  drivers/net/wwan/t9xx/mtk_data_plane.c             |  104 +
>  drivers/net/wwan/t9xx/mtk_data_plane.h             |  105 +
>  drivers/net/wwan/t9xx/mtk_dev.c                    |   55 +
>  drivers/net/wwan/t9xx/mtk_dev.h                    |  114 +
>  drivers/net/wwan/t9xx/mtk_fsm.c                    |  931 +++++++
>  drivers/net/wwan/t9xx/mtk_fsm.h                    |  140 +
>  drivers/net/wwan/t9xx/mtk_port.c                   |  967 +++++++
>  drivers/net/wwan/t9xx/mtk_port.h                   |  176 ++
>  drivers/net/wwan/t9xx/mtk_port_io.c                |  576 +++++
>  drivers/net/wwan/t9xx/mtk_port_io.h                |   41 +
>  drivers/net/wwan/t9xx/mtk_utility.h                |   33 +
>  drivers/net/wwan/t9xx/mtk_wwan.c                   |  475 ++++
>  drivers/net/wwan/t9xx/mtk_wwan.h                   |   17 +
>  drivers/net/wwan/t9xx/pcie/Makefile                |   19 +
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.c             | 1527 +++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.h             |  176 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.c         |  373 +++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h         |  174 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c    |  177 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.h    |  101 +
>  drivers/net/wwan/t9xx/pcie/mtk_ctrl_cfg_m9xx.c     |   55 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.c            | 2714 ++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.h            |   16 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.c        | 1586 ++++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.h        |  268 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv_m9xx.c   |  687 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg.h        |  387 +++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg_m9xx.h   |   37 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.c       |  168 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.h       |  161 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c               | 1067 ++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.h               |  219 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci_drv_m9xx.c      |   70 +
>  drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h           |   72 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c        |  593 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h        |  105 +
>  43 files changed, 14761 insertions(+)
> ---
> base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
> change-id: 20260529-t9xx_driver_v1-1744f8af7739
>
> Best regards,
> --
> Jack Wu <jackbb_wu@compal.com>
>
>

