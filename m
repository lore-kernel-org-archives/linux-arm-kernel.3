Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B4CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UgdkfR5ZJpIqw3CxaKBXneuVyU1q32SHQHrzDgtsJo=; b=x40acpLXX/vTWmr+L1pVb0NAxv
	3BgflMrXr9utCE8Krtdw7OmpHVd0OI+7Ud8wS+ZqS9FGKE/7bZRfXHQ2E0H75jYBsn6AV2YC0b6Zr
	LNe+13MyZmTm+rzR3COOXaS/4NzEMfQuUOTUCR6gAZl1D3d+TY6VvsXv2uGONoCeTsQDKeNBbkC0b
	vpI6KNWh0s4a2Z+yP5hXtM3iVDqr6MOky0PHuC6I+Y7MetqENAWg2OkqrOpQzoeurr58VKrQQA/8S
	xmRSwNw7Jt1OerN0UmPGeUaLGmHmFIOK7wSeyNvV0MxGkJEXrKdow84w+L+8vcLC0fpC0Y252Ox2g
	IuBb+LmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSuP-00000001Rz3-4Bjy;
	Mon, 10 Mar 2025 02:30:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSoy-00000001RRk-0UNA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 02:24:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so6972093a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 19:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741573487; x=1742178287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UgdkfR5ZJpIqw3CxaKBXneuVyU1q32SHQHrzDgtsJo=;
        b=gtnaq48fT5KJMGM5/VYnazIa+bYPLPBNkFRNqF8nqf3SU33oRBU/RfUijgmuRxm8h+
         uSOGYr+OL7LrBJ6anf527W0ztBKaVXJSPh7F+b6ncdSg8zT4l6W2ValEqiBUKi/+yW2W
         wzWymMBjgQsKR8IcHyesIdcPZ3pRCHtYlVnYrm1IEoMQ3HIE+djr9SL6imIetBSWBOtP
         FmuKY5uOb/SVAEtrB5Up1oscVTXB7eX0InsMc2U9n8aVGP9C2HC8rWltgck6JxIyjVwj
         0VRSCI6f5gHdtiv+83eNr+2hfdoT5iHY63xCZOYTQYQqwbM2czhqsgGy82I/DK0K1Ul3
         3rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741573487; x=1742178287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UgdkfR5ZJpIqw3CxaKBXneuVyU1q32SHQHrzDgtsJo=;
        b=G+4TKNYBV7V5ElMFjXB5132jVtZqKhj3qpb1GRwammm9RGgMMFGih3V2ZkT4Y7+Dq/
         NZLrF8P1yQPJYBRkjA8RR/FNhzp1QhkBaN+/kyZi0JAP6JEgt+rANn3gL7P++noxMHoR
         +jP3lDB6C/8kR98XLolY6n4Ol4kwFc9q/lKyp+lg7wEh8NVgZ9sTzzPSeKsDhnDIzdkZ
         Fafbfm/2LXYVxUdo7iQ9DBn5yRzZBkO5+YzyHELvTGEi6oZ0CTtLP079Aajw8bL2xN/t
         ntceQacGcYIA0jJsXXzN8o+Z/cpYbhau+1X/uSHNHaA6kXorTo5gIncu1xcVgMriG1vf
         d4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWKJJ4ZfyOrxhn+L8z8yvaSj5b7fepzw6F20Dqw8uv2VHeJzq8Jg+TcIjRNn6kEVw1itSnfyZt92SOCThQt+Ryz@lists.infradead.org
X-Gm-Message-State: AOJu0YzZKPN3eB1/fdIUaX8+Se5fA0+wqRNCeuViod7rUaIdXEqAtBa9
	HNCNsb43Y7l+s9MQmRurLX80uIn/09P/dNly0ZGKPFTdMqsjZZGW
X-Gm-Gg: ASbGncuXpBHdLf12b8wJ/rH45otx11c1WVT0cMQv2KNSJGyUmngGIgPCtuxzuBR8nLn
	Ml2+4VNlv4iUoQqtsed5/5Rm4DynWAnHawBgsZCIqzuxivbJ6N7aWHfRKhQ8gFy1B8tCZ4akVw2
	9JS39kCgons+mMBrOiq/CpokndRKdbjLn2x7g+QR3CuwkLFNV11FJ9tkxASjH++d7OHhdMWICGQ
	JJ2iHKo/TDzCE8d3RRr8zH5rl8I2rC6JT/6RhHkDK7ebhy31tg9hAOlQCPn5P7kXqSZfu/UIRDx
	zcq3g7akjVtw7ObhslPFcOwiLngfm5HjFdJu8Q==
X-Google-Smtp-Source: AGHT+IEu8uuETGfMoaM3EPE2WfaTTndfm3F2AV9+L8B8fVo7WT9YAUCmxKGewCLzkt/NfrR5yWSoUw==
X-Received: by 2002:a17:90b:4cca:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-2ff7ce837c9mr21980902a91.17.1741573486614;
        Sun, 09 Mar 2025 19:24:46 -0700 (PDT)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7ffdd3sm8645058a91.39.2025.03.09.19.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 19:24:46 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:24:32 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Simon Horman <horms@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>, Xiaolei Wang
 <xiaolei.wang@windriver.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Chwee-Lin Choong
 <chwee.lin.choong@intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v9 03/14] net: ethtool: mm: reset verification
 status when link is down
Message-ID: <20250310102432.000032ad@gmail.com>
In-Reply-To: <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
	<20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_192448_201582_4E89B415 
X-CRM114-Status: GOOD (  19.14  )
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

On Sun,  9 Mar 2025 06:46:37 -0400
Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> When the link partner goes down, "ethtool --show-mm" still displays
> "Verification status: SUCCEEDED," reflecting a previous state that is
> no longer valid.
> 
> Reset the verification status to ensure it reflects the current state.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>  net/ethtool/mm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
> index bfd988464d7d..ad9b40034003 100644
> --- a/net/ethtool/mm.c
> +++ b/net/ethtool/mm.c
> @@ -415,6 +415,10 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
>  		/* New link => maybe new partner => new verification process */
>  		ethtool_mmsv_apply(mmsv);
>  	} else {
> +		/* Reset the reported verification state while the link is down */
> +		if (mmsv->verify_enabled)
> +			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
> +
>  		/* No link or pMAC not enabled */
>  		ethtool_mmsv_configure_pmac(mmsv, false);
>  		ethtool_mmsv_configure_tx(mmsv, false);

Reviewed-by: Furong Xu <0x1207@gmail.com>


