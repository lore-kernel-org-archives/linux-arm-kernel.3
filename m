Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E4CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vZ8Ejj8aZrBU856Cgb+Aq9cC3Vyu+mZba06VVhY2u0=; b=tCdmNQB9xVGbSjWnWzBVxMDr8R
	ia2HnjWymBKbxkmBwFaJ2zJk9oLrxd8ti+MVufZWVGhJ+5Crg/ED1yOwuh/E/fD3//8dBxZGizt12
	+F8fxp/dQLw/gtkVeRhYlEf+wIj0wrRYaAQSIJucYChUnJDFZ2LAi2ntz9ClHeS9ensYk4AVnofZB
	M6l4ehhjmTZ6tRuss2wl8wtaS5kWKapbLRCvH5CjDe1xeQbFQ60Uh6gX6wHE7G5r6F/1GZO9CAvjx
	hi8bNVZxEHdrdRwYN4XtPouVhapYOHKhUfJd1kF+oFdkOFwV6cULb39qvUzrZGgAQ6y0MoA0NYyZU
	7DDAzQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEodS-00000004UkD-2TBb;
	Thu, 08 Oct 2026 13:58:14 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEodQ-00000004UjQ-0LKe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:58:13 +0000
Received: from jeffbarnes-ThinkPad-P14s-Gen-2i.corp.microsoft.com (unknown [52.167.115.14])
	by linux.microsoft.com (Postfix) with ESMTPSA id E381620B7166;
	Thu,  8 Oct 2026 06:57:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E381620B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791467832;
	bh=6vZ8Ejj8aZrBU856Cgb+Aq9cC3Vyu+mZba06VVhY2u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2MldErZ7BuYtSeyaXTL/+JFoAjR43/8BqyXcXYCQCRU7mBNoqNY7iCRa66+DhoJX
	 rFz+UuSy554Glphg6bl8DrPa++tx9SgytfynLo4JgRkwm+R9oDAJDTHXXPDjmikCuz
	 cuG6NT1cQr9USDmP+24a9RJLxq2CC5ohAg4F2O/I=
From: Jeff Barnes <jeffbarnes@linux.microsoft.com>
To: linux-pci@vger.kernel.org
Cc: Frank.Li@nxp.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	Zhiqiang.Hou@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "PCI: layerscape: Change default error response behavior"
Date: Thu,  8 Oct 2026 09:57:47 -0400
Message-ID: <20261008135747.76755-1-jeffbarnes@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
References: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_065812_173989_16DE924B 
X-CRM114-Status: UNSURE (   5.01  )
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

Hi,

Gentle ping on this fix. Please let me know if any additional changes
or testing are needed.

Thanks,
Jeff

