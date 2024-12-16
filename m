Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE66CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uy5TogmUO/LFZyCxZkXtCXKplw56kqYPZnvOjhju0LM=; b=bmXpYepuZuNVFff4xVg5VLh/7P
	+Z0nlPuakeB3qpd2ffKkoi9GYtaIMpxv1ZlPUzOUbSPCwArQEtJnLuNWajewGCocai9w6rvhT6FF4
	HAHQC/YDdeuzZnQ4+Z7uN82lxVsftpSsXzm6OJi8vj3dnB8FgVO+U0kCIaQikv1T/PazpVuht4xBX
	hELMAjwTWK5eY78Dk6FriBFIsoOejWc4rCmC/SacaSfcOZzp0nRbhANtbuPAXuWN/OOo6/Dx6uggp
	9tI+NG8aUjmx5ptPJdES9Oejw3L9I/Mal4d0S5S/tgY/K6MPrEYq25iBLfbT9qXYPX2tuGnsdrAUJ
	YZvBkBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG6W-0000000Azzb-0W8M;
	Mon, 16 Dec 2024 18:46:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG5P-0000000Azo6-24Ul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:44:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-728f1525565so5255121b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374694; x=1734979494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy5TogmUO/LFZyCxZkXtCXKplw56kqYPZnvOjhju0LM=;
        b=SeoN59XK7uQxGo5pRVJ2WJzcfLwQ1hDc7xtJuVW77ciMgX6/Ngsu4jmNUMptrqaZn0
         fWHvPXRhtsHWEXSdT0r0A+VaACAzCAODGq2et0OgpVehJ2cRFy66vVeqCKYj3hXoGJzZ
         fG9aV7kgNEF4NIZKbI5KWgVOB69NZFU6bGKVI97q+aTxOO2U7B7M0iQqQT9Nu+q3Quk0
         ZaX4sX3jEZ4AX6ScO8DKP3hOgZ5q87x/fZiwqGR8xsDp9aaGZJyBzxlriNmgyVel0Zry
         Jr3lPQgQ3Q/aPNOw+ELpk10604gRL2YPH/4PaJQsumb9zXXodIuIUOhQppdWJsd5lWry
         NxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374694; x=1734979494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy5TogmUO/LFZyCxZkXtCXKplw56kqYPZnvOjhju0LM=;
        b=XUy6lrJSf/gK2BV7rn8rLLUQCCfQ5aJaRAZ6aBzqsbkkjau235azQf3z59ZHEPha4B
         zIivM6tqEiot4Ui5RVcyVsSnZlxtynxQy/s9CVkVcyvlBIaSOVfcIHfevkCjrQyPtclz
         2YD6zmdYWScvvw6/GnueB6qA2z8EmXCQN0shLZV75kbTDd/+ZjfRljbRAlSQVQw/YgL6
         SXgKbLaM0a6NRRq5Iw8kAlS4E0DIZgoEYrVAVju6suoaHHwynR4GaZ/s2P7PFAeWB+SD
         uKEEYOcV6/Tluk3UPPurclUZZ7KOpg6925253zjz4WSiGv9Q+/QrFFlrevkkUu/XpA/j
         Cy4g==
X-Forwarded-Encrypted: i=1; AJvYcCX0HpwaIwSKzPyw5srqhFJ1fizRpIqgQleKgs+FLZgeLR/z9fdC4Vw5n9lePniDm49TMJA7l+srniYu7v/Vfkf4@lists.infradead.org
X-Gm-Message-State: AOJu0YwIysC7EbsBUndX7vLIuiDDAZ8FErIY/L1DaREFlb/n6yY7Be62
	rTRrzox5jqvwworb2VC7Z7zVhY+nRYooaANZeJU7WRov4AXAxCRt
X-Gm-Gg: ASbGncuGocm+z1EHO4sFV4Gkw0R154dwHc2Nzk10RYxa00sdORaRil1xAzAyFCArx8I
	S3m1aTtGE2Z3hSuEHYJLR9u8ErgxB83uMfSPVBJLWKNw0+sotnHSMmvEzhojAgAwmXCXOfK/uex
	KcDKRokIZv3nkAF6vihIXKnxT66NI1qtzH0e0PYEZ/CBkpIA2efVUReIP8RMY52lHmlBAZ6JfUq
	/LCgfdEBGnFx/4irzkuwieb6j+mBoB9XaBDOU34wLR3cf/Y8k32t55mEZ3Itg8q8EQIrw==
X-Google-Smtp-Source: AGHT+IG8e6Gmq7DkH/m0iRUYm3sVxn3mLoxGSYH+9VbhyIOnW1xJl8bcqkbPbHMff/wOuKaIzC7VKA==
X-Received: by 2002:a05:6a00:419a:b0:725:b1df:2daa with SMTP id d2e1a72fcca58-7290c248bebmr22022737b3a.20.1734374694201;
        Mon, 16 Dec 2024 10:44:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918adbc76sm5082337b3a.80.2024.12.16.10.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 10:44:53 -0800 (PST)
Date: Mon, 16 Dec 2024 10:44:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Message-ID: <6604eea3-de0f-4d2e-bc12-7f75012b949e@roeck-us.net>
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <20241216175044.4144442-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216175044.4144442-2-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_104455_535781_1FD3D74F 
X-CRM114-Status: UNSURE (   8.25  )
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

On Mon, Dec 16, 2024 at 11:50:39AM -0600, Ninad Palsule wrote:
> Add debugfs file for the PMBUS_REVISION command. This command provides
> information about PMBus protocol revision number.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

Thanks,
Guenter

