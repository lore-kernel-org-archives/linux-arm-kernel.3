Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8035DC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=; b=4McG04ULJXjuArFqm/6mbFTcft
	vc1avCdazgNSZQgpVtCI0XZhaKsLF24Xf2giUZ26kRM6/HMi+lf6rvGiLqpejMayaimE4lxAl1er5
	zymridDFS8JskQyk0JxVCHw2dKgxhgpQpfm8Sz7H4QyHFQKGSyWMDNKR8ycpPWdbXNmxP7iN5Kbcp
	8d0VaPHUUKYQp+kydLMrUb5joUDIFvM6eXx3yk2lmJXkTO0OSTuODBANdgD17gZ8zwFucPVdcrhpF
	7M/d4Yxc6XJLOwl8v2ksO9ngKr6tF9yqfpvCJlheLz6bVh5NGpCuu2r9zLgyUG9/1hdKAdHhL7M5P
	3Rc/9W0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBk4-00000004qtK-1sla;
	Mon, 16 Jun 2025 15:27:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9ux-00000004YBb-1xXA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=; b=jC61nTD3VlOKqxSzxEW0sly9cl
	HQtdz2yazYdZgSYk2N17PvFEGxATJYcZSb8lw8D8kpDl8GUpdkteQLyEQELeXs4Zc3adlQG2KFhPW
	W+Cito6E2wmPUEN6jKsUT3FzOg+Cb4Tz3vBrh5IWjBHdMvs2TL6zcIGV2zszUAX/LiFt4Gtns45lh
	bSHwSXOPqMa1p+awwZrj5HjNoiwVvXkNu4nnuBbPu1d3ErOW1e1B+3KNN7nUrSX38tosLlc9ZJj3e
	EdTawkqizf1/9vooiHaqV7+RfSoM8D80OdQK8vCphflTP6mfN075NtmViXshL6bjBabyS2sUT+674
	Z/pRCJkg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9uv-00000003b1I-1jbx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:30:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-236470b2dceso37089025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750080626; x=1750685426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=Qfjph/pU51khRy5ux9/GUIIMikCrHc8X+KSY9+VCoQv2qVQl7RsU+BGJCB4VaKEs1P
         Ulbl8FpxE+xW0blreC+esTBpp0zDwEKqNMm/+84ywGyyr7YPjmtwwXK5An4i3adcGWJp
         YA5afXuxwBMqdmEowvNpXibCHjZuA0caqDTHyMTxdd1Z55QNjOx2E6n03Z2SdNzwVXI5
         nU/UZywxRFuZj0+ZxYwEsqq3rXA8scouwseA+VFIK98dTlK9pJWl3fluEjw4HXWZwgjv
         LS+mNz7n6LE/HLK9Le47l6okHP7RUSbwN28ctNLnpK31n7f3rhlS1WK0fXGdSk38XbK3
         HwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080626; x=1750685426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0hEZwGp1ZWclkFU1+i1qSi3AaZ5vIDWkPqR7hw0AQY=;
        b=N2bsLNvPIJ9/6CjuuakK6I1tEgC93vFw1eWOLskzuZZy+0LsPZSkNVCM/uKVpQRMkS
         yEuQ0xlq6snCinHC0ybDm/TRcsHf0zaywnj1YD3+K8aUh/9v2N2k+2KjQMM3td4NKFHW
         etI9RYStw9I90GE8DiLj6H0VaaAssnG3lGWCLOkuD5bjP8E8LdTCHmnRK9fvG/8mJ8LC
         Rhs1ZUekc/elODcLXOqygHJVxHHhqxmWM9GAsED/M0zEsfajPsXWjMg8FGZSCEd1RjVz
         XjE590NmE9WFG8j/GhFZuupPK8N/S24e/EruJSgZBGQyinyAa/+jVbQzo5EloTKXNAmw
         tMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5dbw1aapAmVYh0lM8oVeRdFQCsUQ2MfIS6CxUlvOtyQ2WgNftmOa+TPpWB2E5Grb7z1Qj2UhxYLheL9w8ORUN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrv4r4HGbGVnIzWQYq8sap0oNajl4wpD9Qfo3Q3EiyzKsZnyfu
	HVwpZQcjiBLOeIR2l8UrHMFvnhQOqyE0vnY0+SPs4uSJ62IxweQFP0M65Eee5MN0YkUMdkt16/M
	IdIvqY7Zu80Yc8+TNFm1jehi0QGHN/GPe23Y2
X-Gm-Gg: ASbGncv712F+szkEah2m+NZof8q1PCZGiHGAlXhQ7Oz7GKofviEWpNZCC0MgXTIfzwg
	+c/HkPp0+CDmcQMQ7wzCw1fFYEhdSN1lINHKWIxXI0wgm8zGHask8Q25ySa2rD4r0mhLhePKH0a
	5X1W1UVv5Q/ZGj6FwWAHLdzufgWGVsaIyQsW5ELluH
X-Google-Smtp-Source: AGHT+IHrnOe9BgEaf7IB6cKO8/zukFqN2HZ5IAYeo7rZcnUwyz06zgXtx6or4FKsocwZQxMzpq7RhmfRl7nR3WTEeSU=
X-Received: by 2002:a17:903:228a:b0:235:1962:1bf4 with SMTP id
 d9443c01a7336-2366b32ce3amr144470995ad.14.1750080625607; Mon, 16 Jun 2025
 06:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:32:27 +0300
X-Gm-Features: AX0GCFsogmtArdg5rIwFR58rkkFYwbGckSH0KHSur5wUDe92Y-KCqAhSavVUQsU
Message-ID: <CAEnQRZCq45wzoDLd=_vPn8cNkiVrbYrg5LJwbZUSdRndRn_U_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_143029_507804_BA7700E1 
X-CRM114-Status: GOOD (  19.17  )
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

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

