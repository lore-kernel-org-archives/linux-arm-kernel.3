Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F694C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNT2K+m2Kh9/ubJRwFMhjD+xp03X8faLotIucQNMpuY=; b=VGwaVahaf4DyICut+Q8qNt48Ym
	Kkan/zab3roBZH77KunjH4K3xcXEOtAc6mB01z9SfUJiiq+Yj1A+J3XSZhIDCCgn/lGV/JIGkNH1J
	EDVuxWeT4+PjqtMe6p6Su0VhF5emZEuR4740Z3+yaPhftIhQ99UeHfzzuVdaq/Frrf/u5TUxMhzw8
	5VDhxjQ1kt2YagtSN7HL3oXZ8CQBC1s790hARWpwBrgHYJ1m7pLnfPlExG3fbRZCcekohYLLcTAp8
	52tLZPAW3kb2P9jC6u50mxrBcpkMrxUSyA/K3c7hkUisHOXgns/yVm6/dawTcppqZhEVfFlbvNgdj
	K6ZV4Zaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX7i-0000000E9eS-0wjx;
	Fri, 21 Mar 2025 07:48:58 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWuZ-0000000E74k-0HYV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:35:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250321073516euoutp0168ac30ddd7ba30f971b52ae74816c124~uwS_xAjpe1920719207euoutp01U
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:35:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250321073516euoutp0168ac30ddd7ba30f971b52ae74816c124~uwS_xAjpe1920719207euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742542516;
	bh=RNT2K+m2Kh9/ubJRwFMhjD+xp03X8faLotIucQNMpuY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Wk2T5wi6fc8xAAP+Ppr/A09DLPnizHp67Vho323sdruyK2f2C9jAs2MVpgnbXVHOy
	 YzyqPghiW3uBrL2+F4NFNgPDGIakpovvtYE0eRP6YnYq2XezDWI28GzgznwX0dgKmd
	 EUkylQWz4DJWNluj1an7QeSulTSMU8A05VvPbsz0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250321073512eucas1p11fdbdc3bb672b6d124a475eca48b8a29~uwS6y3A103203332033eucas1p1M;
	Fri, 21 Mar 2025 07:35:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 20.C5.20821.0B61DD76; Fri, 21
	Mar 2025 07:35:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250321073511eucas1p11f3d9353bf52d6b9649cef6ebcd9d158~uwS6VJS080774107741eucas1p1J;
	Fri, 21 Mar 2025 07:35:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250321073511eusmtrp2efd006670188e1b672aafd657dd59bcc~uwS6T9Ob80551005510eusmtrp2J;
	Fri, 21 Mar 2025 07:35:11 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-54-67dd16b0f438
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 6A.D4.19920.FA61DD76; Fri, 21
	Mar 2025 07:35:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250321073510eusmtip2a2a7ebc40cc109cc0d2489a526313c41~uwS5bWPkf0030000300eusmtip22;
	Fri, 21 Mar 2025 07:35:10 +0000 (GMT)
