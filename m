Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DD0CC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=; b=pVvjTh9lFKgyc9RV/i9/oOEKmr
	3OFHRwKSOQWejHh9scvwbVAKI8lmwfE83RSfAr9irLNk/jSagZArp0eN8simJFwhD+hhVZfm7ENtk
	gf/Jh/L+b802paeZNBzPmCk4yKWnMl5A7dQtas6lJnGooSSECOhYHbWNGC0H3wU3s67k+eI5zPtMt
	mtJNNlF3IQUKm3/bHEkZiZ3ZRSLPVfrKTeFqnIY1r9g1GxQlIlw+lsn095cqfXgLxj22MvNTtxmPB
	Fh22C/aFdNdOMqE5jCYm4LB/tcBwLkOtZQ9dHpL2IPiXk5knkuodveGWWdrBasW6Gh2IjB/vtofJg
	bHW15EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCbo-0000000Gm57-1Cpa;
	Thu, 15 Oct 2026 03:58:24 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCbb-0000000Gm3i-0S49;
	Thu, 15 Oct 2026 03:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1792036686; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XzPeRgEUlE3s0CSareeggcFzEnRfqc7xoCpj4oo2E82QbQDlix7V9KbvZ06IcxJ9gTngzArzUTu8Ow3hnS1aRWzkj4bGt5IyX1V/G2XM9xXXre3FgXvqDEIWBVpCSZhAKOblOCeOA12su29hYHCisU3xO6Ep//FiMZI0//bwxiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1792036686; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=; 
	b=APm6ig9UNFz+3FbTT3D47VhHIUfHoLuD+FBpe36tSfRK1owNP9HeEHs5gNYxj+4joCsSS5mXJL66RtNpKJZuCMltMuVEHqcsRaBylNyW/p4CAT5GOtq6RPo9cXi/9c35wZW3HTAV1X4fqE1IoK75Xa1ZS+pKdc4SeHsSTLf90U0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792036686;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pifDH0uDw0EMlv5YUttgPbWoNR7hI3QK3uBz9udZ6wU=;
	b=CZ6T92YOtgOrWHHIxR94ereumsmrWWD6DTCKVTY8K/N+10dtHCVhqhIuwMjV3YpX
	r6jdNdqtfKPRbFC9HiksDsmVyvOKT2GinsZhkRFVI6G0hRSMMpKSZUBWkRslMMian4S
	Q9AcHjYd+6rT1uvzOFwT/24GGv6Qo9fjV/ODwSzA=
Received: by smtp.zoho.eu with SMTPS id 1792036684329824.7527309360931;
	Thu, 15 Oct 2026 05:58:04 +0200 (CEST)
Date: Thu, 15 Oct 2026 06:58:02 +0300
From: Igor Velkov <iav@iav.lv>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, Diederik de Haas <diederik@cknow-tech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Fix devices suspend freeze on RK3568/RK3566
In-Reply-To: <20260624192726.781864-3-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se> <20260624192726.781864-3-jonas@kwiboo.se>
Message-ID: <20261015-m1-tested-by-usb-clk-v2-2@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_205813_201600_69F8BFF3 
X-CRM114-Status: UNSURE (   4.21  )
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

Tested on ODROID-M1 (RK3568) with 7.3-rc7: without this patch
pm_test=devices hung while suspending the first OHCI controller 4 of
14 times, with it all 31 runs passed.

Tested-by: Igor Velkov <iav@iav.lv>

