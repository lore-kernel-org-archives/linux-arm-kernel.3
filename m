Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFDACF45DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4OVLfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=; b=G8jposzwxIw1qJwfUJntu223N6
	heOvPw+E9LIapctMoS7l6uxkz7h/xz2S8HpbyIUCn/N7ba8FzZszDdYjeHiQ0989e1kWy49C8sK41
	+HzsnXoIboD/LZqzdeG2IvPHotW/TX39p4bLobaBQyBlapIEyIIG7MaazJUHB3fnWvrANQ0yJ3R6R
	OGeJQ4FkpdUnxkyI7N4gLz2NxVwafpEIJarMtwJqFcW6ue5wX9xQyPE79acL++zs0ANrx7iEoYTyH
	bgvtJXiy2/zaNNDKuqUWXEG+wA8wgCao1TFoaDQVDOZAFwrQIxwTdL50hlvBZOB1yKRJtLIuK+bkL
	lAqULc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcuv-000000072Yt-39gg;
	Tue, 13 Jan 2026 11:50:33 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcur-000000072YJ-3MrS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n4OV
	LfYY0h+IhJRy0NAJNM9iTR92XV2VZ5uyTVzCW10=; b=IK6cGx348zX7nPG426bj
	8pPnKRpaSVk7EenccYs2FR7/yoEeCbW95pRoGqMTBs3I4Rx4GXVA2VKIqoiZm3lP
	i4KGG6AZ8yTUBSwhhme6M4Tb+jyrWuCOfdoAb2OK1uVl/DGQvEeeN4sTV6b6oUxh
	JX3+mzlFDfkdfFVHJDTMKv+5v4hiUFNPlM86mcoJc3DCYD6p/P2G0FwdXGDxAyCT
	X74tcUuRdXObFtGQ6Su9RVR+dLqe+0lCYNQxILagDFy/f6uijcSKThYtmM+ZT+uh
	NWW/idAeMF6/hdDpaKi+GzTZT2BNpV0/aLndK4mEUffpmWU1arEmQE8L+528wqcS
	eg==
Received: (qmail 1666866 invoked from network); 13 Jan 2026 12:50:25 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 12:50:25 +0100
X-UD-Smtp-Session: l3s3148p1@FUTjmENItsIujnvx
Date: Tue, 13 Jan 2026 12:50:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYxgXn_2WlHLcj1@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_035030_715817_4420BD04 
X-CRM114-Status: UNSURE (   8.58  )
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


> Yes, I agree it's too late to queue it for v7.0. I actually wanted to
> rename my macro to i2c_debug() to avoid a conflict with saa7134 but
> you're right, I may submit a patch for that instead for v7.0.

Your choice. I think keeping 'i2c_dbg' is more consistent but the
dependency on media might not be worth it.

I set your patches to 'Deferred' in patchwork. Meaning that they will be
handled as agreed above.


