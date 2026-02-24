Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE05F3C98F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKZebIKg4zGvAmOtTA5PkRD7pA7GxWbSjVAl6yAokyw=; b=BOWVt/olQzLBlIqJv0qODyPXIy
	T/e9rGfp9yJyNV6K+p/l/5jBJxUBc3BSJyXOmqjTMPAUMbKGUGr1zMbOUCB9suCH7CMfTZl0e8+2G
	ADjixWcXOqWqcfOZFRhq7mXxdq3ZZ+zkuuj0jvlVO1wuu3ZZuyzaRXuEGBmPPqveUNVlE6CzSKqo5
	A/8fHLiCS/tcQrsUGgzr31CUtbnUsV9L/ow/A3paXdXhBVI9V0H/STqH/beRfsiBqgwEh7XUzaC2Q
	09XhldDvqa5KWXXtSS3WswNDimTv/a7YKM7j80R5TLVaPF5kipof2e3z91IcFdINwLiCcsj2ntoFb
	pfFgBR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutqf-00000002HVA-1atn;
	Tue, 24 Feb 2026 14:57:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutqd-00000002HUE-0Z0E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:57:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483770e0b25so50719835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771945033; x=1772549833; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKZebIKg4zGvAmOtTA5PkRD7pA7GxWbSjVAl6yAokyw=;
        b=gYS/Sk+yptgGvyRM/PeZeE79lu3lceDn89cIdBK0fcntYY+EUFgQMtsqNbh1wp9EkG
         6FjcjSNPNoGvxPwtH6jX5n0Lln+7VIAWa1noMrIrUAmq6erpNmGKsjRInCP8BBoB6uFF
         r4+Xb0ClKKt6kbj+aYnKMnx/k2Rl7dYw7PU0AhdxLzqvyXD/eMtjkch9IMHGffJSB41k
         WRmxVAIKccHOk7wvAQlWE7vRfQngjywVD+M7Q8qzd8DTxHSnRnoxH0KMhPmQypqoGunq
         +ZaHBFZ4U9gRx0x1K/0k9oIhZEFxCWjWNhiP+Eeok2AHNdN3GMDbjp5794iNzkvxjrfs
         jRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771945033; x=1772549833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZebIKg4zGvAmOtTA5PkRD7pA7GxWbSjVAl6yAokyw=;
        b=J/6HjuSSsttqPT3evA64tDMgOe68daDf0clUZcz6n3FwcaIHrjmtLxhSRh0+wLjTSW
         N62cunEqyU+8Q3TMVIQT9N/KTzfdSA2JhaqoMRzwt7IZ2TzXc3O+4dEo32hcz8l5gU2E
         jSxEUoW1XNvEC7MC/AlLwkWc5FPzqakDEcvWYuzdz40Zgz8O9g218sks2p5bVvQE/+B8
         oJXaGz0csCS07J3yYA7vUShSRDNeDIxPxC4b8tMRewiwFd+nJ9H/h3AWMnpOU4yl5ULN
         rXDISdRscRlSFqGt0/H5ch3sLhTQoHA6zPfyBo5tixu4g05xfvXQNSxv9f+RSp1eLr2K
         ScCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqlNeZwXZ1IbkmJx5U+aDHbU6FR+UPRQ0hdkbZ17WGpAS/BuXsIPP/S1fu396de1PoFHSe7HSlGkE2pHwVypK@lists.infradead.org
X-Gm-Message-State: AOJu0YzOrxzowjBD7BY+9BX9t6BMeZkCCjvmSXwFPo9z33Tu02DiWM7P
	rahygKAyzULNu8uTY6pSqOT08F1zF856O8nrJgy9uCzs8A7R6V5okSfJ
X-Gm-Gg: AZuq6aLqwvXkv0m/yAFrdThhQKDWqlfZ1MKhdUeF3oDwlxD1da/PZsWnybbCdYp1jJ7
	p7p4+b1IW5wD+mQnp4GC83ow/Wk5aWWVCNDJghjqU2nLzyN/GM66/vJY5VkByL/8Y6BpA+8/fNY
	oijHEQmXQtTsxuo1I8uet/wg7DslZv+/ZVfR7ElkHtJ1earou4GD9LO2o9lujkTvTYBX0hoSjQ1
	JZXQjS9ubTvFKEISrjvA803v4ZBeQUuAjukhMm8dgCE0gARiFIfLIC8k8WSs4otjaQaFTxclJr0
	DioskSjBOFm1Qd9Ukqxm7/qRNgUKEYKhlSJmbKkX7rLII7DjG0m1BHnZ/6JW8WaRNecUiWN8I8V
	avWT6uuS5xoRgXBkobMZbbLpnHBxO53po7CqKTxFVmrw5E5a9Xcdrepr5P77JDgxx9uhz488G0f
	UqbKkM9Sp9zy/igO9CpLUU2idpkMoiLywb8y/UBKTRusyTzwoFKh8Xcg4UqtYT++FzHJgt+8kWJ
	25gqyphw0iZhvw06KqxFvqa8RjlNqNEi+TVh/YEny8/+EA=
X-Received: by 2002:a05:600c:6217:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-483a95eb550mr188993945e9.3.1771945032693;
        Tue, 24 Feb 2026 06:57:12 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b820def3sm50829565e9.2.2026.02.24.06.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:57:12 -0800 (PST)
Date: Tue, 24 Feb 2026 15:57:10 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZ28RtuAWcatyVAf@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_065715_186123_253666EA 
X-CRM114-Status: GOOD (  27.44  )
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

Hello everyone,

On Wed, Feb 18, 2026 at 06:18:16PM +0100, Stefano Radaelli wrote:
> Hi Frank,
> 
> On Wed, Feb 18, 2026 at 11:35:23AM -0500, Frank Li wrote:
> > On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> > > Hi Fabio!
> > >
> > > On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> > > >
> > > > What about users who still have boards with the Broadcom Wi-Fi chip?
> > > >
> > > > Will Wifi on the old boards stop working?
> > >
> > > The Broadcom-based WiFi module was used on earlier revisions of the
> > > VAR-SOM-MX8MM. That hardware revision is no longer in production and
> > > is not available for new orders. All currently manufactured and shipped
> > > VAR-SOM-MX8MM modules integrate the NXP IW61x instead.
> > 
> > This common problem, we met similar case. After replace new compenent, it
> > should be new boards, or new revision.
> > 
> > I don't suggest directly replace it to broken old one. You can create dt
> > overlay files for new boards.
> > 
> > Krzysztof Kozlowski:
> > 	how about other vendor handle similar case? Any guide line for
> > that?
> > 
> > Frank
> > 
> 
> Thanks for the feedback!
> 
> We understand the concern about potential regressions on older SOM
> revisions. However, since the wireless module is soldered on the SOM
> and not configurable, we are aligning the upstream device tree with
> the hardware revision that is currently in production.
> 
> This change also aligns the i.MX8MM VAR-SOM with other VAR-SOM
> platforms already present in mainline (e.g. i.MX8MP, i.MX93), which
> use the IW61x wireless module as well. The intention is to keep the
> VAR-SOM family consistent in mainline with the hardware that is
> actively produced.
> 
> If there is a strong requirement to preserve an explicit description
> of the older Broadcom-based revision in mainline, we can evaluate
> adding a separate description.
> 
> Best regards,
> Stefano

Do you have any update about this topic?

Thank you a lot,
Best Regards,
Stefano

