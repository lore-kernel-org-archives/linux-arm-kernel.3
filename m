Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BD6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJn0U2/tyMFIB/SctjyxEAKJkay78f83rJ0olwVtaYU=; b=Fdjuf69aoOj+dJ62tBpOfny7pO
	pLszdaCFCCrxNVBdif2MEHZSQ560V6a4/GYXvvjHoOoLKr7DvbzeHYVGn/n2X6leE3MiE00Zfc7G1
	CQ1dGF8IGvaTBSvXvw939XpYqEEef5dg6mSgg0upmT8e4ft3zxcNscPt64dltqJIibSW3K2Ntqg3k
	1VRkjzdfeW37+lzozaO+RzcgjTwYRRIzcxjknaB5CZ3TNsCOnaK8tnJomjPFvqgECaFdn4PFNY8UE
	jb5hfmk6nH/jRFVNK+NaRtAYO6tSwMIxTQK0UM0HuH8ufYvI2Kpo8eAHcnUdXd8xDKTIFQTgkUmWQ
	ioR4asQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo055-00000007XCX-1iDv;
	Mon, 18 Aug 2025 13:39:23 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unva5-00000006ytR-2QiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:51:06 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55FY6wKBz9sW0;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMU1reJG0jOi; Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55FY69pzz9sVx;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD3768B764;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id E2DQQggsZVWb; Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8617A8B763;
	Mon, 18 Aug 2025 10:18:25 +0200 (CEST)
Message-ID: <384e2b94-186f-436c-aa69-3cc41a38552c@csgroup.eu>
Date: Mon, 18 Aug 2025 10:18:25 +0200
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
 <20250814094502.4b350b3e@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250814094502.4b350b3e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015105_786095_29C1B7A5 
X-CRM114-Status: GOOD (  14.99  )
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



Le 14/08/2025 à 09:45, Herve Codina a écrit :
> On Tue, 12 Aug 2025 12:50:56 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> To reduce complexity of interrupt handling in following patch, ensure
>> audio channels are configured in the same order as timeslots on the
>> TDM bus. If we need a given ordering of audio sources in the audio
>> frame, it is possible to re-order codecs on the TDM bus, no need to
>> mix up timeslots in channels.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: New
>> ---
>>   sound/soc/fsl/fsl_qmc_audio.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
>> index 5614a8b909edf..0be29ccc1ff7b 100644
>> --- a/sound/soc/fsl/fsl_qmc_audio.c
>> +++ b/sound/soc/fsl/fsl_qmc_audio.c
>> @@ -791,12 +791,17 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   			       struct qmc_dai *qmc_dai,
>>   			       struct snd_soc_dai_driver *qmc_soc_dai_driver)
>>   {
>> +	struct qmc_chan_ts_info ts_info;
>>   	struct qmc_chan_info info;
>>   	unsigned long rx_fs_rate;
>>   	unsigned long tx_fs_rate;
>> +	int prev_last_rx_ts = 0;
>> +	int prev_last_tx_ts = 0;
>>   	unsigned int nb_tx_ts;
>>   	unsigned int nb_rx_ts;
>>   	unsigned int i;
>> +	int last_rx_ts;
>> +	int last_tx_ts;
>>   	int count;
>>   	u32 val;
>>   	int ret;
>> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>>   				return -EINVAL;
>>   			}
>>   		}
>> +
>> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
> 
> qmc_chan_get_ts_info() need a struct qmc_chan as first parameter
> 
> qmc_dai->qmc_chans[i].qmc_chan instead of qmc_dai->qmc_chans[i].
> 
> The use of qmc_dai->qmc_chans[i] without .qmc_chan have to be done on patch 4 (cleanup patch).

Fixed in v3

Thanks
Christophe

