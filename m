Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2380C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgX9Aci2OKy/LHgxiHnopthswLGl49EW6vrJhQF5Sd4=; b=Gq3/fnrjiaGZ69lWB98fPaRNP2
	Jsy+MJOxorZcqNPSgvQ9YD9i3gYp1JRcMZRnaFLeK8R+nyAFgLa3JknvocAP3HUft6FJ924sBPl9p
	qF+dcDhwNe6/17W3K3+f4jKWbbXXps7WPz986QNU4n2W/Fp1Eo+tdPWHOeva1lAPM7OWM6RbVRZ86
	jPtIKxZpQhZgCUXFoFcTU9oP7nlZNDSq/LRwKpqt4l5CWylQ0yqYWTIb+x16TOXUceTeGCWM+syAo
	UNdc3zlZieeY4p+j17tCWlJ8jDfT9+sJ2VKhtt77Ls+zm4bPXyQ+XAc2cwbDOIx8YlLgwEGTFaQcT
	JzwASZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5EN-0000000111p-1eJi;
	Thu, 22 May 2025 12:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5BB-000000010Pw-3c0L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 12:37:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7Vdbr031702
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RgX9Aci2OKy/LHgxiHnopths
	wLGl49EW6vrJhQF5Sd4=; b=puIi8/YXySjnaRhqdPF6arFGXrN64CFKlgec9+hh
	yazluQo/TWc0lbpIj5odU7MUowdsNeEbFfK5csRrlO3C0EEFxId7eNo2CawsvJnZ
	PTIOa8jzHsTkAenPYyRBUnBPsa7pvvNLyvf7T6hWxZCFzVqh/eKEEgepS0VGDcna
	G8U2mZR0m3OYEZFrFk78u0L+N7rS1Jpb6elMICfZ1AdRzNVMlKr5tA9RT+E4VNtX
	Srz+XlZbxjppxFXyMzBSpx029AEjLf5t/3+r1XP/SXtTmp2gjk84m6fTsazCuRMt
	Y5npPMV2il3EgMdInXJaV/+Yz9ulQ52+xwmoyVDXNrZcEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c24wpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:37:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c82c6d72so1407629985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 05:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917464; x=1748522264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgX9Aci2OKy/LHgxiHnopthswLGl49EW6vrJhQF5Sd4=;
        b=k88SU59Ye6KUd9GewWhgVBeSy5B4xLraWaq9V+dD/DuJBCCC4vglCV9QiiHMBj1LyV
         ABgtb/pvZEAw3xxpqGD2yJodn/gTUG9BIssMnrx1xKIKdca52vL6GYE/aKpzaTFlD824
         hDm2FiwdGwqYA/pQ9wvevXtwBIPGe+bOnDATn2zJ68Ou6UzX4ug2UI8s64LWN59+tk4K
         UchKkYTeirtHINXDGeMsBsvs/NnEl8UrLAtPM+3ftG3QLk3t/uid/NK2OybA0e3XlMIE
         J8cyYnij5gIq4J94WCoIK0vcErG+W8QE7s6IW76xYDu3vEJJ6dOURyjytpNbzllUeCb2
         L7zA==
X-Forwarded-Encrypted: i=1; AJvYcCUczKbQwxUxxnJVKQBqr8UwF7JBGCK2ADzIoZ9QGo+vWhGhD6aV+DPKF6gx2VfBf09qrj66q1mnh+Z6bgO6a5hd@lists.infradead.org
X-Gm-Message-State: AOJu0YxVGToB6oXGdKWFAGJUmLnSu6PD/4oKZA4zN1M49WE1HW3Lt7qH
	gV/Wzcusy1KrfFs7zbASOYwypzbiyuRSySS2Y9d4DCnUA6w3frkg2OvTSgSgaG5Rcrf1RHEUSNo
	vt+pverN9VuLtjqQ4AYNMcUuFKzsiUsYvvvvb82CNf26AMyr9XwmJrrg4dbIU4iecLX22aNMq9V
	UfCA==
