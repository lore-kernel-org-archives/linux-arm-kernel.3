Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F374E6C60B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 06:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYWKIfWb1Oh9hH2xa1Jzv242zTS0KfP+l9376f6PgRw=; b=om15oI2cLbkBgFvyjwttEeX64X
	53x+2snFbvTl4qEG6GIAyBAMqXnKyUDT+Xq6wznj6ilhRrGsgSBpcZUR0yxriU2648I8qRwH27GYz
	gOH+iJLQKRMV/yFlyzQy2yoW51L/M6kNcSUO9HL7ocQu2g4t5iqYCRusKPpP+4V/nyxBUkqKOrKu+
	quLVWZ9PZKDPTZLNnRHyvtYfzSEXKSVVRd81a0EShMbGFnZWl7zs2e0w7e32YBdEO5DI9+DBoaoZU
	ZClBQR85x4YJv5vLdNxVT7piYojJc0sWuoSEmKLr3dtHRsAbpKxK0YEu5rQ/G5rb5mcWwbKJad9KU
	I2Ql4keQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM3n-00000008NS8-3vEZ;
	Tue, 03 Dec 2024 06:06:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIM2o-00000008NFS-0Hta
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 06:05:59 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so3979582a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 22:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733205956; x=1733810756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYWKIfWb1Oh9hH2xa1Jzv242zTS0KfP+l9376f6PgRw=;
        b=Otq/ZCoZiCmRo6TUNiR8TwGDWueE66mFxiZAvoc0YK2vBemTk2ajkFMaLshCX1AYpL
         KmWyL4+nx2Dz1REKKr8zbHmJqrMT1WESAhxSf70Da0F7YZ6xr59V+Q4adxrSEvmPM5tX
         IzriJyHZZRxVIaFN93PoqMByoHQUG4uQs9GWK/G5OuhuNPAiyDUWEQ7N0kIRsHst7k5+
         NvyuzcWdRjSunkmq5VH2QShQPRZizg8Ke4zbg8WPE0hiHdaFW+MQ++uHmwazPu3RUmjv
         MwmVlsih4jM7CGKlnXDSoLe+PvS5kQ7/EuW0puzQPjWOTj7BVhpjzoy7C92VUkZZhvfd
         9FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733205956; x=1733810756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYWKIfWb1Oh9hH2xa1Jzv242zTS0KfP+l9376f6PgRw=;
        b=CtpAddsUQoQAiGIy4tPZozq6KfjwZ2W/7CfblNpfYJih3hdoUO7V+2M17EJdi6h5TA
         /G5W+7TssP/Dr6yk10d5gEKkawUi8N3aedRAwmf4Ucox/oOsWqSi5UxBay7FlhVRRqrh
         uKcbUesN9zb/5okEEy/tUuNWhx6Lkituo3BQup03o6lFZPR/SZ8UWEB/SL4ovLLwnSgm
         iljfynck7+YmSPMHdg1NWKnFFf/GZiBETQZVvqH4ZNyAi2uKptWib0PsCIRnlAOLegZQ
         85uIuK0JwNSSVWlQw8PFtUMV9fF5P+e4ndU1xehKvHuY+yG15uMQ5F5OWqQUScLNTxGF
         yb8g==
X-Forwarded-Encrypted: i=1; AJvYcCUfcom8l4cEd505vkfzbCetA5V5aw7VEJO0L7EqaTAT2mRNh3zFrDG4hq9bpbsZVSIiUstg4I+5aWYzoJdvphaZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FOkYc8trcH9YYLFSq3Wbcdd28E7dPVrBBs/gbxUTlRKXfzWk
	bSaWBQWh9+SmBK3b+WwlsTHK2DKtNX2rLVc+VS3weYiKk3pwzG39
X-Gm-Gg: ASbGncuEyuLhGmeBT8rDTLGoH/3AB0gx5910TnKhJ1f0z23+BZ+rrmN68u53IK4+1Fa
	MoXDs/jOi6rLrnYgDrCzUaOuXRJoCN+72yOKrF9nj4N76oD2gNBi7I0yaTul64muW5swQxtq5Ur
	EPn0PjqXmZGaLGV7kofRaCXABMVZ/P/XVoeQOudqAbXLQGezTcabX1ptNNOeKEYwyUQbUXRa7PH
	oNRUDtUiGp9LkVY6JYudk/KQu+FidXEVYIU5f+w5XQrvIvbpXw+8lBWEzm/u+s=
X-Google-Smtp-Source: AGHT+IHcmh2F5HDLnP6nkQKwmpu0nLpnPf0VsF9bhL439vY2tRKe7YOR+h+IHQai0+2B9Qf1bFRhLA==
X-Received: by 2002:a05:6a21:9d83:b0:1e0:d36b:ef5e with SMTP id adf61e73a8af0-1e165433801mr2009283637.46.1733205956586;
        Mon, 02 Dec 2024 22:05:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2155f0a648esm52001085ad.183.2024.12.02.22.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:05:55 -0800 (PST)
Date: Mon, 2 Dec 2024 22:05:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: raspberrypi: add PM suspend/resume support
Message-ID: <bea80f92-11b6-4373-bb90-48c5a22a30a9@roeck-us.net>
References: <20241202115832.33628-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202115832.33628-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_220558_104232_EAC34FF0 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, Dec 02, 2024 at 12:58:32PM +0100, Stefan Wahren wrote:
> Add suspend/resume handler in order to stop firmware polling
> during s2idle. This was just waking-up the system without a real
> benefit.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied.

Thanks,
Guenter

