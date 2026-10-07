Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F56CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=; b=joQAWJR9my76WsHxGvNcTlobmG
	Dsc+MAZOsw0Q2hsn+cxTXuYZumxDE8ocey7++mnqvzA8avQyz5NUSgJa/BTjv7cYB2B91ImE/OpPS
	FIFV9NXDYbMlyCVeOeFDjJd+enSwc5jyfrYaMLlMmQXxFPQKWMqr7rOhroMQxTdv4IAf0Z2mdAZPh
	pA+imgsIIYciCfX9Hr0jOTZPPtk7xbuo++LRIYg1157fXZyL1uM4Yl09iDAdBOjetHPp/+tBiG1VT
	+AZOIxr9Pod0ABVvpFXS9Atp5MH3rNtvE922HTOCC+/CPA2AQ3eBtYFfcyPetOelRGYo8uYD3B4qa
	s6IVt/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEW0e-00000002vlx-1wOH;
	Wed, 07 Oct 2026 18:04:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEW0b-00000002vlC-1HNo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:04:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVlw3250300
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 18:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=; b=SzgIWJSPJjjem8nE
	cushvfrvkg22fkrce0c9vfE72gWIUGPdOIWJTPKKxKMcIBBucr2MxZxm1667OsHF
	YBbItPv71AJx0au1yTR3JPAyG4j2mb9aZ81plf0pCTVykpWFrE3dSqZ5MZl24vul
	JdPijzTq4P6H5i9a/RF9uo1nTnv2oB7/5CxbhZX5RdgHICjlY9MskRjks/Z/NPcI
	b4sIlrdd2kxVvPlJuw/FxTeOQ+bly1FuHRhTgaMT849TsCV5m0Ujd9erIi6Sb58B
	mfxvDzpFx5lHNnJb50slIBd6pV+23qGsBCHoKT9vMMqJ3Tp5YgCVh31nnEQz4hxE
	eTYXTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge1t6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 18:04:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso4181424a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791396291; x=1792001091; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=;
        b=OQwPE1Y0fjRawLivPWbuTuwrWrkQ0bcbQknkaI1ftpIZoZsuKxpb2LIcVVZqBGX3Ay
         jJNSNQXoNOKgfrjtgBTI7KXQyQw81rZRORfH1BBxqTTy0r9galeM3czD7pwu+sDOKuXR
         3ECzSo4W5lGVeiiSIueBpk7cZ9BeE38V7ctsJRMSBfQyAsfQkRYWgdPkwPNWhiHPkgig
         zPXi5JxIEq5Hfrh3NL+JpRO69YIyIN99rPvd+yPwC4J3bNvtHwxSrdqEhQNPph4sZKjn
         5rv+GpM67ofhzPCCVKwQkvIVv5j/LWRK9auOE0KjGtbVb6oAq/COoc/YofUrYdKp20/E
         ysZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396291; x=1792001091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=;
        b=vQXLwfLIOL6R7zc8BrK3rg2ImeDb+B5S+T2MLkk9RGAGg+CMnMkfLiw3KcK0wNnBfq
         0K6hzS0r5yuXYMR2R600kUHHYt+danjiFLPb5JlKUCT/CtZtvWnCA3Eut0483QI6dvU6
         TUxyZfbVY7ShO2Alm3prYXQbclNM8YzEJYjXQ+8yja6u32YOJ+t9rnBKAAj1xwU/Q8Hs
         VFW3T/U4F5vFMgRuSz5PybYVWZylvE+UAEA+1RAA+g8xg+aZmAACnEMvTPDbljROYB01
         +YTUVdHx7YnfgHy77P71fZXuQnvONDmB3tBWvLMWkdgeiAmWgKJDM5NrL43Lt8FZdOt4
         YJAg==
X-Forwarded-Encrypted: i=1; AKwUvByO+M1huk5xM3WJuCgpgII1OOnWOYTsw81Q6SoPYAsD0OM92l61ogmR4JGLpzNta8Ydvks/P3kRgIBJtBK+3vjQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJhVwtdXqD1roMgVsQ4skJJ+mX8OgDfHzn1vT8uOjprFPz5d7u7
	eTMM/ZRIcPJH9WgeafZxSaOSlwcKY9zuTlaxf5CDwMbzYpqssIuggJ6X2bcTBQnLksNMlMK6MAq
	oqSfMU4W98woo06yLGbPz9M2WGUGelD+TdgdAop6rxCz8Arl/vTH1ddnM90/LyekwhH+QhzuZVy
	zgRA==
