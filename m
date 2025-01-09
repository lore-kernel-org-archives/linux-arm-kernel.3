Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E41BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWpZAtZ5fwsLcgO5aqlcO3OYh1NgLbgjWHyNFFao33Y=; b=DLeAODdBvxrj9KObxRDsr+4eF1
	6d7wj5OzEBQ6YOI30SI8XJ19qKSpP+YpcZ7Bi5Ri21NL1vnkq2jxzDo3KnsPic1YLh8PZGKjTOylN
	KbRAMRCyMiHRZc3CBP7Nk9u8uWvomkJLY9CWMle8lwpdijHJcoV/+yTXk6jTD6W1MpUKvvgLMiwsM
	N3p+DO/eGSUZqp4aMnJgXvNEDeN6BjonEkha11jfA4MRP63H0Q2DBDGV2Ap/fYsaiQh/KpYeBjeMl
	Isabmvv3PvtSG9KuHkbNQjb3Ir6jjreTsigMzTKayonyr7QdrU7dtXR/AyA55Py5fdt/rJ679vKgU
	5T1KeY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwYj-0000000CsZz-0lB3;
	Thu, 09 Jan 2025 17:43:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwVw-0000000CrnM-27da
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:40:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2efb17478adso1946949a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 09:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736444411; x=1737049211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWpZAtZ5fwsLcgO5aqlcO3OYh1NgLbgjWHyNFFao33Y=;
        b=NQ+Xgx4+B0PxqoOgul3uJxPpSgQv3JNFKefOU1wgq2q72JxH5o3IxmzsW//ZQ8qRtx
         EcnV7i5HJ74F6igkRooqG6NwdMCvPq5zrF7FgGAGSlIJwXqTNyFt/F1ES2HyPv1Jbc90
         xVXHZrkic3RE0JpiiIt/8AZgSrv3PO5piUFGZL6/vCl9fWvdooC3XTTobnEUmKkPp4+L
         cLOkxeEAjESyMueYrJT3LgBJLSIi+LMm6iUWA9sXztAx0XvKl2fXhFHBXN7bxgYHGfdt
         Nmr/ssiVdO7XXlfmPCw4AVIJdN530U8yRTSQ/U+Yb1uf3islwD41iM5AzzoFFa3RMYje
         nm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444411; x=1737049211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWpZAtZ5fwsLcgO5aqlcO3OYh1NgLbgjWHyNFFao33Y=;
        b=mO0iuwPsG/uqPZ7Q6LPIRpiK6F3E0ufbwRhOJjADlzw4w35ywMQ/LAjl1cGp3qsZ3A
         hq+e2jUbCtxfybiTXoJI9fF/MBZnAOskinnLusFwsJpymVQKTIrAgUfrWzI4YsDlslUq
         aNSfPxQumOTXYKlvkTNGXVCoL75k4MmKbjx9XLEOrG2JPMaekywovAK+Nj+KRxCdgL20
         ULN/4Y2Sw4JVmhkhgVbYXqa1cmQY2wrLKm49uCWkTixJDkq0wMJh8GFCHno3eiU8N7sH
         OLVv78sd0IRPeo5YpNLIuyQIds2RjY8rgIeDmbjeywQikbjcXcW+Bf8KN4zhDkZrfU1I
         WCPA==
X-Forwarded-Encrypted: i=1; AJvYcCV9hmzsOLgwap65MMZIx4XgkgqfXdrVK7NqjktX6qq8xUopKSOxe0Y7LUjYHpbDae2EnLs/i10dMZaf8wP5Tc0f@lists.infradead.org
X-Gm-Message-State: AOJu0YyPJufy3mDEEDDgMOcEAwwaarQcq7Jd1pcVCRxy4HD7ifTgkIDL
	Dfk+xCCdDvYUuCWSZmgmOWQfVZS5sqUEgj+RIQw02fyUUEhtbyY=
X-Gm-Gg: ASbGncvcNkriB1pJBwk+/l8gCzMiONptRJJO3oH7ciCVEegyqkfXPpeQh0ZPXrui335
	RqfUdETeb1jLXImJowxHurKss/xWZUz5Wo+cuMYFW1UuJ2cwpcvw+Gqwo4hjtEzI+j6289OgXh3
	X9lAhKkwzeSlqQOemwv4lqzmRecXAKxMvzENfKjvcLzPmgdYUXDuKUxJS24SYGYG7OL80aO3CAN
	KdaYlcwCSuCpswl/afSEd1m3FjEF4X6u2KIHAYC51W4Eh6gti725XuY
X-Google-Smtp-Source: AGHT+IEZHpA+1As7rYRP/wbYTv7BBI8EycFV1R1kQaORb6ULu5g6y7WttO6FZ+OmR/qIEMsz9TCzbg==
X-Received: by 2002:a17:90a:d887:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-2f5490dbefemr9659697a91.32.1736444411540;
        Thu, 09 Jan 2025 09:40:11 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d0911sm1848116a91.8.2025.01.09.09.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:40:11 -0800 (PST)
Date: Thu, 9 Jan 2025 09:40:10 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	"Bezdeka, Florian" <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	"Karlsson, Magnus" <magnus.karlsson@intel.com>,
	"Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Damato, Joe" <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
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
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>
Subject: Re: [PATCH bpf-next v4 1/4] xsk: Add launch time hardware offload
 support to XDP Tx metadata
Message-ID: <Z4AJ-pIyAUbXJJpx@mini-arch>
References: <20250106135606.9704-1-yoong.siang.song@intel.com>
 <Z31bQ6xEkyQvbutN@mini-arch>
 <PH0PR11MB5830D33B679A0ACD3FD6E23CD8132@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5830D33B679A0ACD3FD6E23CD8132@PH0PR11MB5830.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_094012_541154_CA44C825 
X-CRM114-Status: GOOD (  14.33  )
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

On 01/09, Song, Yoong Siang wrote:
> On Wednesday, January 8, 2025 12:50 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
> >On 01/06, Song Yoong Siang wrote:
> >> Extend the XDP Tx metadata framework so that user can requests launch time
> >> hardware offload, where the Ethernet device will schedule the packet for
> >> transmission at a pre-determined time called launch time. The value of
> >> launch time is communicated from user space to Ethernet driver via
> >> launch_time field of struct xsk_tx_metadata.
> >>
> >> Suggested-by: Stanislav Fomichev <sdf@google.com>
> 
> Hi Stanislav Fomichev,
> 
> Thanks for your review comments.
> I notice that you have two emails:
> sdf@google.com & stfomichev@gmail.com
> 
> Which one I should use in the suggested-by tag?

google.com should be bouncing now. sdf@fomichev.me is preferred.

