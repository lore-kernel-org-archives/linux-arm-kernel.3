Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4E6F30923
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETIvqL9lvf0sw7oQcZ6n+kIIlGROd+juMlH/vMKkU3E=; b=sQPG+Wx483aPzRV9I1ZTO5VXxW
	D9UQXHsobfgo1JOsR/8ITwqvpJ5OJ9NWYgoxxQx2MqnqUihu/At8rQle6FBP4x6ZvDSF+exNVFwC0
	X/OE2ZMOyscthMifx62eWqrmYQgB/Eo9Rd6Hxjbzu5lY/7+ZTYnQSo+lkJfCdcsMgA5rrTwKzZgPe
	l/FnmMaLY/ZxGAZZ6loE4FTx+kggMltud6OFbX+Mn4cR3uvW9QOVMQeBnkmlF1RPmocweUflX7VTd
	8BY1DE4S2e+BarFRXNBXdCy7GsStRZO1TzJH6Qgf8zlMOSljIKvIUs5ld2UzGZ1IFc1PIMHNCJryF
	z0sBv01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy50p-00000001Npj-0ule;
	Thu, 05 Mar 2026 09:28:55 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy50l-00000001Noi-2hbm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:28:54 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6720C24165;
	Thu,  5 Mar 2026 10:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1772702924;
	bh=ETIvqL9lvf0sw7oQcZ6n+kIIlGROd+juMlH/vMKkU3E=; h=From:To:Subject;
	b=lRcnDvSwPeltFghfnuL2un/gCumEOzScg/vZNmVraL8ygGuCjHheZ/KL7GAB/wpKq
	 7PsU+phXNYin88kUTgmsKf45xDu/rZQthoVoZFzqSFGwYl7z9PBj84kgBy9JgZgcFC
	 IbFats33QhC5siQDk5o1kl7/h4o8XiuWbxRuYvejk079uY5wMHL9UR+h1qclnzEX88
	 BVkaFLHlQQjzWHVWlL6nSMy7mP7AEQOnqmpJzH9s8oG6v6BcznOmQvN1jrVLGnN7NR
	 G9D3CBkbuSAhTJZ9xN6KJFFHG0k4sYPqEIPLCbQxDihO9myNizeSeBPDzsI6aZg0PA
	 k9Ldc0ZVAzIsA==
Date: Thu, 5 Mar 2026 10:28:39 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: ming.qian@oss.nxp.com, fra.schnyder@gmail.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com,
	peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: verisilicon: Fix kernel panic due to __initconst
 misuse
Message-ID: <20260305092839.GA24515@francesco-nb>
References: <20260305080354.639-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305080354.639-1-ming.qian@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012852_584060_4A6E260B 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, Mar 05, 2026 at 04:03:52PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> Use __initconst_or_module to keep the data available when built
> as a module while still allowing it to be freed when built-in.
> 
> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

In addition to what Marco asked ...

Reported-by: Franz Schnyder <fra.schnyder@gmail.com>
Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/



Francesco