X-Gm-Gg: AYBFou0gNeyqyn1OlwpNbLnW0Vy4S1nGkzyYuVzYEsNwTczUaOF5S3tlZRHdswKn+o7
	VgNhwmpCXphHHFSXy6W4c7i+qEaXDRKQpOaWfKyxe5mZbmJ95WnX0DLsXK01FPNvUR2ei2TXbDh
	NUnYLe6Ug4iaQZqYMXqgghaa/T/ebfxgq9KnE5OzbvY5JvzmOroFeLkHJlISeTHAfDD5MgrxYdj
	KwISMLY9tBnafEIFUJsP155ud5bOXYteAuC8JKLbTFekH0EzC8dzXnfRqooVwHZSjSnSCjbf+oH
	i8bYb8UcEWargZPGU60kJlOPEDlZ7+wjFMKrjNqlZSghmNYYbjub1+yt8f0Gow1aHZQxqEdgXYK
	3CQfGDbUpNe/FZUQQEU0i5HY+igtA
X-Received: by 2002:a17:90b:57ce:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a8a1c3ac39mr2378614a91.62.1791396291013;
        Wed, 07 Oct 2026 11:04:51 -0700 (PDT)
X-Received: by 2002:a17:90b:57ce:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a8a1c3ac39mr2378577a91.62.1791396290508;
        Wed, 07 Oct 2026 11:04:50 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a2508csm605492a91.3.2026.10.07.11.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:04:49 -0700 (PDT)
Message-ID: <a166844a-ba68-46b2-b37b-111ce54dbba3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:34:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
        Sasha Finkelstein <k@chaosmail.tech>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX6dMGOj8Ej5QL
 KDYopyUZCGExGbOPDKbqJNywP8w//ONFRIBiV3/UGSGDHL4qGJ9l8OTplBvJ7cW8NRyQRGwJF9r
 mvaso9Na+KnlZFXAZZ0rRlPLrWqWmaY=
X-Proofpoint-GUID: oBHeSYIV1NLUiIY4szZ2VN33fbJQ9-rs
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac689c4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NwbpVL58AAAA:8 a=dOLNmq4gAAAA:8 a=pGLkceISAAAA:8 a=291MuZCLWqhcjKYDPAcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=tNWvAHffTtQgx3ZTRG8Q:22 a=_m6CO-mWuQdSFutSHjXj:22
X-Proofpoint-ORIG-GUID: oBHeSYIV1NLUiIY4szZ2VN33fbJQ9-rs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX9b73WUrvKOBJ
 vFgjeo/rU6uHtlD610Dl7yFjOBVnuubF8373CQYnx79xZ6vxkdaD1u0ea/ODi1WGBdhtUY1S/+K
 t6pmyWOhiDPtrUMvu053IsIiu14kpWMcxXoi3Fs0Cg3cEXd71wyY8zO3j3LYc/GL7xuJ/FzwhZW
 VXkXXkXCPYWCnkOmAuzICKkzPlay4FwT/o5n4gUMBlaWF8GdQor7WEzLCgI26WeD/axyI3cfOOh
 /HLmCNyT3KHukBHH7ag6W088bwaXrtKb4ZgTCeIFMtNGHC5wIMTMu8N5xvvuX8uN6yiWy5jht0/
 EmImbN9/vip/i5a458TjKHyK5/ZasVVT44vuJM1yca9Ncv0KescQ9V52xK9M/8gKtMyAwXVIdPA
 i2b5rqPvGPPPBvDBIV3exGTyVuBOn9O3ux2jgzUff+IYYJ+eT7YKvMcE1iBLTL5vP3pM0qMwxI0
 njku5C0ZfulTMOiP7Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_110453_465491_945678C4 
X-CRM114-Status: GOOD (  24.50  )
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



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Apple Silicon Macs have a complex audio subsystem consisting
> of an I2S peripheral (MCA) and multiple codecs of various
> models and capabilities. Some machines have a basic mono
> speaker with hardware downmix, while others have a very
> intricate stereo system consisting of multiple codecs and
> drivers per L/R channel. Some machines report voice coil
> voltage and current information back to the SoC, and others
> do not. All machines have a headset jack.
> 
> Add an ASoC machine driver for this platform.
> 
> To express all of this sanely, we initialise the correct
> combinations of codecs/I2S ports as DAI backends and link
> them to a synthetic frontend. Each frontend is linked to
> a PCM, one for the headset codec and one for the speaker
> system on the target machine.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   sound/soc/apple/Kconfig    |   18 +
>   sound/soc/apple/Makefile   |    4 +
>   sound/soc/apple/macaudio.c | 1699 +++++++++++++++++++++++++
>   3 files changed, 1721 insertions(+)
> 

> +
> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +
> +	guard(mutex)(&ma->be_link_mutex);
> +

This is in the DAI link `.trigger` callback, but I don't see the
macaudio links being marked `.nonatomic = 1`.

The default PCM trigger path can run with the stream lock held and IRQs
disabled, so taking a normal mutex here can sleep in atomic context. If
this state really needs a sleeping lock, should the affected links be
marked nonatomic, or should the trigger path avoid the mutex?

> +	if (props->is_speakers && substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ma->bes_active |= BIT(rtd->dai_link->id);
> +			break;
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		case SNDRV_PCM_TRIGGER_STOP:
> +			ma->bes_active &= ~BIT(rtd->dai_link->id);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		schedule_work(&ma->lock_update_work);
> +	}
> +
> +	return 0;
> +}
> +

