Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07085CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgDQeEkPHec0jlCzUvh0VGkZKTsmLyZBDX0ve5fRHa4=; b=b4UQczPM0Q24m4qz87myctXQJo
	Q60p2BqwkTJXdFBqYFbcX9pO+/krxNaTusvgxkh3Vr1omL/rVaJgf5DmB4x/QU0kGCA1S9rrQ72no
	z74D7iNGNjlsOsU8DuM0Zbe9YXAJm+G+/3kFdZ4rqaL8lQUf1eUYBohO2GKccin0+9WdrWdhC4JCQ
	jtpQzvSy4wPzG+m3Fw8lEC+TMbxqD19vGOiDmIgxzS6w/T5aNWVLr2Zyo/z53qlTdaN26aoZAJRK1
	WFCT7kTNrw4j9Hnw+V21ebqcliSdu8qOn1XNZQ/3VieIl4vuJ4WH6fJ8us/wwxUs/HPNzTjM3ZbCH
	jrpr00Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml8-0000000Cj5X-2P9W;
	Mon, 20 Oct 2025 10:04:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmks-0000000CinR-2t0A;
	Mon, 20 Oct 2025 10:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954680;
	bh=LemVXctvae+74luWmuzpmpLlI7eUe5tI3CrLuksCccA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kU21S4tLVJoq2/DVWFB4W4qUPhpmUJj6xfUGAniqDZ8p+j1ZKl4uDfGuU6pU1DPxa
	 qkjIWZQeGS6KQmeSZcyI2/aOBzQs9ncrA5rXUQmik0EMQAGuylme1T/Q+jvyRiOSxd
	 dLJBNRurrOH8rUct14t8hzMm97GsfE46qQi67Sx8+ccpEMwKxgOMGqXdomEabFYAv0
	 /ESc4H4PIplRZ+kfSZ7Nm4olrLMkX7STVREMXRUYdphIowPQQuxa6G0wq158qVY9cO
	 oIyB7UmCf3TyVdVJIs/ck4D2Tvpl4rHD/I/t62ZCnl9QG4NrvzdEEbz7s5jenEWjV3
	 pgAeQ368TPxfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5242117E108C;
	Mon, 20 Oct 2025 12:04:39 +0200 (CEST)
Message-ID: <a44bf667-316b-4e20-81ce-41902d68ba1b@collabora.com>
Date: Mon, 20 Oct 2025 12:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/20] drm/mediatek:Use reg_write function pointer for
 subsys ID compatibility
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030442_879297_CE813311 
X-CRM114-Status: UNSURE (   6.15  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Switch to reg_write and reg_write_mask function pointers for register
> access, enabling compatibility with platforms regardless of subsys ID
> support.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



