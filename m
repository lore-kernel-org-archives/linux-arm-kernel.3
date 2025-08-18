Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C586FCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKSZMsHxGJpaN9hFkYvVgxYMHGqP3GyUhVJIQ8h1HsM=; b=DKy70+hlz2Y0NIhdfSO475SR2c
	4J5pyT0fCnq4DyFG14hWQdRtTyTWLY3/tXVNV+oi5srjFPGgRWHz2RaylG0AsJe5C19iELzmkKgrA
	pHyEtPyzIXm18CiLpCW9ISLdFv/Wr8XQyneb5botiER2mOV559BFDA11MYg0gLAq8kyeLrF22q402
	DPvNfXCOAqTuK2xNd/4NfVkzKBVURPjXldbpFMtkVMMUtCXdFy8+ptr+eEb12fCSCh2ajnNCox3lo
	sBNb9jnzAQ+71sZt/+I+/ybJaiApY9LDkwIVE9wonovHzdjFyy/ii6JczDX/pxrqS5AvN+S+gNXsL
	bKfVqzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo057-00000007XGb-3l5j;
	Mon, 18 Aug 2025 13:39:25 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unva8-00000006ytr-3QY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:51:10 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55Fx3PBzz9sW3;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vnj3VDrR4Hnq; Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55Fx2gYYz9sW1;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 465088B764;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uRYqQBvN43Yy; Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 137DE8B763;
	Mon, 18 Aug 2025 10:18:45 +0200 (CEST)
Message-ID: <aacc97c0-2cc6-4192-9b19-5234ccd93504@csgroup.eu>
Date: Mon, 18 Aug 2025 10:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
 <20250813120657.1e93b16b@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250813120657.1e93b16b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015109_018941_8C4B8B45 
X-CRM114-Status: UNSURE (   9.95  )
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



Le 13/08/2025 à 12:06, Herve Codina a écrit :
> Hi Christophe,
> 
> On Tue, 12 Aug 2025 12:50:56 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> ...
> 
>> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   				return -EINVAL;
>>   			}
>>   		}
>> +
>> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
>> +		if (ret) {
>> +			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
>> +				qmc_dai->id, i, ret);
>> +			return ret;
>> +		}
>> +
>> +		last_rx_ts = fls64(ts_info.rx_ts_mask);
>> +		last_tx_ts = fls64(ts_info.rx_ts_mask);
>                                                
> tx_ts_mask instead of rx_ts_mask for last_tx_ts.
> 

Fixed in v3

Thanks
Christophe

