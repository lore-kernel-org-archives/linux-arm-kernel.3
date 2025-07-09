Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB95C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=; b=LLM4wOYG4qIyqcrhkU5y/A9sE0
	PO2pBH/AxBs/F/xfa57A+8pu3vmCrhHhc71S5aEkk7V3F8LMpVCN9+dYzbhUovYLccy/WLbzXfTLl
	hgKw0wTx2cKcMop6d7hJi8uVBF8csdkTb0fnBd6Vuyz+zi2dsLKrZTvMTtPqLQK4nLPiw25vLJuKX
	Ai+7sXMprCkHKwmJji/2J/jOXrQVs7mAC3f9Jz0uXrqK2zvS4PkSeBXZL2ku/cEE+Dy0oJxIe1l5Q
	77JGxFywq3uuYOKVMRdWVBDWiRiZtOeMgKOX1nMPSM3uGTkH5TLP3E6k4Fm/dRpCEilQEyRsWFjqt
	cbUcHY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoa-00000009y7R-2mtd;
	Wed, 09 Jul 2025 21:58:56 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZWu-00000009YhM-1Fif
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:28:29 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2f3dab2a2a9so108994fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 11:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1752085707; x=1752690507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=;
        b=Qq7NDIwYAPPw/ePsY3nT+ppVhtDsRoSQoRR09NxsZemqLWUKyDIVMuozqHb6HhkG55
         V7jFVpbwRYkwnFpibA10KdKWpKdU0ki9kS0iquDeaufcI79Q17YdSY5K9ZKqsg9g5CmL
         t1JpcnaAZgG3w24XL7JOQSn2pnAZGvgtL2f9wBq1HYrWX1n3PIF8/EX3mIWgWmIFlxM7
         DpG3RK5dOZZWliUhI7JphhHYS7GdHAcpae2pHdfEVFWor5Kmonz0ofrWNye57WZieULG
         MXgMIp0X19kTy2E4GvMI64fwA/T593Tg1tMCGrV9ZxbLNTrkmMgKO+/2BkXgYukIBcnG
         iNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752085707; x=1752690507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EF3tKvm/yLMAj5ER680mB6JtKaeBj11j3qvBwe39Xuk=;
        b=viaEioIVhNbICeTxoj9pkLihlsXkWCMFdiyMlGHtMl8tHgLE5vaeodMWUfQHE33lHV
         aL2GZG5o+/cf08Ec68ZzXARBvIyX5f83/+KN+Y/koiyjJndTM+abaLD4HwSdlcCgjN5Z
         AN9GE9gS54lHJJu7MqJoPOPazmks3Id7anp+G/q0UgYX7mmDT5eZhzq4tLeldUJQvaCf
         BUfgiVWhmM/+FsePXH1+zhn9g+FtIKwFqp+h5QJ6mZDtMSc80GNKM04J0v6VWOZL9OJz
         ls/86Qg8MXMPIsNPkbsy93Mvk730xLXp3gs4DHlaZgqUyC8i/6GBl4KvOKh01SMWrSRf
         ib+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCGKRDDbpnMwhXjToerhzPXMMmNARQb6m6Np+qdqW0tureaVdOeYqDKiJyYq0gstdWSzb1D3nhTPYrB6lhmZJH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5CKtwCD94rWxadyQY3/briZmHx/i6erHur6VF1Ezjfm6TBwka
	Do4GFUNZoPN908IUHUL/01csmhOajN3DnD7ID2f6c8AI3Lfej1UXgdE5oRR02KENPtdZL3aAgLQ
	WuTT3A24wUozrub/CYy1j9QJR0JDrGDDKksnwiOXFwQ==
X-Gm-Gg: ASbGncsXrtPpdfybrn1352LLS4XVAXgmZL0EGnQ/Aqeo+GYIDbSgkhcxZdm021FviIF
	RRFLTPv9qC+nvytmgnGajQdUcIeBok740pMnsl18GI90deyc0krulViig1EhzgV7bv4/e35jhmb
	TXAOQo9+JXHpcHGd05sRMD9zcKpHRIBYe5ra96MqJVhbc=
X-Google-Smtp-Source: AGHT+IHA/hKgmN+ZQ0rDeLHDX1FbU4i9gta+XOUEkPAn4h5OjDz1rrmG5m9UAzx1iDyyI0XUhyXd80xd6NkdtMblp0Y=
X-Received: by 2002:a05:6870:3329:b0:2eb:a8fb:863c with SMTP id
 586e51a60fabf-2fef871c3b9mr2622993fac.19.1752085706812; Wed, 09 Jul 2025
 11:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
In-Reply-To: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 9 Jul 2025 11:28:15 -0700
X-Gm-Features: Ac12FXwOfyTS8C_-y9vSRPj-Ar_ANH_aFSj6ux_UPjsJxqIi195A9XgvWe9uzG0
Message-ID: <CAJ+vNU2JZCpRdJqUn5mki31oziTMvmpz=oBjGcJoWhDTcvTHMA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx6-gw: Replace license text comment with
 SPDX identifier
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_112828_337281_81C57A6C 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed, Jul 9, 2025 at 12:26=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Replace verbatim license text with a `SPDX-License-Identifier`.
>
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
> Fix up Device Tree files by replacing the license text in comment blocks
> by a `SPDX-License-Identifier`.
> ---
> Changes in v2:
> - Fix msg
> - Link to v1: https://lore.kernel.org/r/20250702-gw-dts-lic-v1-1-7aac2d00=
488f@prolan.hu

Hi Bence,

Thank you.

Acked-by: Tim Harvey <tharvey@gateworks.com>

Best Regards,

Tim

