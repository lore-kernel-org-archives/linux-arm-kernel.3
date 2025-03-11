Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7275EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H4srA1VGthcPNCpAAqWtXoGHtNRmcK4eLiRDk79zaA=; b=oM0i+9N5+ep3iI5p6oc6VnQDep
	sT9M1pwQ4u1EkQZRzJ4SjeK9mh+55EoCpfIkb7IkCfa3ZdF/rcKk6SUUd3RHtdD4Ceer9STd94Lj9
	xKqBaHc+ylfAT5+AjVoqJz9xvs+hI0CTrahSOWIUeMSmYPigKvydNzNXNCFEJuYGbYr8z/iehmsPH
	1dMBjfYTXA/3EjUmj22L/3HzPhO9no/fm18LDPcVFffK1KMUNCHW98NwGivFZTchbZgsysywRN0YG
	WQwo5qmakakFk0mw4Sne8arsZdbZwi3Pe2UsXL3LVQhkXnCRiVdNTpEr2FxtOPWpl3/cOiwKdzTk1
	s1Cyw4tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8TU-000000078Rt-00tr;
	Tue, 11 Mar 2025 22:53:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts8Rq-000000078FT-13ET
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 22:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA6B85C5F40;
	Tue, 11 Mar 2025 22:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8352AC4CEE9;
	Tue, 11 Mar 2025 22:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741733501;
	bh=cQ32UG7gcBmU0q9LiPDwqk5Trgsxlc2FpDLbm/adFj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na5n4DhoO8vB/ZZp9X0AIMkONd7kUt4XrONA99mgyzOTmYq3IXKUM/K7QszUAnmxl
	 wktFngOe7+oy6P1rXVNhgaY7aX87c/yiuDSFnMwrhg1KCBUbnz5c9NfSnzaqmaVu4H
	 Usq7L1Z7dTSmcp7IJUm4C+2NlMWSt35x/nMkQs39ZpHQqnEqFW19SFhk32IthVtBWC
	 6AM4RNIesAspf6pdig1nfmk2cmtDnjDO3ZZ7vPDRZxJHS9XDEnbHq/KNzbwdtX3+0+
	 gwU/R+7/gjrrSPDuuOWgQDc7Hv71GxvVcAp1qwJV71Nc96FHEZy8MRL5eIEm1i/x7B
	 +YFpaiKVfDFBw==
Date: Tue, 11 Mar 2025 23:51:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, p.zabel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manikantaguntupalli09@gmail.com
Subject: Re: [PATCH 0/2] Simplify clock handling and fix probe error handling
 sequence
Message-ID: <6xj34bjcmcdktbztrovkionpazqadiscmpg632k2qevxbuf2bb@tzdnnrkc4py5>
References: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115708.1085523-1-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_155142_342197_01C6CE0B 
X-CRM114-Status: UNSURE (   7.14  )
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

On Thu, Feb 06, 2025 at 05:27:06PM +0530, Manikanta Guntupalli wrote:
> This series includes two patches that improve the Cadence I2C driver
> by simplifying clock handling and ensuring correct reset sequencing
> in the probe error path.
> 
> Manikanta Guntupalli (1):
>   i2c: cadence: Move reset_control_assert after pm_runtime_set_suspended
>     in probe error path
> 
> Michal Simek (1):
>   i2c: cadence: Simplify using devm_clk_get_enabled()

I was sure I did take this patch, but unfortunately I forgot it.
Feel free to ping me in such case.

Merged to i2c/i2c-host.

Thanks,
Andi

