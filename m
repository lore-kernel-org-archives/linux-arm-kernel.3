Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E15DE6C5EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtsxUMh+XFIIoRCLBTewSQ7foIeXplcGO4qMt8g9uHM=; b=nvBZJPKMjpyQE1Zka5uAqVLwGh
	SquD6tPdqsi1lzZAbywCTTk/sTthwgzfxC9mPzfHKTm/JaWjyCyFwRpWrwxIZfv5N56Op2STfmqdu
	+x3+IJkhNwy9XKOwtC4/XZCgP1clygpEH7f5a57QyHLaCsWXFDNGLnFhQ1fGhrGo2Rszr7xziJKAW
	19dGsiFeOcgsaEaUoFBYOlIKqVPHo8q6AD+yjRH/HwXowPGTh88YaY5cz38qT+9mfzt+RIcYwG5Bs
	6neaxe7ajSvG7zKzGjESLD3hNkPSx0ESs0kHIuixEv2CibrKp51umXWQfcC/FqLBymcdgmG41mNk1
	uBS+KMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIHN-00000007yYp-0IML;
	Tue, 03 Dec 2024 02:04:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIGN-00000007yRN-1MZ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:03:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215666ea06aso17891725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733191422; x=1733796222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtsxUMh+XFIIoRCLBTewSQ7foIeXplcGO4qMt8g9uHM=;
        b=Wpd2CyEWJ3bneEAUAbqUxiz5tFZZTS0BIHicfKNnjW/C3MMtL3ExufVb5LWRs9etUs
         rkLgb/ke6irJMcetX5n+eLftv4Gju98z3ny+ESalJYpdjIgs8dGgOh+xwCqaePIUlC1+
         kDfKrj++91NmPieVEcNfHeMNlrugC0OvgV2R+dqDxLbiBblPjnO+W8VT45XOk6VjiRm2
         QH6fsEDEvNeL4VCRV7t/emYAg7FNfY0+x0cjqj2lAYVU+OUlVrtMwtIMy2iDCbrv2Av0
         fIA6aG/C223yh1O13V9u0J+nNPx5jXL8kcdX/XogOP/U/9NCtTtQmL20gtiGBThCjofz
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733191422; x=1733796222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtsxUMh+XFIIoRCLBTewSQ7foIeXplcGO4qMt8g9uHM=;
        b=deFb7DX44w4G555e6+YLB2uI59qAJzMLV2POTvEoueTGrdWKfmjU8cv0673P+qYwTo
         tcHkg97qkuVWNU2jK5GPoe6WCUHwBRMuDwIDBIeYmZXYo9RL8lF8+zyCChV58+Wc9cRF
         DUmS1Dnjs/pO/MxKtP0QoH7zNv60AqMvjymHLQkqJJd3PkL4vTCsE4pT5IFdlFmkVKGe
         U0ZtkZ34ni7eBvrMziy8F7Uc8AJm3F5/gdYMkZcslP077ZMoBYOGlPG5baN8vh9N/oQL
         EgDGTw4EnHLg3WWzgYArIjAyGOGWUqdQMx4JRbzI0Ed29MrNEcD+7royxoCCVKZsyPXH
         +RBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP+kZuThyrCVetuqGgW11YBoxVkEWanr6fjbtfElmKUnkS7xNVDQWUI7DxqjbrJSFyzeTYZa773InB/dEif4K8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6AXlkJPwS3bK6F8Xv2KtWffvnZ1SdVPeFqcO2NvQa6+vV0YKz
	03wjirK4h3vYORZ/zgUzoD0iMrHhDUTtico7ewO9YKFlNZLNsdc1
X-Gm-Gg: ASbGncv+ZHXOWA5jsdmeJomshCbiHSdbYun/hMMAO56OqzIANQ/3XekC2h9Q819aPz8
	t2betdomA8aNxD2iXyhwz1stUtbsQ0biB46b42xYEQ+8eQzTMUhNfNvPmBWxto6pIDaH4Vp1ArX
	eYtdHLO5KAcmf1Bc98huZB0SjVQZXdZP6vVzXhutEecLBjdnpaOKI5cO7n61/fgHS2XyUo/DikX
	cU8/dgCnRKH9iAVriV9hmPxPsLZ6I82p5B1EjjlTIjWd5I=
X-Google-Smtp-Source: AGHT+IGntlHzteD8zmiU7Ily9CXIelHYFGfjQVFqN0cuB4JWz37qzC5Ex1Ovks7LVjLzw+N8Yz3xAw==
X-Received: by 2002:a17:903:186:b0:215:9eac:1857 with SMTP id d9443c01a7336-2159eac1b3fmr83999545ad.5.1733191421771;
        Mon, 02 Dec 2024 18:03:41 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154764f312sm63036215ad.102.2024.12.02.18.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:03:41 -0800 (PST)
Date: Tue, 3 Dec 2024 10:03:31 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241203100331.00007580@gmail.com>
In-Reply-To: <20241202163309.05603e96@kernel.org>
References: <20241021061023.2162701-1-0x1207@gmail.com>
	<d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
	<20241128144501.0000619b@gmail.com>
	<20241202163309.05603e96@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_180343_369870_A59AE969 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Jakub,

On Mon, 2 Dec 2024 16:33:09 -0800, Jakub Kicinski <kuba@kernel.org> wrote:
> On Thu, 28 Nov 2024 14:45:01 +0800 Furong Xu wrote:
> > > Let me know if you need any more information.  
> > 
> > [  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > and
> > [  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > [  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> > are reported by stmmac_xmit() obviously, but not stmmac_tso_xmit().
> > 
> > And these crashes are caused by "Tx DMA map failed", as you can see that
> > current driver code does not handle this kind of failure so well. It is clear
> > that we need to figure out why Tx DMA map failed.
> > 
> > This patch corrects the sequence and timing of DMA unmap by waiting all
> > DMA transmit descriptors to be closed by DMA engine for one DMA map in
> > stmmac_tso_xmit(), it never leaks DMA addresses and never introduces
> > other side effect.
> > 
> > "Tx DMA map failed" is a weird failure, and I cannot reproduce this failure
> > on my device with DWMAC CORE 5.10a(Synopsys ID: 0x51) and DWXGMAC CORE 3.20a.  
> 
> Let me repeat Jon's question - is there any info or test you need from
> Jon to make progress with a fix?
> 
> If Jon's board worked before and doesn't work with this patch we will
> need *a* fix, if no fix is provided our only choice is revert.

Thanks for your attention to this issue.

I requested Jon to provide more info about "Tx DMA map failed" in previous
reply, and he does not respond yet.
This seems to be a device-specific issue, no fix can be provided without
his reply :(

