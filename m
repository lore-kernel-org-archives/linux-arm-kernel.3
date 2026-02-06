Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B977EE6B56
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97VesbEH8XR91/gIJrfJrqaDUzCo+OCBznA8arwePuc=; b=LrPndp+eEMNota0VMnJKhJkYxl
	7/jFsfNvQkZsf/ZXorE7ILZ4uNx+aXkwQcjvZe0hK8E8MiZ8rrbzTdDrzsL/M2Ixjzcm7WVGdAsqk
	g9Q+iSYvXOSjAZ/C2zL++F35Aqo69hAXGc5yBpC4Su8Yj3lokMyfuQUMP0PXZWhoOoFviuqztPsNO
	dDYYschPya2zYcAMiz444h44Hk5UanbfgmSEpwup/fDvCI8K7IHXj6sEV3eJ5RV0H1R8hLdTGHrxR
	2WEzlOzw7Q0vf0n0bsngL/gFuKNy1o1k8RBRchXIUruwV0gBGYhGT7SKblXHHrLYk21Q1+rOj9S3X
	mwfyi/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRL-0000000Bng5-1Kh9;
	Fri, 06 Feb 2026 20:28:31 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSRH-0000000Bndy-3kY9;
	Fri, 06 Feb 2026 20:28:28 +0000
Received: from [192.168.2.104] (213.87.156.77) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 6 Feb 2026
 23:28:24 +0300
Message-ID: <a6d0fd86-a86f-4c8b-acbe-3c627889062b@auroraos.dev>
Date: Fri, 6 Feb 2026 23:28:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop: fix sloppy typing in
 vop_plane_atomic_update()
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-rockchip@lists.infradead.org>
CC: <linux-arm-kernel@lists.infradead.org>
References: <20260206202346.57633-1-s.shtylyov@auroraos.dev>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <20260206202346.57633-1-s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.156.77]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122827_937097_6E947999 
X-CRM114-Status: UNSURE (   7.05  )
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

On 2/6/26 11:23 PM, Sergey Shtylyov wrote:

> In vop_plane_atomic_update(), the variable offset is needlessly typed as
> *unsigned long* -- which is 32-bit type on the 32-bit arches and 64-bit
> type on the 64-bit arches. I highly doubt that this variable can exceed
> 4 GiB even on 64-bit arches, so let's redeclare it as *unsigned int*...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

   Oops, I did forget to add that the patch is against the drm-misc-next branch
of the drm/misc/kernel.git repo on gitlab.freedesktop.org.

MBR, Sergey

