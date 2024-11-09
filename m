Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0888D5E386
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 22:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agd7DTsP3iDbnG7sWOzlCcsKSDrrKy3fQmFvesVPIFQ=; b=Y8aO8kQMYZv1HBQAs3zjB+9pcq
	xE+A0Xtz4XjiBq6C+zWFl4Yzmzq3s1UYebZ6PQ7WejlBp9JXvPi3U40e3BLbjpJUDXU6XHkarDodT
	utR0azdE6kIcIewdM1g7MHaXUYGI1I1F94kUNLDcTtvzF84oBm/CZrJrioYATRweB78+GdT/f/8Wt
	ElnBlC1g6AeAGqM/2U4VKmNR62TOyRwqcsh8XUUdqjJZ6tJH4s/5vnJZnlYMbgO/7+sp/aJYpXnek
	2X3b+8BqCLFP3MVaruXw80tWCfm1J4unQGgxVVTya9MAwLZho3B2D3FJdgD1ix5Bhv1YurJyPkBtz
	xfWRmr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uLH-0000000E4vB-26oc;
	Sat, 09 Nov 2024 22:54:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uJV-0000000E4dv-24rq;
	Sat, 09 Nov 2024 22:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=agd7DTsP3iDbnG7sWOzlCcsKSDrrKy3fQmFvesVPIFQ=; b=wfgs76lnTeZLn8bIGTGvj/GPhh
	rmaQ8JI3KX7xwRsd4sVZAtL8Hwg1O4h452xGUxoxaH5ocANU/BPzExe0jClK0Ap2ko4rROZ0afaKl
	j/00aJDatlW+2lL7WMVt5MjQvVuiAULwndxotzYbl+pXMm1AqrzXSlkUYzwACxJQPmwIF3n2qnxjy
	VWBaqB1MudAW0Ae3FgKor2rat8hGrqyWHUopbGGcizY9uZVAvoy2rZBXrbTlKlX54OUks/UC2RU/3
	2M7xK2L6WUKtURV15G6TRJPOumH1eH+j6L/WAdgQ3Hfo7ISiaRvKVilcajYTuyJZUSOEnxYnGoPN6
	V0dJ483A==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9uJN-0000NE-MY; Sat, 09 Nov 2024 23:52:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	hjc@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: Don't spam logs in atomic update
Date: Sat,  9 Nov 2024 23:51:56 +0100
Message-ID: <173119266840.1201296.2477223024161993614.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028074140.382199-1-andyshrk@163.com>
References: <20241028074140.382199-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_145217_629145_F3105BB5 
X-CRM114-Status: UNSURE (   9.48  )
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

On Mon, 28 Oct 2024 15:41:34 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Demote the error message to drm_dbg_kms to only print the message
> if the respective debug messages are enabled.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: Don't spam logs in atomic update
      commit: 712ec5de382d009396ced509e75b392d28871aa4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

