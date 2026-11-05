Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A3606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRiJLYiW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFJnWLTN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I2UCmZDII7TZlJUdlHoHQguMZYmeF/P0Y0rUuVe9MTQ=; b=XRiJLYiWtnPcPg
	7a7k7PnusU8ILu8gkpkD3QLykQOt+WINwCE9jOuysWqZMf2QpfNhFrvDvriEfjhK1P5tI101HpGRH
	NkOXveuwmoRz6L/E1iFK88uXOb2i0tthdmqk5L7Ml8fp9/t0vjjv8oTmRzLzrrE/MQYmusR3kSC2n
	f/Za8mVIdX0nO1O8OCcrmYKVICBYZRTRNQOBtvjCzTOEmbi2IZfdJrJjpaiHfeukjX2OIMAzp/ulL
	hnNqUIoF7Cqol5hyUg9P3AF6/e+Qb/k6qNqTcQUiic4/NWCkuJJNMfsSHJIy7qP+EMDeTJj4MwMQa
	UM3rFaQh/YxiDtCVANBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5qg-0000000AmzN-3sEt;
	Thu, 05 Nov 2026 22:22:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5qf-0000000AmzE-1YkP;
	Thu, 05 Nov 2026 22:22:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 683F9601BF;
	Thu,  5 Nov 2026 22:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC321F0089F;
	Thu,  5 Nov 2026 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793917340;
	bh=I2UCmZDII7TZlJUdlHoHQguMZYmeF/P0Y0rUuVe9MTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CFJnWLTN8Hdn81KBHt5b4aPAyQJVP6ghpvhL11RGgs3whi/pcGSEbFet1RPf+MX2l
	 9Flkk9NhvfG1ANLCfKLUEhOTvadYLb02HyEENq4ctLzpXHH2gRpobNwln8qERA6Mbu
	 /0CTAx/YFazA3PRiFkzenEKw1ngCxA+Gv1PplWZ89aJZhMJZmBXo0DZRNhVMIbOCTR
	 +cSvVmJhMiOeu48/gIasQDWh9XOSzJYvwOpyweQjclKwkWIiTvD6O0+gnlXnjVk975
	 Cxf8ebCn8Pphkhz5tVbGinl2tlD2tQayRUsttKM9/V3BXf63WwcvdnvAb7Z2K6Dybx
	 DmL1hBF8QnXTw==
Date: Thu, 5 Nov 2026 14:22:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: ethernet: mtk_eth_soc: add 9K jumbo
 frame
Message-ID: <20261105142209.06d93e77@kernel.org>
In-Reply-To: <patch-f1b04513b0fe3fb0a35ac744799fb0f3@loljews.com>
References: <patch-4f863a941889f0bceca1c082f2d79624@loljews.com>
	<patch-f1b04513b0fe3fb0a35ac744799fb0f3@loljews.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 00:48:45 +0200 Sandeep Haemoon wrote:
> +static void mtk_set_mcr_max_rx(struct mtk_mac *mac, u32 val);

Avoid the forward declarations, please.

When you repost make sure that patch 2 is in reply to the cover letter,
not chained off patch 1.
-- 
pw-bot: cr

