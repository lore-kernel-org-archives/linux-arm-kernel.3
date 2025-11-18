Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C3CEE33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTgGsj6WiKNDaHYUbLq40X1yODgptmggVU3PhucSC4Q=; b=CmKzsxx6KP+K83Y7HMNI6wxjgw
	33tbrNv4Y3Yi3lclRiOtVJ296Dc8Gh27kJdhwrXhhIGG7IU7Tk1zz0cI8Ne7NwG5WfHL5wHwshZBL
	DgRrDBLB0s3eVqyShZpS3UcpDmmf0/PHRX/evc4wF55icP4QR1tTnUkEn45Oo116EmY1W/ZypXWkI
	7utRZh5Z0A6E+3ZCP31EcodVN42lPomA5pom3cwClbE3Y4FkMTgJRYS/0aHwn4ame0b6e6rz7fP8E
	ul55IpUkKWTDN7yn3rX89XkEefG5nH72KPduPscaf9NYvR8ZGG4hN0ZujK6bLmWHhxiN1ffIVcnOF
	QMrQ2iFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPLZ-00000000qUV-0Qqn;
	Tue, 18 Nov 2025 17:18:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPLW-00000000qTw-2dSI;
	Tue, 18 Nov 2025 17:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 452E241764;
	Tue, 18 Nov 2025 17:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3632C4CEF5;
	Tue, 18 Nov 2025 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486305;
	bh=EEwSzAuRM0kq1EprADYYK7v3yQkWwLAJQjIqfYobBFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HG31WzSorwr9uYMM1jp8y4FNbu4d/kPuj16fkX4cfdoCG7Zpnz5qD2/cDfexk8+rg
	 o0tC1flc/yJG1IC5wU7Q/CofQRbx9tWoXaVJcLOhCMx6ZOf/lcmuxrsQd4NiXliFO3
	 fESWiu80RjXGA7I7qmRbP0ezuIpgEYsCtbUq1NaNZVeuEmje3M3RPJsa/RkFloy1Ec
	 dzUj17G8wV+xF78foJ8RUbI9EttwezeeoWjSTEDIGyX1nsyYpXB7baIYGDN38LN5rP
	 ujIl/WxR+uZGhv3JZ/YGkCAMt0iDvx6RXBT1MrbLb5pK3jl5OJQ8JIyYhEFTn0v0mg
	 LN37zgN5/oKRg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
In-Reply-To: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
References: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
Subject: Re: [PATCH v5 0/2] Add new phy_notify_state() api
Message-Id: <176348630114.62598.12188488023476027485.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 22:48:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091826_691762_3B3BE7DC 
X-CRM114-Status: GOOD (  10.27  )
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


On Wed, 12 Nov 2025 16:27:05 +0000, Peter Griffin wrote:
> This series adds a new phy_notify_state() API to the phy subsystem. It is
> designed to be used when some specific runtime configuration parameters
> need to be changed when transitioning to the desired state which can't be
> handled by phy_calibrate()or phy_power_{on|off}().
> 
> The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
> need to issue some register writes when entering and exiting the hibern8
> link state.
> 
> [...]

Applied, thanks!

[1/2] phy: add new phy_notify_state() api
      commit: 4edf654be5471659e3260be0a557eaa2ece668ab
[2/2] phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values
      commit: a1af5d2be169ecec92cb4d85c811450d68164aec

Best regards,
-- 
~Vinod



