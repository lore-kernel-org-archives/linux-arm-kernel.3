Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7A9C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7HvCb71weYQ/NOoQNM3djQKtH6Nl3mKnKGj1C/6bO4=; b=wRk8imbe0QzfmplWqXSR8q+QOk
	yEkqifwQSyviAZkuk4vAMVReMUH6W4D9eOp/96nnMZNvYQB0S+W/oI7Ahdx9hkQwppSjwLFQXXsYA
	BhUbIIvkMi/d+c7lEcQ5abCrF4Cn3Hq5ImGqsdb3Hf4QUNpDCGQ1rM+pRgOTBuJVyP3vNTaoQIdXz
	mNkoq7EcnAIR9bR9nbvyBWVWEi0uwslVvHVMDVL6rzLIDFgABqavyiqUDjzQXGdL7b23Ov1XRTKlO
	MlXyhvzDcX4GM7CYq9bdyZWl67kpTcHGkEHYrYilSc5vduxvG0wuE2uyJKaNnwxSON8jXa/Xfn6Z0
	xombx9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c4b-0000000E4ee-3MIB;
	Thu, 10 Sep 2026 10:32:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c4a-0000000E4eS-2snn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:32:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7300D4364D;
	Thu, 10 Sep 2026 10:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF591F000FF;
	Thu, 10 Sep 2026 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036324;
	bh=C7HvCb71weYQ/NOoQNM3djQKtH6Nl3mKnKGj1C/6bO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZreZ4/NiTWZmQu+4xgSv3RsAlU2d+Iitt9d2uhSa1/bVELbT1LAxNMGoopKV7RdJ
	 GaT2JuTQXhxZgfhOU+qL5sTDVZDavLErtClLapXZytUiZdypqr4/r9Ru/s/CWdH8DH
	 QH9BWCrGZ2eZAXxMsGvNuRKRy+UE5ZFXOi1IgH+Ksqnhd3qWnn07Q5gs7h9zGS6ErC
	 4J2oCAhA8sy8M8s2zB0KZWwMnIp/y9LM3hxZNm+O+ZKdd8gWvuQwynoH7f7Bji5BTA
	 0c9VWIJ3JGCScEwzL7zyTJtyfmVdwAAXBTIQLN+7enBAFvzF0Tn3F8OU8QvhVhl+61
	 XytdHaYnGptzA==
Date: Thu, 10 Sep 2026 11:31:57 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 05/10] net: qlogic: fix typos in comments
Message-ID: <20260910103157.GX40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-6-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-6-hemanth.selam@gmail.com>
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

On Tue, Sep 08, 2026 at 10:55:57AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


