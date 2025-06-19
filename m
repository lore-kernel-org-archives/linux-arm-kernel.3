Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D13CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=; b=s5hvQ96oaK6hGvb4dpzF4SwAWp
	PAS/KTvhtIV6JJs3JB1YikxjCmiojT1QSwiNkWxfPgIBIEig4GYRX8O+pB6i5tJtbWdDmx9DRS0pZ
	eW+Vet+GBqQbtFp41soXLLhedyHyDFP+A0W7c/OpVCY8ZElvknBOBZOYlesOserawavalzy8F3gC2
	6S05PV7LYf1NFkQlj+xJgu3iYNz/SWpa1+tgBwWKl4j4sjYpuutpjpmwxZdXALfrspGMOYQBg9uCy
	E9CiB12MJoUqGkXS6Y3FgMxQ4uEkm9dcuEj/xq6fYE3e9gBGM3NtJtQYZg5JPS/yXvd3aEUTmE+sU
	oitSYOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8TH-0000000C86A-0FBe;
	Thu, 19 Jun 2025 06:09:59 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS86y-0000000C5Ym-06ju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:46:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553bcf41440so393000e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312014; x=1750916814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
        b=agjIBHb8Z5tmg62L1rx4n1U3md77uw/8J1bCzG94vNG8hGrGL/xhB4DRxu68cf4jJp
         Pgxq0x/eEN/hogvAbW8Or2ks/BcgbVF1c2VI7xPh6g2UOdd8kUJiUd+unofGuubHSjo5
         yEqalKa6IjlUBwtvtubCwPUcafBEqrJnJ2VCm6wdVq1uSp7nlZiPB904kpvSGacTvtLl
         DPBH5bIJqv2Xk28Dtpp+e6kmQAhneZ79cvEykg6kWZe1idhxGi8X2aOmNV+pkQso8BHn
         LiAYE5IEcS5nrzy5d7Gbfq+9FJNXDDePYqB9D2EfI4eo+1epRVvtYJBDI84lhSc4/fVy
         CZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312014; x=1750916814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyTZhZosQlK8zc2CRYvq23U6H5QZQEEq+/ASYL+tvJM=;
        b=bfJeQAaVomIK4f3+/Upd2Xa3cxhX+UYQi7y8Crbx8TX4SDaYG+6Lk4xTPhQHb0qKKU
         6hqV3+/8KNc6T9GnwQ5ebY0pk0GqPUeuvLbZ5267KIhJ35FbYQo5Q/LxfusVNuxZ1UQ8
         HR4+trghwP1VKrS1XbwMCyV3/hrncO8NTZchLCXlxZXZIHaX56q72+fPCpX+q4cx0B50
         7TtsBUP7AVNyNrx9AN5T/7ydafjrTNk/WEmv/IPTWJAU1yqS5ifTq1PYs9HuH2lG5Vp1
         YUOe6x75rcFMdB/ynSog0rOgLb25a5Lsf0U7iwI9pLJPuLfsgA4jjywo2KLDkgB3BFI4
         cwoA==
X-Forwarded-Encrypted: i=1; AJvYcCWnHdv9MjscShIPmr+Q6UJn/CucJGt4Wipi+RIQx1ntO9RgoJVDJnFU7ciXazRFZbdKVYTpx+3aZKhCQ2wdLv80@lists.infradead.org
X-Gm-Message-State: AOJu0YzBVpXBk1AEkPe2QIhiae8FAAWoEMzDohvUbxmxiY59lfzLOr/b
	BElvku/VIpJ9CyaUEZTbfwauTnAWWlq1Y6XHftfjW+BG5tKm8Fz1UZfzvFki6N04ssHX/Z9hvA2
	zUE+P89hPdbRA+MAK0IHkSJp8C7pNeQFyw8vf2hThmA==
X-Gm-Gg: ASbGncsndMdWY9ElCZPLjZ+Tdnh7ayv44FzEMo7qJ9cbq4G+Ze67eAJBs4QKpucTCQi
	Wog3PSAAorgnpjkw8JGGBDBjFczrqMFn/+L7UVeUoB1BhLzJbO7E3x5zXjUJPCTjTK85/BjmEwk
	SLxh49Kh9bXhilPqIqQ5t96C1OPzFr728I1dYaNfAflXBb
X-Google-Smtp-Source: AGHT+IE1xPGt5ROVV8f70S5heb5S4gN/anI8tPUvJGRuJeXPD/dBLegDhxqjDN+fi/v7qlQqJzYLlHExWELH2KyeXss=
X-Received: by 2002:a05:6512:2114:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-553cf7d7475mr2149020e87.33.1750312013519; Wed, 18 Jun 2025
 22:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
 <20250618183333.GW1699@horms.kernel.org>
In-Reply-To: <20250618183333.GW1699@horms.kernel.org>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:46:16 +0800
X-Gm-Features: Ac12FXz2MfdvF8WEisDdVYaJh-GTBO0QM7RElK1s-X1101O0wUuzCnLffKUuZmw
Message-ID: <CAJhJPsV2moLRZji4pPxLoV6=GSdVsfXPDt6rkhKHqO-eC-X79Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data struct
To: Simon Horman <horms@kernel.org>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224656_060230_237D4C41 
X-CRM114-Status: GOOD (  11.17  )
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

On Thu, Jun 19, 2025 at 2:33=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> > Provide a structure for match data rather than using the function
> > pointer as match data. This allows stronger type-checking for the
> > function itself, and allows extensions to the match data.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

--=20
Best regards,

Keguang Zhang

