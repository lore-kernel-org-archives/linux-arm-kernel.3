Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE1CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 11:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=; b=UfTuPY1fnHNsqDi9K92zyUJkcM
	Lh6k+XSxRE9q7k1cMqU2OF/PZYD7xcvf0RxnnoXb5p8mXf+9tdGKYy6eW7chVoK/fxlAi8FmgaT/x
	rzLsHgV9iFC+V0ujw5p5yb2YBtcmyiNwnToJlQntFIOGnEz4mSHE0bHjufpQeEecti2rL2C3DHe0Q
	aT6+7GD3T1I5tePYOHIP8wjTrzvbadOmk4ztanfxK2k8eVcbNF+gpZNu7dKKtKaHxovO6gSESNNwX
	6CmaML4pUCEeo/A1vzj0c4pskHkgTRnyqf8tk0hC6GwGQKiYFlqt9oUnjTLg2N8SyUPt9NfDjPSP4
	+7HPAjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWurh-00000005SVv-1ksV;
	Tue, 09 Jun 2026 11:43:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWure-00000005SUw-26IY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 11:43:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-460166910e6so2772189f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781005404; x=1781610204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=OERm0Um8G0Z3TrLwPNnkUjKrwtUG1sRyJPCB8TzVGy8l+YEYWuDXTLoYMdPsC3ILb3
         DW5+mutZsgTzm1tlC3ycryyXtNqniwxn/XfachC+P6OjmomWGlEMmfnjl7XsPSKJ1zHZ
         GxeSydqTvhtXQlKXnqX3lDQLtf0oZ2tiykk7s8+3FBf1mgh4u7Prtn6xPl8YqjhIp3F7
         Tss/v2y3Ob8wAVCytxJGBeuSkt9RaLWUg5IczaxfrLUkMdXUW88QNqtFf2TQKjI7uyyp
         C4B2Ysxc/656Tc2bD1/sa883P/ocfzzCVKBt1tWV5mPOrREZEf4NGgTxWI5iQ2Wb6GQq
         Ju2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005404; x=1781610204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpMpBpNcZIgzsuu0bBQY/Gbp97K5pRk23WWL6Y8u5xg=;
        b=YZLUN2XfgLStRnF1H60T+lXmrxbCDFDNwLrGhmXrFqpfEjaAgrdlFzOHXnXVQGOU4M
         ujF75zu48x4mAEX9ZFUHvtXzwYp+kFUcANydJCbDC6YIy9BI8PeM0GTw6UoiLjcdQcB5
         IErsJm7tcprJJfBH+5aN1MczhC6545LNgRsymzgYGiztp8k9qewLvYZGFR0p7hTVcQUH
         nvoc6yqMkTAfui4PsqH+ixp7sU8I0UDFDNMNToR75QVupilpeUcWFSDtIwmc2f27oItg
         H7dEfF/UzbCFr8VNUS6wf8YKVrQ2MIX7s0qkvmcLgR/H9634eXCrzPVuxJRTi9adFhmA
         K3CA==
X-Forwarded-Encrypted: i=1; AFNElJ9RbBgq4IvrIcYTPk0rKTmVXY3Y7EAoiK8P7EloNDpBsDINy6wmSqGA7KVWqN+IIl0/JLxMb1YSQ2jrQoiq1dHO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2wHRpurXKoySLS/sOi5iNHMCdChAIJw7ThfLK1rSucc+NINJg
	ll3G4AHrJbjn3JWz31hZ+tY+3KDCvhzj4YOSlV37W7kUN3No3HuVQH2vAYylT4MuWm4=
X-Gm-Gg: Acq92OEX9qjY9jq8s5CxGJ75tMnbSN/dE4ixO8c/EPGW9bJDHIx/MyOU4aC6a9M/HY6
	rQMWhYrHdXJ3MmWC7I3nBnAIUmUrd+JP94HeBSViRMrux4q0D7IxJNiKn6Z4CGktEx+BlB3ZdlS
	aDvlmgkBWwzBsYjP72v8d7eZVEQIKwqOxwbB+xu+LTtXWPl/3R2CqXOqAku3RHGrN0zzEwB+oyV
	Nf3iFqvfQ1FmO3hSavMuXohjDsF7CK4gCyAr9fYF5dP09RG0MQamqzY//7wv16y2DuM9buSwIp1
	X2KJi413e35RhTZ0troJlJ2ELBVi/+0iNGVATvrDhy4doPTUjXGaYwmp0yueqCTI3DDdcr3ImCS
	nPvu7bRX7MCzy/sUbAjFvRSMeoYQ9pt0rpM17DE6IV6rnOfyhJuB8BzdabEVREM2LhFNtqzKoUp
	Vad5zAHOFdUauTZeWV3fjkUOMb9D/XU+sJRjl3ktlI5D1x3g==
X-Received: by 2002:a05:6000:2994:10b0:460:3233:f991 with SMTP id ffacd0b85a97d-4603233f9e2mr21994861f8f.40.1781005404400;
        Tue, 09 Jun 2026 04:43:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57355924f8f.8.2026.06.09.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:43:23 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:43:17 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aif8VS0pLYurFEho@linaro.org>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
 <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_044326_594552_3FB680FE 
X-CRM114-Status: GOOD (  15.33  )
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

On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> If a subdevice fails to stop, it indicates broken communication with the
> DSP. Continuing to stop further subdevices against an unresponsive
> remote processor could close rpmsg devices that could remove the memory
> mapping from HLOS and in case if remote processor touches those memory
> can result in SMMU fault.
> 
> Change rproc_stop_subdevices() to return int and abort on the first
> failing subdev. Propagate the error through rproc_stop() and
> __rproc_detach() so callers are aware the teardown did not complete
> cleanly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

But what would callers do about this? If you abort the teardown sequence
half-way through you now have an inconsistent half-stopped state that
neither a new call to stop() nor a new call to start() could recover
from. That doesn't sound much better than the SMMU fault. Or am I
missing something here?

I would expect that we should either be able to tolerate the SMMU faults
with the resets involved in the remoteproc stop/start sequence, or that
DMA gets cancelled by the remoteproc stop sequence, before the buffers
are unmapped. Perhaps the order of our stop sequence is just wrong? Can
we unmap the buffers in the subdev unprepare() callback?

Thanks,
Stephan

