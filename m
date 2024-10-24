Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5680BCE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2lOAHTJMbAfpdG52b5cMMGwQ3NG1lFZCVB6JxA/ROE=; b=QT5qWXtQD8L3bdGNkT1V66At59
	Rog8/Jq4wlI6Qqj/ppxFW8xBA6GxqbqZxC20H8tRbIQon4dcM9gjwl7KWSVR7OpmRJvbd5UfX3m/U
	KBDdLHhoyLYtei5fFOPa/5kQ/2P1YSH/lnRJN36obqG/f3/dxUuhScudOUNLOJhNtHTompKCVzuYb
	hgfYLvUyXSZNaoxiDZy11Q3WgWl4cuBaL/dAmrZhpmSwBQqH8CqJkuYGwu+BXxXP/G2vZTuFjiPm3
	2DDRVywtGCv67zN72kotTXdCBXzmFGo8BSu42IeXimiPOka1NDGFIenWKsdMCmfFaZFJTfF7n/X6t
	B+1HH2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNw-00000000FwS-0Aeo;
	Thu, 24 Oct 2024 11:52:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w85-00000000EGO-3Rsa;
	Thu, 24 Oct 2024 11:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729769748;
	bh=BLP2qSk59XHygRuGtwvvviZHLismYalYrgP+lhwiV8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jhv2OSwnszDSFGVPFqjILsZE1X2ReJHgp8WHeWdMv6Zsp6Ll1unmY9mgeJSKjxB9B
	 mEjNgsWWD0PT2cbTzMv0c3SSxNIpI8cXU9S6Oq/L8gALXkPeL+OU4O7rn4KmxyNJbr
	 dplZUqsXXvoPIdGhu/pBalDD5WIV5npfwPUGKyr15sjE+sg83nmft8tpN0i+7/39Vh
	 JEtm5uanLs3k5TyC1Habi76PiqfhLiP45fDsFlSBLCJoXV6dwWl1K31uuKqoYy30KK
	 qKKntmQnWevYFnGX9FJqETrcIs1gHtyOXUjSJPFs6o1Zc7mFlhlS1XFDx/nxPIbqxY
	 QVmqxnMDNBkuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8697417E35D1;
	Thu, 24 Oct 2024 13:35:47 +0200 (CEST)
Message-ID: <f21fd6bd-b3d5-48f3-8693-48668ee5036a@collabora.com>
Date: Thu, 24 Oct 2024 13:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: display: Set fwnode for aux bus devices
To: Saravana Kannan <saravanak@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241023191339.1491282-1-saravanak@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241023191339.1491282-1-saravanak@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043550_055512_80F8AE07 
X-CRM114-Status: UNSURE (   7.87  )
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

Il 23/10/24 21:13, Saravana Kannan ha scritto:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) with 1-0008
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvidia.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---

On MT8186, MT8192, MT8195 Chromebooks:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


