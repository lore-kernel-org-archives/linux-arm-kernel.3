Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8760DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEcOoHqZCQz992D1472+Bd71qizVhWfxyGjZ+LGLdMs=; b=vZCofyhFLsR0yzfZrMa5YnFcuG
	RlEBQ/zZQ7zLLlAUIhPdwYd0IwODezoVVWugPjwJxrQgRYdBuxCIIEV4jbQ8QZosAQZylnG1+wIh7
	R9dNW4xBflY2SLInxJt2ZYCviMPNpqxJ44MbZHODoIRHWaEEL4ZlBZZNVbHlvfYjz54E8LPYsZV9l
	6GKUf4j7YvDdGpprnLWuc80ouIYtbkfnKo83U76B7Z3qq4Zp5fmkBYP61krD5HaCe/yVX+igucjss
	vGb9A01gKcjqIoFshDOGAlVHhX0bnzLrWF8TL2urz8gzIPiwWw427jnTbDnS4rCdqTAdHxd9sHBuZ
	/iLrvzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDkR-0000000DRtE-04jJ;
	Thu, 16 Jan 2025 00:28:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYDjA-0000000DRdb-2Eg6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 00:27:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2164b662090so4956555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 16:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736987235; x=1737592035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEcOoHqZCQz992D1472+Bd71qizVhWfxyGjZ+LGLdMs=;
        b=OxFcKCb405WhjNXKFUoZEHGRgtIwvntnb16dvZE3Jc7NIZnk7ubfsZIVsWcTBmdU1t
         3lYqYse6D+vgRkrc0sM0I/v0/XHiZO+Ydb8OIevU2T8qAaytNlmhf0N6+EHQ6b4yVbeL
         UQK8CtsTvAnlxMFmKe/XphXrEaCMzFTzDgDeDwMFYSI+myd3GGAhGYZfcu4s6hWLOv+p
         0+fg5areZgIR6IGM+8o88epfxTUFlu+jw8UUmwYkJiU8/Niqch9oGcX5PS+l3bRJ3Dgf
         8D3jBtNeMiBRBQxma6vI800gpUCy/K4fsnR8JYOG5sFghtG+01o7tmpI3r/KOqMOog+/
         gH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736987235; x=1737592035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEcOoHqZCQz992D1472+Bd71qizVhWfxyGjZ+LGLdMs=;
        b=NUPhRkVYCUoMCu4pLE99dcuZtyfcwAgzwVNH84y2J8T1nP/xNWguq6E3d8vruTlaUf
         wYDyYgZ2bKkunnDixTcJCbPPYrYVnoBFqU7Um6CJGXMcFsm12qwxoDJLzsuezNsGdREZ
         fhpZc64XUy/++t+N765VkOZpxk9ejcMithAm+hGjwmMvfdHpSaEXFfyXVL1aiRtPamhe
         MEQxw1Ko4IXbQAaP4o7pGvIAbuLX8ZmnBvkaWEA8dTM0ahm6kx1x4mL1hfj+pjOe6MrG
         eYGeksxa92PSvPs1mLCwHrJKLfAdDrWJCnSaosR8pZDXmUT7aoxGT9GFQOcnluE1FfYH
         NJlA==
X-Forwarded-Encrypted: i=1; AJvYcCVy5tpX9RcSs+1vb5fPuIP/8V5J8bNjYgPXqt3ZrRkc6gG32xVZBrjvDQYZ/ddyFw1m0yjTG3oGDoMvRbZQOEGh@lists.infradead.org
X-Gm-Message-State: AOJu0YyGL+CbXinSLZQo+rSzmuM6flZR0N+NMSjPxPGNUKchMmthG3Om
	nwVIuDS+Jhk79hn7Z2NV4f93cVdvm081lw2tapHjetGJcjdkwK0=
X-Gm-Gg: ASbGnctrIijuhDp7WMo1UHE3ukWnV2HUDhjQTFe29Yv5Yujlws3kHyg6TIrg/fLgwI4
	75HzXz5/NeWApuLMLafnOFj6iFvBJjsC8k2s2JDV8o9ow7fmvOk8r+kZ77cErv1hELbqSO+j/6k
	nTwHB6baRwkx/4ITGeGI+uV7LAbLeKK+8zb4IWjA4eDr2M/K69CBviHne/rib7/qBf1LUJvfDIq
	jAbHpudjRimY13fK6qtJsrFlBcP4p4egdZ2W6zHgb9UECbR3YO4e0Tc
X-Google-Smtp-Source: AGHT+IF42kOgX+PydEftgfBZixafBXfUCJHxwxxwV4uV0EJebudeO3qjsr2vtf7hdNZFfdVhP9a6Vw==
X-Received: by 2002:a17:902:ce06:b0:216:5561:70d7 with SMTP id d9443c01a7336-21a83fe48c0mr475141105ad.52.1736987235115;
        Wed, 15 Jan 2025 16:27:15 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f253a98sm87014465ad.224.2025.01.15.16.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 16:27:14 -0800 (PST)
Date: Wed, 15 Jan 2025 16:27:13 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org, xdp-hints@xdp-project.net
Subject: Re: [PATCH bpf-next v5 1/4] xsk: Add launch time hardware offload
 support to XDP Tx metadata
Message-ID: <Z4hSYdzvbggntSr0@mini-arch>
References: <20250114152718.120588-1-yoong.siang.song@intel.com>
 <20250114152718.120588-2-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114152718.120588-2-yoong.siang.song@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_162716_572122_02960CC6 
X-CRM114-Status: UNSURE (   8.91  )
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

On 01/14, Song Yoong Siang wrote:
> Extend the XDP Tx metadata framework so that user can requests launch time
> hardware offload, where the Ethernet device will schedule the packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

