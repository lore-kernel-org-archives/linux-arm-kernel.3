Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB791CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJ0C563Ghgv+mwad+zKEpzaeJ9PbuKH0EuvqylaFOXw=; b=fuuDPq9GD48dTVHobzkYsR6ROx
	ZPBEmgch2YWOZprWsFKq6m6b8MwMq6cdLDJdEa4XsHwyarDr5HjLsRiDKcv8mhYgFgAICQYi/CCNP
	wjtoH+aeT5eJ2k3R+rrNDPkjhl9FhYb8EAnr03BPTsYY5DpgSC+tmSXi75A3IPO6ROPoyNvTYVF+D
	ullcIf9gAOxvEgWSd/Odbx8a3B41WrTJCzEZuYlg6Cb29vm72N7s4AkAtOo5Sk+WFpkuYJwet5s8I
	QxasycMEWHDsbUhvP5ckSVvENpAaeAWZGBtTtPNsHRyYnqCp45iJXpcabFlZHuB1Wha/qxkvbeCSq
	n9pQfq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJme-0000000A1AZ-3Fr3;
	Fri, 22 May 2026 06:55:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJmc-0000000A19s-1tcw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:54:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49040362e4aso8920705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779432896; x=1780037696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJ0C563Ghgv+mwad+zKEpzaeJ9PbuKH0EuvqylaFOXw=;
        b=JVT5bcKhpH91IxcorPrLu3JsCQ2pv2YUx1xrlzyZdWcP+tY69kO3rzwusL/tE1kLiU
         1YLZLXIIzxdUBEz+Ob383V2hqb0iGVJf/DXzWphJbQoXHxb0VJL9Ir0LwsO0FXZyb3fE
         9+H0sG6rPF4iAe4Z5O3cGfYMWDNGk/JcdYLW/mIq2M/zQvdMIu9XzMXnwMZ/hDbZwoXL
         yBwgKeXSY55wwQfD9DrQMpG4P55t8pGkoDkopP2piNa88xnRZpHvgzdXzNs6aKOvAQg2
         DrzTPAvWSBcyPrzmxlrcwebOPNpYEM+4LOacAZRaqC8q7QhMMkhJRpPfhRWW8qlBZtdw
         PTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432896; x=1780037696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJ0C563Ghgv+mwad+zKEpzaeJ9PbuKH0EuvqylaFOXw=;
        b=RcPVOW11zzQ/LcXKJ14rrtb404SExjinih1HLyqLzxtm0KcRHXaBOhIXJzSoZfwgqw
         GqOhMuEnbHNxIx8D8I6qcylGcUmaJ/luwic+HYU0TEhelUCS5sscJDM3g8KvDYn6POcs
         ezSTjBMtdbj28C5HrNPaVVtYjAKwBSOowbFv8IgbLmDG11Yev5CIAKnWQMpMr1yOt+y2
         Tt92N8BqpMdllHl741r1XNVAMUK0mvVctrAIqRGOHNFQMkw/7jSz4Oe26E77UJpJPSnh
         bm065NL2zam252BRuKh2yYR6uuUsbZi5kcug1IUomw+Rfo1v+UKCfhU1Z47sGUakJYIP
         qTVA==
X-Forwarded-Encrypted: i=1; AFNElJ/ii7IeahcE/o0CnfOaLw8j8c0MS58Y6aDudV8eLJFTVuqmD3OI9QGCBr90F2IPZMP1niKsiMtSSckd08JB1B+B@lists.infradead.org
X-Gm-Message-State: AOJu0Yygx9zKocXm6DtMXMUU1Q9xxZvd3G3C7z8pfYt6Jwm206S1baAP
	x1uDFa0iLLwnfJhprqKCFSsJmhvgaWCPVKX6h9ceK/+9/nVRpB+fa8Cb
X-Gm-Gg: Acq92OGcQ1jyGmiEOwEFq2Vx/iCCE+MUxlbruqiC1Bope4MIViwZK1JlmSzhOzm4hLs
	icn2pnjF1FXx34XuHXij7ZLuFaTDFZ91wgBXsEAT8OqyFtwFSJ6h6LHFI2Ivm28uk0lr0B32wDC
	PI9BOiFS0FjTfausELv/pQm+jaFNGxt9xNqaR6ZEigmArPwgrlRRzcNIZGE/KDRlD6nw2stmftQ
	Kp3fJzZ4FLVBxjoMx1iYuwkUJHKFa2F4Ostbw1vxNe+5siIJG3VaVkXsDXhNKvElX59CUa61/BZ
	eem+lclEBHel60O3DM7DLMVZ0xPUXyDLERqVU0eHrNi4RTi7PMI+vFcO8fFlmWIP4hONs9+BM9Q
	hxLv0a7bICx/be3jvSGgDig3qW3ZS4OM5BlclyB3mU53QLmc9faVn0GNzgoLWW3V71DPuiMNNRV
	+jfYn7Q65RK4LKTFdnPNI1FVu9cqfL3XJe3MUK5qwHM1IvWcDtQHQXzi1ucg==
X-Received: by 2002:a05:600c:4ecc:b0:490:3a07:c467 with SMTP id 5b1f17b1804b1-490426cf642mr25318265e9.22.1779432896201;
        Thu, 21 May 2026 23:54:56 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com ([31.215.251.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d4cefsm9693025e9.14.2026.05.21.23.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:54:54 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: andrew@lunn.ch
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
Date: Fri, 22 May 2026 06:54:34 +0000
Message-ID: <20260522065434.6231-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
References: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_235458_526258_D34FF6C2 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, May 21, 2026 at 20:44:53 +0200, Andrew Lunn wrote:
> Thanks for the updated commit message.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Much appreciated.

Should I send a v3 with the Reviewed-by trailer added ?

- Abid


