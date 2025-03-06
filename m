Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB4C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qF1a4xy5g06O2GkwhB05ytvAS2BqrA8TH0Jy33gZxiw=; b=Gw1EFehstgJcX2gAVFB1gGEMyv
	FsXZ4vUTQ8O3tuMW+hQ2w6Tw1EOIMGC/FBpr8e7+0DBBkMkXtacw/gIek5QCdzF0YR0AqBKEqhWsw
	NVeQsoxh2v2QmiuXx7xRdhdsMwl+6Dp5ocPtpKbQX6V64nxAoXTvO/WhuSc4DMhnS7sLqft+Vq34N
	C6e5yxKuVoMo3UbKlhrjHxZ22aabqIct+h37Dx8hgLZV+IpUEEjqzjQU0Y/w2OU7b/EKopoYrrQ8Z
	lV31nXTPLedONM/j+ul819yu8mojuaT6N6QFMCJ6ft8H9BrG+pbLV+IPHzE/gbf5qSpMMATAhL1iz
	4VVfzN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7ON-0000000AT5H-3dsj;
	Thu, 06 Mar 2025 09:19:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7Ao-0000000AQtT-1B49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:05:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so68856066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741251944; x=1741856744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF1a4xy5g06O2GkwhB05ytvAS2BqrA8TH0Jy33gZxiw=;
        b=TbIjXYnVTMy00nPTmiFpAuUJ1d+kBZEzpXSKPkURyROP443IdKOaUn7TULeL97xFtC
         262Z/wi6EVectBOooCkjyYBXvgx+iLP6B4coLOBh6Ie+yhY2mwd813pXpvkFxpLu9tRU
         QGR+LEm+JzfjNHD9fjYe7AQWwZx7HBo3ZMHKQzOn9mfi2+Fkf59E983L0Hl3Sl+P8VZu
         GAob+MZdyupJjAwjSc56nzC/+uNEw86CUwwN7SKMU4kmErF7UldrFi9lOB8yr+KgHLzF
         jU8DcJ9R3L5zc0L59on1x9dhHDXvA5A3oTXVrtjcbeCp9Y6wb94fXc+TVcrMnehuPzEZ
         aO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251944; x=1741856744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qF1a4xy5g06O2GkwhB05ytvAS2BqrA8TH0Jy33gZxiw=;
        b=cJtKCeKvRJcKQDEuo55kwPLrCZwLliNHgQliDDpCvqGDCG6aj198g8MgzuJxoRN8TV
         RqyGKoREEX1JpTzYbPjSWs8opX/7Cao0/TxumMyJj9i7e2j7NqyWEqdliibYpXJq1vsZ
         yztGuBc8HHyNK9rufdqOYokdLSTdD+Ka2jSGuS+l3I9bSRw7J5T9aWNa+FMt2tD4eKBI
         DjkJ+rkg2TUxtzhrRMRgSjpR4KSn6NK8D+eHbZo6YlrdX8lcpR3h3oCK6Cfy+fNi2Siu
         pmDRcsZSq6Sw8NgERAZV/9lq244kBtyFuVN7lj7/jfjbtMVIsgRgTsErXYai/QqD7AhE
         aY0A==
X-Forwarded-Encrypted: i=1; AJvYcCVDszAj3PrY5dmZy/4FOMLMjV2Xwh24XgP5wWhbjUogchUWX4/p7rIP3izBs0lggMm+wH55G9suoei3EaNr6Exx@lists.infradead.org
X-Gm-Message-State: AOJu0YwBFYSGFFqb3iUqjsHNfozp6ZtG0QHcxtq2xCJ7pmILGOrg3M1H
	VNgyZQ9kJz/J2YJ6inrOU4SQYd6DNo+cqfavpOPS5mLcKg8sI/QmIHjpObbQK1McyYZ+DVTH70r
	IDoSCePIzKY+phdOGWXPbf8x5UOk=
X-Gm-Gg: ASbGncvj3xnMA4upID75Rl3rtrQapGnpBXscgmUAoLQPiH//QaFpKXSKJAQgfy+8QOx
	+Vi/DFxvWKSARo/Kwghm/Jm0PBzuPlla6s5jLRmruD+Wdue8NoISxEzbO9vmOy1Q0LvfIgbRbiK
	PE+De4ChVRBJ0+WV+qTP2xfEp3Iebf
X-Google-Smtp-Source: AGHT+IEZf+mByLmt2C5pECGvzvf9DNU4dvPx4rdt3aJSm/Ho3YYl4NaclXM6a/5zGcCuNqGotXObOzkukzSbT9Fj/lE=
X-Received: by 2002:a17:907:2d21:b0:ac1:de84:dea1 with SMTP id
 a640c23a62f3a-ac20da878e7mr662880966b.43.1741251944175; Thu, 06 Mar 2025
 01:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain> <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
In-Reply-To: <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Mar 2025 11:05:08 +0200
X-Gm-Features: AQ5f1JpWFPB7HB7xwoyOVydwoKV_kFgASdMk4fd6Z1W-9JCutpUYIBvLsaYm1DU
Message-ID: <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, David E Box <david.e.box@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Richard Cochran <richardcochran@gmail.com>, Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_010546_347427_92BA7BAE 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Mar 6, 2025 at 10:39=E2=80=AFAM Choong Yong Liang
<yong.liang.choong@linux.intel.com> wrote:
> On 6/3/2025 3:15 pm, Andy Shevchenko wrote:
> > Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:

...

> >> config DWMAC_INTEL
> >>      default X86
> >>      depends on X86 && STMMAC_ETH && PCI
> >>      depends on COMMON_CLK
> >> +    depends on ACPI
> > Stray and unexplained change. Please, fix it. We don't need the depende=
ncies
> > which are not realised in the compile time.
>
> The dependency on ACPI is necessary because the intel_pmc_ipc.h header
> relies on ACPI functionality to interact with the Intel PMC.

So, that header has to be fixed as ACPI here is really unneeded
dependency for the cases when somebody (for whatever reasons) want to
build a kernel without ACPI support but with the driver enabled for
let's say PCI device.


--=20
With Best Regards,
Andy Shevchenko