Message-ID: <33f85cd5-8387-4358-b2d4-29f8877a7e2e@samsung.com>
Date: Fri, 21 Mar 2025 08:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] media: s5p-mfc: Support for handling
 RET_ENC_BUFFER_FULL interrupt
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
	gost.dev@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250305055308.111300-2-aakarsh.jain@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djPc7obxO6mG7TNY7V4umMmq8X9xZ9Z
	LA5t3spucfPATiaLizPvslj0vXjIbLHp8TVWi8u75rBZ9GzYymox4/w+Jotlm/4wWSza+oXd
	gcdj8Z6XTB6bVnWyedy5tofNY/OSeo++LasYPT5vkvM49fUzewB7FJdNSmpOZllqkb5dAldG
	z8KXrAUNihX9Wx6wNjB+l+5i5OSQEDCRODFtFnMXIxeHkMAKRokdL06yQzhfGCVuTZzEBOF8
	ZpQ4cu4qK0zLrzUvmEFsIYHljBJt+4ogij4ySsx4dosJJMErYCdxccNBFhCbRUBV4sTn38wQ
	cUGJkzOfgMVFBeQl7t+aAbSOg0NYIEbi6aQkkDkiAhMYJa5/PMUC4jAL3GWUmLXoOdhmZgFx
	iVtP5oMtYBMwlOh628UGYnMK2EvcfDOLHaJGXmL72zlgD0kITOeUmNByhB3ibBeJxe0tULaw
	xKvjW6BsGYn/O+czQTS0M0os+H0fygG6o+H5LUaIKmuJO+d+sYHcyiygKbF+lz5E2FGi6c8n
	VpCwhACfxI23ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xinsCoNAspXGYheXMWkndm
	IexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzCVnf53/NMOxrmvPuodYmTiYDzE
	KMHBrCTCK9JxO12INyWxsiq1KD++qDQntfgQozQHi5I476L9relCAumJJanZqakFqUUwWSYO
	TqkGpowJhU7rTaL4DVOP68gsXaw9+ehDp7Za1rISs0Vn2KY0LJOfJyucdXnCQuOmjstmP9Zo
	/v96P/f4VB6Tp18Ez9r6rZPdHbWsvdPez6bi9nLW1KNCpyNmec1fyaidtXHGJ23HdaXenlcm
	7/GPM2JLDK3WmZV+S+vASVXjHdnvNDIypdMnb16zwv9E+z3lkobdcfPKZG0NnrvtehCvlHTh
	SKDJDvklfFdZ4vYlVbcLbV915Pm0JT6chY5Ou61/JLftOfpVr/BP65RLP62uqSSpqjXontiy
	nfOV4K3ofPmWq7deXpr99lHA6pxbKckFDv3W37jt9ZKEog93nvz/0W7KKdPq3yufrT0udvuW
	a0rhNiWW4oxEQy3mouJEABAoJ5/UAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7rrxe6mG5x5rGjxdMdMVov7iz+z
	WBzavJXd4uaBnUwWF2feZbHoe/GQ2WLT42usFpd3zWGz6NmwldVixvl9TBbLNv1hsli09Qu7
	A4/H4j0vmTw2repk87hzbQ+bx+Yl9R59W1YxenzeJOdx6utn9gD2KD2bovzSklSFjPziElul
	aEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MnoUvWQsaFCv6tzxgbWD8Lt3F
	yMkhIWAi8WvNC+YuRi4OIYGljBIvV7UyQyRkJE5Oa2CFsIUl/lzrYoMoes8o0fryCxNIglfA
	TuLihoMsIDaLgKrEic+/mSHighInZz4Bi4sKyEvcvzWDvYuRg0NYIEbi6aQkkDkiAhMYJU6/
	m8EIUsMscJdR4l+vL8SC44wSz+/+Z4VIiEvcejIfbBmbgKFE11uQKzg5OAXsJW6+mcUOUWMm
	0bW1C2qQvMT2t3OYJzAKzUJyxywko2YhaZmFpGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT8
	3E2MwNjdduzn5h2M81591DvEyMTBeIhRgoNZSYRXpON2uhBvSmJlVWpRfnxRaU5q8SFGU2Bg
	TGSWEk3OByaPvJJ4QzMDU0MTM0sDU0szYyVxXrfL59OEBNITS1KzU1MLUotg+pg4OKUamNiv
	LP25JnSJYP7R2SXrryx+XLshUzBUQPJQf2Bxp++Mp28spsy10OjX1/lT+Tp3Aa99p0Du59jb
	nTzGfpfPXEzyDC69v+D7nc7wEOG/rznPCpXW+1/lOdQ9h9vPYPpMG36nFqttPInaJ1je6dpk
	P/j7oKrYTL0m+U/Tywuf36xXn1i8JO3T9msVb0MXfhNmlkvy0A/dJv6i55eUXPGH4hnX5h7a
	feJTBZtx2t+X4SeeLHYXYQ36urXp2ZW29QFdx77Lf5Aw+hg2eXPwFnMjaf5JK+W9jmv+ejIt
	m3kHR8Kt2V2GfYwWLzdt+D3pm8e3mQ+0fyV9u5kXnvskcb1yzJR3u7w3OLz7nWtbk3Y48qsS
	S3FGoqEWc1FxIgCkdWUJZgMAAA==
X-CMS-MailID: 20250321073511eucas1p11f3d9353bf52d6b9649cef6ebcd9d158
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250305055908epcas5p222e192cc21512ac178543445184a2519
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250305055908epcas5p222e192cc21512ac178543445184a2519
References: <20250305055308.111300-1-aakarsh.jain@samsung.com>
	<CGME20250305055908epcas5p222e192cc21512ac178543445184a2519@epcas5p2.samsung.com>
	<20250305055308.111300-2-aakarsh.jain@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_003525_271769_E9D04AFF 
