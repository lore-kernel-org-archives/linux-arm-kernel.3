Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D98E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=; b=I44uwZfvKUVSfp/RuHBsFrBjuU
	YOo6soS6yjwxotZ265ukSPc3FLSuerqjw2hY3t13O8F8OCWnsi9sQo335hxPCLpzwAygx5xhDagBu
	0pAT4BSBFhf+qmEMoYqh3wex8FrPxWEnm3NHCKimOwTy+aL5+jRV/7rNHKJ5sMmfwIHP8rU6Furam
	rwEQFCEbc/R1ihGHpfCAZFOva6K8VhPXGsMnZpuMwXrHbf5Tlf5JxALVmq1Hiq0P6IBnE+9ptQS9z
	LGS5mJmjDLQTgecR49LphjKHO5cjtEVGGEd7S7g8snmmvCgoDBXI5VcWhu0OFW7ezyfo7xwTfxVpX
	LlOO9dKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdlx-00000005720-2yUd;
	Fri, 20 Dec 2024 14:14:33 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdg2-0000000565x-4BD5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:08:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1160869f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734703705; x=1735308505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=du1OCQZ7axvr0Kb/Yfvm4p0b6PRBsLzGJytInemtca96IA6e01L85h9rUHzPICSeaq
         lwZiwhjjdcIcqq7r66wjjnwPDPss04ZTW5i3vawfxr1C3mZsPVGO6G1qTWGhsGkr3I2a
         01vicqfWVOobjY5eia2W/AwXDHHBg6MkiTlp6jRPxsUtvEw6pcu0ZTNdkcwyHSKLqgde
         JQekyBk8QVaL3zvxo+nDIkHyo3Wycaqm4qB34yKJeH8fGjKKIb+kYxxf05n19K6toKSG
         /PhD7BGhOdfToSH2IYIB2wtsfAomraDWqrqgfjL0sYBGyYMfj9/XUTtSNFkTc4p7a5Jo
         2Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703705; x=1735308505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2OQDSxlIjkv6IYB32QqjLNdXWxA9l5+c++JHu/xF9o=;
        b=qCl6VFva+7jdj/7iMbcBKbrAwm1EV43S8lPEDiLnIAcKjZxi7lw1KsC37rMEIUPsgj
         SIE41SeunDiwbGZ+tKdrjmtz5uYjIxDqJy5NsyyLvWIz7YcZqlsN6FROE+anKjny6Glk
         lAvFunDU1Xxm8zp71q9rU6SunIbhI+iVMZTBI4XVuoEUT3VWQLxuHLQnNM7Exksz45Ds
         uf3dcOZARfx1hYS0cLc2E5PBmj1+jpSlFo4yS2mp1Fh0n3nzAvEn/n6RP15O7NuouVsC
         Gb9OUCZ53fqcPuOhsOx1qBheyvtjDt4FSebFTsxOMlejgkMNPJXREGc+h0MoV9uBr9wK
         mq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSqJHMyMOfDIXi0zkd9nGCxpU4HpvHlJRYM2IMqA4wsyzCwmE1CEM1aRbSopPB/UeEpYMoJyE6Jb6aGnxo70EQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxlOyaQRTd7D8UmTc677hY6OZ2/OAPq2Z11SpTWGiPWgP44PchN
	GEvNCEox6lx0RDf01/wdh8anJvPqZytxmLnOfEqydP73WKtY8+IWey7I7l3aqjo=
X-Gm-Gg: ASbGncv2f+OQCosoHfIRmPQBAAjratVmvBgKvFmvxCiv0ovK4aEGmmuG6m2Hn3HG00o
	fRfPiQCWfF+ow7ZtU2o+zBNPFtFKCj5/hqQY9dedQd6vAKFFfKTUVu809dotctO6oYgT36Znf1p
	fOqt6fNFZ7qecD4Yfj9JJu0aUaN50lf4h96508k84T5eQ0k7HDWqw/sBxJKlzfOJpcQPhnP6n6C
	NURDo2Rn0WqstHEAfVy5Z37+AMqqTs/mwg57lctRpJQUdJACKuIVusYdEtCtj/pIvoMkXc=
X-Google-Smtp-Source: AGHT+IHaVoo3sOmtyWzw4UW+4I/j953uzAjZoTRNej1wZU+3u9kyNjoPkTcRqItKHRuM4B6rwHxI9A==
X-Received: by 2002:a05:6000:1fa5:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38a221faf85mr2931306f8f.24.1734703704952;
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c84722dsm4148880f8f.53.2024.12.20.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
Subject: Re: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Message-Id: <173470370410.3067219.1883604095856278984.b4-ty@baylibre.com>
Date: Fri, 20 Dec 2024 15:08:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_060827_255762_AFD99514 
X-CRM114-Status: UNSURE (   4.71  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
      https://github.com/BayLibre/clk-meson/commit/66eff51d972c
[2/2] clk: amlogic: gxbb: drop non existing 32k clock parent
      https://github.com/BayLibre/clk-meson/commit/1e1fd26ed4ca

Best regards,
--
Jerome


