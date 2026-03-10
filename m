Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B7EB1054
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d806grPeQ8uBN9NDC8eu5sQU9snIGboano6I7hkTXxM=; b=qTbWKLHBmJ/4Od9VlrUY3Y3/rr
	ARy5FSO4UUyYrXqb7S2YFTAr+WdtgcCdGPutcYxZySUnoMt3dr0dABsSzgKH4paJxb2iTqa/qI+rZ
	Dhin4ehgYZA9CqpTk17pQPGCZ26O8yotxVfvlupkRI/cVJ+N+b9Ikkz5Gs1PoCwvCOwhizCWnL05t
	fXNCOuCO78NW5lJZrwYr4ywvBcPsVqnWcKPvP+Oc0X1VyO4HgNF8beXg7Knzrdh4gPjShVWczOxzm
	UFCF6Kg57TSuNLDVYqWrQkyqqa31Iu1OeCnM3MBQl7czJolov+p6qQzf9gHR3yO/iJmlMpaFFVmN1
	2ekMQDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBF-00000009hqR-3YcO;
	Tue, 10 Mar 2026 14:35:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyBC-00000009hpO-3V0Y;
	Tue, 10 Mar 2026 14:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153322;
	bh=MCaUrPZ7HH0j4tc8Pv0peQvEHxCMTJOGP8a7fiNrsJw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kioFQrk9hpQNl8vRItusxFTj3b+x03BuCXswwwB5fvv0EzbKu/tP2WQQFk2KFJQk9
	 J80TXeL8AHbz/7AUrSTZZPNAu4l+wO24Hey93re8DnweOihwLCQOPvEUlgifoFd9qd
	 Ae1bBGbOqfe+ghl8AZ3CpNpp5IhnJw0tCp72sXAurqtk6JJmbSYIoiDxE7sSJm9Qhe
	 1E2DB4mP5D4GAVKT0q/iDq6MdjUfn1tFI0o0BKUb9RQ656xSrDtHl2dQvBxBZ+7l2v
	 VFw3PepGSWsScTOha8D68l6Sivf4l61O9U+uAZ3Kw9pVNKaLXguZH9oEAHbN6W7lg+
	 LK74gVBrPhbBw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B509217E0EB0;
	Tue, 10 Mar 2026 15:35:21 +0100 (CET)
Message-ID: <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
Date: Tue, 10 Mar 2026 15:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
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
 <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_073527_102162_810FF07D 
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
> scp_send_ipi() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>



Please fix the commit title - that should be `remoteproc: mtk_scp: .....`

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


