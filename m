Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE9DEB1061
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbjNeoBYYh1/4lEscILGgIxgQ4FqoZIve4WteSmd/GM=; b=1nEmdVoXBACtIOYui3RCxGuWTu
	X4yrIKwgXBwSOEdUhMeUGuTssbNAtS9dZXDe8+c794tEDU0e/VB7edYSJ8nYEqWG5PqoEPxFrbx+/
	ew4gWhJ+V+orEKcOm6GzlXz4qbnyBNRhMZ6cUsXt885qVIsJgG3Dk69RSHOdclpwRbqz0w3/B1Q8F
	KkcvP/lpk5Ftl4ayrBxP9FxCGZbp8E3KxpDbGczb4Vk13TS4hQFFl/FjCa0j/UgrEEasiOz7/ZPMp
	7WDyJMkG9BqelFuavRJprrycZCS1/tiGkSkSYes7NElb/oa3LGTJF0SDbpvHwZcTu6sunqfSX3ONR
	MlGWSHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBK-00000009htY-2gXP;
	Tue, 10 Mar 2026 14:35:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBF-00000009hq2-0oMz;
	Tue, 10 Mar 2026 14:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153326;
	bh=I3ivQi2ChJ94YeNeg1ow1Xv3TT7FwdrmIrvkpNkfC4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PVHIwtzmzXzCCi+0ShIUUqVRfuyZnQDUT4mlXtHUC3YwM0ciw4/ovJBRkfHug4I1V
	 RqVMdwXAJWIaSbA4lLyoW88/2N3Qd3D8bXjY9XDjXuE+p9cVXUt7rmIkVhuZK9ZqtX
	 Gf6rN/uMT7+3wCyo46YVd+8msYbtf8NYCT8JHbIKzENuq2Ft/s/SHZx1b+rBotaUXf
	 UVZZHWBZQFOufQpujrjlTaVHDBzHKUAtROfM6m/8JN5zmxUkDg3gHyHGmKKwgHUK8t
	 VfXyKOIpcZknSAn0g+eh/gXctMV3ETGdZgMzs9KdFTRNSnQ8WY0DXV2axp8cINSV4h
	 3P3dmF9XzmXMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0ACE17E13C1;
	Tue, 10 Mar 2026 15:35:25 +0100 (CET)
Message-ID: <6c2c9803-1210-412a-b391-660735e1d5fa@collabora.com>
Date: Tue, 10 Mar 2026 15:35:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073529_432076_1053241E 
X-CRM114-Status: UNSURE (   7.54  )
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

Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
> scp_ipi_send() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Please fix the commit title - that should be `remoteproc: mtk_scp_ipi: .....`

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


