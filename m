Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FB2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=; b=iyMpSSYnaXS7cWpfRgmVuTwQul
	yn0NQnponYos79qpK61o1Yb+zONLuZFzZHFxl8+xs9fNF0zIckoXKKbIi5p8n3hcdjxS4uc1PJx/8
	YUXtCrrPgo+qTHsoVwL/s2rMc8mJrH76CYOYt4ne4L8oXgsjxGYYI8iNmWYp3yQ4Tt8zZ3kri7WLK
	+XwXtJuHy0lJZxOsarAiPNS4dFSBBGfc90TFBmuLF9hOBZXYimTY5+ftv5mRA3/YO5zY65izdGJNG
	o5DhjBUAp45fMgXAm822YSF7nE/MHURhrlix3cQ0QyxQYosYAbZUg41L8AgIy1NCUsrJFmeDkiV42
	wJGWVfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIVN-0000000GwJe-01BI;
	Fri, 07 Nov 2025 09:11:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIVL-0000000GwJC-0N2D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:11:36 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b9ab6cdf64bso238890a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762506694; x=1763111494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=GE/eENe0c7F3qEFIE1namv8YDhlht1UiWPkPkwOCOX4rmLb1r+1Rh9zA1uIBPK0Ycp
         Bwzy94STmHAsWNcLbmH96bMLp0lMmRsiWkfS4nIWUA9sK48OIk/3jCKDV8HTTbP57rXL
         7oCBmnyY3VICcRru25PD4s8BOkP8UFTQp46Fh3rJXFJCVrkEBkmkVP3MStaxwf2ydgg5
         wgZ+3JbFnOnh0a41YXIr/h2N+VrlpnzdY1UQ9KIhE2HLp/K/CsgS4nJTKqXvB84k/S9Y
         PwzWUdoeSS3Hhrn/17Ngs6S3HXNFPGO3NcExcbrkI4A0tTU13IwBeLLzeOpFe/WTJxlq
         +P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506694; x=1763111494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=LFC9ZdrDBWQVnn23Y/FlJv/fINqrh2QdkDb6gVuRtbojnd573R+TISSglIKYJpH2Xr
         cKL4yh8EpJYJ6jj3TDYed8sbIUKP9P77IOUKATdH93BKFlNp31wOTP//GgU5NfRYOKq2
         vMtzNPYeIa+GsAGxArA1EvmTZ0pO1WwXbo3MzgL7sM6fVxZiZSIWYh37PtoDyMhitcVp
         dy1fgYoueCKLabJhQNR1cQAqVgCy11nZtvsN1phFNogxR3czaCgOfie01tU4mvvo1IDc
         8Y7DFfsFf6qzzkqtFvsm6mPPy130kQ0LPq9GcjXovFOxCP0WEcJSzGYbiUjH+em/NLoX
         Pvqg==
X-Forwarded-Encrypted: i=1; AJvYcCWea/3EfKFiuXCGhl4cpF6pOk2AuEVrY2DFqgaOv59esIsuGOAvBuhgjd3O43Bmo0QIbMPquk+feIduxkk0Sb9b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh0QY7VbbMdmCRIpgsc3uLBv8PtLDcnk4ZInqBNqJT4o6CMN2A
	79v63gKKWSMmWeFaOBgNf90Dsvzm/YK47VcB1M5lo9BdML9pGfOSnN3hxt230FH4wPTpVxgsG0L
	OJNhsMwENf+PsRrMm6XNrz2qbBbmUSNA=
X-Gm-Gg: ASbGncucSRit4Br0ZcD8ola0rZxYE8y47W7DdW/dQ/E0vLqCqrjt6I7NUvPR2+MpWoz
	pfIJ4UBBKmtW9kOskt9vUOMytC+nCW6X/Yyx/InHlepj/THIlaefo3rf9YfHw3Y2uyIqMcKbOn1
	HqoAmWQHl0MEzO3xDZ8jHFR4Hwl2L/mq/cs8LARRarbRchS2G9oe83elh0cnzDRFEb26dP9lq6p
	L6D/XMwkIt1J4KppRD6pX6WDZLRz8F6qnynsvrhB53Uu2BlFiysyVpdeA==
X-Google-Smtp-Source: AGHT+IFsw4Qh5yQvF8GQ7bDn+i+78HlvDDo9Xlss7dAXe32EJJ3DKG/FTpv0vFs5HihRB4beIyG1MovPvmR4t9DxwLk=
X-Received: by 2002:a17:902:f705:b0:295:57f6:759 with SMTP id
 d9443c01a7336-297c95acc53mr15301995ad.15.1762506694201; Fri, 07 Nov 2025
 01:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 11:13:59 +0200
X-Gm-Features: AWmQ_bkGy3n9ih8PCPlxo3uy5k4L6qRRgXRYWv7PUkhd8VPxIzhklJdDlhNWAZ4
Message-ID: <CAEnQRZDcrWdAFqJkcbjy-jL=EczgmSM9grv5zp6bntWnqou_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] remoteproc: imx_rproc: Add support for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_011135_131430_C06A5B79 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, Oct 31, 2025 at 4:27=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With the minor comment below, you can add my:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

<snip>

> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 =3D {
> +       .att            =3D imx_rproc_att_imx95_m7,
> +       .att_size       =3D ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +       .ops            =3D &imx_rproc_ops_sm,
> +       /* Must align with System Manager Firmware */

I would add a comment here like this:

> +       .cpuid          =3D 1, /* Use 1 as default cpu id for M7 core */
> +       .lmid           =3D 1, /* Use 1 as default Logical Machine where =
M7 resides */
> +};
> +

