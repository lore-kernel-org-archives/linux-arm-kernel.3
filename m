Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D7FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=; b=w1ABU2lDxHYzxFvC1MKl+B6GrR
	+lFnJ0NsT00HULLG07fLyapNnx9J0xxNOYkIFkTGw7ns5PRhh7MHsqurcJjdWVgAv11I9nnLrkUvd
	YlthuFqXC+2/kWHjQe859T4xbQoBZZxDge2tSEVPBh0ODOAwY5dKAPnOXAxp/DmbbxnYYvyT7htfF
	cH7PA7XWloCHio/ZFm89yNqLOqhWm0rWgqpVNhoOfFeziRUWUWn3qhmHeFFSd9eJtwmmh46mnoHI6
	OiWiN9RXjm8cfBTfa6Bv/JRj2YTw1qzDfd+MbmILslIJ+2giIssdpn8a8VEHMqBQU49Rw0gFDdNsN
	NTSRwCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqio-00000002YS8-2787;
	Tue, 28 Apr 2026 22:16:02 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqim-00000002YQo-0Gbv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:16:01 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so11589075eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777414559; x=1778019359; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=d+84qQ7grA8CQjXiNTHjZPWYE2LNFnB1/2cg+SlSQDsbxoVxcFClTCAunTigEAl6hg
         dd7rWCkAlJpJAuQ2bEGGFIq2Y0jm+Ce5M9kgUEMPx/+Ac/YuzKc9mUafkWt1YGV61JgM
         tfuwuQIc148kgd7N3MZLKCsn0FJ8cEhj8tSes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777414559; x=1778019359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=duXkpiRhJr7OUTmc40U42iCTC+m2F6Fzyv6saucgClwOSIhtlz7rpZmkmWvUueGmva
         NJ0q/4d6I3dJMP1fZDfFYA2wtg/2BFkzPe7pGr3F1OAkXP8R8UIt0bCqV4G3CLWWeyxY
         LVJSHPl7ckZhWQyMlQ+oUan5P7Cx6IqoxLHn2iAdwhLBtf+P2qtL+6y2A1ohaYUHvoGV
         l4b03+GtAkl0+bA5hk8TB7Z7O239w27I3kqrB6fzOwkVetqqaJ/F5uxrEnU7d8qEGlFA
         0oGNRQLQJVNAamy/f6QO1GV+6QQJrJvnS+gbj9mzK+e78xXl8yucl/DZAPZQoCLSwfj1
         za6A==
X-Forwarded-Encrypted: i=1; AFNElJ+wjRW9odQpOBmSUyZdx/h1Gy6mWN1e1xQwXmG2T4FD7zRlm3+ujGAf5cRnrJGihAjso2ifyquYynEOt9kCaO9P@lists.infradead.org
X-Gm-Message-State: AOJu0YxRMRE78SSDSUbE8WwIvTdyrZ2feTX/+ZcnKvr8nxC9k2H9Os8s
	jY1cCERjgkpqvL5fxStRqsLF5lktPJfF2xJIZ2TJjw/qMa7qnuH4VCLA/cqNjtWYSQ==
X-Gm-Gg: AeBDiet7bUvL2dMrCXkT3K6YaNn+ttc8iwgXzlH8Lo1GcoWLudKZjCODcqTVWHA8L3S
	dEn/EJ6j8mlBzSsPk6ow+WIuqgEjm7r1jrhVii1njzSdo2nxb8A0vQLNKn+Y4hOoImyO7xuCwU4
	IifOwlhkYUG8pgW4sOrTogS9vSl1zrkDbgTGfgRoc/Zjb9asJnEOFsVRGKy3Tl0hNqcCTyFXO8/
	3o2VzyM1Is60BwuJaHoKLPT1yKFay7oro/ie23vnKxpz7pSk9w1dn/U6qej0ZosIflRSMUh3z9d
	eK1BlFnBp061YMqjymNErZkas3MBGoG11KHmTjGcAFx+RR7iM2xq7N3dajirlJOnzgIdbRsh9Y6
	pgbZJ/1IGxZa4LCvvtwkZlbbipvBT8g3xjZQi0om/3WsTzygOq+zfviNHTjoRKam2FRq+JwdKhq
	Ory78JJR+OXyGRDGVmGE9iygad5kWpzJzZcq2+AIhOaR1hc0AKSviseYfr55MsFDY5e3Gisdhs
X-Received: by 2002:a05:7301:fa10:b0:2ed:75d:fe40 with SMTP id 5a478bee46e88-2ed0a084038mr2613645eec.15.1777414558981;
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed1c070523sm162156eec.19.2026.04.28.15.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <afExm9HeB-FMmP4P@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_151600_287694_1C475429 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Apr 28, 2026 at 02:43:21PM -0700, Julius Werner wrote:
> > I reviewed Depthcharge code history and found that this problematic
> > bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> > device. Older devices may have similar DTB structures, but I'm not sure
> > if they have the same address-cells problems. In any case, these changes
> > shouldn't hurt even if a device was not affected.
> 
> I can confirm that Nyan was the first Arm device shipping with
> depthcharge. Note that the Exynos devices are all older and shipped
> with an old fork of U-Boot that probably handled this very differently
> (I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
> so they wouldn't have had a `reg` node and should need no `ranges`).

OK, so that makes patch 4 unnecessary:

  [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware

If I respin this, I can drop it. Or if it otherwise looks good,
presumably folks can just skip patch 4.

Thanks,
Brian

