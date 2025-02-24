Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BADCC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=; b=qKNVFxsvVxqgcbfm1v2SiQOeih
	uvZxmE11OAe0WH32CyCUXl4y0BQ/n8JAxJpqZ65uq3+I+RYyE3SCz8nIy7TW4oxpUWnpX4AOvjfd0
	u4aZ6Kr7IKE3S4ug4bexSLA5fqkvCMKtWd0XxvvLRB9wrazFvkoO5pqPQZwAwsDM1ec2p9jJ79NJY
	O3F5CvGtpmmAl1JKTFaNoRTZT9MqfS4HXhulSZ0Pt+uwzQDIYUMpEyQzjn8Tncxy70XsPuoRoZdRO
	xbBPII6Pzl83dKuZdIYwkHqzG3AtZDFNKQD7Jw/H6/evTpVQJMUO+jRPbEJC4xEjiXYPHgI1E97vz
	pVXrqc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU1c-0000000Cjma-3Z4x;
	Mon, 24 Feb 2025 08:41:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTi1-0000000CfVy-0U6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:21:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso6175821a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740385260; x=1740990060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=;
        b=VHkKqgSxJrhund02RHcLWdOz7o+Ya49m5EeS4i/6t4ys6jXPIKJgUOWk4313T+XnQu
         VJpitWSqis77MryOv1xEOOverINEk3kkGVRAeCydKt3XztIwSasXhBsfvwysnoBaqrcg
         bP6/pSVzlgpr3583ZYrY5B3ykO3F0YS6wDnhuqudMhgJYAvV1ONMQyEQ1eZPCK0qPU7/
         2min9ri7ZjJBqRoff4UXl70cE7WusQ2eEXx/VH3zTi2OWzxCSCwrVmfRXaqrfNqHDff/
         p6Qb30WuoYh/VjV/4fYyI9GQ62jSPFsJaIGUzJ5bYnfS/Ncp6TwoLQcBRhbuzKPBx8oN
         hA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740385260; x=1740990060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yXsV2/LB2SciH7nkwJ9VHcDfoQGnZX60SaMgs0Jh/U=;
        b=u3KCO0Yc6pfrJlw7Q/ZbmA7g7EdSMz8z6IAaRle070t7ePVUFrVlRNXIj9KSVsuP20
         K0Icj0CZTnLB4mn2tJV3Rmp31xIM8+EenggMh2ld9WwrmZjgLCL8pBKSst4inYbm7E+K
         zQA8iADbv1voJOYT2regFOm9/l5f4g4MyEIYw/OutF5MizFoDOTRso0w4UQf+q2yiTYm
         6+n2FkO1s4JR1oARD5hKpOJ730GndL7lRYfZuDFrDWuKHTPyi2a9b8nCo2HY/cHYcg0G
         Vhil/IlUb21yxXL+mgzXQhWVNltWLZZXug/KRMedZhnqKxFHAN9oHApt7Q1tQe6okyfZ
         /u+g==
X-Forwarded-Encrypted: i=1; AJvYcCVhp0A8r9r78KyWVXjTB/n8iXhNDNeRNM3cdfkenWcdf/TYWacWYbHzB4tBro4aLfZqBockesVEewD0aDmvYRdI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg57VZWDvhqlUBcUWwMIdLf+KZy3KN6UxkYNtu3V4/qKBbUo88
	GU7P7sPrycx2bBLGlfoeyMPuoYyeGzQ2TYC1k0YcNY9ihPT/vBjqhpUgLVR6dgfP56yLaP5NYFt
	vILKZmKmz6Phc9apHnwTQ6fS+qkY=
X-Gm-Gg: ASbGncv2YRsbStr7GeAs1w4NaG29Dxb9Scg7eHQ8De+aMhlswPa9Kl+Mzi3H3gP1/Rt
	sJlqwtAwb9E9CLD0muybqAfiA1t5LILlGHAgUPgAvYMq6ndx1x/Ez6uHH1xIPFddD+d4Gm6OaqP
	Wg4Uml
X-Google-Smtp-Source: AGHT+IFSIoZtx5tOAmzcah9AyzKdcvqgQQFQ3kwXEXdt9bo6IsFtTyTRuheP5O2mOJ7Yg+7fM9dG3dpRP3aMlab/o44=
X-Received: by 2002:a17:90b:4b06:b0:2ee:a04b:92ce with SMTP id
 98e67ed59e1d1-2fce7b354d8mr18309742a91.32.1740385259942; Mon, 24 Feb 2025
 00:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com> <20250220-imx95_15x15-v3-3-247777ed91c4@nxp.com>
In-Reply-To: <20250220-imx95_15x15-v3-3-247777ed91c4@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 24 Feb 2025 10:22:36 +0200
X-Gm-Features: AWEUYZm8TV1XLlsHGFmvB7e9AgvFyAGTWUyACsVmTUYTvwHG2UC3MRv44aFAl5Y
Message-ID: <CAEnQRZDHage3=xzN6bqbMjHjxuX1aPPQfTrRjicu=8qxoSToRg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: imx95: Add i3c1 and i3c2
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_002101_188543_3D9CAB3C 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, Feb 20, 2025 at 6:27=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add i3c1 and i3c2 support.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

