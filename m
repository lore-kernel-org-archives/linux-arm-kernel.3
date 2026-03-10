Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AECEB105D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EccCEMf0BClf9WgBxxGVbqcdnKy6OTe6+h6jZ1JrlAE=; b=c40EtZv7fMR92KWQ7wEtCHwFbN
	A9kjho+VVijGUcBo6lSB1OHTAOQTQuMIY9HIVAPEkVaPCoVR7YOB24J7YNzX4Uuyt4Ztr3G7gq8PD
	ErJ9s2rDzJdG/3QqVkWs8xuEKYpKFbJNRUWc9RSuj8onKJfiJaYGNN9l8k2ugY1Rxrt2BKhRBr1v/
	ugKpHeZ0vHvqyCZtVs7O+8rNNdzPHMcixaFCE3eQfAdYLYwdQ929U8riDUNV5jgbVWejuK+JXyEnU
	nZ2CZsyLUala3qWn/RT3mUokpgUsZczyasP3h/q+OFqKBKpyTpgho1+q4Xyya12lh2xG8SCsse4uX
	DbfgcedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBJ-00000009hrz-27Vn;
	Tue, 10 Mar 2026 14:35:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBC-00000009hpD-3UTM;
	Tue, 10 Mar 2026 14:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153321;
	bh=cOpg0jR/3Sx6V3D8w1vaeE/sBGmLWSEYpvcwAwAecio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lT7yILeiGjYLq90Rwo8pzzbDpbWzVOqmh1x1xaE17LcbBh8LMa2CePqbgrntaRDjs
	 4H2olctCqZaF2dR/MowyYv2D8lErmXh0Hw+uuoHnXnGwttetXcS4FVJIuOqUkvn8qG
	 7aUB+ILold7Tdkso1leojqu0iGibzNntJ/hHY8MZfJGm+rmYlSdimZN+ayz7WwGnSR
	 Xh6MEkG9Zt4T5kA8LRPDxujGv3LhLmtUM8LBpgsBKV6yJKDhPfbrM48CSH9Q3AjZQu
	 ZC84p6FUxgR0AbClZU1/Aa923RrwV45a/PFfa0mVjJXP3rroIZmUWw+uZpWpfCVxXn
	 cPm3GcLlCjU7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AC6717E0D25;
	Tue, 10 Mar 2026 15:35:20 +0100 (CET)
Message-ID: <e4470843-3159-4751-ab69-df6b595d6c69@collabora.com>
Date: Tue, 10 Mar 2026 15:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
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
 linux-media@vger.kernel.org
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073527_102396_DA75E7FB 
X-CRM114-Status: UNSURE (   7.57  )
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
> mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
> pointer to const, so adjust this interface as well for increased code
> safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



