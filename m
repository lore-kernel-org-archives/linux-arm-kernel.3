Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE87D37E46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4Fbp1gWprjaWwTIF67PnzL6ErW/s4uVu2YzVoPvCqc=; b=CNSWagdZh15DAu7tXwuLITAcnx
	xkNwd9adhm0YM5V5E25w8tS2jSTR3JWvQVYmP54Jq9v1nB83ahjOI11u4D+5kMryBT78NNxLUzMak
	aiGCayO0lHKoBBJERJbn49FoLt+zNHbrJZjR53//OZ9JBPcRrKad6iS48MDB8nbP65asWu/nRoXVE
	PkoHmMPL9ctQdyn5n6oTQuowQbDG98NXCWiuSDXT6ZWgYbbSvKZfKVLstbUkTvbOnMFqW/VIi1lO/
	yY8Uv4PXTP5wsXpavWyjpzCK4K3DN90I1BKUabVZGvsbWimUeqgn4rgnSaJacRPhxZRouHQ2jx3j0
	0q3KXWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2hY-00000009fTs-0FDB;
	Wed, 14 Jan 2026 15:22:28 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2hS-00000009fRe-1tFZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E4Fb
	p1gWprjaWwTIF67PnzL6ErW/s4uVu2YzVoPvCqc=; b=bBclkT4UKNVbybJbFbtT
	2IDSjfq04crf0WEXCzSgltWp6wpqj0IOcdpzcamA3rcrrPUCv+MNqmhDSkzgCpG2
	yyUwkpFnxeiwWAsDNIjvzpXCnAKA7CfPCL6C/npvQA4uZy1ffvHBROEEWiILU9LQ
	T5fieVkn9r7JIKV3w9VndZef1veocFlhmQAS4lhzcPxSvtPjH272MMONUlJRjdJp
	0oBKq5rFA2R7i8VND/Ovz3Osry5WRtbS33bnNHtrOtvIqUGOXGrACp1MRRFz7UDn
	VR5kCfSzjz3kuQKrzSlOZBOoYuNaAEV9BRlqH5T7WrM24MhSiotV6b5jeW1eXHro
	5w==
Received: (qmail 2192941 invoked from network); 14 Jan 2026 16:22:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 16:22:18 +0100
X-UD-Smtp-Session: l3s3148p1@2rR5rFpIEqgujnsM
Date: Wed, 14 Jan 2026 16:22:17 +0100
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
Message-ID: <aWe0qYCOFNww_wSL@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aWYiJbtueA8g3srn@ninjato>
 <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeDZf=J4L8M9QTAP+JXGNUFfs1_HyD3fbMOQ18AR29GYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_072223_364149_BB1B1FD5 
X-CRM114-Status: GOOD (  13.37  )
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


> FYI: I think the road-map will look something like this: v7.1 will get
> new interfaces and most controllers under drivers/i2c/ converted as
> this can be done within your tree exclusively. For v7.2 (with the new
> interfaces upstream) we can think about converting all i2c controller
> drivers treewide to the new helpers. Once v7.2-rc1 is tagged, I would
> try to remove struct device from struct i2c_adapter locally and send
> it to autobuilders for testing. If that goes well, we could create
> struct i2c_adapter_private or something like this and store its
> address in struct i2c_adapter. This new struct would be controlled by
> i2c core and contain struct device. With that out of the way, for v7.4
> we could think about adding SRCU into the mix (possibly using the
> then-available revocable).
> 
> If all goes well, we should be done in early 2027. :)

With this plan, what could possibly go wrong? :)


