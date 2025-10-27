Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DDCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JncXzot9W1gow8/tUDBTV3mAgpfqF8x82foGvNCR8u8=; b=kT9yZ/WIxT7dVhhFyNqGbGZV8+
	6y8ShcxeLSw6+gF/ubrFxLH2L9fDyPnHqynzKWpbA80L5NnInjjfR3Ozn7GX5G0A9mK/j94ELjETD
	dbH2KhIrOLqnI/CAjkKiP3gzUuzUmZsYa9NFvZHrChNlL0kV4Avb8gcF79ZLME/EGKjgq6IKNag4t
	KZWVwhi8b0t7yq6THLGO0e++Kt/gWXKSA2fRNdumVvE3UZ1II1zLrMo7G1XlIIycApUUKZ6ntFZbF
	Vi3TlZjKmmso7qJ2j+w3PL25Z5+lTZsiqKwHFNbQdWgIi4hn4Dk+0U6CrInEuKXEvIaltHk3H5O7/
	bdbl8niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMFP-0000000DsuA-3VSH;
	Mon, 27 Oct 2025 12:22:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMFM-0000000Dstc-3Dmb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:22:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R84pg22232279
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JncXzot9W1gow8/tUDBTV3mA
	gpfqF8x82foGvNCR8u8=; b=hQQFjcNu2DH5Lw59o1W3SMNAFQY0QXjO/ktVuC40
	hzC7YzQhGKGkCh1lCcdb/C/niKl0YCCv4pxGe/CTro0PzN3sR8SCaf+bRb1G1SzN
	q+VuVqXq66xW1wvCMEun5HJ81BTKuCA3TxV612EXGGbQdvrskchdpi2h51F/OUc0
	NSqKEbYWk4av6IrCCZHgQNu/VoFWqFXK3rMMy9vmJNTSf4zHBpVxvjY5YwkyfErW
	3Ps46xiotXAIzJnryRT7QeUNOyGxvZKYB+by7tQ7mfvn5y+2l69ZVBj3vtenKmSR
	dxdsKS6jQdPufQELxCcW3VKJ+HXMXz8y5LsPIIwe11cxCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8qem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 12:22:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a89c9750so141767581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567766; x=1762172566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JncXzot9W1gow8/tUDBTV3mAgpfqF8x82foGvNCR8u8=;
        b=atThJ7FO7szPE/d7lJc/mGMp9FGfqW2t2zCLoB4os5Ro4eEGptbdgkVpH/GSnd7CNx
         SzQO6uCVPZJqp6PwkyZ9UKoKNHgJhgh9zeGLWLVzpTp0z/DnnuDfue/+UJtTs6x+qTfb
         04SCsUmwd9hiVPG0yz5tSVHsi//fDy6BarbCAbAUeHGCljMqgCFHTiq5ypm3QVCWXBsp
         3Sh0BlOJV43ee++iP8ChO51EBdH/RA+XUZvA1U+ReFQ6ZNhjt/b+JjOCxsV9Lc9nRUVC
         2VbbIEyT0W31HIAlw/HIAIHOD264DG1RJgJhnsZHxdkWsV904gLtj4e7F+JoJt216k9M
         e8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGDT5A/d9B0WmmX+j3C1cDNgc4rZhg6Kl46sT/ncaGUUQFFS7IW8RBHvijpF81bp3xUE6bDutkUzKPIfusn3O1@lists.infradead.org
X-Gm-Message-State: AOJu0YxVHqkUUx07eODKpiJGYELvviIOWpVwnfu4S25Ksz33uAzJhheT
	gn6n5rJD6Q3yb8/Vv5sr5Fc6LYU32gbID1+6LU4/u2y6pgsdzdL4yTElWJGNHV5PKL+eZwLcJ1g
	RGD9o/s5sAMpinGw0pNxMlYs2C8zsUgyG0Rv30/cDE1JPGhnPJZtbjjuwViHkWPXwqlBszFMbZD
	Hv0w==
