Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8275CE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kle5zEPMtEhuui3Ww/DJjS4eRs1ij9eEcdmb0zWS6M=; b=aBWkvWd2Z4ET7Azm1UpFa2f8eZ
	CQ9+IwLmpejw4OOIJFUpI10LdmPQ6OU2Fp9Pf4/iet47KPQQURV6J+uqvBt1rQCWYBCfoBZCmxSUg
	yFfUfNHxY2oHh6urilcWzZ2pDS+Dwk9oDlG+CqjCXbKzVoLxB6FORT7YN/Cmpb0hsBOnHEL8LC21p
	6qfBVbK4ttbiIjxzl3TBVDIhi9wqVpl+iuXsQA+2ROAhDHLlpsJOUjkToVp4GCCMglWgXJdDUMEju
	pNbWUJhlOhTKp/nsNN/QIcEBqqlu/DmJBfI9FiHetFToa3B3jfnHz73uOoFHj2zoCJzQ6Od2BeWMY
	FmqGdXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKy4-0000000HXa0-3qh5;
	Thu, 05 Dec 2024 23:09:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKw4-0000000HXFf-0Z4Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 23:07:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21577f65bdeso12451795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 15:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440023; x=1734044823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kle5zEPMtEhuui3Ww/DJjS4eRs1ij9eEcdmb0zWS6M=;
        b=fllBdx4zS8BlKXlVFRlXQDA6Azcif+97h8S2CD7HxbnUphn04VLEeazHzsKtccM6HD
         jWsfQNCjziX4/SOnroL3uLrzbwRk2jeL/rahqmDbX1X0YR1AXhK/UpygL9YHwyoMoRng
         JPmoO7f/CKd3YOogZ9e6UZIsNE4BzgzkGyTLYO/HdHw6ODvOa/AvPA4MsBS2n2k4RKWD
         VEx8hjuVOdzm/uX01ZLoWTdHUddwNKQDtwjusmZcp44plwnHm96zEDyGMbfrL6E+laWu
         MiE5feitYeyl8cNVUl9YFATU5tkQ+PCkaHAbTDlYd3swgZSp6Ihrg52+MiSF88IjSUQ8
         wBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440023; x=1734044823;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kle5zEPMtEhuui3Ww/DJjS4eRs1ij9eEcdmb0zWS6M=;
        b=DcIl3xqJhzzBHD4JgUCl5FBpA6hsl2LRwx3LPVG654etG+OHFji4JIc8O9j39KhCKG
         OmX+neERfOytzUbl+dCs7r4l7sPUmn22C9YkMLRVVR5SUhDZVE5k9scc+0LFolopki3h
         Clbh6u+povikJdGbvXvJhjb8dR9N2IAurLAIh9qa9bn24G6QSgjDGG4E6OKfSuL4V6aP
         +CqnaC2zGCoijDhW5Lme53L9HtLiTn+7+NHSTv+DzyBgikir1UIY9U8Hdvs3dJLYXavl
         YxmesNa+LZl/Z04NCAydpSsWlCmbhCqgSbfefjwTmXZ9RiuuGEPmEunVIZrpfV75TPiL
         5WGg==
X-Gm-Message-State: AOJu0YyhtwaVpIt40kXNc07GDtpz/bWyVbhhJ3duLAylGYZ1MRfUvsJc
	M+T4XdVzy+zgabyEz7fuob71LOjPWI3w7X76vADcDjBW3k/szwZDk+UmzPpMOO4=
X-Gm-Gg: ASbGncv65mCBin00HpMeo78iJObBb2/9GkiieZmfYjka5waMVpodHmqCXeXXE2/qbhU
	yN0SDxuq77R88frPWVjyjN9QYzjo23ADDfLVSZY47g1q7MoxohvkaYMeg8Q36M561rNqNGHoi50
	BdPDqfUmbWJcCBNyNSU4rV6+3YrMWGVXcqee9tGpeh7b3RHGMjRy38KYBK8DKEskctVpc6emoqt
	YkO01bQgPq7gstxsCJht2ttTcOG4X92Wb8eLA+KhPRbFhw1
X-Google-Smtp-Source: AGHT+IHGIUGWc0kWhwreBCBvD1jXL3mC+VTLShhIdZHR+xTCtRjLfF4NDAE2iMiB0kRfqmx1ivCo5g==
X-Received: by 2002:a17:902:da8f:b0:215:8847:4377 with SMTP id d9443c01a7336-216112fb5e7mr15166295ad.15.1733440023266;
        Thu, 05 Dec 2024 15:07:03 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9f66sm17568485ad.115.2024.12.05.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, Romain Naour <romain.naour@smile.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kristo@kernel.org, 
 vigneshr@ti.com, nm@ti.com, Romain Naour <romain.naour@skf.com>
In-Reply-To: <20241202143331.126800-1-romain.naour@smile.fr>
References: <20241202143331.126800-1-romain.naour@smile.fr>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-Id: <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_150704_198656_2184CD4F 
X-CRM114-Status: UNSURE (   9.41  )
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


On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
      commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
[2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
      commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


