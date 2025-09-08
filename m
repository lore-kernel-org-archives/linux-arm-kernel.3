Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01330CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=; b=O3qNRO6DO+u6kEPpNPtN13+kt4
	dxyrQ2dGeGYbViOTquswwJi8x95fgEWl7/CIc8sSc+pYPvNudf+dIUH9T6XDGHLFtS4BLES+b/mTW
	eMc+uww/t2CsUReQvJWNFbiZnMTOWlC1EEcJXQtMj5I+wVLMf7gHz9wtlOxPoiVwk6y4edBcWGjcV
	6/45wxrjFT/7vW9sVxEUNUuccjPgT/XiD6/87A3Hn/t1oKnccGLtNUpLITaQC68xoC7Ypro7xu0Zv
	TJpYp8Px7kL700bP882DO2XQswWDs68PC69iTodIc063YBB0uNPcEDkYWxn+Mv1W+EGteyUzzEUgT
	dOTIAgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWYx-0000000FPCU-25Du;
	Mon, 08 Sep 2025 07:45:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWL6-0000000FJD1-0Qnq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:31:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LXB7h009229
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 07:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=; b=JFFQD70tlTc8jlEg
	Sp3k5BpgkCOlNEhcmzs1rMqNUgkU7gFyRJ8Qpc+hTkcHgR/s8aPJ5ALWtAnM8I1g
	Tm+o+itQedHkFdBZwRgyzfWXkOSYVV4G0ucrKG+ef/c4VM8l6c2QDguOGLcN7vd9
	gQmrmQikeTelRsrG4kx223zNtQTuiSF23r60nrFwMyKeNLEtF3nuVdLoq+ikYZ8f
	/uGnKw8F8SFoZbHAdqfsYfG6VFU74mkYwY3pagXRbGWDiJZn6UWeGYM2U+QlEGMF
	OZzF2Uxn/5cqwnULEl3lnPOqEoKkiOure5N36MSQVvUt/g+za4UB+4v6J8IITCY+
	xTWX/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0knp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 07:30:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f290579aso68164251cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316658; x=1757921458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=;
        b=Pf8T30KaUJpT1cZIjChzxkQP6vDQP922sQ3hvfrN9of546ASC93wTz/0Yl5r/ca0aa
         qoFsh43IfvEyJCShUuS3S6BR3YU1wQaYVJbIMy1YXzGpTbvASfVGpCGR5XaQVaWCyRF4
         FJqOilG8nnrvUv92fLw6c3eugUe2+QGIIYLqup+yUraonAOo8p+9UM0E6e5EZtQHhb8F
         5L4sauyLL+Gi8sdzdzr+CiLhFYOQUPcqugPvN03LnodXw2/Bt1YcdZNSjviwFJ7fx/SU
         qiUDtVI6JPZzZSVTuQuEjfV7833glOTpgpWR6CH+FmEPpCEmqAxgX/2GLJEBooPgZe9U
         hvZA==
X-Forwarded-Encrypted: i=1; AJvYcCVGGftPHTs9q6IS+vC1cZ3x32H35L/kWVXaew1Qdhrll5hIDc+1ow5BZ90Q+RAY1P5MMDutp4EsHoWXbwxcdg+w@lists.infradead.org
X-Gm-Message-State: AOJu0YysYvcZ5iQCg0hf+rP+m26KBjKvfhOrkcjEmtzlk8zDbCp86Lnn
	YWBZ1KKQ0ZFJ2DXKHuIqwjSUoYZOJ1m4CIYJyq9jg4oZgOF+5CF1ifylc3gofUJbVtgLUpyPa0D
	s1DrrOrdbUsyhGCgm8ZY/rR9s4muFy12cNJoy5CuGuTzfhmp/R8QsGztYPYWwOd64vfS40Y8fHp
	m9Wg==
