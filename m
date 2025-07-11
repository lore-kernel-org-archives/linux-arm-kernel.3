Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF5EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnRrQFs+x5dUi8UbtTL0Q1jPf5V80eBXTe9LNjC4hgQ=; b=jTJb/t6UFPHGtG449ZGnGoDEyM
	XyCZOacC7d1+ZTO7BOB5lnfrVa4/obIHPwIVqiMcDzf9fPun/opYwIQHvpolBz0v3HjiOBJh7Sa0y
	HGbUjcIADDQ6doVRqSSHlC59BTBI8T1ITZPRfw0xGW1RP+SRcg5tecwhodvEdqLEDq1h2UOxm/xos
	/EnCU8FzE5bMMXJlpcn2EI8Ao+ljzYWLxnUhJMigAF10Ahig07VGNByo0mC+naJeii+Sn3LnUDl//
	DmOPm60i/C79LZewpFI9YDm+EFM6dJdug5CMgNmT5C38ugTMpxUFcGfaBYBfK4UOOCZ3mSY98uFbr
	4CS3rF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBLN-0000000EWVK-1qhg;
	Fri, 11 Jul 2025 10:51:05 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAL4-0000000EMlW-3Hzi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:46:45 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e8b3cc12dceso1466079276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752227201; x=1752832001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnRrQFs+x5dUi8UbtTL0Q1jPf5V80eBXTe9LNjC4hgQ=;
        b=jFD/271PXZ7Od9SWo2eLyuqLJbv7Ig90x1TrjqatzOIsw/Q7j8IVYjz9oyRPkAYrMl
         Ie6mIVxSiltV7zglHVgg7l8NvZaMmQdklLKvw6YAHTXbw0SJoj0nQMrz5tbIOS49Ahy6
         Ms0bobT4PeTV88aTv3HLpdmXrW1sVoTQQOMq6e0TeREPrnIaX7glTV/iEb8Lq/6Fy5GC
         OGoEfhvy3dc7cFPDEii9ULCdLPPOEOBWTj0WUSUPKL3W/JBmiAa2vvo3fjNOMywIbn35
         osgUGpPmXwUxxhy/HX9//IEhBdxgtPZdDwZJUOKoH5qrZKYi/nX9OI+ouUJduHPdLaYL
         u/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227201; x=1752832001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnRrQFs+x5dUi8UbtTL0Q1jPf5V80eBXTe9LNjC4hgQ=;
        b=D9b26sOfZWMbJH3SppedfuupNa1fS3FzX1AsLeRZ3OyRCKqTqIkSYp3+kn7JzyFo9V
         5/R7Jrm7KpYApbxpgXxAsUkcMCRHT9tDowYK2q1jD0YFrXmS9WtgSYDhDaWOAkUVwJW8
         tbakwKv7556r/igzr8YgmqSN28+NlmtBnuYz6gQ8hGAWbXFKkbmHIQgwZDyxb5MlWyRC
         MAfjy5i3A9M4m/VmcE3BtcBT3Yv+B/jy+WtyCTVUj+memzfiG2XoNZlp0pq/hJCUNTuG
         6UkD/VZl1GylamY01VkVrpfXin4AO+C/uHATlCLYs45P3q8jl6MxqHFfcv+eyXMpnM5B
         96iA==
X-Forwarded-Encrypted: i=1; AJvYcCUkeH53/VLlxn8Ia3/tAvXaEr71VMzx6qeK0RBQpYyqKF9+FbT1yPTuUDFVZjajGh6ETaY18ARIe5DxBIWaheUW@lists.infradead.org
X-Gm-Message-State: AOJu0YzSyav4FrK7vNxm5MKSY5cUTTTBWrwLXkn4xXt4twgS0v+e6KR9
	1fpE8qA4lbsZbSalhCzkV9HmyzarAnanAzA7KhNps7ozE5uecGPDXDgg0OOa5KN84lUd5b4CjMP
	VTA1SROq65IHD3lMlTO8LQpdBWEZ/v14=
X-Gm-Gg: ASbGncu8QE4E2DRMtrwm1ODcoL/OtIK2OoWGEr6POEBTdnBB7h8cIu95fpZR68YWH6B
	NEjxPp6UaZ4rK0F+x77aqCRCl56Ml0rVaiH2eCnEIoqa0kLzjVeXXvmsIwp1vtGJijirHs5PDLQ
	yLN6227RgKQuGjVuJfkcY3FqAJwCC6TxF1JF0a7coByshvbZ5GQJ4yu7Nd3UaCDl4PBaGVSeQ6j
	YkiwQ==
X-Google-Smtp-Source: AGHT+IG/hCWDwgsYUDxUNG/+JyruvcE1QSCcLnMNfeS9TcPz1j9SDBIOOE1J42zfnJmRJiePbS6ONLBHsY8GJt83mag=
X-Received: by 2002:a05:690c:f06:b0:70e:923:2173 with SMTP id
 00721157ae682-717d7861456mr32734437b3.5.1752227201280; Fri, 11 Jul 2025
 02:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
 <20250710162737.49679-3-stefano.radaelli21@gmail.com> <8b03b9d3-60f3-40de-af23-f943d3e2c9bc@ti.com>
In-Reply-To: <8b03b9d3-60f3-40de-af23-f943d3e2c9bc@ti.com>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Fri, 11 Jul 2025 11:46:25 +0200
X-Gm-Features: Ac12FXwotqlTlexaghXcjeDsMDeOuHQ9_RnJ0m5EzLgVnZ-6_GlqIHBcx29d-NQ
Message-ID: <CAK+owojqU3ubiynR+9F8rjMNRLDCZKVRPuKk1iYB7CZEUzJ1Qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
To: Andrew Davis <afd@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_024642_837974_0B3C0566 
X-CRM114-Status: GOOD (  12.95  )
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

On Fri, Jul 11, 2025 at 12:34=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> Why enable this interface without a codec to go with it? Looks like this
> SOM has a WM8904. That could be modeled here also, or else maybe just lea=
ve
> this interface node disabled until you can add that support.
>

Hi Andrew,

Thank you for your correction.
You are absolutely right, the SOM has a WM8904 codec mounted, but we are
planning to add support for it in the future due to some customizations
that we need to make to the codec driver.

So I will keep the MCASP peripheral disabled until we add the codec support=
.

Best regards,
Stefano

