Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1490C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIFFbsZqBieutliFbyp3ypX+HbF3+a3W4330zsjDEE8=; b=p0sS1b661hu6RuwnKFoy24u/kS
	shmRWeC7gXnGM7t6CZRozPLt0AZAEebZy/LrZg4YNkUga9qv1dgzFlFyZ2yEL8AgBPJzTnHeBjLKE
	6jDI15f50LmyTrLT4bMfxpu/8FUoBYKFIYwZ4BV16KmZu9venqUFTe0YJ71PdpoRpdlh6ImA6slCL
	SJFKhy3d9Td7/4wLScR5A5iFgApuQ+TtF8DI8BChMy0N6YEUXtZSh4ih9HDXoBAmkCShuT/A7RlJc
	7oOsZ4XoHzGcuTSKr89u6WAbVQ2C/hYUSj73wHUyIdUZDQwRAygh29LBAbce2IG6dodqArpAR04ko
	dSbCdNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1iJ-0000000BiBd-49Wl;
	Wed, 15 Jan 2025 11:37:35 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1h5-0000000BhtZ-077p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:36:20 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so8986136a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940978; x=1737545778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIFFbsZqBieutliFbyp3ypX+HbF3+a3W4330zsjDEE8=;
        b=HOenD3AG4Rlhlh6E+ttRt5nDIhrB+8olrxdne1T1tjg+78FxOLLyYdUylstPL28At4
         1LP+2hHyKCCwcIgyrgaDGNs3G9okBAmvjrw2ICESXkWeX6yhCegJhI5MbT+6jIOwP+Ad
         aIqWwcFsig2pLioXUuM0xyY+sNgD0rP2FR64EOEs+5esidMnQKvAGHgtNPwg+VpKDGgi
         uQtyU9RCTsdWhOOQm0A3/+bUVUUFFl4RPpQaRYgBnlZQNC9t9xyw0sTKG2Fa7FHFDlDS
         2hxEoMgRwzBTo7jGlfLPZhz/IUJS5VunKqI5/LQX7oYEO9GfnP5rkiWCGBTAj00cKpnp
         HpQA==
X-Forwarded-Encrypted: i=1; AJvYcCU3/DqdViB20Ny31nP21D9VgD8LHT23MW9uIpdldlv/dILZAgGG7dTdOWVjrmflDSmHKEz8H6scW1Txs5zcdRqP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/sR3G9+MhLhBFV9z2rpSOu/LiEZYmx5uyoj5D+ZcLYpLV+79Z
	GXNEb5XyVzZQ7YQsd58iX6lOMGQdG+dOuQ2OzAA0f5vj/EW1Lf0v
X-Gm-Gg: ASbGncvXcB86etKtzBGRKPGw31DzKxnFuVMFPvqpkZKcl8C3x5DrdlHyjY4hOifaN5M
	QMZRiLTVJlMbKhqoscsegThRBoLuVohB6EmplCIif+mIK/ocMfR2DtBvtL/OSkZHYRw3fvfju5s
	AOZNCizeu6hI1EPnRTMFVXTeorfDz23Q816OkqMIIxuoTVaMv86TOnwBSaOqUoKpuNe5M44QQe8
	i3DAoeSNVaQD1hGcFk4jEu2/LPL9BsPzOhCxzoOKaiBlb1D92U85ANnE4I+jZJ9367Cmw0TC306
	uLMWaDNO2e7TUqM=
X-Google-Smtp-Source: AGHT+IEK7rjz6qhNuQ7rx/oNkUrYfXzEvsadphYiOodj3nx68Y1BB3k9zcVYeASzuI2b92b2inf6tg==
X-Received: by 2002:a17:90b:3a08:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-2f548ead814mr48440823a91.12.1736940978148;
        Wed, 15 Jan 2025 03:36:18 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c20abc4sm1176691a91.34.2025.01.15.03.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:36:17 -0800 (PST)
Date: Wed, 15 Jan 2025 20:36:15 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	pali@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com
Subject: Re: [PATCH -next] PCI: mvebu: Enable module autoloading
Message-ID: <20250115113615.GN4176564@rocinante>
References: <20240903132311.961646-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903132311.961646-1-liaochen4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033619_062771_B1B18894 
X-CRM114-Status: UNSURE (   7.80  )
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

> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.

Applied to controller/mvebu for v6.14, thank you!

	Krzysztof

