Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E09E9A038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUeQvtbcJRcoGuHYQKHXUnAyTG1dJFRZwd94Z/kLSnc=; b=O3PC3onLIyDMTZ4xcjZi29jfn4
	QcNDclvgKoBxORWO1GqwuTYoCb77w3JnDFtkIagXiF16aZZNqiAIx32URduEBhLZpkfmEWmk+eW+f
	sOmO2OQgB51d4wN3fLxjT6wMmY8XQzmH3jRoN9YdDQtIeCYP3pPR7WW0N0YcyO7gxOHESu9PWqk20
	yvMlGX6+Ci/UwgM34+takuUigMDv1aN9ZxfouxAb2SlsaqWaiNSDabGNQYdEggCOx6tk//zLjEXWS
	C9iLe/WsAW0T4Rj5HoRIo27gZRxikIUZQdUAEzoEuG+h/nKisbi1Ih57fRAKOueCMrwHml7D3jFk5
	6ElS7SjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQxm-00000008ojH-2mJ3;
	Tue, 17 Feb 2026 19:42:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQxk-00000008oit-0erW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 19:42:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-436234ef0f0so3253378f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771357342; x=1771962142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUeQvtbcJRcoGuHYQKHXUnAyTG1dJFRZwd94Z/kLSnc=;
        b=nhk9LpbHb2YlKlLwNDVaDGMMP2BBd5bUL/MP/tZD8uWXFSGFP4uPX32oBk5mefd7G7
         4ZdDPVkF+ABTGc4ioD5bNlxUEfuev6Z4WZsNtgEHAZLYcGQqgbNqJV/lDfJTBaYqg1AY
         oVHcM2+DUl3jjGYg4BZwnK35SXwXBCAwY4/z2EKfc3lRr1kz590TZHsMfmH6rXqXF+/d
         Zqh4zz2IOw7bHhLXjbd0xUxllJgyJoSLyxPM2uXtpAkdhHjrJIO2MJtazZuIzYPY1Bct
         i/KKgdPAhK9cNg11yhu23CsAF39yAyZdKvyJ1+OrdLEYns4EF14A+OHAfGe03tj9UIsN
         ZPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771357342; x=1771962142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUeQvtbcJRcoGuHYQKHXUnAyTG1dJFRZwd94Z/kLSnc=;
        b=DeXD1FDsJ8I9mltG41eAdb6KG3iPFN+aJHX8cxoYdajbgHOGIxl88x2GtIQuyg/XmT
         luNiXlhIpeQ2miCbwL/ghpvuvWb+SNa+8rtBGHPT/OMD9sMkkH4+BSTvo/0jU60xH2yn
         Q4NaFnEx5fvUOVojqUZzmLwYTACQFFTpJzq64iu3AH19cXDxTdQLoA3D/swDMM8Hv/H4
         FEuFN2LjumoGbFd0rbH72Kxd3W09UO7zl1QZARhCJUxOvJiLSg7gVQZizJd0hmUzNxvp
         WQhuxtaDJZmQfsfrVt24aw76pz/rAXa7Al3WFc8Q842J2R+neJDKGkd4rq+wxZZL7vS4
         fFiA==
X-Forwarded-Encrypted: i=1; AJvYcCWfQ+hZ77F/dL3wPbUcdbhyFfKP0l8l/sc6kgyFPiD2N5/5u9mRmRoWWlDFyZ7+O7FcOgLWD67MbOgP5yEdmlSH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4kMBu3NGKRc1SYznCduuR7AJTtiTk5mkRYq0eAp30eO0RzbI+
	SchuiUpqE9O1YdO7xxuq7zp/vUwPDTfBDFUsil2hK9qCVDJQMxYkLmSi
X-Gm-Gg: AZuq6aJUn72fuEwRfJWazNm5yvIYggTpX/O4OWVpZY7p6sHhWs7qYgDPXzTIymgwVwo
	Mgj4OiTwOpk2nNMkQgDFz4e+l24OsWJU/IBukhRdjArdicLZ6OHzpSJ49QCQ6TSZdbP0uaZgkZ5
	idshJlXL5Ubylwayo7mQx+8GI2K5PA1gsa01hna9pJrVeDI0eqtz+wSmPttXh4N9s3Vq0Vko3jW
	bJwU08X8IA21yAxdWIhvpmxZcxfWx9FJlTVqmdjPlkm5OI1IgIxOmUz600P60PXfNBoK0iX+xNk
	jhrDzqW62/iTnL/SRkrHdIbvWjfq5vxCkWn3tscdLrShqQ8eIP+8md+3uLQVb2EeQyJo10HRpyj
	oJExg1gwEEZh9NdiBKBfz4+dDJHgTr/5Z9t+F/LVypA8QNRRgFo9Ykjr0nJLYrMpqBHbtgkiufY
	dHfOLNqP3HVd1s+RpgKfUwM/tnCWTncEin3txsPseRhV5FWr6sniI9wYfxdQt/RL+T/6rFAZKGj
	hni2N9TeMe2E+jETAgEH93vXJCxyrWAX5isNGYOjfSSKCE=
X-Received: by 2002:a05:6000:2586:b0:432:dc1f:6982 with SMTP id ffacd0b85a97d-437978cd85emr24996379f8f.16.1771357342109;
        Tue, 17 Feb 2026 11:42:22 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm34488531f8f.34.2026.02.17.11.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 11:42:21 -0800 (PST)
Date: Tue, 17 Feb 2026 20:42:19 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_114224_214229_0A7CEECC 
X-CRM114-Status: GOOD (  13.30  )
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

Hi Fabio!

On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> 
> What about users who still have boards with the Broadcom Wi-Fi chip?
> 
> Will Wifi on the old boards stop working?

The Broadcom-based WiFi module was used on earlier revisions of the
VAR-SOM-MX8MM. That hardware revision is no longer in production and
is not available for new orders. All currently manufactured and shipped
VAR-SOM-MX8MM modules integrate the NXP IW61x instead.

Since the wireless module is soldered on the SOM and not selectable via
the carrier board, the device tree must reflect the hardware that is
actually present on the module. This series aligns mainline with the
current production revision of the SOM.

Customers using older hardware revisions still have access to the
corresponding device tree descriptions in earlier kernel versions.
Upstream support is being aligned with the actively produced hardware.

The same applies to the Ethernet PHY update included in this series,
which reflects the PHY used on the current (and future) SOM revision.

Best regards,
Stefano