X-CRM114-Status: GOOD (  19.25  )
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

On 05.03.2025 06:53, Aakarsh Jain wrote:
> When output encoded buffer size provided by userspace
> is insufficient with current encoding parameters, it
> leads to RET_ENC_BUFFER_FULL interrupt which was not
> handled in IRQ handler.
>
> On handling of RET_ENC_BUFFER_FULL interrupt leads to
> NAL_ABORT command from host to risc which in turn leads
> to RET_NAL_ABORT interrupt. On receiving RET_NAL_ABORT
> driver clears workbit and VB2 queues for cleaner closing
> of MFC instance.
>
> When user encounters "Call on DQBUF after unrecoverable
> error", userspace should close fd and restart with larger
> output encoder buffer size.
>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> changelog:
> v1->v2
> Patch link: https://patchwork.kernel.org/project/linux-media/patch/20250228065952.14375-1-aakarsh.jain@samsung.com/
> Fixed build errors reported by Media CI robot.
>   .../media/platform/samsung/s5p-mfc/regs-mfc-v6.h   |  1 +
>   drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   | 14 ++++++++++++++
>   .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  1 +
>   .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |  5 +++++
>   4 files changed, 21 insertions(+)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
> index fa49fe580e1a..075a58b50b8c 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
> +++ b/drivers/media/platform/samsung/s5p-mfc/regs-mfc-v6.h
> @@ -45,6 +45,7 @@
>   #define S5P_FIMV_H2R_CMD_WAKEUP_V6		8
>   #define S5P_FIMV_CH_LAST_FRAME_V6		9
>   #define S5P_FIMV_H2R_CMD_FLUSH_V6		10
> +#define S5P_FIMV_H2R_CMD_NAL_ABORT_V6		11
>   /* RMVME: REALLOC used? */
>   #define S5P_FIMV_CH_FRAME_START_REALLOC_V6	5
>   
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> index 5f80931f056d..e764cab2485c 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> @@ -739,6 +739,20 @@ static irqreturn_t s5p_mfc_irq(int irq, void *priv)
>   		ctx->state = MFCINST_RUNNING;
>   		goto irq_cleanup_hw;
>   
> +	case S5P_MFC_R2H_CMD_ENC_BUFFER_FUL_RET:
> +		ctx->state = MFCINST_NAL_ABORT;
> +		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
> +		set_work_bit(ctx);
> +		WARN_ON(test_and_clear_bit(0, &dev->hw_lock) == 0);
> +		s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
> +		break;
> +
> +	case S5P_MFC_R2H_CMD_NAL_ABORT_RET:
> +		ctx->state = MFCINST_ERROR;
> +		s5p_mfc_cleanup_queue(&ctx->dst_queue, &ctx->vq_dst);
> +		s5p_mfc_cleanup_queue(&ctx->src_queue, &ctx->vq_src);
> +		goto irq_cleanup_hw;
> +
>   	default:
>   		mfc_debug(2, "Unknown int reason\n");
>   		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
> index 3cc2a4f5c40a..86c316c1ff8f 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
> @@ -141,6 +141,7 @@ enum s5p_mfc_inst_state {
>   	MFCINST_RES_CHANGE_INIT,
>   	MFCINST_RES_CHANGE_FLUSH,
>   	MFCINST_RES_CHANGE_END,
> +	MFCINST_NAL_ABORT,
>   };
>   
>   /*
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> index 4cf12f33d706..356adfddcfcf 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> @@ -2229,6 +2229,11 @@ static void s5p_mfc_try_run_v6(struct s5p_mfc_dev *dev)
>   		case MFCINST_HEAD_PRODUCED:
>   			ret = s5p_mfc_run_init_enc_buffers(ctx);
>   			break;
> +		case MFCINST_NAL_ABORT:
> +			mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
> +			s5p_mfc_hw_call(dev->mfc_cmds, cmd_host2risc,
> +					dev, S5P_FIMV_H2R_CMD_NAL_ABORT_V6, NULL);
> +			break;
>   		default:
>   			ret = -EAGAIN;
>   		}

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


