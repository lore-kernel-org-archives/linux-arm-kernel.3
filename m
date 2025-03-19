Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE35C36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=; b=Rhlq05XHyBF5xjGZ9da84MGm+u
	NxFFgioEI8hFG21IWsdwwHnTMKECPu64IVSwHkEWQfKbZFj8gd2iKQB8A3l5p2nobN3pLgakmNJN5
	vHXCQ0cDge+xzJmuXkUZ99BvIo4PbO0uxF4D7jsG3HsrrqDZjBq6vxMZONuyqNDpJm2j8f07n5jKp
	U0TVi65e9qBsi+mmzkBmN6SjWD/Gf2DG3PxCEmlPeU+rXLHYRNf0vBhVr/Q/1mYEcrWWAmUZAoz/N
	o1PcSGLnq8qrcSmZr2mAiwqMzoEY2QNNcs14lLyr94bodNV9e0TXEk+7dap+MTnPyeMcza2/5woIt
	VcdT2ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupUx-00000008RxO-3EwM;
	Wed, 19 Mar 2025 09:14:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupSp-00000008Ra4-0fmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:11:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so941904a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742375510; x=1742980310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=jNUBVBABI3GGUAMEFZmMpqpNZh0iHvv/jLpkHwskuAzzNMWK6sRqriu+G15J9aiomA
         gw1YQogc6olu0OVOh9VHNvXW2tLlduM2MWKIf7A7wdPfAiSjTxmtIMpBBj7/m6gJU74x
         Ye6mkLZZwIa8e9l3mDoFmWR5T4nOUoJIevMcorkYmniyD37BBoLY/trrix+kc8CHp3Lc
         UMLnHpfWwpnwCqjlZbJUvqayyyFHMsiOiHEzCKh/8/+87yKHCIWl4UQjfHHFX1cwYUec
         uCDsUJ1795JJNEv5RTj+xBjHdg6zws3rn2cKYelfs4XoHEWMMFOIhreXMM6iPuTMuemR
         qd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375510; x=1742980310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuprYZJqwe4KDAJjtW9yEAvrmNFaNz9njuDT/tdH7A4=;
        b=lumvES14KXPqmcRCH6sQ3AR653XPKnlnsts8CNWozU+tiypjU+ZaZ81NMBzuQOlCNb
         L/YAEhj/ouuydUXn1b4YS9j0Ygs0qnLYEFPt7R++N25nvoxfTtu7BvbYSZXrqHxBBZGp
         W606D/d3uNW0scgIt4TALaN3gc27aAh95V98VcI7x7QkkLTzVh5uSNUQvfhgkda6HnUp
         1FNG69riLGGX7iqzHAL2AQcPH7zRczLY9Bf1z5yvHwNQ6aVKwlgsfI1mP/K50MHAPaJY
         7pHy1xVNzKPhUZwFCjxigQfdLlv7MDalTNCMsYYi5Op7wfltCYJF0z8fl2xWnREZ8/Y9
         sf2w==
X-Forwarded-Encrypted: i=1; AJvYcCWh+Xaqjvgh7AOnqKi7DZFYq+t7xBtjF5jgl2ttpkYYfUsfiqDKDjTCnYbo9GksYYKUmRp9NS1TdiHG0MwLDyoB@lists.infradead.org
X-Gm-Message-State: AOJu0YwQoHAQfj2AwNUX6BpnY3u8PpVmZaADJJZBX2ExaHvdF8MEYm7H
	19ZvNqXvP2d62DMfyNAfvSaJbUVJAcQPv4PeliR98zr5swzrjEeA8GF0DERLsSldF4+zYPKptpI
	hr1sDfzK5EsAR1EAGhyylq7wGbJc=
X-Gm-Gg: ASbGncs3tFkb7JCgXkL+2FGA6mENMQFlxEIcMF2XOa9JCkPu1hLicfmTNj/dQ1/xNBm
	jpJFr538O1mZ9T9w4xYtSA9Ay7DGiMewrvBWnMV5Xc8A/86y8bmL/3f3hlCwVVTOzEYtaWsbN65
	9tQYtVTeBNMt6ypL5O1eiRlGg=
X-Google-Smtp-Source: AGHT+IHulUmmhxYKpHLvuuCvhzTKveyDkVYVm3d6bzpsr+IdlsI0aty1tIfogVOy7fjTdFZHgdUItr+f8aeMDLV0DvU=
X-Received: by 2002:a17:90b:3c47:b0:2ff:4a8d:74f9 with SMTP id
 98e67ed59e1d1-301bda60f37mr3574753a91.10.1742375510218; Wed, 19 Mar 2025
 02:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Mar 2025 11:13:22 +0200
X-Gm-Features: AQ5f1JpoNZOhJi82lOgsg8paXpVn0pIptqVf5Y-45uL-Vvcne60Oe-MB2X2Chkk
Message-ID: <CAEnQRZCk042G01vfypi6SY3mR53kchHLYpHs_cg=sZ9vVyZFdQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mpuaudiosw <Mpuaudiosw@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_021151_288985_A3CC9607 
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

On Tue, Mar 18, 2025 at 11:50=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
>
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
>
> Update imx_dsp_rproc_start() to handle this condition accordingly.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