X-Gm-Gg: ASbGncu+z+9cY1EvCjjZt7Yhj/p1WME2Uhdu/gomZ7UHjlV2U5ccTEx4/X8mpQkxQha
	Flr2/feCu1zI59XGO84yaTQYzfQIXKPKuNYolaV9sddMfS+DFA+qjjcRujd+PC94CZj8O3fU4Gs
	u1IId7sqn1fO5d7woz5NCPuNE4scmDQuOByfvxneYQGKBazbi89kdEYGV7NnIl8FDZTYiQZKuJm
	sYXP9zQaybNzdUcjGroWJg54j8HBJTbsGxS3YoarR3QOdrShvr7l3vC0lmLBhKm8mKtDZ2URvd5
	LNks48MG1lUHy1lE4QaaBaYOudqiCdjaUhyxA5Yfn3zdnlmMebcODhaHTGHk3yahg9Qvv6Rly1g
	=
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460591485a.43.1747917463776;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuK9ZYaNS9i+Q5elNYnjF85wlG4E7W2PQcAkgZfLcHHNu2rPiTZal61BKORpuvgC6jlMqV/w==
X-Received: by 2002:a05:620a:4013:b0:7ca:f447:c676 with SMTP id af79cd13be357-7cd467a017dmr3460586985a.43.1747917463368;
        Thu, 22 May 2025 05:37:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702a289sm3392445e87.163.2025.05.22.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:37:42 -0700 (PDT)
Date: Thu, 22 May 2025 15:37:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <jp6lxxm3httbz7ygu7bj3xju4l7jnnhvbpaicb36ju4hyxpb2o@4lhl7xzif6qo>
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-7-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-7-aichao@kylinos.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNyBTYWx0ZWRfXyO3koNdIKt77
 a3zlODYH701/2rLQcH/uSTQD81jpg6250gaR+V9uS1nIfdHXu5KWHDG2qYtV0VBq2e/fOLiJxp3
 kdH8FcdrFYwO5ddRzDT1oCggu5NRPZvabv5biCpFVEQoqNcCL7DVu5zcDepj0q1okfAyluBp4JC
 bAfnsLz+0xie1RjdCgZE7XUJPlwfwFplupp3h624mbwuHg7lvAh4t7i1tUCkd+2IgvcBc6dEcIk
 QYAVawuIkSw9ovdCyalsgshxafem6/OmdlR5iex9rWgJHvA6+g4sQQCKjNO2MYNW3YoIaigsKib
 9o47slRZHMW5rSUg3LoqMMAsEL8RKTEKiaP47juvMfBkKC+J3zGlwIG4MkB3zVWci8fKBfpUu6n
 stbBhAg7wnibDQU7VprIAD7G27LRACLFYaIqdO7EQLoZojeDK/hg2rlp5cdew0tL9hjSXEfB
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f1a99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=rlxKSa1xbkCyiMC8iTsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: vM8GUW1GMWhoM5q51opfqkcKh22Yg4Eo
X-Proofpoint-GUID: vM8GUW1GMWhoM5q51opfqkcKh22Yg4Eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=961 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_053745_905044_B9550EA3 
X-CRM114-Status: GOOD (  24.53  )
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

On Thu, May 22, 2025 at 01:02:59PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

There are no calls to of_node_put() in the commit. So the commit message
is incorrect / not-applicable.

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..62f49fe46273 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
>  static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  					struct lpass_data *data)
>  {
> -	struct device_node *node;
>  	int ret, i, id;
>  
>  	/* Allow all channels by default for backwards compatibility */
> @@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
>  	}
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id < 0) {
>  			dev_err(dev, "valid dai id not found: %d\n", ret);
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index 7d9628cda875..64735f2adf8f 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_dai_component = {
>  static void of_q6afe_parse_dai_data(struct device *dev,
>  				    struct q6afe_dai_data *data)
>  {
> -	struct device_node *node;
>  	int ret;
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
>  		struct q6afe_dai_priv_data *priv;
>  		int id, i, num_lines;
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index a400c9a31fea..d7680dd3a3bb 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  {
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct snd_soc_pcm_stream empty_stream;
> -	struct device_node *node;
>  	int ret, id, dir, idx = 0;
>  
> -
>  	pdata->num_dais = of_get_child_count(dev->of_node);
>  	if (!pdata->num_dais) {
>  		dev_err(dev, "No dais found in DT\n");
> @@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
>  
>  	memset(&empty_stream, 0, sizeof(empty_stream));
>  
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node_scoped(dev->of_node, node) {
>  		ret = of_property_read_u32(node, "reg", &id);
>  		if (ret || id >= MAX_SESSIONS || id < 0) {
>  			dev_err(dev, "valid dai id not found:%d\n", ret);
> -- 
> 2.47.1
> 

-- 
With best wishes
Dmitry

