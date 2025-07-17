Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A217BC83F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghYODKwRN56ZF4az5gyzpDmfGnkll1VEDNzXJkGJV08=; b=2/2Mu8qglVz+eObX05ClD6QvtH
	rZvigXy7Xb9aj63JA0P/fKhuuRvs33EIVh0bve7PWiXcaN8gRS1dtWyy49kBaMZDjM1PXuVBpRHbS
	go6TSlIb1YbSpDxm2hToUdU3r/lvQMIms0YrIQLlEw4JqDZ/BIO5GoAYbMipFJWMuYPc9sWlbh8dh
	mQ/m2b9FVcaoZyQXASb8qxFR1PEvZXPJQz+/pwX4zHS+cyJl8bwrpJqvrYOAaVq8GAyIkvISNSzSJ
	FRXRMiubn0fALn9HjPgRjFwY7c/IHOWv7n7gqWCzWT2r2LmjUv0TwBUKoi3YTZDIJEVuoH1cezfu9
	qHM5hYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL6h-00000009l9V-1PWx;
	Thu, 17 Jul 2025 09:40:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKnk-00000009iRB-2D1i;
	Thu, 17 Jul 2025 09:21:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so691153a12.3;
        Thu, 17 Jul 2025 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1752744075; x=1753348875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghYODKwRN56ZF4az5gyzpDmfGnkll1VEDNzXJkGJV08=;
        b=loMDZjXTutIN4mGbcaYDXN544Bi3mybNBdmARu7zwKDOckECRb6Ml0wnH+GfPM2+QL
         NnGA8pXO9lp5W8MZj5A1B2VrqXGMhCb0tkbpGhYVuRoJdXPWJdyO4VWXHJzcN16a7NbG
         fU4eZ/y+7izFZUkYP31URgP0Ub58unlTpGJJeiyH+SJygt0QkTLL+MoNRwy86+o2QQDi
         /Bng4PsjE+kN/Syvv4Kc/GWr/eGRfcUDKddJUcRgxzj3EOKvyPu8e/fVUjsZ/MJmbCl/
         tG9+BHLohZ3e5oMBIkN4OXQoXojFxZptrE3Ti1xpYL3BT7UIrLTQnh1xlS24EjMo6Lx4
         bfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744075; x=1753348875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghYODKwRN56ZF4az5gyzpDmfGnkll1VEDNzXJkGJV08=;
        b=SRM6HEQoPs3pY2asfaS28RqWW0n0NEiKSQj36K18MOxTP1RASZoecK7K7zyAuuln93
         vEIPkI9/iSjE4rSp2I/ba4HGlKbfLuH67ZQG9eIA+fZ2XUMvxNvwpPyUjdXqMzbnm6Q4
         ZANVHUmYg6/2Y4Pw2p5vwcnhSNFXpw8lLPSVv+iv9Ezdza/23eU5Mmaf35D/y1PxfPdx
         1/69ruCZiOadjhCR5yn/4QEeABdUodUdpBxwLWcOVITn/9MWw+HsAy9mDvI83Lt8kfyR
         3W9KMd2ogeJtXMokfVcaLHEwzTehgW0rjpodnCLJtAFG+kw5vLSpRDypnFq+Ix0+cKWT
         Nwvw==
X-Forwarded-Encrypted: i=1; AJvYcCVNwOf+/cM4ILrWUt9sPNgni6gYaE51ZmHWndv4RbduWJ2gDBkQXs2adcnG+M+n1vgy4h1eNLLCn8RX4OFQF4F+Xg==@lists.infradead.org, AJvYcCVuwnze3gjNecHx1wR+Dte3/N48Xjv+nSGASMX4srK/w6dJm3LbCdlvSFQ2Zm5HXkdVFvl+8EHeHDFCUIOk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyel9mhY2EYu7+ZWrkYvFbbef28Ko12BC6POI2HRC1q7NDG6WI5
	Gcc9iBaqeQbTMjgdfPIkB1WXQ3gRBwrbDo27dcjADlhFSjGpXtTf5KEOSxxthupJ2KkPd04VkdI
	MOGKrI06xObhw8FLuupdM3N3nlg1o8dI=
X-Gm-Gg: ASbGncthCS71afS/ojowDvJCZV4vH5mVAAUez8ceOfzVYI3B9YTurdvM8oOEHD0wlpp
	8HjLlPVjiyJAiXdtmDzNbA781nM8d4jHGOnwCkIViZAFbs89O1a59Mnw5oEhY3+PraLtFnv5RA5
	AzkoWMuPwpfsiKehZjYloCVOVuHMA+FezRho8D8j+EgnL6qhZ15XOAA8wtrENuJLOrrdJjGLFKH
	zjuZn5qeMnI2jfRWkN32Q==
X-Google-Smtp-Source: AGHT+IEcw73AwQCInDdk9e0fzVxi3F3aT9Uz+CuAK+CmNG9Ean6QVZRmPBfCDgf60QUEuP6JoBidzpPFe7BSToB5Gas=
X-Received: by 2002:a17:902:ea0c:b0:234:f580:9ed with SMTP id
 d9443c01a7336-23e256b4d4dmr80702645ad.21.1752744075391; Thu, 17 Jul 2025
 02:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-fix-pwm-node-v1-1-45021777efa9@amlogic.com>
In-Reply-To: <20250717-fix-pwm-node-v1-1-45021777efa9@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jul 2025 11:21:04 +0200
X-Gm-Features: Ac12FXwP557lN0EiWARNaS9MW00Id1I7t6G7YIjyMJYQJpebiGcfQOd7_3xIoHM
Message-ID: <CAFBinCAs2Ra6GiF6y-EDPCZXoi6sM+wyPUWp0vE4UVbXByXa=g@mail.gmail.com>
Subject: Re: [PATCH] dts: arm: amlogic: fix pwm node for c3
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_022116_562463_E2689DB7 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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

Hello,

On Thu, Jul 17, 2025 at 10:59=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Fix reg address for c3 pwm node.
>
> Fixes: 431a5281e701 ("arm64: dts: amlogic: Add Amlogic C3 PWM")
Commit 431a5281e701 is "arm64: dts: amlogic: C3: Add clk-measure
controller node"
I think the correct commit hash is be90cd4bd422

The actual change itself is fine for me

