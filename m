Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=; b=2quZ3OFIIGEdDr4LpJ3hsJCxML
	dAavJfJGk9UoQ3SXp5BjS91Jxg7LqGlyu6NvhRQJJ2CnxQE2CoCg7pl+QEj1aNTsIDQW8znqkvZUE
	SfMYa6BdoT+bOZwE4cNl9to70B7zFaHqoha7HuEE+3hDdfYnQkK7ql/0PbQlChftoejFdxMcq9rnH
	FuiSa9UNp/6N8AGk4jePRl8yf2ywwHameQ58MVjnshGP3A7XP+Kw9sg5cT2s+dIF1aIS8tn5RJjRD
	I3Xw80O/dicFtcX4xcGtPo4Vbg/RxN03+3q6FCXGSeMsPj1CvDXOf+Uqh6ds9LCa2djMTNXbjFRVf
	xEtqJNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JVk-0000000HM7y-0iNy;
	Fri, 25 Apr 2025 13:54:36 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IWY-0000000HAyr-3nzt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:51:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso4265974a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585481; x=1746190281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=cpny0oQOtU/8bZhLpKnZFReyR66syLkrP1i6qwaZy1y6gbOC1ltwMPB3nuDAKvCKh0
         NAVSzjrCnOM7E5lH+W/ZdUXXgRpwC1lWg9loQ3ceIiKmKUlmkmrioDyF/KidW6jw37ne
         BaFUmBpb99XtHcM3fawshCwNlmr1ubm8NOtD1NmBfB1rmwxszavyQjGDvi8LDEZMHdJ2
         kuMmu14CtDeLs4fhDuLM89mbSo4xtmqJh5ExQdMZilAl87j3xIk3sROfASD3Ron50KPu
         qHLubfAM37WTBhDoPCJ2TiwiBGDU0qvBUta4YPXecO42nlDy2K/oz8fjPedxtitcMfTW
         BeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585481; x=1746190281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48Ovo6gaBm087AHnERQ6MpFZf89kygeClsZJ5ggJTEI=;
        b=eHWC92uMPFdjDcOnMMCbTvJzjwSMTR8rVNogwzC8VuM0YMBf0+tPmCZBKS2iLkZyRr
         Vn5NH/X1fWeOs5zscNdE1mV+iP1bAbuDi9NIacLmlWPr0Bi4qcgKGhdiUX+G5OK23N8e
         d3ibBkRoEnaPX1Plq5j1avOnFkDjLzOsGHJTBdm5jCaKuZ4NzqDwYgNl9K959F7fn7HA
         EcxWg3ya6Mcp/ZfTkGttmmbka1HZmAFu7B2h/9+PRh+w36nG+ZRgWZau/YJyBQtEx/MY
         h3gkNvZPXZQDt0thmg/2EkGuiyYCX26E3T3rIFkWoviuWtvmzYT2QE7AIUzima4qfn4H
         W6mA==
X-Forwarded-Encrypted: i=1; AJvYcCXRPxGNb7LiRTZpup0rg/uytdDhT7PJhGPqIF1+SNnwJDq3ARBm2gOuH1oIgqhBklAaJVZlQAV1vMw1wmGJ0Un7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl/8T40KLAMdnVcHqLRS+XDHB07dT3fCJj9nu8kxvyD1qbx13Y
	dFe5CFDWTjBJ1mi4e9ohrBpI46R0pdqCfbum3dTDejCxN+mtyauj
X-Gm-Gg: ASbGnctj3+qZgJrkZHzwdykekM7eTum9Vm9YZFKo6hd0/YbjgvsB6eVzfl1vKVId43/
	bW8fnfw4kc0EMgM4384/YtgLNW+4t0SIyB9pyxrEP6BU/hVAlN7k87DBDf8YJlR+hvALDmiExH4
	EexXSx8pAw0R1lbzEu2l2uIyp4v6KEcq8/GoSCKmCNzFxxYAZckb4Nonpg/Q1zcKt9/lxQR1AkC
	8TFj+lRETTKRQipQ1Vrwn+3om1FikFrI9y6S1U1M8WnY+HVOF8WzNZ/gcVGq5IfiQO+Q2FMd+kU
	ig2LE6I056nym6ZtYu29k9NNg1Wlu/4Ya2NDEfVfGNQrG96Zi8icSzo=
X-Google-Smtp-Source: AGHT+IEHCHR6MYIQ/h6kJu40DmCfLvHuVDDSvC4wnftT5KG59v5Z95H2gQ4clO0PJ34esem4CaUoFA==
X-Received: by 2002:a17:906:eecb:b0:aca:c7c6:b218 with SMTP id a640c23a62f3a-ace7103b316mr200167466b.1.1745585481087;
        Fri, 25 Apr 2025 05:51:21 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6edb1e60sm130717166b.183.2025.04.25.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:37 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm: add system controller watchdog
 support
Message-ID: <aAuFHSqrBrQWU6ek@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055122_941583_975630B0 
X-CRM114-Status: UNSURE (   7.97  )
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

On 07/04/25, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

