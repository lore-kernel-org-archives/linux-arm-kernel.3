Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEECBC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB8K7naU/3cWPMjhndPtrJKbfq4r5Bnu9UIH3k9QIY0=; b=p54aaYk6SGBwbKheIR8ewKg9s/
	CE4sYHWOslR9MwtWNNYNxXVplQfUmBIQTlIJoPaA1Z5a5f0cGgk+wcqvF6vzxpDZnzaK7SJVSoloP
	Dk6skTLn6AYs5LpubV00NyW1PRomkR2+wSGGveSRQnLRAYwFkHzJ90i0xFMHN3eib1V0ynurIl2Ed
	5U9Z7f0S5+J8rRIE2l3DHgwsIcwBO+SHWilq2q7YxI14Sfnq9WGSLP78BLfgsJc3fXtK+sqVUzyQQ
	MwFVvOG7/qCSEVLszjVvXLgV1Fq+gUu2lvoFvCj/6lKyikepMRbR5yT41GRUQLkZwEadAa98Vj2a6
	KwVhG6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgdU-0000000GNmo-3r7y;
	Fri, 20 Jun 2025 18:38:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgau-0000000GNX1-1cm7;
	Fri, 20 Jun 2025 18:36:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-236470b2dceso23814095ad.0;
        Fri, 20 Jun 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750444568; x=1751049368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iB8K7naU/3cWPMjhndPtrJKbfq4r5Bnu9UIH3k9QIY0=;
        b=f022med+2JvVr1v1n0MXUzhQOXNyUkJkuuIEZlewmj++j9lwwoe0IB8i1IqnQLj/dO
         OS0B7jFfO6iJ9CbiVJX6yJP/hczAJlo/Rtk7sERevwBEYfbhgBiWhy6kDILvdQk2m0Ax
         cLZW9Jn28jjXlSPFW82xhzdvxoLFkc3rIKbZkqvyVo+nwEX6ozZNgimgziY8dv4rheDq
         bQHh2Bi0tLiyEQA0S+XFor7R+sr5dIkuD4C0HQjnW18W8RP9FFYZmmrpng1CXDPktGwh
         +LrOUO32v8h6C1p+u5D2DCEKtji7eiSyv7/C/9EON9OS2OedY3qs91FecYaHlcGh2+MX
         Ocnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444568; x=1751049368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB8K7naU/3cWPMjhndPtrJKbfq4r5Bnu9UIH3k9QIY0=;
        b=pxxU112SK+M7g0f5vzU2P1/Z4oUn1JaFDVzsle7HOKTHjxW6QhE/rdgu2cx8cAjfn5
         e2jOvZssKrobX28/4Wl394dId82CpM8JkMt7W0xYbikyN2fdcZaixS8bf6oyz4mfdqZ4
         MV4bCcJLHo9hqUxGfqvtzjJpjvw3vwkQlwFIbeIfIX15tQMoE2mB7SGVd3h7EtrFtRVM
         KEqnobX1brUNO4AHvDbzaJiZVUGEJpDbidmcX6QkbV+z3ha909tWmq4RKHoOyBaszN4F
         wkBCCXlSHLSOGy28AxfbcgGZbCQLjyme23jbLApfgRMzM3SRcI0wr3wp4i3KrrEaY7Nj
         pKEg==
X-Forwarded-Encrypted: i=1; AJvYcCVzz5WGxP8wzrsYI7ilSGiSotOmhtu7o7GRmPeIj11EBOi+Cz9cur6qXJnuWX5naEo06V5E5tb4iK7FlCX3xSCv@lists.infradead.org, AJvYcCXGt32Mt2vGEvWUOYJDztQeRaQqKQcFV3UlVn51py26DfmDDHMiMLEFP+u/fB9JLk+c2dRAzWPfS1Kq@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFi5fHkZCzCuoEMSq6NvPg3l4971spl3Cwc1lmJm9e0DvPPrB
	JgQBn+OXnuHtrMozAZYmlp1Tx6Q/Ay4/0EIQW/KyEHG3TzpH9j5B/nj4
X-Gm-Gg: ASbGncvC622k9BYfXF27QO7rUj3SGsTISO5xsLAzEDOIfBgXcQ2pzQTjOGEk+e4dlW0
	Mk5BKqjGJr+lp8wczIbkT4CJ9ebpFg96gZQ/jmfzSGPU15QRASVudgw1MGjuBIr2uRTkpCrC+Oy
	QbIMqq3G6jtNVQZPJWVsCcq9EeQBYkH4wzYropYghlOCAhxErEpBtJqoLCmnLZwitnUxddLDcM3
	WD5xPSI1Pr8TDtl1yEKN2XcOkvkXWXUK6xs4r98DdT4g3kZtZK/Eq9KvpCnwzKTbj+JAyD5Arbb
	/o14S7J3rX1sxKGKdB844s1gb85J771KE+tbRMJKxfeU9ljxgA==
X-Google-Smtp-Source: AGHT+IEpd/aQfcdw5uYZ1ZK+nV3R3Zab/R2Ed0lgYGKgBLEMJrWyEefDcKKfz+3OCjw8DJ0q07uFQA==
X-Received: by 2002:a17:903:1b66:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-237d99064ccmr64870585ad.16.1750444567570;
        Fri, 20 Jun 2025 11:36:07 -0700 (PDT)
Received: from geday ([2804:7f2:800b:cf24::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d872a3d4sm23398895ad.239.2025.06.20.11.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:36:07 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:35:51 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 4/4] phy: rockchip-pcie: Adjust read mask and write
Message-ID: <aFWqB8YRtYlC0vGG@geday>
References: <cover.1749833986.git.geraldogabriel@gmail.com>
 <7068a941037eca8ef37cc65e8e08a136c7aac924.1749833987.git.geraldogabriel@gmail.com>
 <d52fce68-d01e-4b92-825f-f7408df2ca18@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d52fce68-d01e-4b92-825f-f7408df2ca18@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_113608_429265_763AB25B 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, Jun 20, 2025 at 03:19:06PM +0100, Robin Murphy wrote:
> Which write mask? Certainly not PHY_CFG_WR_MASK... However as this 
> definition is unused since 64cdc0360811 ("phy: rockchip-pcie: remove 
> unused phy_rd_cfg function"), I don't see much point in touching it 
> other than to remove it entirely. If it is the case that only the 
> address field is significant for whatever a "read" operation actually 
> means, well then that's just another job for ADDR_MASK (which I guess is 
> what the open-coded business with PHY_CFG_PLL_LOCK is actually doing...)

Just for the sake of posterity, Robin is right here, PHY_CFG_WR_MASK is
just hardcoded to 1, and PHY_CFG_RD_MASK should have been the same
as PHY_CFG_ADDR_MASK as Robin correctly pointed out.

Moot point since I already agreed with Bjorn and Robin to drop the read
define, and Robin was kind enough to track the exact commit where the
corresponding read function was removed. I re-injected that function
from BSP into mainline for my own debugging though, that's why I caught
the typo.

Thanks,
Geraldo Nascimento

> 
> Thanks,
> Robin.

