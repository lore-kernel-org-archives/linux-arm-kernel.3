Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E44EFCD9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=; b=sm9Z5SWlnvRQnSWJeCl+0qTdcm
	n/UDQK5HvbseO7areeIsl85H8LLTgTyFm/2WCdMuiuVUsjylQa4mWUkbsvm94Z4a4HMdghJfwjdfJ
	6VTOYXbLQAcYQyGUiSb7HxBwcfJtAUp/WW8aYOthwl3EWkneKilKKvvi/4T9RgUNZJOsMq1SDJMTo
	kC0bU7AQPhM1A7k2qLBAo6rINOR3MWC1linQAjybRqhU48dpuLUbTBZVn7BFn3B8ZovyY5iG0F2/a
	LQ5b1RIJEu4PNoFidmVG6CvOGM1X+4QpTEnURl+v/kqLJPFJ18lAdxKY5Z01gaz7GdCOyW+KgKgIf
	7e4eckjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYRx-000000078lP-0tJX;
	Mon, 09 Mar 2026 11:07:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYRu-000000078k2-2Nmm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:06:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WBpq3773182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
	7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
	xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
	tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
	EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
	O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
	Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8hsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3f446ccfso82895115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054416; x=1773659216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=ZKjkRiZxrKd9rn1jccdDfTgDhzuP+U+AvSn1U/Pc7gyJgGkaXGGaJyfkDA5+RspVEa
         NYz8CTU89qEBhNAqZX5Brr5NN9obtLLKgLQ6ETIOmQ/ubpVNZl1JJJ9Tz/gDIomuB1YV
         +T696LCg3qd5Hjn/cca+uLSks3CqQKWe7rzl+S60W5bZU9G5UisVB/ub/8j7U27atXeB
         DlJeA2sI6JjDYgd8sUDJWnlq1iSG4J3t9CyPbPZrcuJVdFb7lHhjsnJW3LxyBc4LyqFC
         +UrwhKYkDXmesrtKndNsLi6udKTdW4qppeEgW7I6WakaKke3oOcG15zFOPjh3IW1cvSW
         Iv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054416; x=1773659216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=lw9/HmZivFMq0STYDu3DUK8N5ga1+Qc71Ld39JtVQBVSrWyB5TUDFZPh4KaseGwavk
         F1L96Yvki0QmrsVKzbRC5sl3AqO9vjIjhZBQ+37FJpC4L5mqHJ6jldel/4/oaeNv7Eid
         uDA9bFFBNO+OmoLiRiCG5Q6RYUOiAYZkAkLAwQhMobJRkF6u9BGwZljKZ2Ea5hD1D7Yw
         m5Jf1/D7q9rQldEtjQbvymF3RDclt+H13hKd0dWXTMscuKzSodzJUwfWxIMNEKETIVpK
         +E2dMAuoTJRrY2SNVKNQkF2j+H1ZWWbpSpNAN9qxNR9X39HPzJTTWXNXzxungMIHijaH
         AHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZe4wmQCzMctTbenT6gV4YSHS+male2EDXY8Jw/ZqaKVn7rWe9KB8UVn8tCOX9/qq6qg+cNzp0mFmkI8ucb3Dr@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQpSJp/6ofEdbnplKB9EUT2sEbIWupYPUUHZC4i/52dgYotIe
	/IbU8N4RqlaOSjiGofQ7T1HTKeB3L2ElU8y7GAfI7g4naPvhUb31mOx9IyVKcRa0UvG9FXcqKcj
	GifEBK90RHtAh1rLVeVIRORB7jOyK1e8NPirFY/BFuwBf/Y4cyzLDJ5UThP5q0lx1nQOSfS0qbT
	K/vw==
X-Gm-Gg: ATEYQzwY8l3z+2vt0cZjP6UqQyluuA1nHlwQeXTTbshffmSmWpDyLdKVwzNliGjPeIO
	Kfd1ujeAriE0zb3yTwKiZBAAhIPY6CbG1fTGcTAlhpcPa2KOYjroHLVKnX4DhHa3WCcXZ3iGaIc
	UYu0bOVvaDdmL+balESIhYh2ge2XwhzyKBsxdXHjkKjcwKWAYiOlwO+irJszo+QA4OWsXM4M1go
	6LUmDlkLwXUzzMJSB2tVTdDYsoC+ErHAlIiaeBgyccu19fFHhXrl2dNFnXVlUDMj6y3gRe+O6Gc
	M6Eae3nj61qQ4h6BOI/GLWTV+Ds54JxQSYaiqchbuBaIVtdY/GrzCaUXUt2s5WvGsiL0yeJTlv5
	jdmrFFm9Q7zvVnpW6BxXJBy6yFnWPqk8Hhqo=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443432a91.34.1773054415399;
        Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906;
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Proofpoint-GUID: 6QcyP9PLlBkEKPUixpZiEqDii4WAxkQz
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX+c+8dtUKWlKr
 gu9A210qbr0Aw8/ePT8v5mDKsp6dJIl1gBXLCJUP/R1QVYNyxQQnXKHDeV5AmEBuA9bKH+X2MuA
 +J9J2BUh5t7Qyq5agKtl49Igd1jr3hMzYkKCcxtbyEmCFi0Gz6Ug2q2tzbMlwOoDkJSTxtDHgIp
 7h+iV7o/oJks5trYjXzP59eQaSCKpwlzBzlg1V9MP5yC5WWWaWMW4oRSPF52F3b3PqBMfDC1VWD
 PEHTPCXKCBV9fM+ZID1a971q68qfAVb++3MZ2vKgcc+sihqWMzPrX76aG2x6PVgAJvitMlVgSYC
 9o+JdZA/TncTPQtaUp5l/17zes0W6jHc/F9j2F96l3Fgmn07sUt7m/Dty0/Q/vshNAoACYeQdBa
 rk6Bc+oD+3CFnoNTdVIGkzrFaDKSuoYdNvIIRQSjDquPFmAcdBKE65UbTyCZf3y1nl92q9DfFsG
 M2OymVeRuvlg5hrcOOQ==
X-Proofpoint-ORIG-GUID: 6QcyP9PLlBkEKPUixpZiEqDii4WAxkQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040658_755193_FCF19A8D 
X-CRM114-Status: GOOD (  20.46  )
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

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

