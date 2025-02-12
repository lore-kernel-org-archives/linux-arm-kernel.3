Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF76C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=; b=OOaiHAzzks0BKU6l/WzrpMIi+m
	WGqtDh+Vx6XvIp5qtoRmjqqqLrrFd4Ebc05910GrJQC4IbdUscBl7VBQ0v3U05JUxqmtQpuREFyrj
	5FeI05hoxdoKDiSC6wS6dGfySsf//U6yVfy+89uG9bh1hcmmY8PY37TXoI6IkgzbzXa7Z7M4OeUwO
	etzrJF/MR+IS5qGyqLwXDyt8Su8hP0M98CZBp5E+TGO19kohpO0qdqYxcKdVuZ2Td/SXR4MNdGiqS
	mFUrySgFTp571J3gAMuuv8ez4PeXg08ghgNEA9xE8Uisw74nYrHYYOII3QgsyrgSzs+N2N2LuGAvH
	HEA5x96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8pR-00000006k42-0hPl;
	Wed, 12 Feb 2025 09:14:45 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8o1-00000006jtA-42j6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:13:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fa40c0bab2so7984713a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739351597; x=1739956397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=;
        b=OCBYUhFYC70+EUR5tKgHzea/ECc7mWhesb+TW/G7/LOFfOst89BJ4Fqiv3c3qBX90y
         36CPq7TL15EvOxwe4jha7eR1svLYbx7mXGB0iAMrRWVDADd69uEi30smHmjW3LIkjiG7
         3GVJson8aYi3mq3Us/FEgkioWW2SXuVCYHvl0gD3Iukl5tHDClfFLzhgk2TOloFUHjI+
         O1HyuewSIN0BTuAyalvGdy2vdeVbA8jN/vKo0KFNctFoD7J/lMZ3RgBDt1Gaz3AKWVBr
         k1TutnqXVwllsHc1uwXV46NQzCI82syUEvlK+ugaoqvI/vD2PGC3tra0F6s1aUTTR0/K
         lJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351597; x=1739956397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPD5rYa5UTZEA5lzkKURim7OANCmr8pHXI0PnX7mAMw=;
        b=h7yS1ABCmU1B/7kI3mj1voYUrnKikOwGe+OytqBrzYDcNKUV+JHqcia5Hy3zzPoF+P
         BVSJTKDH+f8+ZHRmUEqNEPpJ+QGpeaDODHLg7dVFrKkhYgScotQQxUH/5NdGIC8+KBHD
         QbmZqPGF6BNKGkTfmUkjduJ4EmUNZ6SKmYaZsX89W+KBNWHIxLP3aNprQIUcgepD30Tj
         vMFZtFgKhQWArI4vOsCkMFY0TArWgfhNdlT6AG7ELq9N6K0REMAlV/DMft8SHyMvX9uS
         u2VHZbq5Lg8jWehrpDNlZpJ9WB1WAXc9o3YCu+4b22gmUjRgdMQR6H2QZ/RMtZ3wsGHF
         y7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvKn8QXVjeolWEmCGy3YJjtuBunw+xAeTYCvYcqxpA0RzlHiDMcwS3HBOpAjy5j43CwTUn13ivOKjMcQIZ8bvh@lists.infradead.org
X-Gm-Message-State: AOJu0YzmZ4yyGBLqGAEOR9xQJzOMRb/jOeKx+2dpk0/j3O4IXX60C+kk
	Etfniwc6YDcMxTzYOos2H5ptIa6q4IvPPFYT6Wq11iqu9Ao8B0ZZvzrV/Cx3fLWtU5dbwQA1IDB
	MZ/gDIj9ZDymS0s6zC1Mj+BVk+ak=
X-Gm-Gg: ASbGncvDEyYWvleC4/DPExgGQM7mlwcoSS5zsFMe1yxKB6z9p/HUHj1NjVFbbKaMVw/
	vNauYkBSz3d35PTr0oSNc2Wu7bFopWnQK4VsIJAJpIDYXEuILB4AnVBvYL5zhvGMbdZRUgA==
X-Google-Smtp-Source: AGHT+IHT+ZeidzgbuFPK1T7nat9jcZS+nvvNOTSUNTmWCKgY4f8d3bPZ9z+vTH8FvkV4Hugvz68ajXpWP20x9T9YFVQ=
X-Received: by 2002:a17:90b:2c84:b0:2ea:7cd5:4ad6 with SMTP id
 98e67ed59e1d1-2fbf5c71362mr3494611a91.32.1739351596956; Wed, 12 Feb 2025
 01:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
 <20241210125338.104959-6-daniel.baluta@nxp.com> <l3z3mu5inmfc23v4mymtcb4gnzic5zupqfpcuk7vqeweluy5jn@c2b5ex4lkdgc>
In-Reply-To: <l3z3mu5inmfc23v4mymtcb4gnzic5zupqfpcuk7vqeweluy5jn@c2b5ex4lkdgc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2025 11:14:50 +0200
X-Gm-Features: AWEUYZlmAF9HL7F1Di0jk-WkuyiQ4SgROYkfG9zP3ZC-TaPsUodPXn0I9h7DQYQ
Message-ID: <CAEnQRZDZSj2tkMzaqZfaO0e8drO3U2j_qxoZSNocAS1Qaq1Q-Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_011318_001163_9D1746CC 
X-CRM114-Status: GOOD (  14.62  )
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

On Wed, Dec 11, 2024 at 11:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Dec 10, 2024 at 02:53:37PM +0200, Daniel Baluta wrote:
> > Audio block control contains a set of registers some of them used for
> > DSP configuration.
> >
> > Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
> > registers in order to control the operations of the DSP (e.g for
> > start, reset, etc).
>
> This should have been implemented as reset controller, not syscon. It's
> really poor choice to call everything syscon. It does not scale, does
> not provide you runtime PM or probe ordering (device links). Quick look
> at your drivers suggest that you have exacvtly that problems.

Hi Krzysztof,

The bits we are using from audio-blck-ctrl for controlling the DSP are
not for reset!
They are only for Run/Stall the DSP.

The reset is done via DAP interface. I will sent a separate patch to abstra=
ct
the reset interaction using a reset controller. But for Run/Stall bits we n=
eed
to use a syscon.

thanks,
Daniel.

