Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7131BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZtuCe30htdfcCmBwdBcSZaiWcGhynVaqesJgEdUFjE=; b=0OjcANKuFdQponoKl/bflz10s5
	FvvlQ8oVAQDKSjYCSHZfybeppm3Viyc6o4TeOL0qmBFWLJcWCvz4YabnliQHcKZokBRNgNlEGau24
	+Lz4yOiGoNFeV3nm7dsk8r0qINC91YJ2G9ZfCIJZ4PQ/jEWEJnkiRjxTSMufOS2hHeTvlun1Fb2qM
	E2wn9RkdA5IVFrziafoyQqY2YvYoJ+R7HgunW7gjH2jqD2hc6/JEccXbk6/f73JS+0A4VIInMen6f
	hCk30AYuEIWIXwnvNs8IP9RVXegw9wOHJ6QYSisy5RFJ0JClU/bZ9ZJpCgA6BEqcT9rmTginE00QZ
	BdjepUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKx7-00000005KrU-0qpw;
	Mon, 13 Jan 2025 13:58:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKrU-00000005JfA-1TcK;
	Mon, 13 Jan 2025 13:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736776330;
	bh=6Q+The925tuHPhvAnv5LO64YiMOqCKwEdkamakY5Z4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fYWXyz1Mttr7No6f5/eapSOII1atDaZhCQwSLp8jahAFulKcDtTjNavtN6YZ+/Ca1
	 T1FHLqcEMkWR2w6C56JijVzC4M7VrK8bL2qee37RAQ1x9jlDQfmX1Z0OJGwYodMWpx
	 Jb1wxHln6hZIfwywl/7pr7O2xOOnNrlY7RBvpHWSC2F1y8tUkrrjLtc/YXWpkEvq+O
	 kFE96yNAJWRxVS3YRzlFfbph70J5bPfxl7V1TCkNoQY7QHPvaQNK9N/rcXWPwrNIS5
	 RMSTEk/jYV1NGfQxAGOpvS3zatvhTNqgmLHFmwoXpSAPAdt3U6eQY6FrLt8IY06UMe
	 wdpAkgLQNqPTw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A7CE17E0DB7;
	Mon, 13 Jan 2025 14:52:09 +0100 (CET)
Message-ID: <30474eee-cb88-4250-838a-3969073e0e8d@collabora.com>
Date: Mon, 13 Jan 2025 14:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
To: Konrad Dybcio <konradybcio@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_055212_579378_BA857894 
X-CRM114-Status: UNSURE (   9.11  )
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

Il 13/01/25 14:02, Konrad Dybcio ha scritto:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On some platforms, like recent Qualcomm SoCs with multi-bus SPMI
> arbiters, controller->node must be assigned to the individual buses'
> subnodes, as the slave devices are children of these, like so:
> 
> arbiter@c400000
> 	spmi@c42d000
> 		pmic@0
> 
> 	spmi@c432000
> 		pmic@0
> 
> The commit referenced in Fixes changed that assignment, such that
> spmi_controller_alloc() always assumes the PMICs come directly under
> the arbiter node (which is true when there's only a single bus per
> controller).
> 
> Make controller->node specifiable to both benefit from Joe's refcount
> improvements and un-break the aforementioned platforms.
> 
> Fixes: 821b07853e32 ("spmi: hisi-spmi-controller: manage the OF node reference in device initialization and cleanup")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for spmi.c/.h, spmi-devres and for MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!

