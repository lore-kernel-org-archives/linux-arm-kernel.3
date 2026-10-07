Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FE5CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=b367H1m0A94dzsX3bLrmKQLZju
	dvVBLBQDtXeHfG+0pu/QTO7Bcx/2N97QzfzW7vd8q7Vvfw0homvpEecksx/lBaDz8D0VNBFjcwmLh
	I7gPDjVjBzki95i77bGvNMKL39cvF3RotHRdF7lJSaY6PlJJrUFPRphW4KkgUYDlM81vFVkiTtOTP
	twskp3XNLMSYL/0MCUaZW/yohNnLmHfQA7PIKbtIe2Bq8dMqoSrgTnqKYWyVsIBAnpWkVPSBJbsn8
	/KFBGkFnaXSaGTcm9+APq8nEGuH8NdCGRqN3tnzJm6O9YehgvvStGqRipSzX62u62KwlG32eFQJ6C
	O48OGNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWCt-00000002wJI-3S9U;
	Wed, 07 Oct 2026 18:17:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWCr-00000002wIw-2oSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:17:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IB7e63239266
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 18:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8tuaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 18:17:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d62bb27a1so18169027eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397052; x=1792001852; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=ExuD43yR1nAo3oxyUXh/dprvNSH12RW7LkB80U5U3NNBdDBQYEArWtErjlNnpXMAoB
         r5AranmR7LhtUCTJziMHg1PPPIVurdQcjLlhIW78ErHo/tclbN1DN8lK6vO4Ho/9e9tG
         LENtT8w7UUEOUZf3S7bcYj/nk2qveO38k8CEO4bFA+MTj6OPwVI3qGtf7FR9eQdpKjRC
         QmYzu9oFh96FMjRzKeodUIXMKUW1WB+Ge0OorGoDX068iYkxE58LFVd2thbCThIzkUku
         6b6vcLFeMW/9vRTrHA8yjv2/f5DW91Cyp+RdlZE3Cv7wP9SalbEJ0nAr/6wssb3A/qnJ
         LZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397052; x=1792001852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=xEHZMKwlcIt3KYiLPOpW+bFn9duSHqXd/25QPDmHL6iMSgx2N7D3mQkdVs6oG7fwkx
         slAFq4+w5W2AXBoAf6RfXAXcnq+PD5Q+6CSx+W30Iz3geiMFcs/7JS/z+aBnKQV4EQZY
         a+CsCPW+fYeOxyYAi3jIyc3pKuc57DdSqt1FzDSxMHm5fyqqzcHimDT8jwbDmJX/fyb3
         1/y6vmADFWObiHPuD07eaFU6ntouViesaXYc35Ybn4+DnXG5rQuzlbdl+LKT7OWF/U5k
         rglm0GCfotzRtuqcMDqHvGqD5NSo+3IBqQQofIygZjqMlrCtQZjNQS6Atpp/YvSWHUSD
         0IFg==
X-Forwarded-Encrypted: i=1; AKwUvBw2wxhrMhqbWuK/OBQJjDc76ZRLThipbZTHzgRmOuRlLlHDySVarIQwptn672hePARE0QzsQcbyF8Pp2bg4a1hu@lists.infradead.org
X-Gm-Message-State: AFq9FYLYo8ucttwwJMF7vAW5BEcoT0abC+G9rHUpweaHdwNCFTM9FYjL
	Lj/DKqoTQEZ2iUf97O9hAjJb848YLR+IZXGZrXJ4+yCqc8XXUCZMVQJwT4RnEo55VCpL3hhc3LB
	YCZVIgyVKZqgJmx47VIVz3ZSDBNa9a2sFoEsKKFvKhgYXrJCD1Nt8OGxNNOW2b33sQ/AbOIhl+t
	prlQ==
X-Gm-Gg: AYBFou1bTf+fiJesVPVLzQb2MgCJOlcDk/MzkMn3ltgdHpFNqEwS3ZyMp7qMKg1nCI9
	gQPuzHOeJzv5GCdEciDrpkWzQIojaQSBdnnh+Ow6gDB1lk0gJBc9j8e3HECFPacnp5l+wm26Wyv
	JNo0uiBbv16zaJD1W8+wykeEsQBiOK38XHJvLWzDrftBPOkFA9kcSew+r9Qp1N7jjROQDsWybkm
	wQLafktfcD2GeDnEQHz5gBJ8o4iC2dl1mw2VxsHwCfA+5IyzA54+Lk890RxghQkcDgy/xbKsP1A
	WfIVdfKLEYIoMUJfmFCO3QfaDf23aDcLGn0Hb/gn942pkq4BK7TUSMAL62d8lWnwvdfpOcF04lX
	Nw6X+dGNURMkDvBaTYznHIE77cGbz
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958407eec.22.1791397052079;
        Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
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
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX054VwicDPjYA
 1naBsimJEPrYkp0OxrNO2ETh6GoyC8t3WaEHG4Nq/RSZHlXu7dCwYf5auHCupSAypUTDqW+PU2k
 RrPa/8EJFZJBPBZM7+/H85r/vIBvMp0=
X-Proofpoint-ORIG-GUID: 6_zmAQag0-5Z0mrue47fXSj3yrahx6Yi
X-Proofpoint-GUID: 6_zmAQag0-5Z0mrue47fXSj3yrahx6Yi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX5peVOWdrVtmI
 /YCtTK1QpAOq0vN9YSGA5590pLzUAcKs4NUcPOzuXfNHyd0I49xVv77atiGhQojLq0StLdw07UX
 CDcZhJFPT6pzNTttyxUX7rAEfPXG3ToLQqJfNxt9Uv/4VvYmBosmRHglLf+ocAo89WvbKFcZPuO
 yIRNz/gNMYzvLt2XdIp7dvzT4DF/Iepd//nB0aRdpvz9OJ9UcNtYEEawrpjluGFq4jXeIjm031i
 +6ClUuOaLb4sqg2KK8DI73MVv5/wT046CLbMUc7DzgeqCpt0Ff6k7zAT+Y0Pyo/sBfW/kEn2JDu
 /wPD748cyHVJvTziY1yNC2iE+b+ILnGQLSWhxwak9uhBw0oju/oUDj43Vy8yzmH107IKQRjLi7J
 frpj2L8BepMCyyvRqDppO+ArGe8s7LmVX0oNSkn4EftckdbQ1ngJqPnGENFu/cPSQ+gQq6Py6sI
 DXYLDkjcQ9mLWYGP77Q==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac68cbd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_111733_822670_E29858E4 
X-CRM114-Status: GOOD (  20.15  )
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
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;

