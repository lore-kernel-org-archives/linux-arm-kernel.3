Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE74CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixJuWLCsUOxw30pNhtpUHDTpGG46kFc4qSAJPT9O3i8=; b=1/2PtQ7uzgT2KdJKAdod2b2XbZ
	uQCiZv+9KUhmamkxvonaal2OO15Wey/3raDAuQAEASU8ChYVyrCXSginfap6HvMCB8S4KR7zFJC1G
	ZHczKazE6rVZgJQ4ET+4D8r2VjE9ILP8GlZ+ChWlds8JdTjo1l/CEOeiFQmsvCemIi8xAvVAjZd8R
	fEqDWRjnGK66/0FEQtjjLejtz/JP3m8Ne/3VHBCfIsEeMG9mk3jqwrGdI/cUxvM5qldme4E3ejXW5
	wIFKpYs3TM/S8JMADBJ/m7/lRTZ1ToJri+PHQ4MSgGhc+7V67tI04fFG1i6gZbQdv+0SOdlnSWXh7
	giuyOoUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqq1-00000009Veo-0pHt;
	Mon, 03 Nov 2025 09:26:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqpz-00000009Ve9-0smz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:26:56 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6409e985505so2339580a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762162013; x=1762766813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ixJuWLCsUOxw30pNhtpUHDTpGG46kFc4qSAJPT9O3i8=;
        b=Dv/O5y4mkiqnl7o9mH4GfazDMrHiXJOlsp3cX3A3B1LkfWlkXtXVJfXd2hMaZGCX92
         VIBIl7Ql0s7NA0I3HExjOnqILJKA38FgUzcdaHXejfzFXiEbDu6H6jWzyDzvQkdgRgG7
         CqM3AONGfA9SBGLBZcTSg4czZ9mOymKBu3cV0NfHh1i5wqO7pNKi8uvGePS34d0lDktk
         Xdf8bSOakmIGEX6OBTGt1TGNF9SAiGtg3jwuCiENAHfFYEWMIR79DyHmIbgUpo3fExEM
         p7p2S00sO+r78gM5kEbN+MuQKCwWsY9lhDOObRxzJD0uTudSeL93zIo90boDY49JO7xC
         adLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162013; x=1762766813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixJuWLCsUOxw30pNhtpUHDTpGG46kFc4qSAJPT9O3i8=;
        b=R7lYMxevo8P63O/DUlDp9oqnL/12uE1v33YoxXh/peguez/wKxJQDNmrriaXh+PHli
         XDKimNpilItZK7km42knJs0JbDK5x2kMvHJOUETmJVymuEUkPy9GphHBilr7YnIzD8AD
         Q96tq8/M8e5MNo98mYADe7DNhljheNXD9Js8AO54f10vQT3r834OLlWGtRIL0h1XsNzq
         Fl+jh2ETAwnpnugs8PcpOHpmg6gJQ0IS/m/1nfurwBI9DZ99yfDkwI8XwzoF7t3zJb6u
         r1Gxf1WpywDOmDAk4KpOzmALdxC0YiIR6/B0SZ+bya39MS3C3/u2ZZRfq26cwplSFac6
         xnQg==
X-Forwarded-Encrypted: i=1; AJvYcCURKxdUFveVwXEW2Z1sDmtIx2TE9Hsvgt/Qen8lDFJL5nTEG898lYOemKjWZFH1/JOFwkUL0843zsqreVm9DlcJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzABm8+CN5GnXJ/sSTtNhjaobKks9T5PHdVg4LKxgEUTfEKFSjQ
	TBGxNTHZUS0RFbMWfy3ATDKMffsi0kJjgO46hgcE+QrR0V9sfduPL90sPAwMtMefUZ8=
X-Gm-Gg: ASbGncvBk6q0Qiq1y67QJXYUwtDs+qCaTlO6f7lUKXEsNUW1p/6sd7BEHf3mHsT1va2
	ItHu3Vn0OUJ8n9RRAVVXlGkKGVxBXAX/0LhokwVu9VEvYTGdlax4wjHWwQGKn/KjNJ9qblUbqnk
	vIy6t/ZVzqJDxY1GnnHWa/gsXA/6fePwiFF9q1wnQr5a/SkjZR+h4LvY2I9TOtu2AjV4NK7dZhO
	naN3/LfDlkB6IcZ4ddEH4rxamqjxzCk6xkUc70USrpBNc+MtEUsfb/m8Fgjoa2xhMQsuu8AQrBP
	tgZaxhgDXzYCrhVsL9otg7cq5pI2Ld+WguTDxyogpS7/HDOJtMAzotP64XX0V5312F/O5MTmI5A
	fh4y6sIBdzq4yvRoslkkE+rdfoPItG2OOUm/Xi05qAMXvO+8Pt6dXIwiKo5y39zyrUMsrntId8T
	1BghPjFWXroy6EPOvvfngu4OUroj46rezupKBc/H2Hpzs=
X-Google-Smtp-Source: AGHT+IFbMlV6C3tMmPaPwlvhL5y7JhNKN6mWcEKa/YhIPvDv+nTx/bpkldC/sGDvuJsJzz/+pijPyg==
X-Received: by 2002:a05:6402:510a:b0:640:c3c4:45ef with SMTP id 4fb4d7f45d1cf-640c3c464b0mr2318525a12.2.1762162013313;
        Mon, 03 Nov 2025 01:26:53 -0800 (PST)
Received: from localhost (host-79-19-212-20.retail.telecomitalia.it. [79.19.212.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640a503fc82sm5482014a12.4.2025.11.03.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:26:52 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 3 Nov 2025 10:29:10 +0100
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	Stanimir Varbanov <svarbanov@suse.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0
 alias
Message-ID: <aQh15uaWYYHCaSTb@apocalypse>
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_012655_267076_5CE2C480 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Laurent,

On 13:14 Sun 02 Nov     , Laurent Pinchart wrote:
> The RP1 ethernet controller DT node contains a local-mac-address
> property to pass the MAC address from the boot loader to the kernel. The
> boot loader does not fill the MAC address as the ethernet0 alias is
> missing. Add it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Moved the alias to bcm2712-rpi-5-b.dts
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 09a849dd09b1..3e0319fdb93f 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -18,6 +18,12 @@
>  
>  #include "bcm2712-rpi-5-b-ovl-rp1.dts"
>  
> +/ {
> +	aliases {
> +		ethernet0 = &rp1_eth;
> +	};
> +};
> +
>  &pcie2 {
>  	#include "rp1-nexus.dtsi"
>  };

LGTM,
Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> 
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
> -- 
> Regards,
> 
> Laurent Pinchart
> 

