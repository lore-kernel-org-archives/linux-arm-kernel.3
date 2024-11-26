Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49275D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyTowP7FrpiyNoiEzAeY0FXek7GvWqVCiEUN4/I5TxA=; b=zAOtI4x0ev0mZC/UN1v1iCKlku
	ju11wrztaBWJ0Io9iiRciNMeGaxAjVxbB6CmaUgsDekZqr3k8H1HQbAuoTXwGg28ni7Vp0q7JtwZv
	BtE9qWsBS5R67EYDRuSQ3IeiN5EqHVYRRh4ByaH8S1HlTB9GdfG/O/mwdUEmLgBI06wFmo5dQ9SiJ
	p9BOOgsleC5hpXRXTasIwqiugpPRgOj5l1YxNwWTvsk7bkvezorgr1t0ustXZx2L9grU/qUMRE32A
	NMXzLd3rYoQCWuVoNoIQE/OG63FLmqvWBAPwhYwC4HWF1Meksgv1Rl/blgSFM3TnVaU+nvgwL4QDO
	NWI5NP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsCY-0000000ADWT-2I7j;
	Tue, 26 Nov 2024 09:49:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs6n-0000000ACNF-1HPA;
	Tue, 26 Nov 2024 09:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732614227;
	bh=BiEwKuqmX4KhsPyzAc5KYyXSQ0Z0HZ4DaUDlKOGAzdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LaflbYGS+QTbiuEdpS9lFjQx2139EdfWctWT3G9HdCRfUvmJwSJKFImp8lxVA7qbv
	 +JyXBnI9vclkj7KCSt6SQ9a03QpBfhYyAka52AeERt1ERkua80v3tNuuzuwyNtE7wW
	 ea3RPmjl/hyO+7/snmnQRQbwPCt5eHtr7mk29vNC56reookqKTGyDFNBsBUitz0fPy
	 QXnX5wbahiuxXgsMuRWZ97MooWhJav0aYv8/BqnZdykH8zk500wC7OieUhi8vcpa4J
	 AEwh7WgA3xhuRsGz8n5p8PE/OJTVirzb+7E6PrgLPvZAUcpJ/LeOC50UcwIwAdhzSj
	 4K612s2YeOxew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D12317E35CF;
	Tue, 26 Nov 2024 10:43:46 +0100 (CET)
Message-ID: <018e7608-d9b6-47cb-9233-7733fd1647be@collabora.com>
Date: Tue, 26 Nov 2024 10:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] thermal/drivers/mediatek/lvts: Start sensor
 interrupts disabled
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-4-42e3c0528c6c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-4-42e3c0528c6c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_014349_509256_54798623 
X-CRM114-Status: UNSURE (   5.62  )
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

Il 25/11/24 22:20, Nícolas F. R. A. Prado ha scritto:
> Interrupts are enabled per sensor in lvts_update_irq_mask() as needed,
> there's no point in enabling all of them during initialization. Change
> the MONINT register initial value so all sensor interrupts start
> disabled.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

I definitely agree

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