X-Gm-Gg: ASbGncvJenvVIaseZ/c8jgsDKYZvt2SJ6Yr609G9eMzsnJhX0EXGURKDjPT9/eayQgm
	TDhw91SmLjAMClTFejD+z9vA/f/HF2k7BOyCKaDGx3FtcOI3rA7byxJUpHz4d6/zXZ5WWq4eSZM
	cSWYCzS3omTlod4J1yhFdYfPHBtjKdMF7mqDGE/Nd2ccaUgcqWEqX/HiFAYyN8pLRrcWgD7pCix
	RvThCRpi0rEuUF1NyjefuTwkecys1nEMfvdMtlKhyu3mdntRtwzkaQJoCrPAy/B0tc9DYdgb7PG
	62O6sR5IJxV9Bix4w0CKzvte3PJQ5XZT2wpbIOULFzWscQa2DiZa6hcrtIicogNn1Ws=
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83193941cf.41.1757316657510;
        Mon, 08 Sep 2025 00:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1JPR4PfJ/rf6grklM9vccNdBWfJgn6bV4FHqQByIM1t9B/i99IyFfm4pPOqnq+ZTAa+vitg==
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83193511cf.41.1757316656824;
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e748b38be9sm3039508f8f.47.2025.09.08.00.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Message-ID: <deebd6d5-0c59-45e7-a2da-4c2c1ff6ab48@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 08:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Baluta
 <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-team@android.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        Miller Liang <millerliang@google.com>
References: <20250905091301.2711705-1-verhaegen@google.com>
 <20250905091301.2711705-2-verhaegen@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905091301.2711705-2-verhaegen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ECgmxbXoZYEkuHEYVgzq9zacrhoy3lup
X-Proofpoint-GUID: ECgmxbXoZYEkuHEYVgzq9zacrhoy3lup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/DW9Hw0X1JAK
 mchIUVVHtI37LxFPkvueweM+JoRq43gSipiLpHNiVfduRAfqrCcmRf8gWBe6KpD+UZitifzveFM
 GhCiZzgJIobgVDqQgzzQWsjJh+w5/E7B8xmaXJJBkSTOdC146cPLqwIZsIy+4+bwR0GKZzox/Rq
 Y2IrzadmtMSVCnanh9UKivm0dunhkDumHbSyc9v8xmesMuvk5bCm2XuIo2cZYOdOfI2+NEwwi+D
 3Cq/VdZQYsBDWn9ntg0hefVPqULUuRtuNM12QNKMy6HeJY/2Efua4hL8BLPQamTQQyle3b0KP+H
 HaNBqDYKHanN7HewA3yqtZXLjdNfnctKV717HinT3fDotoK7868cUeAxMntZvdHZ6YcRWnUPUAL
 LEg42W+M
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be8632 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=4O46WkZMOCDH73qdsaoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_003100_270947_C42BE63E 
X-CRM114-Status: GOOD (  18.40  )
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



On 9/5/25 10:12 AM, Joris Verhaegen wrote:
> The copied_total field in struct snd_compr_tstamp is a 32-bit
> value that can overflow on long-running high-bitrate streams,
> leading to incorrect calculations for buffer availablility.
> 
> This patch adds a 64-bit safe timestamping mechanism.
> A new UAPI struct, snd_compr_tstamp64, is added which uses 64-bit
> types for byte counters. The relevant ops structures across the
> ASoC and core compress code are updated to use this new struct.
> ASoC drivers are updated to use u64 counters.
> 
> Internal timestamps being u64 now, a compatibility function is added
> to convert the 64-bit timestamp back to the 32-bit format for legacy
> ioctl callers.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/sound/compress_driver.h               |  2 +-
>  include/sound/soc-component.h                 |  4 +-
>  include/sound/soc-dai.h                       |  7 +--
>  include/uapi/sound/compress_offload.h         | 19 +++++++
>  sound/core/compress_offload.c                 | 52 +++++++++++++------
>  sound/soc/codecs/wm_adsp.c                    |  4 +-
>  sound/soc/codecs/wm_adsp.h                    |  2 +-
>  .../intel/atom/sst-mfld-platform-compress.c   | 12 +++--
>  sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
>  sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 ++--
>  sound/soc/intel/avs/probes.c                  |  2 +-
>  sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 ++++++----
>  sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 ++++++----for qcom parts

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