X-Gm-Gg: ASbGncvj3TW2mqU2I3/xjhCLLY86+By+5oT8laJBlvXu+U0Etw5Arbf/fWG0oQwLhH+
	YE+dYUoQZqXiStNlKRoXzpGMNZvgE2NWUcOZdQh/f5oAZy/cjYltOx0PpWeIWQtfhnhjO3NTw1P
	LmuhurjD68ATOsTjgBOqLwhr3Lukxbuosyxh04K1cs0e7y3ddvmxj/klDfQwzo5lctV6fETEorX
	6vKBB0k57anFx4KQZ4HJexIodneH7JA168NPO3dKGKLoB8FEqLe/pbqGiDi31rhoo4HJdaRC8bG
	ASoy5DvIP/G37eB1Z7NtgE1IoHGYmuLz0tkBmLNAqciJy8H4F2l7H6Sk4InxsHATyJsAUqkpu5s
	FCexGodhK1lzP1aTnGsYPZZTDWO5iHJB/Z75g3AUfDFYhFnzRSfTXt4caPmBZTnlOc+twU1jLxG
	8WCIZ+93tukQ7E
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id d75a77b69052e-4eb94922adcmr152955891cf.69.1761567766289;
        Mon, 27 Oct 2025 05:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH79d7Do90KoVZ1tYBoBY55fSIjzc3SaetN68K8JqBrkVyDzQwzXI4DnjU4YyJIchWS9APnNA==
X-Received: by 2002:a05:622a:353:b0:4e8:9f87:1f42 with SMTP id d75a77b69052e-4eb94922adcmr152954761cf.69.1761567765265;
        Mon, 27 Oct 2025 05:22:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0e0246sm19655221fa.49.2025.10.27.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:22:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Paul Barker <paul@pbarker.dev>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Alex Elder <elder@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Michael Nemanov <michael.nemanov@ti.com>,
        Kalle Valo <kvalo@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <g4ryfonkdpnsgqo4brx2dymo7o35jkndc5kkhdybhyvwo5rust@jwsivdbievvi>
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff6417 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=QXDDecBx9f-8Df5VMo8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Eit5BjpkvTgteGmVi7Q-J-xFcHmxdtNy
X-Proofpoint-ORIG-GUID: Eit5BjpkvTgteGmVi7Q-J-xFcHmxdtNy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNSBTYWx0ZWRfX4C/h6Wdl7d8n
 M+z2/roNrtAGLnr5EcO7/tYY4TGnS5i+HREQGyKSKcVjRw6zlDq460Ap1gXK5Tv1WU7FFhvmmcd
 YCn9S8UrjaeFWfyShtqEeljLRsXkONHJeN8Hk0Hh4KcKzEMbP73J+P1UcLUaRn6WarQTkZXe3kV
 e5P/QouCf/FaGqgq6GuRElAbk9V+EXP2YIOJp/dMb1BodBCZ3Um1HvXZsSgspCXLCd7ru/WH7VA
 VOwi64smavzfeGyvvMwxlyxJjSdFIT+XDvHx/RFIPRnYTc187blbycLEvDCDD6WPuYVltgdLMRq
 vAjz8FP7wMK4Xl6QnIZyDFhur/2Ibk7T9z8+Ku1K9zMN8npa0cYo4KVtWne7kUDrm143/bt2AOB
 LEZ4+Fhm/oppcwU1B2TlpJP8hRemyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_052248_936039_53710516 
X-CRM114-Status: GOOD (  15.27  )
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

On Mon, Oct 27, 2025 at 01:50:20PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/net/ipa/ipa_interrupt.c | 1 -
>  drivers/net/ipa/ipa_main.c      | 1 -
>  drivers/net/ipa/ipa_modem.c     | 4 ----
>  drivers/net/ipa/ipa_smp2p.c     | 2 --
>  drivers/net/ipa/ipa_uc.c        | 2 --
>  5 files changed, 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

