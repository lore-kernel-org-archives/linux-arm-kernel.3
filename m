Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E08CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 05:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNMOaL81IkhElHKr2VApsXrxfwnHiJNxSJBV5ekXwTA=; b=k2fIzNCsWCiembwuM1Vv+wKwbj
	F934zaIRJd+bAQLaGmUI2ipKUdvGuJV2+mujl84YqMPCrojDnlKKGL7uRv4iENYTy8PXNK1L1UIAD
	3tMBCP1uJu5f/wpNArxE97moCanCpD4VOzikbh6SFYRB2Y87h9T7HF7ddSwvDkg0UB5TdyT3usnxX
	nahdwkZEncVqFM+XFHjnn2Rp/bnDhwW40l6mU1vT72MWLIo4GU+JRRzWOfdlM6RJYiepN+3aOWXRX
	4MmJMtFsNW96fN++qiwDVH0wUmSy7pGxgK5sxtLmDQECKuHTxK2aYttcUldcD8S1p0ieQLrxT/RvK
	7ub7RhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1QX-00000002ojU-1SvY;
	Mon, 15 Sep 2025 05:06:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1QU-00000002oim-2AHX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 05:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757912812;
	bh=oNMOaL81IkhElHKr2VApsXrxfwnHiJNxSJBV5ekXwTA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bwExPnFdRLkhCTTi+hk/aoWc+gY5XGZePQgDQN+4nim/C8quuZxzvEFZu002gI0rH
	 9MQhVepzXwruhuA5KoAaeQc1UVV2xJ40DoOw7W6aSSAU39KsCncmJCpaaUbZo6Vhqg
	 /IWyQZ0XW1SBb4NrMgUYpB+Z6F7UQuFy9gpVrgCP5ChIKmMztJMLz8FrXlEoK/OX0M
	 R6Vmg4eHGafzc3EEDbyG3WGrF8dkPqJERJ6wqUddiRub+QPew+DrAs2qpMgSmaY9Yf
	 /13wRgEQSpA7Yf/i1nm+adpnqT6V8yB1yH/BQFxjL8qyojo0YjyFdbOZ+DasjGATJg
	 ljuHfKM4dmbVA==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1C9864CF0;
	Mon, 15 Sep 2025 13:06:49 +0800 (AWST)
Message-ID: <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 14:36:48 +0930
In-Reply-To: <aMatZAX6eFI1RmDH@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_220654_745005_782E6A63 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Brian,

On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> Hi Iwona, Joel, and Andrew,
>=20
> On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > appended to the "under-the-cut" portion of the patch.
> >=20
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
>=20
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.

My (strong) preference is that Iwona applies it, but I'll keep an eye
out for any unusual delays.

Andrew

