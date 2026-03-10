Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0C5EA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayV8BCyf2XoDInYD5LQLPcn3jxd6CB5g4EREMmVVmUk=; b=QdRT2YLaQkgxzumznDN/Gb2Nd0
	U7fEss6QoEnoaV/gEztCFACM3yxBnJQmVrNhlXOku+SNpdl+WVQnfQE7KQDdsmCnmvBE10RjFJzjV
	Dc5iG1XdTsCp3YXI97b2Kt2QRaqH0Nv3FWvzfhMWummPyP6DcD/gvcm1EFFjJWfgzWX83NOFWLfM5
	2lc43ObioCZsp0wiYy70V1TLo7WxZMdXVYhbCYFbt1T9+ee0v149SHWrsMjDGTrNhgAolOuBiYbF1
	deixkOVYPpiF/V1+R91rV1cvzot+KFwWRXutp88axxcMeaHoA2qPgqI+7zFcka5Y95viRJt1lsDvZ
	vdNICtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztwB-000000099YQ-3fVR;
	Tue, 10 Mar 2026 10:03:39 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztw8-000000099Y5-0STh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ayV8
	BCyf2XoDInYD5LQLPcn3jxd6CB5g4EREMmVVmUk=; b=IvVQiKD49JJr2mO8MnCm
	HNkjuXFc2q+FvRrxrIZVB3o4Y1HsKbz8tYvQdg54JveB+oixMwKDvo6BEbIGi5rN
	3lznh4JHMBi7e2LG/MVw/gaPWn1eGfa2mak79JsNkGmmAKVKqwV2WFwuTqZ/Y3mN
	NBy2rEmoFAT5DXAJomjfU+4qICRRQpHwA8awAfKdIvTnf4ClS2pflah1YRvJJsMo
	cMHsi6Cxo9JHrDe9CCDHjAWHTT9M4s14TM/+zAVwAnaFu5sL2vJSn1NhTsDcQS68
	5uZvwO+f0jf7ZMPSIzLwjFLZwf3pmQPXJDoM0CuEwI9nWjv55YuHKsQacyODcqqY
	cQ==
Received: (qmail 3159956 invoked from network); 10 Mar 2026 11:03:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 11:03:31 +0100
X-UD-Smtp-Session: l3s3148p1@cv2poahMaoogAwDPXzF+ANZpdrMKUeLI
Date: Tue, 10 Mar 2026 11:03:30 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
Message-ID: <aa_sckE7C3kwqYxb@shikoro>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-10-wsa+renesas@sang-engineering.com>
 <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_030337_006775_64FC1CFC 
X-CRM114-Status: UNSURE (   8.55  )
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

Hi ChenYu,

> >  bank_fail:
> >         clk_disable_unprepare(priv->ahb_clk);
> 
> Just a note, I see further code savings in using the clk and reset devm_
> helpers. I'll do this after this series is merged, as the context overlaps.

Yes, I saw this, too, but thought that this needs HW for proper testing.
Great that you are up for it!

Happy hacking,

   Wolfram


