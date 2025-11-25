Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5DBD0E6C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38eIWhaY5NLrA7BHTFTIsru6tCu9JxdlgVj7uaczlzc=; b=xWLyJ87G5/c2c0VyJ039SUiHyA
	Ljso8iYPoJ8mhqGpF67MHdVZfYoZVpkzTwyaUstvRWHafSaz4EKh419rrGr9ph1jvcsn1jpvZkAJw
	/Yj3kPycCLWMp17i+Y2+YSKWZEZ41MV74qtKS5W1g0vhkRi4EmLFAUsHTN699ovH2a36lZpWmnqO7
	ZZq9rSYrAF64Szvtk55p0ZM1UlUlsTcwtfkDMpy0/Kj+zr3LeZd0vVB+myvOxFLTNg5pWDehVsFiQ
	CuZwmLHy028bdImZuXV9R6CbkmVUS6x5fuww3uaAmdnVaEMP6zwBl+ue5qdIZ6aBax8hwzz4ZDuP+
	RyP3RgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrY8-0000000DF04-2JZJ;
	Tue, 25 Nov 2025 11:49:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNrY6-0000000DEzb-1XLI;
	Tue, 25 Nov 2025 11:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FA9C40706;
	Tue, 25 Nov 2025 11:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82664C4CEF1;
	Tue, 25 Nov 2025 11:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764071373;
	bh=kcfJPaV0RlJNuRv5orxjsEuIYQsBEO264pipegKAgKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrRKFlYdNjpuJAzVmv+xPBFxiA66JbJHRfceWAvEnfly2ci3y3+LUqgq7ypKZ3EBu
	 jCig9MZM3yIaUBXdD2UdwBQ+NXk4DQLPLPcSj7Zpz/ujmoxxNN0aoLYjvcXMfeqqDM
	 7JpcLbcGUGvGymYalc0d08j3Mz81qcwvyaIUpz2o=
Date: Tue, 25 Nov 2025 12:49:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Chaoyi Chen <kernel@airkyi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
Message-ID: <2025112554-uncaring-curator-642a@gregkh>
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSV_lQYJPxN7oBM-@kuha>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_034934_426347_F5F2F993 
X-CRM114-Status: UNSURE (   7.03  )
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

> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> +{
> +	if (is_typec_port(kobj_to_dev(kobj)->parent))

Why look at the parent?  Doesn't the device have a type that should show
this?

Otherwise, looks good to me.

thanks,

greg k-h

