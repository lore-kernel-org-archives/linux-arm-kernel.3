Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC550CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV7W6LrhYM2f30MQwJLV6EL+8pVprCYzcmtamqwzgX0=; b=SGkASbNwLIzSgVUL/uYJsN3v7Q
	hUgMJLk+TXFaD/HVRnGxTCtKszfvsysuxXtwgGy1gBX9K192MMS5kqcXMocD1y0Xj4pDRZ3PNwbeX
	0BwQO23OH4HuQ5t1RGidF9WKlkPWbSzgoniDzEWAQq8MRqetQXb+qbgayGtHQuQjKnMeCf5qyfm6r
	4WWAGXJJu95kca0OOGWL1H+5upKCDVfGuVqJIUSZdPMlxL3cVngkvDjicz45JIHiyqQipeyv7p0LI
	CzLWNMayuTjqPv1x/cdMqxX3W2z0fa9Pqz1+ozT7+2bq9PYfUcPn3USh2G1PTWRWaI7JJFECpSh5X
	2rQ0mqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqlR-0000000BCWb-1VuY;
	Wed, 17 Sep 2025 11:55:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqlP-0000000BCUi-0NAT;
	Wed, 17 Sep 2025 11:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758110152;
	bh=DmgiD4DEdrbQnNYGlnmAnbNpRT8lQoVsqzh1+ujAqaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJ7Oc3+QEPhXBokQuv4YarUEQ2kkHTmOxbTbYeYB3IXrpK/llD0H0Pc4bjcPjeWuY
	 lvsrZ1OLINCOiQVOn5xW3rtmyjqmX+V1SE3qq9OoZKx7TGw4KnYAX7MfvWKrJULRwe
	 gIusMp4O6ezKqvEe0f5UFrUV71okOLgZXn8JHQ/OITzHj6iTZpQfdtxCnbDpDM3PN9
	 lZoN0ZXCyGdaJTCrvu3HFfKTOjgXcxeGJJKJos7gRFV+yahs+byA5fJxeyFo2VGQaN
	 CAM7DqjV9u5eE1L3h1Q8AKdRCd6FU+GOU8enAD4xyb8QOwL1nqvXU6mn1Qan4btO/Z
	 qSOCBnfjtv/uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3382F17E0DC2;
	Wed, 17 Sep 2025 13:55:52 +0200 (CEST)
Message-ID: <2bfaa40f-6391-4fdb-8fa5-1cb783c58616@collabora.com>
Date: Wed, 17 Sep 2025 13:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: Fix a reference leak in
 mtk_vcodec_fw_vpu_init()
To: Haoxiang Li <haoxiang_li2024@163.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, hverkuil@kernel.org, tzungbi@kernel.org,
 jiasheng@iscas.ac.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20250915120938.177691-1-haoxiang_li2024@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915120938.177691-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045555_275779_DA93304C 
X-CRM114-Status: UNSURE (   7.29  )
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

Il 15/09/25 14:09, Haoxiang Li ha scritto:
> vpu_get_plat_device() increases the reference count of the returned
> platform device. However, when devm_kzalloc() fails, the reference
> is not released, causing a reference leak.
> 
> Fix this by calling put_device() on fw_pdev->dev before returning
> on the error path.
> 
> Fixes: e25a89f743b1 ("media: mtk-vcodec: potential dereference of null pointer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



